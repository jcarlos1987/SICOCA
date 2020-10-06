Imports System.Data.OleDb

Public Class codebarcontrol
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~/areaemision/codebarcontrol.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAreg_tipo").ToString.Equals("SUP1") Then
                LBGuardar.Visible = True
            Else
                LBGuardar.Visible = False
            End If

        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If Not CType(sender, DropDownList).Items.Contains(New ListItem("TODOS", "%")) Then
            CType(sender, DropDownList).Items.Add(New ListItem("TODOS", "%"))
        End If
    End Sub

    Protected Sub LBExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExport.Click
        ExportToExcel("CodeBar" + Year(Now).ToString + Month(Now).ToString + Day(Now).ToString)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
        Dim responsePage As HttpResponse = Response
        Dim sw As New System.IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        GridView1.DataBind()
        form.Controls.Add(GridView1)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub

    Protected Sub LBActDatos_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActDatos.Click
        GridView1.DataBind()
    End Sub

    Protected Sub LBGuardar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBGuardar.Click
        Dim accionv = "0"
        For i As Int32 = 0 To GridView1.Rows.Count - 1
            accionv = CType(GridView1.Rows(i).Cells(7).FindControl("DDLAccion"), DropDownList).SelectedValue
            If Not accionv.Equals("0") Then
                addHistAcciones(CType(GridView1.Rows(i).Cells(7).FindControl("HFCodeBar"), HiddenField).Value, accionv, CType(GridView1.Rows(i).Cells(7).FindControl("TBObser"), TextBox).Text)
            End If
        Next
    End Sub
    Private Sub addHistAcciones(ByVal codebarv As String, ByVal accionv As String, ByVal observacionv As String)
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = ""
            textConmand += " if not exists(SELECT HA_ID "
            textConmand += " FROM controlQR.dbo.HIST_ACCIONES "
            textConmand += " WHERE HA_SUBDEL='" + Session.Item("SIRECAsubdel").ToString + "' "
            textConmand += " and HA_ID_CODEBAR='" + codebarv + "' "
            textConmand += " and HA_AC_ID=" + "2" + " "
            textConmand += " and HA_ID_USER_REGISTRO='" + Session.Item("SIRECAid").ToString + "' "
            textConmand += " and HA_IP_REGISTRO='" + Request.UserHostAddress.ToString + "' "
            textConmand += " and HA_OBSERVACION='" + observacionv + "' "
            textConmand += " and HA_ND_CODE='" + accionv + "') "
            textConmand += " begin "
            textConmand += " insert into [controlQR].[dbo].[HIST_ACCIONES] "
            textConmand += " SELECT '" + Session.Item("SIRECAsubdel").ToString + "' "
            textConmand += " ,'" + codebarv + "' "
            textConmand += " ," + "2" + " "
            textConmand += " ,'" + Session.Item("SIRECAid").ToString + "' "
            textConmand += " ,getdate() "
            textConmand += " ,'" + Request.UserHostAddress.ToString + "' "
            textConmand += " ,'" + observacionv + "' "
            textConmand += " ,'" + accionv + "' "
            textConmand += " end "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
End Class
Imports System.Globalization
Imports System.IO
Imports Ionic.Zip
Imports System.Data.OleDb

Public Class paeemisioncobros
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            End If
        End If
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
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
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not DDLInspector.Items.Contains(New ListItem("DISPONIBLES", "DISPONIBLES")) Then
                If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                    DDLInspector.Items.Add(New ListItem("DISPONIBLES", "DISPONIBLES"))
                End If
            End If
            If Not DDLInspector.Items.Contains(New ListItem("TODOS", "TODOS")) Then
                If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                    DDLInspector.Items.Add(New ListItem("TODOS", "TODOS"))
                End If
            End If
        End If
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewEC.PageSize = CType(DDLPaginas.SelectedValue, Integer)
        GridViewEC.DataBind()
    End Sub

    Protected Sub DDLArea_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLArea.Init
        If Not Request.QueryString("area") Is Nothing Then
            DDLArea.SelectedValue = Request.QueryString("area").ToString
        End If
    End Sub

    Protected Sub GridViewEC_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewEC.PreRender
        Try
            'GridViewEC.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridViewEC.FooterRow.Cells(7).Text = "0"
            GridViewEC.FooterRow.Cells(9).Text = "0"
            GridViewEC.FooterRow.Cells(10).Text = "0"
            For i As Int32 = 0 To (GridViewEC.Rows.Count - 1)
                GridViewEC.FooterRow.Cells(7).Text = Convert.ToDouble(GridViewEC.Rows(i).Cells(7).Text.Replace(",", "")) + Convert.ToDouble(GridViewEC.FooterRow.Cells(7).Text.Replace(",", ""))
                GridViewEC.FooterRow.Cells(9).Text = Convert.ToDouble(GridViewEC.Rows(i).Cells(9).Text.Replace(",", "")) + Convert.ToDouble(GridViewEC.FooterRow.Cells(9).Text.Replace(",", ""))
                GridViewEC.FooterRow.Cells(10).Text = Convert.ToDouble(GridViewEC.Rows(i).Cells(10).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewEC.FooterRow.Cells(10).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewEC.FooterRow.Cells(7).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEC.FooterRow.Cells(7).Text))
            GridViewEC.FooterRow.Cells(9).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEC.FooterRow.Cells(9).Text))
            GridViewEC.FooterRow.Cells(10).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewEC.FooterRow.Cells(10).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub IBExportar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBExportar.Click
        ExportToExcel(Now.ToShortDateString.Replace("/", ""), GridViewEC)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal gv As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        form.Controls.Add(gv)

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

    Protected Sub GridViewCreditos_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If Not e.Row.Cells(5).Text.Equals(e.Row.Cells(6).Text) Then
            e.Row.Cells(6).Font.Bold = True
            e.Row.Cells(6).ForeColor = Drawing.Color.Red
        End If
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        Dim dv As DataView
        Dim consulta As String

        dv = CType(SqlDataSourceExport.Select(DataSourceSelectArguments.Empty), DataView)
        consulta = CType(dv.Table.Rows(0)(0), String)
        '------------------------------------------------------------------------------------
        Try
            Dim nombreFile = Session.Item("SIRECAid").ToString + "_" + DDLSubdel.SelectedValue + Now.ToShortDateString.Replace("/", "")
            If Not Directory.Exists(Server.MapPath("~/descargas/pae" & DDLArea.SelectedValue)) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/pae" & DDLArea.SelectedValue))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 1 "
            'myInsertQuery22 += " RECONFIGURE "            
            myInsertQuery22 += " exec xp_cmdshell 'bcp """ & consulta.Replace("'", "''").Replace("""", """""") & """ queryout """ + Server.MapPath("~/descargas/pae" & DDLArea.SelectedValue) + "/" + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 0 "
            'myInsertQuery22 += " RECONFIGURE "
            'MsgBox(myInsertQuery22)
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + nombreFile + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(Server.MapPath("~/descargas/pae" & DDLArea.SelectedValue) + "/" + nombreFile + ".csv", "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.Message & " _ " & ex.StackTrace)
        End Try
    End Sub
End Class
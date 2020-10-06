Imports System.IO
Imports System.Data.OleDb

Public Class nolocalizadorreportados
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~\pag_cobros\nolocalizadorreportados.aspx")
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

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        CType(sender, GridView).Caption = CInt(GridView2.Rows(0).Cells(0).Text).ToString("N0") + " PATRONES, " + CType(sender, GridView).Rows.Count.ToString("N0") + " CREDITOS, <strong>NO LOCALIZADOS POR CONFIRMAR</strong>"
    End Sub

    Protected Sub LBExportar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExportar.Click
        ExportToExcel(Now.Day.ToString("D2") + Now.Month.ToString("D2") + Now.Year.ToString("D4") + "NoLocalizadosReportados", GridView1)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal wControl As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        wControl.AllowSorting = False
        wControl.DataBind()

        form.Controls.Add(wControl)

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

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub DDLMes_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.PreRender
        If Not CType(sender, DropDownList).Items.Contains(New ListItem("TODOS", "%")) Then
            CType(sender, DropDownList).Items.Add(New ListItem("TODOS", "%"))
        End If
    End Sub

End Class
Public Class indicadoresdedesempeniodetalles
    Inherits System.Web.UI.Page
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count.ToString("N0") & " RESULTADOS.</strong>"
    End Sub

    Protected Sub LBDescargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDescargar.Click
        ExportToExcel("AsignadoCredCobros" + Year(Now).ToString + Month(Now).ToString + Day(Now).ToString)
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

        GridView1.AllowSorting = False
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
End Class
Public Class matriz09
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LBExporta_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExporta.Click
        ExportToExcel("Matriz09_" & Now.ToShortDateString.Replace("/", ""))
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
        form.InnerHtml = "<strong>Matiz 09, con avances </strong>" & Request.QueryString("rangoavance").ToString _
           & "<br/><strong> FECHA DE DESCARGA </strong>" & Now.ToLongDateString & "<strong> A LAS </strong>" & Now.ToLongTimeString

        form.Controls.Add(PanelMatriz09)

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
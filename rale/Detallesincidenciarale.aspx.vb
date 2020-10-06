Public Class Detallesincidenciarale
    Inherits System.Web.UI.Page

    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Response.Write("Exceso de datos, consulte los detalles por C.O.P. luego R.C.V.")
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        ExportToExcel("reporte_incidencia")
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
        GridViewDetalles.AllowSorting = False
        GridViewDetalles.DataBind()
        For i As Int32 = 0 To (GridViewDetalles.Rows.Count - 1)
            GridViewDetalles.Rows(i).Cells(0).Text = CType(GridViewDetalles.Rows(i).Cells(0).FindControl("HyperLink1"), HyperLink).Text
            GridViewDetalles.Rows(i).Cells(14).Text = CType(GridViewDetalles.Rows(i).Cells(14).FindControl("HyperLink2"), HyperLink).Text
        Next
        form.Controls.Add(GridViewDetalles)

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
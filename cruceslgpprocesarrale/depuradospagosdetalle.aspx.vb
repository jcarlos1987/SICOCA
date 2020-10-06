Public Class depuradospagosdetalle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count.ToString("N0") & " Creditos" _
            & "<br/>" & Request.QueryString("depuradoporpago").ToString _
            & "<br/>TIPO: " & Request.QueryString("tipoeco").ToString _
            & ""
    End Sub

    Protected Sub LBExportar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExportar.Click
        ExportToExcel(Request.QueryString("depuradoporpago").ToString + "_" + Request.QueryString("tipoeco").ToString)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
        Dim responsePage As HttpResponse = Response
        Dim sw As New System.IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        GridView1.AllowSorting = False
        GridView1.DataBind()
        pageToRender.Controls.Add(form)
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
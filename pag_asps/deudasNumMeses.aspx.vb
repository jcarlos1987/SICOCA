Public Class deudasNumMeses
    Inherits System.Web.UI.Page

    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones"
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        ExportToExcel("deudaNumMeses" & Now.ToShortDateString.Replace("/", ""))
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
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            GridView1.Rows(i).Cells(1).Text = CType(GridView1.Rows(i).Cells(1).FindControl("HyperLink1"), HyperLink).Text
            GridView1.Rows(i).Cells(7).Text = CType(GridView1.Rows(i).Cells(7).FindControl("HyperLink2"), HyperLink).Text
        Next
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
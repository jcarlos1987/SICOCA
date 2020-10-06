Public Class deudaMesesPeriodo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If        
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        GridView2.Caption = Request.QueryString("patrones").ToString & " Patrones, " & GridView2.Rows.Count & " Creditos."
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        ExportToExcel("deudaMesesPeriodo" & Now.ToShortDateString.Replace("/", ""))
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
        GridView2.AllowSorting = False
        GridView2.DataBind()
        For i As Int32 = 0 To (GridView2.Rows.Count - 1)
            GridView2.Rows(i).Cells(0).Text = CType(GridView2.Rows(i).Cells(0).FindControl("HyperLink1"), HyperLink).Text
            GridView2.Rows(i).Cells(11).Text = CType(GridView2.Rows(i).Cells(11).FindControl("HyperLink2"), HyperLink).Text
        Next
        form.Controls.Add(GridView2)

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
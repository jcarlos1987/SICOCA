Imports System.IO

Public Class detalles_reportebaseralepatrones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        CType(sender, GridView).Caption = CType(sender, GridView).Rows.Count.ToString("N0") & " PATRON(ES)"
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

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        ExportToExcel("D" & Now.Day.ToString("D2") & Now.Month.ToString("D2") & Now.Year.ToString("D4"), GridView1)
    End Sub
End Class
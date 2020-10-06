Imports System.IO

Public Class cedulaspordiadetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewDetalles_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewDetalles.PreRender
        CType(sender, GridView).Caption = "<strong>" + CInt(Request.QueryString("pat")).ToString("N0") + " PATRONES, " + CType(sender, GridView).Rows.Count.ToString("N0") + " CREDITOS </strong>"
    End Sub

    Protected Sub LBExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExport.Click
        ExportToExcel("D" & Now.Day.ToString("D2") & Now.Month.ToString("D2") & Now.Year.ToString("D4"), GridViewDetalles)
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

        form.InnerHtml = "<strong>SUBDELEGACION: </strong>" & Request.QueryString("subdel").ToString _
            & "<br/><strong>PATRONES:</strong> " & Request.QueryString("pat").ToString _
            & "<br/><strong>CEDULAS CREADAS EL: </strong> " & Request.QueryString("dia").ToString

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
End Class
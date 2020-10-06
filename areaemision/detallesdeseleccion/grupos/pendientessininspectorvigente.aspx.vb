Imports System.Globalization
Imports System.IO

Public Class pendientessininspectorvigente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToInt32(Request.QueryString("patrones").ToString)) & " PATRONES" _
        & ", " & String.Format(New CultureInfo("es-MX"), "{0:N0}", GridView1.Rows.Count) & " CREDITOS" _
        & ", " & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToInt32(Request.QueryString("cotizante").ToString)) & " cotizantes" _
        & ", " & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("importe").ToString)) & " importe </strong>"
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ExportToExcel("Pendientes", GridView1)
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
End Class
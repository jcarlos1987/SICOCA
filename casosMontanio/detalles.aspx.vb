Imports System.Globalization
Imports System.IO

Public Class detalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '
        If Request.QueryString("tipo").ToString.Equals("concambio") Then
            GridView1.DataSourceID = "SqlDataSourceCambioInc"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("concambioimpedimento") Then
            GridView1.DataSourceID = "SqlDataSourceCambioIncImpedimento"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("sincambio") Then
            GridView1.DataSourceID = "SqlDataSourceSinCambioInc"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("depurados") Then
            GridView1.DataSourceID = "SqlDataSourceDepurados"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("todos") Then
            GridView1.DataSourceID = "SqlDataSourceTodos"
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        'String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble())
        GridView1.Caption = "<strong>" & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("patrones").ToString)) & " PATRONE(S), " & String.Format(New CultureInfo("es-MX"), "{0:N0}", GridView1.Rows.Count) & " CREDITO(S) con un IMPORTE de: " & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("importe").ToString)) & "</strong>"
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        form.Controls.Add(GridView1)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & Now.ToShortDateString.Replace("/", "") & Now.Hour.ToString("D2") & Now.Minute.ToString("D2") & Now.Second.ToString("D6") & Now.Millisecond.ToString("D6") & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub
End Class
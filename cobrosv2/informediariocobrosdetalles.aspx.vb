Imports System.IO
Imports System.Globalization

Public Class informediariocobrosdetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        GridView2.AllowSorting = False
        GridView2.HeaderStyle.ForeColor = Drawing.Color.Black
        GridView2.DataBind()
        form.Controls.Add(GridView2)
        GridView1.AllowSorting = False
        GridView1.HeaderStyle.ForeColor = Drawing.Color.Black
        GridView1.DataBind()
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

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count.ToString("N0") & " RESULTADOS"
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Try
            GridView2.FooterRow.Cells(1).Text = "0"
            GridView2.FooterRow.Cells(2).Text = "0"
            GridView2.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridView2.Rows.Count - 1)
                GridView2.FooterRow.Cells(1).Text = Convert.ToDouble(GridView2.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(2).Text = Convert.ToDouble(GridView2.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(3).Text = Convert.ToDouble(GridView2.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView2.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(1).Text))
            GridView2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(2).Text))
            GridView2.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView2.FooterRow.Cells(3).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
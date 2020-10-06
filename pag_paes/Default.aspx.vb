Imports System.Globalization
Imports System.IO

Public Class _Default9
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones"
        Try
        GridView1.FooterRow.Cells(6).Text = "0"
        GridView1.FooterRow.Cells(7).Text = "0"
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            GridView1.FooterRow.Cells(6).Text = Convert.ToDouble(GridView1.Rows(i).Cells(6).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(6).Text.Replace(",", ""))
            GridView1.FooterRow.Cells(7).Text = Convert.ToDouble(GridView1.Rows(i).Cells(7).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(7).Text.Replace("$", "").Replace(",", ""))
        Next
            GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))
            GridView1.FooterRow.Cells(7).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(7).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        Try
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            End If
            If Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ExportToExcel("doc_excel")
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
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
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub
End Class
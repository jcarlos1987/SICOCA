Imports System.Globalization
Imports System.IO

Public Class detalleCambioInc
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    If Not DDLSubdel.Items.Contains(New ListItem("YUCATAN", "%")) Then
                        DDLSubdel.Items.Add(New ListItem("YUCATAN", "%"))
                    End If
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        Try
            'GridView3.FooterRow.Cells(2).Text = "0"
            GridView3.FooterRow.Cells(3).Text = "0"
            GridView3.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridView3.Rows.Count - 1)
                'GridView3.FooterRow.Cells(2).Text = Convert.ToDouble(GridView3.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(3).Text = Convert.ToDouble(GridView3.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(4).Text = Convert.ToDouble(GridView3.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView3.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(2).Text))
            GridView3.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(3).Text))
            GridView3.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView3.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
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

        form.Controls.Add(GridView3)

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
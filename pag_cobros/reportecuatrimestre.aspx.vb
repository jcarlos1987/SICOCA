Imports System.IO
Imports System.Globalization

Public Class reportecuatrimestre
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub DDLAnio0_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio0.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio0.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio0.SelectedIndex = DDLAnio0.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
        GridView2.DataBind()
        GridView3.DataBind()
    End Sub

    Protected Sub LBExportar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExportar.Click
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        form.Controls.Add(GridView1)
        form.Controls.Add(GridView2)
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

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            'GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridView1.FooterRow.Cells(3).Text = "0"
            GridView1.FooterRow.Cells(4).Text = "0"
            GridView1.FooterRow.Cells(5).Text = "0"
            GridView1.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(3).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(5).Text = Convert.ToDouble(GridView1.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(5).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(6).Text = Convert.ToDouble(GridView1.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(5).Text))
            GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))

        Catch ex As Exception

        End Try
    End Sub
End Class
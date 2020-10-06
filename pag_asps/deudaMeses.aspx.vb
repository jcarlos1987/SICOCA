Imports System.Globalization

Public Class deudaMeses
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            'GridView1.FooterRow.Cells(1).Text = "0"
            'GridView1.FooterRow.Cells(2).Text = "0"
            'GridView1.FooterRow.Cells(3).Text = "0"
            GridView1.FooterRow.Cells(3).Text = "0"
            GridView1.FooterRow.Cells(4).Text = "0"

            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                    'GridView1.FooterRow.Cells(1).Text = Convert.ToDouble(GridView1.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(1).Text.Replace(",", ""))
                    'GridView2.FooterRow.Cells(2).Text = Convert.ToDouble(GridView2.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(2).Text.Replace(",", ""))
                    'GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(GridView1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(GridView1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(1).Text))
            'GridView2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(2).Text))
            'GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView4_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView4.PreRender
        Try
            'GridView4.FooterRow.Cells(1).Text = "0"
            'GridView4.FooterRow.Cells(2).Text = "0"
            GridView4.FooterRow.Cells(1).Text = "0"
            GridView4.FooterRow.Cells(2).Text = "0"
            GridView4.FooterRow.Cells(3).Text = "0"
            GridView4.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridView4.Rows.Count - 1)
                'GridView4.FooterRow.Cells(1).Text = Convert.ToDouble(GridView4.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(1).Text.Replace(",", ""))
                'GridView4.FooterRow.Cells(2).Text = Convert.ToDouble(GridView4.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridView4.Rows(i).Cells(1).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(2).Text = Convert.ToDouble(GridView4.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(3).Text = Convert.ToDouble(GridView4.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(4).Text = Convert.ToDouble(GridView4.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView4.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(1).Text))
            'GridView4.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(2).Text))
            GridView4.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(1).Text))
            GridView4.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(2).Text))
            GridView4.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(3).Text))
            GridView4.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView4.FooterRow.Cells(4).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
        GridView3.DataBind()
        GridView5.DataBind()
        GridView4.DataBind()
    End Sub

    
    Protected Sub DDLMes0_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes0.Init
        DDLMes0.SelectedIndex = 0
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(Now) - 1)
    End Sub
End Class
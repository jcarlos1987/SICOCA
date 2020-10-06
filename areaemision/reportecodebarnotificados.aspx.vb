Imports System.Globalization

Public Class reportecodebarnotificados
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Protected Sub TBFIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFIni.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFFin.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.FooterRow.Cells(1).Text = "0"
            GridView1.FooterRow.Cells(2).Text = "0"
            GridView1.FooterRow.Cells(3).Text = "$0"
            GridView1.FooterRow.Cells(4).Text = "$0"
            GridView1.FooterRow.Cells(5).Text = "0"
            GridView1.FooterRow.Cells(6).Text = "0"
            GridView1.FooterRow.Cells(7).Text = "0"
            GridView1.FooterRow.Cells(8).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                GridView1.FooterRow.Cells(1).Text = Convert.ToDouble(GridView1.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(2).Text = Convert.ToDouble(GridView1.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(GridView1.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
                GridView1.FooterRow.Cells(5).Text = Convert.ToDouble(GridView1.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(5).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(6).Text = Convert.ToDouble(GridView1.Rows(i).Cells(6).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(6).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(7).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(7).FindControl("LBDif1"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(7).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(8).Text = Convert.ToDouble(GridView1.Rows(i).Cells(8).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(8).Text.Replace(",", ""))

            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridView1.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(1).Text))
            GridView1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(2).Text))
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(5).Text))
            GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))
            GridView1.FooterRow.Cells(7).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(7).Text))
            GridView1.FooterRow.Cells(8).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(8).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Try
            GridView2.FooterRow.Cells(1).Text = "0"
            GridView2.FooterRow.Cells(2).Text = "0"
            GridView2.FooterRow.Cells(3).Text = "$0"
            GridView2.FooterRow.Cells(4).Text = "$0"
            GridView2.FooterRow.Cells(5).Text = "0"
            GridView2.FooterRow.Cells(6).Text = "0"
            GridView2.FooterRow.Cells(7).Text = "0"
            GridView2.FooterRow.Cells(8).Text = "0"
            GridView2.FooterRow.Cells(9).Text = "0"
            For i As Int32 = 0 To (GridView2.Rows.Count - 1)
                GridView2.FooterRow.Cells(1).Text = Convert.ToDouble(GridView2.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(2).Text = Convert.ToDouble(GridView2.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(3).Text = Convert.ToDouble(GridView2.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                GridView2.FooterRow.Cells(4).Text = Convert.ToDouble(GridView2.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
                GridView2.FooterRow.Cells(5).Text = Convert.ToDouble(GridView2.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(5).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(6).Text = Convert.ToDouble(GridView2.Rows(i).Cells(6).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(6).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(7).Text = Convert.ToDouble(GridView2.Rows(i).Cells(7).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(7).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(8).Text = Convert.ToDouble(GridView2.Rows(i).Cells(8).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(8).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(9).Text = Convert.ToDouble(GridView2.Rows(i).Cells(9).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(9).Text.Replace(",", ""))

            Next
            'GridView2.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(0).Text))
            GridView2.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(1).Text))
            GridView2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(2).Text))
            GridView2.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView2.FooterRow.Cells(3).Text))
            GridView2.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView2.FooterRow.Cells(4).Text))
            GridView2.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(5).Text))
            GridView2.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(6).Text))
            GridView2.FooterRow.Cells(7).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(7).Text))
            GridView2.FooterRow.Cells(8).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(8).Text))
            GridView2.FooterRow.Cells(9).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(9).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
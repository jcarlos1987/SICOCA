Imports System.Globalization

Public Class _default50
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            CType(sender, GridView).FooterRow.Cells(0).Text = "<strong>TOTAL</strong>"
            CType(sender, GridView).FooterRow.Cells(1).Text = "0"
            CType(sender, GridView).FooterRow.Cells(2).Text = "0 %"
            CType(sender, GridView).FooterRow.Cells(3).Text = "0"
            CType(sender, GridView).FooterRow.Cells(4).Text = "0 %"
            For i As Int32 = 0 To (CType(sender, GridView).Rows.Count - 1)
                CType(sender, GridView).FooterRow.Cells(1).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text.Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(2).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(2).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text.Replace("%", ""))
                CType(sender, GridView).FooterRow.Cells(3).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(4).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(4).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text.Replace("%", ""))
            Next
            CType(sender, GridView).FooterRow.Cells(1).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text)) + "</strong>"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView21_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Try
            CType(sender, GridView).FooterRow.Cells(0).Text = "<strong>TOTAL</strong>"
            CType(sender, GridView).FooterRow.Cells(1).Text = "0"
            CType(sender, GridView).FooterRow.Cells(2).Text = "0 %"
            CType(sender, GridView).FooterRow.Cells(3).Text = "0"
            CType(sender, GridView).FooterRow.Cells(4).Text = "0 %"
            For i As Int32 = 0 To (CType(sender, GridView).Rows.Count - 1)
                CType(sender, GridView).FooterRow.Cells(1).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text.Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(2).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(2).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text.Replace("%", ""))
                CType(sender, GridView).FooterRow.Cells(3).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(4).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(4).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text.Replace("%", ""))
            Next
            CType(sender, GridView).FooterRow.Cells(1).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text)) + "</strong>"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView23_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Try
            CType(sender, GridView).FooterRow.Cells(0).Text = "<strong>TOTAL</strong>"
            CType(sender, GridView).FooterRow.Cells(1).Text = "0"
            CType(sender, GridView).FooterRow.Cells(2).Text = "0 %"
            CType(sender, GridView).FooterRow.Cells(3).Text = "0"
            CType(sender, GridView).FooterRow.Cells(4).Text = "0 %"
            For i As Int32 = 0 To (CType(sender, GridView).Rows.Count - 1)
                CType(sender, GridView).FooterRow.Cells(1).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text.Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(2).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(2).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text.Replace("%", ""))
                CType(sender, GridView).FooterRow.Cells(3).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(4).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(4).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text.Replace("%", ""))
            Next
            CType(sender, GridView).FooterRow.Cells(1).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text)) + "</strong>"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        Try
            CType(sender, GridView).FooterRow.Cells(0).Text = "<strong>TOTAL</strong>"
            CType(sender, GridView).FooterRow.Cells(1).Text = "0"
            CType(sender, GridView).FooterRow.Cells(2).Text = "0 %"
            CType(sender, GridView).FooterRow.Cells(3).Text = "0"
            CType(sender, GridView).FooterRow.Cells(4).Text = "0 %"
            For i As Int32 = 0 To (CType(sender, GridView).Rows.Count - 1)
                CType(sender, GridView).FooterRow.Cells(1).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text.Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(2).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(2).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text.Replace("%", ""))
                CType(sender, GridView).FooterRow.Cells(3).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                CType(sender, GridView).FooterRow.Cells(4).Text = Convert.ToDouble(CType(sender, GridView).Rows(i).Cells(4).Text.Replace("%", "")) + Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text.Replace("%", ""))
            Next
            CType(sender, GridView).FooterRow.Cells(1).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(1).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(2).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(3).Text)) + "</strong>"
            CType(sender, GridView).FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0} %", Convert.ToDouble(CType(sender, GridView).FooterRow.Cells(4).Text)) + "</strong>"
        Catch ex As Exception

        End Try
    End Sub
End Class
﻿Imports System.Globalization

Public Class indicadoresdedesempenio
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not Session.Item("SIRECAind_desempenio").ToString.Equals("1") Then
                Response.Redirect("~/Login.aspx")
            End If
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

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.FooterRow.Cells(3).Text = "0"
            GridView1.FooterRow.Cells(4).Text = "0"
            GridView1.FooterRow.Cells(5).Text = "0"
            'GridView1.FooterRow.Cells(6).Text = "0"
            GridView1.FooterRow.Cells(8).Text = "0"
            GridView1.FooterRow.Cells(9).Text = "0"
            GridView1.FooterRow.Cells(10).Text = "0"
            GridView1.FooterRow.Cells(11).Text = "0"
            GridView1.FooterRow.Cells(12).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)

                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(GridView1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(5).Text = Convert.ToDouble(GridView1.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(5).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(8).Text = Convert.ToDouble(GridView1.Rows(i).Cells(8).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(8).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(9).Text = Convert.ToDouble(GridView1.Rows(i).Cells(9).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(9).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(10).Text = Convert.ToDouble(GridView1.Rows(i).Cells(10).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(10).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(11).Text = Convert.ToDouble(GridView1.Rows(i).Cells(11).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(11).Text.Replace(",", ""))
                
            Next
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(5).Text))
            'GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))
            GridView1.FooterRow.Cells(8).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(8).Text))
            GridView1.FooterRow.Cells(9).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(9).Text))
            GridView1.FooterRow.Cells(10).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(10).Text))
            GridView1.FooterRow.Cells(11).Text = (CDbl(GridView1.FooterRow.Cells(11).Text.Replace(",", "")) / CDbl(GridView1.Rows.Count)).ToString("N0")
            GridView1.FooterRow.Cells(12).Text = (CDbl(GridView1.FooterRow.Cells(9).Text.Replace(",", "")) / CDbl(GridView1.FooterRow.Cells(4).Text.Replace(",", ""))).ToString("P")

        Catch ex As Exception
            
        End Try
    End Sub
End Class
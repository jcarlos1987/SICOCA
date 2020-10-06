Imports System.Globalization

Public Class canceladasimpresas
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub GridViewCit_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCit.PreRender
        Try
            GridViewCit.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCit.Rows.Count - 1)
                GridViewCit.FooterRow.Cells(5).Text = Convert.ToDouble(CType(GridViewCit.Rows(i).Cells(5).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewCit.FooterRow.Cells(5).Text.Replace(",", ""))
                'GridViewCit.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCit.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCit.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewCit.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCit.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewNot.PreRender
        Try
            GridViewNot.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCit.Rows.Count - 1)
                GridViewNot.FooterRow.Cells(5).Text = Convert.ToDouble(CType(GridViewNot.Rows(i).Cells(5).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewNot.FooterRow.Cells(5).Text.Replace(",", ""))
            Next
            GridViewNot.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewNot.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
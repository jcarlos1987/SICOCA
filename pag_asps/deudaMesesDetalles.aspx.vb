Imports System.Globalization

Public Class deudaMesesDetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView4_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView4.PreRender
        GridView4.Caption = GridView4.Rows.Count & " PATRONES"
        Try
            'GridView4.FooterRow.Cells(3).Text = "0"
            GridView4.FooterRow.Cells(2).Text = "0"
            For i As Int32 = 0 To (GridView4.Rows.Count - 1)
                'GridView4.FooterRow.Cells(3).Text = Convert.ToDouble(GridView4.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(2).Text = Convert.ToDouble(GridView4.Rows(i).Cells(2).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(2).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView4.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(1).Text))
            'GridView4.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(3).Text))
            GridView4.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView4.FooterRow.Cells(2).Text))

        Catch ex As Exception

        End Try
    End Sub
End Class
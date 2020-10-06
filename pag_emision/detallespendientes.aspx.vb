Imports System.Globalization

Public Class detallespendientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewPendientes_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewPendientes.PreRender
        '7,8
        Try
            GridViewPendientes.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 <br/>" & String.Format(New CultureInfo("es-MX"), "{0:N0}", GridViewPendientes.Rows.Count) & " Resultados</strong>"
            GridViewPendientes.FooterRow.Cells(7).Text = "0"
            GridViewPendientes.FooterRow.Cells(8).Text = "0"
            For i As Int32 = 0 To (GridViewPendientes.Rows.Count - 1)
                GridViewPendientes.FooterRow.Cells(7).Text = Convert.ToDouble(GridViewPendientes.Rows(i).Cells(7).Text.Replace(",", "")) + Convert.ToDouble(GridViewPendientes.FooterRow.Cells(7).Text.Replace(",", ""))
                GridViewPendientes.FooterRow.Cells(8).Text = Convert.ToDouble(GridViewPendientes.Rows(i).Cells(8).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewPendientes.FooterRow.Cells(8).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewPendientes.FooterRow.Cells(7).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewPendientes.FooterRow.Cells(7).Text))
            GridViewPendientes.FooterRow.Cells(8).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewPendientes.FooterRow.Cells(8).Text))

        Catch ex As Exception

        End Try
    End Sub
End Class
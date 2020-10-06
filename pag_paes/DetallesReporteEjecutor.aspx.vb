Imports System.Globalization

Public Class DetallesReporteEjecutor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.Rows.Count)) & " CREDITOS, IMPORTE " & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("importe"))) & "</strong>"
    End Sub
End Class
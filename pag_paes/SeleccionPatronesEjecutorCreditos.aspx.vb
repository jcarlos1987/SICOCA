Imports System.Globalization

Public Class SeleccionPatronesEjecutorCreditos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            Label1.Text = "<strong>REG. PATRONAL: </strong>" & Request.QueryString("regpat").ToString
            Label2.Text = "<strong>RAZON SOCIAL: </strong>" & Request.QueryString("razon").ToString
            Label3.Text = "<strong>DOMICILIO: </strong>" & Request.QueryString("dom").ToString
            Label4.Text = "<strong>CREDITO(S): </strong>" & Request.QueryString("credito").ToString
            Label5.Text = "<strong>COTIZANTES: </strong>" & Request.QueryString("cotiz").ToString
            Label6.Text = "<strong>ADEUDO TOTAL: </strong>" & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("adeudo").ToString))
        End If
    End Sub

End Class
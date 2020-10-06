Public Class saldo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridViewSaldo_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewSaldo.PreRender
        GridViewSaldo.Caption = "<strong>" & GridViewSaldo.Rows.Count.ToString("N0") & " Resultados.</strong>"
    End Sub
End Class
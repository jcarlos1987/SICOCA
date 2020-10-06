Public Class Menu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub IB1ciclo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IB1ciclo.Click
        If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
            Response.Redirect("~/principal/Ciclo1.aspx")
        Else
            Response.Redirect("~/pag_asps/inicio.aspx")
        End If
    End Sub

    Protected Sub IB2ciclo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IB2ciclo.Click
        If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
            Response.Redirect("~/principal/Ciclo2.aspx")
        Else
            Response.Redirect("~/cobrosv2/capturadiligencia.aspx")
            'Response.Redirect("~/pag_cobros/capturadeincidencia.aspx")
        End If
    End Sub

    Protected Sub IB3ciclo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IB3ciclo.Click
        If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
            Response.Redirect("~/principal/Ciclo3.aspx")
        Else
            Response.Redirect("~/accesoDenegado.aspx")
        End If
    End Sub
End Class
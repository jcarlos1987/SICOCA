Imports System.IO

Public Class SiteCiclo1
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Server.Transfer("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''   If Session.Item("SIRECAuser") Is Nothing Then
        ''  Response.Redirect("~/Login.aspx")
        '' Else
        '' If Not (Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
        ''Server.Transfer("~/accesoDenegado.aspx")
        ''  End If
        ''  End If
    End Sub

    Protected Sub IBFotoUsuario_Init(ByVal sender As Object, ByVal e As EventArgs) Handles IBFotoUsuario.Init
        '' If Not Session.Item("SIRECAsubdel") Is Nothing Then
        ''If File.Exists(Server.MapPath("~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg")) Then
        ''IBFotoUsuario.ImageUrl = "~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg"
        '' End If
        '' End If
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        ''  Session.Clear()
        ''   Session.Abandon()
        ''  Response.RedirectPermanent("~/Login.aspx")
    End Sub
End Class
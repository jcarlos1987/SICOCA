﻿Imports System.IO

Public Class SitePrincipal
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Server.Transfer("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub IBCerrarSesion_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBCerrarSesion.Click
        Session.Clear()
        Session.Abandon()
        Response.RedirectPermanent("~/Login.aspx")
    End Sub

    Protected Sub IBFotoUsuario_Init(ByVal sender As Object, ByVal e As EventArgs) Handles IBFotoUsuario.Init
        If Not Session.Item("SIRECAsubdel") Is Nothing Then
            If File.Exists(Server.MapPath("~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg")) Then
                IBFotoUsuario.ImageUrl = "~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg"
            End If
        End If
    End Sub
End Class
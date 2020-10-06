﻿Public Class detallesseleccionporinc
    Inherits System.Web.UI.Page
    Dim salarioBase As String = ConfigurationSettings.AppSettings("salarioMinimo")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub HiddenFieldSalario_Init(ByVal sender As Object, ByVal e As EventArgs) Handles HiddenFieldSalario.Init
        HiddenFieldSalario.Value = salarioBase
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count.ToString("N0") & " PATRON(ES) con INCIDENCIA: " & Request.QueryString("incidencia").ToString
    End Sub
End Class
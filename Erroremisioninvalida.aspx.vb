Public Class Erroremisioninvalida
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = "La base de la emision SOLICITADA no esta CREADA."
    End Sub

End Class
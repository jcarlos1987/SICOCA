Public Class _Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/cobros/login2.aspx")
        Else
            If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                Response.Redirect("~/cobros/supervisorinforme.aspx")
            Else
                Response.Redirect("~/cobros/ejecutor.aspx")
            End If
        End If
    End Sub

End Class
Public Class Restablecimientos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                HFSubdel.Value = Session.Item("SIRECAsubdel").ToString
            ElseIf (Session.Item("SIRECAsubdel").ToString <> "00") Then
                HFSubdel.Value = "%"
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

End Class
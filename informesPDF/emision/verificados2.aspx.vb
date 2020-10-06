Public Class verificados2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session.Item("SIRECAsubdel") Is Nothing Then
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                HiddenFieldSubdel.Value = "%"
            Else
                HiddenFieldSubdel.Value = Session.Item("SIRECAsubdel").ToString
            End If
        End If
    End Sub

End Class
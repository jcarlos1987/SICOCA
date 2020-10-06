Public Class Bajaspor251
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

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Bajas por 251"
    End Sub

End Class
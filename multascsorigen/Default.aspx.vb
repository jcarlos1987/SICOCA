Public Class _Default5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            'Response.Redirect("~/Login.aspx")
            DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            DDLSubdel.Items.Add(New ListItem("SUR", "33"))
        Else
            DDLSubdel.Items.Clear()
            If Session.Item("SIRECAsubdel").Equals("01") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            ElseIf Session.Item("SIRECAsubdel").Equals("33") Then
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            Else
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
        End If
    End Sub
End Class
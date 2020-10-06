Public Class Faltantes1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAchmod1").ToString.Equals("x") Then

            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "Resultado(s): " & GridView1.Rows.Count
    End Sub

End Class
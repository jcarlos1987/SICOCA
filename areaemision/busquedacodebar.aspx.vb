Public Class busquedacodebar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub LBReg_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBReg.Click
        GridViewRegitros.DataBind()
    End Sub
End Class
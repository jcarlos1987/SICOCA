Public Class buscador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LBBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBBuscar.Click
        GridView1.DataBind()
    End Sub
End Class
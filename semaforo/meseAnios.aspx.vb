Public Class meseAnios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub IBRales_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBRales.Click
        If (DDLMA.SelectedValue.Equals("MESES")) Then
            GridView1.DataSource = "SqlDataSourceMeses"
        Else
            GridView1.DataSource = "SqlDataSourceAnios"
        End If
        GridView1.DataBind()
    End Sub
End Class
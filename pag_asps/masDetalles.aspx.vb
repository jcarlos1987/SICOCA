Public Class masDetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                If Request.QueryString("tipo").ToString.Equals("POR COBRAR") Then
                    GridView1.DataSourceID = "SqlDataSourcePorcobrarMas"
                    GridView1.DataBind()
                ElseIf Request.QueryString("tipo").ToString.Equals("NO LOCALIZADOS") Then
                    GridView1.DataSourceID = "SqlDataSourceNLMas"
                    GridView1.DataBind()
                End If

            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & "  Encontrados"
    End Sub
End Class
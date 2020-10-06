Public Class AsigManual
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            Dim sectores As String = Request.QueryString("sector").Replace("-0-", "-00-")
            sectores = sectores.Replace("-1-", "-01-")
            sectores = sectores.Replace("-2-", "-02-")
            sectores = sectores.Replace("-3-", "-03-")
            sectores = sectores.Replace("-4-", "-04-")
            sectores = sectores.Replace("-5-", "-05-")
            sectores = sectores.Replace("-6-", "-06-")
            sectores = sectores.Replace("-7-", "-07-")
            sectores = sectores.Replace("-8-", "-08-")
            sectores = sectores.Replace("-9-", "-09-")
            sectores = sectores.Replace("-", "','")
            SqlDataSourceFaltantes.SelectCommand = SqlDataSourceFaltantes.SelectCommand.Replace("sector in ('')", "sector in ('" & sectores & "')")
            SqlDataSourceFaltantes.SelectCommand = SqlDataSourceFaltantes.SelectCommand.Replace("clasificacion='2'", "clasificacion='" & Request.QueryString("clasificacion").ToString & "'")
            'MsgBox(SqlDataSourceFaltantes.SelectCommand)
            GridView1.DataSourceID = "SqlDataSourceFaltantes"
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            End If
            If Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones"
    End Sub
End Class
Public Class supervisor1
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/cobros/login2.aspx")
        ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") Then
            If Request.QueryString("tipo") Is Nothing Then
                SqlDataSourceEjecutor.SelectCommand = SqlDataSourceEjecutor.SelectCommand.Replace("TIPO_ADEUDO=?", " [EJECUTOR]='" & Request.QueryString("ejecutor").ToString & "' ")
                SqlDataSourceEjecutor.DataBind()
                GridView1.DataBind()
            End If
        Else
            Response.Redirect("~/cobros/login2.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        If Request.QueryString("tipo") Is Nothing Then
            GridView1.Caption = "<font style='font-size: large; color: #CC6600; font-weight: bold;'>" & GridView1.Rows.Count & " PATRONES</font>"
        Else
            GridView1.Caption = "<font style='font-size: large; color: #CC6600; font-weight: bold;'>" & GridView1.Rows.Count & " PATRONES, <em>" & Request.QueryString("tipo").ToString & "</em></font>"
        End If

    End Sub
End Class
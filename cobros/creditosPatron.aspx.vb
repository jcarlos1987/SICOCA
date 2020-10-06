Public Class creditosPatron
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/cobros/login2.aspx")
        ElseIf Session.Item("SIRECA2chmod1").ToString.Equals("x") And Session.Item("SIRECAuser_type").ToString.Equals("0") Then
            If Request.QueryString("tipoeco").ToString.Equals("RCV") Then
                SqlDataSourceDetallesRale.SelectCommand = SqlDataSourceDetallesRale.SelectCommand.Replace("[3301ACOP280812]", "[3301ARCV280812]")
                SqlDataSourceDetallesRale.DataBind()
                GridView2.DataBind()
            End If
        Else
            Response.Redirect("~/cobros/login2.aspx")
        End If
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        GridView2.Caption = "<font style='font-size: large; color: #CC6600; font-weight: bold;'>" & GridView2.Rows.Count & " CREDITOS " & Request.QueryString("tipoeco").ToString & "<br/>" & Request.QueryString("razonsocial").ToString & "</font>"
    End Sub
End Class
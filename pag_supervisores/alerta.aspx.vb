Public Class alerta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAuser_type").ToString.Equals("0")) And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                SqlDataSource2.SelectCommand = SqlDataSource2.SelectCommand.Replace("ecodeudasmeses", "ecodeudasmeses" & Request.UserHostName.Replace(".", "_"))
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

End Class
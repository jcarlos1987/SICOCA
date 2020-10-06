Public Class detallesAlertas
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

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.Caption = GridView1.Rows.Count & " Patrones con PENDIENTE DE PAGO del periodo: " & Request.QueryString("fechaeco")
        Catch ex As Exception

        End Try        
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Try
            GridView2.Caption = GridView2.Rows.Count & " Patrones con PENDIENTES DE PAGO de " & Request.QueryString("meses") & " MESES."
        Catch ex As Exception

        End Try
    End Sub

End Class
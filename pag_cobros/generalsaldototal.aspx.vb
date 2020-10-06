Public Class generalsaldototal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            If Request.QueryString("periodo").ToString.Substring(3, 7).Equals(Request.QueryString("periodofin").ToString.Substring(3, 7)) Then
                GridView1.Caption = GridView1.Rows.Count.ToString & " PATRONES del PERIODO " & Request.QueryString("periodo").ToString.Substring(3, 7)
            Else
                GridView1.Caption = GridView1.Rows.Count.ToString & " PATRONES del PERIODO " & Request.QueryString("periodo").ToString.Substring(3, 7) & " al " & Request.QueryString("periodofin").ToString.Substring(3, 7)
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
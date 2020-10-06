Public Class setForaneasPae
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = CInt(Request.QueryString("patrones")).ToString("N0") & " PATRON(ES) con " & GridView1.Rows.Count.ToString("N0") & " CREDITO(S) con un IMPORTE de: " & CDbl(Request.QueryString("importe")).ToString("C")
    End Sub
End Class
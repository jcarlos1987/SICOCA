Public Class paeemisioncobrosinfodetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & CType(Request.QueryString("patrones"), Int32).ToString("N0") & " PATRONES/ " & GridView1.Rows.Count.ToString("N0") & " CREDITOS.</strong>"
    End Sub
End Class
Public Class resumendiligenciadetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>SUBDELEGACION:</strong> " & Request.QueryString("subdel").ToString & ", " & GridView1.Rows.Count.ToString("N0") _
            & " <strong>SIVEPAS" & " del PERIODO:</strong> " & Request.QueryString("periodo").ToString & "<strong>, con DILIGENCIA:</strong> " & Request.QueryString("diligencia").ToString
    End Sub
End Class
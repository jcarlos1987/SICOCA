Public Class DefaultInc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count & " RESULTADOS, SUBDELEGACIÓN:" & Request.QueryString("subdel").ToString & ", del periodo: " & Request.QueryString("mes").ToString & "/" & Request.QueryString("anio").ToString & "</strong>"
    End Sub
End Class
Public Class incidenciaejecutor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count & " RESULTADOS, CLASIFICACIÓN: " & Request.QueryString("incidencia").ToString & ", SUBDELEGACIÓN:" & Request.QueryString("subdel").ToString & ", del periodo: " & Request.QueryString("mes").ToString & "/" & Request.QueryString("anio").ToString _
            & " de fechas " & Request.QueryString("fech_inicio").ToString & " al " & Request.QueryString("fech_fin").ToString & "</strong>"
    End Sub
End Class
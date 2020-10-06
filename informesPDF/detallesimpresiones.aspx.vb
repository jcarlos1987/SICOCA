Public Class detallesimpresiones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<h4>" & Request.QueryString("tipo_doc").ToString _
            & " " & Request.QueryString("accion").ToString _
            & " <br/>Son Facturas Asignadas del " & Request.QueryString("fech_ini").ToString _
            & " al " & Request.QueryString("fech_fin").ToString & "</h4>"
    End Sub
End Class
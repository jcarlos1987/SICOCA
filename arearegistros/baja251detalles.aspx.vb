Public Class baja251detalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewB251Detalle_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewB251Detalle.PreRender
        GridViewB251Detalle.Caption = "<strong>" & GridViewB251Detalle.Rows.Count.ToString("N0") & " PATRONES DE BAJA POR 251 DE " & Request.QueryString("mes").ToString & " " & Request.QueryString("anio").ToString & "</strong>"
    End Sub
End Class
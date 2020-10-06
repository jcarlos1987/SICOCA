Public Class mensajesobservacioncomentarios
    Inherits System.Web.UI.Page
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("3") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo3.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("IA") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorA.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("IB") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorB.Master"
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewMensajes_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewMensajes.PreRender
        GridViewMensajes.Caption = "<strong>" & GridViewMensajes.Rows.Count.ToString("N0") & " Mensajes Nuevos (menores a 6 dias de su Publicación)</strong>"
    End Sub
End Class
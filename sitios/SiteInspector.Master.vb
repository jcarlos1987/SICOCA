Imports System.IO

Public Class SiteInspector
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Server.Transfer("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs)
        'If e.Item.Value.Equals("1") Then
        'Informes
        'Response.Redirect("~/principal/Ciclo1.aspx")
        'LTMenu.Text = e.Item.Text
        'ElseIf e.Item.Value.Equals("2") Then
        'Cargas/Descargas y Depuracion
        '   Response.Redirect("~/areaemision/cargasdescargasdepuracion.aspx")
        '  LTMenu.Text = e.Item.Text
        'ElseIf e.Item.Value.Equals("3") Then
        'Busqueda
        ' Response.Redirect("~/areaemision/busquedas.aspx")
        'LTMenu.Text = e.Item.Text
        'ElseIf e.Item.Value.Equals("4") Then
        'Clasificacion de pagos
        'Response.Redirect("~/areaemision/clasificaciondepagos.aspx")
        'LTMenu.Text = e.Item.Text
        'ElseIf e.Item.Value.Equals("5") Then
        'Adeudos
        '   Response.Redirect("~/areaemision/adeudos.aspx")
        '  LTMenu.Text = e.Item.Text
        'ElseIf e.Item.Value.Equals("7") Then
        'Asignacion
        'Response.Redirect("~/areaemision/asignacion.aspx")
        ' LTMenu.Text = e.Item.Text
        'ElseIf e.Item.Value.Equals("8") Then
        'Ayuda
        'Response.Redirect("~/areaemision/Default.aspx")
        'LTMenu.Text = e.Item.Text
        'End If
    End Sub

    Protected Sub IBCerrarSesion_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBCerrarSesion.Click
        Session.Clear()
        Session.Abandon()
        Response.RedirectPermanent("~/Login.aspx")
    End Sub

    Protected Sub IBFotoUsuario_Init(ByVal sender As Object, ByVal e As EventArgs) Handles IBFotoUsuario.Init
        If Not Session.Item("SIRECAsubdel") Is Nothing Then
            If File.Exists(Server.MapPath("~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg")) Then
                IBFotoUsuario.ImageUrl = "~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg"
            End If
        End If
    End Sub
End Class
Public Class SiteRegistros
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            ImageButton3.ToolTip = "     Iniciar Sesion"
            ImageButton3.ImageUrl = "~/imagenes/user_locked.png"
            ImageButton3.OnClientClick = ""
        Else
            'ImageButton3.OnClientClick = "javascript:window.close();"
            ImageButton3.ImageUrl = "~/imagenes/user_secured.png"
            ImageButton3.ToolTip = "     Cerrar Sesion"
            HyperLink1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bienvenido(a) " & Session.Item("SIRECAnombre") & ""
            Label1.Text = "Sector / " & Session.Item("SIRECAsectores")
            If Session.Item("SIRECAuser_type").ToString.Equals("1") Then
                ImageButton2.PostBackUrl = "~/pag_asps/inicio.aspx"
            ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    ImageButton2.PostBackUrl = "~/pag_supervisores/reporteGeneral.aspx"
                ElseIf Session.Item("SIRECAchmod2").ToString.Equals("x") Then
                    ImageButton2.PostBackUrl = "~/pag_auditoria/Default.aspx"
                ElseIf Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                    ImageButton2.PostBackUrl = "~/pag_asps/supervisor.aspx"
                End If
            End If
        End If
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Dim tb As String = ImageButton3.ToolTip.Replace(" ", "")
        If tb.Equals("IniciarSesion") Then
            'MsgBox("fin")
            Session.Clear()
            Session.Abandon()
            ImageButton3.ToolTip = "     Cerrar Sesion"
            ImageButton3.ImageUrl = "~/imagenes/user_secured.png"
            Response.RedirectPermanent("~/Login.aspx")
        Else
            Session.Clear()
            ImageButton3.ImageUrl = "~/imagenes/user_locked.png"
            Session.Abandon()
            ImageButton3.ToolTip = "     Iniciar Sesion"
            'MsgBox("ini")
            Response.RedirectPermanent("~/Login.aspx")
        End If
    End Sub
End Class
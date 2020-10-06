Public Class canceladasimpresasdetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count.ToString("N0") & " " _
            & IIf(Request.QueryString("tipodoc").ToString.Equals("1"), "CITATORIOS ", "ACTAS DE NOTIFICACION ") _
            & "(" & Request.QueryString("accion") & ")"
    End Sub
End Class
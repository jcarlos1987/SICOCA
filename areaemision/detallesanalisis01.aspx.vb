Public Class detallesanalisis01
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>SUBDELEGACION: </strong>" & Request.QueryString("subdel").ToString _
            & "<br/><strong>INC. EN SIRECA: </strong>" & Request.QueryString("diligencia").ToString _
            & "<br/><strong>CON FECHAS DE NOTIFICACION: </strong>" & Request.QueryString("fech_rn_sn").ToString _
            & "<br/><strong>RALE C.O.P.: </strong>" & Request.QueryString("ralecop").ToString.Substring(8) _
            & "<strong> y RALE R.C.V.: </strong>" & Request.QueryString("ralercv").ToString.Substring(8)
    End Sub
End Class
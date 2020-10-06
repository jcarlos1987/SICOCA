Public Class entregaretrasonotificadodetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        CType(sender, GridView).Caption = CType(sender, GridView).Rows.Count.ToString("N0") & " RESULTADOS <strong>TIPO E.C.O.: </strong>" & Request.QueryString("tipoeco").ToString _
            & "<br/><strong> DE LA: </strong>" & IIf(Request.QueryString("subdel").ToString.Equals("%"), "DELEGACIÓN", " SUBDELEGACIÓN " & Request.QueryString("subdel").ToString) _
            & "<br/><strong> CON TIPO DE NOTIFICACIÓN: </strong>" & Request.QueryString("tiponot").ToString _
            & "<br/><strong> DEL AÑO: </strong>" & Request.QueryString("anio").ToString _
            & IIf(Request.QueryString("mes").ToString.Equals("00"), "", "<strong> MES </strong>" & Request.QueryString("mes").ToString)
        'anio=2014&mes=00&tipoeco=COMP
    End Sub
End Class
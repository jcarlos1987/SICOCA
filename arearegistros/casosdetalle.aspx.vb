Public Class casosdetalle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewCasosDetalle_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCasosDetalle.PreRender
        GridViewCasosDetalle.Caption = "<strong>CASOS: </strong>" & GridViewCasosDetalle.Rows.Count.ToString("N0") _
            & "<br/><strong>RENGO: </strong>" & Request.QueryString("rango").ToString _
            & "<br/><strong>AVANCES: </strong>" & Request.QueryString("rangoavance").ToString
    End Sub
End Class
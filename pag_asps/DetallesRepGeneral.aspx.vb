Public Class DetallesRepGeneral
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("tipo").ToString.Equals("1") Then
            GridView1.DataSourceID = "reporteGeneralG1"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
            GridView1.DataSourceID = "reporteGeneralG1G2"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("3") Then
            GridView1.DataSourceID = "reporteGeneralG1G2G3"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("deudas") Then
            GridView1.DataSourceID = "reporteGeneralDeudas"
            GridView1.DataBind()
        ElseIf Request.QueryString("tipo").ToString.Equals("pagados") Then
            GridView1.DataSourceID = "reporteGeneralPagados"
            GridView1.DataBind()
        End If

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Resultados"
    End Sub
End Class
Imports CrystalDecisions.Shared

Public Class controldenotificador1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Buffer = False
        Response.Clear()
        SqlDataSourceContNotificador.DataBind()
        CrystalReportSourceContNotificador.DataBind()
        CrystalReportSourceContNotificador.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "9313-009-046_CONTROL_DE_TRABAJO_DEL_DESPACHO_DE_LA_DILIGENCIA" + ".pdf")
    End Sub

End Class
Imports CrystalDecisions.Shared

Public Class ceduladecapturaregistro1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Buffer = False
        Response.Clear()
        SqlDataSourceCedulaCaptura.DataBind()
        CrystalReportSourceCedulaCaptura.DataBind()
        If Request.QueryString("export").ToString.Equals("PDF") Then
            CrystalReportSourceCedulaCaptura.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "cedula" + ".pdf")
        ElseIf Request.QueryString("export").ToString.Equals("WORD") Then
            CrystalReportSourceCedulaCaptura.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, "cedula" + ".doc")
        Else
            CrystalReportSourceCedulaCaptura.ReportDocument.ExportToHttpResponse(ExportFormatType.Excel, Response, False, "cedula" + ".xls")
        End If
    End Sub

End Class
Imports CrystalDecisions.Shared

Public Class facturaCredImp2tipo
    Inherits System.Web.UI.Page
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Buffer = False
        Response.Clear()
        Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "ResivoFacCodBar" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".pdf"
        SqlDataSourceResivo.DataBind()
        CrystalReportSourceResivo.DataBind()
        CrystalReportSourceResivo.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, nomfileQR)
    End Sub

End Class
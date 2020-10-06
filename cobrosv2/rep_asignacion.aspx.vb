Imports CrystalDecisions.Shared

Public Class rep_asignacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            Dim nomfile As String = "D" & Session.Item("SIRECAid").ToString & Now.Hour.ToString & Now.Minute.ToString & Now.Second.ToString & Now.Millisecond.ToString
            Response.Buffer = False
            Response.Clear()
            SqlDataSource1.DataBind()
            CrystalReportSource1.DataBind()
            Me.CrystalReportSource1.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, nomfile + ".pdf")
        End If
    End Sub

End Class
﻿Imports CrystalDecisions.Shared

Public Class analisis1
    Inherits System.Web.UI.Page
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~\informesPDF\registros\analisis.aspx?" _
                          & "subdel=" & Request.QueryString("subdel").ToString _
                          & "&regpat=" & Request.QueryString("regpat").ToString _
                          & "&credmax=" & Request.QueryString("credmax").ToString _
                          & "&credcop=" & Request.QueryString("credcop").ToString _
                          & "&credrcv=" & Request.QueryString("credrcv").ToString _
                          & "&integrador=" & Request.QueryString("integrador").ToString _
                          & "&export=" & Request.QueryString("export").ToString _
                          & "&ralecop=" & Request.QueryString("ralecop").ToString _
                          & "&ralercv=" & Request.QueryString("ralercv").ToString _
                          & "")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Buffer = False
        Response.Clear()
        SqlDataSourceAnalisis.DataBind()
        CrystalReportSourceAnalisis.DataBind()
        If Request.QueryString("export").ToString.Equals("PDF") Then
            CrystalReportSourceAnalisis.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, Request.QueryString("regpat").ToString + "_Analisis" + ".pdf")
        Else
            CrystalReportSourceAnalisis.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, Request.QueryString("regpat").ToString + "_Analisis" + ".doc")
        End If
    End Sub

End Class
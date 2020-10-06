﻿Imports CrystalDecisions.Shared

Public Class dictamen_r31
    Inherits System.Web.UI.Page
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~\informesPDF\registros\dictamen_r3.aspx?" _
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
        SqlDataSourceDictamen.DataBind()
        CrystalReportSourceDictamen.DataBind()
        If Request.QueryString("export").ToString.Equals("PDF") Then
            CrystalReportSourceDictamen.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, Request.QueryString("regpat").ToString + "_Dictamen" + ".pdf")
        Else
            CrystalReportSourceDictamen.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, Request.QueryString("regpat").ToString + "_Dictamen" + ".doc")
        End If
    End Sub

End Class
﻿Imports System.IO

Public Class controlcedulasdetalle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count.ToString("N0") & " FOLIOS</strong>" _
            & "<br/><strong>Creados en la Fecha de: </strong>" & Request.QueryString("fechaini").ToString & "<strong> al </strong>" & Request.QueryString("fechafin").ToString
    End Sub

    Protected Sub LBExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExport.Click
        ExportToExcel("D" & Now.Day.ToString("D2") & Now.Month.ToString("D2") & Now.Year.ToString("D4"), GridView1)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal wControl As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        form.InnerHtml = "<strong>SUBDELEGACION: </strong>" & Request.QueryString("subdel").ToString _
            & "<br/><strong>TIPO DE CEDULA:</strong> " & Request.QueryString("tipocedula").ToString _
            & "<br/><strong>CEDULAS DEL </strong>" & Request.QueryString("fechaini").ToString & "<strong> AL </strong>" & Request.QueryString("fechafin").ToString & " "

        wControl.AllowSorting = False
        wControl.DataBind()
        form.Controls.Add(wControl)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default

        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub
End Class
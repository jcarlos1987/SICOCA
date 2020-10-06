Imports System.IO
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports System.Net

Public Class citatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pdfw As iTextSharp.text.pdf.PdfWriter
        Dim fuente As iTextSharp.text.pdf.BaseFont

        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
        PContenido.RenderControl(hw)
        Dim sr As New StringReader(sw.ToString())
        Dim pdfDoc As New Document(PageSize.LETTER, 30.0F, 30.0F, 30.0F, 30.0F)
        
        Dim htmlparser As New HTMLWorker(pdfDoc)
        Dim PDF_FileName As String = Server.MapPath("~") + "/temp/Panel.pdf"

        pdfw = PdfWriter.GetInstance(pdfDoc, New FileStream(PDF_FileName, FileMode.Create))
        
        pdfDoc.Open()
        '
        htmlparser.Parse(sr)
        Dim cb As PdfContentByte
        cb = pdfw.DirectContent
        fuente = FontFactory.GetFont(FontFactory.HELVETICA, iTextSharp.text.Font.DEFAULTSIZE, iTextSharp.text.Font.NORMAL).BaseFont
        cb.SetFontAndSize(fuente, 8)
        '

        pdfDoc.Close()

        Dim client As WebClient = New WebClient()
        Dim buffer As Byte() = client.DownloadData(Server.MapPath("~") + "/temp/Panel.pdf")
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", buffer.Length.ToString())
        Response.BinaryWrite(buffer)
    End Sub

End Class
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports System.Net
Imports iTextSharp.text.pdf
Imports System.Data.OleDb
Imports System.Globalization

Public Class CitatorioCOPRCV
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim urlLogo As String = ConfigurationSettings.AppSettings("urlLogoDoc")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAnombre") Is Nothing Then
            LabelSubdelegacion.Text = "SUBDELEGACION MERIDA"
            LabelOficina.Text = "OFICINA PARA COBROS MERIDA"
            'LabelDomicilio.Text = "DOMICILIO:"
        Else
            If Session.Item("SIRECAprintPaeDoc").ToString.Equals("1") Then
                ImageLogo.ImageUrl = urlLogo
                If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                    LabelSubdelegacion.Text = "SUBDELEGACION MERIDA NORTE"
                    LabelOficina.Text = "OFICINA PARA COBROS MERIDA NORTE"
                    'LabelDomicilio.Text = "DOMICILIO: CALLE 7 No. 131 POR 38 COL. PENSIONES"
                Else
                    LabelSubdelegacion.Text = "SUBDELEGACION MERIDA SUR"
                    LabelOficina.Text = "OFICINA PARA COBROS MERIDA SUR"
                    'LabelDomicilio.Text = "DOMICILIO: CALLE 131 S/N POR 42 SUR COL. SERAPIO RENDON"
                End If
            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If

        cargarDatosPatron()
        If Request.QueryString("tipo").ToString.IndexOf("COP") = -1 Then
        Else
            cargarDatosCop()
        End If
        If Request.QueryString("tipo").ToString.IndexOf("RCV") = -1 Then
        Else
            cargarDatosRcv()
        End If
        If LConsepto.Text.IndexOf("COP") = -1 Then
            LTipoCOP.Visible = False
            Table1.Visible = False
        End If
        If LConsepto.Text.IndexOf("RCV") = -1 Then
            LTipoRCV.Visible = False
            Table2.Visible = False
        End If
        crearPDF()
    End Sub
    Public Sub crearPDF()
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
        PanelContenido.Font.Size = 10
        PanelContenido.Font.Name = "Arial"
        PanelContenido.RenderControl(hw)
        Dim sr As New StringReader(sw.ToString())
        Dim pdfDoc As New Document(PageSize.LETTER, 30.0F, 30.0F, 20.0F, 30.0F)
        Dim htmlparser As New HTMLWorker(pdfDoc)
        Dim PDF_FileName As String = Server.MapPath("~") + "/temp/docPae/P" & Request.QueryString("regpat").ToString.Replace("-", "") & "Citatorio" & Session.Item("SIRECAid").ToString & Request.QueryString("tipo").ToString & ".pdf"

        '-------------------------------
        'Dim cb As PdfContentByte = New PdfContentByte(pdfwrite)
        'Dim fuente As BaseFont = FontFactory.GetFont(FontFactory.HELVETICA, Font.DEFAULTSIZE, Font.NORMAL).BaseFont
        'cb.SetFontAndSize(fuente, 8)
        '--------------------------------
        Dim pdfwrite As PdfWriter = PdfWriter.GetInstance(pdfDoc, New FileStream(PDF_FileName, FileMode.Create))
        pdfDoc.Open()
        htmlparser.Parse(sr)
        pdfDoc.Close()
        Response.Redirect("../temp/docPae/P" & Request.QueryString("regpat").ToString.Replace("-", "") & "Citatorio" & Session.Item("SIRECAid").ToString & Request.QueryString("tipo").ToString & ".pdf")
        'Dim client As WebClient = New WebClient()
        'Dim buffer As Byte() = client.DownloadData(Server.MapPath("~") + "/temp/docPae/Panel" & Request.QueryString("regpat").ToString.Replace("-", "") & "Citatorio" & Session.Item("SIRECAid").ToString & ".pdf")
        'Response.ContentType = "application/pdf"
        'Response.AddHeader("content-length", buffer.Length.ToString())
        'Response.BinaryWrite(buffer)
    End Sub
    Private Sub cargarDatosPatron()
        Try

            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT top 1 [razonSocial],[regpat],[act],[dom],case when len(loc)=40 then substring(loc,len(loc)-5,6) else '' end as cp,[sector],case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end as localidad "
            consulta += " FROM [sireca].[dbo].[patrones] "
            consulta += " where regpat=replace('" & Request.QueryString("regpat").ToString & "','-','') "

            catCMD2.CommandText = consulta
            nwindConn2.Open()

            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                LDeudor.Text = myReader2.GetValue(0)
                LRegPat.Text = myReader2.GetValue(1)
                LActividad.Text = myReader2.GetValue(2)
                LDomicilio.Text = myReader2.GetValue(3)
                LCodPostal.Text = myReader2.GetValue(4)
                LSector.Text = myReader2.GetValue(5)
                LLocalidad.Text = myReader2.GetValue(6)
            Loop

            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception

        End Try
    End Sub
    Private Sub cargarDatosCop()
        Try
            LConsepto.Text = ""
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT [NUMCRED],substring([PERIODO],4,7) as [PERIODO],[IMPORTE] FROM [sirecacobros].[dbo].[ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "] "
            consulta += " where regpatr='" & Request.QueryString("regpat").ToString & "' and [INC] in (" & Request.QueryString("incidencias").ToString & ") and [TIPO]='COP' "
            consulta += " order by convert(datetime,PERIODO,103) "

            catCMD2.CommandText = consulta
            nwindConn2.Open()

            Dim newRows As TableRow = New TableRow
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Dim filas As Int32 = 0
            Do While myReader2.Read()
                If filas = 0 Then
                    LConsepto.Text = "COP"
                End If
                For i As Integer = 0 To (myReader2.FieldCount - 1)
                    Dim cell As TableCell = New TableCell
                    If i = 2 Then
                        cell.HorizontalAlign = HorizontalAlign.Right
                        cell.Text = String.Format(New CultureInfo("es-MX"), "{0:N}", Convert.ToDouble(myReader2.GetValue(i).ToString))
                    Else
                        cell.HorizontalAlign = HorizontalAlign.Center
                        cell.Text = myReader2.GetValue(i).ToString
                    End If
                    newRows.Cells.Add(cell)
                Next
                filas = filas + 1
            Loop
            If (filas Mod 2) = 0 Then
            Else
                For i As Integer = 0 To 2
                    Dim cell As TableCell = New TableCell
                    cell.Text = ""
                    newRows.Cells.Add(cell)
                Next
            End If

            Table1.Rows.Add(newRows)
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception

        End Try
    End Sub
    Private Sub cargarDatosRcv()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT [NUMCRED],substring([PERIODO],4,7) as [PERIODO],[IMPORTE] FROM [sirecacobros].[dbo].[ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "] "
            consulta += " where regpatr='" & Request.QueryString("regpat").ToString & "' and [INC] in (" & Request.QueryString("incidencias").ToString & ") and [TIPO]='RCV' "
            consulta += " order by convert(datetime,PERIODO,103) "

            catCMD2.CommandText = consulta
            nwindConn2.Open()

            Dim newRows As TableRow = New TableRow
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Dim filas As Int32 = 0
            Do While myReader2.Read()
                If filas = 0 Then
                    If LConsepto.Text.Equals("") Then
                        LConsepto.Text = "RCV"
                    Else
                        LConsepto.Text = "COP y RCV"
                    End If
                End If
                For i As Integer = 0 To (myReader2.FieldCount - 1)
                    Dim cell As TableCell = New TableCell
                    If i = 2 Then
                        cell.HorizontalAlign = HorizontalAlign.Right
                        cell.Text = String.Format(New CultureInfo("es-MX"), "{0:N}", Convert.ToDouble(myReader2.GetValue(i).ToString))
                    Else
                        cell.HorizontalAlign = HorizontalAlign.Center
                        cell.Text = myReader2.GetValue(i).ToString
                    End If
                    newRows.Cells.Add(cell)
                Next
                filas = filas + 1
            Loop
            If (filas Mod 2) = 0 Then
            Else
                For i As Integer = 0 To 2
                    Dim cell As TableCell = New TableCell
                    cell.Text = ""
                    newRows.Cells.Add(cell)
                Next
            End If

            Table2.Rows.Add(newRows)
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception

        End Try
    End Sub
End Class
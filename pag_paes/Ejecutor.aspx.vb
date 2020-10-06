Imports System.Globalization
Imports System.Net
Imports System.IO
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports System.Data.OleDb

Public Class Ejecutor2
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Try
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If ((Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAchmod1").ToString.Equals("x")) Then
                Dim pae As String = ""
                If Session.Item("SIRECAuserPae1").ToString.Equals("1") Then
                    pae += "'1',"
                End If
                If Session.Item("SIRECAuserPae2").ToString.Equals("1") Then
                    pae += "'2',"
                End If
                If Session.Item("SIRECAuserPae3").ToString.Equals("1") Then
                    pae += "'3',"
                End If
                SqlDataSourceP1.SelectCommand = SqlDataSourceP1.SelectCommand.Replace("--clasificacion", " and clasificacion in (" & pae & "'4') ")
                GridView1.DataBind()
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
        'Catch ex As Exception
        'End Try
        'Dim mi1 As MenuItem = New MenuItem("mi1")
        'mi1.NavigateUrl = ""
        'mi1.Text = "PAE RESIENTE"
        'mi1.Value = mi1.Text
        'Dim mi2 As MenuItem = New MenuItem("mi2")
        'mi2.NavigateUrl = ""
        'mi2.Text = "PAE RESIENTE CON MAS PAES"
        'mi2.Value = mi2.Text

        'Menu1.Items.Add(mi1)
        'Menu1.Items.Add(mi2)        
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        'GridView1.Caption = GridView1.Rows.Count & " Patrones"
        Try
            GridView1.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                'GridView7.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView7.FooterRow.Cells(0).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(5).Text = Convert.ToDouble(GridView1.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(5).Text))
            Try
                'GridView1.Caption = "Factura(s) Actual(es): " & GridView1.Rows.Count
                If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                    HFOrigen.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                    HFDestino.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                    HFOrigen.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                    HFDestino.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                End If
                HiddenField1.Value = "var "
                For i As Int16 = 0 To (GridView1.Rows.Count - 1)
                    HiddenField1.Value += "marker = createMarker('" & GridView1.Rows(i).Cells(3).Text & "',new google.maps.LatLng(" & GridView1.Rows(i).Cells(6).Text & "," & GridView1.Rows(i).Cells(7).Text & "));"
                    'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"
                Next
            Catch ex As Exception
            End Try
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        Dim fecha As String = DDLFecha.SelectedValue
        Dim fechaRec As String = Year(Convert.ToDateTime(fecha)) & "-" & Month(Convert.ToDateTime(fecha)) & "-" & Day(Convert.ToDateTime(fecha))
        Response.Redirect("ReporteDelEjecutor.aspx?idEjecutor=" & Session.Item("SIRECAid").ToString & "&fechaCap=" & fechaRec)
    End Sub

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        Try
            Dim fecha As String = DDLFecha.SelectedValue
            Dim fechaRec As String = Year(Convert.ToDateTime(fecha)) & "-" & Month(Convert.ToDateTime(fecha)) & "-" & Day(Convert.ToDateTime(fecha))
            Dim mywebReq As WebRequest
            Dim mywebResp As WebResponse
            Dim sr As StreamReader
            Dim strHTML As String
            Dim sw As StreamWriter
            Dim urlpdf As String = "http://localhost:10414/pag_paes/ReporteDelEjecutorPDF.aspx?idEjecutor=" & Session.Item("SIRECAid").ToString & "&fechaCap=" & fechaRec & "&subdel=" & Session.Item("SIRECAsubdel").ToString
            'MsgBox(urlpdf)
            mywebReq = WebRequest.Create(urlpdf.ToString)
            'MsgBox(mywebReq.GetResponse())
            mywebResp = mywebReq.GetResponse()
            sr = New StreamReader(mywebResp.GetResponseStream)
            strHTML = sr.ReadToEnd
            sw = File.CreateText(Server.MapPath("temp" & Session.Item("SIRECAid").ToString & ".html"))
            sw.WriteLine(strHTML)
            sw.Close()
            Dim reader As StreamReader = New StreamReader(Server.MapPath("temp" & Session.Item("SIRECAid").ToString & ".html"))
            Dim line As String = reader.ReadToEnd()
            Text2PDF(line)
        Catch ex As Exception
            ''MsgBox(ex.ToString)
            Text2PDF(ex.ToString)
        End Try
    End Sub

    Protected Sub Text2PDF(ByVal PDFText As String)
        Dim reader As StringReader = New StringReader(PDFText)
        Dim document = New iTextSharp.text.Document(PageSize.LETTER)
        Dim parser As HTMLWorker = New HTMLWorker(document)

        Dim PDF_FileName As String = Server.MapPath("~") + "/temp/PDF_File" & Session.Item("SIRECAid").ToString & ".pdf"
        PdfWriter.GetInstance(document, New FileStream(PDF_FileName, FileMode.Create))
        document.Open()

        Try
            parser.Parse(reader)
        Catch ex As Exception
            Dim paragraph As Paragraph = New Paragraph("Error!" + ex.Message + " >>>>> " + ex.StackTrace)
            Dim text As Chunk = paragraph.Chunks(0)
            If (text IsNot DBNull.Value) Then
                text.Font.Color = BaseColor.RED
            End If
            document.Add(paragraph)
        End Try
        Try

        Finally
            document.Close()
            DownLoadPdf(PDF_FileName)
        End Try
    End Sub
    Private Sub DownLoadPdf(ByVal PDF_FileName As String)
        Dim client As WebClient = New WebClient()
        Dim buffer As Byte() = client.DownloadData(PDF_FileName)
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", buffer.Length.ToString())
        Response.BinaryWrite(buffer)
    End Sub

    Protected Sub BComentar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BComentar.Click
        LError.Text = ""
        If TBObservacion.Text.Replace(" ", "").Length > 1 Then
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaObservaciones].[dbo].[ObservacionInspector]([id_inspector],[id_observo],[fecha_observacion],[observacion],[ip_host]) "
            myInsertQuery22 += " VALUES(?,?,getdate(),?,?) "
            cmd22.CommandText = myInsertQuery22

            cmd22.Parameters.Add("@id_inspector", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@id_observo", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = TBObservacion.Text
            cmd22.Parameters.Add("@ip_host", OleDbType.VarChar).Value = Request.UserHostAddress()

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LError.Text = "Error al Comentar"
            Else
                GVObservacion.DataBind()
            End If
            con22.Close()
        End If
    End Sub
End Class
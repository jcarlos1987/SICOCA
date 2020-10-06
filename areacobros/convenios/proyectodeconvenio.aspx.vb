Imports System.IO

Public Class proyectodeconvenio
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LBCalcularConvenio_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCalcularConvenio.Click
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            GridViewGCOP.DataBind()
            DetailsViewCOP.DataBind()
            DetailsViewMultas.DataBind()
            DetailsViewRCV.DataBind()
            crearTablaAmortizacionImssConvenios()
        End If
    End Sub

    Private Sub crearTablaAmortizacionImssConvenios()
        Try
        Dim importeConvenir As Double = CDbl(If(IsNumeric(DetailsViewCOP.Rows(1).Cells(1).Text.Replace("$", "")), DetailsViewCOP.Rows(1).Cells(1).Text.Replace("$", ""), 0))
        Dim importeMensual As Double = CDbl(If(IsNumeric(DetailsViewCOP.Rows(4).Cells(1).Text.Replace("$", "")), DetailsViewCOP.Rows(4).Cells(1).Text.Replace("$", ""), 0))
        Dim importeTasaRangMen As Double = CDbl(If(IsNumeric(DetailsViewCOP.Rows(4).Cells(1).Text.Replace("$", "")), DetailsViewCOP.Rows(3).Cells(1).Text.Replace("$", ""), 0))
        Dim importeSaldoInsolutoFinal As Double = 0
        Dim fechaPrimerPAgo As Date = CDate(If(IsDate(TBFechPrimerPago.Text), TBFechPrimerPago.Text, Now.ToShortDateString))
        If IsNumeric(TBMesesPagoCop.Text) Then
            For i As Int16 = 0 To (CInt(TBMesesPagoCop.Text) - 1)
                'No.------------------------------------------------
                Dim nuevaFila As TableRow = New TableRow
                Dim nuevaColumna As TableCell = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                nuevaColumna.Text = CStr(i + 1)
                nuevaFila.Cells.Add(nuevaColumna)
                'Fecha Programada------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                nuevaColumna.Text = DateAdd(DateInterval.Month, i, fechaPrimerPAgo).ToString("d")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Saldo Insoluto Inicial------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                If importeSaldoInsolutoFinal <> 0 Then
                    importeConvenir = importeSaldoInsolutoFinal
                End If
                nuevaColumna.Text = importeConvenir.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Mensualidad------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                nuevaColumna.Text = importeMensual.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Monto de Pago a Realizar------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                nuevaColumna.Text = importeMensual.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Monto de Amortización a Capital------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                Dim importeAmortizacion As Double = importeMensual - (importeConvenir * importeTasaRangMen / 100)
                nuevaColumna.Text = importeAmortizacion.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Monto de Recargos por Prorroga------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                Dim importeProrroga As Double = importeConvenir * importeTasaRangMen / 100
                nuevaColumna.Text = importeProrroga.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Saldo Insoluto Final------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                importeSaldoInsolutoFinal = CDbl((importeConvenir - importeAmortizacion).ToString("F"))
                nuevaColumna.Text = (importeSaldoInsolutoFinal).ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Fecha Real de Pago------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                nuevaColumna.Text = ""
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Actualización por Pago Extemporaneo------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                Dim importeExtemporaneo As Double = 0
                nuevaColumna.Text = importeExtemporaneo.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Monto de Recargos por Mora------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Right
                Dim importeMora As Double = 0
                nuevaColumna.Text = importeMora.ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
                'Monto Total del Pago a Realizar------------------------------------------------
                nuevaColumna = New TableCell
                nuevaColumna.HorizontalAlign = HorizontalAlign.Center
                nuevaColumna.Text = (importeMensual + importeMora + importeExtemporaneo).ToString("C")
                nuevaFila.Cells.Add(nuevaColumna)
                TableImssConvenios.Rows.Add(nuevaFila)
            Next
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewContFile_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewContFile.PreRender
        GridViewContFile.Caption = GridViewContFile.Rows.Count.ToString + " CREDITOS, <strong>CONTENIDO DE LOS ARCHIVOS DE ADEUDO CARGADOS EL " + Now.ToShortDateString + "</strong>"
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        form.Controls.Add(RepeaterDatos)
        form.Controls.Add(DetailsViewCOP)
        form.Controls.Add(DetailsViewMultas)
        form.Controls.Add(DetailsViewRCV)
        crearTablaAmortizacionImssConvenios()
        form.Controls.Add(TableImssConvenios)
        form.Controls.Add(GridViewGCOP)
        form.Controls.Add(GridViewContFile)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & Now.ToShortDateString.Replace("/", "") & Now.Hour.ToString("D2") & Now.Minute.ToString("D2") & Now.Second.ToString("D6") & Now.Millisecond.ToString("D6") & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub
End Class
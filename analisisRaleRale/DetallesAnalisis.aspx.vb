Imports System.IO
Imports System.Globalization

Public Class DetallesAnalisis
    Inherits System.Web.UI.Page
    Dim verde As String = ConfigurationSettings.AppSettings("verde")
    Dim amarillo As String = ConfigurationSettings.AppSettings("amarillo")
    Dim rojo As String = ConfigurationSettings.AppSettings("rojo")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECA2chmod7").ToString.Equals("ARR") Then
                'validar tipo de resultado rale_inc o rale inc_actual
                If Request.QueryString("incRale").Equals("rale_actual") Then
                    'incRaleBase=NO%20SE%20ENCUENTRA(RALE%20COMPARATIVO)
                    If Request.QueryString("incRaleBase").Equals("NO SE ENCUENTRA(RALE COMPARATIVO)") Then
                        SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("where [RALE_INC]=", "where [INC_ACTUAL] is null")
                        SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("?", "")
                    Else
                        SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("where [RALE_INC]=", "where [INC_ACTUAL] is not null and [INC_ACTUAL]=")
                    End If
                ElseIf Request.QueryString("incRale").Equals("rale_inc") Then
                    SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("where [RALE_INC]=", "where [RALE_INC] is not null and [RALE_INC]=")
                Else
                    SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("where [RALE_INC]=", "where [RALE_INC]='" & Request.QueryString("rale_inc").ToString & "' and [INC_ACTUAL]='" & Request.QueryString("inc_actual").ToString & "'")
                    SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("?", "")
                End If
                'GridView1.DataBind()
                '-------------------------------------------------------------------------------------------------------
                SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("ANALISIS_INCIDENCIAS", "ANALISIS_INCIDENCIAS" & Request.UserHostAddress.Replace(".", "_"))


                If Request.QueryString("incRaleAct").ToString.Equals("NO SE ENCUENTRA(RALE COMPARATIVO)") Then
                    SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("--and [INC_ACTUAL]", " and [INC_ACTUAL] is null ")
                    'GridView1.DataBind()
                ElseIf (Request.QueryString("incRaleAct").ToString.Equals("T")) Then

                Else
                    SqlDataSourceDetallesRaleAct.SelectCommand = SqlDataSourceDetallesRaleAct.SelectCommand.Replace("--and [INC_ACTUAL]", " and [INC_ACTUAL]='" & Request.QueryString("incRaleAct").Split("_").GetValue(0) & "' ")
                    'GridView1.DataBind()
                End If
                GridView1.DataBind()
            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.Caption = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("patrones"))) & " PATRONES  |  " & String.Format(New CultureInfo("es-MX"), "{0:N0}", GridView1.Rows.Count) & " CREDITO(S)  |  " & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("cot"))) & " COTIZANTE(S)  |  IMPORTE TOTAL DE " & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("imp")))
            colorizar()
            'MsgBox(GridView1.Rows(0).Cells(4).Text)
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try

    End Sub
    Private Sub colorizar()
        For index As Integer = 0 To (GridView1.Rows.Count - 1)
            'MsgBox(Month(Convert.ToDateTime("1/" & GridView1.Rows(index).Cells(4).Text)))
            'Now.Month
            If (Now.Month - Month(Convert.ToDateTime("1/" & GridView1.Rows(index).Cells(4).Text))) = 2 Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(amarillo)
            ElseIf (Now.Month - Month(Convert.ToDateTime("1/" & GridView1.Rows(index).Cells(4).Text))) > 2 Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(rojo)
            End If
        Next
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        ExportToExcel("ARR_" & Request.QueryString("incRaleAct").ToString)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        GridView1.AllowSorting = False
        GridView1.DataBind()
        form.Controls.Add(GridView1)

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
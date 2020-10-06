Imports System.IO

Public Class detallesSeleccionReporteGeneral
    Inherits System.Web.UI.Page
    Dim rutasPatrones As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAuser_type").ToString.Equals("0")) And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Dim consulta As String = " SELECT "
                consulta += "     substring([EMIP_PATRON],2,10) as [REG PATRONAL]"
                consulta += "     ,[EMIP_NOM_PATRON] as [RAZON SOCIAL]"
                consulta += "     ,[EMIP_NUM_TRAB_COT] as [COTIZANTES]"
                consulta += " 	  ,[pagos] as [PAGO]"
                consulta += "     ,[fecha] as [FECHA DE PAGO]"
                consulta += "     ,[emision] as [EMISION]"
                consulta += " 	  ,[PAGADO POR] as [PAGADO POR]"
                consulta += "     ,[tipodepago] as [PAGO A]"
                consulta += "     ,[lat] as [lat]"
                consulta += "     ,[lng] as [lng]"
                consulta += "     ,[EMIP_SEC] as [sector]"
                consulta += "   FROM [sireca].[dbo].[" & Request.QueryString("ema").ToString & "]"
                If Request.QueryString("busqueda").ToString.Equals("DETALLE") Then
                    If Request.QueryString("tipodepago").ToString.Equals("") Then
                        consulta += "   WHERE [tipodepago] is null"
                    Else
                        consulta += "   WHERE [tipodepago] = '" & Request.QueryString("tipodepago").ToString & "'"
                    End If
                End If

                SqlDataSourceEma.SelectCommand = consulta
                SqlDataSourceEma.DataBind()
                GVEma.DataBind()
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
    Function markers() As String
        Dim mkrs As String = " "
        Try
            mkrs = "var "
            For i As Int16 = 0 To (GVEma.Rows.Count - 1)
                mkrs += " marker = createMarker('" & GVEma.Rows(i).Cells(1).Text.Replace("-", "") & "-" & GVEma.Rows(i).Cells(2).Text & "',new google.maps.LatLng(" & GVEma.Rows(i).Cells(10).Text & "," & GVEma.Rows(i).Cells(11).Text & ",'icon/sector" & GVEma.Rows(i).Cells(9).Text & ".png'));"
            Next
        Catch ex As Exception

        End Try
        Return mkrs
    End Function
    Protected Sub GVEma_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVEma.PreRender
        Try
        If Request.QueryString("busqueda").ToString.Equals("DETALLE") Then
            GVEma.Caption = GVEma.Rows.Count & " PATRONES CON PAGO A " & Request.QueryString("tipodepago").ToString
        Else
            GVEma.Caption = GVEma.Rows.Count & " PATRONES"
        End If
            HiddenField1.Value = "var "
            For i As Int16 = 0 To (GVEma.Rows.Count - 1)
                HiddenField1.Value += " marker = createMarker('" & GVEma.Rows(i).Cells(1).Text.Replace("-", "").ToString & "-" & GVEma.Rows(i).Cells(2).Text.ToString & "',new google.maps.LatLng(" & GVEma.Rows(i).Cells(10).Text.ToString & "," & GVEma.Rows(i).Cells(11).Text.ToString & ",'icon/sector" & GVEma.Rows(i).Cells(9).Text.ToString & ".png'));"
                HiddenField1.Value = HiddenField1.Value.Replace("&", " ")
                HiddenField1.Value = HiddenField1.Value.Replace("#", " ")
            Next
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ExportToExcel(ByVal nameReport As String, ByVal gv As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        form.Controls.Add(gv)

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

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        GVEma.AllowSorting = False
        GVEma.DataBind()
        ExportToExcel(GVEma.Caption.ToString, GVEma)
    End Sub
End Class
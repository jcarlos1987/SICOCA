Imports System.IO

Public Class detallesSeleccionDeven
    Inherits System.Web.UI.Page
    Dim rutasPatrones As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAuser_type").ToString.Equals("0")) And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Dim consulta As String = " SELECT [ESTADO]"
                consulta += "       ,[PATRONES]"
                consulta += "       ,[PAGADO POR]"
                consulta += "       ,[INCIDENCIA]"
                consulta += "       ,[REGPATR]"
                consulta += "       ,[IMPORTE]"
                consulta += "       ,[NUMCRED]"
                consulta += "       ,(SELECT '('+rd.[docto]+')'+rd.[descripcion] FROM [sireca].[dbo].[doc_rale] as rd where rd.[docto]=[TD]) as [TD]"
                consulta += "       ,(SELECT '('+sr.[inc]+')'+sr.[descripcion] FROM [sireca].[dbo].[inc_rale] as sr where sr.[inc]=tp.[INC]) as [INC]"
                consulta += "       ,[FEINC]"
                consulta += "       ,[COTIZANTES]"
                consulta += "       ,[PAGO]"
                consulta += "       ,[FECHA DE PAGO]"
                consulta += "       ,[RAZON SOCIAL]"
                consulta += "       ,[PAGO A]"
                consulta += "       ,[rale]"
                consulta += "       ,[subdel]"
                consulta += "       ,[periodo]"
                consulta += "       ,[anio]"
                consulta += "       ,[mes]"
                consulta += "       ,[lat]"
                consulta += "       ,[lng]"
                consulta += "   FROM [sireca].[dbo].[TEMPDEBEN" & Request.UserHostName.Replace(".", "_") & "] as tp"
                If Request.QueryString("tipo").ToString.Equals("DEBEN") Then
                    consulta += " where [ESTADO]='" & Request.QueryString("estado").ToString & "'"
                ElseIf Request.QueryString("tipo").ToString.Equals("DDEBEN") Then
                    If Request.QueryString("incidencia").ToString.Equals("") Then
                        consulta += " where [INCIDENCIA] is null"
                    Else
                        consulta += " where [INCIDENCIA]='" & Request.QueryString("incidencia").ToString & "'"
                    End If

                End If
                SqlDataSourceDeben.SelectCommand = consulta
                SqlDataSourceDeben.DataBind()
                GVDeven.DataBind()
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub GVDeven_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVDeven.PreRender
        If Request.QueryString("tipo").ToString.Equals("DEBEN") Then
            GVDeven.Caption = GVDeven.Rows.Count & " PATRONES QUE DEBEN " & Request.QueryString("estado").ToString
        ElseIf Request.QueryString("tipo").ToString.Equals("DDEBEN") Then
            GVDeven.Caption = GVDeven.Rows.Count & " PATRONES QUE DEBEN, ESTADO EN SIRECA: " & Request.QueryString("incidencia").ToString
        End If

        'Dim periodo As String = ""
        'Dim mes As String = ""
        'Dim anio As String = ""
        'Dim registroPatronal As String = ""
        'For fila As Int16 = 0 To (GVDeven.Rows.Count - 1)
        'registroPatronal = GVDeven.Rows(fila).Cells(1).Text
        'If Request.QueryString("mes").ToString.Length = 1 Then
        'mes = "0" & Request.QueryString("mes").ToString
        'Else
        'mes = Request.QueryString("mes").ToString
        'End If
        'anio = Request.QueryString("anio").ToString.Substring(2, 2)
        'Dim hl As HyperLink = GVDeven.Rows(fila).FindControl("HyperLink1")
        'hl.NavigateUrl = "http://11.200.24.211/emamovil/accionSIRECA.asp?menu=&periodo=" & mes & "&anio=" & anio & "&del=" & Request.QueryString("subdel").ToString & "&srch=p&asg=" & registroPatronal
        'Next
        HiddenField1.Value = "var "
        For i As Int16 = 0 To (GVDeven.Rows.Count - 1)
            HiddenField1.Value += "marker = createMarker('" & GVDeven.Rows(i).Cells(1).Text.Replace("-", "") & "-" & GVDeven.Rows(i).Cells(2).Text & "',new google.maps.LatLng(" & GVDeven.Rows(i).Cells(15).Text & "," & GVDeven.Rows(i).Cells(16).Text & "));"
            HiddenField1.Value = HiddenField1.Value.Replace("&", " ")
            HiddenField1.Value = HiddenField1.Value.Replace("#", " ")
            'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"
        Next
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        GVDeven.AllowSorting = False
        GVDeven.DataBind()
        ExportToExcel(GVDeven.Caption.ToString, GVDeven)
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
End Class
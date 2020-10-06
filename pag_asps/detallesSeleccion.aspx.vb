Imports System.IO

Public Class detallesSeleccion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                Try
                    If Request.QueryString("tipo").ToString.Equals("asignadas") Then
                        GridView5.DataSourceID = "SqlDataSourceDSSAsig"
                        GridView5.DataBind()
                    ElseIf Request.QueryString("tipo").ToString.Equals("faltantes") Then
                        GridView5.DataSourceID = "SqlDataSourceDSSFal"
                        GridView5.DataBind()
                    ElseIf Request.QueryString("tipo").ToString.Equals("sin_incidencia") Then
                        GridView5.DataSourceID = "SqlDataSourceDSSSInci"
                        GridView5.DataBind()
                    ElseIf Request.QueryString("tipo").ToString.Equals("NOT") Then
                        If Request.QueryString("tipo2").ToString.Equals("casos") Then
                            GridView5.DataSourceID = "SqlDataSourceDSSNCasos"
                            GridView5.DataBind()
                        ElseIf Request.QueryString("tipo2").ToString.Equals("sin_incidencia") Then
                            GridView5.DataSourceID = "SqlDataSourceDSSNSIncidencia"
                            GridView5.DataBind()
                        Else
                            GridView5.DataSourceID = "SqlDataSourceDSSN"
                            GridView5.DataBind()
                        End If
                    ElseIf Request.QueryString("tipo").ToString.Equals("PAE") Then
                        If Request.QueryString("tipo2").ToString.Equals("all") Then
                            GridView5.DataSourceID = "SqlDataSourceNotificadosAll"
                            GridView5.DataBind()
                        Else
                            GridView5.DataSourceID = "SqlDataSourceNotificados"
                            GridView5.DataBind()
                        End If
                    ElseIf Request.QueryString("tipo").ToString.Equals("INCIDENCIA") Then
                        If Request.QueryString("tipo2").ToString.Equals("") Then
                            GridView5.DataSourceID = "SqlDataSourceIncidenciaNULA"
                            GridView5.DataBind()
                        Else
                            GridView5.DataSourceID = "SqlDataSourceIncidenciaAll"
                            GridView5.DataBind()
                        End If
                    ElseIf Request.QueryString("tipo").ToString.Equals("INCIDENCIAGENERAL") Then
                        If Request.QueryString("tipo2").ToString.Equals("NO LOCALIZADOS") Then
                            GridView5.DataSourceID = "SqlDataSourceNLG"
                            GridView5.DataBind()
                        ElseIf Request.QueryString("tipo2").ToString.Equals("AUTODETERMINADO") Then
                            GridView5.DataSourceID = "SqlDataSourceAG"
                            GridView5.DataBind()
                        ElseIf Request.QueryString("tipo2").ToString.Equals("PAGADO") Then
                            GridView5.DataSourceID = "SqlDataSourcePG"
                            GridView5.DataBind()
                        ElseIf Request.QueryString("tipo2").ToString.Equals("POR COBRAR") Then
                            GridView5.DataSourceID = "SqlDataSourcePCG"
                            GridView5.DataBind()
                        ElseIf Request.QueryString("tipo2").ToString.Equals("BAJA DEFINITIVA") Then
                            GridView5.DataSourceID = "SqlDataSourceBDG"
                            GridView5.DataBind()
                        End If
                    ElseIf Request.QueryString("tipo").ToString.Equals("TODO") Then
                        GridView5.DataSourceID = "SqlDataSourceTG"
                        GridView5.DataBind()
                    Else
                        GridView5.DataSourceID = "SqlDataSourceDetallesSeleccion"
                        GridView5.DataBind()
                    End If
                Catch ex As Exception
                    'MsgBox(ex.StackTrace)
                    'MsgBox(ex.Message)
                End Try
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView5_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView5.PreRender
        If Request.QueryString("title") Is Nothing Then
            GridView5.Caption = "Encontrado(s) " & GridView5.Rows.Count
        Else
            GridView5.Caption = "Encontrado(s) " & GridView5.Rows.Count & " - " & Request.QueryString("title").ToString & "'s"            
        End If
        Dim periodo As String = ""
        Dim mes As String = ""
        Dim anio As String = ""
        Dim registroPatronal As String = ""
        For fila As Int16 = 0 To (GridView5.Rows.Count - 1)
            registroPatronal = GridView5.Rows(fila).Cells(7).Text
            periodo = GridView5.Rows(fila).Cells(2).Text
            If periodo.Length = 5 Then
                mes = "0" & periodo.Substring(0, 1)
                anio = periodo.Substring(3, 2)
            Else
                mes = periodo.Substring(0, 2)
                anio = periodo.Substring(4, 2)
            End If

            Dim hl As HyperLink = GridView5.Rows(fila).FindControl("HyperLink1")
            hl.NavigateUrl = "http://11.200.24.211/emamovil/accionSIRECA.asp?menu=&periodo=" & mes & "&anio=" & anio & "&del=" & Session.Item("SIRECAsubdel").ToString & "&srch=p&asg=" & registroPatronal
        Next
        Try
            'GridView5.Caption = "Factura(s) Actual(es): " & GridView5.Rows.Count
            'HiddenField1.Value = ""
            'For i As Int16 = 0 To (GridView5.Rows.Count - 1)
            'GridView5.Rows(i).Cells(8).Visible = True
            'GridView5.Rows(i).Cells(9).Visible = True
            'HiddenField1.Value += "place['" & GridView5.Rows(i).Cells(4).Text & "'] = new google.maps.LatLng(" & GridView5.Rows(i).Cells(19).Text & "," & GridView5.Rows(i).Cells(20).Text & ");"
            'GridView5.Rows(i).Cells(8).Visible = False
            'GridView5.Rows(i).Cells(9).Visible = False
            'Next
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
        GridView5.AllowSorting = False
        GridView5.DataBind()
        ExportToExcel(GridView5.Caption.ToString, GridView5)
    End Sub
End Class
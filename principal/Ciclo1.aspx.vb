Imports System.Data.OleDb
Imports System.IO
Imports System.Globalization
Imports addHistorialAcciones

Public Class Ciclo1
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim histAcciones As HistorialWeb = New HistorialWeb
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error, Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -1, Now)) - 1)
    End Sub

    Protected Sub DDLReporte_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLReporte.SelectedIndexChanged
        MultiViewReportes.ActiveViewIndex = DDLReporte.SelectedIndex
    End Sub

    Protected Sub DDLInspector_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.SelectedIndexChanged
        histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", "Consulta", DDLAnio.SelectedValue, DDLMes.SelectedValue, DDLInspector.SelectedItem.Text, "regpat", Request.UserHostAddress)
        If IO.File.Exists(Server.MapPath("~") & "/imagenes/usuarios/avatar/" & DDLInspector.SelectedValue & ".jpg") Then
            IBFoto.ImageUrl = "~/imagenes/usuarios/avatar/" & DDLInspector.SelectedValue & ".jpg"
        Else
            IBFoto.ImageUrl = "~/imagenes/usuarios/avatar/usuarioSireca.jpg"
        End If
    End Sub


    Protected Sub BActualizarInspector_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarInspector.Click
        If DDLReporte.SelectedIndex.Equals("1") Then
            histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard1.ActiveStep.Name, "regpat", Request.UserHostAddress)
            Wizard1.DataBind()
        Else
            histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard2.ActiveStep.Name, "regpat", Request.UserHostAddress)
            Wizard2.DataBind()
        End If
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If IO.File.Exists(Server.MapPath("~") & "/imagenes/usuarios/avatar/" & DDLInspector.SelectedValue & ".jpg") Then
            IBFoto.ImageUrl = "~/imagenes/usuarios/avatar/" & DDLInspector.SelectedValue & ".jpg"
        Else
            IBFoto.ImageUrl = "~/imagenes/usuarios/avatar/usuarioSireca.jpg"
        End If
        Wizard2.DataBind()
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

            cmd22.Parameters.Add("@id_inspector", OleDbType.VarChar).Value = DDLInspector.SelectedValue
            cmd22.Parameters.Add("@id_observo", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = TBObservacion.Text
            cmd22.Parameters.Add("@ip_host", OleDbType.VarChar).Value = Request.UserHostAddress()

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LError.Text = "Error al Comentar"
            Else
                histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", "Observacion", DDLAnio.SelectedValue, DDLMes.SelectedValue, DDLInspector.SelectedItem.Text, "regpat", Request.UserHostAddress)
                Repeater1.DataBind()
            End If
            con22.Close()
        End If
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

    Protected Sub DVInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DVInspector.PreRender
        If DVInspector.Rows.Count = 0 Then
            PObservaciones.Visible = False
        Else
            PObservaciones.Visible = True
        End If
    End Sub


    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Wizard1.ActiveStepChanged
        histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard1.ActiveStep.Name, "regpat", Request.UserHostAddress)
        If Wizard1.ActiveStep.Name.Equals("GENERAL") Then
            GVRGPorPatron.DataBind()
            GVRGeneral.DataBind()
            Chart1.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("GRUPOS") Then
            GVGIncidencias.DataBind()
            Chart6.DataBind()
            GVRGGrupoIncidencia.DataBind()
            Chart4.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("INCIDENCIAS") Then
            GVRIncidencia.DataBind()
            Chart7.DataBind()
            GVRGIncidencias.DataBind()
            Chart5.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("RECAUDACION") Then
            GVRecaudacion.DataBind()
            Chart10.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("PENDIENTES") Then
            GridViewRCuatriOri.DataBind()
            GridViewCuatriSaldo0.DataBind()
            GridViewCuatriSaldo.DataBind()
            GridViewCuatriSaldo1.DataBind()
        End If
    End Sub

    Protected Sub Wizard2_ActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Wizard2.ActiveStepChanged
        histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard2.ActiveStep.Name, "regpat", Request.UserHostAddress)
    End Sub

    Protected Sub GridViewRCuatriOri_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRCuatriOri.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(2).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(3).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(4).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewRCuatriOri.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewRCuatriOri.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewRCuatriOri.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewRCuatriOri.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(2).Text))
            GridViewRCuatriOri.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(3).Text))
            GridViewRCuatriOri.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(4).Text))
            GridViewRCuatriOri.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewCuatriSaldo_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCuatriSaldo.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(2).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(3).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(4).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCuatriSaldo.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewCuatriSaldo.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewCuatriSaldo.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewCuatriSaldo.Rows(i).Cells(2).FindControl("LBCuatriSaldo"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCuatriSaldo.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCuatriSaldo.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCuatriSaldo.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewCuatriSaldo.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(2).Text))
            GridViewCuatriSaldo.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text))
            GridViewCuatriSaldo.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(4).Text))
            GridViewCuatriSaldo.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(5).Text))
            '--------------------------------------------------
            'For i As Int16 = 0 To (GridViewCuatriSaldo0.Rows.Count - 1)
            '    GridViewCuatriSaldo0.Rows(i).Cells(0).Text = IIf(GridViewRCuatriOri.Rows(i).Cells(0).Text.Equals(GridViewCuatriSaldo.Rows(i).Cells(0).Text), GridViewCuatriSaldo.Rows(i).Cells(0).Text, "VERIFIQUE LOS DATOS")
            '    GridViewCuatriSaldo0.Rows(i).Cells(1).Text = IIf(GridViewRCuatriOri.Rows(i).Cells(1).Text.Equals(GridViewCuatriSaldo.Rows(i).Cells(1).Text), GridViewCuatriSaldo.Rows(i).Cells(1).Text, "VERIFIQUE LOS DATOS")
            '    GridViewCuatriSaldo0.Rows(i).Cells(2).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(2).Text) - CDbl(CType(GridViewCuatriSaldo.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text)).ToString("N0")
            '    GridViewCuatriSaldo0.Rows(i).Cells(3).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(3).Text) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(3).Text)).ToString("N0")
            '    GridViewCuatriSaldo0.Rows(i).Cells(4).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(4).Text) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(4).Text)).ToString("N0")
            '    GridViewCuatriSaldo0.Rows(i).Cells(5).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(5).Text) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(5).Text)).ToString("C")
            '    GridViewCuatriSaldo0.Rows(i).Cells(6).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(6).Text.Replace("%", "")) - CDbl(GridViewCuatriSaldo.Rows(1).Cells(6).Text.Replace("%", ""))).ToString("P")
            '    GridViewCuatriSaldo0.Rows(i).Cells(7).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(7).Text.Replace("%", "")) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(7).Text.Replace("%", ""))).ToString("P")
            'Next
            'GridViewCuatriSaldo0.FooterRow.Cells(2).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(2).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(2).Text)).ToString("N0")
            'GridViewCuatriSaldo0.FooterRow.Cells(3).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(3).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(3).Text)).ToString("N0")
            'GridViewCuatriSaldo0.FooterRow.Cells(4).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(4).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(4).Text)).ToString("N0")
            'GridViewCuatriSaldo0.FooterRow.Cells(5).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(5).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(5).Text)).ToString("C")
            'GridViewCuatriSaldo0.FooterRow.Cells(6).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(6).Text.Replace("%", "")) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(6).Text.Replace("%", ""))).ToString("P")
            'GridViewCuatriSaldo0.FooterRow.Cells(7).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(7).Text.Replace("%", "")) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(7).Text.Replace("%", ""))).ToString("P")

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewCuatriSaldo1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCuatriSaldo1.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(2).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(3).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(4).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCuatriSaldo1.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewCuatriSaldo.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewCuatriSaldo.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewCuatriSaldo1.Rows(i).Cells(2).FindControl("LBCuatriSaldo1"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCuatriSaldo1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCuatriSaldo1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCuatriSaldo1.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(2).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(3).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(4).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(5).Text))
            '--------------------------------------------------
            'For i As Int16 = 0 To (GridViewCuatriSaldo0.Rows.Count - 1)
            '    GridViewCuatriSaldo0.Rows(i).Cells(0).Text = IIf(GridViewRCuatriOri.Rows(i).Cells(0).Text.Equals(GridViewCuatriSaldo.Rows(i).Cells(0).Text), GridViewCuatriSaldo.Rows(i).Cells(0).Text, "VERIFIQUE LOS DATOS")
            '    GridViewCuatriSaldo0.Rows(i).Cells(1).Text = IIf(GridViewRCuatriOri.Rows(i).Cells(1).Text.Equals(GridViewCuatriSaldo.Rows(i).Cells(1).Text), GridViewCuatriSaldo.Rows(i).Cells(1).Text, "VERIFIQUE LOS DATOS")
            '    GridViewCuatriSaldo0.Rows(i).Cells(2).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(2).Text) - CDbl(CType(GridViewCuatriSaldo.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text) - CDbl(CType(GridViewCuatriSaldo1.Rows(i).Cells(2).FindControl("HyperLink2"), HyperLink).Text)).ToString("N0")
            '    GridViewCuatriSaldo0.Rows(i).Cells(3).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(3).Text) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(3).Text) - CDbl(GridViewCuatriSaldo1.Rows(i).Cells(3).Text)).ToString("N0")
            '    GridViewCuatriSaldo0.Rows(i).Cells(4).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(4).Text) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(4).Text) - CDbl(GridViewCuatriSaldo1.Rows(i).Cells(4).Text)).ToString("N0")
            '    GridViewCuatriSaldo0.Rows(i).Cells(5).Text = (CDbl(GridViewRCuatriOri.Rows(i).Cells(5).Text) - CDbl(GridViewCuatriSaldo.Rows(i).Cells(5).Text) - CDbl(GridViewCuatriSaldo1.Rows(i).Cells(5).Text)).ToString("C")
            'Next
            'GridViewCuatriSaldo0.FooterRow.Cells(2).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(2).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(2).Text) - CDbl(GridViewCuatriSaldo1.FooterRow.Cells(2).Text)).ToString("N0")
            'GridViewCuatriSaldo0.FooterRow.Cells(3).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(3).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(3).Text) - CDbl(GridViewCuatriSaldo1.FooterRow.Cells(3).Text)).ToString("N0")
            'GridViewCuatriSaldo0.FooterRow.Cells(4).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(4).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(4).Text) - CDbl(GridViewCuatriSaldo1.FooterRow.Cells(4).Text)).ToString("N0")
            'GridViewCuatriSaldo0.FooterRow.Cells(5).Text = (CDbl(GridViewRCuatriOri.FooterRow.Cells(5).Text) - CDbl(GridViewCuatriSaldo.FooterRow.Cells(5).Text) - CDbl(GridViewCuatriSaldo1.FooterRow.Cells(5).Text)).ToString("C")

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub CBDel_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CBDel.CheckedChanged
        If CBDel.Checked Then
            HiddenFieldDel.Value = "%"
        Else
            HiddenFieldDel.Value = "subdel"
        End If
        GridViewRCuatriOri.DataBind()
        GridViewCuatriSaldo0.DataBind()
        GridViewCuatriSaldo.DataBind()
        GridViewCuatriSaldo1.DataBind()
    End Sub

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        If DDLReporte.SelectedIndex.Equals("1") Then
            histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard1.ActiveStep.Name, "regpat", Request.UserHostAddress)
            Wizard1.DataBind()
        Else
            histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard2.ActiveStep.Name, "regpat", Request.UserHostAddress)
            Wizard2.DataBind()
        End If
    End Sub

    Protected Sub GridViewCuatriSaldo0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCuatriSaldo0.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(2).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(3).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(4).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCuatriSaldo0.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewCuatriSaldo0.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewCuatriSaldo0.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewCuatriSaldo0.Rows(i).Cells(2).FindControl("HyperLink3"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCuatriSaldo0.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCuatriSaldo0.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCuatriSaldo0.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(2).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(3).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(4).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(5).Text))
            
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBForaneo_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBForaneo.Click
        GVGIncidencias.DataBind()
        GVRGGrupoIncidencia.DataBind()
    End Sub

    Protected Sub DDLRuta_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLRuta.PreRender
        If Not DDLRuta.Items.Contains(New ListItem("RUTAS", "0")) Then
            DDLRuta.Items.Add(New ListItem("RUTAS", "0"))
        End If
    End Sub

    Protected Sub LBForaneo2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBForaneo2.Click
        GVRGPorPatron.DataBind()
        GVRGeneral.DataBind()
    End Sub

    Protected Sub DDLRuta2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLRuta2.PreRender
        If Not DDLRuta2.Items.Contains(New ListItem("RUTAS", "0")) Then
            DDLRuta2.Items.Add(New ListItem("RUTAS", "0"))
        End If
    End Sub
End Class
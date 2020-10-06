Imports System.Data.OleDb
Imports System.Globalization
Imports addHistorialAcciones

Public Class Ciclo2B
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim histAcciones As HistorialWeb = New HistorialWeb
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(Now) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
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
        End If
    End Sub

    Protected Sub DDLReporte_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLReporte.SelectedIndexChanged
        MultiViewReportes.ActiveViewIndex = DDLReporte.SelectedIndex
        If DDLReporte.SelectedIndex.Equals(1) Then
            Label5.Visible = True
            DDLInspector.Visible = True
        Else
            Label5.Visible = False
            DDLInspector.Visible = False
        End If
    End Sub

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        If DDLReporte.SelectedIndex.Equals("1") Then
            histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard1.ActiveStep.Name, "regpat", Request.UserHostAddress)
            Wizard1.DataBind()
        Else
            histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard2.ActiveStep.Name, "regpat", Request.UserHostAddress)
            Wizard2.DataBind()
        End If
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If IO.File.Exists(Server.MapPath("~") & "/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg") Then
            IBFoto.ImageUrl = "~/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg"
        Else
            IBFoto.ImageUrl = "~/imagenes/usuarios/usuarioSireca.jpg"
        End If
    End Sub

    Protected Sub DDLInspector_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.SelectedIndexChanged
        histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", "Consulta", DDLAnio.SelectedValue, DDLMes.SelectedValue, DDLInspector.SelectedItem.Text, "regpat", Request.UserHostAddress)
        If IO.File.Exists(Server.MapPath("~") & "/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg") Then
            IBFoto.ImageUrl = "~/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg"
        Else
            IBFoto.ImageUrl = "~/imagenes/usuarios/usuarioSireca.jpg"
        End If
    End Sub

    Protected Sub DDLInspector_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.Init
        'If Not DDLInspector.Items.Contains(New ListItem("TODOS", "%")) Then
        'DDLInspector.Items.Add(New ListItem("TODOS", "%"))
        'End If
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

    Protected Sub DVInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DVInspector.PreRender
        If DVInspector.Rows.Count = 0 Then
            PObservaciones.Visible = False
        Else
            PObservaciones.Visible = True
        End If
    End Sub

    Protected Sub GVRGIncidencias_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVRGIncidencias.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GVRGIncidencias.FooterRow.Cells(2).Text = "0"
            GVRGIncidencias.FooterRow.Cells(3).Text = "0"
            GVRGIncidencias.FooterRow.Cells(4).Text = "0"
            GVRGIncidencias.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GVRGIncidencias.Rows.Count - 1)
                'Dim hl1 As HyperLink = GVRGIncidencias.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GVRGIncidencias.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(3).Text.Replace(",", ""))
                GVRGIncidencias.FooterRow.Cells(2).Text = Convert.ToDouble(GVRGIncidencias.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(2).Text.Replace(",", ""))
                GVRGIncidencias.FooterRow.Cells(3).Text = Convert.ToDouble(GVRGIncidencias.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(3).Text.Replace(",", ""))
                GVRGIncidencias.FooterRow.Cells(4).Text = Convert.ToDouble(GVRGIncidencias.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(4).Text.Replace(",", ""))
                GVRGIncidencias.FooterRow.Cells(5).Text = Convert.ToDouble(GVRGIncidencias.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GVRGIncidencias.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(2).Text))
            GVRGIncidencias.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(3).Text))
            GVRGIncidencias.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(4).Text))
            GVRGIncidencias.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GVRGIncidencias.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GVRGIncidencias0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVRGIncidencias0.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GVRGIncidencias0.FooterRow.Cells(3).Text = "0"
            GVRGIncidencias0.FooterRow.Cells(4).Text = "0"
            GVRGIncidencias0.FooterRow.Cells(5).Text = "0"
            GVRGIncidencias0.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GVRGIncidencias0.Rows.Count - 1)
                'Dim hl1 As HyperLink = GVRGIncidencias0.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GVRGIncidencias0.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(3).Text.Replace(",", ""))
                GVRGIncidencias0.FooterRow.Cells(3).Text = Convert.ToDouble(GVRGIncidencias0.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(3).Text.Replace(",", ""))
                GVRGIncidencias0.FooterRow.Cells(4).Text = Convert.ToDouble(GVRGIncidencias0.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(4).Text.Replace(",", ""))
                GVRGIncidencias0.FooterRow.Cells(5).Text = Convert.ToDouble(GVRGIncidencias0.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(5).Text.Replace(",", ""))
                GVRGIncidencias0.FooterRow.Cells(6).Text = Convert.ToDouble(GVRGIncidencias0.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GVRGIncidencias0.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(3).Text))
            GVRGIncidencias0.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(4).Text))
            GVRGIncidencias0.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(5).Text))
            GVRGIncidencias0.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GVRGIncidencias0.FooterRow.Cells(6).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Wizard1.ActiveStepChanged
        histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard1.ActiveStep.Name, "regpat", Request.UserHostAddress)
    End Sub

    Protected Sub Wizard2_ActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Wizard2.ActiveStepChanged
        histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "2", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard2.ActiveStep.Name, "regpat", Request.UserHostAddress)
    End Sub

End Class
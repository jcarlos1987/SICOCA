Imports System.Data.OleDb
Imports email
Imports System.IO
Imports addHistorialAcciones
Imports System.Globalization

Public Class DefaultClear
    Inherits System.Web.UI.Page
    Dim histAcciones As HistorialWeb = New HistorialWeb
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim direccionip As String = ConfigurationSettings.AppSettings("direccionip")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Try
            Dim direccion As String = Request.Url.AbsolutePath
            Dim direccionGet As String = Request.Url.AbsoluteUri.Split("?").GetValue(1).ToString
            If direccionGet.Length < 254 Then
                direccionGet = direccionGet
            Else
                direccionGet = direccionGet.Substring(0, 254)
            End If
            histAcciones.agregarHistorial(cadenaconexion, "", Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "", direccion, "", "", direccionGet, Request.QueryString("regpat").ToString, Request.UserHostAddress)
            cargarImagenes()
            'mes=02&anio=2013&subdel=01&tipo_eco=1&tipo_file=COMP&incidencia=NO LOCALIZADOS
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            '1 solo ve sus comentarios,2 ve comentarios de todos
            If (Session.Item("SIRECAobservacionPatronal").ToString.Equals("1") Or Session.Item("SIRECAobservacionPatronal").ToString.Equals("2")) And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Try
                    LRegpat.Text = Request.QueryString("regpat").ToString.Replace("-", "").Substring(0, 10).ToUpper
                    HyperLink1.NavigateUrl = "~/pag_cobros/galeriaarchivoscargados.aspx?regpat=" & LRegpat.Text
                    datoPatronal(LRegpat.Text.Substring(0, 10))
                Catch ex As Exception

                End Try
                'LRazon.Text = Request.QueryString("razon").ToString.ToUpper
                'FVObservacion.DataBind()                
            Else
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub
    Protected Sub datoPatronal(ByVal registrop As String)
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringFiscamovil").ConnectionString)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT  "
            consulta += " [sector] "
            consulta += " ,[rfc] "
            consulta += " ,[dom] "
            consulta += " ,[loc] "
            consulta += " ,[act] "
            consulta += " ,[cotiz] "
            consulta += " ,[vigencia] "
            consulta += " ,(SELECT top 1 fd.[info] FROM [firmaDigital].[dbo].[info] as fd where fd.tipo='3' and fd.[regpat]=ptn.regpat) as telefono "
            consulta += " ,(SELECT top 1 fd.[info] FROM [firmaDigital].[dbo].[info] as fd where fd.tipo='2' and fd.[regpat]=ptn.regpat) as correo "
            consulta += " ,(SELECT top 1 fd.[info] FROM [firmaDigital].[dbo].[info] as fd where fd.tipo='1' and fd.[regpat]=ptn.regpat) as replegal "
            consulta += " ,[razonSocial] "
            consulta += " ,[subdel] "
            consulta += " FROM [sireca].[dbo].[patrones] as ptn "
            consulta += " where ptn.regpat='" & registrop & "' "
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                'cabecera = myReader.GetName(i)
                LSector.Text = myReader.GetValue(0).ToString
                LRfc.Text = myReader.GetValue(1).ToString
                LDomicilio.Text = myReader.GetValue(2).ToString
                LLocalidad.Text = myReader.GetValue(3).ToString
                LActividad.Text = myReader.GetValue(4).ToString
                LCotizantes.Text = myReader.GetValue(5).ToString
                LUltimaVigencia.Text = If(IsDate(myReader.GetValue(6).ToString), MonthName(CType(Month(CType(myReader.GetValue(6).ToString, Date)), Int32), False).ToUpper & " del " & CType(Year(CType(myReader.GetValue(6), Date)), String), "")
                LTelefono.Text = myReader.GetValue(7).ToString
                HLCorreo.NavigateUrl = "mailto:" & myReader.GetValue(8).ToString & "?subject=AVISO DE PAGO&body=Buenas, le informo:"
                HLCorreo.Text = myReader.GetValue(8).ToString
                LRepreLegal.Text = myReader.GetValue(9).ToString
                LRazon.Text = myReader.GetValue(10).ToString
                LSUBDEL.Text = myReader.GetValue(11).ToString
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        FVObservacion.DataBind()
    End Sub

    Protected Sub cargarImagenes()
        Try
            Dim regpatronal As String = Request.QueryString("regpat").ToString.Replace("-", "").Substring(0, 10)
            Dim rutaImagenes As String = Server.MapPath("~") & "\fotosIncidencia\" & regpatronal & "\"
            If System.IO.Directory.Exists(rutaImagenes) Then
                Dim imagenes As String() = Directory.GetFiles(rutaImagenes)
                Dim nombrefile As String = ""
                HFImagenes.Value = ""
                For index As Integer = 0 To (imagenes.Length - 1)
                    nombrefile = imagenes.GetValue(index).ToString.Split("\").GetValue(imagenes.GetValue(index).ToString.Split("\").Length - 1).ToString
                    'MsgBox(nombrefile.Split("_").GetValue(0).ToString.Replace(";", ":"))
                    HFImagenes.Value += ",{ 'caption': '" & nombrefile & "', 'url': '../fotosIncidencia/" & regpatronal & "/" & nombrefile & "' }"
                Next
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub BAddObservaciony_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BAddObservaciony.Click
        LEstadoRegistro.Text = ""
        Try
        If TBObservacion.Text.Replace(" ", "").Length > 2 Then
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaObservaciones].[dbo].[observacionPatronal]([fechaSystema],[ipHost],[idRegpat],[idUser],[observacion],[tipo]) "
            myInsertQuery22 += " VALUES (?, ?, ?, ?, ?, ?) "
            cmd22.CommandText = myInsertQuery22

            cmd22.Parameters.Add("@fechaSystema", OleDbType.Date).Value = Now
            cmd22.Parameters.Add("@ipHost", OleDbType.VarChar).Value = Request.UserHostAddress()
            cmd22.Parameters.Add("@idRegpat", OleDbType.VarChar).Value = Request.QueryString("regpat").ToString.Replace("-", "").Substring(0, 10)
            cmd22.Parameters.Add("@idUser", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = TBObservacion.Text
            cmd22.Parameters.Add("@tipo", OleDbType.VarChar).Value = DDLObservacion.SelectedValue

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LEstadoRegistro.Text = "Error al agregar la observacion"
            Else
                LEstadoRegistro.Text = "Observacion <strong>" & TBObservacion.Text & "</strong> agregada"
                FVObservacion.DataBind()
                Dim emailx As CorreoEnviar = New CorreoEnviar
                Dim correoMsg As String = "<strong>" & Session.Item("SIRECAnombre").ToString.ToUpper & "</strong> capturo una observación "
                correoMsg += " <br/><strong>REG.PATRONAL: </strong>" & Request.QueryString("regpat").ToString.Replace("-", "").Substring(0, 10) & " (" & LRazon.Text & ")"
                correoMsg += " <br/><strong>OBSERVACIÓN: </strong>" & TBObservacion.Text
                    correoMsg += " <br/><a href='" & direccionip & "/websireca/observacionPatronal/Default.aspx?regpat=" & Request.QueryString("regpat").ToString & "&razon=razon '>Ver observacion completa</a>"
                    For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                        If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                            If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                                correoMsg += "<br/>" & LLocalidad.Text + ", " + LDomicilio.Text
                                emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                            Else
                                emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                            End If
                        Else
                            If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                                If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                                    correoMsg += "<br/>" & LLocalidad.Text + ", " + LDomicilio.Text
                                    emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                                Else
                                    emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                                End If
                            End If
                        End If
                    Next
                    'subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1)
                    If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                        correoMsg += "<br/>" & LLocalidad.Text + ", " + LDomicilio.Text
                        emailx.correoEnviar("jesus.chi@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, "00"), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    Else
                        emailx.correoEnviar("jesus.chi@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, "00"), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    End If
                    'If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                    '    emailx.correoEnviar("humberto.escalante@imss.gob.mx", "cc", "yajaira.campos@imss.gob.mx,alejandra.victorin@imss.gob.mx,yamily.novelo@imss.gob.mx,jose.martink@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                    '        correoMsg += "<br/>" & LLocalidad.Text + ", " + LDomicilio.Text
                    '        emailx.correoEnviar("jose.lizama@imss.gob.mx", "cc", "geovani.medina@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    End If
                    '    If DDLObservacion.SelectedValue.ToString.Equals("EEDR") Then
                    '        emailx.correoEnviar("geovani.medina@imss.gob.mx", "cc", "jose.lizama@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    End If
                    'ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                    '    emailx.correoEnviar("roman.pech@imss.gob.mx", "cc", "aureo.medina@imss.gob.mx,dea.hernandezoj@imss.gob.mx,julio.soberanis@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                    '        correoMsg += "<br/>" & LLocalidad.Text + ", " + LDomicilio.Text
                    '        emailx.correoEnviar("ligia.arceo@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    End If
                    '    If DDLObservacion.SelectedValue.ToString.Equals("EEDR") Then
                    '        emailx.correoEnviar("nora.guadiana@imss.gob.mx", "cc", "ligia.arceo@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    End If
                    'Else
                    '    If LSUBDEL.Text.Equals("01") Then
                    '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "geovani.medina@imss.gob.mx,humberto.escalante@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    ElseIf LSUBDEL.Text.Equals("33") Then
                    '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "geovani.medina@imss.gob.mx,roman.pech@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    Else
                    '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx,geovani.medina@imss.gob.mx,humberto.escalante@imss.gob.mx,roman.pech@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    End If
                    'End If
                    'If DDLObservacion.SelectedValue.ToString.Equals("EEDR") Then
                    '    If LSUBDEL.Text.Equals("01") Then
                    '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "juan.montanor@imss.gob.mx,alejandro.sancheza@imss.gob.mx,eleazar.escamillape@imss.gob.mx,jesus.chi@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    ElseIf LSUBDEL.Text.Equals("33") Then
                    '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "juan.montanor@imss.gob.mx,alejandro.sancheza@imss.gob.mx,eleazar.escamillape@imss.gob.mx,jesus.chi@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    Else
                    '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "juan.montanor@imss.gob.mx,alejandro.sancheza@imss.gob.mx,eleazar.escamillape@imss.gob.mx,jesus.chi@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                    '    End If
                    'End If
            End If
            con22.Close()
            End If
            TBObservacion.Text = ""
        Catch ex As Exception

        End Try
    End Sub
    Private Function getCorreosEnvio(ByVal tipoEnvio As String, ByVal subdelEmail As String) As String
        Dim correos As String = ""
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT email "
            consulta += " from fiscamovil.dbo.usuarios as uf inner join sireca.dbo.usuarios as us "
            consulta += " on uf.id=us.id "
            consulta += " where us.correoAuto like '%" + tipoEnvio + "%' and us.subdel='" + subdelEmail + "' "
            consulta += " and uf.email is not null "
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Dim indice As Int32 = 0
            Do While myReader.Read()
                indice += 1
                If indice = 1 Then
                    correos = myReader.GetValue(0).ToString
                Else
                    correos = correos + "," + myReader.GetValue(0).ToString
                End If
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return correos
    End Function
    Protected Sub GridViewAdeudo_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewAdeudo.PreRender
        Try
            GridViewAdeudo.FooterRow.Cells(1).Text = "0"
            GridViewAdeudo.FooterRow.Cells(2).Text = "0"
            For i As Int32 = 0 To (GridViewAdeudo.Rows.Count - 1)
                GridViewAdeudo.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewAdeudo.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewAdeudo.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewAdeudo.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewAdeudo.Rows(i).Cells(2).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewAdeudo.FooterRow.Cells(2).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewAdeudo.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewAdeudo.FooterRow.Cells(1).Text))
            GridViewAdeudo.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewAdeudo.FooterRow.Cells(2).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewAdeudo0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewAdeudo0.PreRender
        Try
            GridViewAdeudo0.FooterRow.Cells(1).Text = "0"
            GridViewAdeudo0.FooterRow.Cells(2).Text = "0"
            For i As Int32 = 0 To (GridViewAdeudo0.Rows.Count - 1)
                GridViewAdeudo0.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewAdeudo0.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewAdeudo0.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewAdeudo0.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewAdeudo0.Rows(i).Cells(2).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewAdeudo0.FooterRow.Cells(2).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewAdeudo0.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewAdeudo0.FooterRow.Cells(1).Text))
            GridViewAdeudo0.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewAdeudo0.FooterRow.Cells(2).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewGInc_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGInc.PreRender
        Try
            GridViewGInc.FooterRow.Cells(1).Text = "0"
            GridViewGInc.FooterRow.Cells(2).Text = "0"
            GridViewGInc.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridViewGInc.Rows.Count - 1)
                GridViewGInc.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewGInc.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewGInc.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewGInc.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewGInc.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewGInc.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGInc.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGInc.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGInc.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewGInc.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGInc.FooterRow.Cells(1).Text))
            GridViewGInc.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGInc.FooterRow.Cells(2).Text))
            GridViewGInc.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGInc.FooterRow.Cells(3).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewGInc0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGInc0.PreRender
        Try
            GridViewGInc0.FooterRow.Cells(1).Text = "0"
            GridViewGInc0.FooterRow.Cells(2).Text = "0"
            GridViewGInc0.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridViewGInc0.Rows.Count - 1)
                GridViewGInc0.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewGInc0.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewGInc0.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewGInc0.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewGInc0.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewGInc0.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGInc0.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGInc0.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGInc0.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewGInc0.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGInc0.FooterRow.Cells(1).Text))
            GridViewGInc0.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGInc0.FooterRow.Cells(2).Text))
            GridViewGInc0.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGInc0.FooterRow.Cells(3).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewDVehiculares_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewDVehiculares.PreRender
        GridViewDVehiculares.Caption = GridViewDVehiculares.Rows.Count.ToString("N0") & " VEHICULOS"
    End Sub
End Class
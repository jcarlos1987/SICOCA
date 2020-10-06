Imports System.Data.OleDb
Imports email

Public Class Comentario
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim direccionip As String = ConfigurationSettings.AppSettings("direccionip")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            '1 solo ve sus comentarios,2 ve comentarios de todos
            If Not (Session.Item("SIRECAobservacionPatronal").ToString.Equals("1") Or Session.Item("SIRECAobservacionPatronal").ToString.Equals("2")) And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

    Protected Sub BComentario_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BComentario.Click
        If TBComentario.Text.Replace(" ", "").Length > 2 Then
            LEstadoRegistro.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " INSERT INTO [sirecaObservaciones].[dbo].[comentarioObservacion]([fechaSystema],[ipHost],[idObservacion],[idUser],[comentario]) "
            myInsertQuery22 += " VALUES(?, ?, ?, ?, ?) "
            cmd22.CommandText = myInsertQuery22

            cmd22.Parameters.Add("@fechaSystema", OleDbType.Date).Value = Now
            cmd22.Parameters.Add("@ipHost", OleDbType.VarChar).Value = Request.UserHostAddress()
            cmd22.Parameters.Add("@idObservacion", OleDbType.Integer).Value = Convert.ToInt32(Request.QueryString("idOb").ToString)
            cmd22.Parameters.Add("@idUser", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@comentario", OleDbType.VarChar).Value = TBComentario.Text

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LEstadoRegistro.Text = "Error al agregar el Comentario"
            Else
                LEstadoRegistro.Text = "Comentario <strong>" & TBComentario.Text & "</strong> agregada"
                Dim emailx As CorreoEnviar = New CorreoEnviar
                Dim correoMsg As String = "<strong>" & Session.Item("SIRECAnombre").ToString.ToUpper & "</strong> comento "
                correoMsg += " <br/><strong>REG.PATRONAL: </strong>" & Request.QueryString("regpat").ToString.Replace("-", "")
                correoMsg += " <br/><strong>COMENTARIO: </strong>" & TBComentario.Text
                correoMsg += " <br/><a href='" & direccionip & "/websireca/observacionPatronal/Default.aspx?regpat=" & Request.QueryString("regpat").ToString & "&razon=razon' >Ver observacion completa</a>"
                For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                    If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                        If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                            emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                        Else
                            emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                        End If
                    Else
                        If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                            If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                                emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                            Else
                                emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                            End If
                        End If
                    End If
                Next
                'subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1)
                If DDLObservacion.SelectedValue.ToString.Equals("NL") Then                    
                    emailx.correoEnviar("jesus.chi@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, "00"), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                Else
                    emailx.correoEnviar("jesus.chi@imss.gob.mx", "cc", getCorreosEnvio(DDLObservacion.SelectedValue.ToString, "00"), (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                End If
                '---------------------------------------------------------------------
                '---------------------------------------------------------------------
                '---------------------------------------------------------------------
                'If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                '    emailx.correoEnviar("humberto.escalante@imss.gob.mx", "cc", "yajaira.campos@imss.gob.mx,alejandra.victorin@imss.gob.mx,yamily.novelo@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)

                '    If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                '        emailx.correoEnviar("jose.lizama@imss.gob.mx", "cc", "geovani.medina@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)

                '    End If
                '    If DDLObservacion.SelectedValue.ToString.Equals("EEDR") Then
                '        emailx.correoEnviar("geovani.medina@imss.gob.mx", "cc", "jose.lizama@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)

                '    End If
                'ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                '    emailx.correoEnviar("roman.pech@imss.gob.mx", "cc", "aureo.medina@imss.gob.mx,dea.hernandezoj@imss.gob.mx,julio.soberanis@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)

                '    If DDLObservacion.SelectedValue.ToString.Equals("NL") Then
                '        emailx.correoEnviar("ligia.arceo@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)

                '    End If
                '    If DDLObservacion.SelectedValue.ToString.Equals("EEDR") Then
                '        emailx.correoEnviar("nora.guadiana@imss.gob.mx", "cc", "ligia.arceo@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)

                '    End If
                'Else

                '    If Request.QueryString("regpat").ToString.Equals("01") Then
                '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "geovani.medina@imss.gob.mx,humberto.escalante@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                '    ElseIf Request.QueryString("regpat").ToString.Equals("33") Then
                '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx,roman.pech@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                '    Else
                '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx,geovani.medina@imss.gob.mx,humberto.escalante@imss.gob.mx,roman.pech@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                '    End If
                'End If
                'If DDLObservacion.SelectedValue.ToString.Equals("EEDR") Then
                '    If Request.QueryString("regpat").ToString.Equals("01") Then
                '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "juan.montanor@imss.gob.mx,alejandro.sancheza@imss.gob.mx,eleazar.escamillape@imss.gob.mx,jesus.chi@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                '    ElseIf Request.QueryString("regpat").ToString.Equals("33") Then
                '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "juan.montanor@imss.gob.mx,alejandro.sancheza@imss.gob.mx,eleazar.escamillape@imss.gob.mx,jesus.chi@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                '    Else
                '        emailx.correoEnviar("hector.duranb@imss.gob.mx", "cc", "juan.montanor@imss.gob.mx,alejandro.sancheza@imss.gob.mx,eleazar.escamillape@imss.gob.mx,jesus.chi@imss.gob.mx", (" " & DDLObservacion.SelectedItem.Text & ", SIRECA"), "0", correoMsg)
                '    End If
                'End If
            End If
            con22.Close()
            If Request.QueryString("razon").ToString.Equals("razonsinheader") Then
                Response.Redirect("~/observacionPatronal/DefaultClear.aspx?regpat=" & Request.QueryString("regpat").ToString & "&razon=razonsinheader")
            Else
                Response.Redirect("~/observacionPatronal/Default.aspx?regpat=" & Request.QueryString("regpat").ToString & "&razon=razon")
            End If

        End If
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
End Class
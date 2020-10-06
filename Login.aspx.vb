Imports System.Data.OleDb

Public Class Login
    Inherits System.Web.UI.Page
    Dim tiempoSession As Integer = 60000
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Server.Transfer("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.LoginAcces.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + LoginAcces.ClientID + "').click();return false;}} else {return true}; ")
        If Session.Item("SIRECAuser") Is Nothing Then
            LoginAcces.Visible = True
        Else

            autenticacion()
            'LoginAcces.Visible = False
            'Response.Redirect("~/Default.aspx")
        End If
    End Sub
    'SIRECAchmod2 acceso al control NO LOCALIZADOS, 
    Protected Sub autenticacion()
        Dim autenticacion As Boolean = False
        autenticacion = loginCorrectos(UserName.Text, Password.Text)
        'e.Authenticated = autenticacion
        If (autenticacion) Then
            LoginAcces.Visible = False           
            '-------historial INICIO--------------------
            If Session.Item("SIRECAchmod7").ToString.Equals("x") Or Session.Item("SIRECAchmod7").ToString.Equals("0") Then
                Dim con2 As New OleDbConnection(cadenaconexion)
                Dim cmd2 As New OleDbCommand()
                cmd2.Connection = con2
                Dim myInsertQuery2 As String = "INSERT INTO [historial] ([fecha],[usuario],[subdel],[accion],[hostname],[ip])"
                myInsertQuery2 += " values(?, ?, ?, ?, ?, ?)"
                cmd2.CommandText = myInsertQuery2
                cmd2.Parameters.Add("@fecha", OleDbType.Date).Value = Now
                cmd2.Parameters.Add("@usuario", OleDbType.VarChar).Value = Session.Item("SIRECAnombre").ToString
                cmd2.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString
                cmd2.Parameters.Add("@accion", OleDbType.VarChar).Value = "inicio session"
                cmd2.Parameters.Add("@hostname", OleDbType.VarChar).Value = Request.UserHostName
                cmd2.Parameters.Add("@ip", OleDbType.VarChar).Value = Request.UserHostAddress()
                con2.Open()
                cmd2.ExecuteNonQuery()
                con2.Close()
            End If
            '-------historial FIN--------------------
            If Session.Item("SIRECAuser_type").ToString.Equals("1") And Session.Item("SIRECAchmod9").ToString.Equals("1") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Response.Redirect("~/pag_asps/inicio.aspx")
            ElseIf Session.Item("SIRECAuser_type").ToString.Equals("1") And Session.Item("SIRECAchmod9").ToString.Equals("2") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Response.Redirect("~/pag_cobros/capturadeincidencia.aspx")
            ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod9").ToString.Equals("1") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Response.Redirect("~/principal/Ciclo1.aspx")
            ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod9").ToString.Equals("2") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Response.Redirect("~/principal/Ciclo2.aspx")
            ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod9").ToString.Equals("3") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Response.Redirect("~/principal/Ciclo3.aspx")
            ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod9").ToString.Equals("p") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Response.Redirect("~/principal/Menu.aspx")
            Else
                Response.Redirect("~/principal/Menu.aspx")
            End If
        End If
    End Sub
    Private Function loginCorrectos(ByVal user As String, ByVal pass As String) As Boolean
        Dim estado As Boolean = False
        Dim nwindConn As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringFiscamovil").ConnectionString)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        catCMD.CommandText = "SELECT * FROM [Usuarios] WHERE [user]= '" & user & "' AND [pwd]='" & pass & "'"
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim num As Integer = 0
        Session.Timeout = tiempoSession
        Dim sesionCreada As Boolean = False
        Dim cabecera As String = ""
        Dim valor As Object = ""
        Do While myReader.Read()
            num = num + 1
            For i As Integer = 0 To (myReader.FieldCount - 1)
                cabecera = myReader.GetName(i)
                valor = myReader.GetValue(i)
                If valor Is DBNull.Value Then
                    valor = ""
                End If
                Session().Item("SIRECA" & cabecera) = valor
                'Response.Cookies(cabecera).Value = valor
                'Response.Cookies(cabecera).Path = "/"
                'Response.Cookies(cabecera).Expires = Now.AddHours(1)                
                sesionCreada = True
            Next i
        Loop
        myReader.Close()
        nwindConn.Close()        
        '----------------------------------------------------------------------------------------------begin error
        Try
            If sesionCreada Then
                nwindConn = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
                catCMD = nwindConn.CreateCommand()
                catCMD.CommandText = "SELECT [chmod],[sectores],[subdel],[user_type],[totalFacturas],[chmod2] as chmodSC,[userPae1],[userPae2],[userPae3],[credencial],[observacionPatronal],[printPaeDoc],[AdeudoZona],[cargaebaema],[baseNDRegistros],[userIntegrador],[alerta],[subir_doc],[ver_doc],[ind_desempenio],[datos_vehiculares],[emision_p1],[emision_p2],[printEmisionCitNot],[contprint],[reg_codebar],[reg_tipo] FROM [Usuarios] WHERE [id] = " & Session.Item("SIRECAid")
                nwindConn.Open()
                myReader = catCMD.ExecuteReader()
                num = 0
                Session.Timeout = tiempoSession
                Do While myReader.Read()
                    num = num + 1
                    For i As Integer = 0 To (myReader.FieldCount - 1)
                        Session().Item("SIRECA" & myReader.GetName(i)) = myReader.GetValue(i)
                        'MsgBox(Session().Item(i))
                    Next i
                Loop
                myReader.Close()
                nwindConn.Close()

                Dim chmod() As String = Session.Item("SIRECAchmod").ToString.Split("-")
                Session.Item("SIRECAchmod1") = chmod(0) ' permite el acceso
                Session.Item("SIRECAchmod2") = chmod(1) '
                Session.Item("SIRECAchmod3") = chmod(2) ' Asignar PAE1
                Session.Item("SIRECAchmod4") = chmod(3) ' Asignar PAE2
                Session.Item("SIRECAchmod5") = chmod(4) ' Asignar PAE3
                Session.Item("SIRECAchmod6") = chmod(5) '
                Session.Item("SIRECAchmod7") = chmod(6) '
                Session.Item("SIRECAchmod8") = chmod(7) ' visualisa el boton Crear EMA vs RALE
                Session.Item("SIRECAchmod9") = chmod(8) ' redirecciona al reporte general

                chmod = Session.Item("SIRECAchmodSC").ToString.Split("-")
                Session.Item("SIRECA2chmod1") = chmod(0) 'CR
                Session.Item("SIRECA2chmod2") = chmod(1) 'DR
                Session.Item("SIRECA2chmod3") = chmod(2) 'CL
                Session.Item("SIRECA2chmod4") = chmod(3) 'DL
                Session.Item("SIRECA2chmod5") = chmod(4) 'CP
                Session.Item("SIRECA2chmod6") = chmod(5) 'DP
                Session.Item("SIRECA2chmod7") = chmod(6) 'ARR
                Session.Item("SIRECA2chmod8") = chmod(7) 'DA
                Session.Item("SIRECA2chmod9") = chmod(8) 'RG
                'Session.Item("SIRECA2chmod10") = chmod(9) 'SUP
                Session.Timeout = tiempoSession

                '--------------------------
                Dim nwindConn2 As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
                Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
                catCMD2.CommandText = "SELECT [subdel], [user_type] FROM [Usuarios] WHERE [id] = " & Session.Item("SIRECAid")
                nwindConn2.Open()
                'MsgBox(Session.Item("SATICid"))
                Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
                num = 0
                Session.Timeout = tiempoSession
                Do While myReader2.Read()
                    num = num + 1
                    Session().Item("SIRECAuser_type") = myReader2.GetValue(1)
                    Exit Do
                    'For i As Integer = 0 To (myReader2.FieldCount - 1)
                    'Session().Item("SATICsubdel") = myReader.GetValue(0)
                    'Session().Item("SATICuser_type") = myReader.GetValue(1)            
                    'Next i
                Loop
                Session.Timeout = tiempoSession
                myReader2.Close()
                nwindConn2.Close()
                '----------------------------------------
            End If
            If num <> 0 Then
                estado = True
            Else
                Session.RemoveAll()
                estado = False
            End If
        Catch ex As Exception
            Session.RemoveAll()
            Session.Abandon()
        End Try
        '---------------------------------------------------------------------------------------------end error
        Return estado
    End Function

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LoginButton.Click
        autenticacion()
    End Sub
End Class
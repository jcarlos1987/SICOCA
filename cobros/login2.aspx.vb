Imports System.Data.OleDb

Public Class login1
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session.Item("SIRECAsubdel") Is Nothing Then
                'Response.Redirect("~/LoginUser.aspx")
            Else
                If (Session.Item("SIRECA2chmod1").ToString.Equals("x")) Then
                    If (Session.Item("SIRECAuser_type").ToString.Equals("0")) Then
                        Response.Redirect("~/cobros/supervisorinforme.aspx")
                    ElseIf (Session.Item("SIRECAuser_type").ToString.Equals("1")) Then
                        Response.Redirect("~/cobros/ejecutor.aspx")
                    Else
                    End If
                Else
                    Session.Abandon()
                    Response.Redirect("~/cobros/login2.aspx")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub validarUserPass()
        Try


            If (TBUser.Text.Replace(" ", "").Length = 0) And (TBPass.Text.Replace(" ", "").Length = 0) Then
                Label1.Text = ""
            Else
                Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
                Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
                catCMD.CommandText = "SELECT * FROM [fiscamovil].[dbo].[Usuarios] WHERE [user]= '" & TBUser.Text & "' AND [pwd]='" & TBPass.Text & "'"
                nwindConn.Open()
                Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
                Dim num As Integer = 0
                Session.Timeout = 120
                Dim sesionCreada As Boolean = False
                Do While myReader.Read()
                    num = num + 1
                    For i As Integer = 0 To (myReader.FieldCount - 1)
                        Session.Item("SIRECA" & myReader.GetName(i)) = myReader.GetValue(i)
                        sesionCreada = True
                    Next i
                Loop
                myReader.Close()
                nwindConn.Close()
                '-----------------------------------------------------------------------------------
                If sesionCreada Then                    
                    nwindConn = New OleDbConnection(cadenaconexion)
                    catCMD = nwindConn.CreateCommand()
                    catCMD.CommandText = "SELECT [chmod],[subdel],[chmod2] as chmodSC FROM [sireca].[dbo].[Usuarios] WHERE [id] = " & Session.Item("SIRECAid")
                    nwindConn.Open()
                    myReader = catCMD.ExecuteReader()
                    num = 0

                    Session.Timeout = 120
                    Do While myReader.Read()
                        num = num + 1
                        For i As Integer = 0 To (myReader.FieldCount - 1)
                            Session.Item("SIRECA" & myReader.GetName(i)) = myReader.GetValue(i)                            
                        Next i
                    Loop
                    myReader.Close()
                    nwindConn.Close()                    
                    If num > 0 Then

                        Dim chmod() As String = Session.Item("SIRECAchmod").ToString.Split("-")
                        Session.Item("SIRECAchmod1") = chmod(0) 'acceso a lectura
                        Session.Item("SIRECAchmod2") = chmod(1) 'activa 
                        Session.Item("SIRECAchmod3") = chmod(2) 'activa 
                        Session.Item("SIRECAchmod4") = chmod(3) 'activa 
                        Session.Item("SIRECAchmod5") = chmod(4) '
                        Session.Item("SIRECAchmod6") = chmod(5)
                        Session.Item("SIRECAchmod7") = chmod(6) 'xx no se guarda en el historial
                        Session.Item("SIRECAchmod8") = chmod(7)
                        Session.Item("SIRECAchmod9") = chmod(8)

                        chmod = Session.Item("SIRECAchmodSC").ToString.Split("-")
                        Session.Item("SIRECA2chmod1") = chmod(0)
                        Session.Item("SIRECA2chmod2") = chmod(1)
                        Session.Item("SIRECA2chmod3") = chmod(2)
                        Session.Item("SIRECA2chmod4") = chmod(3)
                        Session.Item("SIRECA2chmod5") = chmod(4)
                        Session.Item("SIRECA2chmod6") = chmod(5)
                        Session.Item("SIRECA2chmod7") = chmod(6)
                        Session.Item("SIRECA2chmod8") = chmod(7)
                        Session.Item("SIRECA2chmod9") = chmod(8)
                        Session.Timeout = 120
                        '--------------------------
                        Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
                        Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
                        catCMD2.CommandText = "SELECT [subdel],[user_type] FROM [sireca].[dbo].[Usuarios] WHERE [id] = " & Session.Item("SIRECAid")
                        nwindConn2.Open()
                        Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
                        num = 0
                        Session.Timeout = 120
                        Do While myReader2.Read()
                            num = num + 1
                            Session().Item("SIRECAuser_type") = myReader2.GetValue(1)
                            Exit Do
                            'For i As Integer = 0 To (myReader2.FieldCount - 1)
                            'Session().Item("SATICsubdel") = myReader.GetValue(0)
                            'Session().Item("SATICuser_type") = myReader.GetValue(1)            
                            'Next i
                        Loop
                        Session.Timeout = 120
                        myReader2.Close()
                        nwindConn2.Close()

                        '-----------------------------------------------------------------------------------
                        '-------historial INICIO--------------------
                        If Session.Item("SIRECAchmod7").ToString.Equals("x") Or Session.Item("SIRECAchmod7").ToString.Equals("0") Then
                            Dim con2 As New OleDbConnection(cadenaconexion)
                            Dim cmd2 As New OleDbCommand()
                            cmd2.Connection = con2
                            Dim myInsertQuery2 As String = "INSERT INTO [sireca].[dbo].[historial] ([fecha],[usuario],[subdel],[accion],[hostname],[ip])"
                            myInsertQuery2 += " values(?, ?, ?, ?, ?, ?)"
                            cmd2.CommandText = myInsertQuery2
                            cmd2.Parameters.Add("@fecha", OleDbType.Date).Value = Now
                            cmd2.Parameters.Add("@usuario", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
                            cmd2.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString
                            cmd2.Parameters.Add("@accion", OleDbType.VarChar).Value = "inicio session"
                            cmd2.Parameters.Add("@hostname", OleDbType.VarChar).Value = Request.UserHostName
                            cmd2.Parameters.Add("@ip", OleDbType.VarChar).Value = Request.UserHostAddress()
                            con2.Open()
                            cmd2.ExecuteNonQuery()
                            con2.Close()
                        End If
                        '-------historial FIN--------------------
                        ' tipo 7 es supervisor y se le pueden asignar casos
                        ' tipo 0 es supervisor y no se le pueden asignar casos
                        If Session.Item("SIRECAuser_type").ToString.Equals("1") Then
                            Response.Redirect("~/cobros/ejecutor.aspx")
                        ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") Or Session.Item("SIRECAuser_type").ToString.Equals("7") Then
                            Response.Redirect("~/cobros/supervisorinforme.aspx")
                        End If
                    Else
                        Label1.Text = "Usuario / Contraceñas Incorrectos."
                    End If
                Else
                    Session.Abandon()
                    Label1.Text = "Usuario Sin ACCESO AL SISTEMA."
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub TBPass_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles TBPass.PreRender, TBUser.PreRender
        Try
            validarUserPass()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Try
            validarUserPass()
        Catch ex As Exception

        End Try
    End Sub
End Class
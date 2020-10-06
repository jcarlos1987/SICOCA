Imports System.Data.OleDb

Public Class cargarRale
    Inherits System.Web.UI.Page
    Private NOM_RALE As String = ""
    Private BD_FECHA As String = ""
    Private BD_TIPOECO As String = ""
    Private BD_DEL As String = ""
    Private BD_SUB As String = ""
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECA2chmod1").ToString.Equals("CR") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If            
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim ruta As String = ""
        If FileUpload1.FileName.Replace(" ", "").Equals("") Then
            Label1.Text = "Seleccione el RALE a Cargar."
        Else
            Label1.Text = ""
            ruta = Server.MapPath("~") & "\temp\" & FileUpload1.FileName
            If System.IO.File.Exists(ruta) Then
                Label1.Text = "RALE " + FileUpload1.FileName + " Cargado."
            Else
                Dim nombreRale As String = ""
                'carga del archivo
                FileUpload1.SaveAs(ruta)
                'lectura del archivo
                Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
                'escritura del archivo
                Dim archivoSalida As New System.IO.StreamWriter(ruta + ".txt")
                Dim fila As String = ""
                Dim indice As Integer = 1
                fila = fs.ReadLine
                While fs.Peek > -1
                    indice += 1
                    fila = fs.ReadLine
                    If indice = 3 Then
                        'optenioendo la delegacion y subdelegacion
                        nombreRale = fila.Trim.Replace("COBR", "")
                        BD_DEL = nombreRale.Substring(0, 2)
                        BD_SUB = nombreRale.Substring(2)
                    ElseIf indice = 4 Then
                        'opteniendo lo que falta para el nombre del rale
                        NOM_RALE = nombreRale & getNombreRale(fila)
                    Else
                        'opteniendo solo los datos
                        fila = fila.TrimEnd(" ")
                        If fila.Split("/").Length >= 6 Then
                            fila = fila.Insert(22, ";")
                            fila = fila.Insert(27, ";")
                            fila = fila.Insert(41, ";")
                            fila = fila.Insert(46, ";")
                            fila = fila.Insert(59, ";")
                            fila = fila.Insert(65, ";")
                            fila = fila.Insert(75, ";")
                            fila = fila.Insert(80, ";")
                            fila = fila.Insert(94, ";")
                            fila = fila.Insert(100, ";")
                            fila = fila.Insert(113, ";")
                            fila = fila.Insert(121, ";")
                            fila = fila.Replace(",", "")
                            fila = fila.Replace(" ", "")
                            archivoSalida.WriteLine(fila.Trim(" "))
                        End If
                    End If
                End While
                archivoSalida.Close()
                fs.Close()
                Label1.Text = archivoFiltrado(ruta + ".txt")
            End If
        End If
    End Sub
    Private Function archivoFiltrado(ByVal ruta As String)
        'lectura del archivo
        Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
        'escritura del archivo
        Dim rutaRaleFinal As String = Server.MapPath("~") + "\temp\" + NOM_RALE + ".csv"
        Dim archivoSalida As New System.IO.StreamWriter(rutaRaleFinal)
        Dim fila As String = ""
        Dim fila1() As String = {}
        Dim fila2() As String = {}
        If fs.Peek > -1 Then
            fila1 = fs.ReadLine.Split(";")
            While True
                fila = ""
                If fs.Peek > -1 Then
                    'lee la siguiente linea
                    fila2 = fs.ReadLine.Split(";")
                    'compara la fila1 con la fila2 y lo autoacompleta
                    For i As Int32 = 0 To (fila1.Length - 1)
                        If fila2.GetValue(i).Equals("") And i < 4 Then
                            fila2(i) = fila1.GetValue(i)
                        End If
                    Next
                    'impresion de la fila
                    Dim periodo As String = ""
                    For i As Int32 = 0 To (fila1.Length - 1)
                        If i <> 6 Then
                            fila += fila1.GetValue(i) + ";"
                        End If
                    Next
                    archivoSalida.WriteLine(fila + ";01/" + fila1.GetValue(6).ToString.Replace("13/", "12/"))
                    fila1 = fila2
                Else
                    'escribiendo la ultima linea
                    Dim periodo As String = ""
                    For i As Int32 = 0 To (fila1.Length - 1)
                        If i <> 6 Then
                            fila += fila1.GetValue(i) + ";"
                        End If
                    Next
                    archivoSalida.WriteLine(fila + ";01/" + fila1.GetValue(6).ToString.Replace("13/", "12/"))
                    'termina el ciclo while
                    Exit While
                End If
            End While
        End If
        archivoSalida.Close()
        fs.Close()
        Return subirAlServidor(rutaRaleFinal, NOM_RALE)
    End Function
    Private Function subirAlServidor(ByVal ruta As String, ByVal nomRale As String)
        Dim estado As String = ""
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = "CREATE TABLE [rale].[dbo].[" + nomRale + "]( "
            textConmand += "	[REGPATR] [nvarchar](25) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[MOV] [nvarchar](3) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[FMOV] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[SECTOR] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[NUMCRED] [nvarchar](18) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[CE] [nvarchar](4) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[TD] [nvarchar](4) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[FALTA] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[INC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[FEINC] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[DIAS] [int] NULL, "
            textConmand += "	[IMPORTE] [money] NULL, "
            textConmand += "	[OBSERVA] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[PERIODO] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL "
            textConmand += ") ON [PRIMARY] "
            textConmand += "BULK INSERT [rale].[dbo].[" + nomRale + "] "
            textConmand += "FROM '" + ruta + "' "
            textConmand += "WITH( "
            textConmand += "FIELDTERMINATOR=';', "
            textConmand += "ROWTERMINATOR='\n', "
            textConmand += "FIRE_TRIGGERS "
            textConmand += ")"
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                estado = "Problemas con la actualizacion"
            Else
                agrgarTablaRales(nomRale)
                estado = "RALE Actualizada, envie un correo al Administrador del sistema para Generar los archivos de actualizacion de Visual CuWe (.jswe)"
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = "El RALE ya se encuentra cargado"
        End Try
        Return estado
    End Function
    Private Sub agrgarTablaRales(ByVal nomRale As String)
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = "INSERT INTO [rale].[dbo].[tablas]([name],[del],[subdel],[origen],[tipo],[fecha])"
        myInsertQuery2 += " values(?, ?, ?, ?, ?, ?)"
        cmd2.CommandText = myInsertQuery2
        cmd2.Parameters.Add("@name", OleDbType.VarChar).Value = nomRale
        cmd2.Parameters.Add("@del", OleDbType.VarChar).Value = BD_DEL
        cmd2.Parameters.Add("@subdel", OleDbType.VarChar).Value = BD_SUB
        cmd2.Parameters.Add("@origen", OleDbType.VarChar).Value = "A"
        cmd2.Parameters.Add("@tipo", OleDbType.VarChar).Value = BD_TIPOECO
        cmd2.Parameters.Add("@fecha", OleDbType.Date).Value = Convert.ToDateTime(BD_FECHA)
        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
        historial()
    End Sub
    Private Sub historial()
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = "INSERT INTO [sireca].[dbo].[historial] ([fecha],[usuario],[subdel],[accion],[hostname],[ip])"
        myInsertQuery2 += " values(?, ?, ?, ?, ?, ?)"
        cmd2.CommandText = myInsertQuery2
        cmd2.Parameters.Add("@fecha", OleDbType.Date).Value = Now
        cmd2.Parameters.Add("@usuario", OleDbType.VarChar).Value = Session.Item("SIRECAnombre").ToString
        cmd2.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString
        cmd2.Parameters.Add("@accion", OleDbType.VarChar).Value = "Cargo RALE: " & NOM_RALE
        cmd2.Parameters.Add("@hostname", OleDbType.VarChar).Value = Request.UserHostName
        cmd2.Parameters.Add("@ip", OleDbType.VarChar).Value = Request.UserHostAddress()
        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
    End Sub
    Private Function getNombreRale(ByVal fila As String)
        'opteniendo tipo de archivo
        If fila.IndexOf("R.C.V.") = -1 Then
            BD_TIPOECO = "COP"
        Else
            BD_TIPOECO = "RCV"
        End If
        BD_FECHA = fila.TrimEnd().Split(" ").GetValue(fila.TrimEnd().Split(" ").Length - 1)
        Dim fecha() As String = BD_FECHA.Split("/")
        Dim fechaAux As String = fecha(0) + fecha(1) + fecha(2).Substring(2)
        If fechaAux.Length < 6 Then
            fechaAux = "0" + fechaAux
        End If
        'opteniendo la fecha del archiv
        Return ("A" + BD_TIPOECO + fechaAux)
    End Function


End Class
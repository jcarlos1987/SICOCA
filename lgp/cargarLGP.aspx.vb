Imports System.Data.OleDb
Imports System.IO
Imports Ionic.Zip
Imports System.Web

Public Class cargarLGP
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim archivoASubir As String = ""
    Dim contArchivos As Int32 = 0
    Dim DELEGACION As String = ""
    Dim SUBDELEGACION As String = ""
    Dim PERIODO As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECA2chmod3").ToString.Equals("CL") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim ruta As String = ""
        Try
            If FileUpload1.FileName.Replace(" ", "").Equals("") Then
                Label1.Text = "Seleccione el LGP a Cargar."
            Else
                Label1.Text = Request.UserHostAddress.Replace(".", "_")
                ruta = Server.MapPath("~") & "\temp\lgp\" & Session.Item("SIRECAid") & "_" & FileUpload1.FileName
                Directory.CreateDirectory(Server.MapPath("~") & "\temp\lgp\temp")
                If File.Exists(ruta) Then
                    Label1.Text = "LGP " + FileUpload1.FileName + " Cargado."
                Else
                    'carga del archivo
                    FileUpload1.SaveAs(ruta)
                    Extraerzip(ruta)
                End If
            End If
        Catch ex As Exception
            Label2.Text = "Error verifique que el archivo .ZIP sea el correcto." & ex.StackTrace & ex.Message
        End Try
    End Sub
    Private Sub Extraerzip(ByVal ruta As String)
        contArchivos = 0
        'Dim archivoASubir As String = Server.MapPath("~") & "\temp\lgp\cargados\del" & "sub" & ".txt"
        If Directory.Exists(Server.MapPath("~") & "\temp\lgp\temp" & Request.UserHostName.Replace(".", "_")) Then
            Directory.Delete(Server.MapPath("~") & "\temp\lgp\temp" & Request.UserHostName.Replace(".", "_"), True)
        End If
        Directory.CreateDirectory(Server.MapPath("~") & "\temp\lgp\temp" & Request.UserHostName.Replace(".", "_"))
        Using zip As ZipFile = ZipFile.Read(ruta)
            zip.StatusMessageTextWriter = System.Console.Out
            zip.ExtractAll(Server.MapPath("~") & "\temp\lgp\temp" & Request.UserHostName.Replace(".", "_"))
            'leer archivos
            Dim archivos As String() = Directory.GetFiles(Server.MapPath("~") & "\temp\lgp\temp" & Request.UserHostName.Replace(".", "_"))
            'Extracioon de la delegacion y subdelegacion en el archivo .CTL
            For i As Int32 = 0 To (archivos.Length - 1)
                If (archivos.GetValue(i).ToString.Contains(".CTL")) Then
                    Dim fs As System.IO.StreamReader = System.IO.File.OpenText(archivos.GetValue(i).ToString)
                    Dim lineaIndex As Int32 = 0
                    Dim lineaDato As String = ""
                    While fs.Peek > -1
                        lineaIndex += 1
                        lineaDato = fs.ReadLine
                        If lineaIndex = 1 Then
                            DELEGACION = lineaDato.Substring(5, 2)
                            SUBDELEGACION = lineaDato.Substring(7, 2)
                        ElseIf lineaIndex = 2 Then
                            PERIODO = lineaDato.Substring(14, 7).Replace("/", "_")
                        Else
                            Exit While
                        End If
                    End While
                    fs.Close()
                    Exit For
                End If
            Next
            '1_escribir archivo
            archivoASubir = Server.MapPath("~") & "\temp\lgp\cargados\" & DELEGACION & SUBDELEGACION & "_" & PERIODO
            If File.Exists(archivoASubir) Then
                Label1.Text = "Ya se encuentra cargado el LGP de la Delegacion: " & DELEGACION & " con Subdelegacion: " & SUBDELEGACION & ", del sierre de pago:" & PERIODO
            Else
                Dim archivoSalida As New System.IO.StreamWriter(archivoASubir)
                'Extraccion de los archivos TXT con los datos a cargar
                For i As Int32 = 0 To (archivos.Length - 1)
                    If (archivos.GetValue(i).ToString.Contains(".TXT")) Then
                        contArchivos += 1
                        LeerArchivo(archivos.GetValue(i).ToString, archivoSalida)
                    End If
                Next
                '3_cerrar archivo
                archivoSalida.Close()
                subirAlServidor(archivoASubir.Replace("\\", "\"))
            End If
        End Using
    End Sub
    Private Sub LeerArchivo(ByVal ruta As String, ByVal archivoSalida As StreamWriter)
        '1_leer archivo
        Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
        Dim fila As String = ""
        Dim columnas As String() = {}
        Dim index As Int32 = 0
        While fs.Peek > -1
            index += 1
            '2_leer linea de archivo
            If index > 1 Then
                fila = fs.ReadLine
                columnas = fila.Split(",")
                Dim nuevaFila As String = ""
                For i As Int32 = 0 To (columnas.Length - 1)
                    If i = 0 Then
                        nuevaFila += columnas.GetValue(i)
                    ElseIf i = 6 Then
                        nuevaFila += ";" + columnas.GetValue(i) + ";" + DELEGACION + ";" + SUBDELEGACION
                    Else
                        nuevaFila += ";" + columnas.GetValue(i)
                    End If
                Next
                archivoSalida.WriteLine(nuevaFila)
            Else
                fila = fs.ReadLine
            End If
        End While
        '3_cerrar archivo
        fs.Close()
    End Sub
    Private Sub subirAlServidor(ByVal ruta As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " BULK INSERT [lgp].[dbo].[RC]  "
        textConmand += " FROM '" & ruta & "' "
        textConmand += " WITH( "
        textConmand += " FIELDTERMINATOR=';', "
        textConmand += " ROWTERMINATOR='\n', "
        textConmand += " FIRE_TRIGGERS "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim contDatos As Int32 = catCMD.ExecuteNonQuery()
        If (contDatos <= 0) Then
            Label1.Text = "Problemas con la actualizacion."
        Else
            Label1.Text = "Archivos cargados: " & contArchivos & ", con: " & contDatos & " Registros de LGP Delagacion:" & DELEGACION & " con Subdelegacion:" & SUBDELEGACION & ", pagos del cierre de " & PERIODO & " Cargada."
            GridView1.DataSourceID = "SqlDataSourceDepuracionPRO"
            GridView1.DataBind()
        End If
        nwindConn.Close()
    End Sub
End Class
Imports Ionic.Zip
Imports System.IO
Imports System.Data.OleDb

Public Class _default41
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            If DDLTipoSivepa.SelectedValue.Equals("-") Then
                Label1.Text = "Seleccione el TIPO de SIVEPA a Cargar."
            Else
                Dim ruta As String = ""
                If FileUpload1.FileName.Replace(" ", "").Equals("") Then
                    Label1.Text = "Seleccione el SIVEPA a Cargar."
                Else
                    If Not Directory.Exists(Server.MapPath("~") & "\temp\sivepas\") Then
                        Directory.CreateDirectory(Server.MapPath("~") & "\temp\sivepas\")
                    End If
                    Label1.Text = ""
                    ruta = Server.MapPath("~") & "\temp\sivepas\" & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FileUpload1.FileName
                    'ruta = ruta.Replace(".zip", "")
                    If System.IO.File.Exists(ruta) Then
                        Label1.Text = "SIVEPA " + FileUpload1.FileName + " Cargado."
                    Else
                        Dim fechaSivepa As String = ""
                        Dim periodoSivepa As String = ""
                        'carga del archivo
                        FileUpload1.SaveAs(ruta)
                        'extraccion del archivo
                        Using zip As ZipFile = ZipFile.Read(ruta)
                            zip.StatusMessageTextWriter = System.Console.Out
                            'Status Messages will be sent to the console during extraction
                            zip.ExtractAll(ruta.Replace(".zip", ""))
                        End Using
                        Dim frale As String() = Directory.GetFiles(ruta.Replace(".zip", ""))
                        For i As Int32 = 0 To (frale.Length - 1)
                            ruta = frale.GetValue(i).ToString
                            Exit For
                        Next
                        'lectura del archivo
                        Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
                        'escritura del archivo
                        Dim archivoSalida As New System.IO.StreamWriter(ruta + ".txt")
                        Dim fila As String = ""
                        Dim tipoSivepa As String = ""
                        Dim indice As Integer = 1
                        fila = fs.ReadLine
                        While fs.Peek > -1
                            indice += 1
                            fila = fs.ReadLine
                            If indice = 4 Then
                                'optenioendo la fecha del SIVEPA ->SIVEPA-IMSS,SIVEPA RCV
                                fechaSivepa = fila.Substring(90)
                                If fila.Contains("SIVEPA-IMSS") Then
                                    tipoSivepa = "SIVEPA-IMSS"
                                ElseIf fila.Contains("SIVEPA RCV") Then
                                    tipoSivepa = "SIVEPA-RCV"
                                End If
                            ElseIf indice = 5 Then
                                'obtencion del periodo del SIVEPA ->BAJA 251
                                periodoSivepa = "01/" + fila.Split(":").GetValue(2).ToString.Replace(" ", "").Substring(0, 7).Split("/").GetValue(1) + "/" + fila.Split(":").GetValue(2).ToString.Replace(" ", "").Substring(0, 7).Split("/").GetValue(0)
                            Else
                                'opteniendo solo los datos
                                If fila.Length = 139 Then
                                    fila = fila.Insert(3, ";") '0
                                    fila = fila.Insert(5 + 1, ";") '1
                                    fila = fila.Insert(8 + 2, ";") '2
                                    fila = fila.Insert(22 + 3, ";") '3
                                    fila = fila.Insert(25 + 4, ";") '4
                                    fila = fila.Insert(51 + 5, ";") '5
                                    fila = fila.Insert(61 + 6, ";") '6
                                    fila = fila.Insert(72 + 7, ";") '7
                                    fila = fila.Insert(82 + 8, ";") '8
                                    fila = fila.Insert(84 + 9, ";") '9
                                    fila = fila.Insert(89 + 10, ";") '10
                                    fila = fila.Insert(98 + 11, ";") '11
                                    fila = fila.Insert(111 + 12, ";") '12
                                    fila = fila.Insert(124 + 13, ";") '13
                                    Dim filasTokens As String() = fila.Split(";")
                                    Dim filasClear As String = ""
                                    For i As Int32 = 0 To (filasTokens.Length - 1)
                                        If i > 6 Then
                                            filasClear = filasClear + IIf(filasTokens.GetValue(i).ToString.TrimStart.TrimEnd.IndexOf(".").ToString.Equals("0"), "0" + filasTokens.GetValue(i).ToString.TrimStart.TrimEnd.Replace(",", ""), filasTokens.GetValue(i).ToString.TrimStart.TrimEnd.Replace(",", "")) + ";"
                                        ElseIf i = 3 Then
                                            filasClear = filasClear + filasTokens.GetValue(i).ToString.Replace(" ", "") + ";"
                                        Else
                                            filasClear = filasClear + filasTokens.GetValue(i).ToString.TrimStart.TrimEnd + ";"
                                        End If
                                    Next
                                    archivoSalida.WriteLine(DDLTipoSivepa.SelectedValue + ";" + tipoSivepa + ";" + fechaSivepa + ";" + periodoSivepa + ";" + filasClear.TrimEnd(";") + ";" + Request.UserHostAddress + ";" + Session.Item("SIRECAid").ToString)
                                End If
                            End If
                        End While
                        archivoSalida.Close()
                        fs.Close()
                        'Label1.Text = archivoFiltrado(ruta + ".txt")
                        elimTableTempsivepa()
                        cargarCreditos(ruta + ".txt")
                        agregarSivepa()
                        agregarPatronesSivepa()
                        DDLTipoSivepa.SelectedValue = "-"
                    End If
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub elimTableTempsivepa()
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " if exists(select * from sirecasivepas.dbo.sysobjects where name = 'tempsivepa')  "
        textConmand += "	begin "
        textConmand += "	drop table sirecasivepas.dbo.tempsivepa "
        textConmand += "	end "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        If (catCMD.ExecuteNonQuery() <= 0) Then
            'estado = "Problemas con la actualizacion"
        Else
            'estado = "RALE Actualizada, envie un correo al Administrador del sistema para Generar los archivos de actualizacion de Visual CuWe (.jswe)"
        End If
        nwindConn.Close()
    End Sub
    Protected Sub cargarCreditos(ByVal ruta As String)
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " CREATE TABLE [sirecasivepas].[dbo].[tempsivepa]( "
            textConmand += " [SV_TIPO] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_SIVEPA] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_FECHA] [datetime] NULL, "
            textConmand += " [SV_PERIODO] [datetime] NULL, "
            textConmand += " [SV_DEL] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_SUBDEL] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_NUM] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_REG_PATRONAL] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_CD] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_RAZON_SOCIAL] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_CREDITO] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_COTIZ] [float] NULL, "
            textConmand += " [SV_DIAS] [float] NULL, "
            textConmand += " [SV_C] [float] NULL, "
            textConmand += " [SV_ACT] [float] NULL, "
            textConmand += " [SV_PRIMA] [float] NULL, "
            textConmand += " [SV_EMI_REAL] [float] NULL, "
            textConmand += " [SV_RECAUDACION] [float] NULL, "
            textConmand += " [SV_DIFERENCIA] [float] NULL, "
            textConmand += " [SV_IP_CARGA] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " [SV_ID_USUARIO] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += " ) ON [PRIMARY] "
            textConmand += " BULK INSERT [sirecasivepas].[dbo].[tempsivepa] "
            textConmand += " FROM '" + ruta + "' "
            textConmand += " WITH( "
            textConmand += " FIELDTERMINATOR=';', "
            textConmand += " ROWTERMINATOR='\n', "
            textConmand += " FIRE_TRIGGERS "
            textConmand += " ) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                'estado = "Problemas con la actualizacion"
            Else
                'estado = "RALE Actualizada, envie un correo al Administrador del sistema para Generar los archivos de actualizacion de Visual CuWe (.jswe)"
            End If
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
            'estado = "El RALE ya se encuentra cargado"
        End Try
    End Sub
    Protected Sub agregarSivepa()
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " INSERT INTO [sirecasivepas].[dbo].[SV_BASE] "
            textConmand += " SELECT tsiv.*,getdate(),NULL,NULL,NULL,NULL,NULL,NULL "
            textConmand += " FROM [sirecasivepas].[dbo].[tempsivepa] as tsiv "
            textConmand += " WHERE not exists( "
            textConmand += " SELECT rsiv.[SV_REG_PATRONAL] FROM [sirecasivepas].[dbo].[SV_BASE] as rsiv "
            textConmand += " WHERE rsiv.[SV_TIPO]=tsiv.[SV_TIPO] "
            textConmand += " and rsiv.[SV_SIVEPA]=tsiv.[SV_SIVEPA] "
            textConmand += " and rsiv.[SV_FECHA]=tsiv.[SV_FECHA] "
            textConmand += " and rsiv.[SV_PERIODO]=tsiv.[SV_PERIODO] "
            textConmand += " and rsiv.[SV_DEL]=tsiv.[SV_DEL] "
            textConmand += " and rsiv.[SV_SUBDEL]=tsiv.[SV_SUBDEL] "
            textConmand += " and rsiv.[SV_NUM]=tsiv.[SV_NUM] "
            textConmand += " and rsiv.[SV_REG_PATRONAL]=tsiv.[SV_REG_PATRONAL] "
            textConmand += " and rsiv.[SV_CREDITO]=tsiv.[SV_CREDITO] "
            textConmand += " ) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                'estado = "Problemas con la actualizacion"
            Else
                'estado = "RALE Actualizada, envie un correo al Administrador del sistema para Generar los archivos de actualizacion de Visual CuWe (.jswe)"
            End If
            nwindConn.Close()
        Catch ex As Exception
            'estado = "El RALE ya se encuentra cargado"
        End Try
    End Sub
    Protected Sub agregarPatronesSivepa()
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " insert into [sirecasivepas].[dbo].[SV_CPATRONAL] "
            textConmand += " SELECT  "
            textConmand += " null "
            textConmand += " ,null "
            textConmand += " ,null "
            textConmand += " ,null "
            textConmand += " ,null "
            textConmand += " ,[SV_DEL] "
            textConmand += " ,[SV_SUBDEL] "
            textConmand += " ,[SV_REG_PATRONAL] "
            textConmand += " FROM [sirecasivepas].[dbo].[SV_BASE] "
            textConmand += " where not exists(SELECT [CPSV_REGPAT] FROM [sirecasivepas].[dbo].[SV_CPATRONAL] where [CPSV_REGPAT]=[SV_REG_PATRONAL] and [CPSV_SUBDEL]=[SV_SUBDEL]) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                'estado = "Problemas con la actualizacion"
            Else
                'estado = "RALE Actualizada, envie un correo al Administrador del sistema para Generar los archivos de actualizacion de Visual CuWe (.jswe)"
            End If
            nwindConn.Close()
        Catch ex As Exception
            'estado = "El RALE ya se encuentra cargado"
        End Try
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
End Class
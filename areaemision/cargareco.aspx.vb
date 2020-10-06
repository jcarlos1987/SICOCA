Imports System.IO
Imports Ionic.Zip
Imports System.Data.OleDb

Public Class cargareco
    Inherits System.Web.UI.Page
    Dim isRCV As Boolean = False
    Dim isCOP As Boolean = False
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If Not DDLTipoEco.SelectedValue.Equals("----") Then
        
        Dim ruta As String = ""
        If FileUpload1.FileName.Replace(" ", "").Equals("") Then
            Label1.Text = "Seleccione el .zip a Cargar."
        Else
            Label1.Text = ""
            Dim carpeta As String = Server.MapPath("~\temp\ecos")
            If Not Directory.Exists(carpeta) Then
                Directory.CreateDirectory(carpeta)
            End If
            ruta = carpeta & "\" & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FileUpload1.FileName
            'ruta = ruta.Replace(".zip", "")
            If System.IO.File.Exists(ruta) Then
                File.Delete(ruta)
                Directory.Delete(ruta.Replace(".zip", ""), True)
            End If
            Dim nombreRale As String = ""
            'carga del archivo
            FileUpload1.SaveAs(ruta)
            'extraccion del archivo
            Using zip As ZipFile = ZipFile.Read(ruta)
                zip.StatusMessageTextWriter = System.Console.Out
                'Status Messages will be sent to the console during extraction
                zip.ExtractAll(ruta.Replace(".zip", ""))
            End Using
            Dim frale As String() = Directory.GetFiles(ruta.Replace(".zip", ""))
            Dim b63 As Boolean = False
            Dim b67 As Boolean = False
            For i As Int32 = 0 To (frale.Length - 1)
                ruta = frale.GetValue(i).ToString
                If (ruta.Split("\").GetValue(ruta.Split("\").Length - 1)).Contains("63") Then
                    setcreditos(ruta)
                    subirAlServidor63(ruta + ".txt", isRCV)
                    b63 = True
                ElseIf (ruta.Split("\").GetValue(ruta.Split("\").Length - 1)).Contains("67") Then
                    setsectores(ruta)
                    subirAlServidor67(ruta + ".txt")
                    b67 = True
                End If
            Next
            If b63 And b67 Then
                    Label1.Text = addEcos(isRCV)
            End If
            'End If
        End If
            GridViewCOP.DataBind()
        Else
            Label1.Text = "Seleccione si es Estrategico / Complemento."
        End If
    End Sub

    Protected Sub setcreditos(ByVal ruta As String)
        'lectura del archivo
        Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
        'escritura del archivo
        Dim archivoSalida As New System.IO.StreamWriter(ruta + ".txt")
        Dim fila As String = ""
        Dim indice As Integer = 1
        Dim periodox As String = "0"
        isRCV = False
        isCOP = False
        fila = fs.ReadLine
        While fs.Peek > -1
            indice += 1
            fila = fs.ReadLine.Replace("---------", "")
            'opteniendo solo los datos
            'fila = fila.TrimEnd(" "), 140=COP,134=RCV
            If fila.Contains("OMISOS CUOTAS RCV") Then
                periodox = fila.Substring(fila.LastIndexOf("OMISOS CUOTAS RCV") + 18, 9).Replace(" ", "")
                isRCV = True
            ElseIf fila.Contains("OMISOS CUOTAS IMSS") Then
                periodox = fila.Substring(fila.LastIndexOf("OMISOS CUOTAS IMSS") + 18, 9).Replace(" ", "")
                isCOP = True
            End If
            If isRCV Then
                'si es RCV
                If fila.Length = 134 Then
                    If Not fila.Contains("REG.PATRONAL") Then
                        fila = fila.Insert(3, ";") '0
                        fila = fila.Insert(5 + 1, ";") '1
                        fila = fila.Insert(8 + 2, ";") '2
                        fila = fila.Insert(19 + 3, ";") '3
                        fila = fila.Insert(22 + 4, ";") '4
                        fila = fila.Insert(48 + 5, ";") '5
                        fila = fila.Insert(58 + 6, ";") '6
                        fila = fila.Insert(66 + 7, ";") '7
                        fila = fila.Insert(72 + 8, ";") '8
                        fila = fila.Insert(74 + 9, ";") '9
                        fila = fila.Insert(79 + 10, ";") '10
                        fila = fila.Insert(91 + 11, ";") '11
                        fila = fila.Insert(102 + 12, ";") '12
                        fila = fila.Insert(112 + 13, ";") '13
                        fila = fila.Insert(122 + 14, ";") '14
                        fila = fila.Replace(",", "") '16
                        Dim vfila As String = ""                        
                        For i As Int32 = 0 To (fila.Split(";").Count - 1)
                            If i = 4 Then
                                vfila += fila.Split(";").GetValue(i).ToString.Replace(" ", "").Replace("&", "") + ";"
                            ElseIf i = 5 Then
                                vfila += fila.Split(";").GetValue(i).ToString + ";"
                            Else
                                vfila += fila.Split(";").GetValue(i).ToString.Replace(" ", "") + ";"
                            End If
                        Next
                        archivoSalida.WriteLine(vfila.Replace(";.", ";0.") + CStr(CInt(periodox.Split("/").GetValue(1).ToString) * 2) + periodox.Split("/").GetValue(0).ToString + ";")
                    End If
                End If
            ElseIf isCOP Then
                'si es COP
                If fila.Length = 140 Then
                    If Not fila.Contains("REG.PATRONAL") Then
                        fila = fila.Insert(3, ";") '0
                        fila = fila.Insert(5 + 1, ";") '1
                        fila = fila.Insert(8 + 2, ";") '2
                        fila = fila.Insert(19 + 3, ";") '3
                        fila = fila.Insert(24 + 4, ";") '4
                        fila = fila.Insert(48 + 5, ";") '5
                        fila = fila.Insert(58 + 6, ";") '6
                        fila = fila.Insert(64 + 7, ";") '7
                        fila = fila.Insert(71 + 8, ";") '8
                        fila = fila.Insert(73 + 9, ";") '9
                        fila = fila.Insert(78 + 10, ";") '10
                        fila = fila.Insert(87 + 11, ";") '11
                        fila = fila.Insert(98 + 12, ";") '12
                        fila = fila.Insert(109 + 13, ";") '13
                        fila = fila.Insert(118 + 14, ";") '14
                        fila = fila.Insert(128 + 15, ";") '15
                        fila = fila.Replace(",", "")
                        Dim vfila As String = ""
                        For i As Int32 = 0 To (fila.Split(";").Count - 1)
                            If i = 4 Then
                                vfila += fila.Split(";").GetValue(i).ToString.Replace(" ", "").Replace("&", "") + ";"
                            ElseIf i = 5 Then
                                vfila += fila.Split(";").GetValue(i).ToString + ";"
                            Else
                                vfila += fila.Split(";").GetValue(i).ToString.Replace(" ", "") + ";"
                            End If
                        Next
                        archivoSalida.WriteLine(vfila.Replace(";.", ";0.") + periodox.Split("/").GetValue(1).ToString + periodox.Split("/").GetValue(0).ToString)
                    End If
                End If
            End If
        End While
        archivoSalida.Close()
        fs.Close()
        'Label1.Text = archivoFiltrado(ruta + ".txt")
    End Sub

    Protected Sub setsectores(ByVal ruta As String)
        'lectura del archivo
        Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
        'escritura del archivo
        Dim archivoSalida As New System.IO.StreamWriter(ruta + ".txt")
        Dim fila As String = ""
        Dim indice As Integer = 1
        Dim sectorLocalizado As String = "0"
        fila = fs.ReadLine
        While fs.Peek > -1
            indice += 1
            fila = fs.ReadLine
            If fila.Contains("SECTOR DE NOTIFICACION   :") Then
                sectorLocalizado = fila.Substring(fila.LastIndexOf("SECTOR DE NOTIFICACION   :")).Replace(":", ";")
            End If
            If fila.Length = 104 Then
                fila = fila.Insert(11, ";") '0
                fila = fila.Insert(25 + 1, ";") '1
                archivoSalida.WriteLine(fila.Replace("-", "").Replace(" ", "") + ";" + sectorLocalizado.Replace(" ", ""))
            End If
        End While
        archivoSalida.Close()
        fs.Close()
        'Label1.Text = archivoFiltrado(ruta + ".txt")
    End Sub

    Private Function subirAlServidor63(ByVal ruta As String, ByVal istiporcv As Boolean)
        Dim estado As String = ""
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = ""
            textConmand += " if exists(select * from tempdb.dbo.sysobjects where name = 'eco63" + DDLSubdel.SelectedValue + "')  "
            textConmand += " begin "
            textConmand += " drop table [tempdb].[dbo].[eco63" + DDLSubdel.SelectedValue + "] "
            textConmand += " end "
            textConmand += " CREATE TABLE [tempdb].[dbo].[eco63" + DDLSubdel.SelectedValue + "]( "
            textConmand += " [a63_del] [nvarchar](255) NULL, "
            textConmand += " [a63_subdel] [nvarchar](255) NULL, "
            textConmand += " [a63_a] [nvarchar](255) NULL, "
            textConmand += " [a63_regpat] [nvarchar](255) NULL, "
            textConmand += " [a63_tp] [float] NULL, "
            textConmand += " [a63_razon] [nvarchar](255) NULL, "
            textConmand += " [a63_credito] [nvarchar](255) NULL, "
            textConmand += " [a63_cotiz] [float] NULL, "
            textConmand += " [a63_dias] [float] NULL, "
            textConmand += " [a63_cl] [float] NULL, "
            If Not istiporcv Then
                textConmand += " [a63_prima] [float] NULL, "
            End If
            textConmand += " [a63_act] [float] NULL, "
            textConmand += " [a63_omision] [float] NULL, "
            textConmand += " [a63_copact] [float] NULL, "
            textConmand += " [a63_recargos] [float] NULL, "
            textConmand += " [a63_multa] [float] NULL, "
            textConmand += " [a63_total] [float] NULL, "            
            textConmand += " [a63_periodo] [float] NULL, "
            If istiporcv Then
                textConmand += " [a63_prima] [float] NULL "
            End If
            textConmand += " ) ON [PRIMARY] "
            textConmand += "BULK INSERT [tempdb].[dbo].[eco63" + DDLSubdel.SelectedValue + "] "
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
                estado = "Actualizada"
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = "Ya se encuentra cargado. "
        End Try
        Return estado
    End Function

    Private Function subirAlServidor67(ByVal ruta As String)
        Dim estado As String = ""
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = ""
            textConmand += " if exists(select * from tempdb.dbo.sysobjects where name = 'eco67" + DDLSubdel.SelectedValue + "')  "
            textConmand += " begin "
            textConmand += " drop table [tempdb].[dbo].[eco67" + DDLSubdel.SelectedValue + "] "
            textConmand += " end "            
            textConmand += " CREATE TABLE [tempdb].[dbo].[eco67" + DDLSubdel.SelectedValue + "]( "
            textConmand += " [a67_x1] [nvarchar](255) NULL, "
            textConmand += " [a67_regpat] [nvarchar](255) NULL, "
            textConmand += " [a67_x2] [nvarchar](255) NULL, "
            textConmand += " [a67_x3] [nvarchar](255) NULL, "
            textConmand += " [a67_sector] [nvarchar](255) NULL "
            textConmand += " ) ON [PRIMARY] "
            textConmand += "BULK INSERT [tempdb].[dbo].[eco67" + DDLSubdel.SelectedValue + "] "
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
                estado = "Actualizada"
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = "Ya se encuentra cargado. "
        End Try
        Return estado
    End Function

    Private Function addEcos(ByVal esRcv As Boolean) As String
        Dim estado As String = ""
        Try
            Dim tipoeco As String = ""
            If esRcv Then
                If DDLTipoEco.SelectedValue.Equals("ESTR") Then
                    tipoeco = "RCV"
                Else
                    tipoeco = "RCVCOMP"
                End If
            Else
                If DDLTipoEco.SelectedValue.Equals("ESTR") Then
                    tipoeco = "COP"
                Else
                    tipoeco = "COMP"
                End If
            End If
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = ""
            textConmand += " insert into sireca.dbo.eco "
            textConmand += " SELECT [a63_regpat] as [REG#PATRONAL] "
            textConmand += " ,[a63_tp] as [TP] "
            textConmand += " ,[a63_razon] as [NOMBRE O RAZON SOCIAL] "
            textConmand += " ,[a63_credito] as [CREDITO] "
            textConmand += " ,[a63_cotiz] as [COTIZ] "
            textConmand += " ,[a63_dias] as [DIAS] "
            textConmand += " ,[a63_cl] as [CL] "
            textConmand += " ,[a63_act] as [ACT#] "
            textConmand += " ,[a63_prima] as [PRIMA] "
            textConmand += " ,[a63_omision] as [OMISION] "
            textConmand += " ,[a63_copact] as [COP/ACT] "
            textConmand += " ,[a63_recargos] as [RECARGOS] "
            textConmand += " ,[a63_multa] as [MULTA] "
            textConmand += " ,[a63_total] as [TOTAL] "
            textConmand += " ,[a63_periodo] as [fechaEco] "
            textConmand += " ,null as [responsable] "
            textConmand += " ,null as [fechaSeleccion] "
            textConmand += " ,9 as [cambiarIncidencia] "
            textConmand += " ,'" + tipoeco + "' as [tipoECO] "
            textConmand += " ,0 as [diasDisponibles] "
            textConmand += " ,null as [clave] "
            textConmand += " ,null as [incidencia] "
            textConmand += " ,null as [nomResponsable] "
            textConmand += " ,null as [horaCitatorio] "
            textConmand += " ,null as [fechaCaptura] "
            textConmand += " ,null as [ecoOriginal] "
            textConmand += " ,'0' as [cobrarMulta] "
            textConmand += " ,[a63_subdel] as [subdel] "
            textConmand += " ,[a67_sector] as [sector] "
            textConmand += " ,'0000' as [grado1] "
            textConmand += " ,null as [grado2] "
            textConmand += " ,null as [grado3] "
            textConmand += " ,null as [responsablePae] "
            textConmand += " ,null as [cambiarIncidenciaPae] "
            textConmand += " ,null as [fechaSeleccionPae] "
            textConmand += " ,null as [validacion] "
            textConmand += " ,null as [pago] "
            textConmand += " ,null as [fech_pago] "
            textConmand += " ,'00' as [incidenciarale] "
            textConmand += " ,null as [tdrale] "
            textConmand += " ,null as [cuatrimestre_ciclo] "
            textConmand += " ,null as [cuatrimestre_num] "
            textConmand += " FROM [tempdb].[dbo].[eco6301] left join [tempdb].[dbo].[eco6701] on [a63_regpat]=[a67_regpat] "
            textConmand += " where not exists( "
            textConmand += " SELECT eco.[CREDITO] FROM [sireca].[dbo].[eco] as eco "
            textConmand += " where [REG#PATRONAL]=[a63_regpat] "
            textConmand += " and eco.[CREDITO]=[a63_credito] "
            textConmand += " and eco.[fechaEco]=[a63_periodo] "
            textConmand += " ) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                estado = "Problemas con la actualizacion"
            Else
                estado = "Base Actualizada."
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = "Problemas al cargar. "
        End Try
        Return estado
    End Function
End Class
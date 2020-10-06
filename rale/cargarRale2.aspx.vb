Imports System.Data.OleDb
Imports Ionic.Zip
Imports System.IO
Imports email

Public Class cargarRale2
    Inherits System.Web.UI.Page
    Private NOM_RALE As String = ""
    Private BD_FECHA As String = ""
    Private BD_TIPOECO As String = ""
    Private BD_DEL As String = ""
    Private BD_SUB As String = ""
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim ruta As String = ""
        If FileUpload1.FileName.Replace(" ", "").Equals("") Then
            Label1.Text = "Seleccione el RALE a Cargar."
        Else
            Label1.Text = ""
            ruta = Server.MapPath("~") & "\temp\" & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FileUpload1.FileName
            'ruta = ruta.Replace(".zip", "")
            If System.IO.File.Exists(ruta) Then
                Label1.Text = "RALE " + FileUpload1.FileName + " Cargado."
            Else
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
                For i As Int32 = 0 To (frale.Length - 1)
                    ruta = frale.GetValue(i).ToString
                    Exit For
                Next
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
                        'fila = fila.TrimEnd(" ")
                        If fila.Split("/").Length >= 5 Then
                            fila = fila.Insert(21, ";") '0
                            fila = fila.Insert(24, ";") '1
                            fila = fila.Insert(36, ";") '2
                            fila = fila.Insert(41, ";") '3
                            fila = fila.Insert(54, ";") '4
                            fila = fila.Insert(57, ";") '5
                            fila = fila.Insert(68, ";") '6
                            fila = fila.Insert(72, ";") '7
                            fila = fila.Insert(86, ";") '8
                            fila = fila.Insert(98, ";") '9
                            fila = fila.Insert(101, ";") '10
                            fila = fila.Insert(105, ";") '11
                            fila = fila.Insert(118, ";") '12
                            fila = fila.Insert(125, ";") '13
                            fila = fila.Insert(141, ";") '14
                            fila = fila.Insert(145, ";") '15
                            fila = fila.Replace(",", "") '16
                            archivoSalida.WriteLine(fila.Replace(" ", "").Replace("0//", ""))
                        End If
                    End If
                End While
                archivoSalida.Close()
                fs.Close()
                Label1.Text = archivoFiltrado(ruta + ".txt")
            End If
        End If
        GridViewJuridico.DataBind()
        GridViewCOP.DataBind()
        GridViewRCV.DataBind()
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
            textConmand += "	[FNOTIFICACION] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, " ' FECH. NOT.
            textConmand += "	[INCD] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, "    ' INC D0
            textConmand += "	[INC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[FEINC] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, "
            textConmand += "	[DIAS] [int] NULL, "
            textConmand += "	[IMPORTE] [money] NULL, "
            textConmand += "	[DC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, "    'DC
            textConmand += "	[SC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, "    'SC
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
                estado = "RALE Actualizada"
                actualizarTabActRecRale()
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = "El RALE ya se encuentra cargado. "
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
    Private Sub actualizarTabActRecRale()
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from rale.dbo.sysobjects where name = 'actYRec') "
            textConmand += " begin"
            textConmand += " drop table [rale].[dbo].[actYRec] "
            textConmand += " end"
            textConmand += " SELECT month('01/'+[PERIODO]) as periodo "
            textConmand += " ,year('01/'+[PERIODO]) as anio "
            textConmand += " ,convert(int,[CPTO]) as concepto "
            textConmand += " ,[ACT] as fac_act "
            textConmand += " ,[REC] as recargos "
            textConmand += " ,[INPC] as incp "
            textConmand += " ,[FEC_APLICACION] as f_aplicacion "
            textConmand += "  into [rale].[dbo].[actYRec] "
            textConmand += " FROM [sirecacobros].[dbo].[tabActRec] "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub

    Private Sub msgFoliosCapturaFaltantes(ByVal vsubdel As String)
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " "
        textConx += " select inc AS INCIDENCIA,(case when folio is not null then 'CON FOLIO' else 'SIN FOLIO' end) AS CASO,count(*) AS CANTIDAD from ( "
        textConx += " select rale.REGPATR as R_REGPATR,rale.NUMCRED as R_NUMCRED,rale.TD,rale.FNOTIFICACION,rale.INC,rale.FEINC,rale.DIAS,rale.IMPORTE,rale.PERIODO  "
        textConx += " ,ce.FOLIO,ce.DIAS_REGISTRO "
        textConx += " from ( "
        textConx += " SELECT * from rale.dbo.[" + getrale(vsubdel, "COP") + "] "
        textConx += " where inc in ('01','02') "
        textConx += " union all "
        textConx += " SELECT * from rale.dbo.[" + getrale(vsubdel, "RCV") + "] "
        textConx += " where inc in ('01','02') "
        textConx += " ) as rale "
        textConx += " LEFT JOIN "
        textConx += " ( "
        textConx += " select "
        textConx += " V_REGPAT AS REGPAT "
        textConx += " ,V_CREDITO AS CREDITO "
        textConx += " ,V_PERIODO AS PERIODO "
        textConx += " ,(case when V_SUBDEL='" + vsubdel + "' then (case "
        textConx += " when [V_INC_CAPTURA]='2' then '2' "
        textConx += " when [V_INC_CAPTURA]='9' then '9' "
        textConx += " when [V_INC_CAPTURA] is null then NULL "
        textConx += " else 'PAGADO' "
        textConx += " end) end) CEDULA_INC "
        textConx += " ,(case when V_SUBDEL='" + vsubdel + "' then [V_FOLIO_P1] end) as FOLIO "
        textConx += " ,(case when V_SUBDEL='" + vsubdel + "' then V_FECHA_P1_TURNADO end) as FECHA_FOLIO "
        textConx += " ,(select sirecacobros.dbo.diasInabiles(V_FECHA_P1_TURNADO,GETDATE())) AS DIAS_REGISTRO "
        textConx += " from sirecaemisiones.dbo.eco where v_subdel='" + vsubdel + "' "
        textConx += " ) AS ce "
        textConx += " on replace(rale.regpatr,'-','')=substring(ce.regpat,1,10) and rale.numcred=ce.credito and rale.periodo=('01/'+ce.periodo) "
        textConx += " ) as re "
        textConx += " WHERE RE.FOLIO IS NOT NULL and DIAS_REGISTRO>=15 "
        textConx += " group by inc,(case when folio is not null then 'CON FOLIO' else 'SIN FOLIO' end) "

        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Dim correoMsg As String = "<h3>SUBDELEGACIÓN: " + vsubdel + "</h3><br/><strong>El siguiente contenido es obtenido de SIRECA el " + Now.ToLongDateString + " (" + Now.ToShortTimeString + ") en el apartado del CICLO 1, RALE POR INCIDENCIA:</strong>"
        'correoMsg += "<br/>Incidencias 01 y 02 con folios sin afectación en SISCOP "
        'correoMsg += "<br/>Donde los folios ya tienen más de 15 días hábiles de haberse creado "
        Dim enviarEmail As Boolean = False
        Do While myReaderx.Read()
            correoMsg += "<br/><br/>&nbsp;&nbsp;&nbsp;La incidencia "
            correoMsg += myReaderx.GetValue(0).ToString + " cuenta con "
            correoMsg += CInt(myReaderx.GetValue(2)).ToString("N0") + " créditos asignados y foliados con resultados donde la fecha de creación del folio ha excedido más de 15 días hábiles."
            enviarEmail = True
        Loop
        correoMsg += "<br/><br/><br/>Este correo se genera con la finalidad" _
        & " de dar seguimiento puntual a los créditos asignados y foliados para su registro" _
        & " en tiempo y forma, quedando bajo su más estricta responsabilidad el debido cumplimiento de este proceso."
        If enviarEmail Then
            eviarMailAlerta(vsubdel, "Creditos Foliados sin Captura en SISCOB de la SUBDELEGACIÓN " + vsubdel, correoMsg, "FoFal")
        End If
        myReaderx.Close()
        nwindConnx.Close()
    End Sub
    Sub eviarMailAlerta(ByVal vsubdel As String, ByVal vasunto As String, ByVal vmsg As String, ByVal vtipoEnvio As String)
        Dim emailx As CorreoEnviar = New CorreoEnviar        
        'emailx.correoEnviar(getCorreosEnvio(vtipoEnvio, "00"), "cc", "co", vasunto, "0", vmsg)
        emailx.correoEnviar(getCorreosEnvio(vtipoEnvio, vsubdel), getCorreosEnvio(vtipoEnvio, "00"), "co", vasunto, "0", vmsg)
    End Sub
    Private Function getCorreosEnvio(ByVal tipoEnvio As String, ByVal subdelEmail As String) As String
        Dim correos As String = ""
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT email "
            consulta += " from fiscamovil.dbo.usuarios as uf inner join sireca.dbo.usuarios as us "
            consulta += " on uf.id=us.id "
            consulta += " where us.correoAuto like '%" + tipoEnvio + "%' and us.subdel in ('" + subdelEmail + "') "
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
            If correos.Equals("") Then
                correos = "sireca@sireca.mx"
            End If
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return correos
    End Function
    Function getrale(ByVal subdel As String, ByVal tipoCopRcv As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 name from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' order by fecha desc "

        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Do While myReaderx.Read()
            Dim vvx As Object = myReaderx.GetValue(0)
            ralex = vvx.ToString
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return ralex
    End Function

    Protected Sub LinkButton5_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton5.Click
        msgFoliosCapturaFaltantes(DDLSubdel.SelectedValue)
    End Sub
End Class
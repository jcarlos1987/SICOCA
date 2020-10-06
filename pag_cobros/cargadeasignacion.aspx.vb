Imports System.IO
Imports System.Data.OleDb
Imports Ionic.Zip

Public Class cargadeasignacion
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod5").ToString.Equals("x") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
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

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        LMensaje.Text = "VERIFIQUE QUE EL ARCHIVO A CARGAR SEA UN CSV, DELIMITADO POR ,"
        LMensaje.ForeColor = Drawing.Color.FromName("#000099")
        If FileUpload1.FileName.ToUpper.Contains(".CSV") Then
            Dim nombreFile As String = Now.ToShortDateString.Replace("/", "") & Now.Hour & Now.Minute & Now.Second & Now.Millisecond & FileUpload1.FileName
            Dim carpeta As String = Server.MapPath("~\temp\asignacion\cobros\" & Session.Item("SIRECAsubdel").ToString)
            If Not Directory.Exists(carpeta) Then
                Directory.CreateDirectory(carpeta)
            End If
            FileUpload1.SaveAs(carpeta & "\" & nombreFile)
            'Carga la asignacion de patrones a los inspectores
            cargarAsignacion(carpeta & "\" & nombreFile)
            'Add los creditos asignados al inspector
            addCredAsignados(DDLSubdel.SelectedValue)
        Else
            LMensaje.Text = "EL ARCHIVO QUE INTENTA SUBIR NO ES UN CSV DELIMITADO POR ,"
            LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
        End If
    End Sub
    Protected Sub cargarAsignacion(ByVal ruta As String)
        Try
            Dim cargados() As String = {}
            Dim nocargados() As String = {}
            Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
            Dim fila As String = ""
            Dim indicecargados As Int32 = 0
            Dim indicenocargados As Int32 = 0
            Dim linea As Int32 = 1
            fila = fs.ReadLine()
            While fs.Peek > -1
                fila = fs.ReadLine()
                If fila.Length > 10 Then
                    If aseptarCarga(fila.Split(",").GetValue(0).ToString, DDLSubdel.SelectedValue, fila.Split(",").GetValue(1).ToString) Then
                        cargarCargaAseptada(fila.Split(",").GetValue(0).ToString, fila.Split(",").GetValue(1).ToString)
                        Array.Resize(cargados, (indicecargados + 1))
                        cargados.SetValue(linea & "," & fila, indicecargados)
                        indicecargados += 1
                    Else
                        Array.Resize(nocargados, (indicenocargados + 1))
                        nocargados.SetValue(linea & "," & fila, indicenocargados)
                        indicenocargados += 1
                    End If
                End If
                linea += 1
            End While
            fs.Close()

            For i As Int16 = 0 To (cargados.Count - 1)
                Dim nuevaFila As TableRow = New TableRow
                For j As Int16 = 0 To 2
                    Dim nuevaColumna As TableCell = New TableCell
                    nuevaColumna.HorizontalAlign = HorizontalAlign.Center
                    nuevaColumna.Text = cargados.GetValue(i).ToString.Split(",").GetValue(j).ToString
                    nuevaFila.Cells.Add(nuevaColumna)
                Next
                TableCargados.Rows.Add(nuevaFila)
            Next
            For i As Int16 = 0 To (nocargados.Count - 1)
                Dim nuevaFila As TableRow = New TableRow
                For j As Int16 = 0 To 2
                    Dim nuevaColumna As TableCell = New TableCell
                    nuevaColumna.HorizontalAlign = HorizontalAlign.Center
                    nuevaColumna.Text = nocargados.GetValue(i).ToString.Split(",").GetValue(j).ToString
                    nuevaFila.Cells.Add(nuevaColumna)
                Next
                TableNoCargados.Rows.Add(nuevaFila)
            Next
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub cargarCargaAseptada(ByVal regpat As String, ByVal inspector As String)
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sirecacobros].[dbo].[CO_CPATRONAL] " _
& " SET [CP_HOST] = '" & Request.UserHostAddress & "' " _
& " ,[CP_FECH_SISTEM] = getdate() " _
& " ,[CP_ID_SUPER] = " & Session.Item("SIRECAid").ToString & " " _
& " ,[CP_FECH_ASIG] = convert(datetime,'" & If(IsDate(TBFechaAsignacion.Text), TBFechaAsignacion.Text, Now.ToShortDateString) & "',103)" _
& " ,[CP_INSPEC] = " & inspector & " " _
& " WHERE CP_REGPAT='" & regpat & "' and CP_SUBDEL='" & DDLSubdel.SelectedValue & "' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()            
        Catch ex As Exception
            'LError.Text = "Error al Actualizar"
        End Try
    End Sub
    Protected Sub addCredAsignados(ByVal subdel As String)
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 += " INSERT INTO [sirecacobros].[dbo].[CO_CRED_ASIG] "
            myInsertQuery22 += " SELECT [CP_HOST] "
            myInsertQuery22 += " ,[CP_FECH_SISTEM] "
            myInsertQuery22 += " ,[CP_ID_SUPER] "
            myInsertQuery22 += " ,[CP_FECH_ASIG] "
            myInsertQuery22 += " ,[CP_INSPEC] "
            myInsertQuery22 += " ,[CP_REGPAT] "
            myInsertQuery22 += " ,[RA_TIPO] "
            myInsertQuery22 += " ,[RA_DEL] "
            myInsertQuery22 += " ,[RA_SUBDEL] "
            myInsertQuery22 += " ,[RA_MOV] "
            myInsertQuery22 += " ,[RA_FMOV] "
            myInsertQuery22 += " ,[RA_SECTOR] "
            myInsertQuery22 += " ,[RA_NUMCRED] "
            myInsertQuery22 += " ,[RA_TD] "
            myInsertQuery22 += " ,[RA_FALTA] "
            myInsertQuery22 += " ,[RA_FNOTIFICACION] "
            myInsertQuery22 += " ,[RA_INC] "
            myInsertQuery22 += " ,[RA_FEINC] "
            myInsertQuery22 += " ,[RA_DIAS] "
            myInsertQuery22 += " ,[RA_IMPORTE] "
            myInsertQuery22 += " ,[RA_DC] "
            myInsertQuery22 += " ,[RA_SC] "
            myInsertQuery22 += " ,[RA_PERIODO] "
            myInsertQuery22 += " FROM [sirecacobros].[dbo].[CO_CPATRONAL] AS CPAT "
            myInsertQuery22 += " inner join [sirecacobros].[dbo].[CO_RALE] AS CRA "
            myInsertQuery22 += " on [RA_REGPATR]=[CP_REGPAT] "
            myInsertQuery22 += " where CP_SUBDEL='" + subdel + "' "
            myInsertQuery22 += " and RA_VIVO='SI' "
            myInsertQuery22 += " AND CONVERT(VARCHAR(10),[CP_FECH_SISTEM],103)=CONVERT(VARCHAR(10),GETDATE(),103) "
            myInsertQuery22 += " AND RA_INC IN ('31','32','43') "
            myInsertQuery22 += " AND CONVERT(DATETIME,RA_PERIODO,103)<CONVERT(DATETIME,'" & getUltimaEcoCargada() & "',103) "
            myInsertQuery22 += " AND NOT EXISTS( "
            myInsertQuery22 += " SELECT CREDA.[CP_REGPAT] "
            myInsertQuery22 += " FROM [sirecacobros].[dbo].[CO_CRED_ASIG] AS CREDA "
            myInsertQuery22 += " WHERE CREDA.[CP_FECH_SISTEM]=CPAT.[CP_FECH_SISTEM] "
            myInsertQuery22 += " AND CREDA.[CP_FECH_ASIG]=CPAT.[CP_FECH_ASIG] "
            myInsertQuery22 += " AND CREDA.[CP_INSPEC]=CPAT.[CP_INSPEC] "
            myInsertQuery22 += " AND CREDA.[CP_REGPAT]=CPAT.[CP_REGPAT] "
            myInsertQuery22 += " AND CREDA.[RA_TIPO]=CRA.[RA_TIPO] "
            myInsertQuery22 += " AND CREDA.[RA_SUBDEL]=CRA.[RA_SUBDEL] "
            myInsertQuery22 += " AND CREDA.[RA_PERIODO]=CRA.[RA_PERIODO] "
            myInsertQuery22 += " AND CREDA.[RA_NUMCRED]=CRA.[RA_NUMCRED] "
            myInsertQuery22 += " ) "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'LError.Text = "Error al Actualizar"
        End Try
    End Sub
    Protected Function getUltimaEcoCargada() As String
        Dim ultimaEcoCargada As String = "01/01/2099"
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT TOP 1 "
            consulta += " CONVERT(VARCHAR(10), "
            consulta += " CONVERT(DATETIME,( "
            consulta += " CASE LEN([fechaEco]) "
            consulta += " WHEN 5 THEN "
            consulta += " '01/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),1,1)+'/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),2,4) "
            consulta += " ELSE "
            consulta += " '01/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),1,2)+'/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),3,4) "
            consulta += " END "
            consulta += " ),103),103) "
            consulta += " FROM [sireca].[dbo].[eco] "
            consulta += " ORDER BY CONVERT(DATETIME,( "
            consulta += " CASE LEN([fechaEco])  "
            consulta += " WHEN 5 THEN "
            consulta += " '01/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),1,1)+'/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),2,4) "
            consulta += " ELSE "
            consulta += " '01/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),1,2)+'/'+SUBSTRING(CONVERT(VARCHAR(6),[fechaEco]),3,4) "
            consulta += " END "
            consulta += " ),103) DESC "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                ultimaEcoCargada = myReader2.GetValue(0).ToString()
                Exit Do
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        Return ultimaEcoCargada
    End Function
    Protected Function aseptarCarga(ByVal regpat As String, ByVal subdel As String, ByVal idusuario As String) As Boolean
        Dim aseptada As Boolean = False
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT " _
& " CP_REGPAT " _
& " FROM sirecacobros.dbo.CO_CPATRONAL " _
& " WHERE CP_REGPAT='" & regpat & "' AND CP_SUBDEL='" & subdel & "'" _
& " and exists(SELECT us.[id] FROM [sireca].[dbo].[usuarios] as us where (user_type='1' or us.[userPae2]='1') and us.id='" & idusuario & "' and us.subdel='" & subdel & "')"
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                aseptada = True
                myReader2.GetValue(0).ToString()
                Exit Do
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        Return aseptada
    End Function

    Protected Sub LBDescargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDescargar.Click
        Try
            Dim nombreFile = Session.Item("SIRECAid").ToString + "_" + DDLSubdel.SelectedValue
            If Not Directory.Exists(Server.MapPath("~/descargas/inspector")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/inspector"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22            
            Dim myInsertQuery22 As String = ""
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 1 "
            'myInsertQuery22 += " RECONFIGURE "            
            myInsertQuery22 += " exec xp_cmdshell 'bcp "" SELECT ''INSPECTOR'',''ID_INSPECTOR'' "
            myInsertQuery22 += " UNION ALL SELECT (select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.[id]=us.[id]) as INSPECTOR "
            myInsertQuery22 += " ,convert(varchar(6),us.[id]) as ID_INSPECTOR FROM [sireca].[dbo].[usuarios] as us "
            myInsertQuery22 += " where (us.[user_type]=''1'' or us.[userPae2]=''1'') and us.subdel=''" & DDLSubdel.SelectedValue & "'' "
            myInsertQuery22 += " "" queryout """ + Server.MapPath("~/descargas/inspector/") + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 0 "
            'myInsertQuery22 += " RECONFIGURE "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
            '---------------------------------------------
            cmd22 = New OleDbCommand()
            cmd22.Connection = con22
            myInsertQuery22 = " exec xp_cmdshell 'bcp "" SELECT ''REG.PAT'',''ID_INSPECTOR'' UNION ALL SELECT ''RRRRRRRRRR'',''NNN''"
            myInsertQuery22 += " "" queryout """ + Server.MapPath("~") + "/descargas/inspector/Ejemplo_del_Archivo_a_Cargar_" + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
            '---------------------------------------------
            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + nombreFile + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(Server.MapPath("~") + "/descargas/inspector/" + nombreFile + ".csv", "")
                zip.AddFile(Server.MapPath("~") + "/descargas/inspector/Ejemplo_del_Archivo_a_Cargar_" + nombreFile + ".csv", "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.Message & " _ " & ex.StackTrace)
        End Try
    End Sub

    Protected Sub TBFechaAsignacion_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechaAsignacion.Init
        TBFechaAsignacion.Text = Day(Now).ToString("D2") & "/" & Month(Now).ToString("D2") & "/" & Year(Now).ToString("D2")
    End Sub
End Class
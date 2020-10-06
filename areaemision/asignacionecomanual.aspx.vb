Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class asignacionecomanual
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            ''If Not (Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod4").ToString.Equals("x") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
            ''Server.Transfer("~/accesoDenegado.aspx")
            '' End If
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        LMensaje.Text = "VERIFIQUE QUE EL ARCHIVO A CARGAR SEA UN CSV, DELIMITADO POR ,"
        LMensaje.ForeColor = Drawing.Color.FromName("#000099")
        If FileUpload1.FileName.ToUpper.Contains(".CSV") Then
            Dim nombreFile As String = Now.ToShortDateString.Replace("/", "") & Now.Hour & Now.Minute & Now.Second & Now.Millisecond & FileUpload1.FileName
            Dim carpeta As String = Server.MapPath("~\temp\asignacion\emision\" & Session.Item("SIRECAsubdel").ToString)
            If Not Directory.Exists(carpeta) Then
                Directory.CreateDirectory(carpeta)
            End If
            FileUpload1.SaveAs(carpeta & "\" & nombreFile)
            cargarAsignacion(carpeta & "\" & nombreFile)
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
                    'REG.PAT=0, CREDITO=1, ID_INSPECTOR=2
                    If aseptarCarga(fila.Split(",").GetValue(0).ToString, DDLSubdel.SelectedValue, fila.Split(",").GetValue(2).ToString, fila.Split(",").GetValue(1).ToString) Then
                        cargarCargaAseptada(fila.Split(",").GetValue(0).ToString, fila.Split(",").GetValue(2).ToString, fila.Split(",").GetValue(1).ToString, TBFechaAsignacion.Text)
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
    Protected Sub cargarCargaAseptada(ByVal regpat As String, ByVal inspector As String, ByVal credito As String, ByVal fechaAsig As String)
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " update [sireca].[dbo].[eco] "
            myInsertQuery22 += " set [nomResponsable]='" + inspector + "' "
            myInsertQuery22 += " ,[cambiarIncidencia]='0' "
            myInsertQuery22 += " ,[responsable] = '" + inspector + "' "
            myInsertQuery22 += " ,[fechaSeleccion] = convert(datetime,'" + fechaAsig + "',103) "
            myInsertQuery22 += " ,[diasDisponibles]='0' "
            myInsertQuery22 += " ,[grado1]='6666' "
            myInsertQuery22 += " ,[grado2]='SIN ATENDER' "
            myInsertQuery22 += " WHERE "
            myInsertQuery22 += " substring([REG#PATRONAL],1,10)='" + regpat + "' "
            myInsertQuery22 += " and CREDITO='" + credito + "' "
            myInsertQuery22 += " and subdel='" + DDLSubdel.SelectedValue + "' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                'LError.Text = "Error al Actualizar"
            Else

            End If
            con22.Close()
        Catch ex As Exception
            'LError.Text = "Error al Actualizar"
        End Try
    End Sub
    Protected Function aseptarCarga(ByVal regpat As String, ByVal subdel As String, ByVal idusuario As String, ByVal creditox As String) As Boolean
        Dim aseptada As Boolean = False
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT [id] "
            consulta += " FROM [sireca].[dbo].[eco] "
            consulta += " WHERE substring([REG#PATRONAL],1,10)='" + regpat + "' and [CREDITO]='" + creditox + "' and subdel='" + subdel + "' "
            consulta += " and exists(SELECT us.[id] FROM [sireca].[dbo].[usuarios] as us where (user_type='1' or us.[userPae2]='1') and us.id='" & idusuario & "' and us.subdel='" & subdel & "')"
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
            If Not Directory.Exists(Server.MapPath("~/descargas/inspectorEmi")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/inspectorEmi"))
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
            myInsertQuery22 += " "" queryout """ + Server.MapPath("~/descargas/inspectorEmi/") + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 0 "
            'myInsertQuery22 += " RECONFIGURE "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
            '---------------------------------------------
            cmd22 = New OleDbCommand()
            cmd22.Connection = con22
            myInsertQuery22 = " exec xp_cmdshell 'bcp "" SELECT ''REG.PAT'',''CREDITO'',''ID_INSPECTOR'' UNION ALL SELECT ''RRRRRRRRRR'',''999999999'',''NNN''"
            myInsertQuery22 += " "" queryout """ + Server.MapPath("~") + "/descargas/inspectorEmi/Ejemplo_del_Archivo_a_Cargar_" + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "
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
                zip.AddFile(Server.MapPath("~") + "/descargas/inspectorEmi/" + nombreFile + ".csv", "")
                zip.AddFile(Server.MapPath("~") + "/descargas/inspectorEmi/Ejemplo_del_Archivo_a_Cargar_" + nombreFile + ".csv", "")
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
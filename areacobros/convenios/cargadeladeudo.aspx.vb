Imports System.IO
Imports System.Data.OleDb

Public Class cargadeladeudo
    Inherits System.Web.UI.Page
    Dim nomfile As String = ""
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cargarAdeudo(ByVal tipoAdeudo As String, ByVal fileuploadx As FileUpload, ByVal crearUnoNuevo As Boolean)
        Dim ruta As String = Server.MapPath("~\temp\convenio")
        If Not fileuploadx.FileName.Replace(" ", "").Equals("") Then
            If Not Directory.Exists(ruta) Then
                Directory.CreateDirectory(ruta)
            End If
            fileuploadx.SaveAs(ruta & "\" & nomfile)
            'Lectura del archivo
            Dim archivoEntrada As System.IO.StreamReader = System.IO.File.OpenText(ruta & "\" & nomfile)
            Dim archivoSalida As StreamWriter
            If crearUnoNuevo Then
                archivoSalida = New System.IO.StreamWriter(ruta & "\" & nomfile & ".txt")
            Else
                archivoSalida = New System.IO.StreamWriter(ruta & "\" & nomfile & ".txt", True)
            End If
            Dim linea As String = ""
            Dim lineas() As String = {}
            Dim lineasObr() As String = {}
            Dim lineasPat() As String = {}
            Dim regpat As String = ""
            'If crearUnoNuevo Then
            'archivoSalida.WriteLine("REGPAT;TOPO_ADEUDO;CREDITO;PERIODO;TD;INC;DEL;SUB;DEL;SUB;EMISION_OBR;ACT_OBR;REC_OBR;TOTAL_OBR;EMISION_PAT;ACT_PAT;REC_PAT;TOTAL_PAT")
            'End If
            While archivoEntrada.Peek > -1
                lineas = archivoEntrada.ReadLine.Replace("""", "").Split(New [Char]() {CChar(vbTab)})
                If lineas.Contains("REG. PAT.") Then
                    regpat = lineas.GetValue(2)
                End If
                If lineas.Contains("TOT") And lineas.Count > 11 Then
                    lineasObr = archivoEntrada.ReadLine.Replace("""", "").Replace(",", "").Split(New [Char]() {CChar(vbTab)})
                    lineasPat = archivoEntrada.ReadLine.Replace("""", "").Replace(",", "").Split(New [Char]() {CChar(vbTab)})
                    Dim i As Int32 = 0
                    archivoSalida.Write(regpat)
                    archivoSalida.Write(";")
                    archivoSalida.Write(tipoAdeudo)
                    archivoSalida.Write(";")
                    For Each valor As String In lineas
                        If Not (i >= 3 And i <= 7) Then
                            archivoSalida.Write(valor.Replace("-", "/"))
                            archivoSalida.Write(";")
                        End If
                        i += 1
                    Next
                    i = 0
                    For Each valor As String In lineasObr
                        If i > 0 Then
                            archivoSalida.Write(valor)
                            archivoSalida.Write(";")
                        End If
                        i += 1
                    Next
                    i = 0
                    For Each valor As String In lineasPat
                        If i > 0 Then
                            archivoSalida.Write(valor)
                            If i < (lineasPat.Count - 1) Then
                                archivoSalida.Write(";")
                            End If
                        End If
                        i += 1
                    Next
                    archivoSalida.WriteLine("")
                End If
            End While
            archivoSalida.Close()
            archivoEntrada.Close()
        End If
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            crearTablaDeAdeudo(("adeudocoprcvconvenio" & Session.Item("SIRECAid").ToString), (ruta & "\" & nomfile & ".txt"))            
        End If
    End Sub
    Protected Sub crearTablaDeAdeudo(ByVal nomTabla As String, ByVal ruta As String)
        Dim estado As String = ""
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from sirecacobros.dbo.sysobjects where name = '" + nomTabla + "') "
            textConmand += " begin "
            textConmand += " drop table [sirecacobros].[dbo].[" + nomTabla + "] "
            textConmand += " end "
            textConmand += " CREATE TABLE [sirecacobros].[dbo].[" + nomTabla + "]( "
            textConmand += " [REGPAT] [nvarchar](11) NULL, "
            textConmand += " [TOPO_ADEUDO] [nvarchar](3) NULL, "
            textConmand += " [CREDITO] [nvarchar](9) NULL, "
            textConmand += " [PERIODO] [nvarchar](7) NULL, "
            textConmand += " [TD] [nvarchar](2) NULL, "
            textConmand += " [INC] [nvarchar](2) NULL, "
            textConmand += " [DEL] [nvarchar](2) NULL, "
            textConmand += " [SUB] [nvarchar](2) NULL, "
            textConmand += " [DEL1] [nvarchar](2) NULL, "
            textConmand += " [SUB1] [nvarchar](2) NULL, "
            textConmand += " [EMISION_OBR] [float] NULL, "
            textConmand += " [ACT_OBR] [float] NULL, "
            textConmand += " [REC_OBR] [float] NULL, "
            textConmand += " [TOTAL_OBR] [float] NULL, "
            textConmand += " [EMISION_PAT] [float] NULL, "
            textConmand += " [ACT_PAT] [float] NULL, "
            textConmand += " [REC_PAT] [float] NULL, "
            textConmand += " [TOTAL_PAT] [float] NULL "
            textConmand += " ) ON [PRIMARY] "
            textConmand += " BULK INSERT [sirecacobros].[dbo].[" + nomTabla + "] "
            textConmand += " FROM '" + ruta + "' "
            textConmand += " WITH( "
            textConmand += " FIELDTERMINATOR=';', "
            textConmand += " ROWTERMINATOR='\n', "
            textConmand += " FIRE_TRIGGERS "
            textConmand += " ) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                estado = ""
            Else
                estado = ""
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = ""
        End Try
    End Sub

    Protected Sub LBTabActRec_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBTabActRec.Click
        Try
            If Session.Item("SIRECAuser") Is Nothing Then
                Response.Redirect("~/Login.aspx")
            Else
                Dim nomfileTab As String = Session.Item("SIRECAid").ToString & "Tab" & Now.Day.ToString & Now.Month.ToString & Now.Year.ToString & Now.Hour.ToString & Now.Minute & Now.Second.ToString & Now.Millisecond.ToString & FileUploadTabAcRec.FileName
                cargarTablaDeRecargos(FileUploadTabAcRec, nomfileTab)
                GridView1.DataBind()
            End If
        Catch ex As Exception
            Response.Write("Verifique que la tabla de actualizacion y recargos tenga el Formato Correcto.")
        End Try
    End Sub
    Protected Sub cargarTablaDeRecargos(ByVal fileuploadx As FileUpload, ByVal nomfileTabx As String)
        Dim ruta As String = Server.MapPath("~\temp\convenio")
        If Not fileuploadx.FileName.Replace(" ", "").Equals("") Then
            If Not Directory.Exists(ruta) Then
                Directory.CreateDirectory(ruta)
            End If
            fileuploadx.SaveAs(ruta & "\" & nomfileTabx)
            'Lectura del archivo
            Dim archivoEntrada As System.IO.StreamReader = System.IO.File.OpenText(ruta & "\" & nomfileTabx)
            Dim archivoSalida As StreamWriter

            archivoSalida = New System.IO.StreamWriter(ruta & "\" & nomfileTabx & ".txt")
            Dim linea As String = ""
            Dim lineas() As String = {}
            Dim lineasObr() As String = {}
            Dim lineasPat() As String = {}
            Dim regpat As String = ""
            'If crearUnoNuevo Then
            'archivoSalida.WriteLine("REGPAT;TOPO_ADEUDO;CREDITO;PERIODO;TD;INC;DEL;SUB;DEL;SUB;EMISION_OBR;ACT_OBR;REC_OBR;TOTAL_OBR;EMISION_PAT;ACT_PAT;REC_PAT;TOTAL_PAT")
            'End If
            While archivoEntrada.Peek > -1
                lineas = archivoEntrada.ReadLine.Replace("""", "").Split(New [Char]() {CChar(vbTab)})
                If lineas.Count > 9 Then
                    If lineas.GetValue(1).ToString.Contains("2") Then
                        Dim i As Int32 = 0
                        For Each valor As String In lineas
                            'inicio 
                            If i = 0 Then
                                'If (IsNumeric(lineas.GetValue(0))) Then
                                'Dim datePeriodo As String = DateAdd(DateInterval.Month, -1, CDate(lineas.GetValue(5))).ToString.Substring(3, 7)
                                'archivoSalida.Write(datePeriodo)
                                Dim datePeriodo As String = lineas.GetValue(0).ToString.Substring(0, 2) & "/" & lineas.GetValue(0).ToString.Substring(2, 4)
                                archivoSalida.Write(datePeriodo)
                                'Else
                                '   If ((CInt(valor.Split("/").GetValue(1)) >= 90) And (CInt(valor.Split("/").GetValue(1)) <= 99)) Then
                                'archivoSalida.Write(CStr(valor.Split("/").GetValue(0)) & "/19" & CStr(valor.Split("/").GetValue(1)))
                                'Else
                                '   archivoSalida.Write(CStr(valor.Split("/").GetValue(0)) & "/20" & CStr(valor.Split("/").GetValue(1)))
                                'End If
                                'End If
                                archivoSalida.Write(";")
                            Else
                                If i = 2 Then
                                    archivoSalida.Write((CDbl(valor) - 1).ToString)
                                Else
                                    archivoSalida.Write(valor)
                                End If

                                If i < (lineas.Count - 1) Then
                                    archivoSalida.Write(";")
                                End If
                            End If
                            'fin
                            i += 1
                        Next
                        i = 0
                        archivoSalida.WriteLine("")
                    End If
                End If
            End While
            archivoSalida.Close()
            archivoEntrada.Close()
        End If
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            crearTablaDeActRec("tabActRec", (ruta & "\" & nomfileTabx & ".txt"))
        End If
    End Sub
    Protected Sub crearTablaDeActRec(ByVal nomTabla As String, ByVal ruta As String)
        Dim estado As String = ""
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from sirecacobros.dbo.sysobjects where name = '" + nomTabla + "') "
            textConmand += " begin "
            textConmand += "        drop table [sirecacobros].[dbo].[" + nomTabla + "] "
            textConmand += " end " '------------
            textConmand += "            CREATE TABLE [sirecacobros].[dbo].[" + nomTabla + "]( "
            textConmand += "            [PERIODO] [nvarchar](7) COLLATE Modern_Spanish_CI_AS NULL "
            textConmand += "            ,[CPTO] [float] NULL "
            textConmand += "            ,[ACT] [float] NULL "
            textConmand += "            ,[REC] [float] NULL "
            textConmand += "            ,[INPC] [float] NULL "
            textConmand += "            ,[FEC_APLICACION] [datetime] NULL "
            textConmand += "            ,[FEC_VIGENCIA] [datetime] NULL "
            textConmand += "            ,[FEC_INPC] [datetime] NULL "
            textConmand += "            ,[FEC_FAC_REC] [datetime] NULL "
            textConmand += "            ,[RECARGOS_NVO] [float] NULL "
            textConmand += "            ) ON [PRIMARY] "
            textConmand += "            BULK INSERT [sirecacobros].[dbo].[" + nomTabla + "] "
            textConmand += "            FROM '" + ruta + "' "
            textConmand += "            WITH( "
            textConmand += "            FIELDTERMINATOR=';', "
            textConmand += "            ROWTERMINATOR='\n', "
            textConmand += "            FIRE_TRIGGERS "
            textConmand += "            ) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                estado = ""
            Else
                estado = ""
            End If
            nwindConn.Close()
        Catch ex As Exception
            estado = ""
        End Try
    End Sub

    Protected Sub LBCargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCargar.Click
        Dim cargo As Boolean = False
        If (FileUploadCarga1.FileName & FileUploadCarga2.FileName).Length > 5 Then
            nomfile = Session.Item("SIRECAid").ToString & Now.Day.ToString & Now.Month.ToString & Now.Year.ToString & Now.Hour.ToString & Now.Minute & Now.Second.ToString & Now.Millisecond.ToString & FileUploadCarga1.FileName & FileUploadCarga2.FileName
            If FileUploadCarga1.FileName.ToUpper.Contains("COP") Then
                cargarAdeudo("COP", FileUploadCarga1, True)
                cargo = True
            ElseIf FileUploadCarga1.FileName.ToUpper.Contains("RCV") Then
                cargarAdeudo("RCV", FileUploadCarga1, True)
                cargo = True
            End If
            If FileUploadCarga2.FileName.ToUpper.Contains("COP") Then
                If cargo Then
                    cargarAdeudo("COP", FileUploadCarga2, False)
                Else
                    cargarAdeudo("COP", FileUploadCarga2, True)
                End If
            ElseIf FileUploadCarga2.FileName.ToUpper.Contains("RCV") Then
                If cargo Then
                    cargarAdeudo("RCV", FileUploadCarga2, False)
                Else
                    cargarAdeudo("RCV", FileUploadCarga2, True)
                End If
            End If
            Response.Redirect("~/areacobros/convenios/selecciondecreditosparaproyecto.aspx")
        End If
    End Sub
End Class
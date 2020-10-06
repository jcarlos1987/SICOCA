Imports System.Data.OleDb
Imports System.IO

Public Class capturadeincidencia
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        TBFechDeligencia.Text = Now.ToShortDateString
        TBFechResvProv.Text = Now.ToShortDateString
        DDLHoras.Items.Add(New ListItem("--:-- -.-.", "--:-- -.-."))
        For i As Int32 = 5 To 19
            If i > 14 Then
                DDLHoras.Items.Add(New ListItem("0" & (24 - i) & ":30 H.r.", "0" & (24 - i) & ":30 H.r."))
                DDLHoras.Items.Add(New ListItem("0" & (24 - i) & ":00 H.r.", "0" & (24 - i) & ":00 H.r."))
            Else
                DDLHoras.Items.Add(New ListItem((24 - i) & ":30 H.r.", (24 - i) & ":30 H.r."))
                DDLHoras.Items.Add(New ListItem((24 - i) & ":00 H.r.", (24 - i) & ":00 H.r."))
            End If
        Next
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
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
    Protected Function cargarFotos() As Int32
        'If DDLDiligencia.SelectedItem.Text.Contains("EMBARGO") Then
        'tipoDirectorio = "EMBARGO"
        'ElseIf DDLDiligencia.SelectedItem.Text.Contains("NO LOCALIZADO") Then
        '   tipoDirectorio = "09"
        'End If
        Dim countFotos As Int32 = 0
        For i As Int32 = 1 To 8
            Dim foto As FileUpload = CType(Page.FindControl("FileUpload" & (i)), FileUpload)
            If foto.FileName.Replace(" ", "").Length > 0 Then
                Dim diligencia As String = DDLDiligencia.SelectedValue
                Dim tipoDirectorio As String = "DILIGENCIA" & diligencia
                Dim doceEntregado As String = DDLDocEntreg.SelectedValue

                Dim regpat As String = CType(GridViewResultados.Rows(0).Cells(4).FindControl("HyperLink1"), HyperLink).Text

                Dim carpeta As String = Server.MapPath("~\documentos\cobros\" & regpat & "\" & tipoDirectorio)
                If Not System.IO.Directory.Exists(carpeta) Then
                    Dim dir = System.IO.Directory.CreateDirectory(carpeta)
                End If
                Dim nombreFile As String = Session.Item("SIRECAid").ToString & "." & Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName
                'Dim nombreFile As String = Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName.Split(".").GetValue(foto.FileName.Split(".").Count - 1)
                foto.SaveAs(carpeta & "\" & nombreFile)
                countFotos += 1
                guardarFotoEnBD(tipoDirectorio, doceEntregado, diligencia, regpat, nombreFile)
            End If
        Next
        Return countFotos
    End Function
    Protected Sub guardarFotoEnBD(ByVal tipoDirectorio As String, ByVal doceEntregado As String, ByVal diligencia As String, ByVal regpat As String, ByVal nombreFile As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecacobros].[dbo].[CO_ARCHIVOS]([AR_HOST],[AR_FECH_SISTEM],[AR_DEL],[AR_SUBDEL],[AR_REGPAT] " _
& " ,[AR_AC_DOC_ENTRGADO],[AR_AC_DILIGENCIA],[AR_AC_FECH_DILIGENCIA],[AR_NOM_ARCHIVO]) " _
& " VALUES " _
& " ( " _
& " '" & Request.UserHostAddress & "' " _
& " ,getdate() " _
& " ,'" & Session.Item("SIRECAdel").ToString & "'" _
& " ,'" & GridViewResultados.Rows(0).Cells(1).Text & "'" _
& " ,'" & regpat & "' " _
& " ,'" & doceEntregado & "' " _
& " ,'" & diligencia & "' " _
& " ,convert(datetime,'" & If(IsDate(TBFechDeligencia.Text), TBFechDeligencia.Text, Now.ToShortDateString) & "',103) " _
& " ,'" & tipoDirectorio & "\" & nombreFile & "' " _
& " ) "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then

            Else
                'Response.Redirect("~/pag_registros/Default.aspx")
            End If
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub

    Protected Sub cagarDiligencia()
        'Dim ssi As DateTime = New DateTime(2013, 7, 12, 1, 0, 0)
        'Dim ssf As DateTime = New DateTime(2013, 7, 13, 6, 0, 0)
        'MsgBox(DateDiff(DateInterval.Hour, ssi, ssf))
        '------------------------------------------------------
        guardarDeligencia1()
        DDLDocEntreg.SelectedValue = "0"
        DDLDiligencia.SelectedValue = "0"
        DDLObservacion.SelectedValue = "0"
        TBFechDeligencia.Text = Now.ToShortDateString
        DDLHoras.SelectedValue = "--:-- -.-."
        GridViewResultados.DataBind()
        LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
        '------------------------------------------------------
    End Sub
    Protected Sub guardarDeligencia1()
        For i As Int32 = 0 To (GridViewResultados.Rows.Count - 1)
            If CType(GridViewResultados.Rows(i).Cells(7).FindControl("CheckBox1"), CheckBox).Checked Then
                guardarDeligencia2(getdatosdiligencia(CType(GridViewResultados.Rows(i).Cells(4).FindControl("HyperLink1"), HyperLink).Text, GridViewResultados.Rows(i).Cells(1).Text, GridViewResultados.Rows(i).Cells(0).Text))
            End If
        Next
    End Sub
    Protected Function getdatosdiligencia(ByVal regpat As String, ByVal subdel As String, ByVal id_ra As String) As String()
        Dim datosDiligencia(15) As String
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " select  " _
& " RA_ID,CP_DEL,CP_SUBDEL,RA_REGPATR " _
& " ,RA_NUMCRED,RA_PERIODO,RA_FMOV,RA_MOV,RA_SECTOR,RA_TD,RA_INC,CP_HOST " _
& " ,CP_FECH_SISTEM,CP_ID_SUPER,CP_FECH_ASIG,CP_INSPEC " _
& " from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on CP_REGPAT=RA_REGPATR " _
& " where CP_REGPAT='" & regpat & "' and CP_SUBDEL='" & subdel & "' and RA_ID='" & id_ra & "' "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                For i As Int32 = 0 To 15
                    datosDiligencia.SetValue(myReader2.GetValue(i).ToString, i)
                Next
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        Return datosDiligencia
    End Function
    Protected Sub guardarDeligencia2(ByVal datosDiligencia As String())
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecacobros].[dbo].[CO_ACCIONES] " _
& " ([AC_HOST],[AC_FECH_SISTEM],[AC_RA_ID],[AC_DEL],[AC_SUBDEL],[AC_RA_REGPATR],[AC_RA_NUMCRED] " _
& " ,[AC_RA_PERIODO],[AC_RA_FMOV],[AC_RA_MOV],[AC_RA_SECTOR],[AC_RA_TD],[AC_RA_INC],[AC_CP_HOST],[AC_CP_FECH_SISTEM],[AC_CP_SUPER] " _
& " ,[AC_CP_FECH_ASIG],[AC_CP_INSPEC],[AC_DOC_ENTRGADO],[AC_DILIGENCIA],[AC_FECH_DILIGENCIA],[AC_HORA_CITATORIO],[AC_OBSERVACION],[EMBARGOS],[ID_EMBARGO]) " _
& " VALUES " _
& " ( " _
& " '" & Request.UserHostAddress & "' " _
& " ,getdate() " _
& " ," & datosDiligencia.GetValue(0).ToString & " " _
& " ,'" & datosDiligencia.GetValue(1).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(2).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(3).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(4).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(5).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(6).ToString & "' " _
& " ," & datosDiligencia.GetValue(7).ToString & " " _
& " ,'" & datosDiligencia.GetValue(8).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(9).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(10).ToString & "' " _
& " ,'" & datosDiligencia.GetValue(11).ToString & "' " _
& " , convert(datetime,'" & datosDiligencia.GetValue(12).ToString.Replace("a.m.", "").Replace("p.m.", "") & "',103) " _
& " ," & datosDiligencia.GetValue(13).ToString & " " _
& " , convert(datetime,'" & datosDiligencia.GetValue(14).ToString.Replace("a.m.", "").Replace("p.m.", "") & "',103) " _
& " ," & datosDiligencia.GetValue(15).ToString & " " _
& " ,'" & DDLDocEntreg.SelectedValue & "' " _
& " ,'" & DDLDiligencia.SelectedValue & "' " _
& " ,convert(datetime,'" & If(IsDate(TBFechDeligencia.Text), TBFechDeligencia.Text, Now.ToShortDateString) & "',103) " _
& " ,'" & DDLHoras.SelectedValue & "' " _
& " ,'" & DDLObservacion.SelectedValue & "' " _
& " ,'" & TBEmbargos.Text.ToUpper & "' " _
& " ,'" & datosDiligencia.GetValue(1).ToString & datosDiligencia.GetValue(2).ToString & Now.Day.ToString("D2") & Now.Month.ToString("D2") & Now.Year.ToString("D4") & datosDiligencia.GetValue(3).ToString & Request.UserHostAddress.Replace(".", "") & DDLDocEntreg.SelectedValue & DDLDiligencia.SelectedValue & "' " _
& " ) "

            cmd22.CommandText = myInsertQuery22
            con22.Open()

            If cmd22.ExecuteNonQuery() = 1 Then
                LMensaje.Text = RadioButtonListRegPat.SelectedValue & " CON DILIGENCIA GUARDADA."
                LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
                updateTableEcoControl(datosDiligencia.GetValue(15).ToString, DDLDiligencia.SelectedValue, If(IsDate(TBFechDeligencia.Text), TBFechDeligencia.Text, Now.ToShortDateString), datosDiligencia.GetValue(3).ToString, datosDiligencia.GetValue(5).ToString, datosDiligencia.GetValue(4).ToString)
            Else
                'Response.Redirect("~/pag_registros/Default.aspx")
            End If
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
    Protected Sub updateTableEcoControl(ByVal up_idinspector As String, ByVal up_inc As String, ByVal up_fech_inc As String, ByVal data_regpat As String, ByVal data_periodo As String, ByVal data_credito As String)
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sireca].[dbo].[ecocontrol] " _
& " SET [INSPECTOR]='" + up_idinspector + "' " _
& " ,[INC]='" + up_inc + "' " _
& " ,[FECH_CAP]='" + up_fech_inc + "' " _
& " ,[CICLO_CAP]='2' " _
& " WHERE substring([REGPAT],1,10)='" + data_regpat + "' and [PERIODO]=SUBSTRING('" + data_periodo + "',4,7) and [CREDITO]='" + data_credito + "' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() > 0 Then
                'Actualizado
            Else

            End If
            con22.Close()
        Catch ex As Exception
            'LError.Text = "Error al Actualizar"
        End Try
    End Sub

    Protected Sub registrarfoliorale(ByVal id_ra As String, ByVal foliodepago As String)
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sirecacobros].[dbo].[CO_RALE] " _
& " SET [RA_FOLIO_PAG] = '" & foliodepago & "' " _
& " WHERE [RA_ID]= " & id_ra
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

    Protected Function getdatospago(ByVal regpat As String, ByVal subdel As String) As String()
        Dim datospago(3) As String
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " select CP_DEL,CP_SUBDEL,CP_INSPEC " _
& " from sirecacobros.dbo.CO_CPATRONAL " _
& " where CP_REGPAT='" & regpat & "' and CP_SUBDEL='" & subdel & "'"
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                For i As Int32 = 0 To 3
                    datospago.SetValue(myReader2.GetValue(i).ToString, i)
                Next
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        Return datospago
    End Function
    Protected Sub guardarPago(ByVal pagodatos As String(), ByVal foliodepago As String)
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecacobros].[dbo].[CO_PAGOS]([PA_DEL],[PA_SUBDEL],[PA_RA_FOLIO_PAG] " _
& " ,[PA_AC_DELIGENCIA],[PA_AC_FECH_DELIGENCIA],[PA_INSPEC],[PA_PAGO],[PA_RECIBO_PROVI],[PA_FECH_RECIBO_PROVI]) " _
& " VALUES " _
& " ('" & pagodatos.GetValue(0) & "'" _
& " ,'" & pagodatos.GetValue(1) & "'" _
& " ,'" & foliodepago & "' " _
& " ,'" & DDLDiligencia.SelectedValue & "' " _
& " ,convert(datetime," & TBFechDeligencia.Text & ",103) " _
& " ,'" & pagodatos.GetValue(2) & "'" _
& " ," & TBPago.Text & " " _
& " ,'" & TBResvProv.Text & "' " _
& " ,convert(datetime,'" & TBFechResvProv.Text & "',103)) "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                'MsgBox("Error al Registrar")
            Else
                'Response.Redirect("~/pag_registros/Default.aspx")
            End If
            con22.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub RadioButtonListRegPat_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles RadioButtonListRegPat.PreRender
        LPatrones.Text = "(" & RadioButtonListRegPat.Items.Count.ToString & ")" & RadioButtonListRegPat.SelectedValue.ToString
    End Sub

    Protected Sub LinkButtonCargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButtonCargar.Click
        LMensaje.Text = "AREA DE CAPTURA DE LOS PERIODOS Y CREDITOS DEL RESULTADO DE LA BUSQUEDA."
        LMensaje.ForeColor = Drawing.Color.FromName("#000099")
        GridViewResultados.DataBind()
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MenuHerramientas.MenuItemClick
        If e.Item.Value.Equals("CERRAR SESION") Then
            Session.Clear()
            Session.Abandon()
            Response.RedirectPermanent("~/Login.aspx")
        ElseIf e.Item.Value.Equals("CICLO 1") Then
            If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                Response.RedirectPermanent("~/principal/Ciclo1.aspx")
            Else
                Response.RedirectPermanent("~/pag_asps/inicio.aspx")
            End If
        ElseIf e.Item.Value.Equals("CICLO 2") Then
            If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                Response.RedirectPermanent("~/principal/Ciclo2.aspx")
            Else
                Response.RedirectPermanent("~/informesPDF/cobros/inspector/Default.aspx?tipo=IB")
            End If
        ElseIf e.Item.Value.Equals("CICLO 3") Then
            If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                Response.RedirectPermanent("~/principal/Ciclo3.aspx")
            Else
                Response.RedirectPermanent("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

    Protected Sub MenuHerramientas_Init(ByVal sender As Object, ByVal e As EventArgs) Handles MenuHerramientas.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                'BGuardarPago.Enabled = False
                'BGuardarDeligencia.Enabled = False
                'Dim menuitem1 As MenuItem = New MenuItem("CARGAR ASIGNACION", "CARGAR ASIGNACION")
                'menuitem1.NavigateUrl = "~/pag_cobros/cargadeasignacion.aspx"
                'menuitem1.Target = "_blank"
                'MenuHerramientas.Items.Item(0).ChildItems.Add(menuitem1)
            End If
            If Not Session.Item("SIRECAsubdel") Is Nothing Then
                If File.Exists(Server.MapPath("~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg")) Then
                    MenuHerramientas.Items(0).ImageUrl = "~/imagenes/usuarios/avatar/" & Session.Item("SIRECAid").ToString & ".jpg"
                End If
            End If            
        End If
    End Sub

    Protected Sub BLGuardarDeligencia_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BLGuardarDeligencia.Click
        LMensaje.Text = "AREA DE CAPTURA DE LOS PERIODOS Y CREDITOS DEL RESULTADO DE LA BUSQUEDA."
        LMensaje.ForeColor = Drawing.Color.FromName("#000099")
        If GridViewResultados.Rows.Count > 0 Then
            If DDLDocEntreg.SelectedValue.Equals("18") Then
                If Not DDLHoras.SelectedValue.Equals("--:-- -.-.") Then
                    '------------------------------------------------------
                    guardarDeligencia1()
                    DDLDocEntreg.SelectedValue = "0"
                    DDLDiligencia.SelectedValue = "0"
                    DDLObservacion.SelectedValue = "0"
                    TBFechDeligencia.Text = Now.ToShortDateString
                    DDLHoras.SelectedValue = "--:-- -.-."
                    GridViewResultados.DataBind()
                    '------------------------------------------------------
                Else
                    LMensaje.Text = " Espesifique la Hora del Citatorio"
                    LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
                End If
            Else
                If DDLDiligencia.SelectedValue.Equals("0") Then
                    LMensaje.Text = " Seleccione la Diligencia"
                    LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
                End If
                If DDLDocEntreg.SelectedValue.Equals("0") Then
                    LMensaje.Text = " Seleccione el TIPO de Documento"
                    LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
                End If
                If (DDLDiligencia.SelectedValue <> "0" And DDLDocEntreg.SelectedValue <> "0") Then
                    '--------------------------------------------------------------
                    If DDLDiligencia.SelectedItem.Text.Contains("(foto)") Then
                        Dim fotosCargadas As Int32 = 0
                        If GridViewResultados.Rows.Count > 0 Then
                            fotosCargadas = cargarFotos()
                            If fotosCargadas > 0 Then
                                cagarDiligencia()
                            Else
                                LMensaje.Text = "CARGUE LAS FOTOS PARA REGISTRAR LA DILIGENCIA"
                                LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
                            End If
                        End If
                    Else
                        cagarDiligencia()
                        LMensaje.Text = LMensaje.Text & " Y " & cargarFotos() & " Fotos"
                    End If
                    '--------------------------------------------------------------                
                End If
            End If
        Else
            LMensaje.Text = " Seleccione INCIDENCIA y REG.PATRONAL del area IZQUIERDA. "
            LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
        End If
    End Sub

    Protected Sub BLGuardarPago_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BLGuardarPago.Click
        LMensaje.Text = "AREA DE CAPTURA DE LOS PERIODOS Y CREDITOS DEL RESULTADO DE LA BUSQUEDA."
        LMensaje.ForeColor = Drawing.Color.FromName("#000099")
        If IsNumeric(TBPago.Text) And Not TBPago.Text.Equals("0.00") And Not TBResvProv.Text.Equals("000000000") Then
            Dim foliodepago As String = ""
            For i As Int32 = 0 To (GridViewResultados.Rows.Count - 1)
                If i = 0 Then
                    foliodepago = CType(GridViewResultados.Rows(i).Cells(4).FindControl("HyperLink1"), HyperLink).Text & GridViewResultados.Rows(i).Cells(1).Text & Now.ToShortDateString.ToString.Replace("/", "") & Now.ToLongTimeString.ToString.Replace(":", "").Replace(" ", "")
                    guardarPago(getdatospago(CType(GridViewResultados.Rows(i).Cells(4).FindControl("HyperLink1"), HyperLink).Text, GridViewResultados.Rows(i).Cells(1).Text), foliodepago)
                End If
                If CType(GridViewResultados.Rows(i).Cells(7).FindControl("CheckBox1"), CheckBox).Checked Then
                    'MsgBox(GridViewResultados.Rows(i).Cells(0).Text)
                    registrarfoliorale(GridViewResultados.Rows(i).Cells(0).Text, foliodepago)
                End If
            Next
            TBPago.Text = "0.00"
            TBResvProv.Text = "000000000"
            TBFechResvProv.Text = Now.ToShortDateString
        Else
            LMensaje.Text = "Ingrese el Pago y el Recibo Provicional"
            LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
        End If
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        RadioButtonListRegPat.DataBind()
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        LMensaje.Text = "AREA DE CAPTURA DE LOS PERIODOS Y CREDITOS DEL RESULTADO DE LA BUSQUEDA."
        LMensaje.ForeColor = Drawing.Color.FromName("#000099")
        GridViewResultados.DataBind()
        Page.Validate()
    End Sub

    Protected Sub LBDeselec_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDeselec.Click
        For i As Int32 = 0 To (GridViewResultados.Rows.Count - 1)
            CType(GridViewResultados.Rows(i).Cells(7).FindControl("CheckBox1"), CheckBox).Checked = False
        Next
    End Sub

    Protected Sub LBSelec_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBSelec.Click
        For i As Int32 = 0 To (GridViewResultados.Rows.Count - 1)
            CType(GridViewResultados.Rows(i).Cells(7).FindControl("CheckBox1"), CheckBox).Checked = True
        Next
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Session.Clear()
        Session.Abandon()
        Response.RedirectPermanent("~/Login.aspx")
    End Sub
End Class
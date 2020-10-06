Imports System.Data.OleDb
Imports email

Public Class capturaincidencianotificacioncredito
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim direccionip As String = ConfigurationSettings.AppSettings("direccionip")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAobservacionPatronal").ToString.Equals("1") Or Session.Item("SIRECAobservacionPatronal").ToString.Equals("2") Then
                Try
                    HyperLink1.NavigateUrl = "~/pag_cobros/galeriaarchivoscargados.aspx?regpat=" & CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text
                Catch ex As Exception

                End Try
            End If
        End If
    End Sub

    Protected Sub TBFechDili_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechDili.Init
        TBFechDili.Text = Now.ToShortDateString
    End Sub

    Protected Sub DDLDiligencia_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDiligencia.SelectedIndexChanged
        LMsg.Text = ""
        If DDLDiligencia.SelectedValue.ToString.Equals("1") Then
            PanelHora.Visible = True
        Else
            PanelHora.Visible = False
        End If
        If DDLDiligencia.SelectedValue.ToString.Equals("1") And DDLHora.Text.Equals("00") Then
            LMsg.Text = "Establesca la hora del Citatorio"
        End If
    End Sub

    Protected Sub LBGuardar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBGuardar.Click
        LMsg.Text = ""
        If IsDate(TBFechDili.Text) Then
            If CDate(TBFechDili.Text) > Now Then
                LMsg.Text = "Fecha invalida, No puede hacer una diligencia a Futuro"
            Else
                If DDLDiligencia.SelectedValue.Equals("NULO") Then
                    LMsg.Text = " Seleccione una DILIGENCIA"
                Else
                    If DDLDiligencia.SelectedValue.Equals("9") Then
                        If cargarFotosDoc() Then
                            guardarDiligencia(DDLDiligencia.SelectedValue)
                        Else
                            LMsg.Text = " CARGUE FOTOS PARA GUARDAR LA DILIGENCIA"
                        End If
                    ElseIf DDLDiligencia.SelectedValue.Equals("1") Then
                        If DDLHora.Text.Equals("00") Then
                            LMsg.Text = "Establesca la hora del Citatorio"
                        Else
                            guardarDiligencia(DDLDiligencia.SelectedValue)
                        End If
                    Else
                        guardarDiligencia(DDLDiligencia.SelectedValue)
                    End If
                    DetailsView1.DataBind()
                    DDLDiligencia.SelectedValue = "NULO"
                    LMsg.Text = ""
                End If
            End If
        Else
            LMsg.Text = "Fecha invalida dd/mm/aaaa"
        End If
    End Sub
    Protected Function cargarFotosDoc() As Boolean
        Dim cargado As Boolean = False
        Dim countFotos As Int32 = 0
        For i As Int32 = 1 To 8
            Dim foto As FileUpload = CType(Page.FindControl("FileUpload" & (i)), FileUpload)
            If foto.FileName.Replace(" ", "").Length > 0 Then
                Dim diligencia As String = DDLDiligencia.SelectedValue
                Dim tipoDirectorio As String = "DILIGENCIA" & diligencia

                Dim regpat As String = CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text.Substring(0, 10)

                Dim carpeta As String = Server.MapPath("~\documentos\emision\" & regpat & "\" & tipoDirectorio)
                If Not System.IO.Directory.Exists(carpeta) Then
                    Dim dir = System.IO.Directory.CreateDirectory(carpeta)
                End If
                Dim nombreFile As String = Session.Item("SIRECAid").ToString & "." & Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName
                'Dim nombreFile As String = Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName.Split(".").GetValue(foto.FileName.Split(".").Count - 1)
                foto.SaveAs(carpeta & "\" & nombreFile)
                countFotos += 1
                guardarFotoEnBD(tipoDirectorio, "99", diligencia, regpat, nombreFile)
            End If            
        Next
        If countFotos > 0 Then
            cargado = True
        End If
        Return cargado
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
& " ,'" & DetailsView1.Rows(0).Cells(1).Text & "'" _
& " ,'" & regpat & "' " _
& " ,'" & doceEntregado & "' " _
& " ,'" & diligencia & "' " _
& " ,convert(datetime,'" & If(IsDate(TBFechDili.Text), TBFechDili.Text, Now.ToShortDateString) & "',103) " _
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

    Protected Sub guardarDiligencia(ByVal diligenciaCapturada As String)
        Try
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [incidencia] = ?,[grado2] = ?,[horaCitatorio]=?, [fechaCaptura]=?,[cambiarIncidencia]=? WHERE [id]=? and responsable=? "
            cmd.CommandText = myInsertQuery
            'credito
            Dim incidenciaValue As String = diligenciaCapturada
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = incidenciaValue
            cmd.Parameters.Add("@grado2", OleDbType.VarChar).Value = incidenciaValue
            If diligenciaCapturada.Equals("1") Then
                cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = (DDLHora.SelectedValue & ":" & DDLMinuto.SelectedValue & DDLAP.SelectedValue)
            Else
                cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            End If
            cmd.Parameters.Add("@fechaCaptura", OleDbType.Date).Value = Convert.ToDateTime(TBFechDili.Text & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now))
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(Request.QueryString("regpatid").ToString)
            cmd.Parameters.Add("@responsable", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            con.Open()
            If cmd.ExecuteNonQuery() > 0 Then
                If diligenciaCapturada.Equals("9") Then
                    setNoLocalizado()
                ElseIf diligenciaCapturada.Equals("A") Then
                    setAutodeterminar()
                ElseIf incidenciaValue.Equals("RE") Or incidenciaValue.Equals("PAGADO") Then
                    setRePagado()
                End If
                agregarAlHistorialInc()
                updateTableEcoControl(Session.Item("SIRECAid").ToString, DDLDiligencia.SelectedValue, TBFechDili.Text, CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text, DetailsView1.Rows(12).Cells(1).Text, DetailsView1.Rows(4).Cells(1).Text)
            End If
            con.Close()
        Catch ex As Exception
            'MsgBox(ex.Message)
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
    Protected Sub agregarAlHistorialInc()
        Dim con As New OleDbConnection(cadenaconexion)
        Dim cmd As New OleDbCommand()
        Dim myInsertQuery As String = ""
        cmd.Connection = con
        myInsertQuery = " INSERT INTO [sireca].[dbo].[HistorialInc] ([usuario],[subdel],[ip],[sector],[regpat],[periodo],[fecha],[incidencia],[observaciones],[tipoEco],[idEco])"
        myInsertQuery += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) "
        cmd.CommandText = myInsertQuery
        'cmd.Parameters.Add("@id", OleDbType.Double).Value = 1
        cmd.Parameters.Add("@usuario", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
        cmd.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString
        cmd.Parameters.Add("@ip", OleDbType.VarChar).Value = Request.UserHostAddress()
        cmd.Parameters.Add("@sector", OleDbType.VarChar).Value = DetailsView1.Rows(10).Cells(1).Text
        cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text
        cmd.Parameters.Add("@periodo", OleDbType.Double).Value = Convert.ToDouble(DetailsView1.Rows(12).Cells(1).Text)
        cmd.Parameters.Add("@fecha", OleDbType.Date).Value = Convert.ToDateTime(TBFechDili.Text & " " & Now.ToShortTimeString)
        cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = DDLDiligencia.SelectedValue
        If DDLDiligencia.SelectedValue.Equals("1") Then
            cmd.Parameters.Add("@observaciones", OleDbType.VarChar).Value = DDLHora.SelectedValue & ":" & DDLMinuto.SelectedValue & DDLAP.SelectedValue & ", " & TextBox1.Text
        Else
            cmd.Parameters.Add("@observaciones", OleDbType.VarChar).Value = TextBox1.Text
        End If
        cmd.Parameters.Add("@tipoEco", OleDbType.VarChar).Value = DetailsView1.Rows(5).Cells(1).Text
        cmd.Parameters.Add("@idEco", OleDbType.Double).Value = Request.QueryString("regpatid").ToString
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Protected Sub setNoLocalizado()
        'consulta [id]
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        catCMD.CommandText = "SELECT [idEco] FROM [sireca].[dbo].[nolocalizados] WHERE idEco = '" & Request.QueryString("regpatid").ToString & "'"
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim num As Integer = 0
        Do While myReader.Read()
            num = num + 1
            myReader.GetValue(0)
        Loop
        myReader.Close()
        nwindConn.Close()
        If num = 0 Then
            '[idEco]*, [fechaCaptura]*, [idResponsable], [observaciones]
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con
            Dim myInsertQuery As String = "INSERT INTO [sireca].[dbo].[nolocalizados]([idEco],[fechaCaptura],[idResponsable],[idInvestigadopor],[observaciones],[incidencia],[regpat])"
            myInsertQuery += " values(?, ?, ?, ?, ?, ?, ?)"
            cmd.CommandText = myInsertQuery
            'idEco, int,<fechaCaptura, datetime,>,<idResponsable, int,>,<observaciones, text,>
            cmd.Parameters.Add("@idEco", OleDbType.Integer).Value = Convert.ToInt32(Request.QueryString("regpatid").ToString)
            cmd.Parameters.Add("@fechaCaptura", OleDbType.Date).Value = Convert.ToDateTime(TBFechDili.Text & " " & Now.ToShortTimeString)
            cmd.Parameters.Add("@idResponsable", OleDbType.Integer).Value = Convert.ToInt32(Session.Item("SIRECAid").ToString)
            cmd.Parameters.Add("@idInvestigadopor", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@observaciones", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "I"
            cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            '---------------------------
            addNoLocalizadoRegistros()
            '---------------------------Correo Automatico            
            If DetailsView1.Rows(5).Cells(1).Text.Equals("COP") Or DetailsView1.Rows(5).Cells(1).Text.Equals("COMP") Then
                Dim emailx As CorreoEnviar = New CorreoEnviar                
                Dim correoMsg As String = "<strong>NO LOCALIZADO.</strong><br/>"
                correoMsg += " <strong>REG.PATRONAL: </strong>" & CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text & "<br/>" _
                        & " <strong>RAZON SOCIAL: </strong>" & DetailsView1.Rows(2).Cells(1).Text & "<br/>" _
                        & " <strong>DOMICILIO: </strong>" & DetailsView1.Rows(3).Cells(1).Text & "<br/>" _
                        & " <strong>INSPECTOR QUE LO REPORTA: </strong>" & Session.Item("SIRECAnombre").ToString.ToUpper & "<br/>" _
                        & " <strong>FECHA: </strong>" & Now.ToLongDateString & "<br/>" _
                        & " <strong>HORA: </strong>" & Now.ToLongTimeString & "<br/>" _
                        & " <br/><a href='" & direccionip & "/websireca/observacionPatronal/Default.aspx?regpat=" & CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text & "&razon=razon '>Consultar</a>"
                For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                    If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                        emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio("NL", subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" SIRECA, NO LOCALIZADO"), "0", correoMsg)
                    Else
                        If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                            emailx.correoEnviar("sireca@imss.gob.mx", "cc", getCorreosEnvio("NL", subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)), (" SIRECA, NO LOCALIZADO"), "0", correoMsg)
                        End If
                    End If
                Next
                'subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1)

                emailx.correoEnviar("jesus.chi@imss.gob.mx", "cc", getCorreosEnvio("NL", "00"), (" SIRECA, NO LOCALIZADO"), "0", correoMsg)
                'If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                '    emailx.correoEnviar("alejandra.victorin@imss.gob.mx", "cc", "yamily.novelo@imss.gob.mx,humberto.escalante@imss.gob.mx,jose.lizama@imss.gob.mx,geovani.medina@imss.gob.mx,jose.martink@imss.gob.mx", " SIRECA, NO LOCALIZADO", "0", correoMsg)
                'ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                '    emailx.correoEnviar("dea.hernandezoj@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx,roman.pech@imss.gob.mx,aureo.medina@imss.gob.mx,ligia.arceo@imss.gob.mx,julio.soberanis@imss.gob.mx", " SIRECA, NO LOCALIZADO", "0", correoMsg)
                'End If
                'emailx.correoEnviar("jesus.chi@imss.gob.mx", "cc", "cco", " SIRECA, NO LOCALIZADO", "0", correoMsg)
            End If
        End If
    End Sub
    Private Function getCorreosEnvio(ByVal tipoEnvio As String, ByVal subdelEmail As String) As String
        Dim correos As String = ""
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT email "
            consulta += " from fiscamovil.dbo.usuarios as uf inner join sireca.dbo.usuarios as us "
            consulta += " on uf.id=us.id "
            consulta += " where us.correoAuto like '%" + tipoEnvio + "%' and us.subdel='" + subdelEmail + "' "
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
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return correos
    End Function
    Protected Sub addNoLocalizadoRegistros()
        Dim con As New OleDbConnection(cadenaconexion)
        Dim cmd As New OleDbCommand()
        cmd.Connection = con
        Dim myInsertQuery As String = " INSERT INTO [sirecaregistros].[dbo].[nodiligenciados] "
        myInsertQuery += " ([SUBDEL],[REG_PAT],[STATUS],[LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] "
        myInsertQuery += " ,[OBSERVACIONES],[RFC_FISICAS_13_MORALES_12],[NOMBRE_PATRON],[DOMICILIO_FISCAL_IMSS] "
        myInsertQuery += " ,[SAT_ARCHIVO_DE_SOLICITUD],[SAT_FECHA_RESPUESTA] "
        myInsertQuery += " ,[SAT_FECHA_DE_RECEPCION_DEL_ARCHIVO],[SAT_EN_CASO_DE_HABERSE_SOLICITADO_POR_OFICIO_REFERENCIA] "
        myInsertQuery += " ,[SAT_FECHA_DE_LA_RESPUESTA],[SAT_SOLICITUD_CON_OFICIO] "
        myInsertQuery += " ,[SAT_FECHA_SOLICITUD_CON_OFICIO],[SAT_DOMICILIO],[ACTIVIDAD],[FECHA_ACTA_CIRCUNST],[FECHA_RECEP_IMPED_COBRO] "
        myInsertQuery += " ,[FECHA_RECEPCION_DEL_ACTA_CIRCUNSTANCIADA],[FECHA_AFIL_ALTA],[FECHA_INF_REL_LAB_INEX] "
        myInsertQuery += " ,[FECHA_MEMO_BAJA],[NUMERO_MEMO_BAJA],[FECHA_BAJA],[ENCARGADO_MESA_CREDITOS_CON_IMPED_COBRO] "
        myInsertQuery += " ,[JEFE_LA_OFICINA_REGISTROS_Y_CONTROL_LA_CARTERA],[JEFE_DEPTO_AFILIACION_Y_VIGENCIA_DERECHOS] "
        myInsertQuery += " ,[TITULAR_SUBDELEG],[N_TRAB],[PROCE_ND_QUE_ORIG_BAJA] "
        myInsertQuery += " ,[REFERENCIA_N_CED_CAPT_O_REF_DE_MEMO],[FECHA_REFERENCIA_LA_CEDULA],[FECHA_REFERENCIA_CAPT],[FECHA_REFERENCIA_MEMO] "
        myInsertQuery += " ,[NOMBRE_DEL_NL_QUE_VERIFICA_EL_FISCAL],[FECHA_ENT_DEV_NL],[RESULTADO_DE_LA_VERIFICACION_DEL_DOMICILIO_FISCAL] "
        myInsertQuery += " ,[NOMBRE_LOCALIZADOR],[FECHA_ENT_DEV_LOCALIZADOR],[NOMBRE_NL_VERIFICA_SAT_SOLO_CASO_QUE_FISCAL_Y_SAT_SEAN_DIFERENTE] "
        myInsertQuery += " ,[FECHA_ENT_DEV_NL_QUE_VERIFICA_EL_SAT_EN_CASO_DE_QUE_FISCAL_Y_SAT_S] "
        myInsertQuery += " ,[ELABORO],[REF_MEMO_AFILIACION_CON_QUE_ENVIA_EL_AFIL_DE_BAJA] "
        myInsertQuery += " ,[FECHA_RECEPCION_DEL_MEMO_DE_AFILIACION],[RANGO],[IMPORTE_COP],[IMPORTE_RCV],[REF_MEMO_AFILIACION_PARA_INVEST_INTERNA] "
        myInsertQuery += " ,[FECHA_MEMO_AFILIACION_PARA_INTERNA_ENTREGA_DEVOLUCION],[ND_ANTERIOR],[POSIBLE_SUST_PAT],[FECHA_ENVIO_AL_DEPTO_AUD_PAT],[OBSERVACION_AUDITORIA],[CRED_COP],[CRED_RCV],[FECH_ND]) "
        myInsertQuery += " SELECT top 1 '" + Session.Item("SIRECAsubdel").ToString + "','" + CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text + "' "
        myInsertQuery += " ,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null "
        myInsertQuery += " ,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null "
        myInsertQuery += " ,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,getdate()"
        myInsertQuery += " where not exists(select srnd.REG_PAT from sirecaregistros.dbo.nodiligenciados as srnd where srnd.REG_PAT='" + CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text + "') "

        cmd.CommandText = myInsertQuery
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Protected Sub setAutodeterminar()
        'consulta [id]
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        catCMD.CommandText = "SELECT [regpat], [tipoEco], [periodo] FROM [sireca].[dbo].[autodeterminados] WHERE regpat = '" & CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text & "' and tipoEco='" & DetailsView1.Rows(5).Cells(1).Text & "' and periodo='" & DetailsView1.Rows(12).Cells(1).Text & "'"
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim num As Integer = 0
        Do While myReader.Read()
            num = num + 1
            myReader.GetValue(0)
        Loop
        myReader.Close()
        nwindConn.Close()
        If num = 0 Then
            '[regpat]*, [tipoEco]*, [periodo]*, [fechaRegistro]*, [idRegistro]{quien lo registro}*, [subdel]
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con
            Dim myInsertQuery As String = " INSERT INTO [sireca].[dbo].[autodeterminados]([regpat],[tipoEco],[periodo],[fechaRegistro],[idRegistro],[subdel],[incidencia])"
            myInsertQuery += " VALUES(?, ?, ?, ?, ?, ?, ?)"
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@id", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text
            cmd.Parameters.Add("@tipoEco", OleDbType.VarChar).Value = DetailsView1.Rows(5).Cells(1).Text
            cmd.Parameters.Add("@periodo", OleDbType.Double).Value = Convert.ToDouble(DetailsView1.Rows(12).Cells(1).Text)
            cmd.Parameters.Add("@fechaRegistro", OleDbType.Date).Value = Convert.ToDateTime(TBFechDili.Text & " " & Now.ToShortTimeString)
            cmd.Parameters.Add("@idRegistro", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "PP"

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End If
    End Sub
    Protected Sub updateTableEcoControl(ByVal up_idinspector As String, ByVal up_inc As String, ByVal up_fech_inc As String, ByVal data_regpat As String, ByVal data_periodo As String, ByVal data_credito As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sireca].[dbo].[ecocontrol] " _
            & " SET [INSPECTOR]='" + up_idinspector + "' " _
            & " ,[INC]='" + up_inc + "' " _
            & " ,[FECH_CAP]='" + up_fech_inc + "' " _
            & " ,[CICLO_CAP]='1' " _
            & " WHERE substring([REGPAT],1,10)='" + data_regpat + "' and [PERIODO]='" + data_periodo + "' and [CREDITO]='" + data_credito + "' "
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
    Protected Sub setRePagado()
        Dim con As New OleDbConnection(cadenaconexion)
        Dim cmd As New OleDbCommand()

        cmd.Connection = con
        Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [grado2] = ?, [grado3] = ? WHERE [id]=?"
        cmd.CommandText = myInsertQuery
        'credito
        Dim incidenciaValue As String = DDLDiligencia.SelectedValue
        cmd.Parameters.Add("@grado2", OleDbType.VarChar).Value = "PAGADO"
        cmd.Parameters.Add("@grado3", OleDbType.VarChar).Value = incidenciaValue

        cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(Request.QueryString("regpatid").ToString)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
Imports System.Data.OleDb
Imports addHistorialAcciones

Public Class ActualizarND
    Inherits System.Web.UI.Page
    Dim salarioMinimo As Double = Convert.ToDouble(ConfigurationSettings.AppSettings("salarioMinimo").ToString)
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim histAcciones As HistorialWeb = New HistorialWeb
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAbaseNDRegistros").ToString.Equals("1") Then
                If Request.QueryString("tipo").ToString.Equals("reg") Then
                    BRegistro.Visible = True
                    BActualizar.Visible = False
                ElseIf Request.QueryString("tipo").ToString.Equals("act") Then
                    BRegistro.Visible = False
                    BActualizar.Visible = True
                End If
                If Session.Item("SIRECAuserIntegrador").ToString.Equals("2") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("4") Then
                    Dim c As Control
                    Dim childc As Control
                    For Each c In Page.Controls
                        For Each childc In c.Controls
                            If TypeOf childc Is TextBox Then
                                CType(childc, TextBox).Enabled = False
                            End If
                            If TypeOf childc Is DropDownList Then
                                CType(childc, DropDownList).Enabled = False
                            End If
                            If TypeOf childc Is FileUpload Then
                                CType(childc, FileUpload).Enabled = False
                            End If
                        Next
                    Next
                End If
            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If
    End Sub
    Private Sub agregarND()
        Try
            LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaregistros].[dbo].[nodiligenciados] " _
    & " ([SUBDEL] " _
    & " ,[REG_PAT] " _
    & " ,[STATUS] " _
    & " ,[LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] " _
    & " ,[OBSERVACIONES] " _
    & " ,[RFC_FISICAS_13_MORALES_12] " _
    & " ,[NOMBRE_PATRON] " _
    & " ,[DOMICILIO_FISCAL_IMSS] " _
    & " ,[SAT_ARCHIVO_DE_SOLICITUD] " _
    & " ,[SAT_FECHA_RESPUESTA] " _
    & " ,[SAT_FECHA_DE_RECEPCION_DEL_ARCHIVO] " _
    & " ,[SAT_EN_CASO_DE_HABERSE_SOLICITADO_POR_OFICIO_REFERENCIA] " _
    & " ,[SAT_FECHA_DE_LA_RESPUESTA] " _
    & " ,[SAT_SOLICITUD_CON_OFICIO] " _
    & " ,[SAT_FECHA_SOLICITUD_CON_OFICIO] " _
    & " ,[SAT_DOMICILIO] " _
    & " ,[ACTIVIDAD] " _
    & " ,[FECHA_ACTA_CIRCUNST] " _
    & " ,[FECHA_RECEP_IMPED_COBRO] " _
    & " ,[FECHA_RECEPCION_DEL_ACTA_CIRCUNSTANCIADA] " _
    & " ,[FECHA_AFIL_ALTA] " _
    & " ,[FECHA_INF_REL_LAB_INEX] " _
    & " ,[FECHA_MEMO_BAJA] " _
    & " ,[NUMERO_MEMO_BAJA] " _
    & " ,[FECHA_BAJA] " _
    & " ,[ENCARGADO_MESA_CREDITOS_CON_IMPED_COBRO] " _
    & " ,[JEFE_LA_OFICINA_REGISTROS_Y_CONTROL_LA_CARTERA] " _
    & " ,[JEFE_DEPTO_AFILIACION_Y_VIGENCIA_DERECHOS] " _
    & " ,[TITULAR_SUBDELEG] " _
    & " ,[N_TRAB] " _
    & " ,[PROCE_ND_QUE_ORIG_BAJA] " _
    & " ,[REFERENCIA_N_CED_CAPT_O_REF_DE_MEMO] " _
    & " ,[FECHA_REFERENCIA_LA_CEDULA] " _
    & " ,[FECHA_REFERENCIA_CAPT] " _
    & " ,[FECHA_REFERENCIA_MEMO] " _
    & " ,[NOMBRE_DEL_NL_QUE_VERIFICA_EL_FISCAL] " _
    & " ,[FECHA_ENT_DEV_NL] " _
    & " ,[RESULTADO_DE_LA_VERIFICACION_DEL_DOMICILIO_FISCAL] " _
    & " ,[NOMBRE_LOCALIZADOR] " _
    & " ,[FECHA_ENT_DEV_LOCALIZADOR] " _
    & " ,[NOMBRE_NL_VERIFICA_SAT_SOLO_CASO_QUE_FISCAL_Y_SAT_SEAN_DIFERENTE] " _
    & " ,[FECHA_ENT_DEV_NL_QUE_VERIFICA_EL_SAT_EN_CASO_DE_QUE_FISCAL_Y_SAT_S] " _
    & " ,[ELABORO] " _
    & " ,[REF_MEMO_AFILIACION_CON_QUE_ENVIA_EL_AFIL_DE_BAJA] " _
    & " ,[FECHA_RECEPCION_DEL_MEMO_DE_AFILIACION] " _
    & " ,[RANGO] " _
    & " ,[IMPORTE_COP] " _
    & " ,[IMPORTE_RCV] " _
    & " ,[REF_MEMO_AFILIACION_PARA_INVEST_INTERNA] " _
    & " ,[FECHA_MEMO_AFILIACION_PARA_INTERNA_ENTREGA_DEVOLUCION] " _
    & " ,[ND_ANTERIOR] " _
    & " ,[POSIBLE_SUST_PAT] " _
    & " ,[FECHA_ENVIO_AL_DEPTO_AUD_PAT] " _
    & " ,[OBSERVACION_AUDITORIA],[CRED_COP],[CRED_RCV],[FECH_ND]) " _
    & " VALUES " _
    & " ('" & Session.Item("SIRECAsubdel").ToString & "' " _
    & " ,'" & V01.Text & "' " _
    & " ,'" & VDDL02.SelectedValue & "' " _
    & " ,'" & VDDL03.SelectedValue & "' " _
    & " ,'" & V04.Text & "' " _
    & " ,'" & V05.Text & "' " _
    & " ,'" & V06.Text & "' " _
    & " ,'" & V07.Text & "' " _
    & " ,'" & V08.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech09.Text), Convert.ToDateTime(VFech09.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech10.Text), Convert.ToDateTime(VFech10.Text), DBNull.Value) & "',103) " _
    & " ,'" & V11.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech12.Text), Convert.ToDateTime(VFech12.Text), DBNull.Value) & "',103) " _
    & " ,'" & V13.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech14.Text), Convert.ToDateTime(VFech14.Text), DBNull.Value) & "',103) " _
    & " ,'" & V15.Text & "' " _
    & " ,'" & V16.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech17.Text), Convert.ToDateTime(VFech17.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech18.Text), Convert.ToDateTime(VFech18.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech19.Text), Convert.ToDateTime(VFech19.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech20.Text), Convert.ToDateTime(VFech20.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech21.Text), Convert.ToDateTime(VFech21.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech22.Text), Convert.ToDateTime(VFech22.Text), DBNull.Value) & "',103) " _
    & " ,'" & V23.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech24.Text), Convert.ToDateTime(VFech24.Text), DBNull.Value) & "',103) " _
    & " ,'" & V25.Text & "' " _
    & " ,'" & V26.Text & "' " _
    & " ,'" & V27.Text & "' " _
    & " ,'" & V28.Text & "' " _
    & " ," & If(IsNumeric(V29.Text), Convert.ToDouble(V29.Text), 0) & " " _
    & " ,'" & VDDL30.Text & "' " _
    & " ,'" & V31.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech32.Text), Convert.ToDateTime(VFech32.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech33.Text), Convert.ToDateTime(VFech33.Text), DBNull.Value) & "',103) " _
    & " ,convert(datetime,'" & If(IsDate(VFech34.Text), Convert.ToDateTime(VFech34.Text), DBNull.Value) & "',103) " _
    & " ,'" & V35.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech36.Text), Convert.ToDateTime(VFech36.Text), DBNull.Value) & "',103) " _
    & " ,'" & V37.Text & "' " _
    & " ,'" & V38.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech39.Text), Convert.ToDateTime(VFech39.Text), DBNull.Value) & "',103) " _
    & " ,'" & V40.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech41.Text), Convert.ToDateTime(VFech41.Text), DBNull.Value) & "',103) " _
    & " ,'" & V42.Text & "' " _
    & " ,'" & V43.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech44.Text), Convert.ToDateTime(VFech44.Text), DBNull.Value) & "',103) " _
    & " ,'" & V45.Text & "' " _
    & " ," & If(IsNumeric(V46.Text), Convert.ToDouble(V46.Text), 0) & " " _
    & " ," & If(IsNumeric(V47.Text), Convert.ToDouble(V47.Text), 0) & " " _
    & " ,'" & V48.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech49.Text), Convert.ToDateTime(VFech49.Text), DBNull.Value) & "',103) " _
    & " ,'" & V50.Text & "' " _
    & " ,'" & V51.Text & "' " _
    & " ,convert(datetime,'" & If(IsDate(VFech52.Text), Convert.ToDateTime(VFech52.Text), DBNull.Value) & "',103),'" & V53.Text & "' " _
    & " ," & If(IsNumeric(VCCOP.Text), Convert.ToDouble(VCCOP.Text), 0) & " " _
    & " ," & If(IsNumeric(VCRCV.Text), Convert.ToDouble(VCRCV.Text), 0) & " " _
    & " ,getdate()) "
            cmd22.CommandText = myInsertQuery22

            'cmd22.Parameters.Add("@id_inspector", OleDbType.VarChar).Value = DropDownList1.SelectedValue
            'cmd22.Parameters.Add("@id_observo", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            'cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = ""
            'cmd22.Parameters.Add("@ip_host", OleDbType.VarChar).Value = Request.UserHostAddress()

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LError.Text = "Error al Registrar"
            Else
                Response.Redirect("~/pag_registros/Default.aspx")
            End If
            con22.Close()
        Catch ex As Exception
            LError.Text = ex.Message
        End Try
    End Sub
    Private Sub actualizarND()
        Try
            LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sirecaregistros].[dbo].[nodiligenciados] " _
& " SET [STATUS] = '" & VDDL02.SelectedValue & "' " _
& " ,[LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] = '" & VDDL03.SelectedValue & "' " _
& " ,[OBSERVACIONES] = '" & V04.Text & "' " _
& " ,[RFC_FISICAS_13_MORALES_12] = '" & V05.Text & "' " _
& " ,[NOMBRE_PATRON] = '" & V06.Text & "' " _
& " ,[DOMICILIO_FISCAL_IMSS] = '" & V07.Text & "' " _
& " ,[SAT_ARCHIVO_DE_SOLICITUD] = '" & V08.Text & "' " _
& " ,[SAT_FECHA_RESPUESTA] = convert(datetime,'" & VFech09.Text & "',103) " _
& " ,[SAT_FECHA_DE_RECEPCION_DEL_ARCHIVO] = convert(datetime,'" & VFech10.Text & "',103) " _
& " ,[SAT_EN_CASO_DE_HABERSE_SOLICITADO_POR_OFICIO_REFERENCIA] = '" & V11.Text & "' " _
& " ,[SAT_FECHA_DE_LA_RESPUESTA] = convert(datetime,'" & VFech12.Text & "',103) " _
& " ,[SAT_SOLICITUD_CON_OFICIO] = '" & V13.Text & "' " _
& " ,[SAT_FECHA_SOLICITUD_CON_OFICIO] = convert(datetime,'" & VFech14.Text & "',103) " _
& " ,[SAT_DOMICILIO] = '" & V15.Text & "' " _
& " ,[ACTIVIDAD] = '" & V16.Text & "' " _
& " ,[FECHA_ACTA_CIRCUNST] = convert(datetime,'" & VFech17.Text & "',103) " _
& " ,[FECHA_RECEP_IMPED_COBRO] = convert(datetime,'" & VFech18.Text & "',103) " _
& " ,[FECHA_RECEPCION_DEL_ACTA_CIRCUNSTANCIADA] = convert(datetime,'" & VFech19.Text & "',103) " _
& " ,[FECHA_AFIL_ALTA] = convert(datetime,'" & VFech20.Text & "',103) " _
& " ,[FECHA_INF_REL_LAB_INEX] = convert(datetime,'" & VFech21.Text & "',103) " _
& " ,[FECHA_MEMO_BAJA] = convert(datetime,'" & VFech22.Text & "',103) " _
& " ,[NUMERO_MEMO_BAJA] = '" & V23.Text & "' " _
& " ,[FECHA_BAJA] = convert(datetime,'" & VFech24.Text & "',103) " _
& " ,[ENCARGADO_MESA_CREDITOS_CON_IMPED_COBRO] = '" & V25.Text & "' " _
& " ,[JEFE_LA_OFICINA_REGISTROS_Y_CONTROL_LA_CARTERA] = '" & V26.Text & "' " _
& " ,[JEFE_DEPTO_AFILIACION_Y_VIGENCIA_DERECHOS] = '" & V27.Text & "' " _
& " ,[TITULAR_SUBDELEG] = '" & V28.Text & "' " _
& " ,[N_TRAB] = " & If(IsNumeric(V29.Text), Convert.ToDouble(V29.Text), 0) & " " _
& " ,[PROCE_ND_QUE_ORIG_BAJA] = '" & VDDL30.Text & "' " _
& " ,[REFERENCIA_N_CED_CAPT_O_REF_DE_MEMO] = '" & V31.Text & "' " _
& " ,[FECHA_REFERENCIA_LA_CEDULA] = convert(datetime,'" & VFech32.Text & "',103) " _
& " ,[FECHA_REFERENCIA_CAPT] = convert(datetime,'" & VFech33.Text & "',103) " _
& " ,[FECHA_REFERENCIA_MEMO] = convert(datetime,'" & VFech34.Text & "',103) " _
& " ,[NOMBRE_DEL_NL_QUE_VERIFICA_EL_FISCAL] = '" & V35.Text & "' " _
& " ,[FECHA_ENT_DEV_NL] = convert(datetime,'" & VFech36.Text & "',103) " _
& " ,[RESULTADO_DE_LA_VERIFICACION_DEL_DOMICILIO_FISCAL] = '" & V37.Text & "' " _
& " ,[NOMBRE_LOCALIZADOR] = '" & V38.Text & "' " _
& " ,[FECHA_ENT_DEV_LOCALIZADOR] = convert(datetime,'" & VFech39.Text & "',103) " _
& " ,[NOMBRE_NL_VERIFICA_SAT_SOLO_CASO_QUE_FISCAL_Y_SAT_SEAN_DIFERENTE] = '" & V40.Text & "' " _
& " ,[FECHA_ENT_DEV_NL_QUE_VERIFICA_EL_SAT_EN_CASO_DE_QUE_FISCAL_Y_SAT_S] = convert(datetime,'" & VFech41.Text & "',103) " _
& " ,[ELABORO] = '" & V42.Text & "' " _
& " ,[REF_MEMO_AFILIACION_CON_QUE_ENVIA_EL_AFIL_DE_BAJA] = '" & V43.Text & "' " _
& " ,[FECHA_RECEPCION_DEL_MEMO_DE_AFILIACION] = convert(datetime,'" & VFech44.Text & "',103) " _
& " ,[RANGO] = '" & V45.Text.ToUpper & "' " _
& " ,[IMPORTE_COP] = " & If(IsNumeric(V46.Text), Convert.ToDouble(V46.Text), 0) & " " _
& " ,[IMPORTE_RCV] = " & If(IsNumeric(V47.Text), Convert.ToDouble(V47.Text), 0) & " " _
& " ,[REF_MEMO_AFILIACION_PARA_INVEST_INTERNA] = '" & V48.Text & "' " _
& " ,[FECHA_MEMO_AFILIACION_PARA_INTERNA_ENTREGA_DEVOLUCION] = convert(datetime,'" & VFech49.Text & "',103) " _
& " ,[ND_ANTERIOR] = '" & V50.Text & "' " _
& " ,[POSIBLE_SUST_PAT] = '" & V51.Text & "' " _
& " ,[FECHA_ENVIO_AL_DEPTO_AUD_PAT] = convert(datetime,'" & VFech52.Text & "',103) " _
& " ,[OBSERVACION_AUDITORIA] = '" & V53.Text & "' " _
& " ,[CRED_COP] = '" & VCCOP.Text & "' " _
& " ,[CRED_RCV] = '" & VCRCV.Text & "' " _
& " WHERE [ID_ND]= " & Request.QueryString("id_nd").ToString

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LError.Text = "Error al Actualizar"
            Else
                If Request.QueryString("estatus").ToString.Equals("y") Then
                    Response.Redirect("~/pag_registros/integracionparacancelacion.aspx")
                Else
                    Response.Redirect("~/pag_registros/Default.aspx")
                End If
            End If
            con22.Close()
        Catch ex As Exception
            LError.Text = "Error al Actualizar"
        End Try
    End Sub
    Private Sub cargarDatosAActualizar()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT [ID_ND] " _
& " ,[SUBDEL] " _
& " ,[REG_PAT] " _
& " ,[STATUS] " _
& " ,[LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] " _
& " ,[OBSERVACIONES] " _
& " ,[RFC_FISICAS_13_MORALES_12] " _
& " ,[NOMBRE_PATRON] " _
& " ,[DOMICILIO_FISCAL_IMSS] " _
& " ,[SAT_ARCHIVO_DE_SOLICITUD] " _
& " ,[SAT_FECHA_RESPUESTA] " _
& " ,[SAT_FECHA_DE_RECEPCION_DEL_ARCHIVO] " _
& " ,[SAT_EN_CASO_DE_HABERSE_SOLICITADO_POR_OFICIO_REFERENCIA] " _
& " ,[SAT_FECHA_DE_LA_RESPUESTA] " _
& " ,[SAT_SOLICITUD_CON_OFICIO] " _
& " ,[SAT_FECHA_SOLICITUD_CON_OFICIO] " _
& " ,[SAT_DOMICILIO] " _
& " ,[ACTIVIDAD] " _
& " ,[FECHA_ACTA_CIRCUNST] " _
& " ,[FECHA_RECEP_IMPED_COBRO] " _
& " ,[FECHA_RECEPCION_DEL_ACTA_CIRCUNSTANCIADA] " _
& " ,[FECHA_AFIL_ALTA] " _
& " ,[FECHA_INF_REL_LAB_INEX] " _
& " ,[FECHA_MEMO_BAJA] " _
& " ,[NUMERO_MEMO_BAJA] " _
& " ,[FECHA_BAJA] " _
& " ,[ENCARGADO_MESA_CREDITOS_CON_IMPED_COBRO] " _
& " ,[JEFE_LA_OFICINA_REGISTROS_Y_CONTROL_LA_CARTERA] " _
& " ,[JEFE_DEPTO_AFILIACION_Y_VIGENCIA_DERECHOS] " _
& " ,[TITULAR_SUBDELEG] " _
& " ,[N_TRAB] " _
& " ,[PROCE_ND_QUE_ORIG_BAJA] " _
& " ,[REFERENCIA_N_CED_CAPT_O_REF_DE_MEMO] " _
& " ,[FECHA_REFERENCIA_LA_CEDULA] " _
& " ,[FECHA_REFERENCIA_CAPT] " _
& " ,[FECHA_REFERENCIA_MEMO] " _
& " ,[NOMBRE_DEL_NL_QUE_VERIFICA_EL_FISCAL] " _
& " ,[FECHA_ENT_DEV_NL] " _
& " ,[RESULTADO_DE_LA_VERIFICACION_DEL_DOMICILIO_FISCAL] " _
& " ,[NOMBRE_LOCALIZADOR] " _
& " ,[FECHA_ENT_DEV_LOCALIZADOR] " _
& " ,[NOMBRE_NL_VERIFICA_SAT_SOLO_CASO_QUE_FISCAL_Y_SAT_SEAN_DIFERENTE] " _
& " ,[FECHA_ENT_DEV_NL_QUE_VERIFICA_EL_SAT_EN_CASO_DE_QUE_FISCAL_Y_SAT_S] " _
& " ,[ELABORO] " _
& " ,[REF_MEMO_AFILIACION_CON_QUE_ENVIA_EL_AFIL_DE_BAJA] " _
& " ,[FECHA_RECEPCION_DEL_MEMO_DE_AFILIACION] " _
& " ,[RANGO] " _
& " ,[IMPORTE_COP] " _
& " ,[IMPORTE_RCV] " _
& " ,[REF_MEMO_AFILIACION_PARA_INVEST_INTERNA] " _
& " ,[FECHA_MEMO_AFILIACION_PARA_INTERNA_ENTREGA_DEVOLUCION] " _
& " ,[ND_ANTERIOR] " _
& " ,[POSIBLE_SUST_PAT] " _
& " ,[FECHA_ENVIO_AL_DEPTO_AUD_PAT] " _
& " ,[OBSERVACION_AUDITORIA] " _
& " ,[CRED_COP] " _
& " ,[CRED_RCV] " _
& " ,[FECH_ND] " _
& " FROM [sirecaregistros] .[dbo].[nodiligenciados] " _
& " WHERE [ID_ND] =" & Request.QueryString("id_nd").ToString
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                V01.Text = myReader2.GetValue(2).ToString
                V01.ReadOnly = True
                VDDL02.Text = myReader2.GetValue(3).ToString
                VDDL03.Text = myReader2.GetValue(4).ToString
                V04.Text = myReader2.GetValue(5).ToString
                V05.Text = myReader2.GetValue(6).ToString
                V06.Text = myReader2.GetValue(7).ToString
                V07.Text = myReader2.GetValue(8).ToString
                V08.Text = myReader2.GetValue(9).ToString
                VFech09.Text = myReader2.GetValue(10).ToString.Replace("12:00:00 a.m.", "")
                VFech10.Text = myReader2.GetValue(11).ToString.Replace("12:00:00 a.m.", "")
                V11.Text = myReader2.GetValue(12).ToString
                VFech12.Text = myReader2.GetValue(13).ToString.Replace("12:00:00 a.m.", "")
                V13.Text = myReader2.GetValue(14).ToString
                VFech14.Text = myReader2.GetValue(15).ToString.Replace("12:00:00 a.m.", "")
                V15.Text = myReader2.GetValue(16).ToString
                V16.Text = myReader2.GetValue(17).ToString
                VFech17.Text = myReader2.GetValue(18).ToString.Replace("12:00:00 a.m.", "")
                VFech18.Text = myReader2.GetValue(19).ToString.Replace("12:00:00 a.m.", "")
                VFech19.Text = myReader2.GetValue(20).ToString.Replace("12:00:00 a.m.", "")
                VFech20.Text = myReader2.GetValue(21).ToString.Replace("12:00:00 a.m.", "")
                VFech21.Text = myReader2.GetValue(22).ToString.Replace("12:00:00 a.m.", "")
                VFech22.Text = myReader2.GetValue(23).ToString.Replace("12:00:00 a.m.", "")
                V23.Text = myReader2.GetValue(24).ToString
                VFech24.Text = myReader2.GetValue(25).ToString.Replace("12:00:00 a.m.", "")
                V25.Text = myReader2.GetValue(26).ToString
                V26.Text = myReader2.GetValue(27).ToString
                V27.Text = myReader2.GetValue(28).ToString
                V28.Text = myReader2.GetValue(29).ToString
                V29.Text = myReader2.GetValue(30).ToString
                VDDL30.Text = myReader2.GetValue(31).ToString.Replace("12:00:00 a.m.", "")
                V31.Text = myReader2.GetValue(32).ToString
                VFech32.Text = myReader2.GetValue(33).ToString.Replace("12:00:00 a.m.", "")
                VFech33.Text = myReader2.GetValue(34).ToString.Replace("12:00:00 a.m.", "")
                VFech34.Text = myReader2.GetValue(35).ToString.Replace("12:00:00 a.m.", "")
                V35.Text = myReader2.GetValue(36).ToString
                VFech36.Text = myReader2.GetValue(37).ToString.Replace("12:00:00 a.m.", "")
                V37.Text = myReader2.GetValue(38).ToString
                V38.Text = myReader2.GetValue(39).ToString
                VFech39.Text = myReader2.GetValue(40).ToString.Replace("12:00:00 a.m.", "")
                V40.Text = myReader2.GetValue(41).ToString
                VFech41.Text = myReader2.GetValue(42).ToString.Replace("12:00:00 a.m.", "")
                V42.Text = myReader2.GetValue(43).ToString
                V43.Text = myReader2.GetValue(44).ToString
                VFech44.Text = myReader2.GetValue(45).ToString.Replace("12:00:00 a.m.", "")
                V45.Text = myReader2.GetValue(46).ToString.ToUpper
                V46.Text = myReader2.GetValue(47).ToString
                V47.Text = myReader2.GetValue(48).ToString
                V48.Text = myReader2.GetValue(49).ToString
                VFech49.Text = myReader2.GetValue(50).ToString.Replace("12:00:00 a.m.", "")
                V50.Text = myReader2.GetValue(51).ToString
                V51.Text = myReader2.GetValue(52).ToString
                VFech52.Text = myReader2.GetValue(53).ToString.Replace("12:00:00 a.m.", "")
                V53.Text = myReader2.GetValue(54).ToString
                VCCOP.Text = myReader2.GetValue(53).ToString
                VCRCV.Text = myReader2.GetValue(53).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub BActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizar.Click
        histAcciones.agregarHistorial(cadenaconexion, "", Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "3", "Actualizacion", "", "", "Actualizacion", V01.Text, Request.UserHostAddress)
        actualizarND()
    End Sub
    Protected Sub BActualizar_Init(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizar.Init
        cargarDatosAActualizar()
    End Sub
    Protected Sub BRegistro_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BRegistro.Click
        histAcciones.agregarHistorial(cadenaconexion, "", Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "3", "Registro", "", "", "Registro", V01.Text, Request.UserHostAddress)
        agregarND()
    End Sub
    Private Sub actualizarAdeudoCOP()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " DECLARE @RALE as varchar(50) " _
& " SET @RALE = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='" & Session.Item("SIRECAsubdel").ToString & "' and tipo='COP' order by fecha desc) " _
& " exec('select count(*) as total,sum(importe) as IMPORTE from [rale].[dbo].['+@RALE+'] where replace(regpatr,''-'','''')=''" & V01.Text & "''') "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                VCCOP.Text = myReader2.GetValue(0).ToString
                V46.Text = myReader2.GetValue(1).ToString
                If IsNumeric(VCCOP.Text) Then
                Else
                    VCCOP.Text = "0"
                End If
                If IsNumeric(V46.Text) Then
                Else
                    V46.Text = "0"
                End If
            Loop
            myReader2.Close()
            nwindConn2.Close()
            If Convert.ToDouble(V46.Text) >= (25 * salarioMinimo * 365) Then
                V45.Text = "V"
            ElseIf Convert.ToDouble(V46.Text) > (4 * salarioMinimo * 365) And Convert.ToDouble(V46.Text) <= (25 * salarioMinimo * 365) Then
                V45.Text = "IV"
            ElseIf Convert.ToDouble(V46.Text) > (2 * salarioMinimo * 365) And Convert.ToDouble(V46.Text) <= (4 * salarioMinimo * 365) Then
                V45.Text = "III"
            ElseIf Convert.ToDouble(V46.Text) > (salarioMinimo * 365) And Convert.ToDouble(V46.Text) <= (2 * salarioMinimo * 365) Then
                V45.Text = "II"
            ElseIf Convert.ToDouble(V46.Text) <= (salarioMinimo * 365) Then
                V45.Text = "I"
            End If
        Catch ex As Exception
        End Try
    End Sub
    Private Sub actualizarAdeudoRCV()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " DECLARE @RALE as varchar(50) " _
& " SET @RALE = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='" & Session.Item("SIRECAsubdel").ToString & "' and tipo='RCV' order by fecha desc) " _
& " exec('select count(*) as total,sum(importe) as IMPORTE from [rale].[dbo].['+@RALE+'] where replace(regpatr,''-'','''')=''" & V01.Text & "''') "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                VCRCV.Text = myReader2.GetValue(0).ToString
                V47.Text = myReader2.GetValue(1).ToString
                If IsNumeric(VCRCV.Text) Then
                Else
                    VCRCV.Text = "0"
                End If
                If IsNumeric(V47.Text) Then
                Else
                    V47.Text = "0"
                End If
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub
    Private Sub actualizarFechaBaja()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " DECLARE @RALE as varchar(50) " _
& " SET @RALE = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='" & Session.Item("SIRECAsubdel").ToString & "' and tipo='COP' order by fecha desc) " _
& " exec('select top 1 FMOV from [rale].[dbo].['+@RALE+'] where MOV=''2'' and replace(regpatr,''-'','''')=''" & V01.Text & "''') "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                VFech24.Text = Convert.ToDateTime(myReader2.GetValue(0).ToString).ToShortDateString
                If IsDate(VFech24.Text) Then
                Else
                    VFech24.Text = "01/01/1900"
                End If
                
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub BActDatosPatron_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActDatosPatron.Click
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT " _
& " upper([rfc]) as RFC " _
& " ,upper([dom]) as DOMICILIO " _
& " ,upper([loc]) as LOCALIDAD " _
& " ,upper([act]) as ACTIVIDAD " _
& " ,upper([razonSocial]) as RAZON " _
& " ,upper([cotiz]) as COTIZANTES " _
& " FROM [sireca].[dbo].[patrones] " _
& " where [regpat]='" & V01.Text & "' "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                '05)RFC
                '06)razonSocial
                '16)actividad
                '29)num Trabajadores
                V05.Text = myReader2.GetValue(0).ToString
                V07.Text = myReader2.GetValue(1).ToString
                V06.Text = myReader2.GetValue(4).ToString
                V16.Text = myReader2.GetValue(3).ToString
                V29.Text = myReader2.GetValue(5).ToString
                If IsNumeric(V29.Text) Then
                Else
                    V29.Text = "0"
                End If
            Loop
            myReader2.Close()
            nwindConn2.Close()
            actualizarAdeudoCOP()
            actualizarAdeudoRCV()
            actualizarFechaBaja()
        Catch ex As Exception
        End Try
    End Sub
End Class
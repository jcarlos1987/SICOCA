Imports System.Data.OleDb
Imports System.Globalization

Public Class asignarnodeligenciado
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAuserIntegrador").ToString.Equals("1") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("2") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("3") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("4") Then
                If Session.Item("SIRECAuserIntegrador").ToString.Equals("1") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("4") Then
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
                cargarDatosAAsignar()
            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Function cargarDatosAActualizarCanResDev() As String
        Dim fechaAsig As String = ""
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT " _
            & " [C_FEC_ASIGNAC_EXP] " _
            & " ,[C_FEC_LIM_ENTREGA] " _
            & " FROM [sirecaregistros].[dbo].[controlrangos] WHERE [ID_ND] =" & Request.QueryString("id_nd").ToString
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                fechaAsig = If(IsDate(myReader2.GetValue(0).ToString), Convert.ToDateTime(myReader2.GetValue(0).ToString()).ToShortDateString, "")
                TBFechLimite.Text = If(IsDate(myReader2.GetValue(1).ToString), Convert.ToDateTime(myReader2.GetValue(1).ToString()).ToShortDateString, "")
            Loop
            myReader2.Close()
            nwindConn2.Close()

        Catch ex As Exception
        End Try
        Return fechaAsig
    End Function
    Private Sub cargarDatosAAsignar()
        Try
            Dim fechEntrega As String = cargarDatosAActualizarCanResDev()
            If IsDate(fechEntrega) Then
                TBFechEntrega.Enabled = False
                TBFechEntrega.Text = fechEntrega
            Else
                TBFechEntrega.Text = Now.ToShortDateString
                TBFechLimite.Text = DateAdd("d", 3, Now).ToShortDateString
            End If
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT " _
& " [CRED_COP] " _
& " ,[IMPORTE_COP] " _
& " ,[CRED_RCV] " _
& " ,[IMPORTE_RCV] " _
& " ,[REG_PAT]" _
& " ,[NOMBRE_PATRON] " _
& " ,[DOMICILIO_FISCAL_IMSS] " _
& " ,[ACTIVIDAD] " _
& " ,[RANGO] " _
& " FROM [sirecaregistros] .[dbo].[nodiligenciados] " _
& " WHERE [ID_ND] =" & Request.QueryString("id_nd").ToString
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                'V01.ReadOnly = True
                LCredCop.Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", If(IsNumeric(myReader2.GetValue(0).ToString), Convert.ToDouble(myReader2.GetValue(0).ToString), 0))
                LImpCop.Text = String.Format(New CultureInfo("es-MX"), "{0:C}", If(IsNumeric(myReader2.GetValue(1).ToString), Convert.ToDouble(myReader2.GetValue(1).ToString), 0))
                LCredRcv.Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", If(IsNumeric(myReader2.GetValue(2).ToString), Convert.ToDouble(myReader2.GetValue(2).ToString), 0))
                LImpRcv.Text = String.Format(New CultureInfo("es-MX"), "{0:C}", If(IsNumeric(myReader2.GetValue(3).ToString), Convert.ToDouble(myReader2.GetValue(3).ToString), 0))
                TBRegpat.Text = myReader2.GetValue(4).ToString
                TBRazon.Text = myReader2.GetValue(5).ToString
                TBDom.Text = myReader2.GetValue(6).ToString
                TBActi.Text = myReader2.GetValue(7).ToString
                LRango.Text = myReader2.GetValue(8).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        LMsg.Text = ""
        If agregarNDControlDeRangos() Then
            asignarNDControlDeRangos()
            LMsg.Text = "Actualizado"
        End If
        If agregarNDRegistroDeRangos() Then
            asignarNDRegistroDeRangos()
            LMsg.Text = "Actualizado"
        End If
    End Sub
    Protected Function agregarNDRegistroDeRangos() As Boolean
        Dim agregar As Boolean = True
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " select id_nd from [sirecaregistros].[dbo].[registrorangos] "
            consulta += " where id_nd='" & Request.QueryString("id_nd").ToString & "' "
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                agregar = False
                Exit Do
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return agregar
    End Function

    Protected Function agregarNDControlDeRangos() As Boolean
        Dim agregar As Boolean = True
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " select id_nd from [sirecaregistros].[dbo].[controlrangos] "
            consulta += " where id_nd='" & Request.QueryString("id_nd").ToString & "' "
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                agregar = False
                Exit Do
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return agregar
    End Function

    Protected Sub asignarNDControlDeRangos()
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaregistros].[dbo].[controlrangos] " _
& " ([ID_ND],[C_IP_HOST],[C_FEC_SYSTEM],[C_INTEGRADOR],[C_FEC_ASIGNAC_EXP],[C_FEC_LIM_ENTREGA],[C_FEC_DEV_EXP],[C_FEC_CANCELACION]) " _
& " VALUES " _
& " ( " _
& "'" & Request.QueryString("id_nd").ToString & "' " _
& ",'" & Request.UserHostAddress & "' " _
& ", getdate() " _
& ",'" & DDLIntegrador.SelectedValue & "' " _
& " ,convert(datetime,'" & If(IsDate(TBFechEntrega.Text), TBFechEntrega.Text, "NULL") & "',103) " _
& " ,convert(datetime,'" & If(IsDate(TBFechLimite.Text), TBFechLimite.Text, "NULL") & "',103) " _
& " ,NULL " _
& " ,NULL " _
& " ) "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                'LError.Text = "Error al Registrar"
            Else
                'Response.Redirect("~/pag_registros/Default.aspx")
            End If
            con22.Close()
        Catch ex As Exception
            'LError.Text = "Verifique que 29,46,47 contengan datos numericos"
        End Try
    End Sub

    Protected Sub asignarNDRegistroDeRangos()
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaregistros].[dbo].[registrorangos] " _
& " ([ID_ND],[R_IP_HOST],[R_FEC_SYSTEM],[R_ESTADO_INTEGRACION],[R_REGPAT],[R_RAZONSOCIAL],[R_DOMICILIO_FISCAL],[R_VERIF_DOM_FISCAL_PN],[R_ACTIVIDAD] " _
& " ,[R1_CATALOGO_PN] " _
& " ,[R1_CATALOGO_FILER] " _
& " ,[R2_EXP_PAG_GEN_FILER],[R2_EXP_PAG_GEN_PN] " _
& " ,[R3_EXP_OEPO_FE],[R3_EXP_OEPO_ME],[R3_EXP_OEPO_FILEE],[R3_EXP_OEPO_FR],[R3_EXP_OEPO_MR],[R3_EXP_OEPO_FILER],[R3_EXP_OEPO_PN] " _
& " ,[R4_EXP_COBROS_FE],[R4_EXP_COBROS_ME],[R4_EXP_COBROS_FILEE],[R4_EXP_COBROS_FR],[R4_EXP_COBROS_MR],[R4_EXP_COBROS_FILER],[R4_EXP_COBROS_PN] " _
& " ,[R5_EXP_CONVENIO_FE],[R5_EXP_CONVENIO_ME],[R5_EXP_CONVENIO_FILEE],[R5_EXP_CONVENIO_FR],[R5_EXP_CONVENIO_MR],[R5_EXP_CONVENIO_PN],[R5_EXP_CONVENIO_FILER] " _
& " ,[R6_CAT_NAC_PAT_FILE],[R6_CAT_NAC_PAT_PN] " _
& " ,[R7_EXP_AFIL_VIGEN_FE],[R7_EXP_AFIL_VIGEN_ME],[R7_EXP_AFIL_VIGEN_FILEE],[R7_EXP_AFIL_VIGEN_FR],[R7_EXP_AFIL_VIGEN_MR],[R7_EXP_AFIL_VIGEN_FILER],[R7_EXP_AFIL_VIGEN_PN] " _
& " ,[R8_EXP_AUDIT_FE],[R8_EXP_AUDIT_ME],[R8_EXP_AUDIT_FILEE],[R8_EXP_AUDIT_FR],[R8_EXP_AUDIT_MR],[R8_EXP_AUDIT_FILER],[R8_EXP_AUDIT_PN] " _
& " ,[R9_INF_JEF_SERV_JURD_FE],[R9_INF_JEF_SERV_JURD_ME],[R9_INF_JEF_SERV_JURD_FILEE],[R9_INF_JEF_SERV_JURD_FR],[R9_INF_JEF_SERV_JURD_MR],[R9_INF_JEF_SERV_JURD_FILER],[R9_INF_JEF_SERV_JURD_PN] " _
& " ,[R10_DIRECTORIO_TEL_PN] " _
& " ,[R10_DIRECTORIO_TEL_FILER] " _
& " ,[R11_SAT_FE],[R11_SAT_ME],[R11_SAT_FILEE],[R11_SAT_FR],[R11_SAT_MR],[R11_SAT_FILER],[R11_SAT_PN] " _
& " ,[R12_COMPRANET_FILE],[R12_COMPRANET_PN] " _
& " ,[R13_SIEM_FILE],[R13_SIEM_PN] " _
& " ,[R14_ENTREVISTA_A_TRES_TRAB_AREA],[R14_ENTREVISTA_A_TRES_TRAB_FR],[R14_ENTREVISTA_A_TRES_TRAB_FILE],[R14_ENTREVISTA_A_TRES_TRAB_PN] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FE],[R15_OFIC_REG_PUB_PROP_Y_COMER_OE],[R15_OFIC_REG_PUB_PROP_Y_COMER_FILEE],[R15_OFIC_REG_PUB_PROP_Y_COMER_FR],[R15_OFIC_REG_PUB_PROP_Y_COMER_OR],[R15_OFIC_REG_PUB_PROP_Y_COMER_FILER],[R15_OFIC_REG_PUB_PROP_Y_COMER_PN] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_FE],[R161_OFIC_TESORERIA_Y_FINZS_OE],[R161_OFIC_TESORERIA_Y_FINZS_FILEE],[R161_OFIC_TESORERIA_Y_FINZS_FR],[R161_OFIC_TESORERIA_Y_FINZS_OR],[R161_OFIC_TESORERIA_Y_FINZS_FILER] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_FE],[R162_OFIC_SECRETARIA_HCDA_EST_OE],[R162_OFIC_SECRETARIA_HCDA_EST_FILEE],[R162_OFIC_SECRETARIA_HCDA_EST_FR],[R162_OFIC_SECRETARIA_HCDA_EST_OR],[R162_OFIC_SECRETARIA_HCDA_EST_FILER] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FE],[R162_OFIC_SECRETARIA_HCDA_MUN_OE],[R162_OFIC_SECRETARIA_HCDA_MUN_FILEE],[R162_OFIC_SECRETARIA_HCDA_MUN_FR],[R162_OFIC_SECRETARIA_HCDA_MUN_OR],[R162_OFIC_SECRETARIA_HCDA_MUN_FILER] " _
& " ,[R16_OFIC_TESORERIA_SECRETARIA_PN] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FE],[R17_OFIC_A_NOTARIAS_PERS_MORAL_OE],[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILEE],[R17_OFIC_A_NOTARIAS_PERS_MORAL_FR],[R17_OFIC_A_NOTARIAS_PERS_MORAL_OR],[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER],[R17_OFIC_A_NOTARIAS_PERS_MORAL_PN],[R_AVANCE]) " _
& " VALUES " _
& " ( " _
& "'" & Request.QueryString("id_nd").ToString & "' " _
& ",'" & Request.UserHostAddress & "' " _
& ", getdate() " _
& ", 'PENDIENTE' " _
& ", '" & TBRegpat.Text & "' " _
& ", '" & TBRazon.Text & "' " _
& ", '" & TBDom.Text & "' " _
& ", 'NEGATIVO' " _
& ", '" & TBActi.Text & "' " _
& ",'NEGATIVO',NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO' " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL " _
& ",'NEGATIVO',NULL " _
& ",'NEGATIVO','EMISIONES',NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',NULL,NULL,NULL,NULL,NULL,NULL " _
& ",'NEGATIVO',0.0 " _
& ") "
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

End Class
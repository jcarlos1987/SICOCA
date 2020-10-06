Imports System.Data.OleDb
Imports System.IO

Public Class actualizarcontrolderangos
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAuserIntegrador").ToString.Equals("1") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("2") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("3") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("4") Then
                If Session.Item("SIRECAuserIntegrador").ToString.Equals("2") Or Session.Item("SIRECAuserIntegrador").ToString.Equals("4") Then
                    Dim c As Control
                    Dim childc As Control
                    For Each c In Page.Controls
                        LinkButton1.Visible = False
                        For Each childc In c.Controls
                            If TypeOf childc Is TextBox Then
                                CType(childc, TextBox).ReadOnly = True
                            End If
                            If TypeOf childc Is DropDownList Then
                                CType(childc, DropDownList).Enabled = False
                            End If
                            If TypeOf childc Is FileUpload Then
                                CType(childc, FileUpload).Enabled = False
                            End If
                        Next
                    Next
                Else
                    If Session.Item("SIRECAuserIntegrador").ToString.Equals("1") Then
                        If Not habilitarEdicionFormato() Then
                            Dim c As Control
                            Dim childc As Control
                            For Each c In Page.Controls
                                For Each childc In c.Controls
                                    If TypeOf childc Is TextBox Then
                                        CType(childc, TextBox).ReadOnly = True
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
                    End If
                End If
                cargarDatosAActualizarCanResDev()
                cargarDatosAActualizar()
            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If
    End Sub
    Protected Function habilitarEdicionFormato() As Boolean
        Dim habilitarEdicion = False
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT [C_INTEGRADOR] FROM [sirecaregistros].[dbo].[controlrangos] " _
& " WHERE [ID_ND] =" & Request.QueryString("id_nd").ToString
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                If myReader2.GetValue(0).ToString.Equals(Session.Item("SIRECAid").ToString) Then
                    habilitarEdicion = True
                End If
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        Return habilitarEdicion
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub cargarDatosAActualizarCanResDev()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT " _
            & " [C_FEC_DEV_EXP] " _
            & " ,[C_FEC_CANCELACION] " _
            & " ,[C_OBSEVACION] " _
            & " ,[C_FEC_ASIGNAC_EXP] " _
            & " FROM [sirecaregistros].[dbo].[controlrangos] WHERE [ID_ND] =" & Request.QueryString("id_nd").ToString
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                TBFechDecvExp.Text = If(IsDate(myReader2.GetValue(0).ToString), Convert.ToDateTime(myReader2.GetValue(0).ToString()).ToShortDateString, "")
                TBFechEstado.Text = If(IsDate(myReader2.GetValue(1).ToString), Convert.ToDateTime(myReader2.GetValue(1).ToString()).ToShortDateString, "")
                TBObservaciones.Text = myReader2.GetValue(2).ToString
                LFechAsig.Text = If(IsDate(myReader2.GetValue(3).ToString), Convert.ToDateTime(myReader2.GetValue(3).ToString()).ToShortDateString, "")
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub
    Private Sub cargarDatosAActualizar()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT " _
& " [R_ESTADO_INTEGRACION] " _
& " ,[R_REGPAT] " _
& " ,[R_RAZONSOCIAL] " _
& " ,[R_DOMICILIO_FISCAL] " _
& " ,[R_VERIF_DOM_FISCAL_PN] " _
& " ,[R_ACTIVIDAD] " _
& " ,[R1_CATALOGO_PN] " _
& " ,[R2_EXP_PAG_GEN_FILER] " _
& " ,[R2_EXP_PAG_GEN_PN] " _
& " ,[R3_EXP_OEPO_FE] " _
& " ,[R3_EXP_OEPO_ME] " _
& " ,[R3_EXP_OEPO_FILEE] " _
& " ,[R3_EXP_OEPO_FR] " _
& " ,[R3_EXP_OEPO_MR] " _
& " ,[R3_EXP_OEPO_FILER] " _
& " ,[R3_EXP_OEPO_PN] " _
& " ,[R4_EXP_COBROS_FE] " _
& " ,[R4_EXP_COBROS_ME] " _
& " ,[R4_EXP_COBROS_FILEE] " _
& " ,[R4_EXP_COBROS_FR] " _
& " ,[R4_EXP_COBROS_MR] " _
& " ,[R4_EXP_COBROS_FILER] " _
& " ,[R4_EXP_COBROS_PN] " _
& " ,[R5_EXP_CONVENIO_FE] " _
& " ,[R5_EXP_CONVENIO_ME] " _
& " ,[R5_EXP_CONVENIO_FILEE] " _
& " ,[R5_EXP_CONVENIO_FR] " _
& " ,[R5_EXP_CONVENIO_MR] " _
& " ,[R5_EXP_CONVENIO_PN] " _
& " ,[R5_EXP_CONVENIO_FILER] " _
& " ,[R6_CAT_NAC_PAT_FILE] " _
& " ,[R6_CAT_NAC_PAT_PN] " _
& " ,[R7_EXP_AFIL_VIGEN_FE] " _
& " ,[R7_EXP_AFIL_VIGEN_ME] " _
& " ,[R7_EXP_AFIL_VIGEN_FILEE] " _
& " ,[R7_EXP_AFIL_VIGEN_FR] " _
& " ,[R7_EXP_AFIL_VIGEN_MR] " _
& " ,[R7_EXP_AFIL_VIGEN_FILER] " _
& " ,[R7_EXP_AFIL_VIGEN_PN] " _
& " ,[R8_EXP_AUDIT_FE] " _
& " ,[R8_EXP_AUDIT_ME] " _
& " ,[R8_EXP_AUDIT_FILEE] " _
& " ,[R8_EXP_AUDIT_FR] " _
& " ,[R8_EXP_AUDIT_MR] " _
& " ,[R8_EXP_AUDIT_FILER] " _
& " ,[R8_EXP_AUDIT_PN] " _
& " ,[R9_INF_JEF_SERV_JURD_FE] " _
& " ,[R9_INF_JEF_SERV_JURD_ME] " _
& " ,[R9_INF_JEF_SERV_JURD_FILEE] " _
& " ,[R9_INF_JEF_SERV_JURD_FR] " _
& " ,[R9_INF_JEF_SERV_JURD_MR] " _
& " ,[R9_INF_JEF_SERV_JURD_FILER] " _
& " ,[R9_INF_JEF_SERV_JURD_PN] " _
& " ,[R10_DIRECTORIO_TEL_PN] " _
& " ,[R11_SAT_FE] " _
& " ,[R11_SAT_ME] " _
& " ,[R11_SAT_FILEE] " _
& " ,[R11_SAT_FR] " _
& " ,[R11_SAT_MR] " _
& " ,[R11_SAT_FILER] " _
& " ,[R11_SAT_PN] " _
& " ,[R12_COMPRANET_FILE] " _
& " ,[R12_COMPRANET_PN] " _
& " ,[R13_SIEM_FILE] " _
& " ,[R13_SIEM_PN] " _
& " ,[R14_ENTREVISTA_A_TRES_TRAB_AREA] " _
& " ,[R14_ENTREVISTA_A_TRES_TRAB_FR] " _
& " ,[R14_ENTREVISTA_A_TRES_TRAB_FILE] " _
& " ,[R14_ENTREVISTA_A_TRES_TRAB_PN] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FE] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_OE] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FILEE] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FR] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_OR] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FILER] " _
& " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_PN] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_FE] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_OE] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_FILEE] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_FR] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_OR] " _
& " ,[R161_OFIC_TESORERIA_Y_FINZS_FILER] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_FE] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_OE] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_FILEE] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_FR] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_OR] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_EST_FILER] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FE] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_OE] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FILEE] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FR] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_OR] " _
& " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FILER] " _
& " ,[R16_OFIC_TESORERIA_SECRETARIA_PN] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FE] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_OE] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILEE] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FR] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_OR] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER] " _
& " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_PN] " _
& " ,[R1_CATALOGO_FILER] " _
& " ,[R10_DIRECTORIO_TEL_FILER] " _
& " FROM [sirecaregistros].[dbo].[registrorangos] " _
& " WHERE [ID_ND] =" & Request.QueryString("id_nd").ToString
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                DDLEstadoIntegracion.SelectedValue = myReader2.GetValue(0).ToString
                TBRegpat.Text = myReader2.GetValue(1).ToString
                TBRazon.Text = myReader2.GetValue(2).ToString
                TBDomicilio.Text = myReader2.GetValue(3).ToString
                DDLVeriFiscal.SelectedValue = myReader2.GetValue(4).ToString
                TBActividad.Text = myReader2.GetValue(5).ToString
                'R1_CATALOGO_PN
                R1_PN.SelectedValue = myReader2.GetValue(6).ToString
                'R2_EXP_PAG_GEN_FILER                
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(7).ToString)) Then
                    R2_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(7).ToString
                    R2_DOCR.Visible = True
                End If
                'R2_EXP_PAG_GEN_PN
                R2_PN.SelectedValue = myReader2.GetValue(8).ToString
                'R3_EXP_OEPO_FE
                R3_FE.Text = If(IsDate(myReader2.GetValue(9).ToString), Convert.ToDateTime(myReader2.GetValue(9).ToString()).ToShortDateString, "")
                'R3_EXP_OEPO_ME
                R3_ME.Text = myReader2.GetValue(10).ToString
                'R3_EXP_OEPO_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(11).ToString)) Then
                    R3_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(11).ToString
                    R3_DOCE.Visible = True
                End If
                'R3_EXP_OEPO_FR
                R3_FR.Text = If(IsDate(myReader2.GetValue(12).ToString), Convert.ToDateTime(myReader2.GetValue(12).ToString()).ToShortDateString, "")
                'R3_EXP_OEPO_MR
                R3_MR.Text = myReader2.GetValue(13).ToString
                'R3_EXP_OEPO_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(14).ToString)) Then
                    R3_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(14).ToString
                    R3_DOCR.Visible = True
                End If
                'R3_EXP_OEPO_PN
                R3_PN.SelectedValue = myReader2.GetValue(15).ToString
                'R4_EXP_COBROS_FE
                R4_FE.Text = If(IsDate(myReader2.GetValue(16).ToString), Convert.ToDateTime(myReader2.GetValue(16).ToString()).ToShortDateString, "")
                'R4_EXP_COBROS_ME
                R4_ME.Text = myReader2.GetValue(17).ToString
                'R4_EXP_COBROS_FILEE
                ' = myReader2.GetValue(18).ToString
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(18).ToString)) Then
                    R4_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(18).ToString
                    R4_DOCE.Visible = True
                End If
                'R4_EXP_COBROS_FR
                R4_FR.Text = If(IsDate(myReader2.GetValue(19).ToString), Convert.ToDateTime(myReader2.GetValue(19).ToString()).ToShortDateString, "")
                'R4_EXP_COBROS_MR
                R4_MR.Text = myReader2.GetValue(20).ToString
                'R4_EXP_COBROS_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(21).ToString)) Then
                    R4_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(21).ToString
                    R4_DOCR.Visible = True
                End If
                'R4_EXP_COBROS_PN
                R4_PN.SelectedValue = myReader2.GetValue(22).ToString
                'R5_EXP_CONVENIO_FE
                R5_FE.Text = If(IsDate(myReader2.GetValue(23).ToString), Convert.ToDateTime(myReader2.GetValue(23).ToString()).ToShortDateString, "")
                'R5_EXP_CONVENIO_ME
                R5_ME.Text = myReader2.GetValue(24).ToString
                'R5_EXP_CONVENIO_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(25).ToString)) Then
                    R5_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(25).ToString
                    R5_DOCE.Visible = True
                End If
                'R5_EXP_CONVENIO_FR
                R5_FR.Text = If(IsDate(myReader2.GetValue(26).ToString), Convert.ToDateTime(myReader2.GetValue(26).ToString()).ToShortDateString, "")
                'R5_EXP_CONVENIO_MR
                R5_MR.Text = myReader2.GetValue(27).ToString
                'R5_EXP_CONVENIO_PN
                R5_PN.SelectedValue = myReader2.GetValue(28).ToString
                'R5_EXP_CONVENIO_FILER
                ' = myReader2.GetValue(29).ToString
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(29).ToString)) Then
                    R5_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(29).ToString
                    R5_DOCR.Visible = True
                End If
                'R6_CAT_NAC_PAT_FILE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(30).ToString)) Then
                    R6_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(30).ToString
                    R6_DOCR.Visible = True
                End If
                'R6_CAT_NAC_PAT_PN
                R6_PN.SelectedValue = myReader2.GetValue(31).ToString
                'R7_EXP_AFIL_VIGEN_FE
                R7_FE.Text = If(IsDate(myReader2.GetValue(32).ToString), Convert.ToDateTime(myReader2.GetValue(32).ToString()).ToShortDateString, "")
                'R7_EXP_AFIL_VIGEN_ME
                R7_ME.Text = myReader2.GetValue(33).ToString
                'R7_EXP_AFIL_VIGEN_FILEE
                ' = myReader2.GetValue(34).ToString
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(34).ToString)) Then
                    R7_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(34).ToString
                    R7_DOCE.Visible = True
                End If
                'R7_EXP_AFIL_VIGEN_FR
                R7_FR.Text = If(IsDate(myReader2.GetValue(35).ToString), Convert.ToDateTime(myReader2.GetValue(35).ToString()).ToShortDateString, "")
                'R7_EXP_AFIL_VIGEN_MR
                R7_MR.Text = myReader2.GetValue(36).ToString
                'R7_EXP_AFIL_VIGEN_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(37).ToString)) Then
                    R7_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(37).ToString
                    R7_DOCR.Visible = True
                End If
                'R7_EXP_AFIL_VIGEN_PN
                R7_PN.SelectedValue = myReader2.GetValue(38).ToString
                'R8_EXP_AUDIT_FE
                R8_FE.Text = If(IsDate(myReader2.GetValue(39).ToString), Convert.ToDateTime(myReader2.GetValue(39).ToString()).ToShortDateString, "")
                'R8_EXP_AUDIT_ME
                R8_ME.Text = myReader2.GetValue(40).ToString
                'R8_EXP_AUDIT_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(41).ToString)) Then
                    R8_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(41).ToString
                    R8_DOCE.Visible = True
                End If
                'R8_EXP_AUDIT_FR
                R8_FR.Text = If(IsDate(myReader2.GetValue(42).ToString), Convert.ToDateTime(myReader2.GetValue(42).ToString()).ToShortDateString, "")
                'R8_EXP_AUDIT_MR
                R8_MR.Text = myReader2.GetValue(43).ToString
                'R8_EXP_AUDIT_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(44).ToString)) Then
                    R8_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(44).ToString
                    R8_DOCR.Visible = True
                End If
                'R8_EXP_AUDIT_PN
                R8_PN.SelectedValue = myReader2.GetValue(45).ToString
                'R9_INF_JEF_SERV_JURD_FE
                R9_FE.Text = If(IsDate(myReader2.GetValue(46).ToString), Convert.ToDateTime(myReader2.GetValue(46).ToString()).ToShortDateString, "")
                'R9_INF_JEF_SERV_JURD_ME
                R9_ME.Text = myReader2.GetValue(47).ToString
                'R9_INF_JEF_SERV_JURD_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(48).ToString)) Then
                    R9_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(48).ToString
                    R9_DOCE.Visible = True
                End If
                'R9_INF_JEF_SERV_JURD_FR
                R9_FR.Text = If(IsDate(myReader2.GetValue(49).ToString), Convert.ToDateTime(myReader2.GetValue(49).ToString()).ToShortDateString, "")
                'R9_INF_JEF_SERV_JURD_MR
                R9_MR.Text = myReader2.GetValue(50).ToString
                'R9_INF_JEF_SERV_JURD_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(51).ToString)) Then
                    R9_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(51).ToString
                    R9_DOCR.Visible = True
                End If
                'R9_INF_JEF_SERV_JURD_PN
                R9_PN.SelectedValue = myReader2.GetValue(52).ToString
                'R10_DIRECTORIO_TEL_PN
                R10_PN.SelectedValue = myReader2.GetValue(53).ToString
                'R11_SAT_FE
                R11_FE.Text = If(IsDate(myReader2.GetValue(54).ToString), Convert.ToDateTime(myReader2.GetValue(54).ToString()).ToShortDateString, "")
                'R11_SAT_ME
                R11_ME.Text = myReader2.GetValue(55).ToString
                'R11_SAT_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(56).ToString)) Then
                    R11_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(56).ToString
                    R11_DOCE.Visible = True
                End If
                'R11_SAT_FR
                R11_FR.Text = If(IsDate(myReader2.GetValue(57).ToString), Convert.ToDateTime(myReader2.GetValue(57).ToString()).ToShortDateString, "")
                'R11_SAT_MR
                R11_MR.Text = myReader2.GetValue(58).ToString
                'R11_SAT_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(59).ToString)) Then
                    R11_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(59).ToString
                    R11_DOCR.Visible = True
                End If
                'R11_SAT_PN
                R11_PN.SelectedValue = myReader2.GetValue(60).ToString
                'R12_COMPRANET_FILE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(61).ToString)) Then
                    R12_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(61).ToString
                    R12_DOCR.Visible = True
                End If
                'R12_COMPRANET_PN
                R12_PN.SelectedValue = myReader2.GetValue(62).ToString
                'R13_SIEM_FILE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(63).ToString)) Then
                    R13_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(63).ToString
                    R13_DOCR.Visible = True
                End If
                'R13_SIEM_PN
                R13_PN.SelectedValue = myReader2.GetValue(64).ToString
                'R14_ENTREVISTA_A_TRES_TRAB_AREA
                R14_AREA.SelectedValue = myReader2.GetValue(65).ToString
                'R14_ENTREVISTA_A_TRES_TRAB_FR
                R14_FR.Text = If(IsDate(myReader2.GetValue(66).ToString), Convert.ToDateTime(myReader2.GetValue(66).ToString()).ToShortDateString, "")
                'R14_ENTREVISTA_A_TRES_TRAB_FILE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(67).ToString)) Then
                    R14_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(67).ToString
                    R14_DOCR.Visible = True
                End If
                'R14_ENTREVISTA_A_TRES_TRAB_PN
                R14_PN.SelectedValue = myReader2.GetValue(68).ToString
                'R15_OFIC_REG_PUB_PROP_Y_COMER_FE
                R15_FE.Text = If(IsDate(myReader2.GetValue(69).ToString), Convert.ToDateTime(myReader2.GetValue(69).ToString()).ToShortDateString, "")
                'R15_OFIC_REG_PUB_PROP_Y_COMER_OE
                R15_ME.Text = myReader2.GetValue(70).ToString
                'R15_OFIC_REG_PUB_PROP_Y_COMER_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(71).ToString)) Then
                    R15_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(71).ToString
                    R15_DOCE.Visible = True
                End If
                'R15_OFIC_REG_PUB_PROP_Y_COMER_FR
                R15_FR.Text = If(IsDate(myReader2.GetValue(72).ToString), Convert.ToDateTime(myReader2.GetValue(72).ToString()).ToShortDateString, "")
                'R15_OFIC_REG_PUB_PROP_Y_COMER_OR
                R15_MR.Text = myReader2.GetValue(73).ToString
                'R15_OFIC_REG_PUB_PROP_Y_COMER_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(74).ToString)) Then
                    R15_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(74).ToString
                    R15_DOCR.Visible = True
                End If
                'R15_OFIC_REG_PUB_PROP_Y_COMER_PN
                R15_PN.SelectedValue = myReader2.GetValue(75).ToString
                'R161_OFIC_TESORERIA_Y_FINZS_FE
                R16T_FE.Text = If(IsDate(myReader2.GetValue(76).ToString), Convert.ToDateTime(myReader2.GetValue(76).ToString()).ToShortDateString, "")
                'R161_OFIC_TESORERIA_Y_FINZS_OE
                R16T_ME.Text = myReader2.GetValue(77).ToString
                'R161_OFIC_TESORERIA_Y_FINZS_FILEE
                '= myReader2.GetValue(78).ToString
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(78).ToString)) Then
                    R16T_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(78).ToString
                    R16T_DOCE.Visible = True
                End If
                'R161_OFIC_TESORERIA_Y_FINZS_FR
                R16T_FR.Text = If(IsDate(myReader2.GetValue(79).ToString), Convert.ToDateTime(myReader2.GetValue(79).ToString()).ToShortDateString, "")
                'R161_OFIC_TESORERIA_Y_FINZS_OR
                R16T_MR.Text = myReader2.GetValue(80).ToString
                'R161_OFIC_TESORERIA_Y_FINZS_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(81).ToString)) Then
                    R16T_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(81).ToString
                    R16T_DOCR.Visible = True
                End If
                'R162_OFIC_SECRETARIA_HCDA_EST_FE
                R16E_FE.Text = If(IsDate(myReader2.GetValue(82).ToString), Convert.ToDateTime(myReader2.GetValue(82).ToString()).ToShortDateString, "")
                'R162_OFIC_SECRETARIA_HCDA_EST_OE
                R16E_ME.Text = myReader2.GetValue(83).ToString
                'R162_OFIC_SECRETARIA_HCDA_EST_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(84).ToString)) Then
                    R16E_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(84).ToString
                    R16E_DOCE.Visible = True
                End If
                'R162_OFIC_SECRETARIA_HCDA_EST_FR
                R16E_FR.Text = If(IsDate(myReader2.GetValue(85).ToString), Convert.ToDateTime(myReader2.GetValue(85).ToString()).ToShortDateString, "")
                'R162_OFIC_SECRETARIA_HCDA_EST_OR
                R16E_MR.Text = myReader2.GetValue(86).ToString
                'R162_OFIC_SECRETARIA_HCDA_EST_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(87).ToString)) Then
                    R16E_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(87).ToString
                    R16E_DOCR.Visible = True
                End If
                'R162_OFIC_SECRETARIA_HCDA_MUN_FE
                R16M_FE.Text = If(IsDate(myReader2.GetValue(88).ToString), Convert.ToDateTime(myReader2.GetValue(88).ToString()).ToShortDateString, "")
                'R162_OFIC_SECRETARIA_HCDA_MUN_OE
                R16M_ME.Text = myReader2.GetValue(89).ToString
                'R162_OFIC_SECRETARIA_HCDA_MUN_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(90).ToString)) Then
                    R16M_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(90).ToString
                    R16M_DOCE.Visible = True
                End If
                'R162_OFIC_SECRETARIA_HCDA_MUN_FR
                R16M_FR.Text = If(IsDate(myReader2.GetValue(91).ToString), Convert.ToDateTime(myReader2.GetValue(91).ToString()).ToShortDateString, "")
                'R162_OFIC_SECRETARIA_HCDA_MUN_OR
                R16M_MR.Text = myReader2.GetValue(92).ToString
                'R162_OFIC_SECRETARIA_HCDA_MUN_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(93).ToString)) Then
                    R16M_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(93).ToString
                    R16M_DOCR.Visible = True
                End If
                'R16_OFIC_TESORERIA_SECRETARIA_PN
                R16_PN.SelectedValue = myReader2.GetValue(94).ToString
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_FE
                R17_FE.Text = If(IsDate(myReader2.GetValue(95).ToString), Convert.ToDateTime(myReader2.GetValue(95).ToString()).ToShortDateString, "")
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_OE
                R17_ME.Text = myReader2.GetValue(96).ToString
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_FILEE
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(97).ToString)) Then
                    R17_DOCE.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(97).ToString
                    R17_DOCE.Visible = True
                End If
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_FR
                R17_FR.Text = If(IsDate(myReader2.GetValue(98).ToString), Convert.ToDateTime(myReader2.GetValue(98).ToString()).ToShortDateString, "")
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_OR
                R17_FR.Text = myReader2.GetValue(99).ToString
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(100).ToString)) Then
                    R17_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(100).ToString
                    R17_DOCR.Visible = True
                End If
                'R17_OFIC_A_NOTARIAS_PERS_MORAL_PN
                R17_PN.SelectedValue = myReader2.GetValue(101).ToString
                'R1_CATALOGO_FILER
                ' = myReader2.GetValue(102).ToString
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(102).ToString)) Then
                    R1_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(102).ToString
                    R1_DOCR.Visible = True
                End If
                'R10_DIRECTORIO_TEL_FILER
                ' = myReader2.GetValue(103).ToString
                If File.Exists(Server.MapPath("~\documentos\registros\integracion\" & myReader2.GetValue(103).ToString)) Then
                    R10_DOCR.NavigateUrl = "~\documentos\registros\integracion\" & myReader2.GetValue(103).ToString
                    R10_DOCR.Visible = True
                End If
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        actualizarControlDeRangos()
        actualizarFechCancel()
        cargarDatosAActualizar()
        cargarDatosAActualizarCanResDev()
        GridViewAvance.DataBind()
    End Sub
    Protected Sub actualizarControlDeRangos()
        Try
            Dim fechaAsig As String = "\" & (LFechAsig.Text.Split("/").GetValue(2).ToString & "_" & LFechAsig.Text.Split("/").GetValue(1).ToString & "_" & LFechAsig.Text.Split("/").GetValue(0).ToString)
            If Not Directory.Exists(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig)) Then
                Directory.CreateDirectory(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig))
            End If
            LMsg.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sirecaregistros].[dbo].[registrorangos] "
            myInsertQuery22 += " SET [R_IP_HOST] = '" & Request.UserHostAddress & "' "
            myInsertQuery22 += " ,[R_FEC_SYSTEM] = getdate() "
            myInsertQuery22 += " ,[R_ESTADO_INTEGRACION] = '" & DDLEstadoIntegracion.SelectedValue & "'"
            myInsertQuery22 += " ,[R_REGPAT] = '" & TBRegpat.Text & "'"
            myInsertQuery22 += " ,[R_RAZONSOCIAL] = '" & TBRazon.Text & "'"
            myInsertQuery22 += " ,[R_DOMICILIO_FISCAL] = '" & TBDomicilio.Text & "'"
            myInsertQuery22 += " ,[R_VERIF_DOM_FISCAL_PN] = '" & DDLVeriFiscal.SelectedValue & "'"
            myInsertQuery22 += " ,[R_ACTIVIDAD] = '" & TBActividad.Text & "'"

            myInsertQuery22 += " ,[R1_CATALOGO_PN] = '" & R1_PN.SelectedValue & "' "
            If Not (R1_FILER.FileName.Replace(" ", "").Equals("")) Then
                R1_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R1R_" & R1_FILER.FileName))
                myInsertQuery22 += " ,[R1_CATALOGO_FILER] = '" & TBRegpat.Text & fechaAsig & "\R1R_" & R1_FILER.FileName & "' "
            End If
            If Not (R2_FILER.FileName.Replace(" ", "").Equals("")) Then
                R2_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R2R_" & R2_FILER.FileName))
                myInsertQuery22 += " ,[R2_EXP_PAG_GEN_FILER] = '" & TBRegpat.Text & fechaAsig & "\R2R_" & R2_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R2_EXP_PAG_GEN_PN] = '" & R2_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R3_EXP_OEPO_FE] = " & If(IsDate(R3_FE.Text), "convert(datetime,'" & R3_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R3_EXP_OEPO_ME] = " & If(R3_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R3_ME.Text & "' ")
            If Not (R3_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R3_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R3E_" & R3_FILEE.FileName))
                myInsertQuery22 += " ,[R3_EXP_OEPO_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R3E_" & R3_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R3_EXP_OEPO_FR] = " & If(IsDate(R3_FR.Text), "convert(datetime,'" & R3_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R3_EXP_OEPO_MR] = " & If(R3_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R3_MR.Text & "' ")
            If Not (R3_FILER.FileName.Replace(" ", "").Equals("")) Then
                R3_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R3R_" & R3_FILER.FileName))
                myInsertQuery22 += " ,[R3_EXP_OEPO_FILER] = '" & TBRegpat.Text & fechaAsig & "\R3R_" & R3_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R3_EXP_OEPO_PN] = '" & R3_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R4_EXP_COBROS_FE] = " & If(IsDate(R4_FE.Text), "convert(datetime,'" & R4_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R4_EXP_COBROS_ME] = " & If(R4_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R4_ME.Text & "' ")
            If Not (R4_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R4_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R4E_" & R4_FILEE.FileName))
                myInsertQuery22 += " ,[R4_EXP_COBROS_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R4E_" & R4_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R4_EXP_COBROS_FR] = " & If(IsDate(R4_FR.Text), "convert(datetime,'" & R4_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R4_EXP_COBROS_MR] = " & If(R4_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R4_MR.Text & "' ")
            If Not (R4_FILER.FileName.Replace(" ", "").Equals("")) Then
                R4_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R4R_" & R4_FILER.FileName))
                myInsertQuery22 += " ,[R4_EXP_COBROS_FILER] = '" & TBRegpat.Text & fechaAsig & "\R4R_" & R4_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R4_EXP_COBROS_PN] = '" & R4_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R5_EXP_CONVENIO_FE] = " & If(IsDate(R5_FE.Text), "convert(datetime,'" & R5_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R5_EXP_CONVENIO_ME] = " & If(R5_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R5_ME.Text & "' ")
            If Not (R5_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R5_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R5E_" & R5_FILEE.FileName))
                myInsertQuery22 += " ,[R5_EXP_CONVENIO_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R5E_" & R5_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R5_EXP_CONVENIO_FR] = " & If(IsDate(R5_FR.Text), "convert(datetime,'" & R5_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R5_EXP_CONVENIO_MR] = " & If(R5_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R5_MR.Text & "' ")
            myInsertQuery22 += " ,[R5_EXP_CONVENIO_PN] = '" & R5_PN.SelectedValue & "' "
            If Not (R5_FILER.FileName.Replace(" ", "").Equals("")) Then
                R5_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R5R_" & R5_FILER.FileName))
                myInsertQuery22 += " ,[R5_EXP_CONVENIO_FILER] = '" & TBRegpat.Text & fechaAsig & "\R5R_" & R5_FILER.FileName & "' "
            End If
            If Not (R6_FILER.FileName.Replace(" ", "").Equals("")) Then
                R6_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R6R_" & R6_FILER.FileName))
                myInsertQuery22 += " ,[R6_CAT_NAC_PAT_FILE] = '" & TBRegpat.Text & fechaAsig & "\R6R_" & R6_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R6_CAT_NAC_PAT_PN] = '" & R6_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_FE] = " & If(IsDate(R7_FE.Text), "convert(datetime,'" & R7_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_ME] = " & If(R7_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R7_ME.Text & "' ")
            If Not (R7_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R7_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R7E_" & R7_FILEE.FileName))
                myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R7E_" & R7_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_FR] = " & If(IsDate(R7_FR.Text), "convert(datetime,'" & R7_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_MR] = " & If(R7_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R7_MR.Text & "' ")
            If Not (R7_FILER.FileName.Replace(" ", "").Equals("")) Then
                R7_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R7R_" & R7_FILER.FileName))
                myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_FILER] = '" & TBRegpat.Text & fechaAsig & "\R7R_" & R7_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R7_EXP_AFIL_VIGEN_PN] = '" & R7_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R8_EXP_AUDIT_FE] = " & If(IsDate(R8_FE.Text), "convert(datetime,'" & R8_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R8_EXP_AUDIT_ME] = " & If(R8_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R8_ME.Text & "' ")
            If Not (R8_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R8_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R8E_" & R8_FILEE.FileName))
                myInsertQuery22 += " ,[R8_EXP_AUDIT_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R8E_" & R8_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R8_EXP_AUDIT_FR] = " & If(IsDate(R8_FR.Text), "convert(datetime,'" & R8_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R8_EXP_AUDIT_MR] = " & If(R8_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R8_MR.Text & "' ")
            If Not (R8_FILER.FileName.Replace(" ", "").Equals("")) Then
                R8_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R8R_" & R8_FILER.FileName))
                myInsertQuery22 += " ,[R8_EXP_AUDIT_FILER] = '" & TBRegpat.Text & fechaAsig & "\R8R_" & R8_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R8_EXP_AUDIT_PN] = '" & R8_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_FE] = " & If(IsDate(R9_FE.Text), "convert(datetime,'" & R9_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_ME] = " & If(R9_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R9_ME.Text & "' ")
            If Not (R9_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R9_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R9E_" & R9_FILEE.FileName))
                myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R9E_" & R9_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_FR] = " & If(IsDate(R9_FR.Text), "convert(datetime,'" & R9_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_MR] = " & If(R9_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R9_MR.Text & "' ")
            If Not (R9_FILER.FileName.Replace(" ", "").Equals("")) Then
                R9_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R9R_" & R9_FILER.FileName))
                myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_FILER] = '" & TBRegpat.Text & fechaAsig & "\R9R_" & R9_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R9_INF_JEF_SERV_JURD_PN] = '" & R9_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R10_DIRECTORIO_TEL_PN] = '" & R10_PN.SelectedValue & "' "
            If Not (R10_FILER.FileName.Replace(" ", "").Equals("")) Then
                R10_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R10R_" & R10_FILER.FileName))
                myInsertQuery22 += " ,[R10_DIRECTORIO_TEL_FILER] = '" & TBRegpat.Text & fechaAsig & "\R10R_" & R10_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R11_SAT_FE] = " & If(IsDate(R11_FE.Text), "convert(datetime,'" & R11_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R11_SAT_ME] = " & If(R11_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R11_ME.Text & "' ")
            If Not (R11_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R11_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R11E_" & R11_FILEE.FileName))
                myInsertQuery22 += " ,[R11_SAT_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R11E_" & R11_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R11_SAT_FR] = " & If(IsDate(R11_FR.Text), "convert(datetime,'" & R11_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R11_SAT_MR] = " & If(R11_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R11_MR.Text & "' ")
            If Not (R11_FILER.FileName.Replace(" ", "").Equals("")) Then
                R11_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R11R_" & R11_FILER.FileName))
                myInsertQuery22 += " ,[R11_SAT_FILER] = '" & TBRegpat.Text & fechaAsig & "\R11R_" & R11_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R11_SAT_PN] = '" & R11_PN.SelectedValue & "' "
            If Not (R12_FILER.FileName.Replace(" ", "").Equals("")) Then
                R12_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R12R_" & R12_FILER.FileName))
                myInsertQuery22 += " ,[R12_COMPRANET_FILE] = '" & TBRegpat.Text & fechaAsig & "\R12R_" & R12_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R12_COMPRANET_PN] = '" & R12_PN.SelectedValue & "' "
            If Not (R13_FILER.FileName.Replace(" ", "").Equals("")) Then
                R13_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R13R_" & R13_FILER.FileName))
                myInsertQuery22 += " ,[R13_SIEM_FILE] = '" & TBRegpat.Text & fechaAsig & "\R13R_" & R13_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R13_SIEM_PN] = '" & R13_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R14_ENTREVISTA_A_TRES_TRAB_AREA] = '" & R14_AREA.SelectedValue & "' "
            myInsertQuery22 += " ,[R14_ENTREVISTA_A_TRES_TRAB_FR] = " & If(IsDate(R14_FR.Text), "convert(datetime,'" & R14_FR.Text & "',103)", "NULL")
            If Not (R14_FILER.FileName.Replace(" ", "").Equals("")) Then
                R14_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R14R_" & R14_FILER.FileName))
                myInsertQuery22 += " ,[R14_ENTREVISTA_A_TRES_TRAB_FILE] = '" & TBRegpat.Text & fechaAsig & "\R14R_" & R14_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R14_ENTREVISTA_A_TRES_TRAB_PN] = '" & R14_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FE] = " & If(IsDate(R15_FE.Text), "convert(datetime,'" & R15_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_OE] = " & If(R15_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R15_ME.Text & "' ")
            If Not (R15_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R15_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R15E_" & R15_FILEE.FileName))
                myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R15E_" & R15_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FR] = " & If(IsDate(R15_FR.Text), "convert(datetime,'" & R15_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_OR] = " & If(R15_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R15_MR.Text & "' ")
            If Not (R15_FILER.FileName.Replace(" ", "").Equals("")) Then
                R15_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R15R_" & R15_FILER.FileName))
                myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_FILER] = '" & TBRegpat.Text & fechaAsig & "\R15R_" & R15_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R15_OFIC_REG_PUB_PROP_Y_COMER_PN] = '" & R15_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R161_OFIC_TESORERIA_Y_FINZS_FE] = " & If(IsDate(R16T_FE.Text), "convert(datetime,'" & R16T_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R161_OFIC_TESORERIA_Y_FINZS_OE] = " & If(R16T_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R16T_ME.Text & "' ")
            If Not (R16T_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R16T_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R16ET_" & R16T_FILEE.FileName))
                myInsertQuery22 += " ,[R161_OFIC_TESORERIA_Y_FINZS_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R16ET_" & R16T_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R161_OFIC_TESORERIA_Y_FINZS_FR] = " & If(IsDate(R16T_FR.Text), "convert(datetime,'" & R16T_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R161_OFIC_TESORERIA_Y_FINZS_OR] = " & If(R16T_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R16T_MR.Text & "' ")
            If Not (R16T_FILER.FileName.Replace(" ", "").Equals("")) Then
                R16T_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R16RT_" & R16T_FILER.FileName))
                myInsertQuery22 += " ,[R161_OFIC_TESORERIA_Y_FINZS_FILER] = '" & TBRegpat.Text & fechaAsig & "\R16RT_" & R16T_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_EST_FE] = " & If(IsDate(R16E_FE.Text), "convert(datetime,'" & R16E_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_EST_OE] = " & If(R16E_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R16E_ME.Text & "' ")
            If Not (R16E_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R16E_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R16EE_" & R16E_FILEE.FileName))
                myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_EST_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R16EE_" & R16E_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_EST_FR] = " & If(IsDate(R16E_FR.Text), "convert(datetime,'" & R16E_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_EST_OR] = " & If(R16E_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R16E_MR.Text & "' ")
            If Not (R16E_FILER.FileName.Replace(" ", "").Equals("")) Then
                R16E_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R16RE_" & R16E_FILER.FileName))
                myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_EST_FILER] = '" & TBRegpat.Text & fechaAsig & "\R16RE_" & R16E_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FE] = " & If(IsDate(R16M_FE.Text), "convert(datetime,'" & R16M_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_MUN_OE] = " & If(R16M_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R16M_ME.Text & "' ")
            If Not (R16M_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R16M_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R16EM_" & R16M_FILEE.FileName))
                myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R16EM_" & R16M_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FR] = " & If(IsDate(R16M_FR.Text), "convert(datetime,'" & R16M_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_MUN_OR] = " & If(R16M_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R16M_MR.Text & "' ")
            If Not (R16M_FILER.FileName.Replace(" ", "").Equals("")) Then
                R16M_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R16RM_" & R16M_FILER.FileName))
                myInsertQuery22 += " ,[R162_OFIC_SECRETARIA_HCDA_MUN_FILER] = '" & TBRegpat.Text & fechaAsig & "\R16RM_" & R16M_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R16_OFIC_TESORERIA_SECRETARIA_PN] = '" & R16_PN.SelectedValue & "' "
            myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FE] = " & If(IsDate(R17_FE.Text), "convert(datetime,'" & R17_FE.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_OE] = " & If(R17_ME.Text.Replace(" ", "").Equals(""), "NULL", "'" & R17_ME.Text & "' ")
            If Not (R17_FILEE.FileName.Replace(" ", "").Equals("")) Then
                R17_FILEE.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R17E_" & R17_FILEE.FileName))
                myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILEE] = '" & TBRegpat.Text & fechaAsig & "\R17E_" & R17_FILEE.FileName & "' "
            End If
            myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FR] = " & If(IsDate(R17_FR.Text), "convert(datetime,'" & R17_FR.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_OR] = " & If(R17_MR.Text.Replace(" ", "").Equals(""), "NULL", "'" & R17_MR.Text & "' ")
            If Not (R17_FILER.FileName.Replace(" ", "").Equals("")) Then
                R17_FILER.SaveAs(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text & fechaAsig & "\R17R_" & R17_FILER.FileName))
                myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER] = '" & TBRegpat.Text & fechaAsig & "\R17R_" & R17_FILER.FileName & "' "
            End If
            myInsertQuery22 += " ,[R17_OFIC_A_NOTARIAS_PERS_MORAL_PN] = '" & R17_PN.SelectedValue & "' "

            myInsertQuery22 += " WHERE [ID_ND]= " & Request.QueryString("id_nd").ToString
            cmd22.CommandText = myInsertQuery22
            con22.Open()

            If cmd22.ExecuteNonQuery() = 0 Then
                LMsg.Text = "Problemas al Actualizar"
            Else
                LMsg.Text = "Actualizado"
            End If
            con22.Close()
        Catch ex As Exception
            LMsg.Text = "Problemas al Actualizar" & ex.StackTrace
        End Try
    End Sub

    Protected Sub actualizarFechCancel()
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " UPDATE [sirecaregistros].[dbo].[controlrangos] "
            myInsertQuery22 += " SET [C_FEC_DEV_EXP] = " & If(IsDate(TBFechDecvExp.Text), "convert(datetime,'" & TBFechDecvExp.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[C_FEC_CANCELACION] = " & If(IsDate(TBFechEstado.Text), "convert(datetime,'" & TBFechEstado.Text & "',103)", "NULL")
            myInsertQuery22 += " ,[C_OBSEVACION] = '" & TBObservaciones.Text & "' "
            myInsertQuery22 += " WHERE [ID_ND]= " & Request.QueryString("id_nd").ToString
            cmd22.CommandText = myInsertQuery22
            con22.Open()

            If Not Directory.Exists(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text)) Then
                Directory.CreateDirectory(Server.MapPath("~\documentos\registros\integracion\" & TBRegpat.Text))
            End If
            If cmd22.ExecuteNonQuery() = 0 Then
                LMsg.Text = "Problemas al Actualizar"
            Else
                LMsg.Text = "Actualizado"
            End If
            con22.Close()
        Catch ex As Exception
            LMsg.Text = "Problemas al Actualizar" & ex.StackTrace
        End Try
    End Sub
End Class
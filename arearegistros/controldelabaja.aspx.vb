Imports System.Data.OleDb

Public Class controldelabaja
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAsubdel") Is Nothing Then
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub GridViewCaptura_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCaptura.RowDataBound
        If e.Row.DataItemIndex >= 0 Then
            'MsgBox(e.Row.DataItem(2).ToString)
            'CType(e.Row.FindControl("VDDLAreaSolitoBaja"), DropDownList).SelectedValue = e.Row.DataItem(2).ToString
            'CType(e.Row.FindControl("VDDLDocSolicito"), DropDownList).SelectedValue = e.Row.DataItem(3).ToString
            'CType(e.Row.FindControl("VDDLMes"), DropDownList).SelectedValue = e.Row.DataItem(9).ToString
            'CType(e.Row.FindControl("VDDLTD"), DropDownList).SelectedValue = e.Row.DataItem(11).ToString
            'CType(e.Row.FindControl("VDDLEstatusResta"), DropDownList).SelectedValue = e.Row.DataItem(17).ToString
            'CType(e.Row.FindControl("VDDLLocSinRelObrePat"), DropDownList).SelectedValue = e.Row.DataItem(18).ToString
        End If
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs)
        updateDatos()
    End Sub
    Protected Sub updateDatos()
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " UPDATE [sirecaregistros].[dbo].[CB_PROYECTO] "
        myInsertQuery22 += " SET [PR_REGPAT] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRegPat"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRegPat"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_STATUS] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEstatus"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEstatus"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLSinRelObrPat"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLSinRelObrPat"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_RFC] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRfc"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRfc"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RAZON_SOCIAL] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRazonSocial"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRazonSocial"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_DOMICILIO_FISCAL_IMSS] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBDomFisImss"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBDomFisImss"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_SOLICITUD_SAT_EXCEL] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBSolSatExcel"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBSolSatExcel"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_DOMICILIO_SAT_EXCEL] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBDomSatExcel"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBDomSatExcel"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_SOLICITUD_SAT_OFICIO] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBSolSatOfi"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBSolSatOfi"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_DOMICILIO_SAT_OFICIO] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBDomSatOfi"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBDomSatOfi"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_ACTIVIDAD] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_ACT"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_ACT"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_ACTA_CIRCUNST] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBActaCircuns_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBActaCircuns_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECHA_RECEP_IMPED_COBRO] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRecepImpCobr_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRecepImpCobr_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECHA_LIMITE] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBLimite_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBLimite_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECHA_AFIL_ALTA] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBAfilAlta_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBAfilAlta_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECHA_INF_REL_LAB_INEX] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBInfRelLab_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBInfRelLab_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECHA_MEMO_BAJA] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBMemoBaja_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBMemoBaja_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_NUMERO_MEMO_BAJA] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBNumMemoBaja"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBNumMemoBaja"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_BAJA] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBBaja_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBBaja_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_ID_USER_ENCAR_CRED_CON_IMPED_COBRO] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEncCredImpCobro"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEncCredImpCobro"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_ID_USER_ENCAR_OFICINA_REGISTROS] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEncOfiRegistros"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEncOfiRegistros"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_ID_USER_JEFE_DEPTO_AFILIACION] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEncDepAfil"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLEncDepAfil"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_ID_USER_TITULAR_SUBDELEGACION] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLTitSubdel"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLTitSubdel"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_COTIZANTES] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBNumTrabajadores"), TextBox).Text.Replace(" ", "").Equals(""), "0", "" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBNumTrabajadores"), TextBox).Text.Replace(" ", "") + "")
        myInsertQuery22 += " ,[PR_PROCEDENCIA_ND_ORIGEN_A_LA_BAJA] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLProcNdOriBaja"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLProcNdOriBaja"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_REFERENCIA] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRefMemoCed"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRefMemoCed"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_REFERENCIA] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRefMemoCed_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRefMemoCed_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_ID_USER_NOMBRE_NL_VERIFICA_FISCAL] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("SqlDataSourceNLVerificaFiscal"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("SqlDataSourceNLVerificaFiscal"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_ENT_DEV_NL] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBEntDevNl_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBEntDevNl_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_RESULT_VERIFI_DOM_FISCAL] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLResVerDomFis"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLResVerDomFis"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_ID_USER_LOCALIZADOR] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLLocalizador"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLLocalizador"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_ENTREGA_DEV_LOCALIZADOR] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBEntDevLocalizador_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBEntDevLocalizador_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_NOMBRE_NL_QUE_VERIFICA_SAT] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLNlVerSat"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLNlVerSat"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_ENT_DEV_NL_QUE_VERIFICA_SAT] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBEntDevNlSat_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBEntDevNlSat_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_ELABORO] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLElaboro"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLElaboro"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_REF_MEMO_AFILIACION_ENVIA_AFIL_BAJA] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRefMeAfilEnvAfilBaja"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRefMeAfilEnvAfilBaja"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_RECEPCION_MEMO_AFILIACION] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRecMeAfil_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBRecMeAfil_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_RANGO] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLRango"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLRango"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_IMPORTE_COP] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBImpCoP"), TextBox).Text.Replace(" ", "").Equals(""), "0", "" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBImpCoP"), TextBox).Text.Replace(" ", "") + "")
        myInsertQuery22 += " ,[PR_IMPORTE_RCV] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBImpRcv"), TextBox).Text.Replace(" ", "").Equals(""), "0", "" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBImpRcv"), TextBox).Text.Replace(" ", "") + "")
        myInsertQuery22 += " ,[PR_SOLIC_AFILIACION_PARA_INVEST_INTERNA] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBSolAfilInvInterna"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBSolAfilInvInterna"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_CORREO_SOLICITUD] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBCorreoSoli_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBCorreoSoli_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECHA_MEMO_AFILIACION_PARA_INTERNA] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBMeAfilInterna_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBMeAfilInterna_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_CONSULTA_CATALOGO_CONTROL_RESULTADOS] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLConsultCatContResult"), DropDownList).SelectedValue.Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("DDLConsultCatContResult"), DropDownList).SelectedValue + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_CONSULTA_CATALOGO_CONTROL_RESULTADOS] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBConsultCatContResult_F"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("TBConsultCatContResult_F"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_CONSULTA_OEPO] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_CONSULT_OEPO"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_CONSULT_OEPO"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_CONSULTA_OEPO] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_CONSULT_OEPO"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_CONSULT_OEPO"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_CONSULTA_COBROS] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_CONSUL_COBROS"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_CONSUL_COBROS"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_CONSULTA_COBROS] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_CONSULT_COBROS"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_CONSULT_COBROS"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_CONSULTA_CONVENIOS] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_CONSULT_CONVE"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_CONSULT_CONVE"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_CONSULTA_CONVENIOS] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_CONSULT_CONVE"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_CONSULT_CONVE"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_MEMO_JURIDICO_SOLICITUD_INFORMACION] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_MEMO_JURI_SOLI_INFOR"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_MEMO_JURI_SOLI_INFOR"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_MEMO_JURIDICO_SOLICITUD_INFORMACION] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_MEMO_JURI_SOLI_INFOR"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_MEMO_JURI_SOLI_INFOR"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_MEMO_AUD_PATRONES_SOLICITUD_INFORMACION] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_MEMO_AUD_PAT_SOLI_INFOR"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_MEMO_AUD_PAT_SOLI_INFOR"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECHA_MEMO_AUD_PATRONES_SOLICITUD_INFORMACION] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_MEMO_AUD_PAT_SOLI_INFOR"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_MEMO_AUD_PAT_SOLI_INFOR"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_ND_ANTERIOR] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_ND_ANTERIOR"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_ND_ANTERIOR"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_POSIBLE_SUST_PAT] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_POSI_SUST_PAT"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_POSI_SUST_PAT"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_FECH_ENVIO_AL_DEPTO_AUD_PAT] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_ENV_DEP_AUD_PAT"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_ENV_DEP_AUD_PAT"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_FECH_RECEP_RESP_A_P] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_RECEP_RESP_A_P"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_FECH_RECEP_RESP_A_P"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_REF_FECHA_RESP_A_P] = convert(datetime," + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_REF_FECH_RESP_A_P"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_REF_FECH_RESP_A_P"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " ,[PR_OBSER_AUD_A_PAT] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_OBSER_AUD_A_PAT"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_OBSER_AUD_A_PAT"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_1] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM1"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_1] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT1"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_SAT_2] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM_SAT2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM_SAT2"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_NL_2] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_NL2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_NL2"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_2] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT2"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_3] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM3"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_3] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT3"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_4] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("VERI_DOM4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("VERI_DOM4"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_4] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT4"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_5] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM5"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_5] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESILT5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESILT5"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_6] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM6"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_6] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT6"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_7] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERIF_DOM7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERIF_DOM7"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_7] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT7"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_8] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERIF_DOM8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERIF_DOM8"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_8] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT8"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_9] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("VERI_DOM9"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("VERI_DOM9"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_9] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT9"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT9"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_VERIFICACION_DE_DOM_10] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM10"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_VERI_DOM10"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += " ,[PR_RESULTADO_10] = " + IIf(CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT10"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("V_RESULT10"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "  WHERE [PR_ID]= " + CType(GridViewCaptura.Rows(0).Cells(0).FindControl("HFID"), HiddenField).Value

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            CType(GridViewCaptura.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Actualizado"
        Else
            CType(GridViewCaptura.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub
    Protected Sub LBAddCaso_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBAddCaso.Click

    End Sub
End Class
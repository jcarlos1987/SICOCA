Imports System.Data.OleDb

Public Class _default49
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim salarioBase As String = ConfigurationSettings.AppSettings("salarioMinimo")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
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

    Protected Sub GridViewUpG_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewUpG.RowDataBound
        If e.Row.DataItemIndex >= 0 Then
            'MsgBox(e.Row.DataItem(2).ToString)
            CType(e.Row.FindControl("VDDLRango"), DropDownList).SelectedValue = e.Row.DataItem(2).ToString
            CType(e.Row.FindControl("VDDLAreaSolitoBaja"), DropDownList).SelectedValue = e.Row.DataItem(7).ToString
            CType(e.Row.FindControl("VDDLDocSolicito"), DropDownList).SelectedValue = e.Row.DataItem(8).ToString
        End If
    End Sub

    Protected Sub LBActInvesInterna_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " UPDATE [sirecaregistros].[dbo].[NL_InvestInterna] "
        myInsertQuery22 += "    SET  "
        myInsertQuery22 += "       [II_FolioCatalogoContResultDeptoCobranza] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio1"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_FSCatalogoContResultDeptoCobranza] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS1"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FRCatalogoContResultDeptoCobranza] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR1"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FolioOfnaEPO] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio2"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_SOfnaEPO] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS2"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_ROfnaEPO] =  convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR2"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FolioOfnaCobros] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio3"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_SOfnaCobros] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS3"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_ROfnaCobros] =  convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR3"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FolioExpeConveyGarantia] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio4"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_SExpeConveyGarantia] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS4"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_RExpeConveyGarantia] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR4"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_SINDO] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS5"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FolioDeptoAfiliacion] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio6"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_SDeptoAfiliacion] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS6"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_RDeptoAfiliacion] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR6"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FolioDeptoAuditoria] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio7"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_SDeptoAuditoria] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS7"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_RDeptoAuditoria] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR7"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_FolioServiciosJuridicos] = " + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFolio8"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[II_SServiciosJuridicos] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS8"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_RServiciosJuridicos] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFR8"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_SeccBca] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS9"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS9"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_SeccAma] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS10"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS10"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_SIEM] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS11"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS11"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[II_COMPRA_NET] = convert(datetime," + IIf(CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS12"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("VTBFS12"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "  WHERE [II_G_ID]= " + CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("HFIDII"), HiddenField).Value

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Actualizado"
        Else
            CType(GridViewUpInvInterna.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub

    Protected Sub LBActInvesExterna_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " UPDATE [sirecaregistros].[dbo].[NL_InvestExterna] "
        myInsertQuery22 += "    SET [IE_SAT_DF_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio1"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_SAT_DF_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS1"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_SAT_DF_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR1"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_SAT_Foraneo_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio2"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_SAT_Foraneo_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS2"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_SAT_Foraneo_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR2"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_III_Tesoreria_DF_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio3"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_III_Tesoreria_DF_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS3"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_III_Tesoreria_DF_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR3"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_III_Tesoreria_Foraneo_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio4"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_III_Tesoreria_Foraneo_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS4"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_III_Tesoreria_Foraneo_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR4"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_PATRON_FM_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio5"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_PATRON_FM_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS5"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_PATRON_FM_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR5"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_PATRON_FR_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio6"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_PATRON_FR_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS6"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_PATRON_FR_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR6"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR6"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_SOCIO_FR_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio7"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_SOCIO_FR_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS7"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_DF_SOCIO_FR_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR7"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR7"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_PATRON_FM_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio8"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_PATRON_FM_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS8"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_PATRON_FM_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR8"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR8"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_PATRON_FR_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio9"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio9"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_PATRON_FR_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS9"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS9"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_PATRON_FR_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR9"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR9"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio10"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio10"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_SOCIO_FR_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS10"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS10"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_IV_RPPC_Foraneo_SOCIO_FR_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR10"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR10"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_V_ArchivoGralNotarias_Folio] = " + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio11"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFolio11"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IE_V_ArchivoGralNotarias_S] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS11"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFS11"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IE_V_ArchivoGralNotarias_R] = convert(datetime," + IIf(CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR11"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("VTBFR11"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "  WHERE [IE_G_ID]= " + CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("HFIDIE"), HiddenField).Value

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Actualizado"
        Else
            CType(GridViewInvetExterna.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub

    Protected Sub LBActInvesCampo_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " UPDATE [sirecaregistros].[dbo].[NL_InvestCampo] "
        myInsertQuery22 += "    SET "
        myInsertQuery22 += "       [IC_FolioVisitaDomFiscal] = " + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio1"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IC_SVisitaDomFiscal] = convert(datetime," + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS1"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS1"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IC_FolioVisitaSocios] = " + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio2"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IC_SVisitaSocios] = convert(datetime," + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS2"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS2"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IC_FolioEntrevista3Vecinos] = " + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio3"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IC_SEntrevista3Vecinos] = convert(datetime," + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS3"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS3"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IC_FolioEntrevista3Trabajadores] = " + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio4"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IC_SEntrevista3Trabajadores] = convert(datetime," + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS4"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS4"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IC_FolioVisitasForaneas] = " + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFolio5"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[IC_SVisitasForaneas] = convert(datetime," + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFS5"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[IC_RVisitasForaneas] = convert(datetime," + IIf(CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFR5"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("VTBFR5"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "  WHERE [IC_G_ID]= " + CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("HFIDIC"), HiddenField).Value

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Actualizado"
        Else
            CType(GridViewInvesCampo.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub

    Protected Sub LBActInfoGeneral_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " UPDATE [sirecaregistros].[dbo].[NL_General] "
        myInsertQuery22 += "    SET "
        myInsertQuery22 += "       [G_Rango] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLRango"), DropDownList).SelectedValue.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLRango"), DropDownList).SelectedValue.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[G_Estatus] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("DDLEstatus"), DropDownList).SelectedValue.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("DDLEstatus"), DropDownList).SelectedValue.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[G_RazonSocial] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBRazon"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBRazon"), TextBox).Text.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[G_ImporteCOP] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBImpCop"), TextBox).Text.Replace(",", "").Replace(" ", "").Equals(""), "0", CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBImpCop"), TextBox).Text.Replace(",", "").Replace(" ", ""))
        myInsertQuery22 += "       ,[G_ImporteRCV] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBImpRcv"), TextBox).Text.Replace(",", "").Replace(" ", "").Equals(""), "0", CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBImpRcv"), TextBox).Text.Replace(",", "").Replace(" ", ""))
        myInsertQuery22 += "       ,[G_FechaBaja] = convert(datetime," + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBFechBaja"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("VTBFechBaja"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += "       ,[G_AreaSolicitaLaBaja] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLAreaSolitoBaja"), DropDownList).SelectedValue.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLAreaSolitoBaja"), DropDownList).SelectedValue.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[G_DocInformaEsPatronNL] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLDocSolicito"), DropDownList).SelectedValue.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLDocSolicito"), DropDownList).SelectedValue.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[G_ID_Integrador] = " + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLIntegrador"), DropDownList).SelectedValue.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("VDDLIntegrador"), DropDownList).SelectedValue.Replace(" ", "") + "'") + " "
        myInsertQuery22 += "       ,[G_FechaAsignacion] = convert(datetime," + IIf(CType(GridViewUpG.Rows(0).Cells(0).FindControl("TBFechAsigno"), TextBox).Text.Replace(" ", "").Equals(""), "NULL", "'" + CType(GridViewUpG.Rows(0).Cells(0).FindControl("TBFechAsigno"), TextBox).Text.Replace(" ", "") + "'") + " ,103) "
        myInsertQuery22 += " WHERE [G_ID]= " + CType(GridViewUpG.Rows(0).Cells(0).FindControl("HFIDG"), HiddenField).Value

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            CType(GridViewUpG.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Actualizado"
        Else
            CType(GridViewUpG.Rows(0).Cells(0).FindControl("LmsgInvesInterna"), Label).Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub

    
    Protected Sub LBAddCaso_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBAddCaso.Click
        agrecarCasos()
        agrecarCasosInvestigaciones()
        GridViewg.DataBind()
    End Sub
    Private Sub agrecarCasos()
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        Dim vsalario As String = salarioBase
        Dim vsubdel As String = DDLSubdel.SelectedValue
        Dim vregpat As String = TBBuscar.Text
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " INSERT INTO [sirecaregistros].[dbo].[NL_General] "
        myInsertQuery22 += " SELECT "
        myInsertQuery22 += " '" + vsubdel + "' AS [G_Subdel] "
        myInsertQuery22 += " ,'PENDIENTE' AS [G_Estatus] "
        myInsertQuery22 += " ,(case "
        myInsertQuery22 += " when RCOP.IMPORTE_COP>=(25*" + vsalario + "*365) then 'V' "
        myInsertQuery22 += " when RCOP.IMPORTE_COP>(4*" + vsalario + "*365) and RCOP.IMPORTE_COP<=(25*" + vsalario + "*365) then 'IV' "
        myInsertQuery22 += " when RCOP.IMPORTE_COP>(2*" + vsalario + "*365) and RCOP.IMPORTE_COP<=(4*" + vsalario + "*365) then 'III' "
        myInsertQuery22 += " when RCOP.IMPORTE_COP>(" + vsalario + "*365) and RCOP.IMPORTE_COP<=(2*" + vsalario + "*365) then 'II' "
        myInsertQuery22 += " when RCOP.IMPORTE_COP<=(" + vsalario + "*365) then 'I' "
        myInsertQuery22 += " end) as [G_Rango] "
        myInsertQuery22 += " ,'" + vregpat.ToUpper + "' AS [G_RegPat] "
        myInsertQuery22 += " ,razonSocial AS [G_RazonSocial] "
        myInsertQuery22 += " ,ISNULL(RCOP.IMPORTE_COP,0) AS [G_ImporteCOP] "
        myInsertQuery22 += " ,ISNULL(RRCV.IMPORTE_RCV,0) AS [G_ImporteRCV] "
        myInsertQuery22 += " ,ISNULL(RCOP.FMOV,RRCV.FMOV) AS [G_FechaBaja] "
        myInsertQuery22 += " ,'OEPO' AS [G_AreaSolicitaLaBaja] "
        myInsertQuery22 += " ,'ACCIRCUNS' AS [G_DocInformaEsPatronNL] "
        myInsertQuery22 += " ,NULL AS [G_ID_Integrador] "
        myInsertQuery22 += " ,NULL AS [G_FechaAsignacion] "
        myInsertQuery22 += " ,'" + Request.UserHostAddress + "' AS [G_IP_Regitro] "
        myInsertQuery22 += " ,getdate() AS [G_FechaRegistro] "
        myInsertQuery22 += " ,'" + Session.Item("SIRECAid").ToString + "' AS [G_ID_Registro] "
        myInsertQuery22 += " FROM "
        myInsertQuery22 += " (SELECT [FMOV],SUM([IMPORTE]) AS IMPORTE_COP "
        myInsertQuery22 += " FROM [rale].[dbo].[" + getRale(vsubdel, "COP") + "] "
        myInsertQuery22 += " WHERE replace([REGPATR],'-','')='" + vregpat + "' and inc='09' and mov='2' "
        myInsertQuery22 += " GROUP BY [FMOV] "
        myInsertQuery22 += " ) AS RCOP "
        myInsertQuery22 += " LEFT JOIN  "
        myInsertQuery22 += " (SELECT [FMOV],SUM([IMPORTE]) AS IMPORTE_RCV "
        myInsertQuery22 += " FROM [rale].[dbo].[" + getRale(vsubdel, "RCV") + "] "
        myInsertQuery22 += " WHERE replace([REGPATR],'-','')='" + vregpat + "' "
        myInsertQuery22 += " GROUP BY [FMOV]) AS RRCV ON RRCV.[FMOV]=RCOP.[FMOV] LEFT JOIN (SELECT razonSocial,regpat FROM sireca.dbo.patrones) as ptn on regpat='" + vregpat + "' "
        myInsertQuery22 += " WHERE NOT EXISTS(SELECT G_FechaRegistro "
        myInsertQuery22 += " FROM [sirecaregistros].[dbo].[NL_General] "
        myInsertQuery22 += " WHERE [G_RegPat]='" + vregpat + "' AND G_Subdel='" + vsubdel + "' AND YEAR([G_FechaRegistro])=YEAR(GETDATE())) "
        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then

        End If
        con22.Close()
    End Sub
    Private Function getRale(ByVal vsubdel As String, ByVal vtipoCopRcv As String) As String
        Dim vrale As String = ""
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 name from rale.dbo.tablas where subdel='" + vsubdel + "' and tipo='" + vtipoCopRcv + "' order by fecha desc "
        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Do While myReaderx.Read()
            vrale = myReaderx.GetValue(0).ToString
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return vrale
    End Function

    Private Sub agrecarCasosInvestigaciones()
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22

        Dim myInsertQuery22 As String = " INSERT INTO [sirecaregistros].[dbo].[NL_InvestInterna] "
        myInsertQuery22 += " SELECT [G_ID],NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL "
        myInsertQuery22 += " ,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL "
        myInsertQuery22 += " FROM [sirecaregistros].[dbo].[NL_General] "
        myInsertQuery22 += " where not exists(SELECT [II_G_ID] FROM [sirecaregistros].[dbo].[NL_InvestInterna] where [II_G_ID]=[G_ID]) "

        myInsertQuery22 += " INSERT INTO [sirecaregistros].[dbo].[NL_InvestExterna] "
        myInsertQuery22 += " SELECT [G_ID],NULL,NULL,NULL "
        myInsertQuery22 += " ,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL "
        myInsertQuery22 += " ,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL "
        myInsertQuery22 += " FROM [sirecaregistros].[dbo].[NL_General] "
        myInsertQuery22 += " where not exists(SELECT [IE_G_ID] FROM [sirecaregistros].[dbo].[NL_InvestExterna] where [IE_G_ID]=[G_ID]) "

        myInsertQuery22 += " INSERT INTO [sirecaregistros].[dbo].[NL_InvestCampo] "
        myInsertQuery22 += " SELECT [G_ID],NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL "
        myInsertQuery22 += " FROM [sirecaregistros].[dbo].[NL_General] "
        myInsertQuery22 += " where not exists(SELECT [IC_G_ID] FROM [sirecaregistros].[dbo].[NL_InvestCampo] where [IC_G_ID]=[G_ID]) "
        cmd22.CommandText = myInsertQuery22
        con22.Open()
        cmd22.ExecuteNonQuery()
        con22.Close()
    End Sub

    Protected Sub LBBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBBuscar.Click
        GridViewg.DataBind()
    End Sub

    Protected Sub LBObservacion_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBObservacion.Click
        Try
            If TBObservacion.Text.Replace(",", "").Replace(" ", "").Equals("") Or CType(GridViewObserTemp.Rows(0).Cells(0).FindControl("HFObTemp"), HiddenField).Value.ToString.Equals("0") Then
            Else
                Dim con22 As New OleDbConnection(cadenaconexion)
                Dim cmd22 As New OleDbCommand()
                cmd22.Connection = con22

                Dim myInsertQuery22 As String = " INSERT INTO [sirecaregistros].[dbo].[NL_Observaciones] "
                myInsertQuery22 += " SELECT " + CType(GridViewObserTemp.Rows(0).Cells(0).FindControl("HFObTemp"), HiddenField).Value
                myInsertQuery22 += ",'" + TBObservacion.Text + "'"
                myInsertQuery22 += ",'" + Session.Item("SIRECAid").ToString + "'"
                myInsertQuery22 += ",getdate()"
                myInsertQuery22 += ",'" + Request.UserHostAddress + "'"

                cmd22.CommandText = myInsertQuery22
                con22.Open()
                cmd22.ExecuteNonQuery()
                con22.Close()
                GridViewObservacion.DataBind()
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
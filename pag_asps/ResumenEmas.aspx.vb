Public Class ResumenEmas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString.Equals("00")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
               
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub BActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizar.Click
        Dim vsubdel As String = DDLSubdel.SelectedValue
        Dim vperiodo As String = DDLPeriodo.SelectedValue
        Dim vrale As String = DDLRale.SelectedValue
        Dim vanio As String = "0"
        Dim vmes As String = "0"
        If vperiodo.Length = 5 Then
            vanio = vperiodo.Substring(1, 4)
            vmes = vperiodo.Substring(0, 1)
        Else
            vanio = vperiodo.Substring(2, 4)
            vmes = vperiodo.Substring(0, 2)
        End If
        '----------------------------drop table [sireca].[dbo].[patrones3301]
        Dim consulta As String = " drop table [sireca].[dbo].[patrones33" & vsubdel & "]"
        consulta += " SELECT * INTO [sireca].[dbo].[patrones33" & vsubdel & "]"
        If vmes.Length = 1 Then
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa0" & vmes & "" & vanio & "')"
        Else
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa" & vmes & "" & vanio & "')"
        End If
        consulta += " AS EMA3333"
        SqlDataSourceCrarT.SelectCommand = consulta
        SqlDataSourceCrarT.DataBind()
        GridView4.DataBind()

        '--------------Total de la EMMA
        Dim consultae As String = " SELECT "
        consultae += " count([EMIP_PATRON]) as [PATRONES]"
        consultae += " ,sum([EMIP_NUM_TRAB_COT]) as [COTIZANTES]"
        consultae += " ,sum([EMIP_IMP_EYM_FIJA] + EMIP_IMP_EYM_EXCE + EMIP_IMP_EYM_PRED + EMIP_IMP_EYM_PREE + EMIP_IMP_INV_VIDA + EMIP_IMP_RIES_TRA + EMIP_IMP_GUAR + EMIP_IMP_INV_VIDA_O + EMIP_IMP_EYM_EXCE_O + EMIP_IMP_EYM_PRED_O + EMIP_IMP_EYM_PREE_O)  as [MONTO]"
        consultae += " ,'patrones33" & vsubdel & "' as emmax"
        consultae += " FROM [sireca].[dbo].[patrones33" & vsubdel & "]"
        consultae += " where [EMIP_SUB]='" & vsubdel & "'"
        consultae += " group by [EMIP_SUB]"
        SqlDataSourceResumenEma.SelectCommand = consultae
        SqlDataSourceResumenEma.DataBind()
        GridView1.DataBind()

        '--------------Deven
        Dim consultat As String = " SELECT "
        consultat += " count(rale.REGPATR) as [PATRONES]"
        consultat += " ,sum(emma.EMIP_NUM_TRAB_COT) as [COTIZANTES]"
        consultat += " ,sum(rale.IMPORTE) as [MONTO]"
        consultat += " ,'" & vrale & "' as [rale]"
        consultat += " ,'" & vsubdel & "' as [subdel]"
        consultat += " ,'" & vperiodo & "' as [periodo]"
        consultat += " ,'" & vanio & "' as [anio]"
        consultat += " ,'" & vmes & "' as [mes]"
        consultat += " FROM "
        consultat += "  [sireca].[dbo].[eco] as eco,[rale].[dbo].[" & vrale & "] AS rale inner join [sireca].[dbo].[patrones33" & vsubdel & "] AS emma"
        consultat += " on ("
        consultat += " substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consultat += " ) "
        consultat += " WHERE"
        consultat += " eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'"
        If vrale.IndexOf("COP") = -1 Then
            consultat += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('RCV','RCVCOMP')"
            consultat += " and rale.[TD] in ('06')"
        Else
            consultat += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('COP','COMP')"
            consultat += " and rale.[TD] in ('02')"
        End If
        consultat += " and year(rale.[PERIODO])='" & vanio & "'"
        consultat += " and month(rale.[PERIODO])='" & vmes & "'"
        consultat += " group by rale.[PERIODO]"
        SqlDataSourceDeben.SelectCommand = consultat
        SqlDataSourceDeben.DataBind()
        GridView2.DataBind()

        '--------------Detalles que deven
        Dim consultad As String = "SELECT "
        consultad += " (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]"
        consultad += " ,eco.incidencia as [incidenciakey]"
        consultad += " ,count(*) as [PATRONES]"
        consultad += " ,sum(eco.COTIZ) as [COTIZANTES]"
        consultad += " ,sum(rale.IMPORTE) as [MONTO]"
        consultad += " ,'" & vrale & "' as [rale]"
        consultad += " ,'" & vsubdel & "' as [subdel]"
        consultad += " ,'" & vperiodo & "' as [periodo]"
        consultad += " ,'" & vanio & "' as [anio]"
        consultad += " ,'" & vmes & "' as [mes]"
        consultad += " FROM "
        consultad += " [sireca].[dbo].[eco] as eco, [rale].[dbo].[" & vrale & "] AS rale inner join [sireca].[dbo].[patrones33" & vsubdel & "] AS emma"
        consultad += " on ("
        consultad += " substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consultad += " ) "
        consultad += " WHERE"
        consultad += " eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'"
        If vrale.IndexOf("COP") = -1 Then
            consultad += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('RCV','RCVCOMP')"
            consultad += " and rale.[TD] in ('06')"
        Else
            consultad += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('COP','COMP')"
            consultad += " and rale.[TD] in ('02')"
        End If
        'consultad += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('COP','COMP')"        
        consultad += " and year(rale.[PERIODO])='" & vanio & "'"
        consultad += " and month(rale.[PERIODO])='" & vmes & "'"
        consultad += " group by eco.incidencia"

        SqlDataSourceDetallesDeben.SelectCommand = consultad
        SqlDataSourceDetallesDeben.DataBind()
        GridView3.DataBind()

        '-----------Estan en el rale y en la eco y no en la emma
        consulta = " SELECT count(*) AS [REG_PATRONAL],sum(eco.COTIZ) as [COTIZANTES],sum([OMISION]) AS [MONTO]"
        consulta += " ,'" & vrale & "' as [rale]"
        consulta += " ,'" & vsubdel & "' as [subdel]"
        consulta += " ,'" & vperiodo & "' as [periodo]"
        consulta += " ,'" & vanio & "' as [anio]"
        consulta += " ,'" & vmes & "' as [mes]"
        consulta += " FROM "
        consulta += "  [sireca].[dbo].[eco] as eco,[rale].[dbo].[" & vrale & "] AS rale"
        consulta += " WHERE"
        consulta += " ("
        consulta += " select substring(emma2.[EMIP_PATRON],2,10) "
        consulta += " from [sireca].[dbo].[patrones33" & vsubdel & "] AS emma2 "
        consulta += " where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consulta += " ) is null"
        consulta += " and eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'"
        If vrale.IndexOf("COP") = -1 Then
            consulta += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('RCV','RCVCOMP')"
            consulta += " and rale.[TD] in ('06')"
        Else
            consulta += " and eco.fechaEco='" & vperiodo & "' and tipoEco in ('COP','COMP')"
            consulta += " and rale.[TD] in ('02')"
        End If       
        consulta += " and year(rale.[PERIODO])='" & vanio & "'"
        consulta += " and month(rale.[PERIODO])='" & vmes & "'"
        consulta += " group by rale.[PERIODO]"

        SqlDataSourceEstanEcoRaleEmaNo.SelectCommand = consulta
        SqlDataSourceEstanEcoRaleEmaNo.DataBind()
        GridView5.DataBind()
        '----------------
        Dim total As Double = Convert.ToDouble(GridView1.Rows(0).Cells(2).Text.Replace("$", "").Replace(",", ""))
        Dim totalDeven As Double = Convert.ToDouble(GridView2.Rows(0).Cells(2).Text.Replace("$", "").Replace(",", ""))
        Dim porcentaje As String = ((totalDeven / total) * 100).ToString

        GridView2.Rows(0).Cells(3).Text = (porcentaje.Substring(0, (porcentaje.IndexOf(".") + 3)) & " %")
        'GridView2.Rows(0).Cells(3).FindControl()
        '{0:P1}

        'MsgBox(GridView2.Rows(1).Cells(2))
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        
    End Sub
End Class
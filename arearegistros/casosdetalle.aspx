<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="casosdetalle.aspx.vb" Inherits="WebSIRECA.casosdetalle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DETALLES</title>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewCasosDetalle" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceCasosDetalle" 
            HorizontalAlign="Center" Font-Size="10pt" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                    SortExpression="RANGO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REG.PATRONAL" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE C.O.P." ReadOnly="True" SortExpression="IMPORTE_COP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_BAJA" DataFormatString="{0:d}" 
                    HeaderText="FECHA_BAJA" ReadOnly="True" SortExpression="FECHA_BAJA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" ReadOnly="True" 
                    SortExpression="INTEGRADOR" />
                <asp:BoundField DataField="FECHA_ASIG" DataFormatString="{0:d}" 
                    HeaderText="FECHA ASIG." ReadOnly="True" SortExpression="FECHA_ASIG">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="AVANCE" DataFormatString="{0:P}" HeaderText="AVANCE" 
                    ReadOnly="True" SortExpression="AVANCE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RANGO_AVANCE" HeaderText="RANGO DE AVANCE" 
                    ReadOnly="True" SortExpression="RANGO_AVANCE" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCasosDetalle" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RANGO AS VARCHAR(2)
DECLARE @RANGO_AVANCE AS VARCHAR(20)
SET @SUBDEL=?
SET @RANGO=?
SET @RANGO_AVANCE=?
SELECT 
SUBDEL,RANGO,REGPAT,RAZON,IMPORTE_COP,FECHA_BAJA
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=INTEGRADOR) as INTEGRADOR
,FECHA_ASIG,AVANCE,RANGO_AVANCE FROM (
SELECT 
SUBDEL,RANGO,REGPAT,RAZON,IMPORTE_COP,FECHA_BAJA,INTEGRADOR,FECHA_ASIG
,AVANCE
,(CASE 
WHEN AVANCE&lt;=0.20 THEN 'ENTRE 0 y 20%'
WHEN AVANCE&gt;0.20 AND AVANCE&lt;=0.40 THEN 'ENTRE 21 y 40%'
WHEN AVANCE&gt;0.40 AND AVANCE&lt;=0.60 THEN 'ENTRE 41 y 60%'
WHEN AVANCE&gt;0.60 AND AVANCE&lt;=0.80 THEN 'ENTRE 61 y 80%'
WHEN AVANCE&gt;0.80 AND AVANCE&lt;=1.0 THEN 'ENTRE 81 y 100%'
END) AS RANGO_AVANCE
FROM (
SELECT 
[G_Subdel] as SUBDEL
,[G_Rango] as RANGO
,[G_RegPat] as REGPAT
,[G_RazonSocial] as RAZON
,[G_ImporteCOP] as IMPORTE_COP
,[G_FechaBaja] as FECHA_BAJA
,[G_ID_Integrador] as INTEGRADOR
,[G_FechaAsignacion] as FECHA_ASIG
,ROUND((((case when [G_Estatus] is null then 0 else 1 end)
+(case when [G_Rango] is null then 0 else 1 end)
+(case when [G_RegPat] is null then 0 else 1 end)
+(case when [G_RazonSocial] is null then 0 else 1 end)
+(case when [G_ImporteCOP] is null then 0 else 1 end)
+(case when [G_ImporteRCV] is null then 0 else 1 end)
+(case when [G_FechaBaja] is null then 0 else 1 end)
+(case when [G_AreaSolicitaLaBaja] is null then 0 else 1 end)
+(case when [G_DocInformaEsPatronNL] is null then 0 else 1 end)
+(case when [G_ID_Integrador] is null then 0 else 1 end)
+(case when [G_FechaAsignacion] is null then 0 else 1 end)
+(case when [II_FolioCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FSCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FRCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FolioOfnaEPO] is null then 0 else 1 end)
+(case when [II_SOfnaEPO] is null then 0 else 1 end)
+(case when [II_ROfnaEPO] is null then 0 else 1 end)
+(case when [II_FolioOfnaCobros] is null then 0 else 1 end)
+(case when [II_SOfnaCobros] is null then 0 else 1 end)
+(case when [II_ROfnaCobros] is null then 0 else 1 end)
+(case when [II_FolioExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_SExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_RExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_SINDO] is null then 0 else 1 end)
+(case when [II_FolioDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_SDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_RDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_FolioDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_SDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_RDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_FolioServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_SServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_RServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_SeccBca] is null then 0 else 1 end)
+(case when [II_SeccAma] is null then 0 else 1 end)
+(case when [II_SIEM] is null then 0 else 1 end)
+(case when [II_COMPRA_NET] is null then 0 else 1 end)
+(case when [IE_SAT_DF_Folio] is null then 0 else 1 end)
+(case when [IE_SAT_DF_S] is null then 0 else 1 end)
+(case when [IE_SAT_DF_R] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_Folio] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_S] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_R] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_Folio] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_S] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_R] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_Folio] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_S] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_R] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_Folio] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_S] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_R] is null then 0 else 1 end)
+(case when [IC_FolioVisitaDomFiscal] is null then 0 else 1 end)
+(case when [IC_SVisitaDomFiscal] is null then 0 else 1 end)
+(case when [IC_FolioVisitaSocios] is null then 0 else 1 end)
+(case when [IC_SVisitaSocios] is null then 0 else 1 end)
+(case when [IC_FolioEntrevista3Vecinos] is null then 0 else 1 end)
+(case when [IC_SEntrevista3Vecinos] is null then 0 else 1 end)
+(case when [IC_FolioEntrevista3Trabajadores] is null then 0 else 1 end)
+(case when [IC_SEntrevista3Trabajadores] is null then 0 else 1 end)
+(case when [IC_FolioVisitasForaneas] is null then 0 else 1 end)
+(case when [IC_SVisitasForaneas] is null then 0 else 1 end)
+(case when [IC_RVisitasForaneas] is null then 0 else 1 end))
-(case G_Rango
when 'I' then 29
when 'II' then 29
when 'III' then 21
when 'IV' then 3
when 'V' then 0
else 0 end))
/(82.00-(case G_Rango
when 'I' then 29.00
when 'II' then 29.00
when 'III' then 21.00
when 'IV' then 3.00
when 'V' then 0.00
else 0 end)),2) as AVANCE
FROM [sirecaregistros].[dbo].[NL_General]
left join [sirecaregistros].[dbo].[NL_InvestInterna] on II_G_ID=[G_ID]
left join [sirecaregistros].[dbo].[NL_InvestExterna] on IE_G_ID=[G_ID]
left join [sirecaregistros].[dbo].[NL_InvestCampo] on IC_G_ID=[G_ID]
WHERE G_Subdel LIKE @SUBDEL
) as RESULTADO1
) as RESULTADO2
WHERE RANGO=@RANGO
AND RANGO_AVANCE=@RANGO_AVANCE
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="abc" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="I" Name="?" QueryStringField="rango" />
                <asp:QueryStringParameter DefaultValue="20" Name="?" 
                    QueryStringField="rangoavance" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

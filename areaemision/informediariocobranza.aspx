<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="informediariocobranza.aspx.vb" Inherits="WebSIRECA.informediariocobranza" Culture="es-MX" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            ToolTip="SUBDELEGACION" Width="120px">
    </asp:DropDownList>
    <span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="ASIGNACIÓN DEL "></asp:Label>
    </span> 
    <asp:TextBox ID="TBFIni" runat="server" Width="90px"></asp:TextBox>
    <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFIni">
    </asp:CalendarExtender>
    <span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="AL "></asp:Label>
    </span>
    <asp:TextBox ID="TBFFin" runat="server" Width="90px"></asp:TextBox>
    <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFFin">
    </asp:CalendarExtender>
    <span class="add-on">
    <asp:LinkButton CssClass ="btn" ID="LBActualizar" runat="server" BackColor="#9CAAC1">Actualizar</asp:LinkButton>
    </span> 
    </div>
</center>
<table align="center" cellpadding="2" cellspacing ="3" style="font-size: 12px">
            <tr>
                <td colspan="11" align="center" class="btn-info">
                    <h5>INFORME DIARIO DE LA COBRANZA TOTAL</h5>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr style="font-weight: bold" align="center">
                <td>
                    &nbsp;
                </td>
                <td class="btn-info" style="border-style: solid; border-width: 1px">
                    &nbsp;&nbsp;PATRON&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="btn-info" style="border-style: solid; border-width: 1px">
                    &nbsp;&nbsp;CREDITOS&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="btn-info" style="border-style: solid; border-width: 1px">
                    &nbsp;&nbsp;IMPORTE&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="btn-info" style="border-style: solid; border-width: 1px">
                    &nbsp;&nbsp;MULTA&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="btn-info" style="border-style: solid; border-width: 1px">
                    &nbsp;&nbsp;TOTAL&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="right" style="font-weight: bold; font-size: 14px">
                <td align="left">
                    TOTAL
                </td>
                <td>
                    <asp:Label ID="LPatronT1" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="LCreditoT1" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="LImporteT1" runat="server" Text="$0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="LMultaT1" runat="server" Text="$0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="LImMultT1" runat="server" Text="$0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
    <asp:Repeater ID="RInfDiario" runat="server" 
        DataSourceID="SqlDataSourceInfDiario">
    <ItemTemplate>
            <tr>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("INC") %>'></asp:Label>
                </td>
                <td align="right" style="border-style: solid; border-width: 1px">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("PATRONES","{0:N0}") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="PP1" runat="server" CssClass="label label-info" Text="1"></asp:Label>&nbsp;
                </td>
                <td align="right" style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LBCredito1" runat="server" Text='<%# Eval("CREDITO","{0:N0}") %>'></asp:Label>
                    
                </td>
                <td>
                    <asp:Label ID="PP2" runat="server" CssClass="label label-info" Text="2"></asp:Label>&nbsp;
                </td>
                <td align="right" style="border-style: solid; border-width: 1px">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("IMPORTE","{0:C}") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="PP3" runat="server" CssClass="label label-info" Text="3"></asp:Label>&nbsp;
                </td>
                <td align="right" style="border-style: solid; border-width: 1px">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("MULTA","{0:C}") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="PP4" runat="server" CssClass="label label-info" Text="4"></asp:Label>&nbsp;
                </td>
                <td align="right" style="border-style: solid; border-width: 1px">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("TOTAL","{0:C}") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="PP5" runat="server" CssClass="label label-warning" Text="5"></asp:Label>&nbsp;
                </td>
            </tr>
    </ItemTemplate>
    </asp:Repeater>
    <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
            <td colspan="11" class="btn-warning">
                &nbsp;</td>
            </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceInfDiario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"   
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--VARIABLES EMISIONES, DILIGENCIA DIARIO EMISIONES
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECHA_INI as DATETIME
DECLARE @FECHA_FIN as DATETIME
DECLARE @PATRONES_ET AS FLOAT
DECLARE @CREDITOS_ET AS FLOAT
DECLARE @CREDITOS_ETM AS FLOAT
DECLARE @IMPORTE_ET AS FLOAT
DECLARE @IMPORTE_ETM AS FLOAT
DECLARE @IMPORTE_ETT AS FLOAT
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?


--VARIABLES DE COBROS
DECLARE @ID_INSPECTOR AS VARCHAR(50)
DECLARE @FECHA_ASIG_INI AS DATETIME
DECLARE @FECHA_ASIG_FIN AS DATETIME
DECLARE @PATRONES_T AS FLOAT
DECLARE @CREDITOS_T AS FLOAT
DECLARE @CREDITOS_TM AS FLOAT
DECLARE @IMPORTE_T AS FLOAT
DECLARE @IMPORTE_TM AS FLOAT
SET @ID_INSPECTOR='%'
SET @FECHA_ASIG_INI=@FECHA_INI
SET @FECHA_ASIG_FIN=@FECHA_FIN
-----------------PATRONES TOTAL
SET @PATRONES_ET=(select sum(PATRONES) from (SELECT 
INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITOS,0) AS CREDITO,ISNULL(IMPORTE,0) AS IMPORTE,ISNULL(MULTA,0) AS MULTA,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as TOTAL
FROM (SELECT '1' AS INC_INDEX,'CITATORIO' AS INC
UNION ALL SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT 'DEPURADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC
UNION ALL SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC
UNION ALL SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC
UNION ALL SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC
UNION ALL SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC) AS head
LEFT JOIN(SELECT [incidenciax],COUNT(distinct REGPATX) as PATRONES,COUNT(*) as CREDITOS,SUM(OMISION) as IMPORTE,(SUM(OMISION)*0.4) as MULTA FROM (
SELECT REG#PATRONAL AS REGPATX,[OMISION]
,(case when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO' when pago&gt;=omision then 'PAGADO' when pago&lt;omision then 'PAGADO' when [incidencia] IS NULL then '1' else [incidencia] end) as [incidenciax]
FROM [sireca].[dbo].[eco] where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN and subdel like @SUBDEL) as rrr group by [incidenciax]) AS eco ON [incidenciax]=INC_INDEX) as tt)
+
(SELECT COUNT(DISTINCT [R_REGPATR]) AS PATRONES
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)
-----------------CREDITOS TOTAL
SET @CREDITOS_ET=(select sum(CREDITO) from (SELECT 
INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITOS,0) AS CREDITO,ISNULL(IMPORTE,0) AS IMPORTE,ISNULL(MULTA,0) AS MULTA,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as TOTAL
FROM (SELECT '1' AS INC_INDEX,'CITATORIO' AS INC
UNION ALL SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT 'DEPURADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC
UNION ALL SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC
UNION ALL SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC
UNION ALL SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC
UNION ALL SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC) AS head
LEFT JOIN(SELECT [incidenciax],COUNT(distinct REGPATX) as PATRONES,COUNT(*) as CREDITOS,SUM(OMISION) as IMPORTE,(SUM(OMISION)*0.4) as MULTA FROM (
SELECT REG#PATRONAL AS REGPATX,[OMISION]
,(case when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO' when pago&gt;=omision then 'PAGADO' when pago&lt;omision then 'PAGADO' when [incidencia] IS NULL then '1' else [incidencia] end) as [incidenciax]
FROM [sireca].[dbo].[eco] where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN and subdel like @SUBDEL) as rrr group by [incidenciax]) AS eco ON [incidenciax]=INC_INDEX) as tt)
+
(SELECT COUNT([R_NUMCRED]) AS CREDITOS
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)
-----------------IMPORTE TOTAL
SET @IMPORTE_ET=(select sum(IMPORTE) from (SELECT 
INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITOS,0) AS CREDITO,ISNULL(IMPORTE,0) AS IMPORTE,ISNULL(MULTA,0) AS MULTA,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as TOTAL
FROM (SELECT '1' AS INC_INDEX,'CITATORIO' AS INC
UNION ALL SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT 'DEPURADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC
UNION ALL SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC
UNION ALL SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC
UNION ALL SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC
UNION ALL SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC) AS head
LEFT JOIN(SELECT [incidenciax],COUNT(distinct REGPATX) as PATRONES,COUNT(*) as CREDITOS,SUM(OMISION) as IMPORTE,(SUM(OMISION)*0.4) as MULTA FROM (
SELECT REG#PATRONAL AS REGPATX,[OMISION]
,(case when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO' when pago&gt;=omision then 'PAGADO' when pago&lt;omision then 'PAGADO' when [incidencia] IS NULL then '1' else [incidencia] end) as [incidenciax]
FROM [sireca].[dbo].[eco] where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN and subdel like @SUBDEL) as rrr group by [incidenciax]) AS eco ON [incidenciax]=INC_INDEX) as tt)
-----------------IMPORTE TOTAL MULTA
SET @IMPORTE_ETM=(select sum(IMPORTE) from (SELECT 
INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITOS,0) AS CREDITO,ISNULL(IMPORTE,0) AS IMPORTE,ISNULL(MULTA,0) AS MULTA,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as TOTAL
FROM (SELECT '1' AS INC_INDEX,'CITATORIO' AS INC
UNION ALL SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT 'DEPURADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC
UNION ALL SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC
UNION ALL SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC
UNION ALL SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC
UNION ALL SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC) AS head
LEFT JOIN(SELECT [incidenciax],COUNT(distinct REGPATX) as PATRONES,COUNT(*) as CREDITOS,SUM(OMISION) as IMPORTE,(SUM(OMISION)*0.4) as MULTA FROM (
SELECT REG#PATRONAL AS REGPATX,[OMISION]
,(case when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO' when pago&gt;=omision then 'PAGADO' when pago&lt;omision then 'PAGADO' when [incidencia] IS NULL then '1' else [incidencia] end) as [incidenciax]
FROM [sireca].[dbo].[eco] where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN and subdel like @SUBDEL) as rrr group by [incidenciax]) AS eco ON [incidenciax]=INC_INDEX) as tt)
-----------------IMPORTE TOTAL TOTAL
SET @IMPORTE_ETT=(select ISNULL(sum(IMPORTE),0.0)+ISNULL(sum(MULTA),0.0) from (SELECT 
INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITOS,0) AS CREDITO,ISNULL(IMPORTE,0) AS IMPORTE,ISNULL(MULTA,0) AS MULTA,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as TOTAL
FROM (SELECT '1' AS INC_INDEX,'CITATORIO' AS INC
UNION ALL SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT 'DEPURADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC
UNION ALL SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC
UNION ALL SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC
UNION ALL SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC
UNION ALL SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC) AS head
LEFT JOIN(SELECT [incidenciax],COUNT(distinct REGPATX) as PATRONES,COUNT(*) as CREDITOS,SUM(OMISION) as IMPORTE,(SUM(OMISION)*0.4) as MULTA FROM (
SELECT REG#PATRONAL AS REGPATX,[OMISION]
,(case when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO' when pago&gt;=omision then 'PAGADO' when pago&lt;omision then 'PAGADO' when [incidencia] IS NULL then '1' else [incidencia] end) as [incidenciax]
FROM [sireca].[dbo].[eco] where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN and subdel like @SUBDEL) as rrr group by [incidenciax]) AS eco ON [incidenciax]=INC_INDEX) as tt)
--LLENADO DE VARIABLES DE COBROS-------------------------------------------------------------------------------------------
---------------------------------------TOTALES
SET @PATRONES_T=@PATRONES_ET/*(SELECT COUNT(DISTINCT [R_REGPATR]) AS PATRONES
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)*/

SET @CREDITOS_T=@CREDITOS_ET/*(SELECT COUNT([R_NUMCRED]) AS CREDITOS
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)*/

SET @IMPORTE_T=(SELECT ISNULL(SUM([R_IMPORTE]),0) AS IMPORTE
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

SET @CREDITOS_TM=(SELECT COUNT([R_NUMCRED]) AS CREDITOS_MULTA
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

SET @IMPORTE_TM=(SELECT ISNULL(SUM([R_IMPORTE]),0) AS IMPORTE_MULTA
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

--CREANDO REPORTE DE EMISIONES--------------------------------------------------------------------------------------
SELECT RESULTADOS.*,'' as VURL FROM (
SELECT 'RECAUDACION BANCARIA' AS INC
UNION ALL SELECT 'RECAUDACION EXACTORA' AS INC
UNION ALL SELECT 'DEPURADO PROCESAR/SIPARE' AS INC
) AS ESQUEMA LEFT JOIN (
SELECT INC,SUM(PATRONES) AS PATRONES--,SUM(PATRONES_P) AS PATRONES_P
,SUM(CREDITO) AS CREDITO--,SUM(CREDITOS_P) AS CREDITOS_P
,SUM(IMPORTE) AS IMPORTE--,SUM(IMPORTE_P) AS IMPORTE_P
,SUM(MULTA) AS MULTA--,SUM(IMPORTE_PM) AS IMPORTE_PM
,SUM(IMPORTE_TOTAL) AS TOTAL--,SUM(IMPORTE_TP) AS IMPORTE_TP 
FROM (
SELECT (CASE WHEN INC='PAGADO' THEN 'RECAUDACION BANCARIA' ELSE INC END) AS INC,ISNULL(PATRONES,0) AS PATRONES
,(ISNULL(PATRONES,0)/(CASE WHEN @PATRONES_ET=0 THEN 1.0 ELSE @PATRONES_ET END)) AS PATRONES_P
,ISNULL(CREDITOS,0) AS CREDITO
,(ISNULL(CREDITOS,0)/(CASE WHEN @CREDITOS_ET=0 THEN 1.0 ELSE @CREDITOS_ET END)) AS CREDITOS_P
,ISNULL(IMPORTE,0) AS IMPORTE
,(ISNULL(IMPORTE,0.0)/(CASE WHEN @IMPORTE_ET=0 THEN 1.0 ELSE @IMPORTE_ET END)) AS IMPORTE_P
,ISNULL(MULTA,0) AS MULTA 
,(ISNULL(MULTA,0)/(CASE WHEN @IMPORTE_ETM=0 THEN 1.0 ELSE @IMPORTE_ETM END)) AS IMPORTE_PM
,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as IMPORTE_TOTAL
,((ISNULL(IMPORTE,0)+ISNULL(MULTA,0))/(CASE WHEN (@IMPORTE_ETT)=0 THEN 1.0 ELSE @IMPORTE_ETT END)) AS IMPORTE_TP
--,'sub='+@SUBDEL+'&amp;in='+isnull([incidenciax],'RA')+'&amp;fini='+convert(nvarchar,@FECHA_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_FIN,103) as VURL
FROM (
SELECT '1' AS INC_INDEX,'CITATORIO' AS INC
UNION ALL
SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC
UNION ALL
SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC
UNION ALL
SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC
UNION ALL
SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC
) AS head
LEFT JOIN
(SELECT [incidenciax]
,COUNT(distinct REGPATX) as PATRONES
,COUNT(*) as CREDITOS
,SUM(OMISION) as IMPORTE 
,(SUM(OMISION)*0.4) as MULTA FROM (
SELECT REG#PATRONAL AS REGPATX
	  ,[OMISION]
      ,[fechaEco]
      ,[responsable]
      ,[tipoECO]
      ,[incidencia]
      ,[subdel]
      ,pago
      ,[responsablePae]
      ,[incidenciarale]
      ,case
      when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO'
      when pago&gt;=omision then 'PAGADO'
      when pago&lt;omision then 'PAGADO'
      when [incidencia] IS NULL then '1'
      else [incidencia]
      end as [incidenciax]
  FROM [sireca].[dbo].[eco]
  where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN
  and subdel like @SUBDEL
  ) as rrr
  group by [incidenciax]
  ) AS eco ON [incidenciax]=INC_INDEX
  UNION ALL
  ------------------------------------------------------------------------------------------------------RESULTADOS
SELECT 
--INC_INDEX,
INC
,PATRONES,(PATRONES/(CASE WHEN @PATRONES_T=0 THEN 1.0 ELSE @PATRONES_T END)) AS PATRONES_P
,CREDITOS,(CREDITOS/(CASE WHEN @CREDITOS_T=0 THEN 1.0 ELSE @CREDITOS_T END)) AS CREDITOS_P
,IMPORTE,(IMPORTE/(CASE WHEN @IMPORTE_T=0 THEN 1.0 ELSE @IMPORTE_T END)) AS IMPORTE_P
--,CREDITOS_MULTA,(CREDITOS_MULTA/(CASE WHEN @CREDITOS_TM=0 THEN 1.0 ELSE @CREDITOS_TM END)) AS CREDITOS_PM
,IMPORTE_MULTA,(IMPORTE_MULTA/(CASE WHEN @IMPORTE_TM=0 THEN 1.0 ELSE @IMPORTE_TM END)) AS IMPORTE_PM
--,CREDITO_TOTAL,(CREDITO_TOTAL/(CASE WHEN (@CREDITOS_T+@CREDITOS_TM)=0 THEN 1.0 ELSE (@CREDITOS_T+@CREDITOS_TM) END)) AS CREDITO_TP
,IMPORTE_TOTAL,(IMPORTE_TOTAL/(CASE WHEN (@IMPORTE_T)=0 THEN 1.0 ELSE (@IMPORTE_T) END)) AS IMPORTE_TP
FROM (
------------------------------------------------------------------------------------SIN SITATORIO
SELECT
('?subdel='+@SUBDEL+'&amp;fini='+convert(nvarchar,@FECHA_ASIG_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_ASIG_FIN,103)+'&amp;inc=SIN_CITATORIO') as vurl
,'1' AS INC_INDEX
,'*SIN CITATORIOS' AS INC
,ISNULL(SUM(PATRONES),0) AS PATRONES
,ISNULL(SUM(CREDITOS),0) AS CREDITOS
,ISNULL(SUM(IMPORTE),0.00) AS IMPORTE
,ISNULL(SUM(CREDITOS_MULTA),0) AS CREDITOS_MULTA
,ISNULL(SUM(IMPORTE_MULTA),0.00) AS IMPORTE_MULTA
,(ISNULL(SUM(CREDITOS),0)+ISNULL(SUM(CREDITOS_MULTA),0)) AS CREDITO_TOTAL
,(ISNULL(SUM(IMPORTE),0.00)+ISNULL(SUM(IMPORTE_MULTA),0.00)) AS IMPORTE_TOTAL
FROM (
SELECT '1' AS INC_INDEX,'*CITATORIO' AS INC
UNION ALL
SELECT 'RB' AS INC_INDEX,'RECAUDACION BANCARIA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '03' AS INC_INDEX,'(03) ACLARACION ADMINISTRATIVA' AS INC
UNION ALL
SELECT '05' AS INC_INDEX,'(05) SOLICITUD DE CONVENIO' AS INC
UNION ALL
SELECT '06' AS INC_INDEX,'(06) INCONFORMIDAD' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'(09) NO LOCALIZADO' AS INC
UNION ALL
SELECT '14' AS INC_INDEX,'(14) JUICIO' AS INC
UNION ALL
SELECT '23' AS INC_INDEX,'(23) EN TRAMITE DE CONDONACION' AS INC
UNION ALL
SELECT '32' AS INC_INDEX,'(32) EMBARGO DE BIENES MUEBLES EN DEPOS. AJENA AL IMSS' AS INC
UNION ALL
SELECT '33' AS INC_INDEX,'(33) EMBARGO DE BIENES MUEBLES EN DEPOS. IMSS' AS INC
UNION ALL
SELECT '34' AS INC_INDEX,'(34) EMBARGO DE BIENES INMUEBLES' AS INC
UNION ALL
SELECT '35' AS INC_INDEX,'(35) EMBARGO DE NEGOCIACION' AS INC
UNION ALL
SELECT '43' AS INC_INDEX,'(43) EMBARGO DE DEPOS. BANCARIOS' AS INC
UNION ALL
SELECT 'PENDIENTE' AS INC_INDEX,'PENDIENTES' AS INC
) AS head
-----------------------------------------------ORIGEN
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NULL
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
-----------------------------------------------MULTA
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NULL
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX
UNION ALL
------------------------------------------------------------------------------------CON SITATORIO
SELECT
('?subdel='+@SUBDEL+'&amp;fini='+convert(nvarchar,@FECHA_ASIG_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_ASIG_FIN,103)+'&amp;inc=1') as vurl
,'1' AS INC_INDEX
,'CITATORIO' AS INC
,ISNULL(SUM(PATRONES),0) AS PATRONES
,ISNULL(SUM(CREDITOS),0) AS CREDITOS
,ISNULL(SUM(IMPORTE),0.00) AS IMPORTE
,ISNULL(SUM(CREDITOS_MULTA),0) AS CREDITOS_MULTA
,ISNULL(SUM(IMPORTE_MULTA),0.00) AS IMPORTE_MULTA
,(ISNULL(SUM(CREDITOS),0)+ISNULL(SUM(CREDITOS_MULTA),0)) AS CREDITO_TOTAL
,(ISNULL(SUM(IMPORTE),0.00)+ISNULL(SUM(IMPORTE_MULTA),0.00)) AS IMPORTE_TOTAL
FROM (
--
SELECT '1' AS INC_INDEX,'*CITATORIO' AS INC
UNION ALL
SELECT 'RB' AS INC_INDEX,'RECAUDACION BANCARIA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '03' AS INC_INDEX,'(03) ACLARACION ADMINISTRATIVA' AS INC
UNION ALL
SELECT '05' AS INC_INDEX,'(05) SOLICITUD DE CONVENIO' AS INC
UNION ALL
SELECT '06' AS INC_INDEX,'(06) INCONFORMIDAD' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'(09) NO LOCALIZADO' AS INC
UNION ALL
SELECT '14' AS INC_INDEX,'(14) JUICIO' AS INC
UNION ALL
SELECT '23' AS INC_INDEX,'(23) EN TRAMITE DE CONDONACION' AS INC
UNION ALL
SELECT '32' AS INC_INDEX,'(32) EMBARGO DE BIENES MUEBLES EN DEPOS. AJENA AL IMSS' AS INC
UNION ALL
SELECT '33' AS INC_INDEX,'(33) EMBARGO DE BIENES MUEBLES EN DEPOS. IMSS' AS INC
UNION ALL
SELECT '34' AS INC_INDEX,'(34) EMBARGO DE BIENES INMUEBLES' AS INC
UNION ALL
SELECT '35' AS INC_INDEX,'(35) EMBARGO DE NEGOCIACION' AS INC
UNION ALL
SELECT '43' AS INC_INDEX,'(43) EMBARGO DE DEPOS. BANCARIOS' AS INC
UNION ALL
SELECT 'PENDIENTE' AS INC_INDEX,'PENDIENTES' AS INC
) AS head
-----------------------------------------------ORIGEN
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NOT NULL
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
-----------------------------------------------MULTA
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NOT NULL
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX

------------------------------------------------------------------CITATORIOS DILIGENCIADOS
UNION ALL
SELECT 
('?subdel='+@SUBDEL+'&amp;fini='+convert(nvarchar,@FECHA_ASIG_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_ASIG_FIN,103)+'&amp;inc='+INC_INDEX) as vurl
,INC_INDEX,INC
,ISNULL(PATRONES,0) AS PATRONES
,ISNULL(CREDITOS,0) AS CREDITOS
,ISNULL(IMPORTE,0.00) AS IMPORTE
,ISNULL(CREDITOS_MULTA,0) AS CREDITOS_MULTA
,ISNULL(IMPORTE_MULTA,0.00) AS IMPORTE_MULTA
,(ISNULL(CREDITOS,0)+ISNULL(CREDITOS_MULTA,0)) AS CREDITO_TOTAL
,(ISNULL(IMPORTE,0.00)+ISNULL(IMPORTE_MULTA,0.00)) AS IMPORTE_TOTAL
FROM (
SELECT 'RB' AS INC_INDEX,'RECAUDACION BANCARIA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'DEPURADO PROCESAR/SIPARE' AS INC
) AS head
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NOT NULL
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NOT NULL
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX
) AS RESULTADO
) AS RM GROUP BY INC
) AS RESULTADOS ON RESULTADOS.INC=ESQUEMA.INC
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

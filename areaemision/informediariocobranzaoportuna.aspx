<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="informediariocobranzaoportuna.aspx.vb" Inherits="WebSIRECA.informediariocobranzaoportuna" Culture="es-MX" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
        </style>
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
                    <h5>INFORME DIARIO DE LA COBRANZA OPORTUNA</h5>
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
                    ASIGNACIÓN TOTAL
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
                    <asp:LinkButton ID="LBCredito1" runat="server" Text='<%# Eval("CREDITO","{0:N0}") %>' OnClick='<%# IIF(Eval("CREDITO")="0","","javascript:window.open(""informediariocobranzaoportunadetalle.aspx?" & Eval("VURL") & """,""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");") %>'></asp:LinkButton>
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
            <tr align="right">
                <td style="border-style: solid; border-width: 1px" align="left">
                    *TOTAL INGRESADO EN CARTERA
                </td>
                <asp:Repeater ID="RepeaterIngCartera" runat="server" 
                    DataSourceID="SqlDataSourceIngCartera">
                <ItemTemplate>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LPatronT2" runat="server" Text='<%# Eval("PATRONES","{0:N0}") %>'></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px">
                    <asp:LinkButton ID="LCreditoT2" runat="server" Text='<%# Eval("CREDITO","{0:N0}") %>' OnClick='<%# IIF(Eval("CREDITO")="0","","javascript:window.open(""informediariocobranzaoportunadetallecc.aspx?" & Eval("VURL") & """,""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");") %>'></asp:LinkButton>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LImporteT2" runat="server" Text='<%# Eval("IMPORTE","{0:C}") %>'></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LMultaT2" runat="server" Text='<%# Eval("MULTA","{0:C}") %>'></asp:Label>
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
                </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSourceIngCartera" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_INI AS DATETIME
DECLARE @FECHA_FIN AS DATETIME
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?

SELECT  count(DISTINCT regpat_r) as PATRONES,count(credito_r) as CREDITO
,sum(omision) as IMPORTE,(sum(omision)*0.4) as MULTA
,'s='+@SUBDEL+'&amp;fini='+convert(varchar,@FECHA_INI,103)+'&amp;ffin='+convert(varchar,@FECHA_FIN,103) AS VURL
FROM (
SELECT
      distinct [HA_SUBDEL]
      ,SUBSTRING(replace([CQ_DATO1],'REG. PATRONAL:$',''),1,10) as regpat_r
      ,substring([HA_ID_CODEBAR],charindex('!',[HA_ID_CODEBAR])+1,len([HA_ID_CODEBAR])) as credito_r
      --,[HA_FECH_REGISTRO]
  FROM [controlQR].[dbo].[HIST_ACCIONES] 
  left join [controlQR].[dbo].[CONTROL_QR]
  ON CQ_ID=substring([HA_ID_CODEBAR],1,charindex('!',[HA_ID_CODEBAR])-1)
  WHERE [HA_AC_ID]='4' and [HA_SUBDEL] LIKE @SUBDEL
  and [HA_FECH_REGISTRO] between @FECHA_INI and @FECHA_FIN
  ) AS RR
  LEFT JOIN 
  sireca.dbo.eco
  on substring(reg#patronal,1,10)=regpat_r and credito=credito_r
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
            </tr>
            <tr align="right">
                <td style="border-style: solid; border-width: 1px" align="left" class="style1">
                    TOTAL DE MULTA PARA DEPURAR
                </td>
                <td style="border-style: solid; border-width: 1px" class="style1">
                    <asp:Label ID="LPatronT3" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px" class="style1">
                    <asp:Label ID="LCreditoT3" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px" class="style1">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px" class="style1">
                    <asp:Label ID="LMultaT3" runat="server" Text="$0"></asp:Label>
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
            <tr align="right">
                <td style="border-style: solid; border-width: 1px" align="left">
                    <strong>PAGO TOTAL</strong>
                </td>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LPatronT4" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LCreditoT4" runat="server" Text="0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px">
                    <asp:Label ID="LImporteT4" runat="server" Text="$0"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-style: solid; border-width: 1px">
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
            <div>&nbsp;&nbsp;<strong>*Nota:</strong> El segmento <i><strong>"TOTAL INGRESADO EN CARTERA"</strong></i> incluye 
                todos&nbsp; los documentos ingresados en el periodo de revisión.</div>
            </td>
            </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceInfDiario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"   
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECHA_INI as DATETIME
DECLARE @FECHA_FIN as DATETIME
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?

SELECT INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITOS,0) AS CREDITO
,ISNULL(IMPORTE,0) AS IMPORTE
,ISNULL(MULTA,0) AS MULTA 
,(ISNULL(IMPORTE,0)+ISNULL(MULTA,0)) as TOTAL
,'sub='+@SUBDEL+'&amp;in='+isnull([incidenciax],'RA')+'&amp;fini='+convert(nvarchar,@FECHA_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_FIN,103) as VURL
FROM (
SELECT '1' AS INC_INDEX,'CITATORIO' AS INC,1 as orden
UNION ALL
SELECT 'PAGADO' AS INC_INDEX,'PAGADO' AS INC,2 as orden
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'DEPURADO PROCESAR/SIPARE' AS INC,3 as orden
UNION ALL
SELECT '2' AS INC_INDEX,'NOTIFICADO' AS INC,4 as orden
UNION ALL
SELECT '9' AS INC_INDEX,'NO LOCALIZADO' AS INC,5 as orden
UNION ALL
SELECT 'A' AS INC_INDEX,'AUTODETERMINADO' AS INC,6 as orden
UNION ALL
SELECT '13' AS INC_INDEX,'ENVIADOS APROCURACION' AS INC,7 as orden
UNION ALL
SELECT 'REASIGNACION' AS INC_INDEX,'REASIGNADOS' AS INC,8 as orden
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
  order by orden
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
    <asp:SqlDataSource ID="SqlDataSourceInfDiario0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"  
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @FECHA_INI as VARCHAR(10)
DECLARE @FECHA_FIN as VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR='%'
SET @FECHA_INI=?
SET @FECHA_FIN=?
exec('
SELECT INC,ISNULL(PATRONES,0) AS PATRONES,ISNULL(CREDITO,0) AS CREDITO,ISNULL(IMPORTE,0) AS IMPORTE,ISNULL(MULTA,0) AS MULTA FROM (
SELECT ''PAGADO'' AS INC_INDEX,''PAGADO'' AS INC
UNION ALL
SELECT ''DEPURADO'' AS INC_INDEX,''DEPURADO PROCESAR/SIPARE'' AS INC
UNION ALL
SELECT ''02'' AS INC_INDEX,''NOTIFICADO'' AS INC
UNION ALL
SELECT ''09'' AS INC_INDEX,''NO LOCALIZADO'' AS INC
UNION ALL
SELECT ''27'' AS INC_INDEX,''AUTODETERMINADO'' AS INC
UNION ALL
SELECT ''REASIGNACION'' AS INC_INDEX,''REASIGNADOS'' AS INC
) AS X
LEFT JOIN
(
-------------------
SELECT 
( 
CASE
WHEN RR_ND_CODE IN (''POR PROCESAR'',''SIPARE'') THEN ''DEPURADO''
WHEN RR_ND_CODE IN (''02'',''09'',''A'',''PAGADO'') THEN RR_ND_CODE
WHEN RR_ND_CODE IN ('''') THEN ''09''
ELSE RR_ND_CODE
END
) as INCIDENCIAX
,count(distinct reg#patronal) as PATRONES,count(credito) AS CREDITO
,SUM(importe) AS IMPORTE
,(SUM(importe)*0.40) AS MULTA
FROM (
SELECT
(CASE WHEN FECHA_SALIDA IS NULL THEN 0 ELSE 1 END) AS FS
,(CASE WHEN FECHA_ENTRADA IS NULL THEN 0 ELSE 1 END) AS FE,r_regpat,code_bar,RR_ND_CODE FROM (
SELECT 
case when RR_FECHA_ACCION is null then sirecacobros.dbo.diasInabiles(R_FECHA_ACCION,getdate())
else 0
end as DIAS_TRANCURRIDOS
,R_CODE_BAR AS CODE_BAR
,R_INSPECTOR AS INSPECTOR
,R_ID_INSPECTOR AS ID_INSPECTOR
,R_TD AS TD,R_FECHA_ACCION AS FECHA_SALIDA
,RR_FECHA_ACCION AS FECHA_ENTRADA
,RR_ND_CODE
,R_REGPAT
FROM
(SELECT 
R_CODE_BAR
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=R_ID_NOTIFICADOR) AS R_INSPECTOR
,R_ID_NOTIFICADOR AS R_ID_INSPECTOR
,R_TD,R_FECHA_ACCION
,R_REGPAT
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_ID_NOTIFICADOR
,(SELECT replace([CQ_DATO1],''REG. PATRONAL:$'','''')
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_REGPAT
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_TD
,[HA_ID_CODEBAR] AS R_CODE_BAR
,[HA_FECH_REGISTRO] as R_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as R_ACCION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''1''
) AS RESULT
) AS RI
LEFT JOIN
(
SELECT 
RR_FECHA_ACCION
,RR_CODE_BAR
,RR_ND_CODE
FROM (
SELECT 
[HA_ID_CODEBAR] AS RR_CODE_BAR
,[HA_FECH_REGISTRO] as RR_FECHA_ACCION
,[HA_ND_CODE] as RR_ND_CODE
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''2''
) AS RESULT2
) AS RS
on RR_CODE_BAR=R_CODE_BAR
) AS RESULTADO
WHERE TD in (''Acta de Notificacion (COP-FISICA)'',''Acta de Notificacion (COP-MORAL)'',''Acta de Notificacion (RCV-FISICA)'',''Acta de Notificacion (RCV-MORAL)'')
) AS qr LEFT JOIN
(
select (
CASE
WHEN incidencia IS NULL THEN ''0''
WHEN incidencia IN (''POR PROCESAR'',''SIPARE'') THEN ''DEPURADO''
WHEN incidencia IN (''02'',''09'',''A'',''PAGADO'') THEN incidencia
ELSE ''X''
END
)
 AS INCIDENCIA,reg#patronal,credito,omision as importe,fechaSeleccion as fech_asig from sireca.dbo.eco where subdel='''+@SUBDEL+''') as eco
on substring(eco.reg#patronal,1,10)=qr.r_regpat and eco.CREDITO=substring(qr.code_bar,charindex(''!'',qr.code_bar)+1,9)
WHERE fech_asig between '''+@FECHA_INI+''' and '''+@FECHA_FIN+''' AND INCIDENCIA IS NOT NULL
GROUP BY RR_ND_CODE
----------------------------------------------
) AS REP ON INCIDENCIAX=INC_INDEX
')
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

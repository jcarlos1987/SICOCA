<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="controldenotificador.aspx.vb" Inherits="WebSIRECA.controldenotificador1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportSource ID="CrystalReportSourceContNotificador" runat="server">
            <Report FileName="controldenotificador.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceContNotificador" 
                        TableName="CONTROL_NOTIFICADOR" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceContNotificador" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ROWS_MAX INT
DECLARE @NUM_CREDITOS INT
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @FECH_ASIG as VARCHAR(10)

SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_ASIG=?
SET @ROWS_MAX=43

--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @NUM_CREDITOS=(SELECT COUNT(*)
FROM [sireca].[dbo].[eco] as eco
where [subdel]=@SUBDEL
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
and responsable=@INSPECTOR
and convert(varchar(10),fechaSeleccion,103)=@FECH_ASIG)
--FILAS FALTANTES- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @ROWS_MAX=(select case when @NUM_CREDITOS&gt;@ROWS_MAX then @ROWS_MAX-(@NUM_CREDITOS-((@NUM_CREDITOS/@ROWS_MAX)*@ROWS_MAX))
else @ROWS_MAX-@NUM_CREDITOS end)

exec('
select ROW_NUMBER() OVER(order by C_REGPAT desc,isnull(C_PERIODO,convert(datetime,(''01/''+C_PERIODO),103)) ) as C_N,* from (
SELECT 
[REG#PATRONAL] as C_REGPAT
,[NOMBRE O RAZON SOCIAL] as C_RAZON
,[CREDITO] as C_CREDITO
,(case
when [tipoECO] in (''COP'',''COMP'') then
(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in (''RCV'',''RCVCOMP'') then
(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
end
) as C_PERIODO
,(case
when [tipoECO] in (''COP'',''COMP'') then ''02''
when [tipoECO] in (''RCV'',''RCVCOMP'') then ''06''
end ) as C_TD

,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) AS C_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) AS C_SUBDELEGACION
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) as C_INSPECTOR
,(SELECT ''C. ''+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios as uf on [C_ID]=id
WHERE [C_CARGO]=''JFE_SEC'' and uf.subdel=eco.subdel) AS C_JEF_SECCION
,fechaSeleccion as C_ASIGNACION
,(
case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
	(
		SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
		FROM [sireca].[dbo].[HistorialInc] as hinc
		where hinc.incidencia=''2'' and hinc.ideco=eco.id
		order by ideco desc
	) end
) AS C_NOTIFICADO
,isnull((
case when eco.incidencia in (''9'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
	(
		SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
		FROM [sireca].[dbo].[HistorialInc] as hinc
		where hinc.incidencia=''9'' and hinc.ideco=eco.id
		order by ideco desc
	) end
),
(CASE 
WHEN (eco.incidencia is null or eco.incidencia in (''PAGADO'',''POR PROCESAR'',''SIPARE'')) and eco.validacion not in (''SIN PAGO'') THEN ''PAGADO''
WHEN eco.incidencia is null and eco.validacion in (''SIN PAGO'') THEN ''SIN ATEND.''
WHEN eco.incidencia in(''2'') THEN ''''
else eco.incidencia
END)
) as C_FECH_ACTA_CIRCUNS
,''d'' as C_X
,'''' as C_POSITIVO
,'''' as C_NEGATIVO
,'''' as C_2FECH_NOT
,'''' as C_2FECH_ACT_CIRCUNS
FROM [sireca].[dbo].[eco] as eco
where [subdel]='''+@SUBDEL+'''
and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and responsable='''+@INSPECTOR+'''
and convert(varchar(10),fechaSeleccion,103)='''+@FECH_ASIG+'''
union all 
SELECT top '+@ROWS_MAX+' ''- - - - - - - - - - -'' as C_REGPAT,''- - - - - - - - - - - - - - - - - - - - - -'' as C_RAZON
,''- - - - - - - - -'' as C_CREDITO
,''- - - - - - -'' as C_PERIODO
,''- - -'' as C_TD
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]='''+@SUBDEL+''') AS C_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]='''+@SUBDEL+''') AS C_SUBDELEGACION
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id='''+@INSPECTOR+''') as C_INSPECTOR
,(SELECT ''C. ''+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios as uf on [C_ID]=id
WHERE [C_CARGO]=''JFE_SEC'' and uf.subdel='''+@SUBDEL+''') AS C_JEF_SECCION
,convert(datetime,'''+@FECH_ASIG+''',103) as C_ASIGNACION
,''- - - - - - - - -'' AS C_NOTIFICADO
,''- - - - - - - - -'' as C_FECH_ACTA_CIRCUNS
,''- - -'' as C_X
,''- - -'' as C_POSITIVO
,''- - -'' as C_NEGATIVO
,''- - - - - - - - -'' as C_2FECH_NOT
,''- - - - - - - - -'' as C_2FECH_ACT_CIRCUNS
from [sirecaemisiones].[dbo].[F_FILL]
) as res
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_asig" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

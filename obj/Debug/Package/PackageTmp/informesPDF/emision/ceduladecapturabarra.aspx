<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ceduladecapturabarra.aspx.vb" Inherits="WebSIRECA.ceduladecapturabarra1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>cedula de captura</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportSource ID="CrystalReportSourceCedulaCaptura" runat="server">
            <Report FileName="ceduladecapturabarra.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceCedulaCaptura" TableName="CEDULA_CAPTURA" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceCedulaCaptura" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(2)
DECLARE @FOLIO VARCHAR(6)
DECLARE @VINC VARCHAR(6)
DECLARE @WHERE_INC VARCHAR(100)
DECLARE @ROWS_MAX INT
DECLARE @ANIO VARCHAR(4)
DECLARE @NUM_CREDITOS INT
DECLARE @JOF_EMI as VARCHAR(200)
DECLARE @ELABORO as VARCHAR(200)
DECLARE @OBSERVACION as VARCHAR(3000)
DECLARE @FECHA_DILIGENCIA as VARCHAR(10)
DECLARE @TIPO_ECO as VARCHAR(15)
DECLARE @DBO AS VARCHAR(50)
SET @SUBDEL=?
SET @FOLIO=?
SET @VINC=?
SET @ANIO=?
SET @FECHA_DILIGENCIA=?
SET @TIPO_ECO=?
SET @DBO=(CASE WHEN charindex('SIVEPA',@TIPO_ECO)=1 THEN 'sivepas' ELSE 'eco' END)
SET @FECHA_DILIGENCIA=replace(substring(@FECHA_DILIGENCIA,1,5),'/','')+substring(@FECHA_DILIGENCIA,9,2)
SET @WHERE_INC=' and V_INC_CAPTURA='''+@VINC+''''
SET @ROWS_MAX=11

if @DBO='eco'
begin
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @OBSERVACION=(SELECT MAX([V_FOLIO_P1_OBSERVACION])
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @NUM_CREDITOS=(SELECT COUNT([V_CREDITO])
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--FILAS FALTANTES- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @ROWS_MAX=(select case when @NUM_CREDITOS&gt;@ROWS_MAX then @ROWS_MAX-(@NUM_CREDITOS-((@NUM_CREDITOS/@ROWS_MAX)*@ROWS_MAX))
else @ROWS_MAX-@NUM_CREDITOS end)
--ELABORA
SET @ELABORO=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_SEC' and subdel=[V_SUBDEL])
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
--JEFE OFICI EMISION
SET @JOF_EMI=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_OFI_EMIS' and subdel=@SUBDEL)
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
end
else
begin
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @OBSERVACION=(SELECT MAX([V_FOLIO_P1_OBSERVACION])
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @NUM_CREDITOS=(SELECT COUNT([V_CREDITO])
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--FILAS FALTANTES- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @ROWS_MAX=(select case when @NUM_CREDITOS&gt;@ROWS_MAX then @ROWS_MAX-(@NUM_CREDITOS-((@NUM_CREDITOS/@ROWS_MAX)*@ROWS_MAX))
else @ROWS_MAX-@NUM_CREDITOS end)
--ELABORA
SET @ELABORO=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_SEC' and subdel=[V_SUBDEL])
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
--JEFE OFICI EMISION
SET @JOF_EMI=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_OFI_EMIS' and subdel=@SUBDEL)
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
end
--REPORTE- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -
exec('
SELECT
ROW_NUMBER() OVER(order by V_REGPAT,convert(datetime,''01/''+V_PERIODO,103)) as V_N
,'''+@FECHA_DILIGENCIA+''' as FECHA_DILI
,(
CASE WHEN [V_TIPO_ECO] IN (''COP'',''SIVEPA-IMSS'') THEN '''' ELSE (CASE WHEN V_ORI_MUL IN (''ORIGEN'') THEN '''' ELSE V_ORI_MUL END) END
)
as V_ORI_MUL
,(SELECT SUM([V_OMISION])
FROM [sirecaemisiones].[dbo].['+@DBO+']
WHERE V_SUBDEL='''+@SUBDEL+'''
and V_FOLIO_P1='''+@FOLIO+''' and year(V_FECHA_P1_TURNADO)='+@ANIO+' 
'+ @WHERE_INC +'
) AS V_IMPORTE_TOT
,'+@NUM_CREDITOS+' AS V_NUM_CREDITOS
,[V_REGPAT]
,[V_CREDITO]
,[V_PERIODO]
,[V_OMISION] as V_IMPORTE
  
,(SELECT upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]=''JFE_SEC'' and subdel=[V_SUBDEL]) as V_ELABORO
,[V_FOLIO_P1] as FOLIO_ELABORO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=[V_FOLIO_P1_TURNADO_A]) as V_RECIBE

,[V_TIPO_ECO]
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=[V_SUBDEL]) as V_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=[V_SUBDEL]) as V_SUBDELEGACION
,(SELECT upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]=''JFE_OFI_EMIS'' and subdel=[V_SUBDEL]) as V_JEFE_OFI_EMISION
,V_FECHA_P1_TURNADO as V_FECHA_TURNO
,(CASE WHEN V_INC_CAPTURA in (''2'',''9'') THEN '''' ELSE ''X'' END) as V_CEDULA_CAP3
,(CASE WHEN V_INC_CAPTURA in (''2'',''9'') THEN ''X'' ELSE '''' END) as V_CEDULA_CAP4
,(CASE 
WHEN V_INC_CAPTURA in (''2'') THEN '''' 
WHEN V_INC_CAPTURA in (''9'') THEN '''' 
ELSE ''12'' END) as V_CLAVE_AJUSTE
,(CASE 
WHEN V_INC_CAPTURA in (''2'') THEN ''31'' 
WHEN V_INC_CAPTURA in (''9'') THEN ''09'' 
ELSE '''' END) as V_INCIDENCIA
,'''' as V_FOLIO_SICOFI
,V_FOLIO_P1_OBSERVACION as V_OBSERVACION
FROM [sirecaemisiones].[dbo].['+@DBO+']
WHERE V_SUBDEL='''+@SUBDEL+'''
and V_FOLIO_P1='''+@FOLIO+''' and year(V_FECHA_P1_TURNADO)='+@ANIO+'
'+ @WHERE_INC +' 
union all
SELECT top '+ @ROWS_MAX +' 0 as V_N
,''- - - - -'' as FECHA_DILI
,''- - - - -'' as V_ORI_MUL,0 as V_IMPORTE_TOT,0 as V_NUM_CREDITOS,''- - - - -'' as V_REGPAT,''- - - - -'' as V_CREDITO,''- - - - -'' as V_PERIODO,0 as V_IMPORTE
,'''+@ELABORO+''' as V_ELABORO,''- - - - -'' as FOLIO_ELABORO,''- - - - -'' as V_RECIBE,''- - - - -'' as V_TIPO_ECO,''- - - - -'' as V_DELEGACION,''- - - - -'' as V_SUBDELEGACION
,'''+@JOF_EMI+''' as V_JEFE_OFI_EMISION,NULL as V_FECHA_TURNO,''- - - - -'' as V_CEDULA_CAP3,''- - - - -'' as V_CEDULA_CAP4,''- - - - -'' as V_CLAVE_AJUSTE,''- - - - -'' as V_INCIDENCIA
,''- - - - -'' as V_FOLIO_SICOFI
,'''+@OBSERVACION+''' as V_OBSERVACION
FROM [sirecaemisiones].[dbo].[F_FILL]
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="vsubdel" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="folio" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vinc" />
                <asp:QueryStringParameter DefaultValue="2014" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="vfechacaptura" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" QueryStringField="eco" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

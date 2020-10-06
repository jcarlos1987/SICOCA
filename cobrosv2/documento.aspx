<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="documento.aspx.vb" Inherits="WebSIRECA.documento1" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SICOCA</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportSource ID="CrystalReportSourceDoc" runat="server">
            <Report FileName="citatoriov2.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceCabecera" 
                        TableName="PaeCabecera" />
                    <CR:DataSourceRef DataSourceID="SqlDataSourceCreditos" TableName="PaeCredito" />
                    <CR:DataSourceRef DataSourceID="SqlDataSourceActRec" TableName="PaeActRec" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceCabecera" runat="server" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CREDITO_CODEBAR as VARCHAR(50)
DECLARE @REGPAT as VARCHAR(15)
DECLARE @DOMICILIO as VARCHAR(500)
DECLARE @SELLO_SUPLENTE as VARCHAR(15)
SET @SUBDEL = ?
SET @CREDITO_CODEBAR = ?
SET @DOMICILIO=?
SET @SELLO_SUPLENTE=?
SET @REGPAT=(case 
when charindex('!',@CREDITO_CODEBAR)=0 then @CREDITO_CODEBAR
else (SELECT TOP 1 (SELECT TOP 1 replace([CQ_DATO1],'REG. PATRONAL:$','') FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring([HA_ID_CODEBAR],1,charindex('!',[HA_ID_CODEBAR])-1))
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_ID_CODEBAR]=@CREDITO_CODEBAR)
end)

exec('
SELECT sector AS SECTOR
,(sirecacobros.dbo.tipoPersona(rfc,razonSocial)) as TIPO_PERSONA
,regpat AS REGPAT
,rfc AS RFC
,(CASE WHEN '''+@DOMICILIO+''' NOT IN (''X'',''x'') THEN '''+@DOMICILIO+''' else dom END) AS DOMICILIO
,(case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end) AS LOCALIDAD
,(case when len(loc)=40 then substring(loc,len(loc)-5,6) else '''' end) as CP
,act AS ACTIVIDAD
,razonSocial AS RAZON_SOCIAL
,cotiz AS COTIZANTES
,vigencia AS ULTIMA_EMI

,(SELECT TOP 1 [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as delegaNom
,(SELECT TOP 1 [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as subdelNom
,(SELECT TOP 1 [CT_DOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as subdelDomicilio
,(SELECT TOP 1 [CT_INCISO_TIPO] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as incisoab
,(SELECT TOP 1 [CT_JEF_OFI_COBROS] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as jefaOficCobros
,(SELECT TOP 1 [CT_INSPECTORES_ALL] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as inspectoresLista
,(SELECT TOP 1 [CT_RFC_JEF_OFI_COBROS] FROM [sireca].[dbo].[catalogodelegacional] where [CT_SUBDEL]='''+@SUBDEL+''') as rfcJefOfic
,'''+ @SELLO_SUPLENTE +''' as selloSuplente
from sireca.dbo.patrones WHERE regpat='''+@REGPAT+'''
')
" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="s" />
                <asp:QueryStringParameter DefaultValue="RRRRRRR999999" Name="?" 
                    QueryStringField="r" />
                <asp:QueryStringParameter DefaultValue="x" Name="?" QueryStringField="dom" />
                <asp:QueryStringParameter DefaultValue="1" Name="?" QueryStringField="ss" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCreditos" runat="server" SelectCommand="DECLARE @REGPAT AS VARCHAR(15)
DECLARE @TIPO_COP_RCV AS VARCHAR(3)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO_DOC AS VARCHAR(50)
DECLARE @CIT_DOC AS VARCHAR(50)
DECLARE @ID_INSPECTOR AS VARCHAR(20)
DECLARE @FECHA_ASIG AS VARCHAR(20)
DECLARE @ROWS_MAX INT
DECLARE @NUM_CREDITOS INT
DECLARE @TD AS VARCHAR(1)
DECLARE @CODE_QR AS VARCHAR(50)
DECLARE @CODE_BAR AS VARCHAR(50)
DECLARE @FOLIOX AS VARCHAR(50)
DECLARE @CODBAR AS VARCHAR(50)

SET @REGPAT=?
SET @TIPO_COP_RCV=?
SET @SUBDEL=?
SET @TIPO_DOC=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG=?
SET @CIT_DOC=?
SET @CODBAR=?


SET @FOLIOX=(CASE 
WHEN @TIPO_DOC IN ('mandamiento') THEN 'R_FOLIO_MANDAMIENTO'
WHEN @TIPO_DOC IN ('ampliacion') THEN 'R_FOLIO_AMPLIACION'
ELSE 'R_FOLIO_MANDAMIENTO' 
END)
----------------------------------
SET @TD=(CASE
WHEN @TIPO_DOC='citatorio' THEN 'C'
WHEN @TIPO_DOC='mandamiento' THEN 'M'
WHEN @TIPO_DOC='ampliacion' THEN 'A'
WHEN @TIPO_DOC='remocion' THEN 'R'
else 'J'
END)
------------------------
SET @ROWS_MAX=(case 
WHEN @TIPO_DOC IN ('citatorio') THEN 20
WHEN @TIPO_DOC IN ('mandamiento') THEN 18
WHEN @TIPO_DOC IN ('ampliacion') THEN 30
WHEN @TIPO_DOC IN ('remocion') THEN 38
WHEN @TIPO_DOC IN ('cerrajero') THEN 20
end)
SET @NUM_CREDITOS=(CASE 
WHEN @TIPO_DOC IN ('citatorio') AND @CIT_DOC='M' THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CIT_SUP]='1' AND [D_MAN_SUP]='1')
WHEN @TIPO_DOC IN ('citatorio') AND @CIT_DOC='A' THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CIT_SUP]='1' AND [D_AMP_SUP]='1')
WHEN @TIPO_DOC IN ('citatorio') AND @CIT_DOC='R' THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CIT_SUP]='1' AND [D_REM_SUP]='1')
WHEN @TIPO_DOC IN ('citatorio') AND @CIT_DOC='J' THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CIT_SUP]='1' AND [D_CER_SUP]='1')

WHEN @TIPO_DOC IN ('mandamiento') THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_MAN_SUP]='1')
WHEN @TIPO_DOC IN ('ampliacion') THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_AMP_SUP]='1')
WHEN @TIPO_DOC IN ('remocion') THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_REM_SUP]='1')
WHEN @TIPO_DOC IN ('cerrajero') THEN
(SELECT COUNT(*) FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CER_SUP]='1')
END)
SET @NUM_CREDITOS=@NUM_CREDITOS/2
SET @ROWS_MAX=(select case when @NUM_CREDITOS&gt;@ROWS_MAX then @ROWS_MAX-(@NUM_CREDITOS-((@NUM_CREDITOS/@ROWS_MAX)*@ROWS_MAX))
else @ROWS_MAX-@NUM_CREDITOS end)
-------------------------
SET @CODE_BAR=(@CODBAR+@TD)
-------------------------
SET @CODE_QR=(CASE 
WHEN @TIPO_DOC IN ('citatorio') THEN
(SELECT TOP 1 CODE_QR FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CIT_SUP]='1')
WHEN @TIPO_DOC IN ('mandamiento') THEN
(SELECT TOP 1 CODE_QR FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_MAN_SUP]='1')
WHEN @TIPO_DOC IN ('ampliacion') THEN
(SELECT TOP 1 CODE_QR FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_AMP_SUP]='1')
WHEN @TIPO_DOC IN ('remocion') THEN
(SELECT TOP 1 CODE_QR FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_REM_SUP]='1')
WHEN @TIPO_DOC IN ('cerrajero') THEN
(SELECT TOP 1 CODE_QR FROM [sirecacobros].[dbo].[PAE_CRED]
where activo=1111 and CODE_BAR=@CODBAR and [R_REGPATR]=@REGPAT and [FECH_INS] is not null AND [R_TIPO] LIKE @TIPO_COP_RCV 
AND ID_INS=@ID_INSPECTOR AND CONVERT(VARCHAR(10),FECH_INS,103)=@FECHA_ASIG AND [D_CER_SUP]='1')
END)
-------------------------

SET @TIPO_DOC=(case 
when @TIPO_DOC='citatorio' and @CIT_DOC='M' then ' and D_CIT_SUP=1 and D_MAN_SUP=1 '
when @TIPO_DOC='citatorio' and @CIT_DOC='A' then ' and D_CIT_SUP=1 and D_AMP_SUP=1 '
when @TIPO_DOC='citatorio' and @CIT_DOC='R' then ' and D_CIT_SUP=1 and D_REM_SUP=1 '
when @TIPO_DOC='citatorio' and @CIT_DOC='J' then ' and D_CIT_SUP=1 and D_CER_SUP=1 '

when @TIPO_DOC='mandamiento' then ' and D_MAN_SUP=1 '
when @TIPO_DOC='ampliacion' then ' and D_AMP_SUP=1 '
when @TIPO_DOC='remocion' then ' and D_REM_SUP=1 '
when @TIPO_DOC='cerrajero' then ' and D_CER_SUP=1 '
else ' and D_CIT_SUP=9 '
end)

exec('
DECLARE @FOLIO AS VARCHAR(50)
SET @FOLIO=(SELECT TOP 1 '+@FOLIOX+'+CONVERT(VARCHAR(4),YEAR(FECH_DOC)) FROM [sirecacobros].[dbo].[PAE_CRED]
where replace(R_REGPATR,''-'','''')='''+@REGPAT+''' AND ACTIVO=1111
AND R_TIPO like '''+@TIPO_COP_RCV+''' AND R_SUBDEL='''+@SUBDEL+''' and ID_INS='''+@ID_INSPECTOR+'''
AND CODE_BAR='''+@CODBAR+''' AND CONVERT(VARCHAR(10),FECH_INS,103)='''+@FECHA_ASIG+'''
'+@TIPO_DOC+')

SELECT 
'''+@CIT_DOC+''+@ID_INSPECTOR+'''  AS X
,R1_NUMCRED,R1_IMPORTE,substring(R1_PERIODO,4,7) as R1_PERIODO
,isnull(R2_NUMCRED,'''') as R2_NUMCRED
,R2_IMPORTE as R2_IMPORTE
,isnull(substring(R2_PERIODO,4,7),'''') as R2_PERIODO
,R_TIPO as R_TIPO,R_REGPATR,FECH_INS,FECH_DOC,ID_SUP,ID_INS,CODE_BAR+'''+@TD+''' as CODE_BAR,CODE_QR
,@FOLIO as R_FOLIO_MANDAMIENTO
from 
(select (ROW_NUMBER() OVER(order by convert(datetime,[R_PERIODO],103))) as R1_TAB
,R_NUMCRED as R1_NUMCRED,R_IMPORTE as R1_IMPORTE,R_PERIODO as R1_PERIODO 
,R_TIPO,R_REGPATR,FECH_INS,FECH_DOC,ID_SUP,CODE_BAR,CODE_QR,R_FOLIO_MANDAMIENTO,anio
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=ID_INS) as ID_INS
from (
	SELECT 
	((ROW_NUMBER() OVER(order by convert(datetime,[R_PERIODO],103)))%2) as tabla
	,[R_NUMCRED],[R_IMPORTE],[R_PERIODO]
	,R_TIPO,R_REGPATR,FECH_INS,FECH_DOC,ID_SUP,ID_INS,CODE_BAR,CODE_QR,R_FOLIO_MANDAMIENTO,year(FECH_DOC) as anio
	FROM [sirecacobros].[dbo].[PAE_CRED]
	where replace(R_REGPATR,''-'','''')='''+@REGPAT+''' AND ACTIVO=1111
AND R_TIPO like '''+@TIPO_COP_RCV+''' AND R_SUBDEL='''+@SUBDEL+''' and CODE_BAR='''+@CODBAR+''' and ID_INS='''+@ID_INSPECTOR+'''
AND CONVERT(VARCHAR,FECH_INS,103)='''+@FECHA_ASIG+'''
'+@TIPO_DOC+'
	) as tb1
	where tb1.tabla=1
) as tbl1
left join
(select (ROW_NUMBER() OVER(order by convert(datetime,[R_PERIODO],103))) as R2_TAB
,R_NUMCRED as R2_NUMCRED,R_IMPORTE as R2_IMPORTE,R_PERIODO as R2_PERIODO 
from (
	SELECT 
	((ROW_NUMBER() OVER(order by convert(datetime,[R_PERIODO],103)))%2) as tabla
	,[R_NUMCRED],[R_IMPORTE],[R_PERIODO]
	FROM [sirecacobros].[dbo].[PAE_CRED]
	where replace(R_REGPATR,''-'','''')='''+@REGPAT+''' AND ACTIVO=1111
AND R_TIPO like '''+@TIPO_COP_RCV+''' AND R_SUBDEL='''+@SUBDEL+''' and CODE_BAR='''+@CODBAR+''' and ID_INS='''+@ID_INSPECTOR+'''
AND CONVERT(VARCHAR,FECH_INS,103)='''+@FECHA_ASIG+'''
'+@TIPO_DOC+'
	) as tb2
	where tb2.tabla=0
) as tbl2
on R2_TAB=R1_TAB
union all
SELECT top '+ @ROWS_MAX +' 
'''+@CIT_DOC+''+@ID_INSPECTOR+''' AS X,'''' as R1_NUMCRED,'''' as R1_IMPORTE,'''' as R1_PERIODO,'''' as R2_NUMCRED,'''' as R2_IMPORTE,'''' as R2_PERIODO,'''+@TIPO_COP_RCV+''' as R_TIPO,'''' as R_REGPATR,'''+@FECHA_ASIG+''' as FECH_INS,'''' as FECH_DOC,'''' as ID_SUP,'''' as ID_INS,'''+@CODE_BAR+''' as CODE_BAR,'''+@CODE_QR+''' as CODE_QR,@FOLIO as R_FOLIO_MANDAMIENTO
FROM [sirecaemisiones].[dbo].[F_FILL]
')
" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="RRRRRR99999" Name="?" 
                    QueryStringField="r" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" QueryStringField="tp" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="s" />
                <asp:QueryStringParameter DefaultValue="invalido" Name="?" 
                    QueryStringField="d" />
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="inspec" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fecha" />
                <asp:QueryStringParameter DefaultValue="X" Name="?" QueryStringField="citdoc" />
                <asp:QueryStringParameter DefaultValue="CODIGODEBARRA" Name="?" 
                    QueryStringField="codbar" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSourceActRec" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @REGPAT AS VARCHAR(15)
DECLARE @TIPO_COP_RCV AS VARCHAR(3)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO_DOC AS VARCHAR(50)
DECLARE @TD AS VARCHAR(1)
DECLARE @ID_INSPECTOR AS VARCHAR(20)
DECLARE @FECHA_ASIG AS VARCHAR(20)
DECLARE @CIT_DOC AS VARCHAR(50)

SET @REGPAT=?
SET @TIPO_COP_RCV=?
SET @SUBDEL=?
SET @TIPO_DOC=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG=?
SET @CIT_DOC=?

SET @TD=(CASE 
WHEN @TIPO_DOC='citatorio' THEN 'C'
WHEN @TIPO_DOC='mandamiento' THEN 'M'
WHEN @TIPO_DOC='ampliacion' THEN 'A'
WHEN @TIPO_DOC='remocion' THEN 'R'
else 'J'
END)

SET @TIPO_DOC=(case 
when @TIPO_DOC='citatorio' and @CIT_DOC='M' then ' and D_CIT_SUP=1 and D_MAN_SUP=1 '
when @TIPO_DOC='citatorio' and @CIT_DOC='A' then ' and D_CIT_SUP=1 and D_AMP_SUP=1 '
when @TIPO_DOC='citatorio' and @CIT_DOC='R' then ' and D_CIT_SUP=1 and D_REM_SUP=1 '
when @TIPO_DOC='citatorio' and @CIT_DOC='J' then ' and D_CIT_SUP=1 and D_CER_SUP=1 '
when @TIPO_DOC='mandamiento' then ' and D_MAN_SUP=1 '
when @TIPO_DOC='ampliacion' then ' and D_AMP_SUP=1 '
when @TIPO_DOC='remocion' then ' and D_REM_SUP=1 '
when @TIPO_DOC='cerrajero' then ' and D_CER_SUP=1 '
else ' and D_CIT_SUP=9 '
end)
exec('
SELECT 

SUM(R_IMPORTE) AS R_IMPORTE
,SUM(ACT) AS ACT
,SUM(REC) AS REC
,(case when (SUM(R_IMPORTE)+SUM(ACT)+SUM(REC))&gt;19001 then (SUM(R_IMPORTE)+SUM(ACT)+SUM(REC))*0.02 else 380.00 end) as GASTOS_EJECUCION
,(SUM(R_IMPORTE)+SUM(ACT)+SUM(REC)+(case when (SUM(R_IMPORTE)+SUM(ACT)+SUM(REC))&gt;19001 then (SUM(R_IMPORTE)+SUM(ACT)+SUM(REC))*0.02 else 380 end)) as TOTAL

FROM (
SELECT
R_NUMCRED,R_IMPORTE,R_PERIODO
,(case
when R_TIPO in (''RCV'') then R_IMPORTE*(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] 
WHERE month(''01/''+[PERIODO])=(month(''01/''+[R_PERIODO])*2) and year(''01/''+[PERIODO])=year(''01/''+[R_PERIODO])
)
ELSE R_IMPORTE*(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] WHERE [PERIODO]=[R_PERIODO])
end
) as ACT
,(case
when R_TIPO in (''RCV'') then
(
	case when R_TD in (''08'',''80'',''81'',''82'') then 0 else
	(
		(
			(R_IMPORTE*(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] WHERE month(''01/''+[PERIODO])=(month(''01/''+[R_PERIODO])*2) and year(''01/''+[PERIODO])=year(''01/''+[R_PERIODO]))+R_IMPORTE)
		*(SELECT TOP 1 [REC] FROM [sirecacobros].[dbo].[tabActRec] WHERE month(''01/''+[PERIODO])=(month(''01/''+[R_PERIODO])*2) and year(''01/''+[PERIODO])=year(''01/''+[R_PERIODO]))
		)/100
	)
	end
) 
else
(
	case when R_TD in (''08'',''80'',''81'',''82'') then 0 else
	(
		(
			(R_IMPORTE*(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] WHERE [PERIODO]=[R_PERIODO])+R_IMPORTE)
		*(SELECT TOP 1 [REC] FROM [sirecacobros].[dbo].[tabActRec] WHERE [PERIODO]=[R_PERIODO])
		)/100
	) 
	end
) 
end
)as REC
,R_TD,R_INC,R_FNOTIFICACION,R_TIPO
from (
	SELECT 
	[R_NUMCRED],[R_IMPORTE],substring([R_PERIODO],4,7) as R_PERIODO,R_TD,R_INC,R_FNOTIFICACION,R_TIPO
	FROM [sirecacobros].[dbo].[PAE_CRED]
	where replace(R_REGPATR,''-'','''')='''+@REGPAT+''' AND ACTIVO=1111
	AND R_TIPO like '''+@TIPO_COP_RCV+''' AND R_SUBDEL='''+@SUBDEL+''' and ID_INS='''+@ID_INSPECTOR+'''
	AND CONVERT(VARCHAR,FECH_INS,103)='''+@FECHA_ASIG+'''
	'+@TIPO_DOC+'
) as tb2
) AS RR
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="RRRRRR99999" Name="?" 
                    QueryStringField="r" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" QueryStringField="tp" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="s" />
                <asp:QueryStringParameter DefaultValue="invalido" Name="?" 
                    QueryStringField="d" />
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="inspec" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fecha" />
                <asp:QueryStringParameter DefaultValue="M" Name="?" QueryStringField="citdoc" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="Panel1" runat="server">
        <center>
            <asp:Label ID="L1" runat="server"></asp:Label><br />
            <asp:Label ID="L2" runat="server"></asp:Label><br />
            <asp:Label ID="L3" runat="server"></asp:Label><br />
            <asp:Label ID="L4" runat="server"></asp:Label><br />
            <div class="btn-group input-prepend">
            <span class="add-on text-error">
            ASIGNACIÓN PARA EL
            </span>
            <asp:TextBox ID="TBFecha" runat="server" CssClass="text-center" MaxLength="10" Width="100px"></asp:TextBox>
            <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFecha">
            </asp:CalendarExtender>
            </div>
<asp:Panel ID="Panel2" runat="server" CssClass="well" Width="500">
        <asp:GridView ID="GridViewInspectores" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceInspectores" HorizontalAlign="Center" 
            ShowHeader="False" CssClass="table-hover" GridLines="Horizontal" 
                AllowPaging="True" PageSize="2">
            <Columns>
                <asp:TemplateField HeaderText="valor" SortExpression="valor">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" CssClass="img-polaroid" ImageUrl='<%# "~/imagenes/usuarios/avatar/" & Eval("valor") & ".jpg" %>' />
                        
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="texto" SortExpression="texto">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("texto") %>'></asp:Label>
                        <br />PATRONES:<asp:Label ID="Label3" runat="server" Text='<%# Eval("PATRONES","{0:N0}") %>'></asp:Label>
                        <br />CREDITOS:<asp:Label ID="Label4" runat="server" Text='<%# Eval("CREDITOS","{0:N0}") %>'></asp:Label>
                        <br />IMPORTE:<asp:Label ID="Label2" runat="server" Text='<%# Eval("IMPORTE","{0:C}") %>'></asp:Label>
                        <asp:LinkButton ID="LBAsignar" CommandArgument='<%# Eval("valor") %>' runat="server" 
                            CssClass="label label-info form-inline" onclick="LBAsignar_Click" >Asignar</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle Font-Size="12pt" HorizontalAlign="Center" />
        </asp:GridView>    
        <asp:SqlDataSource ID="SqlDataSourceInspectores" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
SET @SUBDEL=?
SELECT us.[id] as valor
,upper(uf.nombre) as texto
,ISNULL(REGPATR,0) as PATRONES
,ISNULL(CREDITOS,0) as CREDITOS
,ISNULL(IMPORTE,0) as IMPORTE
FROM [sireca].[dbo].[usuarios] as us 
left join 
fiscamovil.dbo.usuarios as uf on us.id=uf.id
left join 
(SELECT [ID_INS] as INSPECTOR
,count(distinct [R_REGPATR]) as REGPATR
,count([R_NUMCRED]) as CREDITOS
,sum([R_IMPORTE]) as IMPORTE
FROM [sirecacobros].[dbo].[PAE_CRED]
where [ACTIVO]=1111
--AND convert(varchar,[FECH_SUP],103)=convert(varchar,getdate(),103)
AND R_SUBDEL=@SUBDEL
group by [ID_INS]) as ca on ca.INSPECTOR=uf.id
where us.[userPae2]='1' and us.subdel=@SUBDEL
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="s" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Panel>
</center>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

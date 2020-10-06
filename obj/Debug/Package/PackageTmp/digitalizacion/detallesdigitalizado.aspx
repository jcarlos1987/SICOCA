<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="detallesdigitalizado.aspx.vb" Inherits="WebSIRECA.detallesdigitalizado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALE1 as VARCHAR(50)
DECLARE @RALE2 as VARCHAR(50)
DECLARE @RALE_RCV1 as VARCHAR(50)
DECLARE @RALE_RCV2 as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(50)
DECLARE @DIGITALIZADO as VARCHAR(50)
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @RALE1=?
SET @DIGITALIZADO=?

SET @RALE2=replace(@RALE1,'33A','01A')
SET @RALE_RCV1=REPLACE(@RALE1,'ACOP','ARCV')
SET @RALE_RCV2=REPLACE(@RALE2,'ACOP','ARCV')

IF @DIGITALIZADO&lt;&gt;'%'
BEGIN
	SET @DIGITALIZADO=' WHERE DIGITALIZADO = '''+@DIGITALIZADO+''''
END

if @RALE1='x' or @RALE2='x'
begin
select '' AS DIGITALIZADO,'' as PATRONES,'' as CREDITOS,'' as IMPORTE
end
else
begin
exec('
SELECT 
DIGITALIZADO,resultado2.SUBDEL,TIPO,INC,NUMCRED,IMPORTE,sector as SECTOR
,regpat as REGPAT,razonSocial as RAZON,dom as DOMICILIO,loc as LOCALIDAD,cotiz as COTIZANTES
 FROM (
select
SUBDEL,TIPO,INC,REGPATR,NUMCRED,IMPORTE
,(CASE WHEN DIG_TIPO IS NULL THEN ''NO'' ELSE ''SI'' END) AS DIGITALIZADO
from (
SELECT
''33'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE1+'] 
where inc not in (''00'')
union all
SELECT
''01'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE2+'] 
where inc not in (''00'')
UNION ALL
SELECT
''33'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE_RCV1+'] 
where inc not in (''00'')
union all
SELECT
''01'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE_RCV2+'] 
where inc not in (''00'')
) as resultado 
left join [sireca].[dbo].[CD_DIGITALIZADO] 
on [DIG_REGPAT]=REPLACE(REGPATR,''-'','''') and [DIG_CREDITO]=NUMCRED
WHERE TIPO LIKE '''+@TIPO_COP_RCV+'''
AND SUBDEL LIKE '''+@SUBDEL+'''
) AS resultado2 left join sireca.dbo.patrones on regpat=replace(regpatr,''-'','''')
'+ @DIGITALIZADO +'
')
end
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="01" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="%" Name="?" 
                QueryStringField="tipocoprcv" />
            <asp:QueryStringParameter DefaultValue="abcdef" Name="?" 
                QueryStringField="rale" />
            <asp:QueryStringParameter DefaultValue="SI" Name="?" QueryStringField="digi" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

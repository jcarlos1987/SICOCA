<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="analisis.aspx.vb" Inherits="WebSIRECA.analisis1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportSource ID="CrystalReportSourceAnalisis" runat="server">
            <Report FileName="analisis.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceAnalisis" 
                        TableName="CREDITOS_COP_RCV" />
                    <CR:DataSourceRef DataSourceID="SqlDataSourceGeneral" 
                        TableName="INFO_GENERAL" />
                    <CR:DataSourceRef DataSourceID="SqlDataSourceExtra" TableName="DATOS_EXTRA" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceAnalisis" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ROWS_ADD_COP AS INT
DECLARE @ROWS_ADD_RCV AS INT
DECLARE @NUM_CREDITOS_COP AS INT
DECLARE @NUM_CREDITOS_RCV AS INT
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
SET @SUBDEL=?
SET @REGPAT=?
SET @RALECOP=?
SET @RALERCV=?

SET @ROWS_ADD_COP=?
SET @ROWS_ADD_RCV=@ROWS_ADD_COP
--Datos requeridos @NUM_CREDITOS_COP y @NUM_CREDITOS_RCV
SET @NUM_CREDITOS_COP=?
SET @NUM_CREDITOS_RCV=?
SET @ROWS_ADD_COP=(select case when @NUM_CREDITOS_COP&gt;@ROWS_ADD_COP then @ROWS_ADD_COP-(@NUM_CREDITOS_COP-((@NUM_CREDITOS_COP/@ROWS_ADD_COP)*@ROWS_ADD_COP))
else @ROWS_ADD_COP-@NUM_CREDITOS_COP end)
SET @ROWS_ADD_RCV=(select case when @NUM_CREDITOS_RCV&gt;@ROWS_ADD_RCV then @ROWS_ADD_RCV-(@NUM_CREDITOS_RCV-((@NUM_CREDITOS_RCV/@ROWS_ADD_RCV)*@ROWS_ADD_RCV))
else @ROWS_ADD_RCV-@NUM_CREDITOS_RCV end)
--

--SELECT @ROWS_ADD_COP AS COP_FALTANTES,@ROWS_ADD_RCV AS RCV_FALTANTES
--DETALLE DE LOS CREDITOS
exec('
select rale_cop.N,'''+@REGPAT+''' AS REGPATR,CREDITO_COP,PERIODO_COP,IMPORTE_COP,CREDITO_RCV,PERIODO_RCV,IMPORTE_RCV 
from 
(
select ROW_NUMBER() OVER (order by TIPO,convert(datetime,''01/''+ISNULL(PERIODO,''01/''+convert(varchar(4),year(dateadd(year,1,getdate())))),103)) as N
,TIPO as TIPO_COP,NUMCRED as CREDITO_COP,ISNULL(PERIODO,''- - - - -'') as PERIODO_COP,IMPORTE AS IMPORTE_COP
from (
select ''COP'' as TIPO,replace(REGPATR,''-'','''') as REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,INC,FEINC,IMPORTE,substring(PERIODO,4,7) as PERIODO from rale.dbo.['+@RALECOP+']
where mov=''2'' and inc=''09''
union all
select top '+@ROWS_ADD_COP+' ''COP'' as TIPO,''- - - - -'' as REGPATR,''- - - - -'' as MOV,''- - - - -'' as FMOV,''- - - - -'' as SECTOR,''- - - - -'' as NUMCRED,''- - - - -'' as TD,''- - - - -'' as FALTA,''- - - - -'' as INC,''- - - - -'' as FEINC,0.00 as IMPORTE,NULL as PERIODO from [sirecaemisiones].[dbo].[F_FILL]
) as rale
where (rale.REGPATR = '''+@REGPAT+''' or rale.REGPATR in (''- - - - -''))
) as rale_cop
left join
(
select ROW_NUMBER() OVER (order by TIPO,convert(datetime,''01/''+ISNULL(PERIODO,''01/''+convert(varchar(4),year(dateadd(year,1,getdate())))),103)) as N
,TIPO as TIPO_RCV,NUMCRED as CREDITO_RCV,ISNULL(PERIODO,''- - - - -'') as PERIODO_RCV,IMPORTE AS IMPORTE_RCV
from (
select ''RCV'' as TIPO,replace(REGPATR,''-'','''') as REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,INC,FEINC,IMPORTE,substring(PERIODO,4,7) as PERIODO from rale.dbo.['+@RALERCV+']
where mov=''2'' and inc=''09''
union all
select top '+@ROWS_ADD_RCV+' ''RCV'' as TIPO,''- - - - -'' as REGPATR,''- - - - -'' as MOV,''- - - - -'' as FMOV,''- - - - -'' as SECTOR,''- - - - -'' as NUMCRED,''- - - - -'' as TD,''- - - - -'' as FALTA,''- - - - -'' as INC,''- - - - -'' as FEINC,0.00 as IMPORTE,NULL as PERIODO from [sirecaemisiones].[dbo].[F_FILL]
) as rale
where (rale.REGPATR = '''+@REGPAT+''' or rale.REGPATR in (''- - - - -''))
) as rale_rcv on rale_cop.n=rale_rcv.n
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="999999999" Name="?" 
                    QueryStringField="regpat" />
                <asp:QueryStringParameter DefaultValue="xxxxxxx" Name="?" 
                    QueryStringField="ralecop" />
                <asp:QueryStringParameter DefaultValue="xxxxxxx" Name="?" 
                    QueryStringField="ralercv" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="credmax" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="credcop" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="credrcv" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceGeneral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
DECLARE @ID_INTEGRADOR as VARCHAR(10)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @CRED_MAX as INT
SET @SUBDEL=?
SET @REGPAT=?
SET @ID_INTEGRADOR=?
SET @CRED_MAX=?

SET @RALECOP=?
SET @RALERCV=?
exec('
if exists(select * from tempdb.dbo.sysobjects where name = ''registros_doc'+@ID_INTEGRADOR+@SUBDEL+''') 
begin 
drop table [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
end 
select rale.* 
into tempdb.dbo.[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
from (
select ''COP'' as TIPO,replace(REGPATR,''-'','''') as REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,INC,FEINC,IMPORTE,substring(PERIODO,4,7) as PERIODO from rale.dbo.['+@RALECOP+']
union all
select ''RCV'' as TIPO,replace(REGPATR,''-'','''') as REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,INC,FEINC,IMPORTE,substring(PERIODO,4,7) as PERIODO from rale.dbo.['+@RALERCV+']
) as rale
')
exec('
select
'+@CRED_MAX+' as G_CRED_MAX
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]='''+@SUBDEL+''') AS G_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]='''+@SUBDEL+''') AS G_SUBDELEGACION
,FECH_MOV AS G_FECH_MOV
,razonSocial as G_RAZON
,[REGPATR] as G_REGPAT
,RFC AS G_RFC
,act as G_ACTIVIDAD
,dom AS G_DOMICILIO
,IMPORTE_TOTAL_LETRAS AS G_IMPORTE_TOTAL_LETRAS

,(SELECT ''C. ''+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_DEP'' and uf.subdel='''+@SUBDEL+''') AS G_JEF_DEP
,(SELECT upper(nom_iniciales)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_DEP'' and uf.subdel='''+@SUBDEL+''') AS G_INI_JEF_DEP

,(SELECT ''C. ''+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_OFI_REGI'' and uf.subdel='''+@SUBDEL+''') AS G_JEF_OFI_REG
,(SELECT upper(nom_iniciales)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_OFI_REGI'' and uf.subdel='''+@SUBDEL+''') AS G_INI_JEF_OFI_REG


,(SELECT ''C. ''+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_OFI_EMIS'' and uf.subdel='''+@SUBDEL+''') AS G_JEF_OFI_EMI
,(SELECT upper(nom_iniciales)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_OFI_EMIS'' and uf.subdel='''+@SUBDEL+''') AS G_INI_JEF_OFI_EMI

,(SELECT ''C. ''+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_OFI_COBR'' and uf.subdel='''+@SUBDEL+''') AS G_JEF_OFI_COB
,(SELECT upper(nom_iniciales)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''JFE_OFI_COBR'' and uf.subdel='''+@SUBDEL+''') AS G_INI_JEF_OFI_COB

,(SELECT ''C. ''+upper(nombre)
FROM fiscamovil.dbo.usuarios as uf 
WHERE uf.subdel='''+@SUBDEL+''' and uf.id='''+@ID_INTEGRADOR+''') AS G_INTEGRADOR
,(SELECT lower(nom_iniciales)
FROM fiscamovil.dbo.usuarios as uf 
WHERE uf.subdel='''+@SUBDEL+''' and uf.id='''+@ID_INTEGRADOR+''') AS G_INI_INTEGRADOR
,(SELECT upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''DELEGADO'' and uf.subdel='''+@SUBDEL+''') as G_NOM_DELEGADO
,(SELECT upper(nom_iniciales)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]=''DELEGADO'' and uf.subdel='''+@SUBDEL+''') AS G_INI_NOM_DELEGADO
from (
SELECT [REGPATR],[FMOV] as FECH_MOV,sirecacobros.dbo.CantidadEnLetra(SUM([IMPORTE])) as IMPORTE_TOTAL_LETRAS
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
where mov=''2'' and inc=''09'' and [REGPATR]='''+@REGPAT+'''
group by [REGPATR],[FMOV]
) as rale
left join sireca.dbo.patrones as ptn on ptn.regpat=rale.regpatr
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="99999999" Name="?" 
                    QueryStringField="regpat" />
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="integrador" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="credmax" />
                <asp:QueryStringParameter DefaultValue="xxxxxxx" Name="?" 
                    QueryStringField="ralecop" />
                <asp:QueryStringParameter DefaultValue="xxxxxxx" Name="?" 
                    QueryStringField="ralercv" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceExtra" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select top 1 * from [sirecaregistros].[dbo].[cancelacinesInfo]
where E_REGPAT=? and E_SUBDEL=?
order by E_ID desc">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="99999999" Name="?" 
                    QueryStringField="regpat" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

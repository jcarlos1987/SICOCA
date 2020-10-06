<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="documentopdf.aspx.vb" Inherits="WebSIRECA.documentopdf" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField ID="HFRegpat" runat="server" />
        <asp:HiddenField ID="HFSubdel" runat="server" />
        <asp:HiddenField ID="HFCopRcv" runat="server" />
        <asp:HiddenField ID="HFDoc" runat="server" />
        <asp:HiddenField ID="HFPersona" runat="server" />        
        <asp:HiddenField ID="HFInc01" runat="server" />
        <asp:HiddenField ID="HFInc02" runat="server" />
        <asp:HiddenField ID="HFInc31" runat="server" />
        <asp:HiddenField ID="HFInc32" runat="server" />
        <asp:HiddenField ID="HFInc43" runat="server" />
        
        <CR:CrystalReportSource ID="CrystalReportSourceDoc" runat="server">
            <Report FileName="citNotFisPAE.rpt">
            </Report>
        </CR:CrystalReportSource>
        
    <asp:SqlDataSource ID="SqlDataSourceDatosPatron" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
[subdel] AS SUBDEL
,[sector] AS SECTOR
,[regpat] AS REGPAT
,[rfc] AS RFC
,[dom] AS DOMICILIO
,case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end as LOCALIDAD
,case when len(loc)=40 then substring(loc,len(loc)-5,6) else '' end as CP
,[act] AS ACTIVIDAD
,[razonSocial] AS RAZONSOCIAL
,[cotiz] AS COTIZANTES
,CT_NOM_DEL AS DELNOM
,CT_NOM_SUBDEL AS SUBDELNOM
,CT_DOM_SUBDEL AS SUBDELDOM
FROM [sireca].[dbo].[patrones] LEFT JOIN sireca.dbo.catalogodelegacional ON CT_SUBDEL=?
WHERE REGPAT=substring(replace(?,'-',''),1,10)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HFSubdel" DefaultValue="00" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="HFRegpat" DefaultValue="GGGGGGGG" Name="?" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDatosPatron0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
[subdel] AS SUBDEL
,[sector] AS SECTOR
,[regpat] AS REGPAT
,[rfc] AS RFC
,[dom] AS DOMICILIO
,case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end as LOCALIDAD
,case when len(loc)=40 then substring(loc,len(loc)-5,6) else '' end as CP
,[act] AS ACTIVIDAD
,[razonSocial] AS RAZONSOCIAL
,[cotiz] AS COTIZANTES
,CT_NOM_DEL AS DELNOM
,CT_NOM_SUBDEL AS SUBDELNOM
,CT_DOM_SUBDEL AS SUBDELDOM

,[CT_NOM_SUBDEL_SHORT] as SUBDELNOM_SHORT
,[CT_JEF_OFI_COBROS] as JEF_OFI_COBROS
,[CT_RFC_JEF_OFI_COBROS] as RFC_JEF_OFI_COBROS
,[CT_INSPECTORES_ALL] as INSPECTORES_ALL
FROM [sireca].[dbo].[patrones] LEFT JOIN sireca.dbo.catalogodelegacional ON CT_SUBDEL=?
WHERE REGPAT=substring(replace(?,'-',''),1,10)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HFSubdel" DefaultValue="00" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="HFRegpat" DefaultValue="GGGGGGGG" Name="?" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCreditos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALE as VARCHAR(50)
DECLARE @RALE_TIPO as VARCHAR(50)
DECLARE @REGPAT as VARCHAR(15)
DECLARE @INC1 as VARCHAR(2)
DECLARE @INC2 as VARCHAR(2)
DECLARE @INC3 as VARCHAR(2)
DECLARE @INC4 as VARCHAR(2)
DECLARE @INC5 as VARCHAR(2)

SET @SUBDEL=?
SET @RALE_TIPO=?
SET @REGPAT=substring(replace(?,'-',''),1,10)
SET @INC1 =?
SET @INC2 =?
SET @INC3 =?
SET @INC4 =?
SET @INC5 =?

SET @RALE=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo=@RALE_TIPO order by fecha desc)
exec('
select 
'''+@RALE_TIPO+''' as TIPO
,r1.CREDITO as CREDITO1,r1.PERIODO as PERIODO1,r1.IMPORTE as IMPORTE1 
,r2.CREDITO as CREDITO2,r2.PERIODO as PERIODO2,r2.IMPORTE as IMPORTE2
from (select 
(ROW_NUMBER() OVER(order by convert(datetime,''01/''+[PERIODO],103))) as tabla1
,CREDITO,PERIODO,IMPORTE,TIPO
	from (
		SELECT 
		((ROW_NUMBER() OVER(order by convert(datetime,[PERIODO],103)))%2) as tabla
		,[NUMCRED] as CREDITO
		,substring([PERIODO],4,7) as [PERIODO]
		,[IMPORTE]      
		,[PERIODO] as [PERIODOOR]
        ,''COP'' as TIPO
		FROM [rale].[dbo].['+@RALE+']
		WHERE replace([REGPATR],''-'','''')='''+@REGPAT+'''
		and inc in ('''+@INC1+''','''+@INC2+''','''+@INC3+''','''+@INC4+''','''+@INC5+''')
	) as resultado
	where tabla=1
) as r1
left join 
(select 
(ROW_NUMBER() OVER(order by convert(datetime,''01/''+[PERIODO],103))) as tabla2
,CREDITO,PERIODO,IMPORTE,TIPO
	from (
	select ((ROW_NUMBER() OVER(order by convert(datetime,[PERIODOOR],103)))%2) as tabla, CREDITO,PERIODO,IMPORTE,TIPO
	from
	(
		SELECT 
		[NUMCRED] as CREDITO
		,substring([PERIODO],4,7) as [PERIODO]
		,[IMPORTE]      
		,[PERIODO] as [PERIODOOR]
        ,''COP'' as TIPO
		FROM [rale].[dbo].['+@RALE+']
		WHERE replace([REGPATR],''-'','''')='''+@REGPAT+'''
		and inc in ('''+@INC1+''','''+@INC2+''','''+@INC3+''','''+@INC4+''','''+@INC5+''')
	) as resultado
	) as resultado2
	where tabla=0
) as r2

on r1.tabla1=r2.tabla2
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="HFSubdel" DefaultValue="00" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter DefaultValue="COP" Name="?" ControlID="HFCopRcv" 
                PropertyName="Value" />
<asp:ControlParameter ControlID="HFRegpat" PropertyName="Value" DefaultValue="regpat" 
                Name="?"></asp:ControlParameter>
            <asp:ControlParameter ControlID="HFInc01" DefaultValue="--" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="HFInc02" DefaultValue="--" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="HFInc31" DefaultValue="--" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="HFInc32" DefaultValue="--" Name="?" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="HFInc43" DefaultValue="--" Name="?" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    </div>
    </form>
</body>
</html>

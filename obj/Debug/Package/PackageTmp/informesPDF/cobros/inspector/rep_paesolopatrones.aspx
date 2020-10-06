<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rep_paesolopatrones.aspx.vb" Inherits="WebSIRECA.rep_paesolopatrones" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0}*{color:#000!important;text-shadow:none!important;background:transparent!important;box-shadow:none!important}</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="reportediarioasignacionpaesolopatrones.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="SqlDataSource1" 
                    TableName="reportediariodiligenciadopatrones" />
            </DataSources>
        </Report>
    </CR:CrystalReportSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @DEL AS VARCHAR(2)
SET @DEL=?
select 
CONVERT(VARCHAR(10),ROW_NUMBER() OVER(order by LOCALIDAD)) as N
,*
FROM (
SELECT 
DISTINCT 
convert(varchar(10),CP_FECH_ASIG,103) AS FECH_ASIGNACIO
,[CP_REGPAT] as REGPAT
,razonSocial AS RAZONSOCIAL
,dom AS DOMICILIO
,loc AS LOCALIDAD
,sector AS SECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,(select [credencial] from sireca.dbo.usuarios where id=CP_INSPEC) as CREDENCIAL
,(SELECT [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=RA_SUBDEL) as DELNOM
,(SELECT [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=RA_SUBDEL) as SUBDELNOM
,(SELECT [CT_DOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=RA_SUBDEL) as SUBDELDOM
FROM [sirecacobros].[dbo].CO_CRED_ASIG LEFT JOIN sireca.dbo.patrones ON regpat=[CP_REGPAT]
where CP_INSPEC=?
and convert(varchar(10),CP_FECH_ASIG,103)=?
and  RA_SUBDEL=?
) as resultado
">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAdel" />
            <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                QueryStringField="inspector" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="fecha" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

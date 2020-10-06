<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rep_asigpatrones.aspx.vb" Inherits="WebSIRECA.rep_asigpatrones" %>

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
        <Report FileName="rep_asigpatronesrpt.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="SqlDataSource1" 
                    TableName="repAsigPatrones" />
            </DataSources>
        </Report>
    </CR:CrystalReportSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @DEL AS VARCHAR(2)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_INSPECTOR AS VARCHAR(50)
DECLARE @FECHA_ASIG AS DATETIME
SET @DEL=?
SET @SUBDEL=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG=?

SELECT CONVERT(VARCHAR(10),ROW_NUMBER() OVER(order by REGPAT)) as N,
FECH_ASIGNACIO,REGPAT,RAZONSOCIAL,DOMICILIO,LOCALIDAD,SECTOR 
,isnull((CASE
WHEN MIN(TIPO) IN ('COP') THEN (SELECT COUNT(R_IMPORTE) FROM [sirecacobros].[dbo].[PAE_CRED] AS TX
where convert(varchar,TX.[FECH_INS],103)=@FECHA_ASIG AND TX.R_TIPO='COP' AND TX.R_REGPATR=REGPAT
AND TX.[R_SUBDEL]=@SUBDEL AND TX.[ID_INS]=@ID_INSPECTOR AND TX.R_TD NOT IN ('08','80','81','82','83'))
END),0.00) AS CREDITO_COP
,isnull((CASE
WHEN MIN(TIPO) IN ('COP') THEN (SELECT SUM(R_IMPORTE) FROM [sirecacobros].[dbo].[PAE_CRED] AS TX
where convert(varchar,TX.[FECH_INS],103)=@FECHA_ASIG AND TX.R_TIPO='COP' AND TX.R_REGPATR=REGPAT
AND TX.[R_SUBDEL]=@SUBDEL AND TX.[ID_INS]=@ID_INSPECTOR AND TX.R_TD NOT IN ('08','80','81','82','83'))
END),0.00) AS IMPORTE_COP
,isnull((CASE 
WHEN MIN(TIPO) IN ('COP') THEN (SELECT COUNT(R_IMPORTE) FROM [sirecacobros].[dbo].[PAE_CRED] AS TX
where convert(varchar,TX.[FECH_INS],103)=@FECHA_ASIG AND TX.R_TIPO='COP' AND TX.R_REGPATR=REGPAT
AND TX.[R_SUBDEL]=@SUBDEL AND TX.[ID_INS]=@ID_INSPECTOR AND TX.R_TD IN ('08','80','81','82','83'))
END),0.00) AS CREDITO_MULT
,isnull((CASE 
WHEN MIN(TIPO) IN ('COP') THEN (SELECT SUM(R_IMPORTE) FROM [sirecacobros].[dbo].[PAE_CRED] AS TX
where convert(varchar,TX.[FECH_INS],103)=@FECHA_ASIG AND TX.R_TIPO='COP' AND TX.R_REGPATR=REGPAT
AND TX.[R_SUBDEL]=@SUBDEL AND TX.[ID_INS]=@ID_INSPECTOR AND TX.R_TD IN ('08','80','81','82','83'))
END),0.00) AS IMPORTE_MULT
,isnull((CASE 
WHEN MAX(TIPO) IN ('RCV') THEN (SELECT COUNT(R_IMPORTE) FROM [sirecacobros].[dbo].[PAE_CRED] AS TX
where convert(varchar,TX.[FECH_INS],103)=@FECHA_ASIG AND TX.R_TIPO='RCV' AND TX.R_REGPATR=REGPAT
AND TX.[R_SUBDEL]=@SUBDEL AND TX.[ID_INS]=@ID_INSPECTOR)
END),0.00) AS CREDITO_RCV
,isnull((CASE 
WHEN MAX(TIPO) IN ('RCV') THEN (SELECT SUM(R_IMPORTE) FROM [sirecacobros].[dbo].[PAE_CRED] AS TX
where convert(varchar,TX.[FECH_INS],103)=@FECHA_ASIG AND TX.R_TIPO='RCV' AND TX.R_REGPATR=REGPAT
AND TX.[R_SUBDEL]=@SUBDEL AND TX.[ID_INS]=@ID_INSPECTOR)
END),0.00) AS IMPORTE_RCV
,isnull(count(*),0.00) as CREDITOS_TOTAL
,isnull(SUM(IMPORTE),0.00) AS IMPORTE_TOTAL
,(SELECT UPPER(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.id=[ID_INS]) AS INSPECTOR
,(select uf.[credencial] from sireca.dbo.usuarios AS uf where uf.id=[ID_INS]) as CREDENCIAL
,(SELECT [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[R_SUBDEL]) as DELNOM
,(SELECT [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[R_SUBDEL]) as SUBDELNOM
,(SELECT [CT_DOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[R_SUBDEL]) as SUBDELDOM
FROM (
SELECT DISTINCT
[R_SUBDEL]
,convert(varchar,[FECH_INS],103) as FECH_ASIGNACIO
,[R_REGPATR] AS REGPAT
,R_NUMCRED
,R_PERIODO
,razonSocial  AS RAZONSOCIAL
,dom as DOMICILIO
,loc as LOCALIDAD
,ptn.sector AS SECTOR
,R_IMPORTE AS IMPORTE
,R_TIPO AS TIPO
,ID_INS
FROM [sirecacobros].[dbo].[PAE_CRED] LEFT JOIN sireca.dbo.patrones as ptn on regpat=[R_REGPATR]
where convert(varchar,[FECH_INS],103)=@FECHA_ASIG
AND [R_SUBDEL]=@SUBDEL AND [ID_INS]=@ID_INSPECTOR
) AS R1
GROUP BY [R_SUBDEL],FECH_ASIGNACIO,REGPAT,RAZONSOCIAL,DOMICILIO,LOCALIDAD,SECTOR,ID_INS
">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAdel" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                QueryStringField="inspector" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" QueryStringField="fecha" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rep_asignacion.aspx.vb" Inherits="WebSIRECA.rep_asignacion" %>

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
        <Report FileName="rep_asignacionrpt.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="SqlDataSource1" 
                    TableName="reportediariodiligenciado" />
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


SELECT [R_SUBDEL] as CP_SUBDEL
,[ID_INS] AS ID_INSPECTOR
,(SELECT UPPER(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.id=[ID_INS]) AS INSPECTOR
,(select uf.[credencial] from sireca.dbo.usuarios AS uf where uf.id=[ID_INS]) as CREDENCIAL
,(SELECT [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[R_SUBDEL]) as DELNOM
,(SELECT [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[R_SUBDEL]) as SUBDELNOM
,(SELECT [CT_DOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[R_SUBDEL]) as SUBDELDOM
,[R_REGPATR] AS REGPAT
,razonSocial  AS RAZONSOCIAL
,[R_NUMCRED] AS CREDITO
,SUBSTRING([R_PERIODO],4,7) AS PERIODO
,(SELECT TOP 1 (CASE 
WHEN SUBSTRING([CODEBAR],17,1)='C' THEN 'CITATORIO'
WHEN SUBSTRING([CODEBAR],17,1)='M' THEN 'MANDAMIENTO'
WHEN SUBSTRING([CODEBAR],17,1)='A' THEN 'AMPLIACION'
WHEN SUBSTRING([CODEBAR],17,1)='R' THEN 'REMOCION'
WHEN SUBSTRING([CODEBAR],17,1)='J' THEN 'CERRAJERO'
ELSE 'OTRO'
END) AS TIPO_DOC FROM (
SELECT [PC_CODEBAR] AS CODEBAR,'CITATORIO, '+[PC_HORA] AS DILI
,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS
FROM [sirecacobros].[dbo].[PAE_CITATORIO]
WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID]
UNION ALL
SELECT
[PD_CODEBAR] AS CODEBAR
,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI
,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID]
) AS R1
ORDER BY  FECH_ACC DESC,FECH_SYS DESC) AS DOCUMENTO
,(
isnull((SELECT TOP 1 DILI FROM (
SELECT [PC_CODEBAR] AS CODEBAR,'CITATORIO, '+[PC_HORA] AS DILI
,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS
FROM [sirecacobros].[dbo].[PAE_CITATORIO]
WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID]
) AS R1
ORDER BY  FECH_ACC DESC,FECH_SYS DESC),'')
+
isnull((SELECT TOP 1 DILI FROM (
SELECT
[PD_CODEBAR] AS CODEBAR
,(SELECT replace([desc_diligencia],'(foto)','') FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI
,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID]
) as R2
ORDER BY  FECH_ACC DESC,FECH_SYS DESC),'')
)
+isnull((SELECT TOP 1 '('+[PR_FOLIO]+')' FROM [sirecacobros].[dbo].[PAE_RECIBO] where [PR_CODEBAR] like (CODE_BAR+'_'+R_NUMCRED+(R_PERIODO)+'-'+convert(varchar,R_ID))),'')
AS DILIGENCIA
,CONVERT(VARCHAR,(
	SELECT TOP 1 FECH_ACC FROM (
	SELECT [PC_CODEBAR] AS CODEBAR,'CITATORIO, '+[PC_HORA] AS DILI
	,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS
	FROM [sirecacobros].[dbo].[PAE_CITATORIO]
	--WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID]
	UNION ALL
	SELECT
	[PD_CODEBAR] AS CODEBAR
	,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI
	,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS
	FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
	--WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID]
	) AS R1
	ORDER BY  FECH_ACC DESC,FECH_SYS DESC
),103) AS FEC_DILIGENCIAX
,@FECHA_ASIG as FEC_DILIGENCIA
,'' AS CITATORIO
,[R_IMPORTE] AS IMPORTE
,'' AS OBSERVACION
,[R_INC] AS INC_RALE
/*,[ID_SUP]
,[FECH_INS]*/
FROM [sirecacobros].[dbo].[PAE_CRED] LEFT JOIN sireca.dbo.patrones on regpat=[R_REGPATR]
where convert(varchar,[FECH_INS],103)=@FECHA_ASIG
AND [R_SUBDEL]=@SUBDEL AND [ID_INS]=@ID_INSPECTOR
order by REGPAT,convert(datetime,[R_PERIODO],103)
">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAdel" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                QueryStringField="inspector" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="fecha" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

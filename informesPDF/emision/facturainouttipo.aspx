<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="facturainouttipo.aspx.vb" Inherits="WebSIRECA.facturainouttipo" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0}*{color:#000!important;text-shadow:none!important;background:transparent!important;box-shadow:none!important}</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportSource ID="CrystalReportSourceResivo" runat="server">
        <report filename="recibo.rpt">
            <datasources>
                <CR:DataSourceRef DataSourceID="SqlDataSourceResivo" 
                    TableName="RESIVO_IN_OUT_CODEBAR" />
            </datasources>
        </report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceResivo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @SUPERVISOR as VARCHAR(15)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @ENT_SAL as INT
SET @SUBDEL=?
SET @SUPERVISOR=?
SET @INSPECTOR=?
SET @ENT_SAL=?
SELECT 
GETDATE() AS R_FECHA_IMPRESION
,R_REGPAT
,(CASE WHEN charindex('Acta de Notificacion',R_TD) not in (0) THEN 
(
select top 1 omision from sireca.dbo.eco
where substring(reg#patronal,1,10)=R_REGPAT
and R_CODE_BAR like '%!'+credito
)
 ELSE 0.0 END) as R_IMPORTE
,'YUCATAN' as R_DELEGACION
,(case 
when @SUBDEL='01' then 'NORTE' 
when @SUBDEL='33' then 'SUR' 
else ''
end) as R_SUBDELEGACION
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=@SUPERVISOR) AS R_SUPERVISOR
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=R_ID_NOTIFICADOR) AS R_INSPECTOR
,* 
FROM 
(
SELECT 
(
SELECT replace([CQ_DATO3],'PROMOTOR:$VISIT_CVE:','') AS ID FROM [controlQR].[dbo].[CONTROL_QR] 
where [CQ_SUBDEL]=@SUBDEL and CQ_AREA='co' 
and [HA_ID_CODEBAR] LIKE (CONVERT(VARCHAR,[CQ_ID])+'!%')) as R_ID_NOTIFICADOR
,(SELECT replace([CQ_DATO1],'REG. PATRONAL:$','') FROM [controlQR].[dbo].[CONTROL_QR] 
where [CQ_SUBDEL]=@SUBDEL and CQ_AREA='co' 
and [HA_ID_CODEBAR] LIKE (CONVERT(VARCHAR,[CQ_ID])+'!%')) as R_REGPAT
,(SELECT [CQ_TD] AS ID FROM [controlQR].[dbo].[CONTROL_QR] where CQ_AREA='co' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex('!',[HA_ID_CODEBAR])))) as R_TD
,[HA_ID_CODEBAR] AS R_CODE_BAR
,[HA_FECH_REGISTRO] as R_FECHA_ACCION
,(SELECT [AC_DESCRIPCION] FROM [controlQR].[dbo].[ACCIONES] WHERE [AC_ID]=[HA_AC_ID]) as R_ACCION
,ISNULL(HA_OBSERVACION,'') AS R_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]

WHERE [HA_SUBDEL]=@SUBDEL and [HA_AC_ID]=@ENT_SAL
) AS RESULT

WHERE convert(varchar(10),R_FECHA_ACCION,103)=convert(varchar(10),getdate(),103)
and R_ID_NOTIFICADOR=@INSPECTOR
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="?" SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                <asp:QueryStringParameter DefaultValue="9999999" Name="?" 
                    QueryStringField="msg1" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="msg2" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

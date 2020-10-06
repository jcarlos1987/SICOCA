<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rectificardomicilio.aspx.vb" Inherits="WebSIRECA.rectificardomicilio1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportSource ID="CrystalReportSourceRectDom" runat="server">
            <Report FileName="rectificardomicilio.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceRectDom" 
                        TableName="RECTIFICAR_DOMICILIO" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceRectDom" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ID_ECO as VARCHAR(10)
DECLARE @USER_PRINT as VARCHAR(10)
SET @SUBDEL=?
SET @ID_ECO=?
SET @USER_PRINT=?
SELECT 
(SELECT TOP 1 [CQ_QR_CODE]
FROM [controlQR].[dbo].[CONTROL_QR]
WHERE CQ_AREA='co' AND CQ_SISTEMAS='2' AND [CQ_ID_DATA]=@ID_ECO
AND CQ_TD='INVITACION PARA RATIFICAR O RECTIFICAR DOMICILIO' AND CONVERT(VARCHAR(10),CQ_FECH,103)=CONVERT(VARCHAR(10),GETDATE(),103)
AND CQ_USER=@USER_PRINT
ORDER BY CQ_ID DESC) as C_QR
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) AS C_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) AS C_SUBDELEGACION
,razonSocial as C_RAZON
,[REG#PATRONAL] as C_REGPAT
,act as C_ACTIVIDAD
,dom as C_DOMICILIO

,credito as C_CREDITO
,(case
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as C_PERIODO

,(select 'C. '+upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) as C_INSPECTOR

,(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]='JFE_OFI_EMIS' and uf.subdel=eco.subdel) AS C_JEF_EMISION

FROM [sireca].[dbo].[eco] as eco left join sireca.dbo.patrones on substring([REG#PATRONAL],1,10)=regpat
where eco.[subdel]=@SUBDEL
and eco.tipoeco in ('COP','COMP','RCV','RCVCOMP')
and eco.id=@ID_ECO
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="9999999" Name="?" 
                    QueryStringField="ideco" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

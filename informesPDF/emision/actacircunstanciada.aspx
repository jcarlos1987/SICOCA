<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="actacircunstanciada.aspx.vb" Inherits="WebSIRECA.actacircunstanciada1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportSource ID="CrystalReportSourceActaCircunstanciada" 
            runat="server">
            <Report FileName="actacircunstanciada.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceActaCircunstanciada" 
                        TableName="ACTA_CIRCUNSTANCIADA" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceActaCircunstanciada" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ID_ECO as VARCHAR(15)
SET @SUBDEL=?
SET @ID_ECO=?
SELECT 
(SELECT TOP 1 [CQ_QR_CODE]
FROM [controlQR].[dbo].[CONTROL_QR]
WHERE CQ_AREA='co' AND CQ_SISTEMAS='2' AND [CQ_ID_DATA]=@ID_ECO
AND CQ_TD='ACTA CIRCUNSTANCIADA' AND CONVERT(VARCHAR(10),CQ_FECH,103)=CONVERT(VARCHAR(10),GETDATE(),103)
ORDER BY CQ_ID DESC) as AC_QR
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) AS AC_NOM_DEL
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) AS AC_NOM_SUBDEL
,ECO.SECTOR AS AC_SECTOR
,[REG#PATRONAL] as AC_REGPAT
,razonSocial as AC_RAZON_SOCIAL
,act as AC_ACTIVIDAD
,dom as AC_DOMICILIO
,replace(replace((case when len(ptn.loc)=40 then substring(ptn.loc,1,len(ptn.loc)-5) else ptn.loc end),' YUCATAN ',''),' YUC ','') as AC_MUNICIPIO
,(case when len(ptn.loc)=40 then substring(ptn.loc,len(ptn.loc)-5,6) else '' end) as AC_CP
,credito as AC_CREDITOS
,(
case when tipoECO in ('COP','COMP') then substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6)
else substring([CREDITO],1,2) + '6' + substring([CREDITO],4,6) end
) as AC_CREDITO_MULTA
,(
case when tipoECO in ('COP','COMP') then 'PERIODO(S)'
else 'BIMESTRE(S)' end
) as AC_PER_BIM
------------------------
,(SELECT top 1 [g_emision_cif_cont]
FROM [sireca].[dbo].[E_CONTCIFRA]
WHERE (case 
when [g_tipoProceso] in ('COP') and [g_perioEmiBimestral] is null then 'COP'
when [g_tipoProceso] in ('COP') and [g_perioEmiBimestral] is not null then 'RCV'
when [g_tipoProceso] in ('COMP') and [g_perioEmiBimestral] is null then 'COMP'
when [g_tipoProceso] in ('COMP') and [g_perioEmiBimestral] is not null then 'RCVCOMP'
end)=tipoeco and g_cifraControl=clave) as AC_FECH_CITATORIO_O
------------------------
,(case
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as AC_PERIODO
,(case
when [tipoECO] in ('COP','COMP') then '02'
when [tipoECO] in ('RCV','RCVCOMP') then '06'
end ) as AC_TD
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) as AC_INSPECTOR
,(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]='JFE_SEC' and uf.subdel=eco.subdel) AS AC_JEF_SECCION

,(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]='JFE_OFI_EMIS' and uf.subdel=eco.subdel) AS AC_JEF_EMISION

,(SELECT upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] as cat inner join fiscamovil.dbo.usuarios as uf on cat.[C_ID]=uf.id
WHERE [C_CARGO]='DELEGADO' and uf.subdel=eco.subdel) AS AC_NOM_SUBDELEGADO

,(SELECT us.credencial FROM sireca.dbo.usuarios as us WHERE us.id=responsable) AS AC_CREDENCIAL

,(case
when [tipoECO] in ('COP','COMP') then
'CEDULA DE LIQUIDACION POR LA OMISION TOTAL EN LA DETERMINACION  Y PAGO DE CUOTAS'
when [tipoECO] in ('RCV','RCVCOMP') then
'CEDULA DE LIQUIDACION POR LA OMISION TOTAL EN LA DETERMINACION  Y PAGO DE CUOTAS CORRESPONDIENTES AL SEGURO POR RETIRO, CESANTIA EN EDAD AVANZADA Y VEJEZ'
end
) as AC_TIPO_EMISION
,(convert(varchar(50),(SELECT [CQ_ID]
FROM [controlQR].[dbo].[CONTROL_QR]
where [CQ_QR_CODE]=(SELECT TOP 1 [CQ_QR_CODE]
FROM [controlQR].[dbo].[CONTROL_QR]
WHERE CQ_AREA='co' AND CQ_SISTEMAS='2' AND [CQ_ID_DATA]=@ID_ECO
AND CQ_TD='ACTA CIRCUNSTANCIADA' AND CONVERT(VARCHAR(10),CQ_FECH,103)=CONVERT(VARCHAR(10),GETDATE(),103)
ORDER BY CQ_ID DESC)))+'!'+eco.credito) AS AC_ID_KEY

FROM [sireca].[dbo].[eco] as eco left join sireca.dbo.patrones as ptn on substring([REG#PATRONAL],1,10)=regpat
where eco.[subdel]=@SUBDEL
and eco.tipoeco in ('COP','COMP','RCV','RCVCOMP')
and eco.id=@ID_ECO
">
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="SIRECAsubdel" DefaultValue="00" />
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="ideco" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

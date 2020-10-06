<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AMPLIACION.aspx.vb" Inherits="WebSIRECA.MANDAMIENTO" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ampliacion</title>
</head>
<body style="background-color: #D6D3CE">
    <form id="form2" runat="server">
    <div>
    <center >
        <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="429px" InteractiveDeviceInfos="(Colección)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="959px">
            <LocalReport ReportPath="pag_paes\AmpliacionCOP.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSourceCOP2" Name="DataSetRCV" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSourceCOP2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
      --,[subdel]
      ,[CLASIFICACION]
      ,[NUMCRED]
      ,ptn.[razonSocial] as [RAZONSOCIAL]
      ,ptn.[dom] as [DOMICILIO]
      ,substring([PERIODO],4,7) as [PERIODO]      
      ,[INC]      
      ,[TD]
      --------
      ,'x' as [FMOV]
      ,'x' as [DIAS]
      ,ADEUDO as [IMPORTE]
      ,substring([PERIODO],4,7) as [PERIODO]
,(rale.[ADEUDO]*(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))) 
 as ACTUALIZADO
,((rale.[ADEUDO]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100)
 as RECARGO
,(rale.[ADEUDO]+(rale.[ADEUDO]*(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2)))+((rale.[ADEUDO]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))
 as TOTAL_ACTUALIZADO
,((rale.[ADEUDO]+((rale.[ADEUDO]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))*0.02)
 as [PORCIENTO2]
,case when (((rale.[ADEUDO]+((rale.[ADEUDO]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))*0.02)&gt;340) then 
	((rale.[ADEUDO]+((rale.[ADEUDO]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))*0.02)
else
	340
end as GASTO
,
case 
when len(ptn.rfc)=13 then 'FISICA'
when len(ptn.rfc)=10 then 'FISICA'
when len(ptn.rfc)=12 then 'MORAL'
when len(ptn.rfc)=11 then 'MORAL'
when ptn.razonsocial like '% SA %' then 'MORAL'
when ptn.razonsocial like '% S A %' then 'MORAL'
when ptn.razonsocial like '% S.A. %' then 'MORAL'
when ptn.razonsocial like '% S. A. %' then 'MORAL'
when ptn.razonsocial like '% PRIVADA %' then 'MORAL'
when ptn.razonsocial like '% CV %' then 'MORAL'
when ptn.razonsocial like '% C V %' then 'MORAL'
when ptn.razonsocial like '% C.V. %' then 'MORAL'
when ptn.razonsocial like '% C. V. %' then 'MORAL'
when ptn.razonsocial like '% SC %' then 'MORAL'
when ptn.razonsocial like '% S C %' then 'MORAL'
when ptn.razonsocial like '% S.C. %' then 'MORAL'
when ptn.razonsocial like '% A. C. %' then 'MORAL'
when ptn.razonsocial like '% SCP %' then 'MORAL'
when ptn.razonsocial like '% S C P %' then 'MORAL'
when ptn.razonsocial like '% S.C.P. %' then 'MORAL'
when ptn.razonsocial like '% S. C. P. %' then 'MORAL'
when ptn.razonsocial like '% S DE %' then 'MORAL'
when ptn.razonsocial like '% S. DE %' then 'MORAL'
when ptn.razonsocial like '% MAYAB %' then 'MORAL'
when ptn.razonsocial like '% PENINSULARES %' then 'MORAL'
when ptn.razonsocial like '% PESQUERA %' then 'MORAL'
when ptn.razonsocial like '% MEDICO %' then 'MORAL'
else 'FISICA'
end as TIPO_PERSONA
,ptn.act as ACTIVIDAD
,ptn.sector as SECTOR
,case when right(ptn.loc,6)='' then ptn.loc
else
substring(ptn.loc,1,(len(ptn.loc)-5))
end as LOCALIDAD
,right(ptn.loc,6) as CODIGO_POSTAL
,subdelNom
,subdelDom
FROM [sirecacobros].[dbo].[ecoTipos] as rale left join (select * from sireca.dbo.patrones) as ptn on ptn.[regpat]=replace([REGPATR],'-','')
where regpatr=? and grupo='PAE'  and inc in ('32','43')
order by CONVERT(DATETIME,[PERIODO])">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="REGPATR" />
            </SelectParameters>
        </asp:SqlDataSource>
    </center>
    </div>
    </form>
</body>
</html>

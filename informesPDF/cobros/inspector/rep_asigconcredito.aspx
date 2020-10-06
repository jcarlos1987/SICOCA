<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rep_asigconcredito.aspx.vb" Inherits="WebSIRECA.rep_asigconcredito" %>

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
        <Report FileName="reportediarioasignacionpae.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="SqlDataSource1" 
                    TableName="reportediariodiligenciado" />
            </DataSources>
        </Report>
    </CR:CrystalReportSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @DEL AS VARCHAR(2)
SET @DEL=?
select distinct * from (
SELECT       
      [CP_SUBDEL]
,CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,(select [credencial] from sireca.dbo.usuarios where id=CP_INSPEC) as CREDENCIAL
      ,(SELECT [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=CP_SUBDEL) as DELNOM
      ,(SELECT [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=CP_SUBDEL) as SUBDELNOM
      ,(SELECT [CT_DOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=CP_SUBDEL) as SUBDELDOM
      ,[RA_REGPATR] as REGPAT
      ,razonSocial as RAZONSOCIAL
      ,[RA_NUMCRED] as CREDITO
      ,substring([RA_PERIODO],4,7) as PERIODO
      ,(SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) as DOCUMENTO
,
(
case when [AC_DILIGENCIA] is null then '' else
(SELECT case when [desc_diligencia]='&gt; seleccione' then '' else replace([desc_diligencia],'(foto)','') end FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA])
end
+
	case when RA_FOLIO_PAG is null then '' else '(REC.PRO.:'+(
	SELECT [PA_RECIBO_PROVI]
	FROM [sirecacobros].[dbo].[CO_PAGOS]
	WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG
	) + ')' end
) as DILIGENCIA
,convert(varchar(10),[CP_FECH_ASIG],103) as FEC_DILIGENCIA
      ,[AC_HORA_CITATORIO] as CITATORIO
	  ,RA_IMPORTE as IMPORTE
,(
	(
	case when [AC_OBSERVACION] is null then '' else
	(SELECT (case when [desc_observacion] = '&gt; seleccione' then '' else [desc_observacion] end) FROM [sirecacobros].[dbo].[cae_observacion] WHERE [id_observacion]=[AC_OBSERVACION])
	end
	)+
	case when RA_FOLIO_PAG is null then '' else (
	SELECT [PA_RECIBO_PROVI]
	FROM [sirecacobros].[dbo].[CO_PAGOS]
	WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG
	) end
) as OBSERVACION
      ,RA_INC as INC_RALE
  FROM [sirecacobros].[dbo].[CO_CPATRONAL]
left join sireca.dbo.patrones on CP_REGPAT=REGPAT
left join [sirecacobros].[dbo].[CO_RALE] on [RA_REGPATR]=regpat
left join [sirecacobros].[dbo].[CO_ACCIONES] on AC_RA_ID=RA_ID and RA_SUBDEL=CP_SUBDEL
  where CP_INSPEC=?
and convert(varchar(10),CP_FECH_ASIG,103)=?
and  CP_SUBDEL=?
and RA_INC in ('01','02','31','32','43')
and RA_VIVO='SI'
) as resultado
order by REGPAT,CREDITO
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

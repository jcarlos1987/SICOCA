<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rep_diligenciados.aspx.vb" Inherits="WebSIRECA.rep_diligenciados" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="reportediariodiligenciado.rpt">
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
SELECT       
[AC_SUBDEL]
,[AC_CP_INSPEC] as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[AC_CP_INSPEC]) as INSPECTOR
,(select [credencial] from sireca.dbo.usuarios where id=[AC_CP_INSPEC]) as CREDENCIAL
      ,(SELECT [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[AC_SUBDEL]) as DELNOM
      ,(SELECT [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[AC_SUBDEL]) as SUBDELNOM
      ,(SELECT [CT_DOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_DEL]=@DEL AND [CT_SUBDEL]=[AC_SUBDEL]) as SUBDELDOM
      ,[AC_RA_REGPATR] as REGPAT
      ,razonSocial as RAZONSOCIAL
      ,[AC_RA_NUMCRED] as CREDITO
      ,substring([AC_RA_PERIODO],4,7) as PERIODO
      ,(SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) as DOCUMENTO
      ,[AC_DILIGENCIA]
      ,((case when [AC_DILIGENCIA]=0 then (SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) +' ('+[AC_HORA_CITATORIO]+ ')' else '' end)+
      (SELECT case when [desc_diligencia]='&gt; seleccione' then '' else replace([desc_diligencia],'(foto)','') end FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA])
      +
      case when(
			case when RA_FOLIO_PAG is null then '' else '(REC.PRO.:'+(
			SELECT [PA_RECIBO_PROVI]
			FROM [sirecacobros].[dbo].[CO_PAGOS]
			WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG
			and convert(varchar(10),[PA_FECH_RECIBO_PROVI],103)=convert(varchar(10),[AC_FECH_DILIGENCIA],103)
			)+')' end
		)
		 is null then ''
		 else
		 (
			case when RA_FOLIO_PAG is null then '' else '(REC.PRO.:'+(
			SELECT [PA_RECIBO_PROVI]
			FROM [sirecacobros].[dbo].[CO_PAGOS]
			WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG
			and convert(varchar(10),[PA_FECH_RECIBO_PROVI],103)=convert(varchar(10),[AC_FECH_DILIGENCIA],103)
			)+')' end
		)
		 end
       ) as DILIGENCIA
,convert(varchar(10),[AC_FECH_DILIGENCIA],103) as FEC_DILIGENCIA
      ,[AC_HORA_CITATORIO] as CITATORIO
	  ,RA_IMPORTE as IMPORTE
      ,(SELECT (case when [desc_observacion] = '&gt; seleccione' then '' else [desc_observacion] end) FROM [sirecacobros].[dbo].[cae_observacion] WHERE [id_observacion]=[AC_OBSERVACION]) as OBSERVACION
      ,'' as INC_RALE
  FROM [sirecacobros].[dbo].[CO_ACCIONES] left join sireca.dbo.patrones on [AC_RA_REGPATR]=regpat
left join [sirecacobros].[dbo].[CO_RALE] on AC_RA_ID=RA_ID
  where [AC_CP_INSPEC]=?
and convert(varchar(10),[AC_FECH_DILIGENCIA],103)=?
and  [AC_SUBDEL]=?
order by REGPAT,convert(datetime,[AC_RA_PERIODO],103)
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

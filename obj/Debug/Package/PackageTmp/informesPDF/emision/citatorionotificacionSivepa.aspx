<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="citatorionotificacionSivepa.aspx.vb" Inherits="WebSIRECA.citatorionotificacionSivepa" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>CITATORIO,NOTIFICACIÓN</title>
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
    </asp:ScriptManager>
    <br />
    <br />
    <br />
    <center>
    <div>
    <asp:Panel ID="PanelRead" runat="server">
       <asp:Label ID="Label6" runat="server" 
            Text="La descarga del documento en WORD es para acompletar información del encabezado de ser nesesario." 
            ForeColor="#CC0000"></asp:Label>
        <div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="LBel" runat="server" Text="Obtener documento en:"></asp:Label>
        <asp:LinkButton ID="LBPDF" runat="server" CssClass="btn"><i class="icon-file"></i>&nbsp;PDF</asp:LinkButton>
        <asp:LinkButton ID="LBWORD" runat="server" CssClass="btn"><i class="icon-file"></i>&nbsp;WORD</asp:LinkButton>
        </span>
        </div> 
        <br />
        <asp:Label ID="Label2" runat="server" 
            Text="Nota: Al descargarlo en WORD modifique el interlineado del documento para mejora." 
            ForeColor="#CC0000"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" 
            Text="Utilice la combinacion de teclas Ctrl + E luego Ctrl + 1 del teclado alfanumerico." 
            ForeColor="#CC0000"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="PanelEdit" runat="server">
        <div class="btn-group input-prepend">
<span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="Especifique la razón de la impresión de los documentos sin fecha:"></asp:Label>
</span>
<br/>
        <asp:TextBox ID="TBObservacion" runat="server" Width="530px" Height="158px" 
        MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
<br/>
<span class="add-on">
    <asp:LinkButton ID="LBPrint" runat="server" CssClass ="btn">IMPRIMIR PDF</asp:LinkButton>
    <asp:LinkButton ID="LBPrintWord" runat="server" CssClass ="btn">IMPRIMIR WORD</asp:LinkButton>
    <asp:Label ID="LMsg" runat="server" ForeColor="#CC0000"></asp:Label>
</span>
</div>
        <CR:CrystalReportSource ID="CrystalReportSourceCitaNoti" runat="server">
            <Report FileName="cop_fisica_cit_not.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="SqlDataSourceCitaNoti" 
                        TableName="CITATORIO_NOTIFICACION" ReportName="cop_fisica_citatorio.rpt" />
                    <CR:DataSourceRef DataSourceID="SqlDataSourceCitaNoti" 
                        ReportName="cop_fisica_notificacion.rpt" TableName="CITATORIO_NOTIFICACION" />
                    <CR:DataSourceRef DataSourceID="SqlDataSourceDocImprimir" 
                        TableName="DOC_IMPRIMIR" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceCitaNoti" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RESPONSABLE as VARCHAR(5)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_ASIG as VARCHAR(10)
DECLARE @COP_RCV as VARCHAR(10)
DECLARE @FISICA_MORAL as VARCHAR(10)
DECLARE @ID_PRINT as VARCHAR(5)
DECLARE @REGPAT as VARCHAR(10)
SET @SUBDEL=?
SET @FECH_ASIG=?
SET @RESPONSABLE=?
SET @COP_RCV=?
SET @FISICA_MORAL=?
SET @ID_PRINT=?
SET  @REGPAT=?
SELECT * FROM (
SELECT
[SV_ID] as CN_KEY
,[SV_RAZON_SOCIAL] as CN_NOMBRE_PATRON
,NULL as CN_NOM_DELEGADO
,[SV_REG_PATRONAL] as CN_REG_PAT_ORIGINAL
,rfc as CN_RFC
,dom as CN_DIRECCION
,'' as CN_NoX
,'' as CN_NoX_INT
,'' as CN_COLONIA
,replace(replace((case when len(ptn.loc)=40 then substring(ptn.loc,1,len(ptn.loc)-5) else ptn.loc end),' YUCATAN ',''),' YUC ','') as CN_POBLACION
,(case when len(ptn.loc)=40 then substring(ptn.loc,len(ptn.loc)-5,6) else '' end) as CN_CODIGO_POSTAL
,[SV_CREDITO] as CN_CREDITO_CUOTA
,substring([SV_CREDITO],1,2) + '8' + substring([SV_CREDITO],4,6) as CN_CREDITO_MULTA
,(case when [SV_SIVEPA] in ('SIVEPA-IMSS') then substring(convert(varchar,[SV_PERIODO],103),4,7) else '' end) as CN_PERIODO
,(case when [SV_SIVEPA] in ('SIVEPA-RCV') then substring(convert(varchar,[SV_PERIODO],103),4,7) else '' end) as CN_BIMESTRE
,(
SELECT top 1 [E_FECHA_FACTURA] as emision_cif_cont
	FROM [sireca].[dbo].[E_CONTCIFRA_ENTREGA]
	WHERE [E_TIPO_FACTURA]=(SV_TIPO+[SV_SIVEPA]) and [E_CIFRA_CONTROL]=SV_CLAVE
) as CN_FECH_CITATORIO_O
,(SELECT sirecacobros.dbo.sigFechaHabil(DATEADD(DAY,0,GETDATE()),1) ) as CN_FECH_CITATORIO
,(SELECT sirecacobros.dbo.sigFechaHabil(DATEADD(DAY,0,GETDATE()),2) ) as CN_FECH_NOTIFICACION
,getdate() as CN_FECH_PAG_CORRESPONDIENTE
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[SV_ASIG_INSPECTOR]) as CN_NOTIFICADOR
,(SELECT su.[credencial]
FROM [sireca].[dbo].[usuarios] as su
WHERE su.[id]=[SV_ASIG_INSPECTOR]) as CN_CLAVE
,[SV_SUBDEL] as CN_SUBDEL
,(SELECT [CT_NOM_DEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_SUBDEL]=[SV_SUBDEL]) as CN_DELEGACION
,(SELECT [CT_NOM_SUBDEL] FROM [sireca].[dbo].[catalogodelegacional] WHERE [CT_SUBDEL]=[SV_SUBDEL]) as CN_SUBDELEGACION
,(case when [SV_SIVEPA] in ('SIVEPA-IMSS') then 'COP' else 'RCV' end) as CN_TIPO_COP_RCV
,(select sirecacobros.dbo.tipoPersona(ptn.rfc,[SV_RAZON_SOCIAL])) as CN_TIPO_PERSONA
,ptn.sector as CN_SECTOR
,isnull((SELECT upper(nom_iniciales)
FROM fiscamovil.dbo.usuarios as uf
WHERE uf.id=@ID_PRINT and uf.subdel=@SUBDEL
and exists(
SELECT [C_CARGO]
FROM [sirecaemisiones].[dbo].[catalogo] as cat
WHERE cat.[C_CARGO]='JFE_DEP' and cat.C_ID=@ID_PRINT)
),'') as CN_INI_IMPRIMIO
,NULL as CN_ID_KEY
/*
      ,[SV_ASIG_INSPECTOR_FECHA]
      ,[SV_TIPO]
      ,[SV_SIVEPA]
      ,[SV_FECHA]
      ,[SV_DEL]
      ,[SV_NUM]
      ,[SV_CD]
      ,[SV_COTIZ]
      ,[SV_DIAS]
      ,[SV_C]
      ,[SV_ACT]
      ,[SV_PRIMA]
      ,[SV_EMI_REAL]
      ,[SV_RECAUDACION]
      ,[SV_DIFERENCIA]
      ,[SV_IP_CARGA]
      ,[SV_ID_USUARIO]
      ,[SV_FECH_CARGA]
      ,[SV_ASIG_ID_SUPER]
      ,[SV_ASIG_FECHA]
      ,[SV_ASIG_IP]*/
  FROM [sirecasivepas].[dbo].[SV_BASE] left join (select regpat,rfc,sector,dom,loc from sireca.dbo.patrones) as ptn
  on substring([SV_REG_PATRONAL],1,10)=regpat
  WHERE CONVERT(VARCHAR,[SV_ASIG_INSPECTOR_FECHA],103)=@FECH_ASIG
  AND [SV_ASIG_INSPECTOR]=@RESPONSABLE
  ) as res
  WHERE CN_SUBDEL=@SUBDEL
  AND CN_TIPO_COP_RCV=@COP_RCV
  AND CN_TIPO_PERSONA=@FISICA_MORAL
  AND CN_REG_PAT_ORIGINAL LIKE @REGPAT+'%'
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_asig" />
                <asp:QueryStringParameter DefaultValue="9999" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="cop" Name="?" 
                    QueryStringField="coprcv" />
                <asp:QueryStringParameter DefaultValue="fisica" Name="?" 
                    QueryStringField="fisicamoral" />
                <asp:SessionParameter DefaultValue="999999" Name="?" SessionField="SIRECAid" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" QueryStringField="regpat" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDocImprimir" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="select ? as DOC_IMPRIMIR">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="cit" Name="?" 
                    QueryStringField="imprimir" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label4" runat="server" 
            Text="Nota: Al descargarlo en WORD modifique el interlineado del documento para mejora." 
            ForeColor="#CC0000"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" 
            Text="Utilice la combinacion de teclas Ctrl + E luego Ctrl + 1 del teclado alfanumerico." 
            ForeColor="#CC0000"></asp:Label>
    </asp:Panel>
    </div>
    </center>
    </form>
</body>
</html>

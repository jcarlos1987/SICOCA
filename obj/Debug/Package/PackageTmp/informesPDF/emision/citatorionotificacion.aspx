<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="citatorionotificacion.aspx.vb" Inherits="WebSIRECA.citatorionotificacion" %>
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
SELECT 
--(case when CN_INI_IMPRIMIO='' then NULL else (SELECT sirecacobros.dbo.encriptar(CN_INI_IMPRIMIO,@ID_PRINT,@RESPONSABLE,'1',CONVERT(VARCHAR(15),RAND()) )) end) as CN_KEY
(SELECT TOP 1 convert(varchar(10),IM_ID)+[IM_KEY]  AS [IM_KEY]
FROM [sirecaemisiones].[dbo].[hist_impresion]
WHERE [IM_SUBDEL]=CN_SUBDEL
AND [IM_USER_PRINT]=@ID_PRINT
AND [IM_REGPAT]=SUBSTRING(CN_REG_PAT_ORIGINAL,1,10)
AND [IM_CREDITO]=CN_CREDITO_CUOTA
AND CONVERT(VARCHAR(10),[IM_FECHA_IMPRESION],103)=CONVERT(VARCHAR(10),GETDATE(),103)
AND CONVERT(VARCHAR(10),[IM_FECHA_ASIGNACION],103)=CONVERT(VARCHAR(10),CN_FECH_ASIGNO,103)
ORDER BY [IM_ID] DESC) AS CN_KEY
,CN_NOMBRE_PATRON,CN_NOM_DELEGADO,CN_REG_PAT_ORIGINAL,CN_RFC,CN_DIRECCION
,CN_NoX,CN_NoX_INT,CN_COLONIA,CN_POBLACION,CN_CODIGO_POSTAL,CN_CREDITO_CUOTA,CN_CREDITO_MULTA
,CN_PERIODO,CN_BIMESTRE,CN_FECH_CITATORIO_O
,(case when CN_INI_IMPRIMIO='' then CN_FECH_CITATORIO else NULL end) as CN_FECH_CITATORIO
,(case when CN_INI_IMPRIMIO='' then CN_FECH_NOTIFICACION else NULL end) as CN_FECH_NOTIFICACION
,CN_FECH_PAG_CORRESPONDIENTE,CN_NOTIFICADOR,CN_CLAVE,CN_SUBDEL,CN_DELEGACION,CN_SUBDELEGACION,CN_TIPO_COP_RCV,CN_TIPO_PERSONA,CN_SECTOR
,CN_INI_IMPRIMIO
,(convert(varchar(50),(SELECT [CQ_ID]
FROM [controlQR].[dbo].[CONTROL_QR]
where [CQ_QR_CODE]=(SELECT TOP 1 convert(varchar(10),IM_ID)+[IM_KEY]
FROM [sirecaemisiones].[dbo].[hist_impresion]
WHERE [IM_SUBDEL]=CN_SUBDEL
AND [IM_USER_PRINT]=@ID_PRINT
AND [IM_REGPAT]=SUBSTRING(CN_REG_PAT_ORIGINAL,1,10)
AND [IM_CREDITO]=CN_CREDITO_CUOTA
AND CONVERT(VARCHAR(10),[IM_FECHA_IMPRESION],103)=CONVERT(VARCHAR(10),GETDATE(),103)
AND CONVERT(VARCHAR(10),[IM_FECHA_ASIGNACION],103)=CONVERT(VARCHAR(10),CN_FECH_ASIGNO,103)
ORDER BY [IM_ID] DESC)))+'!'+CN_CREDITO_CUOTA) AS CN_ID_KEY
FROM (
SELECT razonSocial as CN_NOMBRE_PATRON
,(SELECT [CT_NOM_SUBDELEGADO]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) as CN_NOM_DELEGADO
,[REG#PATRONAL] as CN_REG_PAT_ORIGINAL
,rfc as CN_RFC
,dom as CN_DIRECCION
,'' as CN_NoX
,'' as CN_NoX_INT
,'' as CN_COLONIA
,replace(replace((case when len(ptn.loc)=40 then substring(ptn.loc,1,len(ptn.loc)-5) else ptn.loc end),' YUCATAN ',''),' YUC ','') as CN_POBLACION
,(case when len(ptn.loc)=40 then substring(ptn.loc,len(ptn.loc)-5,6) else '' end) as CN_CODIGO_POSTAL
,[CREDITO] as CN_CREDITO_CUOTA
,(
case when tipoECO in ('COP','COMP') then substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6)
else substring([CREDITO],1,2) + '6' + substring([CREDITO],4,6) end
) as CN_CREDITO_MULTA
,(
case
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
else ''
end
) as CN_PERIODO
,(
case
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
else ''
end
) as CN_BIMESTRE
,(SELECT top 1 emision_cif_cont FROM (
SELECT (case 
when [g_tipoProceso] in ('COP') and [g_perioEmiBimestral] is null then 'COP'
when [g_tipoProceso] in ('COP') and [g_perioEmiBimestral] is not null then 'RCV'
when [g_tipoProceso] in ('COMP') and [g_perioEmiBimestral] is null then 'COMP'
when [g_tipoProceso] in ('COMP') and [g_perioEmiBimestral] is not null then 'RCVCOMP'
end) as tipo_eco
,[g_emision_cif_cont] as emision_cif_cont
,g_cifraControl as cifra_control
FROM [sireca].[dbo].[E_CONTCIFRA]
) AS res
WHERE tipo_eco=tipoeco and cifra_control=clave) as CN_FECH_CITATORIO_O

,(SELECT sirecacobros.dbo.sigFechaHabil(DATEADD(DAY,0,CONVERT(NVARCHAR(10),GETDATE(),103)),1) ) as CN_FECH_CITATORIO
,(SELECT sirecacobros.dbo.sigFechaHabil(DATEADD(DAY,0,CONVERT(NVARCHAR(10),GETDATE(),103)),2) ) as CN_FECH_NOTIFICACION
,getdate() as CN_FECH_PAG_CORRESPONDIENTE
,(select upper(us.nombre) from fiscamovil.dbo.usuarios as us where us.id=eco.responsable) as CN_NOTIFICADOR
,(SELECT su.[credencial]
FROM [sireca].[dbo].[usuarios] as su
WHERE su.[id]=eco.responsable) as CN_CLAVE
,eco.subdel as CN_SUBDEL
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) as CN_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=eco.subdel) as CN_SUBDELEGACION
,(case when tipoeco in ('COP','COMP') then 'COP' else 'RCV' end) as CN_TIPO_COP_RCV
,(select sirecacobros.dbo.tipoPersona(rfc,razonSocial)) as CN_TIPO_PERSONA
,eco.sector as CN_SECTOR
,eco.fechaSeleccion as CN_FECH_ASIGNO
,(
isnull((SELECT upper(nom_iniciales)
FROM fiscamovil.dbo.usuarios as uf
WHERE uf.id=@ID_PRINT and uf.subdel=@SUBDEL
and exists(
SELECT [C_CARGO]
FROM [sirecaemisiones].[dbo].[catalogo] as cat
WHERE cat.[C_CARGO]='DELEGADO' and cat.C_ID=@ID_PRINT)
),'')
+
isnull((SELECT upper(nom_iniciales)
FROM fiscamovil.dbo.usuarios as uf
WHERE uf.id=@ID_PRINT and uf.subdel=@SUBDEL
and exists(
SELECT [C_CARGO]
FROM [sirecaemisiones].[dbo].[catalogo] as cat
WHERE cat.[C_CARGO]='JFE_DEP' and cat.C_ID=@ID_PRINT)
),'')
) AS CN_INI_IMPRIMIO

FROM sireca.dbo.eco as eco left join sireca.dbo.patrones as ptn on substring(eco.[REG#PATRONAL],1,10)=ptn.regpat
WHERE tipoeco in ('COP','COMP','RCV','RCVCOMP')
and eco.responsable = @RESPONSABLE and eco.subdel = @SUBDEL
and convert(nvarchar(11),eco.fechaSeleccion,103)=@FECH_ASIG
) as resultado
where CN_TIPO_COP_RCV=@COP_RCV
and CN_TIPO_PERSONA=@FISICA_MORAL
and substring(CN_REG_PAT_ORIGINAL,1,10) like @REGPAT
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

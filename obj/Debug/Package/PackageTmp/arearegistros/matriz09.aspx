<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="matriz09.aspx.vb" Inherits="WebSIRECA.matriz09" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Matriz 09</title>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <asp:LinkButton ID="LBExporta" runat="server">Descargar</asp:LinkButton>
    </center>
        <asp:Panel ID="PanelMatriz09" runat="server">
        <table border="1" align="center" cellpadding="3" cellspacing="0" 
            style="text-align: center">
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="11">
                    &nbsp;</td>
                <td bgcolor="#EBEBEB" colspan="26">
                    INVESTIGACIONES INTERNAS</td>
                <td bgcolor="#CCFFCC" colspan="33">
                    INVESTIGACIONES EXTERNAS</td>
                <td bgcolor="#FFFF99" colspan="12">
                    INVESTIGACIONES DE CAMPO</td>
                <td rowspan="6">
                    Observaciónes</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td rowspan="5">
                    N°</td>
                <td rowspan="5">
                    Subdel</td>
                <td rowspan="5">
                    Estatus</td>
                <td rowspan="5">
                    Rango</td>
                <td rowspan="5">
                    Reg.Pat</td>
                <td rowspan="5">
                    Razón&nbsp; Social</td>
                <td rowspan="5">
                    Importe COP</td>
                <td rowspan="5">
                    Fecha de Baja </td>
                <td rowspan="5">
                    Área que solicita la Baja</td>
                <td rowspan="5">
                    Docto. con el cual se informa que es Patrón No Localizado</td>
                <td rowspan="5">
                    Nombre del Integrador (N-L)</td>
                <td rowspan="5">
                    Fecha de Asignacion al Integrador</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Catalogo de Control de Resultados Depto Cobranza</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Ofna. de E.P.O.</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Ofna. de Cobros</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Expedientes de Convenios y Garantias</td>
                <td bgcolor="#EBEBEB" rowspan="5">
                    SINDO</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Depto. de Afiliación</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Depto. de Auditoria</td>
                <td bgcolor="#EBEBEB" colspan="3" rowspan="4">
                    Servicios Jurídicos</td>
                <td bgcolor="#EBEBEB" rowspan="5">
                    Secc. Bca.</td>
                <td bgcolor="#EBEBEB" rowspan="5">
                    Secc. Ama.</td>
                <td bgcolor="#EBEBEB" rowspan="5">
                    SIEM </td>
                <td bgcolor="#EBEBEB" rowspan="5">
                    COMPRA NET</td>
                <td bgcolor="#CCFFCC" colspan="6" rowspan="2">
                    SAT</td>
                <td bgcolor="#CCFFCC" colspan="6" rowspan="2">
                    Tesoreria</td>
                <td bgcolor="#CCFFCC" colspan="18">
                    Registro Público de la Propiedad y del Comercio</td>
                <td bgcolor="#CCFFCC" colspan="3" rowspan="4">
                    Archivo Gral. de Notarias</td>
                <td bgcolor="#FFFF99" colspan="2" rowspan="4">
                    Visita Dom. Fiscal</td>
                <td bgcolor="#FFFF99" colspan="2" rowspan="4">
                    Visita Socios</td>
                <td bgcolor="#FFFF99" colspan="2" rowspan="4">
                    Entrevista a 3 Vecinos</td>
                <td bgcolor="#FFFF99" colspan="2" rowspan="4">
                    Entrevista a 3 Trabajadores</td>
                <td bgcolor="#FFFF99" colspan="3" rowspan="4">
                    Visitas Foráneas</td>
                <td bgcolor="#FFFF99" rowspan="5">
                    Avance</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#CCFFCC" colspan="9">
                    D.F.</td>
                <td bgcolor="#CCFFCC" colspan="9">
                    FORANEO</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#CCFFCC" colspan="3" rowspan="2">
                    D.F.</td>
                <td bgcolor="#CCFFCC" colspan="3" rowspan="2">
                    FORANEO</td>
                <td bgcolor="#CCFFCC" colspan="3" rowspan="2">
                    D.F.</td>
                <td bgcolor="#CCFFCC" colspan="3" rowspan="2">
                    FORANEO</td>
                <td bgcolor="#CCFFCC" colspan="6">
                    PATRON</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    SOCIOS</td>
                <td bgcolor="#CCFFCC" colspan="6">
                    &nbsp;</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    SOCIOS</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#CCFFCC" colspan="3">
                    F.M.</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    F.R.</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    F.R.</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    F.M.</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    F.R.</td>
                <td bgcolor="#CCFFCC" colspan="3">
                    F.R.</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#EBEBEB">
                    FOLIO</td>
                <td bgcolor="#EBEBEB">
                    SOLIC.</td>
                <td bgcolor="#EBEBEB">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#CCFFCC">
                    FOLIO</td>
                <td bgcolor="#CCFFCC">
                    SOLIC.</td>
                <td bgcolor="#CCFFCC">
                    RESP.</td>
                <td bgcolor="#FFFF99">
                    FOLIO</td>
                <td bgcolor="#FFFF99">
                    SOLIC.</td>
                <td bgcolor="#FFFF99">
                    FOLIO</td>
                <td bgcolor="#FFFF99">
                    SOLIC.</td>
                <td bgcolor="#FFFF99">
                    FOLIO</td>
                <td bgcolor="#FFFF99">
                    SOLIC.</td>
                <td bgcolor="#FFFF99">
                    FOLIO</td>
                <td bgcolor="#FFFF99">
                    SOLIC.</td>
                <td bgcolor="#FFFF99">
                    FOLIO</td>
                <td bgcolor="#FFFF99">
                    SOLIC.</td>
                <td bgcolor="#FFFF99">
                    RESP.</td>
                <td>
                    &nbsp;</td>
            </tr>
            <asp:Repeater ID="RepeaterMatriz09" runat="server" 
                DataSourceID="SqlDataSourceMatriz09">
            <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("N")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("G_Subdel")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("G_Estatus")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("G_Rango")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("G_RegPat")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("G_RazonSocial")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("G_ImporteCOP","{0:N0}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("G_FechaBaja","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("G_AreaSolicitaLaBaja")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("G_DocInformaEsPatronNL")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("G_ID_Integrador")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("G_FechaAsignacion","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("II_FolioCatalogoContResultDeptoCobranza")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("II_FSCatalogoContResultDeptoCobranza","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("II_FRCatalogoContResultDeptoCobranza","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("II_FolioOfnaEPO")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("II_SOfnaEPO","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("II_ROfnaEPO","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("II_FolioOfnaCobros")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label20" runat="server" Text='<%# Eval("II_SOfnaCobros","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label21" runat="server" Text='<%# Eval("II_ROfnaCobros","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("II_FolioExpeConveyGarantia")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label23" runat="server" Text='<%# Eval("II_SExpeConveyGarantia","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label24" runat="server" Text='<%# Eval("II_RExpeConveyGarantia","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label25" runat="server" Text='<%# Eval("II_SINDO")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label26" runat="server" Text='<%# Eval("II_FolioDeptoAfiliacion")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text='<%# Eval("II_SDeptoAfiliacion","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label28" runat="server" Text='<%# Eval("II_RDeptoAfiliacion","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label29" runat="server" Text='<%# Eval("II_FolioDeptoAuditoria")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label30" runat="server" Text='<%# Eval("II_SDeptoAuditoria","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label31" runat="server" Text='<%# Eval("II_RDeptoAuditoria","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label32" runat="server" Text='<%# Eval("II_FolioServiciosJuridicos")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label33" runat="server" Text='<%# Eval("II_SServiciosJuridicos","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label34" runat="server" Text='<%# Eval("II_RServiciosJuridicos","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label35" runat="server" Text='<%# Eval("II_SeccBca","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label36" runat="server" Text='<%# Eval("II_SeccAma","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label37" runat="server" Text='<%# Eval("II_SIEM","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label38" runat="server" Text='<%# Eval("II_COMPRA_NET","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label39" runat="server" Text='<%# Eval("IE_SAT_DF_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label40" runat="server" Text='<%# Eval("IE_SAT_DF_S","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label41" runat="server" Text='<%# Eval("IE_SAT_DF_R","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label42" runat="server" Text='<%# Eval("IE_SAT_Foraneo_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label43" runat="server" Text='<%# Eval("IE_SAT_Foraneo_S","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label44" runat="server" Text='<%# Eval("IE_SAT_Foraneo_R","{0:d}")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label45" runat="server" Text='<%# Eval("IE_III_Tesoreria_DF_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label46" runat="server" Text='<%# Eval("IE_III_Tesoreria_DF_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label47" runat="server" Text='<%# Eval("IE_III_Tesoreria_DF_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label48" runat="server" Text='<%# Eval("IE_III_Tesoreria_Foraneo_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label49" runat="server" Text='<%# Eval("IE_III_Tesoreria_Foraneo_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label50" runat="server" Text='<%# Eval("IE_III_Tesoreria_Foraneo_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label51" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FM_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label52" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FM_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label53" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FM_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label54" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FR_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label55" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FR_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label56" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FR_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label57" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_SOCIO_FR_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label58" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_SOCIO_FR_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label59" runat="server" Text='<%# Eval("IE_IV_RPPC_DF_SOCIO_FR_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label60" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FM_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label61" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FM_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label62" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FM_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label63" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FR_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label64" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FR_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label65" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FR_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label66" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_SOCIO_FR_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label67" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_SOCIO_FR_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label68" runat="server" Text='<%# Eval("IE_IV_RPPC_Foraneo_SOCIO_FR_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label69" runat="server" Text='<%# Eval("IE_V_ArchivoGralNotarias_Folio")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label70" runat="server" Text='<%# Eval("IE_V_ArchivoGralNotarias_S")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label71" runat="server" Text='<%# Eval("IE_V_ArchivoGralNotarias_R")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label72" runat="server" Text='<%# Eval("IC_FolioVisitaDomFiscal")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label73" runat="server" Text='<%# Eval("IC_SVisitaDomFiscal")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label74" runat="server" Text='<%# Eval("IC_FolioVisitaSocios")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label75" runat="server" Text='<%# Eval("IC_SVisitaSocios")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label76" runat="server" Text='<%# Eval("IC_FolioEntrevista3Vecinos")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label77" runat="server" Text='<%# Eval("IC_SEntrevista3Vecinos")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label78" runat="server" Text='<%# Eval("IC_FolioEntrevista3Trabajadores")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label79" runat="server" Text='<%# Eval("IC_SEntrevista3Trabajadores")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label80" runat="server" Text='<%# Eval("IC_FolioVisitasForaneas")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label81" runat="server" Text='<%# Eval("IC_SVisitasForaneas")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label82" runat="server" Text='<%# Eval("IC_RVisitasForaneas")%>'></asp:Label></td>
                <td>
                    <asp:Label ID="Label83" runat="server" Text='<%# Eval("AVANCE","{0:P}")%>'></asp:Label></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceMatriz09" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RANGO AS VARCHAR(5)
DECLARE @RANGO_AVANCE AS VARCHAR(20)
SET @SUBDEL=?
SET @RANGO=?
SET @RANGO_AVANCE=?
SELECT 
ROW_NUMBER() OVER(ORDER BY AVANCE) AS N
,*
,AVANCE,RANGO_AVANCE FROM (
SELECT 
*
,(CASE 
WHEN AVANCE&lt;=0.20 THEN 'ENTRE 0 y 20%'
WHEN AVANCE&gt;0.20 AND AVANCE&lt;=0.40 THEN 'ENTRE 21 y 40%'
WHEN AVANCE&gt;0.40 AND AVANCE&lt;=0.60 THEN 'ENTRE 41 y 60%'
WHEN AVANCE&gt;0.60 AND AVANCE&lt;=0.80 THEN 'ENTRE 61 y 80%'
WHEN AVANCE&gt;0.80 AND AVANCE&lt;=1.0 THEN 'ENTRE 81 y 100%'
END) AS RANGO_AVANCE
FROM (
SELECT 
[G_Subdel]
      ,[G_Estatus]
      ,[G_Rango]
      ,[G_RegPat]
      ,[G_RazonSocial]
      ,[G_ImporteCOP]
      ,[G_ImporteRCV]
      ,[G_FechaBaja]
      ,ISNULL((SELECT TOP 1 [C_SIGNIFICADO] FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ID]=[G_AreaSolicitaLaBaja]),[G_AreaSolicitaLaBaja]) as [G_AreaSolicitaLaBaja]
      ,ISNULL((SELECT TOP 1 [C_SIGNIFICADO] FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ID]=[G_DocInformaEsPatronNL]),[G_DocInformaEsPatronNL]) as [G_DocInformaEsPatronNL]
      ,ISNULL((select top 1 upper(nombre) from fiscamovil.dbo.usuarios where convert(varchar(10),id)=[G_ID_Integrador]),[G_ID_Integrador]) as [G_ID_Integrador]
      ,[G_FechaAsignacion]
      ,[II_FolioCatalogoContResultDeptoCobranza]
      ,[II_FSCatalogoContResultDeptoCobranza]
      ,[II_FRCatalogoContResultDeptoCobranza]
      ,[II_FolioOfnaEPO]
      ,[II_SOfnaEPO]
      ,[II_ROfnaEPO]
      ,[II_FolioOfnaCobros]
      ,[II_SOfnaCobros]
      ,[II_ROfnaCobros]
      ,[II_FolioExpeConveyGarantia]
      ,[II_SExpeConveyGarantia]
      ,[II_RExpeConveyGarantia]
      ,[II_SINDO]
      ,[II_FolioDeptoAfiliacion]
      ,[II_SDeptoAfiliacion]
      ,[II_RDeptoAfiliacion]
      ,[II_FolioDeptoAuditoria]
      ,[II_SDeptoAuditoria]
      ,[II_RDeptoAuditoria]
      ,[II_FolioServiciosJuridicos]
      ,[II_SServiciosJuridicos]
      ,[II_RServiciosJuridicos]
      ,[II_SeccBca]
      ,[II_SeccAma]
      ,[II_SIEM]
      ,[II_COMPRA_NET]
      ,[IE_SAT_DF_Folio]
      ,CONVERT(VARCHAR(10),[IE_SAT_DF_S],103) AS [IE_SAT_DF_S]
      ,CONVERT(VARCHAR(10),[IE_SAT_DF_R],103) AS [IE_SAT_DF_R]
      ,[IE_SAT_Foraneo_Folio]
      ,CONVERT(VARCHAR(10),[IE_SAT_Foraneo_S],103) AS [IE_SAT_Foraneo_S]
      ,CONVERT(VARCHAR(10),[IE_SAT_Foraneo_R],103) AS [IE_SAT_Foraneo_R]
      ,[IE_III_Tesoreria_DF_Folio]
      ,(CASE WHEN [IE_III_Tesoreria_DF_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_III_Tesoreria_DF_S],103) END) AS [IE_III_Tesoreria_DF_S]
      ,(CASE WHEN [IE_III_Tesoreria_DF_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_III_Tesoreria_DF_R],103) END) AS [IE_III_Tesoreria_DF_R]
      ,[IE_III_Tesoreria_Foraneo_Folio]
      ,(CASE WHEN [IE_III_Tesoreria_Foraneo_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_III_Tesoreria_Foraneo_S],103) END) AS [IE_III_Tesoreria_Foraneo_S]
      ,(CASE WHEN [IE_III_Tesoreria_Foraneo_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_III_Tesoreria_Foraneo_R],103) END) AS [IE_III_Tesoreria_Foraneo_R]
      ,[IE_IV_RPPC_DF_PATRON_FM_Folio]
      ,(CASE WHEN [IE_IV_RPPC_DF_PATRON_FM_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_DF_PATRON_FM_S],103) END) AS [IE_IV_RPPC_DF_PATRON_FM_S]
      ,(CASE WHEN [IE_IV_RPPC_DF_PATRON_FM_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_DF_PATRON_FM_R],103) END) AS [IE_IV_RPPC_DF_PATRON_FM_R]
      ,[IE_IV_RPPC_DF_PATRON_FR_Folio]
      ,(CASE WHEN [IE_IV_RPPC_DF_PATRON_FR_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_DF_PATRON_FR_S],103) END) AS [IE_IV_RPPC_DF_PATRON_FR_S]
      ,(CASE WHEN [IE_IV_RPPC_DF_PATRON_FR_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_DF_PATRON_FR_R],103) END) AS [IE_IV_RPPC_DF_PATRON_FR_R]
      ,[IE_IV_RPPC_DF_SOCIO_FR_Folio]
      ,(CASE WHEN [IE_IV_RPPC_DF_SOCIO_FR_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_DF_SOCIO_FR_S],103) END) AS [IE_IV_RPPC_DF_SOCIO_FR_S]
      ,(CASE WHEN [IE_IV_RPPC_DF_SOCIO_FR_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_DF_SOCIO_FR_R],103) END) AS [IE_IV_RPPC_DF_SOCIO_FR_R]
      ,[IE_IV_RPPC_Foraneo_PATRON_FM_Folio]
      ,(CASE WHEN [IE_IV_RPPC_Foraneo_PATRON_FM_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_Foraneo_PATRON_FM_S],103) END) AS [IE_IV_RPPC_Foraneo_PATRON_FM_S]
      ,(CASE WHEN [IE_IV_RPPC_Foraneo_PATRON_FM_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_Foraneo_PATRON_FM_R],103) END) AS [IE_IV_RPPC_Foraneo_PATRON_FM_R]
      ,[IE_IV_RPPC_Foraneo_PATRON_FR_Folio]
      ,(CASE WHEN [IE_IV_RPPC_Foraneo_PATRON_FR_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_Foraneo_PATRON_FR_S],103) END) AS [IE_IV_RPPC_Foraneo_PATRON_FR_S]
      ,(CASE WHEN [IE_IV_RPPC_Foraneo_PATRON_FR_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_Foraneo_PATRON_FR_R],103) END) AS [IE_IV_RPPC_Foraneo_PATRON_FR_R]
      ,[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio]
      ,(CASE WHEN [IE_IV_RPPC_Foraneo_SOCIO_FR_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_Foraneo_SOCIO_FR_S],103) END) AS [IE_IV_RPPC_Foraneo_SOCIO_FR_S]
      ,(CASE WHEN [IE_IV_RPPC_Foraneo_SOCIO_FR_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_IV_RPPC_Foraneo_SOCIO_FR_R],103) END) AS [IE_IV_RPPC_Foraneo_SOCIO_FR_R]
      ,[IE_V_ArchivoGralNotarias_Folio]
      ,(CASE WHEN [IE_V_ArchivoGralNotarias_S]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_V_ArchivoGralNotarias_S],103) END) AS [IE_V_ArchivoGralNotarias_S]
      ,(CASE WHEN [IE_V_ArchivoGralNotarias_R]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IE_V_ArchivoGralNotarias_R],103) END) AS [IE_V_ArchivoGralNotarias_R]
      ,[IC_FolioVisitaDomFiscal]
      ,[IC_SVisitaDomFiscal]
      ,[IC_FolioVisitaSocios]
      ,[IC_SVisitaSocios]
      ,[IC_FolioEntrevista3Vecinos]
      ,[IC_SEntrevista3Vecinos]
      ,[IC_FolioEntrevista3Trabajadores]
      ,(CASE WHEN [IC_SEntrevista3Trabajadores]='01/01/1900' THEN 'N/A' ELSE CONVERT(VARCHAR(10),[IC_SEntrevista3Trabajadores],103) END) AS [IC_SEntrevista3Trabajadores]
      ,[IC_FolioVisitasForaneas]
      ,[IC_SVisitasForaneas]
      ,[IC_RVisitasForaneas]
,ROUND((((case when [G_Estatus] is null then 0 else 1 end)
+(case when [G_Rango] is null then 0 else 1 end)
+(case when [G_RegPat] is null then 0 else 1 end)
+(case when [G_RazonSocial] is null then 0 else 1 end)
+(case when [G_ImporteCOP] is null then 0 else 1 end)
+(case when [G_ImporteRCV] is null then 0 else 1 end)
+(case when [G_FechaBaja] is null then 0 else 1 end)
+(case when [G_AreaSolicitaLaBaja] is null then 0 else 1 end)
+(case when [G_DocInformaEsPatronNL] is null then 0 else 1 end)
+(case when [G_ID_Integrador] is null then 0 else 1 end)
+(case when [G_FechaAsignacion] is null then 0 else 1 end)
+(case when [II_FolioCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FSCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FRCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FolioOfnaEPO] is null then 0 else 1 end)
+(case when [II_SOfnaEPO] is null then 0 else 1 end)
+(case when [II_ROfnaEPO] is null then 0 else 1 end)
+(case when [II_FolioOfnaCobros] is null then 0 else 1 end)
+(case when [II_SOfnaCobros] is null then 0 else 1 end)
+(case when [II_ROfnaCobros] is null then 0 else 1 end)
+(case when [II_FolioExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_SExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_RExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_SINDO] is null then 0 else 1 end)
+(case when [II_FolioDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_SDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_RDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_FolioDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_SDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_RDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_FolioServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_SServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_RServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_SeccBca] is null then 0 else 1 end)
+(case when [II_SeccAma] is null then 0 else 1 end)
+(case when [II_SIEM] is null then 0 else 1 end)
+(case when [II_COMPRA_NET] is null then 0 else 1 end)
+(case when [IE_SAT_DF_Folio] is null then 0 else 1 end)
+(case when [IE_SAT_DF_S] is null then 0 else 1 end)
+(case when [IE_SAT_DF_R] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_Folio] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_S] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_R] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_Folio] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_S] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_R] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_Folio] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_S] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_R] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_Folio] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_S] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_R] is null then 0 else 1 end)
+(case when [IC_FolioVisitaDomFiscal] is null then 0 else 1 end)
+(case when [IC_SVisitaDomFiscal] is null then 0 else 1 end)
+(case when [IC_FolioVisitaSocios] is null then 0 else 1 end)
+(case when [IC_SVisitaSocios] is null then 0 else 1 end)
+(case when [IC_FolioEntrevista3Vecinos] is null then 0 else 1 end)
+(case when [IC_SEntrevista3Vecinos] is null then 0 else 1 end)
+(case when [IC_FolioEntrevista3Trabajadores] is null then 0 else 1 end)
+(case when [IC_SEntrevista3Trabajadores] is null then 0 else 1 end)
+(case when [IC_FolioVisitasForaneas] is null then 0 else 1 end)
+(case when [IC_SVisitasForaneas] is null then 0 else 1 end)
+(case when [IC_RVisitasForaneas] is null then 0 else 1 end))
-(case G_Rango
when 'I' then 29
when 'II' then 29
when 'III' then 21
when 'IV' then 3
when 'V' then 0
else 0 end))
/(82.00-(case G_Rango
when 'I' then 29.00
when 'II' then 29.00
when 'III' then 21.00
when 'IV' then 3.00
when 'V' then 0.00
else 0 end)),2) as AVANCE
FROM [sirecaregistros].[dbo].[NL_General]
left join [sirecaregistros].[dbo].[NL_InvestInterna] on II_G_ID=[G_ID]
left join [sirecaregistros].[dbo].[NL_InvestExterna] on IE_G_ID=[G_ID]
left join [sirecaregistros].[dbo].[NL_InvestCampo] on IC_G_ID=[G_ID]
WHERE G_Subdel LIKE @SUBDEL
) as RESULTADO1
) as RESULTADO2
WHERE G_RANGO=@RANGO
--AND RANGO_AVANCE=@RANGO_AVANCE
">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="01" Name="?" 
                        QueryStringField="subdel" />
                    <asp:QueryStringParameter DefaultValue="IVV" Name="?" 
                        QueryStringField="rango" />
                    <asp:QueryStringParameter DefaultValue="20" Name="?" 
                        QueryStringField="rangoavance" />
                </SelectParameters>
            </asp:SqlDataSource>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

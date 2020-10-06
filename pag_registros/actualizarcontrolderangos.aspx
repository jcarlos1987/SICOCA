<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="actualizarcontrolderangos.aspx.vb" Inherits="WebSIRECA.actualizarcontrolderangos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CONTROL DE LA INTEGRACION PARA LA CANCELACION 469/2005</title>
    <link rel="stylesheet" type="text/css" href="../css/body.css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style5
        {
        }
        .style7
        {
        }
        .style12
        {
        }
        .style14
        {
            width: 946px;
        }
        .style19
        {
            width: 154px;
        }
        .style21
        {
            width: 711px;
        }
        .style36
        {
            width: 5px;
        }
        .style42
        {
            width: 21px;
        }
        .style45
        {
            width: 191px;
        }
    </style>
</head>
<body link="#ffffff" vlink="#ffffff">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    <center >
        <asp:Label ID="TBRegpat" runat="server" Font-Bold="True" ></asp:Label>
        <asp:Label ID="TBRazon" runat="server" ></asp:Label><br />
        <asp:Label ID="Label14" runat="server" Text="ACTIVIDAD:" Font-Bold="True"></asp:Label>
        <asp:Label ID="TBActividad" runat="server" ></asp:Label>
        <asp:Label ID="Label15" runat="server" Text="DOMICILIO:" Font-Bold="True"></asp:Label>
        <asp:Label ID="TBDomicilio" runat="server" ></asp:Label>
    </center>
    <hr />
        <table align="center" class="style14">
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style7" colspan="2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
                    </asp:ScriptManager>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#9CD794" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Underline="False" Font-Bold="True">&nbsp;Guardar Cambios&nbsp;</asp:LinkButton>
                </td>
                <td class="style21">
                    <asp:Label ID="LMsg" runat="server" ForeColor="#CC0000" ></asp:Label>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    ASIGNADO EL :</td>
                <td class="style21">
                    <asp:Label ID="LFechAsig" runat="server" ></asp:Label>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    ESTADO DE LA INTEGRACIÓN</td>
                <td class="style21">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style19">
                    <asp:DropDownList ID="DDLEstadoIntegracion" runat="server" BackColor="#BCC7D8">
                        <asp:ListItem>PENDIENTE</asp:ListItem>
                        <asp:ListItem>CANCELADO</asp:ListItem>
                        <asp:ListItem>RESTABLECIMIENTO</asp:ListItem>
                    </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:GridView ID="GridViewAvance" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="SqlDataSourceAvance" ShowHeader="False">
                                    <Columns>
                                        <asp:BoundField DataField="RESULTADO" DataFormatString="AVANCE DE: {0:P}" 
                                            NullDisplayText="0.0%" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceAvance" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ID AS FLOAT 
DECLARE @PORCENTAJE FLOAT
SET @ID=?
DECLARE @R1 AS FLOAT 
DECLARE @R2 AS FLOAT 
DECLARE @R3 AS FLOAT 
DECLARE @R4 AS FLOAT 
DECLARE @R5 AS FLOAT 
DECLARE @R6 AS FLOAT
DECLARE @R7 AS FLOAT 
DECLARE @R8 AS FLOAT 
DECLARE @R9 AS FLOAT 
DECLARE @R10 AS FLOAT 
DECLARE @R11 AS FLOAT 
DECLARE @R12 AS FLOAT 
DECLARE @R13 AS FLOAT 
DECLARE @R14 AS FLOAT 
DECLARE @R15 AS FLOAT 
DECLARE @R16 AS FLOAT 
DECLARE @R17 AS FLOAT 
DECLARE @R18 AS FLOAT 
DECLARE @R19 AS FLOAT 
DECLARE @R20 AS FLOAT 
DECLARE @R21 AS FLOAT 
DECLARE @R22 AS FLOAT 
DECLARE @R23 AS FLOAT 
DECLARE @R24 AS FLOAT 
DECLARE @R25 AS FLOAT 
DECLARE @R26 AS FLOAT 
DECLARE @R27 AS FLOAT 
DECLARE @R28 AS FLOAT 
DECLARE @R29 AS FLOAT 
DECLARE @R30 AS FLOAT 
DECLARE @R31 AS FLOAT 
DECLARE @R32 AS FLOAT 
DECLARE @R33 AS FLOAT 
DECLARE @R34 AS FLOAT 
DECLARE @R35 AS FLOAT 
DECLARE @R36 AS FLOAT 
DECLARE @R37 AS FLOAT 
DECLARE @R38 AS FLOAT 
DECLARE @R39 AS FLOAT 
DECLARE @R40 AS FLOAT 
DECLARE @R41 AS FLOAT 
DECLARE @R42 AS FLOAT 
DECLARE @R43 AS FLOAT 
DECLARE @R44 AS FLOAT 
DECLARE @R45 AS FLOAT 
DECLARE @R46 AS FLOAT 
DECLARE @R47 AS FLOAT 
DECLARE @R48 AS FLOAT 
DECLARE @R49 AS FLOAT 
DECLARE @R50 AS FLOAT 
DECLARE @R51 AS FLOAT 
DECLARE @R52 AS FLOAT 
DECLARE @R53 AS FLOAT 
DECLARE @R54 AS FLOAT 
DECLARE @R55 AS FLOAT 
DECLARE @R56 AS FLOAT 
DECLARE @R57 AS FLOAT 
DECLARE @R58 AS FLOAT 
DECLARE @R59 AS FLOAT 
DECLARE @R60 AS FLOAT 
DECLARE @R61 AS FLOAT 
DECLARE @R62 AS FLOAT 
DECLARE @R63 AS FLOAT 
DECLARE @R64 AS FLOAT 
DECLARE @R65 AS FLOAT 
DECLARE @R66 AS FLOAT 
DECLARE @R67 AS FLOAT 
DECLARE @R68 AS FLOAT 
DECLARE @R69 AS FLOAT 
DECLARE @R70 AS FLOAT 
DECLARE @R71 AS FLOAT 
DECLARE @R72 AS FLOAT 
DECLARE @R73 AS FLOAT 
DECLARE @R74 AS FLOAT 
DECLARE @R75 AS FLOAT 
DECLARE @R76 AS FLOAT 
DECLARE @R77 AS FLOAT 
DECLARE @R78 AS FLOAT 
DECLARE @R79 AS FLOAT 
DECLARE @R80 AS FLOAT 
SET @R1 = (SELECT CASE WHEN [R2_EXP_PAG_GEN_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R2 = (SELECT CASE WHEN [R3_EXP_OEPO_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R3 = (SELECT CASE WHEN [R3_EXP_OEPO_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R4 = (SELECT CASE WHEN [R3_EXP_OEPO_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R5 = (SELECT CASE WHEN [R3_EXP_OEPO_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R6 = (SELECT CASE WHEN [R3_EXP_OEPO_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R7 = (SELECT CASE WHEN [R3_EXP_OEPO_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R8 = (SELECT CASE WHEN [R4_EXP_COBROS_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R9 = (SELECT CASE WHEN [R4_EXP_COBROS_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R10 = (SELECT CASE WHEN [R4_EXP_COBROS_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R11 = (SELECT CASE WHEN [R4_EXP_COBROS_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R12 = (SELECT CASE WHEN [R4_EXP_COBROS_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R13 = (SELECT CASE WHEN [R4_EXP_COBROS_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R14 = (SELECT CASE WHEN [R5_EXP_CONVENIO_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R15 = (SELECT CASE WHEN [R5_EXP_CONVENIO_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R16 = (SELECT CASE WHEN [R5_EXP_CONVENIO_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R17 = (SELECT CASE WHEN [R5_EXP_CONVENIO_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R18 = (SELECT CASE WHEN [R5_EXP_CONVENIO_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R19 = (SELECT CASE WHEN [R5_EXP_CONVENIO_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R20 = (SELECT CASE WHEN [R6_CAT_NAC_PAT_FILE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R21 = (SELECT CASE WHEN [R7_EXP_AFIL_VIGEN_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R22 = (SELECT CASE WHEN [R7_EXP_AFIL_VIGEN_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R23 = (SELECT CASE WHEN [R7_EXP_AFIL_VIGEN_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R24 = (SELECT CASE WHEN [R7_EXP_AFIL_VIGEN_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R25 = (SELECT CASE WHEN [R7_EXP_AFIL_VIGEN_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R26 = (SELECT CASE WHEN [R7_EXP_AFIL_VIGEN_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R27 = (SELECT CASE WHEN [R8_EXP_AUDIT_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R28 = (SELECT CASE WHEN [R8_EXP_AUDIT_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R29 = (SELECT CASE WHEN [R8_EXP_AUDIT_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R30 = (SELECT CASE WHEN [R8_EXP_AUDIT_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R31 = (SELECT CASE WHEN [R8_EXP_AUDIT_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R32 = (SELECT CASE WHEN [R8_EXP_AUDIT_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R33 = (SELECT CASE WHEN [R9_INF_JEF_SERV_JURD_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R34 = (SELECT CASE WHEN [R9_INF_JEF_SERV_JURD_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R35 = (SELECT CASE WHEN [R9_INF_JEF_SERV_JURD_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R36 = (SELECT CASE WHEN [R9_INF_JEF_SERV_JURD_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R37 = (SELECT CASE WHEN [R9_INF_JEF_SERV_JURD_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R38 = (SELECT CASE WHEN [R9_INF_JEF_SERV_JURD_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R39 = (SELECT CASE WHEN [R11_SAT_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R40 = (SELECT CASE WHEN [R11_SAT_ME] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R41 = (SELECT CASE WHEN [R11_SAT_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R42 = (SELECT CASE WHEN [R11_SAT_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R43 = (SELECT CASE WHEN [R11_SAT_MR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R44 = (SELECT CASE WHEN [R11_SAT_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R45 = (SELECT CASE WHEN [R12_COMPRANET_FILE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R46 = (SELECT CASE WHEN [R12_COMPRANET_PN] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R47 = (SELECT CASE WHEN [R13_SIEM_FILE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R48 = (SELECT CASE WHEN [R14_ENTREVISTA_A_TRES_TRAB_AREA] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R49 = (SELECT CASE WHEN [R14_ENTREVISTA_A_TRES_TRAB_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R50 = (SELECT CASE WHEN [R14_ENTREVISTA_A_TRES_TRAB_FILE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R51 = (SELECT CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R52 = (SELECT CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_OE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R53 = (SELECT CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R54 = (SELECT CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R55 = (SELECT CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_OR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R56 = (SELECT CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R57 = (SELECT CASE WHEN [R161_OFIC_TESORERIA_Y_FINZS_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R58 = (SELECT CASE WHEN [R161_OFIC_TESORERIA_Y_FINZS_OE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R59 = (SELECT CASE WHEN [R161_OFIC_TESORERIA_Y_FINZS_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R60 = (SELECT CASE WHEN [R161_OFIC_TESORERIA_Y_FINZS_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R61 = (SELECT CASE WHEN [R161_OFIC_TESORERIA_Y_FINZS_OR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R62 = (SELECT CASE WHEN [R161_OFIC_TESORERIA_Y_FINZS_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R63 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_EST_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R64 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_EST_OE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R65 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_EST_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R66 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_EST_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R67 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_EST_OR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R68 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_EST_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R69 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_MUN_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R70 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_MUN_OE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R71 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_MUN_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R72 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_MUN_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R73 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_MUN_OR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R74 = (SELECT CASE WHEN [R162_OFIC_SECRETARIA_HCDA_MUN_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R75 = (SELECT CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_FE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R76 = (SELECT CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_OE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R77 = (SELECT CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_FILEE] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R78 = (SELECT CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_FR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R79 = (SELECT CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_OR] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 
SET @R80 = (SELECT CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER] IS NULL THEN 0 ELSE 1 END FROM [sirecaregistros].[dbo].[registrorangos] WHERE ID_ND=@ID) 

SET @PORCENTAJE =((@R1+@R2+@R3+@R4+@R5+@R6+@R7+@R8+@R9+@R10+@R11+@R12+@R13+@R14+@R15+@R16+@R17+@R18+@R19+@R20+@R21+@R22+@R23+@R24+@R25+@R26+@R27+@R28+@R29+@R30+@R31+@R32+@R33+@R34+@R35+@R36+@R37+@R38+@R39+@R40+@R41+@R42+@R43+@R44+@R45+@R46+@R47+@R48+@R49+@R50+@R51+@R52+@R53+@R54+@R55+@R56+@R57+@R58+@R59+@R60+@R61+@R62+@R63+@R64+@R65+@R66+@R67+@R68+@R69+@R70+@R71+@R72+@R73+@R74+@R75+@R76+@R77+@R78+@R79+@R80)/80) 
UPDATE [sirecaregistros].[dbo].[registrorangos]
SET [R_AVANCE] = @PORCENTAJE
WHERE [ID_ND]=@ID

SELECT @PORCENTAJE AS RESULTADO">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="id_nd" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    FECHA DE CANCELACIÓN</td>
                <td class="style21">
                    <asp:TextBox ID="TBFechEstado" runat="server" MaxLength="10" 
                        BorderStyle="Solid" BorderWidth="1px" BackColor="#BCC7D8"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFechEstado" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <asp:TextBoxWatermarkExtender ID="TBWE37" runat="server" TargetControlID="TBFechEstado" 
                        WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>                    
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>            
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    FECHA 
                    DEVOLUCIÓN DE EXP.</td>
                <td class="style21">
                    <asp:TextBox ID="TBFechDecvExp" runat="server" MaxLength="10" BorderStyle="Solid" 
                        BorderWidth="1px" BackColor="#BCC7D8"></asp:TextBox>   
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TBFechDecvExp" Format="dd/MM/yyyy"></asp:CalendarExtender>  
                    <asp:TextBoxWatermarkExtender ID="TBWE38" runat="server" TargetControlID="TBFechDecvExp" 
                        WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>               
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    VERIFICACION DOM. FISCAL</td>
                <td class="style21">
                    <asp:DropDownList ID="DDLVeriFiscal" runat="server" BackColor="#BCC7D8">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    01)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R1_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Catálogo de Control de Resultados del Departamento de Cobranza.</label>&nbsp;&nbsp;</td>
                <td class="style36" >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style5" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;<asp:TextBox ID="R2_FE0" runat="server" BackColor="#BCC7D8" 
                                    BorderStyle="None" MaxLength="10" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;
                                <asp:TextBox ID="R2_ME0" runat="server" BackColor="#BCC7D8" BorderStyle="None" 
                                    MaxLength="32" ReadOnly="True" Width="220px"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
                    <asp:FileUpload ID="R1_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
                                <asp:HyperLink ID="R1_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                            </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    02)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R2_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Expediente de Pagos y Generalidades.</label>&nbsp;&nbsp;</td>
                <td class="style36" >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;<asp:TextBox ID="R2_FE" 
                                    runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R2_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R2_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
                                <asp:HyperLink ID="R2_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    03)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R3_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Expedientes de la Oficina de Emisión y Pago Oportuno.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R3_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R3_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R3_FEW" runat="server" TargetControlID="R3_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R3_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R3_MEW" TargetControlID="R3_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R3_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
                                    <asp:HyperLink ID="R3_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R3_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R3_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R3_FRW" runat="server" TargetControlID="R3_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R3_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R3_MRW" runat="server" TargetControlID="R3_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R3_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R3_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    04)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R4_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Expedientes de la Oficina para Cobros.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R4_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R4_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R4_FEW" runat="server" TargetControlID="R4_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R4_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R4_MEW" TargetControlID="R4_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R4_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
                                <asp:HyperLink ID="R4_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R4_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R4_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R4_FRW" runat="server" TargetControlID="R4_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R4_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R4_MRW" runat="server" TargetControlID="R4_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R4_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R4_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    05)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R5_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Expedientes de Convenios de Pago a Plazos y Garantías.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R5_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R5_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R5_FEW" runat="server" TargetControlID="R5_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R5_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R5_MEW" TargetControlID="R5_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R5_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R5_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R5_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R5_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R5_FRW" runat="server" TargetControlID="R5_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R5_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R5_MRW" runat="server" TargetControlID="R5_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R5_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R5_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    06)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R6_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Catálogo Nacional de Patrones SINDO en las tres regiones.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R6_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R6_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R6_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R6_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    07)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R7_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Expedientes del Departamento de Afiliación y Vigencia.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R7_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R7_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R7_FEW" runat="server" TargetControlID="R7_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R7_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R7_MEW" TargetControlID="R7_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R7_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R7_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R7_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R7_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R7_FRW" runat="server" TargetControlID="R7_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R7_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R7_MRW" runat="server" TargetControlID="R7_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R7_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R7_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    08)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R8_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Expediente del Departamento de Auditoría a Patrones.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R8_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R8_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R8_FEW" runat="server" TargetControlID="R8_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R8_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R8_MEW" TargetControlID="R8_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R8_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R8_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R8_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R8_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R8_FRW" runat="server" TargetControlID="R8_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R8_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R8_MRW" runat="server" TargetControlID="R8_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R8_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R8_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    09)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R9_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Informe de la Jefatura Delegacional de Servicios Jurídicos.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R9_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R9_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R9_FEW" runat="server" TargetControlID="R9_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R9_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R9_MEW" TargetControlID="R9_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R9_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R9_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R9_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R9_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R9_FRW" runat="server" TargetControlID="R9_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R9_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R9_MRW" runat="server" TargetControlID="R9_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R9_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R9_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    10)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R10_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Directorios telefónicos de la Zona (blanco, amarillo, por actividad económica y/o por calles).</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;<asp:TextBox ID="R2_FE1" runat="server" BackColor="#BCC7D8" 
                                    BorderStyle="None" MaxLength="10" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;
                                <asp:TextBox ID="R2_ME1" runat="server" BackColor="#BCC7D8" BorderStyle="None" 
                                    MaxLength="32" ReadOnly="True" Width="220px"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R10_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R10_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    11)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R11_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Consulta de las Unidades Administrativas locales del Servicio de Administración Tributaria (SAT), acerca de la ubicación del último domicilio fiscal del patrón.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R11_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R11_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R11_FEW" runat="server" TargetControlID="R11_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R11_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R11_MEW" TargetControlID="R11_ME" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R11_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R11_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R11_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R11_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R11_FRW" runat="server" TargetControlID="R11_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R11_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R11_MRW" runat="server" TargetControlID="R11_MR" WatermarkText="No de MEMO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R11_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R11_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    12)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R12_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    Consulta Página en Internet <a target="_blank" href="http://www.compranet.gob.mx/" >"COMPRANET"</a>, de la Secretaría de la Función Pública, como proveedor o contratista.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R12_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R12_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R12_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R12_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    13)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R13_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
                    <a target="_blank" href="http://www.siem.gob.mx/siem2008/portal/consultas/consulta.asp?q=1" >Sistema de Información Empresarial Mexicano (SIEM)</a>.</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R13_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R13_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R13_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R13_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <% If Request.QueryString("rango").ToString.Equals("II") or Request.QueryString("rango").ToString.Equals("III") or Request.QueryString("rango").ToString.Equals("IV") or Request.QueryString("rango").ToString.Equals("V") Then %>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    14)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R14_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
Entrevista a tres vecinos y a tres trabajadores.
</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R14_FR" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R14_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R14_FRW" runat="server" TargetControlID="R14_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:DropDownList ID="R14_AREA" runat="server" BackColor="#BCC7D8">
                                    <asp:ListItem>COBROS</asp:ListItem>
                                    <asp:ListItem>EMISIONES</asp:ListItem>
                                    <asp:ListItem>REGISTROS</asp:ListItem>
                                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R14_FILER" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R14_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <% End If %><% If Request.QueryString("rango").ToString.Equals("III") or Request.QueryString("rango").ToString.Equals("IV") or Request.QueryString("rango").ToString.Equals("V") Then %>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    15)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R15_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
Registro Público de la Propiedad y Comercio del Distrito Federal o de los Estados.
</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R15_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R15_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R15_FEW" runat="server" TargetControlID="R15_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R15_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R15_MEW" TargetControlID="R15_ME" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R15_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R15_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R15_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R15_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R15_FRW" runat="server" TargetControlID="R15_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R15_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R15_MRW" runat="server" TargetControlID="R15_MR" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R15_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R15_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <% End If %><% If Request.QueryString("rango").ToString.Equals("IV") or Request.QueryString("rango").ToString.Equals("V") Then %>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    16)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R16_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
Tesorería del Distrito Federal o su Equivalente en los Estados y Municipios.
</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                TESORERIA DEL DISTRITO FEDERAL.
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R16T_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R16T_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R16T_FEW" runat="server" TargetControlID="R16T_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R16T_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R16T_MEW" TargetControlID="R16T_ME" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R16T_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R16T_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R16T_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R16T_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R16T_FRW" runat="server" TargetControlID="R16T_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R16T_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R16T_MRW" runat="server" TargetControlID="R16T_MR" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R16T_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R16T_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                        <br />
                        EN LOS ESTADOS
                         <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R16E_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R16E_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R16E_FEW" runat="server" TargetControlID="R16E_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R16E_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R16E_MEW" TargetControlID="R16E_ME" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R16E_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R16E_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R16E_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R16E_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R16E_FRW" runat="server" TargetControlID="R16E_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R16E_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R16E_MRW" runat="server" TargetControlID="R16E_MR" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R16E_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R16E_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                        <br />
                        EN LOS MUNICIPIOS
                         <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R16M_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R16M_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R16M_FEW" runat="server" TargetControlID="R16M_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R16M_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R16M_MEW" TargetControlID="R16M_ME" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R16M_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R16M_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R16M_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R16M_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R16M_FRW" runat="server" TargetControlID="R16M_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R16M_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R16M_MRW" runat="server" TargetControlID="R16M_MR" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R16M_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R16M_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    &nbsp;</td>
                <td class="style21">
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <% End If %><% If Request.QueryString("rango").ToString.Equals("V") Then %>
            <tr>
                <td class="style42" bgcolor="#293955" style="color: #FFFFFF">
                    17)</td>
                <td class="style12" colspan="2" bgcolor="#293955" style="color: #FFFFFF">
                    <label>
                    <asp:DropDownList 
                        ID="R17_PN" runat="server" BackColor="#293955" ForeColor="White">
                        <asp:ListItem>NEGATIVO</asp:ListItem>
                        <asp:ListItem>POSITIVO</asp:ListItem>
                    </asp:DropDownList>
Archivo General de Notarías (personas morales).
</label>&nbsp;&nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style12" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td bgcolor="#BCC7D8">
                                &nbsp;&nbsp;Envio:</td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R17_FE" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R17_FE" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R17_FEW" runat="server" TargetControlID="R17_FE" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">&nbsp;&nbsp;
                                <asp:TextBox ID="R17_ME" runat="server" BorderStyle="None" 
                                    BackColor="#BCC7D8" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender runat="server" ID="R17_MEW" TargetControlID="R17_ME" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#BCC7D8">
<asp:FileUpload ID="R17_FILEE" runat="server" BorderStyle="None" BackColor="#BCC7D8" />
<asp:HyperLink ID="R17_DOCE" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFCC66">
                                &nbsp;&nbsp;Recibido:</td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
                                <asp:TextBox ID="R17_FR" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" MaxLength="10"></asp:TextBox>
<asp:CalendarExtender runat="server" TargetControlID="R17_FR" Format="dd/MM/yyyy"></asp:CalendarExtender>
<asp:TextBoxWatermarkExtender ID="R17_FRW" runat="server" TargetControlID="R17_FR" WatermarkText="dd/mm/aaaa" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">&nbsp;&nbsp;
<asp:TextBox ID="R17_MR" runat="server" BorderStyle="None" BackColor="#FFCC66" MaxLength="32" Width="220px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="R17_MRW" runat="server" TargetControlID="R17_MR" WatermarkText="No de OFICIO" WatermarkCssClass="watermarked"></asp:TextBoxWatermarkExtender>
                            </td>
                            <td bgcolor="#FFCC66">
                                <asp:FileUpload ID="R17_FILER" runat="server" BorderStyle="None" 
                                    BackColor="#FFCC66" />
                                    <asp:HyperLink ID="R17_DOCR" runat="server" 
                                    ImageUrl="~/imagenes/sitios/documento.png" Target="_blank" BorderStyle="None" 
                                    Visible="False" Height="18px" ></asp:HyperLink>                                
                            </td>
                        </tr>
                        </table>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    &nbsp;</td>
                <td class="style21">
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <% End If %>
            <tr>
                <td class="style42">
                    &nbsp;</td>
                <td class="style45" >
                    OBSERVACIONES</td>
                <td class="style21">
                    <asp:TextBox ID="TBObservaciones" runat="server" BorderStyle="Solid" 
                        BorderWidth="1px" MaxLength="1000" TextMode="MultiLine" Width="600px"></asp:TextBox>
                </td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

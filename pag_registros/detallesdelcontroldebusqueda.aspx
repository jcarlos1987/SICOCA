<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesdelcontroldebusqueda.aspx.vb" Inherits="WebSIRECA.detallesdelcontroldebusqueda" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
        }
        .style4
        {
            width: 937px;
        }
        .style5
        {
            width: 4px;
        }
        .style6
        {
            width: 265px;
        }
        .style7
        {
            width: 115px;
        }
        .style9
        {
        }
    </style>
</head>
<body bgcolor="#333333">
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
            style="margin-right: 233px" HorizontalAlign="Center">
            <EditItemTemplate>
                SUBDEL:
                <asp:TextBox ID="SUBDELTextBox" runat="server" Text='<%# Bind("SUBDEL") %>' />
                <br />
                REG_PATRONAL:
                <asp:TextBox ID="REG_PATRONALTextBox" runat="server" 
                    Text='<%# Bind("REG_PATRONAL") %>' />
                <br />
                RAZON:
                <asp:TextBox ID="RAZONTextBox" runat="server" Text='<%# Bind("RAZON") %>' />
                <br />
                RCF:
                <asp:TextBox ID="RCFTextBox" runat="server" Text='<%# Bind("RCF") %>' />
                <br />
                RANGO:
                <asp:TextBox ID="RANGOTextBox" runat="server" Text='<%# Bind("RANGO") %>' />
                <br />
                IMPORTE_COP:
                <asp:TextBox ID="IMPORTE_COPTextBox" runat="server" 
                    Text='<%# Bind("IMPORTE_COP") %>' />
                <br />
                CREDITO_COP:
                <asp:TextBox ID="CREDITO_COPTextBox" runat="server" 
                    Text='<%# Bind("CREDITO_COP") %>' />
                <br />
                ESTADO:
                <asp:TextBox ID="ESTADOTextBox" runat="server" Text='<%# Bind("ESTADO") %>' />
                <br />
                INTEGRADOR:
                <asp:TextBox ID="INTEGRADORTextBox" runat="server" 
                    Text='<%# Bind("INTEGRADOR") %>' />
                <br />
                TIPO_PERSONA:
                <asp:TextBox ID="TIPO_PERSONATextBox" runat="server" 
                    Text='<%# Bind("TIPO_PERSONA") %>' />
                <br />
                DOMOCILIO:
                <asp:TextBox ID="DOMOCILIOTextBox" runat="server" 
                    Text='<%# Bind("DOMOCILIO") %>' />
                <br />
                VERIFICACION_DOMICILIO:
                <asp:TextBox ID="VERIFICACION_DOMICILIOTextBox" runat="server" 
                    Text='<%# Bind("VERIFICACION_DOMICILIO") %>' />
                <br />
                ACTIVIDAD:
                <asp:TextBox ID="ACTIVIDADTextBox" runat="server" 
                    Text='<%# Bind("ACTIVIDAD") %>' />
                <br />
                R1:
                <asp:TextBox ID="R1TextBox" runat="server" Text='<%# Bind("R1") %>' />
                <br />
                R2FR:
                <asp:TextBox ID="R2FRTextBox" runat="server" Text='<%# Bind("R2FR") %>' />
                <br />
                R2:
                <asp:TextBox ID="R2TextBox" runat="server" Text='<%# Bind("R2") %>' />
                <br />
                R3FE:
                <asp:TextBox ID="R3FETextBox" runat="server" Text='<%# Bind("R3FE") %>' />
                <br />
                R3FR:
                <asp:TextBox ID="R3FRTextBox" runat="server" Text='<%# Bind("R3FR") %>' />
                <br />
                R3:
                <asp:TextBox ID="R3TextBox" runat="server" Text='<%# Bind("R3") %>' />
                <br />
                R4FE:
                <asp:TextBox ID="R4FETextBox" runat="server" Text='<%# Bind("R4FE") %>' />
                <br />
                R4FR:
                <asp:TextBox ID="R4FRTextBox" runat="server" Text='<%# Bind("R4FR") %>' />
                <br />
                R4:
                <asp:TextBox ID="R4TextBox" runat="server" Text='<%# Bind("R4") %>' />
                <br />
                R5FE:
                <asp:TextBox ID="R5FETextBox" runat="server" Text='<%# Bind("R5FE") %>' />
                <br />
                R5:
                <asp:TextBox ID="R5TextBox" runat="server" Text='<%# Bind("R5") %>' />
                <br />
                R5FR:
                <asp:TextBox ID="R5FRTextBox" runat="server" Text='<%# Bind("R5FR") %>' />
                <br />
                R6F:
                <asp:TextBox ID="R6FTextBox" runat="server" Text='<%# Bind("R6F") %>' />
                <br />
                R6:
                <asp:TextBox ID="R6TextBox" runat="server" Text='<%# Bind("R6") %>' />
                <br />
                R7FE:
                <asp:TextBox ID="R7FETextBox" runat="server" Text='<%# Bind("R7FE") %>' />
                <br />
                R7FR:
                <asp:TextBox ID="R7FRTextBox" runat="server" Text='<%# Bind("R7FR") %>' />
                <br />
                R7:
                <asp:TextBox ID="R7TextBox" runat="server" Text='<%# Bind("R7") %>' />
                <br />
                R6FE:
                <asp:TextBox ID="R6FETextBox" runat="server" Text='<%# Bind("R6FE") %>' />
                <br />
                R6FR:
                <asp:TextBox ID="R6FRTextBox" runat="server" Text='<%# Bind("R6FR") %>' />
                <br />
                R8:
                <asp:TextBox ID="R8TextBox" runat="server" Text='<%# Bind("R8") %>' />
                <br />
                R9FE:
                <asp:TextBox ID="R9FETextBox" runat="server" Text='<%# Bind("R9FE") %>' />
                <br />
                R9FR:
                <asp:TextBox ID="R9FRTextBox" runat="server" Text='<%# Bind("R9FR") %>' />
                <br />
                R9:
                <asp:TextBox ID="R9TextBox" runat="server" Text='<%# Bind("R9") %>' />
                <br />
                R10:
                <asp:TextBox ID="R10TextBox" runat="server" Text='<%# Bind("R10") %>' />
                <br />
                R11FE:
                <asp:TextBox ID="R11FETextBox" runat="server" Text='<%# Bind("R11FE") %>' />
                <br />
                R11FR:
                <asp:TextBox ID="R11FRTextBox" runat="server" Text='<%# Bind("R11FR") %>' />
                <br />
                R11:
                <asp:TextBox ID="R11TextBox" runat="server" Text='<%# Bind("R11") %>' />
                <br />
                R12FE:
                <asp:TextBox ID="R12FETextBox" runat="server" Text='<%# Bind("R12FE") %>' />
                <br />
                R12:
                <asp:TextBox ID="R12TextBox" runat="server" Text='<%# Bind("R12") %>' />
                <br />
                R13FE:
                <asp:TextBox ID="R13FETextBox" runat="server" Text='<%# Bind("R13FE") %>' />
                <br />
                R13:
                <asp:TextBox ID="R13TextBox" runat="server" Text='<%# Bind("R13") %>' />
                <br />
                R14A:
                <asp:TextBox ID="R14ATextBox" runat="server" Text='<%# Bind("R14A") %>' />
                <br />
                R14FR:
                <asp:TextBox ID="R14FRTextBox" runat="server" Text='<%# Bind("R14FR") %>' />
                <br />
                R14F:
                <asp:TextBox ID="R14FTextBox" runat="server" Text='<%# Bind("R14F") %>' />
                <br />
                R14:
                <asp:TextBox ID="R14TextBox" runat="server" Text='<%# Bind("R14") %>' />
                <br />
                R15FE:
                <asp:TextBox ID="R15FETextBox" runat="server" Text='<%# Bind("R15FE") %>' />
                <br />
                R15FR:
                <asp:TextBox ID="R15FRTextBox" runat="server" Text='<%# Bind("R15FR") %>' />
                <br />
                R15:
                <asp:TextBox ID="R15TextBox" runat="server" Text='<%# Bind("R15") %>' />
                <br />
                R16FE_TES:
                <asp:TextBox ID="R16FE_TESTextBox" runat="server" 
                    Text='<%# Bind("R16FE_TES") %>' />
                <br />
                R16FR_TES:
                <asp:TextBox ID="R16FR_TESTextBox" runat="server" 
                    Text='<%# Bind("R16FR_TES") %>' />
                <br />
                R16FE_EST:
                <asp:TextBox ID="R16FE_ESTTextBox" runat="server" 
                    Text='<%# Bind("R16FE_EST") %>' />
                <br />
                R16FR_EST:
                <asp:TextBox ID="R16FR_ESTTextBox" runat="server" 
                    Text='<%# Bind("R16FR_EST") %>' />
                <br />
                R16FE_MUN:
                <asp:TextBox ID="R16FE_MUNTextBox" runat="server" 
                    Text='<%# Bind("R16FE_MUN") %>' />
                <br />
                R16FR_MUN:
                <asp:TextBox ID="R16FR_MUNTextBox" runat="server" 
                    Text='<%# Bind("R16FR_MUN") %>' />
                <br />
                R16:
                <asp:TextBox ID="R16TextBox" runat="server" Text='<%# Bind("R16") %>' />
                <br />
                R17FE:
                <asp:TextBox ID="R17FETextBox" runat="server" Text='<%# Bind("R17FE") %>' />
                <br />
                R17FR:
                <asp:TextBox ID="R17FRTextBox" runat="server" Text='<%# Bind("R17FR") %>' />
                <br />
                R17:
                <asp:TextBox ID="R17TextBox" runat="server" Text='<%# Bind("R17") %>' />
                <br />
                R:
                <asp:TextBox ID="RTextBox" runat="server" Text='<%# Bind("R") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <InsertItemTemplate>
                SUBDEL:
                <asp:TextBox ID="SUBDELTextBox" runat="server" Text='<%# Bind("SUBDEL") %>' />
                <br />
                REG_PATRONAL:
                <asp:TextBox ID="REG_PATRONALTextBox" runat="server" 
                    Text='<%# Bind("REG_PATRONAL") %>' />
                <br />
                RAZON:
                <asp:TextBox ID="RAZONTextBox" runat="server" Text='<%# Bind("RAZON") %>' />
                <br />
                RCF:
                <asp:TextBox ID="RCFTextBox" runat="server" Text='<%# Bind("RCF") %>' />
                <br />
                RANGO:
                <asp:TextBox ID="RANGOTextBox" runat="server" Text='<%# Bind("RANGO") %>' />
                <br />
                IMPORTE_COP:
                <asp:TextBox ID="IMPORTE_COPTextBox" runat="server" 
                    Text='<%# Bind("IMPORTE_COP") %>' />
                <br />
                CREDITO_COP:
                <asp:TextBox ID="CREDITO_COPTextBox" runat="server" 
                    Text='<%# Bind("CREDITO_COP") %>' />
                <br />
                ESTADO:
                <asp:TextBox ID="ESTADOTextBox" runat="server" Text='<%# Bind("ESTADO") %>' />
                <br />
                INTEGRADOR:
                <asp:TextBox ID="INTEGRADORTextBox" runat="server" 
                    Text='<%# Bind("INTEGRADOR") %>' />
                <br />
                TIPO_PERSONA:
                <asp:TextBox ID="TIPO_PERSONATextBox" runat="server" 
                    Text='<%# Bind("TIPO_PERSONA") %>' />
                <br />
                DOMOCILIO:
                <asp:TextBox ID="DOMOCILIOTextBox" runat="server" 
                    Text='<%# Bind("DOMOCILIO") %>' />
                <br />
                VERIFICACION_DOMICILIO:
                <asp:TextBox ID="VERIFICACION_DOMICILIOTextBox" runat="server" 
                    Text='<%# Bind("VERIFICACION_DOMICILIO") %>' />
                <br />
                ACTIVIDAD:
                <asp:TextBox ID="ACTIVIDADTextBox" runat="server" 
                    Text='<%# Bind("ACTIVIDAD") %>' />
                <br />
                R1:
                <asp:TextBox ID="R1TextBox" runat="server" Text='<%# Bind("R1") %>' />
                <br />
                R2FR:
                <asp:TextBox ID="R2FRTextBox" runat="server" Text='<%# Bind("R2FR") %>' />
                <br />
                R2:
                <asp:TextBox ID="R2TextBox" runat="server" Text='<%# Bind("R2") %>' />
                <br />
                R3FE:
                <asp:TextBox ID="R3FETextBox" runat="server" Text='<%# Bind("R3FE") %>' />
                <br />
                R3FR:
                <asp:TextBox ID="R3FRTextBox" runat="server" Text='<%# Bind("R3FR") %>' />
                <br />
                R3:
                <asp:TextBox ID="R3TextBox" runat="server" Text='<%# Bind("R3") %>' />
                <br />
                R4FE:
                <asp:TextBox ID="R4FETextBox" runat="server" Text='<%# Bind("R4FE") %>' />
                <br />
                R4FR:
                <asp:TextBox ID="R4FRTextBox" runat="server" Text='<%# Bind("R4FR") %>' />
                <br />
                R4:
                <asp:TextBox ID="R4TextBox" runat="server" Text='<%# Bind("R4") %>' />
                <br />
                R5FE:
                <asp:TextBox ID="R5FETextBox" runat="server" Text='<%# Bind("R5FE") %>' />
                <br />
                R5:
                <asp:TextBox ID="R5TextBox" runat="server" Text='<%# Bind("R5") %>' />
                <br />
                R5FR:
                <asp:TextBox ID="R5FRTextBox" runat="server" Text='<%# Bind("R5FR") %>' />
                <br />
                R6F:
                <asp:TextBox ID="R6FTextBox" runat="server" Text='<%# Bind("R6F") %>' />
                <br />
                R6:
                <asp:TextBox ID="R6TextBox" runat="server" Text='<%# Bind("R6") %>' />
                <br />
                R7FE:
                <asp:TextBox ID="R7FETextBox" runat="server" Text='<%# Bind("R7FE") %>' />
                <br />
                R7FR:
                <asp:TextBox ID="R7FRTextBox" runat="server" Text='<%# Bind("R7FR") %>' />
                <br />
                R7:
                <asp:TextBox ID="R7TextBox" runat="server" Text='<%# Bind("R7") %>' />
                <br />
                R6FE:
                <asp:TextBox ID="R6FETextBox" runat="server" Text='<%# Bind("R6FE") %>' />
                <br />
                R6FR:
                <asp:TextBox ID="R6FRTextBox" runat="server" Text='<%# Bind("R6FR") %>' />
                <br />
                R8:
                <asp:TextBox ID="R8TextBox" runat="server" Text='<%# Bind("R8") %>' />
                <br />
                R9FE:
                <asp:TextBox ID="R9FETextBox" runat="server" Text='<%# Bind("R9FE") %>' />
                <br />
                R9FR:
                <asp:TextBox ID="R9FRTextBox" runat="server" Text='<%# Bind("R9FR") %>' />
                <br />
                R9:
                <asp:TextBox ID="R9TextBox" runat="server" Text='<%# Bind("R9") %>' />
                <br />
                R10:
                <asp:TextBox ID="R10TextBox" runat="server" Text='<%# Bind("R10") %>' />
                <br />
                R11FE:
                <asp:TextBox ID="R11FETextBox" runat="server" Text='<%# Bind("R11FE") %>' />
                <br />
                R11FR:
                <asp:TextBox ID="R11FRTextBox" runat="server" Text='<%# Bind("R11FR") %>' />
                <br />
                R11:
                <asp:TextBox ID="R11TextBox" runat="server" Text='<%# Bind("R11") %>' />
                <br />
                R12FE:
                <asp:TextBox ID="R12FETextBox" runat="server" Text='<%# Bind("R12FE") %>' />
                <br />
                R12:
                <asp:TextBox ID="R12TextBox" runat="server" Text='<%# Bind("R12") %>' />
                <br />
                R13FE:
                <asp:TextBox ID="R13FETextBox" runat="server" Text='<%# Bind("R13FE") %>' />
                <br />
                R13:
                <asp:TextBox ID="R13TextBox" runat="server" Text='<%# Bind("R13") %>' />
                <br />
                R14A:
                <asp:TextBox ID="R14ATextBox" runat="server" Text='<%# Bind("R14A") %>' />
                <br />
                R14FR:
                <asp:TextBox ID="R14FRTextBox" runat="server" Text='<%# Bind("R14FR") %>' />
                <br />
                R14F:
                <asp:TextBox ID="R14FTextBox" runat="server" Text='<%# Bind("R14F") %>' />
                <br />
                R14:
                <asp:TextBox ID="R14TextBox" runat="server" Text='<%# Bind("R14") %>' />
                <br />
                R15FE:
                <asp:TextBox ID="R15FETextBox" runat="server" Text='<%# Bind("R15FE") %>' />
                <br />
                R15FR:
                <asp:TextBox ID="R15FRTextBox" runat="server" Text='<%# Bind("R15FR") %>' />
                <br />
                R15:
                <asp:TextBox ID="R15TextBox" runat="server" Text='<%# Bind("R15") %>' />
                <br />
                R16FE_TES:
                <asp:TextBox ID="R16FE_TESTextBox" runat="server" 
                    Text='<%# Bind("R16FE_TES") %>' />
                <br />
                R16FR_TES:
                <asp:TextBox ID="R16FR_TESTextBox" runat="server" 
                    Text='<%# Bind("R16FR_TES") %>' />
                <br />
                R16FE_EST:
                <asp:TextBox ID="R16FE_ESTTextBox" runat="server" 
                    Text='<%# Bind("R16FE_EST") %>' />
                <br />
                R16FR_EST:
                <asp:TextBox ID="R16FR_ESTTextBox" runat="server" 
                    Text='<%# Bind("R16FR_EST") %>' />
                <br />
                R16FE_MUN:
                <asp:TextBox ID="R16FE_MUNTextBox" runat="server" 
                    Text='<%# Bind("R16FE_MUN") %>' />
                <br />
                R16FR_MUN:
                <asp:TextBox ID="R16FR_MUNTextBox" runat="server" 
                    Text='<%# Bind("R16FR_MUN") %>' />
                <br />
                R16:
                <asp:TextBox ID="R16TextBox" runat="server" Text='<%# Bind("R16") %>' />
                <br />
                R17FE:
                <asp:TextBox ID="R17FETextBox" runat="server" Text='<%# Bind("R17FE") %>' />
                <br />
                R17FR:
                <asp:TextBox ID="R17FRTextBox" runat="server" Text='<%# Bind("R17FR") %>' />
                <br />
                R17:
                <asp:TextBox ID="R17TextBox" runat="server" Text='<%# Bind("R17") %>' />
                <br />
                R:
                <asp:TextBox ID="RTextBox" runat="server" Text='<%# Bind("R") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table align="center" border="0" bgcolor="White" cellpadding="4" 
                    cellspacing="0" class="style4">
                    <tr>
                        <td class="style5" bgcolor="#FAFAFA">
                            &nbsp;</td>
                        <td bgcolor="#FAFAFA" class="style2" colspan="5">
                            <asp:Image ID="Image2" runat="server" 
                                ImageUrl="~/imagenes/sitios/imss_principal.jpg" />
                        </td>
                        <td bgcolor="#FAFAFA" class="style6">
                            &nbsp;</td>
                        <td align="right" bgcolor="#FAFAFA" class="style7">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/sitios/sireca.png" />
                        </td>
                        <td align="right" bgcolor="#FAFAFA" class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="6">
                            INTEGRADOR:<asp:TextBox ID="TextBox10" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("INTEGRADOR") %>' Width="400px"></asp:TextBox>
                            SUBDELEGACIÓN:<asp:TextBox ID="TBRango0" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("SUBDEL") %>' Width="40px"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td align="center" bgcolor="#CCCFD2" class="style2" colspan="7">
                            <asp:Label ID="Label1" runat="server" 
                                Text="CONTROL DE INTEGRACIÓN DE EXPEDIENTES [ACUERDO 469/2005]" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            REGISTRO PATRONAL:</td>
                        <td class="style9" colspan="2">
                            <asp:TextBox ID="tbrEGPAT" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" Text='<%# "  " & Eval("REG_PATRONAL") %>' 
                                ReadOnly="True" Width="90px"></asp:TextBox>
                            &nbsp; ACTIVIDAD:<asp:TextBox ID="TBActividad" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("ACTIVIDAD") %>' Width="300px"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            NOMBRE O RAZON SOCIAL:</td>
                        <td colspan="2">
                            <asp:TextBox ID="TBRazon" runat="server" Text='<%# "  " & Eval("RAZON") %>' 
                                BorderColor="#D2D2D2" BorderStyle="Solid" BorderWidth="1px" Width="480px" 
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            DOMICILIO FISCAL:</td>
                        <td class="style9" colspan="3">
                            <asp:TextBox ID="TBDomicilio" runat="server" Text='<%# "  " & Eval("DOMOCILIO") %>' 
                                BorderColor="#D2D2D2" BorderStyle="Solid" BorderWidth="1px" Width="480px" 
                                ReadOnly="True" ></asp:TextBox>
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            PERSONA:<asp:TextBox ID="TextBox1" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("TIPO_PERSONA") %>' Width="90px"></asp:TextBox>
                        </td>
                        <td class="style9">
                            RANGO:<asp:TextBox ID="TBRango" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" Text='<%# "  " & Eval("RANGO") %>' 
                                Width="40px" ReadOnly="True"></asp:TextBox>                                
                        </td>
                        <td class="style6">
                            R.F.C.:<asp:TextBox ID="TextBox3" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" Text='<%# "  " & Eval("RCF") %>' 
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            &nbsp;</td>
                        <td class="style9">
                            CREDITOS C.O.P.:<asp:TextBox ID="TextBox4" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("CREDITO_COP", "{0:N0}") %>' Width="40px"></asp:TextBox>
                        </td>
                        <td class="style6">
                            IMPORTE C.O.P.:<asp:TextBox ID="TextBox5" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" Text='<%# "  " & Eval("IMPORTE_COP", "{0:C}") %>' 
                                Width="80px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            &nbsp;</td>
                        <td class="style9">
                            CREDITOS R.C.V.:<asp:TextBox ID="TextBox6" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("CREDITO_RCV", "{0:N0}") %>' Width="40px"></asp:TextBox>
                        </td>
                        <td class="style6">
                            IMPORTE R.C.V..:<asp:TextBox ID="TextBox7" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" Text='<%# "  " & Eval("IMPORTE_RCV", "{0:C}") %>' 
                                Width="80px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="5">
                            ESTATUS:<asp:TextBox ID="TextBox8" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" ReadOnly="True" 
                                Text='<%# "  " & Eval("ESTADO") %>'></asp:TextBox>
                        </td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            OBSERVACIÓN:</td>
                        <td colspan="2" rowspan="2">
                            <asp:TextBox ID="TextBox9" runat="server" BorderColor="#D2D2D2" 
                                BorderStyle="Solid" BorderWidth="1px" Height="40px" 
                                Text='<%# Eval("OBSERVACION") %>' TextMode="MultiLine" Width="500px" 
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            &nbsp;</td>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style2" align="center" bgcolor="#CCCFD2" colspan="7">
                            <asp:Label ID="Label2" runat="server" 
                                Text="CONTENIDO DEL EXPEDIENTE DE ACUERDO 469/2005" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            &nbsp;</td>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ID="Image8" runat="server" Height="20px" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("R1") & "0.png" %>' Width="20px" 
                                ImageAlign="AbsBottom" />
                            <asp:Image ID="Image9" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR1") & "0.png" %>' Width="20px" />
                            01)CATALOGO DE CONTROL DE RESULTADOS DEL DEPARTAMENTO DE COBRANZA.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6">
                            <asp:Image runat="server" Height="20px" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("R2") & "0.png" %>' 
                                Width="20px" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image10" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR2") & "0.png" %>' 
                                Width="20px" />
                            02)EXPEDIENTE DE PAGOS Y GENERALIDADES.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image runat="server" Width="20" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("R3") & "0.png" %>' Height="20" 
                                ImageAlign="AbsBottom" />
                            <asp:Image ID="Image11" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR3") & "0.png" %>' 
                                Width="20px" />
                            03)EXPEDIENTE DE LA OFICINA DE EMISION Y PAGO OPORTUNO.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image runat="server" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("R4") & "0.png" %>'  Width="20" 
                                Height="20" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image12" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR4") & "0.png" %>' 
                                Width="20px" />
                            04)EXPEDIENTE DE LA OFICINA PARA COBROS.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R5") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image13" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR5") & "0.png" %>' 
                                Width="20px" />
                            05)EXPEDIENTE DE CONVENIOS DE PAGOS A PLAZOS Y DE GARANTIAS.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R6") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image14" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR6") & "0.png" %>' 
                                Width="20px" />
                            06)CATALOGO NACIONAL DE PATRONES SINDO EN LAS TRES REGIONES.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R7") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image15" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR7") & "0.png" %>' 
                                Width="20px" />
                            07)EXPEDIENTE DEL DEPARTAMENTO DE AFILIACION VIGENCIA.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R8") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image16" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR8") & "0.png" %>' 
                                Width="20px" />
                            08)EXPEDIENTE DEL DEPARTAMENTO DE AUDITORIA A PATRONES.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R9") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image17" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR9") & "0.png" %>' 
                                Width="20px" />
                            09)INFORMA DE LA JEFATURA DELEGACIONAL DE SERVICIOS JURIDICOS.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R10") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image18" runat="server" Height="20" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR10") & "0.png" %>' Width="20" />
                            10)DIRECTORIOS TELEFONICOS DE LA ZONA (BLANCO, AMARILLO, POR ACTIVIDAD Y/O POR 
                            CALLES).</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R11") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image19" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR11") & "0.png" %>' 
                                Width="20px" />
                            11)CONSULTA A LAS UNIDADES ADMINISTRATIVAS LOCALES DE SERVICIO DE ADMINISTRACION 
                            TRIBUTARIA.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R12") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image20" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR12") & "0.png" %>' 
                                Width="20px" />
                            12)&quot;COMPRANET&quot; COMO PROVEEDOR O CONTRATISTA.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R13") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image21" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR13") & "0.png" %>' 
                                Width="20px" />
                            13)&quot;SIEM&quot;.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <% If Request.QueryString("rango").ToString.Equals("II") Or Request.QueryString("rango").ToString.Equals("III") Or Request.QueryString("rango").ToString.Equals("IV") Or Request.QueryString("rango").ToString.Equals("V") Then%>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6">
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R14") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image22" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR14") & "0.png" %>' 
                                Width="20px" />
                            14)ENTREVISTA A TRES VECINOS.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <% End If %><% If Request.QueryString("rango").ToString.Equals("III") Or Request.QueryString("rango").ToString.Equals("IV") Or Request.QueryString("rango").ToString.Equals("V") Then%>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6">
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R15") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image23" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR15") & "0.png" %>' 
                                Width="20px" />
                            15)TESORERIA DEL DISTRITO FEDERAL O SU EQUIVALENTE EN LOS ESTADOS Y MUNICIPIOS.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <% End If %><% If Request.QueryString("rango").ToString.Equals("IV") Or Request.QueryString("rango").ToString.Equals("V") Then%>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6">
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R16") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image24" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR16") & "0.png" %>' 
                                Width="20px" />
                            16)REGISTRO PUBLICO DE LA PROPIEDAD Y DEL COMERCIO DEL DISTRITO FEDERAL O DE LOS 
                            ESTADOS.</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <% End If %><% If Request.QueryString("rango").ToString.Equals("V") Then %>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td colspan="6" >
                            <asp:Image ImageUrl='<%# "~/imagenes/sitios/" & Eval("R17") & "0.png" %>'  
                                Width="20" Height="20" runat="server" ImageAlign="AbsBottom" />
                            <asp:Image ID="Image25" runat="server" Height="20px" ImageAlign="AbsBottom" 
                                ImageUrl='<%# "~/imagenes/sitios/" & Eval("IMG_FR17") & "0.png" %>' 
                                Width="20px" />
                            17)ARCHIVO GENERAL DE NOTARIAS (PERSONAS MORALES).</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <% End If  %>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td  colspan="4">
                            &nbsp;</td>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                </table>

            </ItemTemplate>
        </asp:FormView>
   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT nd.[SUBDEL] as SUBDEL
,[REG_PAT] as REG_PATRONAL
,[NOMBRE_PATRON] as RAZON
,ptn.rfc as RCF
,[RANGO] as RANGO
,[IMPORTE_COP] as IMPORTE_COP
,[CRED_COP] as CREDITO_COP
,[IMPORTE_RCV] as IMPORTE_RCV
,[CRED_RCV] as CREDITO_RCV
,R_ESTADO_INTEGRACION as ESTADO
,C_OBSEVACION as OBSERVACION
,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf  WHERE uf.id=C_INTEGRADOR) as INTEGRADOR
,case 
when len(ptn.rfc)=13 then 'FISICA'
when len(ptn.rfc)=10 then 'FISICA'
when len(ptn.rfc)=12 then 'MORAL'
when len(ptn.rfc)=11 then 'MORAL'
when [NOMBRE_PATRON] like '% SA %' then 'MORAL'
when [NOMBRE_PATRON] like '% S A %' then 'MORAL'
when [NOMBRE_PATRON] like '% S.A. %' then 'MORAL'
when [NOMBRE_PATRON] like '% S. A. %' then 'MORAL'
when [NOMBRE_PATRON] like '% PRIVADA %' then 'MORAL'
when [NOMBRE_PATRON] like '% CV %' then 'MORAL'
when [NOMBRE_PATRON] like '% C V %' then 'MORAL'
when [NOMBRE_PATRON] like '% C.V. %' then 'MORAL'
when [NOMBRE_PATRON] like '% C. V. %' then 'MORAL'
when [NOMBRE_PATRON] like '% SC %' then 'MORAL'
when [NOMBRE_PATRON] like '% S C %' then 'MORAL'
when [NOMBRE_PATRON] like '% S.C. %' then 'MORAL'
when [NOMBRE_PATRON] like '% A. C. %' then 'MORAL'
when [NOMBRE_PATRON] like '% SCP %' then 'MORAL'
when [NOMBRE_PATRON] like '% S C P %' then 'MORAL'
when [NOMBRE_PATRON] like '% S.C.P. %' then 'MORAL'
when [NOMBRE_PATRON] like '% S. C. P. %' then 'MORAL'
when [NOMBRE_PATRON] like '% S DE %' then 'MORAL'
when [NOMBRE_PATRON] like '% S. DE %' then 'MORAL'
when [NOMBRE_PATRON] like '% MAYAB %' then 'MORAL'
when [NOMBRE_PATRON] like '% PENINSULARES %' then 'MORAL'
when [NOMBRE_PATRON] like '% PESQUERA %' then 'MORAL'
when [NOMBRE_PATRON] like '% MEDICO %' then 'MORAL'
else 'FISICA'
end as TIPO_PERSONA
,[R_DOMICILIO_FISCAL] as DOMOCILIO
,[R_VERIF_DOM_FISCAL_PN] AS VERIFICACION_DOMICILIO
,[R_ACTIVIDAD] AS ACTIVIDAD
,[R1_CATALOGO_PN] AS R1
,[R2_EXP_PAG_GEN_FILER] AS R2FR
,[R2_EXP_PAG_GEN_PN] AS R2
,[R3_EXP_OEPO_FILEE] AS R3FE
,[R3_EXP_OEPO_FILER] AS R3FR
,[R3_EXP_OEPO_PN] AS R3
,[R4_EXP_COBROS_FILEE] AS R4FE
,[R4_EXP_COBROS_FILER] AS R4FR
,[R4_EXP_COBROS_PN] AS R4
,[R5_EXP_CONVENIO_FILEE] AS R5FE
,[R5_EXP_CONVENIO_PN] AS R5
,[R5_EXP_CONVENIO_FILER] AS R5FR
,[R6_CAT_NAC_PAT_FILE] AS R6F
,[R6_CAT_NAC_PAT_PN] AS R6
,[R7_EXP_AFIL_VIGEN_FILEE] AS R7FE
,[R7_EXP_AFIL_VIGEN_FILER] AS R7FR
,[R7_EXP_AFIL_VIGEN_PN] AS R7
,[R8_EXP_AUDIT_FILEE] AS R6FE
,[R8_EXP_AUDIT_FILER] AS R6FR
,[R8_EXP_AUDIT_PN] AS R8
,[R9_INF_JEF_SERV_JURD_FILEE] AS R9FE
,[R9_INF_JEF_SERV_JURD_FILER] AS R9FR
,[R9_INF_JEF_SERV_JURD_PN] AS R9
,[R10_DIRECTORIO_TEL_PN] AS R10
,[R11_SAT_FILEE] AS R11FE
,[R11_SAT_FILER] AS R11FR
,[R11_SAT_PN] AS R11
,[R12_COMPRANET_FILE] AS R12FE
,[R12_COMPRANET_PN] AS R12
,[R13_SIEM_FILE] AS R13FE
,[R13_SIEM_PN] AS R13
,[R14_ENTREVISTA_A_TRES_TRAB_AREA] AS R14A
,[R14_ENTREVISTA_A_TRES_TRAB_FR] AS R14FR
,[R14_ENTREVISTA_A_TRES_TRAB_FILE] AS R14F
,[R14_ENTREVISTA_A_TRES_TRAB_PN] AS R14
,[R15_OFIC_REG_PUB_PROP_Y_COMER_FILEE] AS R15FE
,[R15_OFIC_REG_PUB_PROP_Y_COMER_FILER] AS R15FR
,[R15_OFIC_REG_PUB_PROP_Y_COMER_PN] AS R15
,[R161_OFIC_TESORERIA_Y_FINZS_FILEE] AS R16FE_TES
,[R161_OFIC_TESORERIA_Y_FINZS_FILER] AS R16FR_TES
,[R162_OFIC_SECRETARIA_HCDA_EST_FILEE] AS R16FE_EST
,[R162_OFIC_SECRETARIA_HCDA_EST_FILER] AS R16FR_EST
,[R162_OFIC_SECRETARIA_HCDA_MUN_FILEE] AS R16FE_MUN
,[R162_OFIC_SECRETARIA_HCDA_MUN_FILER] AS R16FR_MUN
,[R16_OFIC_TESORERIA_SECRETARIA_PN] AS R16
,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILEE] AS R17FE
,[R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER] AS R17FR
,[R17_OFIC_A_NOTARIAS_PERS_MORAL_PN] AS R17
,[R_AVANCE]  AS R
      ,(CASE WHEN [R1_CATALOGO_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR1
      ,(CASE WHEN [R2_EXP_PAG_GEN_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR2
      ,(CASE WHEN [R3_EXP_OEPO_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR3
      ,(CASE WHEN [R4_EXP_COBROS_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR4
      ,(CASE WHEN [R5_EXP_CONVENIO_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR5
      ,(CASE WHEN [R6_CAT_NAC_PAT_FILE] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR6
      ,(CASE WHEN [R7_EXP_AFIL_VIGEN_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR7
      ,(CASE WHEN [R8_EXP_AUDIT_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR8
      ,(CASE WHEN [R9_INF_JEF_SERV_JURD_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR9
      ,(CASE WHEN [R10_DIRECTORIO_TEL_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR10
      ,(CASE WHEN [R11_SAT_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR11
      ,(CASE WHEN [R12_COMPRANET_FILE] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR12
      ,(CASE WHEN [R13_SIEM_FILE] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR13
      ,(CASE WHEN [R14_ENTREVISTA_A_TRES_TRAB_FILE] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR14
      ,(CASE WHEN [R15_OFIC_REG_PUB_PROP_Y_COMER_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR15
	  ,(
	  CASE WHEN 
	  [R161_OFIC_TESORERIA_Y_FINZS_FILER] IS NULL
      OR [R162_OFIC_SECRETARIA_HCDA_EST_FILER] IS NULL
      OR [R162_OFIC_SECRETARIA_HCDA_MUN_FILER] IS NULL
	  THEN 'NORECIBIDO' ELSE 'RECIBIDO' END
	  ) AS IMG_FR16      
      ,(CASE WHEN [R17_OFIC_A_NOTARIAS_PERS_MORAL_FILER] IS NULL THEN 'NORECIBIDO' ELSE 'RECIBIDO' END) AS IMG_FR17
  FROM [sirecaregistros].[dbo].[nodiligenciados] as nd
  left join [sirecaregistros].[dbo].[registrorangos] as rr
  on REG_PAT=R_REGPAT
  left join [sirecaregistros].[dbo].[controlrangos] as cr
  on nd.ID_ND=cr.ID_ND
  left join sireca.dbo.patrones as ptn on regpat=r_regpat
  WHERE REG_PAT = ?
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000000" Name="?" 
                    QueryStringField="regpat" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:HiddenField ID="HFRango" runat="server" />
        <asp:HiddenField ID="HFRegpat" runat="server" />
    
    </div>
    </form>
</body>
</html>

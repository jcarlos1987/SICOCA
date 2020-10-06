<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="actualizar05.aspx.vb" Inherits="WebSIRECA.actualizar05" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CONVENIOS</title>
    <link href="../../css/body.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>
        <table class="style4" align="center">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td >
                    &nbsp;
                    <asp:Label ID="LMsg" runat="server" Font-Bold="True" ForeColor="#009933" ></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:LinkButton ID="LBGuardar" runat="server" BackColor="#FFF3CD" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False">&nbsp;&nbsp;GUARDAR CAMBIOS&nbsp;&nbsp;</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    1)</td>
                <td >
                    &nbsp; TIPO DE PROCESO</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="DDLTipoProceso" runat="server">
                        <asp:ListItem>BASE</asp:ListItem>
                        <asp:ListItem>AMPLIACION</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    2)</td>
                <td >
                    &nbsp;
                    SOLICITUD</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="DDL1" runat="server">
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    3)</td>
                <td >
                    &nbsp;
                    IFE</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="DDL2" runat="server">
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
                        <tr>
                <td>
                    &nbsp;
                    4)</td>
                <td >
                    &nbsp;
                    ACTA CONSTITUTIVA</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="DDL3" runat="server">
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
                        <tr>
                <td>
                    &nbsp;
                    5)</td>
                <td >
                    &nbsp;
                    GARANTIA</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="DDL4" runat="server">
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
                        <tr>
                <td>
                    &nbsp;
                    6)</td>
                <td >
                    &nbsp;
                    EVALUO</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="DDL5" runat="server">
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
                        <tr>
                <td>
                    &nbsp;</td>
                <td >
                    ADEUDO TOTAL:</td>
                <td>
                &nbsp;
                    <asp:TextBox ID="TBAdeuTotal" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un adeudo valido, SOLO NUMEROS" ControlToValidate="TBAdeuTotal" ValidationExpression="\d{1,10}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RegularExpressionValidator1"></asp:ValidatorCalloutExtender>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Se requiere el adeudo total a pagar." ControlToValidate="TBAdeuTotal" Display="None"></asp:RequiredFieldValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1"></asp:ValidatorCalloutExtender>
                </td>
            </tr>
                        <tr>
                <td>
                    &nbsp;
                    7)</td>
                <td >
                    &nbsp;
                    <asp:Label ID="LPagoInicial" runat="server" Text="PAGO INICIAL"></asp:Label>
                            </td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TBPagoInicial" runat="server" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese un pago inicial valido, SOLO NUMEROS" ControlToValidate="TBPagoInicial" ValidationExpression="\d{1,10}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RegularExpressionValidator2"></asp:ValidatorCalloutExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Se requiere de un pago INICIAL." ControlToValidate="TBPagoInicial" Display="None"></asp:RequiredFieldValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2"></asp:ValidatorCalloutExtender>
                </td>
            </tr>
                        <tr>
                <td>
                    &nbsp;
                    8)</td>
                <td >
                    &nbsp;
                    PAGO DE MULTA</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TBPagoMulta" runat="server" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ingrese un pago de multa valido, SOLO NUMEROS" ControlToValidate="TBPagoMulta" ValidationExpression="\d{1,10}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RegularExpressionValidator3"></asp:ValidatorCalloutExtender>

                </td>
            </tr>
                        </table>
    </div>
    </form>
</body>
</html>

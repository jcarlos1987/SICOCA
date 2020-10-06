<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="agregarpagoconvenio52.aspx.vb" Inherits="WebSIRECA.agregarpagoconvenio52" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/body.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>
        <table align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="LMsgError" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="Label1" runat="server" Text="CONTROL DE PAGOS" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#BCC7D8" align="center">
                    <asp:Label ID="Label2" runat="server" Text="FECHA DE PAGO" Font-Bold="True"></asp:Label>
                    </td>
                <td bgcolor="#6CE26C" align="center" >
                    <asp:Label ID="Label3" runat="server" Text="PAGO $" Font-Bold="True"></asp:Label>

                </td>
                <td bgcolor="#BCC7D8" align="center">
                    <asp:Label ID="Label4" runat="server" Text="FOLIO DE PAGO" Font-Bold="True"></asp:Label>
    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#BCC7D8" align="center">
                    <asp:TextBox ID="TBFecPago" runat="server" BorderStyle="Solid" 
                        BorderWidth="1px" MaxLength="10" Width="100px"></asp:TextBox>
                        <asp:CalendarExtender id="CalendarExtender2" runat="server" TargetControlID="TBFecPago" Format="dd/MM/yyyy">
                    </asp:CalendarExtender>
                    </td>
                <td bgcolor="#6CE26C" align="center" >
                    <asp:TextBox ID="TBPago" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                        MaxLength="10" Width="100px">0</asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Ingrese un pago valido, SOLO NUMEROS" ControlToValidate="TBPago" 
                        ValidationExpression="\d{1,10}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RegularExpressionValidator1"></asp:ValidatorCalloutExtender>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Se requiere de un pago ó 0 de no pagar." ControlToValidate="TBPago" Display="None"></asp:RequiredFieldValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1"></asp:ValidatorCalloutExtender>

                </td>
                <td bgcolor="#BCC7D8" align="center">
                    <asp:TextBox ID="TBFolioPago" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                        MaxLength="40" Width="100px"></asp:TextBox>
    
                </td>
                <td>
                    <asp:Button ID="BPago" runat="server" Text="Agregar Pago" BackColor="#FFF3CD" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
    
        <asp:GridView ID="GridViewPagos" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourcePagos" 
            HorizontalAlign="Center" Width="450px">
            <Columns>
                <asp:BoundField DataField="FECH_PAGO" DataFormatString="{0:D}" 
                    HeaderText="FECHA DE PAGO" SortExpression="FECH_PAGO" />
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_PAGO" HeaderText="FOLIO DE PAGO" 
                    SortExpression="FOLIO_PAGO" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePagos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
[FECH_PAGO]
,[IMPORTE]
,[FOLIO_PAGO]
FROM [sirecacobros].[dbo].[convenio52]
WHERE [ID_CONVENIO05]=? and [SUBDEL]=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="id" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

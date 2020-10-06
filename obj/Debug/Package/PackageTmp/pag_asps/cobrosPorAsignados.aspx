<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cobrosPorAsignados.aspx.vb" Inherits="WebSIRECA.cobrosPorAsignados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 256px;
        }
        body {
	font-family: "Calibri";
}
        .style3
        {
            width: 262px;
        }
        .style4
        {
            width: 262px;
        }
    </style>
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" 
            ImageAlign="Left" ImageUrl="~/imagenes/imprimir1.jpg" 
            onclientclick="javascript:window.print();" Width="40px" />
    <asp:Label ID="LNombre1" runat="server" Text=""></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="Factura(s)" 
            CellPadding="3" DataSourceID="SqlDataSource2" Font-Size="9pt" 
            AllowSorting="True" EmptyDataText="Sin Facturas Disponibles" 
            AllowPaging="True" PageSize="35">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                    SortExpression="emi_sec" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE_O_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="NOMBRE_O_RAZON_SOCIAL" />
                <asp:BoundField DataField="EMIP_DOM" HeaderText="DOM." 
                    SortExpression="EMIP_DOM" />
                <asp:BoundField DataField="TP" HeaderText="TP" SortExpression="TP" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    DataFormatString="{0:C}" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            SelectCommand="SELECT ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL
, ptn.dom AS EMIP_DOM, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#
, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco
, eco.sector AS emi_sec 
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.sector = '4' OR eco.sector = '8') AND (eco.subdel = ?) AND (eco.cambiarIncidencia = ?) 
ORDER BY eco.clave, emi_sec, EMIP_DOM">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" Value="9" />
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <table style="width: 890;">
        <tr>
            <td class="style3">
                <asp:Label ID="LNombre2" runat="server" Font-Size="10pt"></asp:Label>
                <hr />
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Nombre y Firma del Inspector</strong></td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                <strong>Nombre y Firma del Supervisor</strong></td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
    </center>
</body>
</html>

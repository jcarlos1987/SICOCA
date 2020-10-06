<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesSeleccionAMGP.aspx.vb" Inherits="WebSIRECA.DetallesSeleccionAMGP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceDSAMG" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="PATRON" HeaderText="PATRON" 
                    SortExpression="PATRON" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:HyperLinkField 
                    DataTextField="CREDITOS" DataTextFormatString="{0:N0}" HeaderText="CREDITOS" 
                    SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDSAMG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR] as PATRON
,max(razon_social) as RAZON_SOCIAL
,count(numcred) as CREDITOS
,cotiz as COTIZANTES
,sum(adeudo) as IMPORTE
  FROM [sirecacobros].[dbo].[ecoTiposReporte]
  where tipo=?
  and subdel=?
  --tipofile
  group by [REGPATR],cotiz">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="tipo" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="subdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

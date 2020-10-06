<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesSemaforo.aspx.vb" Inherits="WebSIRECA.detallesSemaforo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceDetallesSemaforo" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="periodos" HeaderText="periodos" 
                    SortExpression="periodos" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDetallesSemaforo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
      ,[IMPORTE]
      ,[RAZON_SOCIAL]
      ,[periodos]
      ,[SEMAFORO]
  FROM [sireca].[dbo].[semaforomes]
where [SEMAFORO]=?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" SessionField="semaforo" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

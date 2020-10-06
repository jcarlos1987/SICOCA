<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebPAEDetalles.aspx.vb" Inherits="WebSIRECA.WebPAEDetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
        <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div><center>
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ToolTip="Imprimir MANDAMIENTO" ImageUrl="~/imagenes/imprimir1.jpg" />&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ToolTip="Imprimir AMPLIACION" ImageUrl="~/imagenes/imprimir1.jpg" />&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton3" runat="server" ToolTip="Imprimir ACUERDO" 
            ImageUrl="~/imagenes/imprimir1.jpg" />&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton4" runat="server" 
            ToolTip="Imprimir CERRAJERO" ImageUrl="~/imagenes/imprimir1.jpg" /></center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourcePAEDetalles" 
            HorizontalAlign="Center" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" 
                    SortExpression="NUMCRED" />
                <asp:TemplateField HeaderText="CREDITOS A TRABAJAR">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO" />
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                <asp:BoundField DataField="COTIZ" HeaderText="cotizantes" 
                    SortExpression="COTIZ" />
                <asp:BoundField DataField="emision" HeaderText="emision" 
                    SortExpression="emision" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
                Font-Size="11pt" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePAEDetalles" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
      ,[NUMCRED]
      ,[PERIODO]
      ,[RAZON_SOCIAL]
      ,[CASOS]
      ,[ADEUDO]
      ,[INC]
      ,[GRUPO]
      ,[COTIZ]
      ,[emision]
      ,[DIAS]
  FROM [sirecacobros].[dbo].[ecoTipos]
  where [REGPATR]=? and [GRUPO]='PAE'">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000000000" Name="?" 
                    QueryStringField="regpat" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

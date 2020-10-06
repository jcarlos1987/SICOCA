<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesAnalisis.aspx.vb" Inherits="WebSIRECA.DetallesAnalisis" %>

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
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" ToolTip="Exportar a Excel" />
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceDetallesRaleAct" HorizontalAlign="Center" 
            Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="SR_REGPAT" HeaderText="SR_REGPAT" 
                    SortExpression="SR_REGPAT" />
                <asp:BoundField DataField="SR_RAZON_SOCIAL" HeaderText="SR_RAZON_SOCIAL" 
                    SortExpression="SR_RAZON_SOCIAL" />
                <asp:BoundField DataField="SR_COTIZ" HeaderText="SR_COTIZ" 
                    SortExpression="SR_COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SR_OMISION" HeaderText="SR_OMISION" 
                    SortExpression="SR_OMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_PERIODO" HeaderText="RALE_PERIODO" 
                    SortExpression="RALE_PERIODO" />
                <asp:BoundField DataField="SR_CREDITO" HeaderText="SR_CREDITO" 
                    SortExpression="SR_CREDITO" />
                <asp:BoundField DataField="SR_INC." HeaderText="SR_INC." 
                    SortExpression="SR_INC." />
                <asp:BoundField DataField="RALE_INC" HeaderText="RALE_INC" 
                    SortExpression="RALE_INC" />
                <asp:BoundField DataField="RALE_FEC.INC." HeaderText="RALE_FEC.INC." 
                    SortExpression="RALE_FEC.INC." />
                <asp:BoundField DataField="INC_ACTUAL" HeaderText="INC_ACTUAL" 
                    SortExpression="INC_ACTUAL" />
                <asp:BoundField DataField="FEC.INC.ACTUAL" HeaderText="FEC.INC.ACTUAL" 
                    SortExpression="FEC.INC.ACTUAL" />
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
        <asp:SqlDataSource ID="SqlDataSourceDetallesRaleAct" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [SR_REGPAT]
      ,[SR_RAZON_SOCIAL]
      ,[SR_COTIZ]
      ,[SR_OMISION]
      ,[RALE_PERIODO]
      ,[SR_CREDITO]
      ,[SR_INC.]
      ,[RALE_INC]
      ,[RALE_FEC.INC.]
      ,[INC_ACTUAL]
      ,[FEC.INC.ACTUAL]
  FROM [sireca].[dbo].[ANALISIS_INCIDENCIAS]
  where [RALE_INC]=?
  --and [INC_ACTUAL] 
--and [RALE_PERIODO] not in ('01/2012','02/2012')
  order by 1">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="incRaleBase" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

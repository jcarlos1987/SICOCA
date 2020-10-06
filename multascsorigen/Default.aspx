<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Text="Subd.:" Font-Bold="True" 
            Font-Size="11pt"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Font-Size="10pt">
        </asp:DropDownList>
    
        <asp:Label ID="Label3" runat="server" Text="RALE:" Font-Bold="True" 
            Font-Size="11pt"></asp:Label>
        <asp:DropDownList ID="DDLRale" runat="server" DataSourceID="SqlDataSourceRales" 
            DataTextField="name" DataValueField="name" Font-Size="10pt">
        </asp:DropDownList>
    &nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox1" runat="server" Font-Bold="True" Text="Incluir" />
        <asp:SqlDataSource ID="SqlDataSourceRaleFecMax" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT max(convert(datetime,[PERIODO],103)) as fecha FROM [rale].[dbo].[3301ACOP111212]">
        </asp:SqlDataSource>
        <asp:DropDownList ID="DDLUltimoPer" runat="server" 
            DataSourceID="SqlDataSourceRaleFecMax" DataTextField="fecha" 
            DataValueField="fecha" DataTextFormatString="{0:d}">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceRales" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 6 [name]
FROM [rale].[dbo].[tablas]
where tipo='COP' and subdel=?
order by fecha desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    <hr />
        <asp:GridView ID="GridView1" runat="server" 
            DataSourceID="SqlDataSourceMulcsorigen" HorizontalAlign="Center">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMulcsorigen" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sirecacobros.dbo.sysobjects where name = 'multascoprcv') 
begin
drop table sirecacobros.dbo.multascoprcv
end
SELECT 
	'COP' as tipo
	,[REGPATR]
      ,[MOV]
      ,[FMOV]
      ,[SECTOR]
      ,[NUMCRED]
      ,[CE]
      ,[TD]
      ,[FALTA]
      ,[INC]
      ,[FEINC]
      ,[DIAS]
      ,[IMPORTE]
      ,[OBSERVA]
      ,[PERIODO]      
     INTO sirecacobros.dbo.multascoprcv
  FROM [rale].[dbo].[3301ACOP111212] as ralex  
  union
  SELECT 'RCV' as tipo
  ,[REGPATR]
      ,[MOV]
      ,[FMOV]
      ,[SECTOR]
      ,[NUMCRED]
      ,[CE]
      ,[TD]
      ,[FALTA]
      ,[INC]
      ,[FEINC]
      ,[DIAS]
      ,[IMPORTE]
      ,[OBSERVA]
      ,[PERIODO]
  FROM [rale].[dbo].[3301ARCV111212] as ralex"></asp:SqlDataSource>
        <asp:GridView ID="GWCSORIGEN" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="Multas c/s origen" 
            CellPadding="3" DataSourceID="SqlDataSourceMultas" HorizontalAlign="Center" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" 
                    SortExpression="ESTADO" />
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
        <asp:SqlDataSource ID="SqlDataSourceMultas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand=" select origen as [ESTADO]
,COUNT (DISTINCT([REGPATR])) as [PATRONES]
,COUNT ([NUMCRED]) as [CREDITOS]
,SUM([IMPORTE]) as [IMPORTE]
from sirecacobros.dbo.multascsorigen
where periodo not in ('01/11/2012')
group by origen "></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="Multas sin origen por TD" 
            CellPadding="3" DataSourceID="SqlDataSourceMulsoporTD" HorizontalAlign="Center" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
        <asp:SqlDataSource ID="SqlDataSourceMulsoporTD" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select td as [TD]
,COUNT (DISTINCT([REGPATR])) as [PATRONES]
,COUNT ([NUMCRED]) as [CREDITOS]
,SUM([IMPORTE]) as [IMPORTE]
from sirecacobros.dbo.multascsorigen
where periodo not in ('01/11/2012')
and origen='SIN ORIGEN'
group by td
order by 1"></asp:SqlDataSource>
        <asp:GridView ID="GWPORANIO" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="Multas sin Origen por Año" CellPadding="3" 
            DataSourceID="SqlDataSourceMulOrigen" HorizontalAlign="Center" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="ANIO" HeaderText="ANIO" ReadOnly="True" 
                    SortExpression="ANIO" />
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
        <asp:SqlDataSource ID="SqlDataSourceMulOrigen" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select year(periodo) as [ANIO]
,COUNT (DISTINCT([REGPATR])) as [PATRONES]
,COUNT ([NUMCRED]) as [CREDITOS]
,SUM([IMPORTE]) as [IMPORTE]
from sirecacobros.dbo.multascsorigen
where periodo not in ('01/11/2012')
and origen='SIN ORIGEN'
group by year(periodo)
order by 1 desc"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

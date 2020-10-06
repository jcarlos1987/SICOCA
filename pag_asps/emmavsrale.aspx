<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="emmavsrale.aspx.vb" Inherits="WebSIRECA.emmavsrale" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel3" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Subdelegacion:"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSourceSubdelList" DataTextField="subdel" 
                DataValueField="subdel">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceSubdelList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [subdel]      
FROM [rale].[dbo].[tablas]
group by subdel"></asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Rale:"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLRale" runat="server" 
                DataSourceID="SqlDataSourceRaleList" DataTextField="name" DataValueField="name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceRaleList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 1000 [name]
      ,[del]
      ,[subdel]
      ,[origen]
      ,[tipo]
      ,[fecha]
  FROM [rale].[dbo].[tablas]
WHERE [subdel]=?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;            
            <asp:Label ID="Label2" runat="server" Text="Periodo:"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLPeriodo" runat="server" 
                DataSourceID="SqlDataSourcePeriodoList" DataTextField="fechaEco" 
                DataValueField="fechaEco">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcePeriodoList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT fechaEco
FROM sireca.[dbo].eco
group by fechaEco"></asp:SqlDataSource>
            &nbsp;&nbsp;<asp:Button ID="BActualizar" runat="server" Text="Button" />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" GroupingText="Deudas" Height="300px" 
            HorizontalAlign="Left" ScrollBars="Auto">
        
        <asp:GridView ID="GVDeudas" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceDeudas" HorizontalAlign="Left" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3">
            <Columns>
                <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                    ReadOnly="True" SortExpression="REG_PATRONAL" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="IMPORTE_RALE" HeaderText="IMPORTE_RALE" 
                    SortExpression="IMPORTE_RALE" />
                <asp:BoundField DataField="incidencia" HeaderText="incidencia" ReadOnly="True" 
                    SortExpression="incidencia" />
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
        <asp:SqlDataSource ID="SqlDataSourceDeudas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="drop table [sireca].[dbo].[patrones3301]

SELECT * INTO [sireca].[dbo].[patrones3301]
FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0512\EMIS3301.mdb';'Admin';'', 'SELECT * FROM cdempa052012')
AS EMA3333

SELECT 
distinct(replace(rale.REGPATR,'-','')) AS [REG_PATRONAL]
,[PERIODO]
,[IMPORTE] AS [IMPORTE_RALE]
,(
select eco2.incidencia 
from [sireca].[dbo].[eco] AS eco2
where eco2.[reg#patronal] like replace(rale.REGPATR,'-','')+'%'
and eco2.fechaEco='52012' and eco2.subdel='01'
)  as incidencia

FROM 
 [rale].[dbo].[3301ACOP240712] AS rale
WHERE
(
select substring(emma2.[EMIP_PATRON],2,10) 
from [sireca].[dbo].[patrones3301] AS emma2 
where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) is not null
and rale.[TD] in ('02')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='5'
group by rale.REGPATR,[PERIODO],[IMPORTE]
"></asp:SqlDataSource>
</asp:Panel>
        <asp:Panel ID="Panel2" runat="server" 
            GroupingText="Patrones que no estan en la EMMA con Deudas" Height="300px" 
            ScrollBars="Auto">        
        <asp:GridView ID="GVNotRale" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceNotRale" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                    ReadOnly="True" SortExpression="REG_PATRONAL" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="IMPORTE_RALE" HeaderText="IMPORTE_RALE" 
                    SortExpression="IMPORTE_RALE" />
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
        <asp:SqlDataSource ID="SqlDataSourceNotRale" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="drop table [sireca].[dbo].[patrones3301]

SELECT * INTO [sireca].[dbo].[patrones3301]
FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0512\EMIS3301.mdb';'Admin';'', 'SELECT * FROM cdempa052012')
AS EMA3333

SELECT distinct(replace(rale.REGPATR,'-','')) AS [REG_PATRONAL],[PERIODO],[IMPORTE] AS [IMPORTE_RALE]
FROM 
 [rale].[dbo].[3301ACOP240712] AS rale
WHERE
(
select substring(emma2.[EMIP_PATRON],2,10) 
from [sireca].[dbo].[patrones3301] AS emma2 
where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) is null
and rale.[TD] in ('02')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='5'
group by rale.REGPATR,[PERIODO],[IMPORTE]
"></asp:SqlDataSource>
    </asp:Panel>
    </div>
    </form>
</body>
</html>

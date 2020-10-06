<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="masDetalles.aspx.vb" Inherits="WebSIRECA.masDetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourcePorcobrarMas" 
            HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" />
                <asp:BoundField DataField="cotiz" HeaderText="COTIZANTES" 
                    SortExpression="cotiz" />
                <asp:BoundField DataField="omision" DataFormatString="{0:C}" 
                    HeaderText="OMISION" ReadOnly="True" SortExpression="omision" />
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
        <asp:SqlDataSource ID="SqlDataSourcePorcobrarMas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
SET @SUBDEL=?
SELECT distinct([REG#PATRONAL]),[NOMBRE O RAZON SOCIAL],cotiz,sum(omision) as omision
FROM [sireca].[dbo].[eco] as eco
where fechaEco in ('52012') and subdel=@SUBDEL
and [REG#PATRONAL] in (SELECT distinct([REG#PATRONAL])
FROM [sireca].[dbo].[eco] 
where fechaEco in ('42012') and [REG#PATRONAL]=(eco.[REG#PATRONAL]) and subdel=@SUBDEL
and (incidencia not in ('9','A','BD','RE','PAGADO','POR PROCESAR') or incidencia is null))
and (incidencia not in ('9','A','BD','RE','PAGADO','POR PROCESAR') or incidencia is null)
group by [REG#PATRONAL],[NOMBRE O RAZON SOCIAL],cotiz">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNLMas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
SET @SUBDEL=?
SELECT distinct([REG#PATRONAL]),[NOMBRE O RAZON SOCIAL],cotiz,sum(omision) as omision
FROM [sireca].[dbo].[eco] as eco
where fechaEco in ('52012') and subdel=@SUBDEL
and [REG#PATRONAL] in (SELECT distinct([REG#PATRONAL])
FROM [sireca].[dbo].[eco] 
where fechaEco in ('42012') and [REG#PATRONAL]=(eco.[REG#PATRONAL]) and subdel=@SUBDEL
and (incidencia in ('9') or incidencia is null))
and (incidencia in ('9') or incidencia is null)
group by [REG#PATRONAL],[NOMBRE O RAZON SOCIAL],cotiz">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePagadosMas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
SET @SUBDEL=?
SELECT distinct([REG#PATRONAL]),incidencia,tipoEco
FROM [sireca].[dbo].[eco] as eco
where fechaEco in ('52012') and subdel=@SUBDEL
and [REG#PATRONAL] in (SELECT distinct([REG#PATRONAL])
FROM [sireca].[dbo].[eco] 
where fechaEco in ('42012') and [REG#PATRONAL]=(eco.[REG#PATRONAL]) and subdel=@SUBDEL
and (incidencia not in ('9','A','BD','RE','PAGADO','POR PROCESAR') or incidencia is null))
and (incidencia not in ('9','A','BD','RE','PAGADO','POR PROCESAR') or incidencia is null)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

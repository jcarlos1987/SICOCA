<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="meseAnios.aspx.vb" Inherits="WebSIRECA.meseAnios" %>

<asp:Content ID="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >

    <asp:DropDownList ID="DDLMA" runat="server">
        <asp:ListItem Value="MESES">Meses</asp:ListItem>
        <asp:ListItem Value="ANIOS">Anios</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Rale:" Font-Bold="True"></asp:Label>&nbsp;
    <asp:DropDownList ID="DDLRales" runat="server" 
        DataSourceID="SqlDataSourceRaleList" DataTextField="name" DataValueField="name">
    </asp:DropDownList>
    <asp:ImageButton ID="IBRales" runat="server" ImageAlign="Middle" 
        style="width: 14px" />
            <asp:SqlDataSource ID="SqlDataSourceRaleList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
            
            
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [name]
      ,[del]
      ,[subdel]
      ,[origen]
      ,[tipo]
      ,[fecha]
  FROM [rale].[dbo].[tablas]
WHERE [subdel]=? and [name] like '%COP%'
order by fecha desc">
                <SelectParameters>
                    <asp:Parameter DefaultValue="01" Name="?" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataSourceID="SqlDataSourceMeses">
                <Columns>
                    <asp:BoundField DataField="SEMAFORO" 
                        HeaderText="SEMAFORO" SortExpression="SEMAFORO" />
                    <asp:HyperLinkField DataNavigateUrlFields="SEMAFORO" 
                        DataNavigateUrlFormatString="detallesSemaforo.aspx?semaforo={0}" 
                        DataTextField="PATRONES" HeaderText="PATRONES" 
                        NavigateUrl="~/semaforo/detallesSemaforo.aspx" SortExpression="PATRONES" />
                    <asp:BoundField DataField="CREDITOS" 
                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS" />
                    <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                        SortExpression="IMPORTE" />
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
    <asp:SqlDataSource ID="SqlDataSourceMeses" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sireca.dbo.sysobjects where name = 'semaforomes') 
begin
drop table sireca.dbo.semaforomes
end
SELECT
[REGPATR]
,SUM(IMPORTE) AS IMPORTE
,(SELECT ptn.razonsocial FROM sireca.dbo.patrones as ptn where regpat=replace(regpatr,'-','') ) as RAZON_SOCIAL
,COUNT([PERIODO]) as periodos
,case 
when COUNT([PERIODO])=1 then 'verde'
when COUNT([PERIODO]) in ('2','3') then 'amarillo'
else 'rojo'
end as SEMAFORO
,case 
when COUNT([PERIODO])=1 then '3'
when COUNT([PERIODO]) in ('2','3') then '2'
else '1'
end as orden
into sireca.dbo.semaforomes
FROM [rale].[dbo].[3301ACOP180912]
WHERE [TD] in ('02')
AND [MOV] NOT IN ('2')
AND PERIODO BETWEEN CONVERT(DATETIME,'01/12/2011') AND CONVERT(DATETIME,'31/07/2012')
--AND ((YEAR(PERIODO) NOT IN (YEAR(GETDATE()))) AND (MONTH(PERIODO) NOT IN ((MONTH(GETDATE())-2))) )
GROUP BY [REGPATR]

select orden,SEMAFORO,count(regpatr) as PATRONES, sum(periodos) as CREDITOS , sum(importe) as IMPORTE 
from sireca.dbo.semaforomes
group by orden,SEMAFORO
order by 1"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAnios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sireca.dbo.sysobjects where name = 'semaforoanio') 
begin
drop table sireca.dbo.semaforoanio
end
SELECT 
[REGPATR]
,SUM(IMPORTE) AS IMPORTE
,(SELECT ptn.razonsocial FROM sireca.dbo.patrones as ptn where regpat=replace(regpatr,'-','') ) as RAZON_SOCIAL
,COUNT([PERIODO]) as periodos
,case 
when COUNT([PERIODO])=1 then 'verde'
when COUNT([PERIODO]) in ('2','3') then 'amarillo'
else 'rojo'
end as SEMAFORO
,case 
when COUNT([PERIODO])=1 then '3'
when COUNT([PERIODO]) in ('2','3') then '2'
else '1'
end as orden
into sireca.dbo.semaforoanio
FROM [rale].[dbo].[3301ACOP180912]
WHERE [TD] in ('02')
AND [MOV] NOT IN ('2')
and periodo not in ('01/08/2012')
--AND ((YEAR(PERIODO) NOT IN (YEAR(GETDATE()))) AND (MONTH(PERIODO) NOT IN ((MONTH(GETDATE())-1))) )
GROUP BY [REGPATR]

select orden,SEMAFORO,count(regpatr) as PATRONES, sum(periodos) as CREDITOS , sum(importe) as IMPORTE 
from sireca.dbo.semaforoanio
group by orden,SEMAFORO
order by 1"></asp:SqlDataSource>

</asp:Content>
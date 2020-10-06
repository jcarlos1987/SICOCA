<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="alerta.aspx.vb" Inherits="WebSIRECA.alerta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mensaje de Alerta</title>
</head>
<body style="font-family: Calibri; font-size: 18px">
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="PATRONES CUYAS FECHAS DE NOTIFICACIÓN HAN PASADO MÁS DE 3 SEMANAS" 
            CellPadding="3" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="fechaeco" HeaderText="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detallesAlertas.aspx?fechaeco=" &  Eval("fechaeco") %>' Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
		fechaeco 
	  ,count([REG#PATRONAL]) as PATRONES
	  ,sum([COTIZ]) as COTIZANTES   
      ,sum([OMISION]) as IMPORTE
FROM [sireca].[dbo].[eco]
where incidencia in ('2') and subdel=?
and tipoeco in ('COP','COMP')
and fechaeco not in ('12012','22012')
AND (DATEDIFF(DAY,[fechaCaptura],GETDATE()) &gt;= 21)
group by fechaeco
order by 1 desc">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <hr /><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSource2" HorizontalAlign="Center" 
            Caption="PATRONES CON MESES DE ADEUDO">
            <Columns>
                <asp:BoundField DataField="MESES" HeaderText="MESES DE ADEUDO" 
                    SortExpression="MESES" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="MESES" 
                    DataNavigateUrlFormatString="detallesAlertas.aspx?meses={0}" 
                    DataTextField="PATRONES" HeaderText="PATRONES" 
                    NavigateUrl="~/pag_supervisores/detallesAlertas.aspx" 
                    SortExpression="PATRONES" DataTextFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C2}" >
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sirecacobros.dbo.sysobjects where name = 'ecodeudasmeses') 
begin
drop table sirecacobros.dbo.ecodeudasmeses
end
SELECT 
[REG#PATRONAL]
	  ,count(fechaeco) as MESES
	  --,([COTIZ]) as COTIZANTES   
      ,sum([OMISION]) as IMPORTE
--,[fechaCaptura]
--,DATEDIFF(DAY,[fechaCaptura],GETDATE()) as fechaTranscurida
into sirecacobros.dbo.ecodeudasmeses
FROM [sireca].[dbo].[eco]
where incidencia in ('2') and subdel=?
and tipoeco in ('COP','COMP')
and fechaeco not in ('12012','22012')
--(DATEADD(DAY,21,[fechaCaptura]))
AND (DATEDIFF(DAY,[fechaCaptura],GETDATE()) &gt;= 21)
--AND NOT DATEDIFF(DAY,[fechaCaptura] ,getdate())
group by [REG#PATRONAL]
--having count(fechaeco)&gt;1
--order by 2 desc
select MESES,COUNT(REG#PATRONAL) AS PATRONES,SUM(IMPORTE) AS IMPORTE
from sirecacobros.dbo.ecodeudasmeses
group by MESES">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

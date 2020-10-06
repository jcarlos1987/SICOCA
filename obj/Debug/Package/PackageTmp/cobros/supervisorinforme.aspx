<%@ Page Language="vb" MasterPageFile ="~/Site2.Master" AutoEventWireup="false" CodeBehind="supervisorinforme.aspx.vb" Inherits="WebSIRECA.supervisorinforme" %>
<asp:Content ID ="header1" runat ="server" ContentPlaceHolderID ="head" >
    <style type="text/css"> @import url("../css/body.css"); </style>
</asp:Content>
<asp:Content ID ="conten1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<div style="width: 300px">
    <table style="width: 141%;">
        <tr>
            <td colspan="2" style="font-weight: bold">
                INGRESE LOS DATOS&nbsp;&nbsp;<asp:Button ID="BAsignar" runat="server" Text="ASIGNAR CASOS" />
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
            <asp:Label ID="Label2" runat="server" Text="EJECUTORES"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="TBEJECUTORES" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
    <asp:Label ID="Label3" runat="server" Text="MAYOR ADEUDO"></asp:Label>
                
            </td>
            <td>
                <asp:DropDownList ID="TBMAYOR" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">0%</asp:ListItem>
                    <asp:ListItem Value="0.10">10%</asp:ListItem>
                    <asp:ListItem Value="0.20">20%</asp:ListItem>
                    <asp:ListItem Value="0.30">30%</asp:ListItem>
                    <asp:ListItem Value="0.40">40%</asp:ListItem>
                    <asp:ListItem Value="0.50">50%</asp:ListItem>
                    <asp:ListItem Value="0.60">60%</asp:ListItem>
                    <asp:ListItem Value="0.70">70%</asp:ListItem>
                    <asp:ListItem Value="0.80">80%</asp:ListItem>
                    <asp:ListItem Value="0.90">90%</asp:ListItem>
                    <asp:ListItem Value="1">100%</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
    <asp:Label ID="Label4" runat="server" Text="MEDIANO ADEUDO"></asp:Label>
                
            </td>
            <td>
                <asp:DropDownList ID="TBMEDIANO" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">0%</asp:ListItem>
                    <asp:ListItem Value="0.10">10%</asp:ListItem>
                    <asp:ListItem Value="0.20">20%</asp:ListItem>
                    <asp:ListItem Value="0.30">30%</asp:ListItem>
                    <asp:ListItem Value="0.40">40%</asp:ListItem>
                    <asp:ListItem Value="0.50">50%</asp:ListItem>
                    <asp:ListItem Value="0.60">60%</asp:ListItem>
                    <asp:ListItem Value="0.70">70%</asp:ListItem>
                    <asp:ListItem Value="0.80">80%</asp:ListItem>
                    <asp:ListItem Value="0.90">90%</asp:ListItem>
                    <asp:ListItem Value="1">100%</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
    <asp:Label ID="Label5" runat="server" Text="MENOR ADEUDO"></asp:Label>
                
            </td>
            <td>
                <asp:DropDownList ID="TBMENOR" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">0%</asp:ListItem>
                    <asp:ListItem Value="0.10">10%</asp:ListItem>
                    <asp:ListItem Value="0.20">20%</asp:ListItem>
                    <asp:ListItem Value="0.30">30%</asp:ListItem>
                    <asp:ListItem Value="0.40">40%</asp:ListItem>
                    <asp:ListItem Value="0.50">50%</asp:ListItem>
                    <asp:ListItem Value="0.60">60%</asp:ListItem>
                    <asp:ListItem Value="0.70">70%</asp:ListItem>
                    <asp:ListItem Value="0.80">80%</asp:ListItem>
                    <asp:ListItem Value="0.90">90%</asp:ListItem>
                    <asp:ListItem Value="1">100%</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
    <asp:Label ID="Label6" runat="server" Text="INVESTIGACION"></asp:Label>
                
            </td>
            <td>
                <asp:DropDownList ID="TBINVESTIGACION" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">0%</asp:ListItem>
                    <asp:ListItem Value="0.10">10%</asp:ListItem>
                    <asp:ListItem Value="0.20">20%</asp:ListItem>
                    <asp:ListItem Value="0.30">30%</asp:ListItem>
                    <asp:ListItem Value="0.40">40%</asp:ListItem>
                    <asp:ListItem Value="0.50">50%</asp:ListItem>
                    <asp:ListItem Value="0.60">60%</asp:ListItem>
                    <asp:ListItem Value="0.70">70%</asp:ListItem>
                    <asp:ListItem Value="0.80">80%</asp:ListItem>
                    <asp:ListItem Value="0.90">90%</asp:ListItem>
                    <asp:ListItem Value="1">100%</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:Label ID="LERROR" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                &nbsp;
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>

    <asp:GridView ID="GridView2" runat="server" 
        DataSourceID="SqlDataSourceDinamica" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        Caption="&lt;font style='font-size: large; color: #CC6600; font-weight: bold;'&gt;MORAS PARA ASIGNAR&lt;/font&gt;" 
        CellPadding="4">
        <Columns>
            <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                SortExpression="ADEUDO" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="tipoadeudo,ADEUDO" 
                DataNavigateUrlFormatString="supervisor.aspx?tipoadeudo={0}&amp;tipo={1}" 
                DataTextField="TOTAL" HeaderText="TOTAL" 
                NavigateUrl="~/cobros/supervisor.aspx" SortExpression="TOTAL">
            <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField 
                DataTextField="CASOS A FALTANTES" HeaderText="DIFERENCIA EN No. DE CASOS" 
                SortExpression="CASOS A FALTANTES" />
            <asp:BoundField DataField="CASOS A DAR" DataFormatString="{0:N0}" 
                HeaderText="CASOS A TRABAJAR" ReadOnly="True" 
                SortExpression="CASOS A DAR" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CASOS A DAR POR PERSONA" DataFormatString="{0:N0}" 
                HeaderText="CASOS A DAR POR PERSONA" ReadOnly="True" 
                SortExpression="CASOS A DAR POR PERSONA" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDinamica" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PORCENTAJE1 FLOAT
DECLARE @PORCENTAJE2 FLOAT
DECLARE @PORCENTAJE3 FLOAT
DECLARE @PORCENTAJE4 FLOAT
DECLARE @EJECUTORES FLOAT
SET @EJECUTORES = ?
SET @PORCENTAJE1 = ?
SET @PORCENTAJE2 = ?
SET @PORCENTAJE3 = ?
SET @PORCENTAJE4 = ?

select 
tipo_adeudo as tipoadeudo
,case 
when tipo_adeudo='1MAYOR' then 'MAYOR' 
when tipo_adeudo='2MEDIANO' then 'MEDIANO' 
when tipo_adeudo='3MENOR' then 'MENOR' 
when tipo_adeudo='4INVESTIGACION' then 'INVESTIGACION' 
END as ADEUDO
,count(distinct(regpatr)) as TOTAL
,case 
when tipo_adeudo='1MAYOR' then (count(distinct(regpatr))-(@EJECUTORES * FLOOR ((ROUND((count(distinct(regpatr))*@PORCENTAJE1),0)/@EJECUTORES))))
when tipo_adeudo='2MEDIANO' then (count(distinct(regpatr))-(@EJECUTORES * FLOOR ((ROUND((count(distinct(regpatr))*@PORCENTAJE2),0)/@EJECUTORES))))
when tipo_adeudo='3MENOR' then (count(distinct(regpatr))-(@EJECUTORES * FLOOR ((ROUND((count(distinct(regpatr))*@PORCENTAJE3),0)/@EJECUTORES))))
when tipo_adeudo='4INVESTIGACION' then (count(distinct(regpatr))-(@EJECUTORES * FLOOR ((ROUND((count(distinct(regpatr))*@PORCENTAJE4),0)/@EJECUTORES))))
END as [CASOS A FALTANTES]
,case 
when tipo_adeudo='1MAYOR' then ROUND((count(distinct(regpatr))*@PORCENTAJE1),0)
when tipo_adeudo='2MEDIANO' then ROUND((count(distinct(regpatr))*@PORCENTAJE2),0)
when tipo_adeudo='3MENOR' then ROUND((count(distinct(regpatr))*@PORCENTAJE3),0)
when tipo_adeudo='4INVESTIGACION' then ROUND((count(distinct(regpatr))*@PORCENTAJE4),0)
END as [CASOS A DAR]
,case 
when tipo_adeudo='1MAYOR' then FLOOR ((ROUND((count(distinct(regpatr))*@PORCENTAJE1),0)/@EJECUTORES))
when tipo_adeudo='2MEDIANO' then FLOOR(ROUND((count(distinct(regpatr))*@PORCENTAJE2),0)/@EJECUTORES)
when tipo_adeudo='3MENOR' then FLOOR(ROUND((count(distinct(regpatr))*@PORCENTAJE3),0)/@EJECUTORES)
when tipo_adeudo='4INVESTIGACION' then FLOOR(ROUND((count(distinct(regpatr))*@PORCENTAJE4),0)/@EJECUTORES)
END as [CASOS A DAR POR PERSONA]
,(select count(distinct(regpatr)) from sirecacobros.dbo.Busqueda_PAE_TIPO)
FROM sirecacobros.dbo.Busqueda_PAE_TIPO
where [ASIGNADO] = 'NO'
group by tipo_adeudo
order by 1">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBEJECUTORES" DefaultValue="0" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBMAYOR" DefaultValue="0" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBMEDIANO" DefaultValue="0" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBMENOR" DefaultValue="0" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBINVESTIGACION" DefaultValue="0" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        Caption="&lt;font style='font-size: large; color: #CC0066; font-weight: bold;'&gt;TOTAL DE MORAS&lt;/font&gt;" 
        CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceTotal" 
        GridLines="None">
        <Columns>
            <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                SortExpression="ADEUDO">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
               <asp:HyperLinkField DataNavigateUrlFields="tipoadeudo,ADEUDO" 
                DataNavigateUrlFormatString="supervisor.aspx?tipoadeudo={0}&amp;tipo={1}" 
                DataTextField="TOTAL" HeaderText="TOTAL" 
                NavigateUrl="~/cobros/supervisor.aspx" SortExpression="TOTAL">
            <ItemStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceTotal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select 
tipo_adeudo as tipoadeudo
,case 
when tipo_adeudo='1MAYOR' then 'MAYOR' 
when tipo_adeudo='2MEDIANO' then 'MEDIANO' 
when tipo_adeudo='3MENOR' then 'MENOR' 
when tipo_adeudo='4INVESTIGACION' then 'INVESTIGACION' 
END as ADEUDO
,count(distinct(regpatr)) as TOTAL
FROM sirecacobros.dbo.Busqueda_PAE_TIPO
group by tipo_adeudo
order by 1"></asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        Caption="&lt;font style='font-size: large; color: #CC0066; font-weight: bold;'&gt;MORAS ASIGNADAS&lt;/font&gt;" 
        CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceCasosAsignados" 
        GridLines="None">
        <Columns>
            <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" 
                SortExpression="EJECUTOR" />
            <asp:BoundField DataField="CASOS ASIGNADOS" HeaderText="CASOS ASIGNADOS" 
                ReadOnly="True" SortExpression="CASOS ASIGNADOS" />
            <asp:HyperLinkField DataNavigateUrlFields="EJECUTOR" 
                DataNavigateUrlFormatString="supervisor.aspx?ejecutor={0}" 
                DataTextField="CASOS ASIGNADOS" HeaderText="CASOS ASIGNADOS" 
                NavigateUrl="~/cobros/supervisor.aspx" SortExpression="CASOS ASIGNADOS" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCasosAsignados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [EJECUTOR]
,count(distinct(regpatr)) as [CASOS ASIGNADOS]
  FROM [sirecacobros].[dbo].[Busqueda_PAE_TIPO]
group by ejecutor
order by 1 desc"></asp:SqlDataSource>
</asp:Content>

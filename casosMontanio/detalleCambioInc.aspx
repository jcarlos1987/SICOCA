<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="detalleCambioInc.aspx.vb" Inherits="WebSIRECA.detalleCambioInc" %>

<asp:Content ID ="contenido1" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server" >
    <div>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DDLTipo" runat="server" AutoPostBack="True">
            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
            <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" 
                        ImageUrl="~/imagenes/exportarexcel.png" Width="20px" 
                        ToolTip="EXPORTAR A EXCEL" />
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/casosMontanio/Default.aspx" Font-Bold="True" 
            ForeColor="#003366">Reporte GENERAL</asp:HyperLink><hr />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;CAMBIOS DE INCIDENCIA A DETALLE&lt;/strong&gt;" CellPadding="3" 
            DataSourceID="SqlDataSource3" Font-Size="10pt" AllowSorting="True" 
            HorizontalAlign="Center" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" ReadOnly="True" 
                    SortExpression="INC_RALE" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT (select '('+rl.inc+')'+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc) as INCIDENCIA,(select '('+rl.inc+')'+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc_rale) as INC_RALE,count(DISTINCT(REG_PAT)) as [PATRONES],count(CREDITOS) as [CREDITOS],sum(IMPORTE) as IMPORTE
FROM [sirecacobros].[dbo].[casosMontanio] as cm
where inc &lt;&gt; inc_rale
and sub_cont like ?
and [TIPO_COP_RCV] like ?
group by inc,inc_rale
order by INCIDENCIA
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

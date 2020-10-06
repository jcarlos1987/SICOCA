<%@ Page Language="vb" MasterPageFile ="~/Site.Master"  AutoEventWireup="false" CodeBehind="Cobros.aspx.vb" Inherits="WebSIRECA.Cobros1" %>

<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
    </asp:DropDownList>
                <asp:DropDownList
                        ID="DDLRCOP" runat="server" DataSourceID="SqlDataSourceRCOP" 
                        DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRCOP" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [name]
FROM [rale].[dbo].[tablas]
where subdel =? and tipo='COP'
order by convert(datetime,fecha,103) desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DDLRRCV" runat="server" DataSourceID="SqlDataSourceRRCV" 
                        DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRRCV" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [name]
FROM [rale].[dbo].[tablas]
where subdel =? and tipo='RCV'
order by convert(datetime,fecha,103) desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Text="Actualizar" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
        GridLines="Vertical" AllowSorting="True" 
        Caption="&lt;strong&gt;TD&lt;/strong&gt;=02, &lt;strong&gt;PATRONES CON INC&lt;/strong&gt;=31,32,43 &lt;strong&gt;SIN&lt;/strong&gt;=14,09,52">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CLAVE" HeaderText="CLAVE" SortExpression="CLAVE" />
            <asp:BoundField DataField="MUNICIPIOS" HeaderText="MUNICIPIOS" 
                SortExpression="MUNICIPIOS" />
            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                SortExpression="PATRONES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select muni.CLAVE,muni.MUNICIPIOS,count(distinct(regpatr)) as PATRONES,'' as COTIZANTES,sum(IMPORTE) as IMPORTE
from sireca.dbo.municipios as muni inner join sirecacobros.dbo.ralecoprcvtemp as rale on substring(REGPATR,1,3)=muni.CLAVE
where td in ('02') and rale.INC in ('31','32','43')
and  not exists(select top 1 rx.regpatr from sirecacobros.dbo.ralecoprcvtemp as rx where rx.regpatr=rale.regpatr and rx.INC in ('14','09','52'))
and rale.tipo in ('ABC')
group by muni.CLAVE,muni.MUNICIPIOS"></asp:SqlDataSource>
</asp:Content>

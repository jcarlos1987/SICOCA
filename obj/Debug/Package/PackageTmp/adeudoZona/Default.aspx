<%@ Page Language="vb" MasterPageFile ="~/Site.Master"  AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default17" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DDLPeriodo" runat="server" 
            DataSourceID="SqlDataSourcePeriodo" DataTextField="fechaeco" 
            DataValueField="fechaeco">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="select fechaeco
--,substring(convert(varchar,fechaeco),len(fechaeco)-3,4)
--,substring(convert(varchar,fechaeco),1,len(fechaeco)-4)
from sireca.dbo.eco
where subdel=? 
group by fechaeco
order by substring(convert(varchar,fechaeco),len(fechaeco)-3,4) desc,convert(float,substring(convert(varchar,fechaeco),1,len(fechaeco)-4)) desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DDLTipo" runat="server">
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>COMP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
            <asp:ListItem>RCVCOMP</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Actualizar" />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSource1" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
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
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select muni.CLAVE,muni.MUNICIPIOS,count(distinct(REG#PATRONAL)) as PATRONES,sum(cotiz) as COTIZANTES,sum(total) as IMPORTE
from sireca.dbo.municipios as muni inner join sireca.dbo.eco on substring(REG#PATRONAL,1,3)=muni.CLAVE
where subdel=? and fechaeco in (?) and tipoeco in (?) and muni.CLAVE in ('ABC')
group by muni.CLAVE,muni.MUNICIPIOS">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </asp:Content>


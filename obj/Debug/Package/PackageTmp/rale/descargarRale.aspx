<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master"  AutoEventWireup="false" CodeBehind="descargarRale.aspx.vb" Inherits="WebSIRECA.descargarRale" %>
<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <center >
        <asp:Label ID="Label4" runat="server" Text="DESCARGA DEL RALE" Font-Bold="True" 
            Font-Size="14pt"></asp:Label>
<asp:Panel ID="Panel1" runat="server" CssClass="well" Width="600px" >
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DropDownSubdel" runat="server" AutoPostBack="True" 
            Width="120px">
        </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label2" runat="server" Text="TIPO"></asp:Label>
</span> 
        <asp:DropDownList ID="DropDownTipo" runat="server" AutoPostBack="True" 
            Width="100px">
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="RALE"></asp:Label>
</span> 
        <asp:DropDownList ID="DropDownRale" runat="server" 
            DataSourceID="SqlDataSourceRALES" DataTextField="name" 
            DataValueField="name" Width="170px">
        </asp:DropDownList>

        <asp:Button ID="Button2" runat="server" CssClass="btn" Text="DESCARGAR" 
            BorderColor="#293955" BorderStyle="Solid" BorderWidth="1px" />

        </div> 
</asp:Panel>
        </center>
        <asp:SqlDataSource ID="SqlDataSourceRALES" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 6 [name]      
 ,convert(datetime,[fecha],103) as fecha
  FROM [rale].[dbo].[tablas]
where subdel=? and tipo =?
order by 2 desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownTipo" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>   
    </div>
</asp:Content>
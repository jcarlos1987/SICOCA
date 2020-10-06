<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo3.Master" CodeBehind="pendientescapturayseg.aspx.vb" Inherits="WebSIRECA.pendientescapturayseg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<h4>Descargas</h4>
    <asp:Panel ID="Panel1" runat="server" CssClass ="well " Width="600">
    <asp:DropDownList ID="DropDownSubdel" runat="server" AutoPostBack="True" Width="120px">
    </asp:DropDownList>
    <ul>
    <li style="text-align: left">Patrones con todos sus créditos en la incidencia 09 
        <asp:LinkButton ID="LBDes0909" runat="server">Descargar</asp:LinkButton>
        </li>
    <li style="text-align: left">Créditos diligenciados en EMISIONES como 09 que actualmente se encuentran en la 01 
        <asp:LinkButton ID="LBDes0901" runat="server">Descargar</asp:LinkButton>
        </li>
    <li style="text-align: left">Créditos diligenciados en COBROS como 09 
    <div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLMes" runat="server" Width="120px">
        <asp:ListItem Value="01">Enero</asp:ListItem>
        <asp:ListItem Value="02">Febrero</asp:ListItem>
        <asp:ListItem Value="03">Marzo</asp:ListItem>
        <asp:ListItem Value="04">Abril</asp:ListItem>
        <asp:ListItem Value="05">Mayo</asp:ListItem>
        <asp:ListItem Value="06">Junio</asp:ListItem>
        <asp:ListItem Value="07">Julio</asp:ListItem>
        <asp:ListItem Value="08">Agosto</asp:ListItem>
        <asp:ListItem Value="09">Septiembre</asp:ListItem>
        <asp:ListItem Value="10">Octubre</asp:ListItem>
        <asp:ListItem Value="11">Noviembre</asp:ListItem>
        <asp:ListItem Value="12">Diciembre</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" 
            data-toggle="dropdown" Width="80px">
    </asp:DropDownList>
    </div>  que actualmente NO SEAN ACTUALIZADO
        <asp:LinkButton ID="LBCobros09" runat="server">Descargar</asp:LinkButton>
        </li>
    </ul>
    </asp:Panel>
</center>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default7" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenido" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="Generar patrones SIN PAGO de la EMISION"></asp:Label>
</span>
    <asp:DropDownList ID="DDLSubdel" runat="server" 
        CssClass="btn dropdown-toggle btn-small btn-success" ToolTip="SUBDELEGACION" 
        Width="100px" AutoPostBack="True">
    </asp:DropDownList>
    <span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
    </span>
    <asp:DropDownList ID="DDLMes" runat="server" 
        CssClass="btn dropdown-toggle btn-small btn-success" Width="120px" 
            AutoPostBack="True">
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
    <asp:DropDownList ID="DDLAnio" runat="server" 
        CssClass="btn dropdown-toggle btn-small btn-success" data-toggle="dropdown" 
        ToolTip="PERIODO" Width="80px" AutoPostBack="True">
    </asp:DropDownList>
    <asp:LinkButton ID="BActualizarRGeneral" runat="server" BorderColor="#5D7BAC" 
        BorderStyle="Solid" BorderWidth="1px" CssClass="btn" Visible="False"><i class="icon-download-alt"></i>&nbsp;GENERAR BASE(1)</asp:LinkButton>
    <asp:HyperLink ID="HLCorreo" runat="server" CssClass="btn" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class ="icon-envelope"></i>&nbsp;Enviar(2)</asp:HyperLink>
</div>
<br />
    <asp:Label ID="LabelError" runat="server"></asp:Label>
<br />
    <asp:TextBox ID="TBTemp" runat="server" TextMode="MultiLine" Height="300px" 
        Width="920px"></asp:TextBox>
</asp:Content>

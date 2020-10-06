<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="documentos.aspx.vb" Inherits="WebSIRECA.documentos1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:DropDownList ID="DropDownSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <center>
    <asp:Table ID="Table1" runat="server" BorderStyle="Solid" BorderWidth="1px" 
        CssClass="table-bordered" GridLines="Both" BackColor="#F0F0F0" BorderColor="Black">
        <asp:TableRow runat="server" Font-Bold="True" HorizontalAlign="Center">
            <asp:TableCell runat="server">SUBDEL</asp:TableCell>
            <asp:TableCell runat="server" BorderColor="Black" BackColor="#F0F0F0">PERIODO, FECHA DE CREACION</asp:TableCell>
            <asp:TableCell runat="server">ARCHIVO</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </center>
</asp:Content>

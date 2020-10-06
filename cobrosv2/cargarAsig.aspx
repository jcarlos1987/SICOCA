<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="cargarAsig.aspx.vb" Inherits="WebSIRECA.cargarAsig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
    <asp:FileUpload ID="FileUploadCPAE" runat="server" />
    <asp:LinkButton ID="LBCCPAE" runat="server">CARGAR</asp:LinkButton>
    <br />
    <asp:LinkButton ID="HLRaleDep" runat="server">DESCARGAR R.A.L.E. con depuración</asp:LinkButton>
    <br />
    <asp:LinkButton ID="HLDesFormato" runat="server">DESCARGAR Formato</asp:LinkButton>
</center>
</asp:Content>

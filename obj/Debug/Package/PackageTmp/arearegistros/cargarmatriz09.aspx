<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo3.Master" CodeBehind="cargarmatriz09.aspx.vb" Inherits="WebSIRECA.cargarmatriz09" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<div class="btn-group input-prepend">

    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
        Width="130px" >
    </asp:DropDownList>
<span class="add-on">
    <asp:FileUpload ID="FUMatriz09" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" Width="230px" />
</span> 
<span class="add-on">
    <asp:LinkButton CssClass="btn" ID="LBCargar" runat="server" BackColor="#9CAAC1">CARGAR</asp:LinkButton>
    <a title="DESCARGA UN ARCHIVO ZIP DE EJEMPLO EL CUAL SE CARGARA" 
        href="matriz_09.zip">EJEMPLO ARCHIVO A CARGAR</a>
    <asp:Label ID="Label1" runat="server" ></asp:Label>
</span> 
</div>
</center>
</asp:Content>

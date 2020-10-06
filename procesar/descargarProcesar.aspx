<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master"  AutoEventWireup="false" CodeBehind="descargarProcesar.aspx.vb" Inherits="WebSIRECA.descargarProcesar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Label ID="Label2" runat="server" Text="DESCARGA DEL PROCESAR"></asp:Label><hr />
        <asp:Label ID="Label3" runat="server" Text="Subdelegacion:"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="Fec. de PAGO"></asp:Label>
        <asp:TextBox ID="TextBoxFI" runat="server" ClientIDMode="Static" 
            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" MaxLength="10"></asp:TextBox>
        <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBoxFI"></asp:CalendarExtender>
        <asp:Label ID="Label5" runat="server" Text=" al "></asp:Label>
        <asp:TextBox ID="TextBoxFF" runat="server" ClientIDMode="Static" 
            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" MaxLength="10"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBoxFF"></asp:CalendarExtender>        
    
        <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" />
    <br />
        <asp:Label ID="LabelError" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#CC0000"></asp:Label>

    </div>
</asp:Content>
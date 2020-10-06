<%@ Page Language="vb" MasterPageFile ="~/Site.Master" AutoEventWireup="false" CodeBehind="cargarRale.aspx.vb" Inherits="WebSIRECA.cargarRale" %>
<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Label ID="Label3" runat="server" Text="CARGA DEL RALE"></asp:Label><asp:Label
        ID="Label4" runat="server" Text="(Archivo Nativo generado por el sistema.)" 
            Font-Italic="True" ForeColor="#FF3300"></asp:Label><hr />
     <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Cargar" />
    <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#009900"></asp:Label><br />
        <asp:Label ID="Label2" runat="server" 
            Text="Direccion de descarga de la Actualizacion de Visual CuWe: \\SUR02158WSSUBS\Aplicacion" 
            Font-Bold="True" ForeColor="#003300"></asp:Label>
        <asp:Button ID="Button2" runat="server" Text="Button" Visible="False" />
    </div>
</asp:Content>

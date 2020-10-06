<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default21" %>
<asp:Content ID ="contenido11" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <table style="width: 100%;">
    <tr>
        <td>            
            &nbsp;
        </td>
        <td style="font-size: 21px; font-weight: bold">
            <label>Bienvenido a SIRECA (Sistema de Recaudación de la Cartera)</label>
    </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td style="text-align: justify; font-style: italic; color: #91856F;" 
            align="justify">
            &nbsp;&nbsp; SIERECA es un sistema para llevar el control/toma de decisiones para una 
            cobranza eficaz.</td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="Consta de Tres Ciclos" 
                Font-Bold="True"></asp:Label>
            :</td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Text="1º Ciclo:" Font-Bold="True" 
                ForeColor="#99CB99"></asp:Label>
            &nbsp;
            <asp:Label ID="Label2" runat="server" Text="Dedicada al Area/Departamento de Emision."></asp:Label>
            &nbsp;..........
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Italic="True" 
                NavigateUrl="~/areaemision/Default.aspx">Leer Manual</asp:HyperLink>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="2º Ciclo:" Font-Bold="True" 
                ForeColor="#6699CC"></asp:Label>
            &nbsp;
            <asp:Label ID="Label4" runat="server" Text="Dedicada al Area/Departamento de Cobro."></asp:Label>
            &nbsp;.............
            <asp:HyperLink ID="HyperLink2" runat="server" Font-Italic="True" 
                NavigateUrl="~/areacobros/Default.aspx">Leer Manual</asp:HyperLink>
            </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Text="3º Ciclo:" Font-Bold="True" 
                ForeColor="#E5C365"></asp:Label>
            &nbsp;
            <asp:Label ID="Label7" runat="server" Text="Dedicada al Area/Departamento de Registro."></asp:Label>
            &nbsp;.........
            <asp:HyperLink ID="HyperLink3" runat="server" Font-Italic="True" 
                NavigateUrl="~/arearegistros/Default.aspx">Leer Manual</asp:HyperLink>
            </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>
</asp:Content>

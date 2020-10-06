<%@ Page Language="vb" MasterPageFile ="~/Site2.Master"  AutoEventWireup="false" CodeBehind="login2.aspx.vb" Inherits="WebSIRECA.login1" %>
<asp:Content ID ="header1" runat ="server" ContentPlaceHolderID ="head" >
    <style type="text/css"> @import url("../css/body.css"); </style>    
</asp:Content>
<asp:Content ID ="contend2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <br /><br />
    <center>
    <table style="background-image: url('../imagenes/fondo_login.png');" 
            bgcolor="Silver">
        <tr>
            <td colspan="2"><br />
                &nbsp;&nbsp;<label style="font-weight: bold; font-size: 15px;">Bienvenido(a), para acceder a las herramientas INICIE SESION</label></td>
            <td colspan="2"><br />
                &nbsp;&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/imagenes/acceder.png" />&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;<label>USUARIO:</label></td>
            <td>
                <asp:TextBox ID="TBUser" runat="server" MaxLength="15" 
                    ToolTip="Campo del nombre de usuario de acceso"></asp:TextBox>
            </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;<label>CONTRASEÑA:</label></td>
            <td>
                <asp:TextBox ID="TBPass" runat="server" MaxLength="15" 
                    ToolTip="Campo de la contraceña de acceso" ForeColor="Black" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#993300"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;<p> &nbsp;</p></td>
        </tr>
    </table>
    </center>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SitePrincipal.Master"  AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WebSIRECA.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="head"  >
    <script type="text/javascript">
    function validar() {
        if (window.event.keyCode == 13) {
            document.getElementById("<%= LoginButton.ClientId%>").click();
            //document.getElementById("<%= LoginButton.UniqueID%>").click();  nombre=UniqueID
        }
    }
    </script>
</asp:Content>
<asp:Content ID ="content2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<center >

<%--        <div class="img-thumbnail" style="background-color: #3399FF; width: 300px; height: 240px;"><br/>
<asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/sitios/sireca.png" CssClass="img-circle" Width="100px" BackColor="#999999" /><br/>
            <asp:TextBox ID="TBUsuario" runat="server" placeholder="Usuario" CssClass="text-center"></asp:TextBox><br/>
            <asp:TextBox ID="TBPasswords" runat="server" placeholder="Contraseña" TextMode="Password" CssClass="text-center"></asp:TextBox><br/>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Acceder</asp:LinkButton>
        </div>--%>
    <asp:Panel ID="LoginAcces" runat="server" HorizontalAlign="Center" Width="600px" BackColor="#ADB9CD">
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;" 
                align="center">
                <tr>
                    <td>
                        <table cellpadding="0" align="center" 
                            border="0" cellspacing="0">
                            <tr align ="center" >
                                <td  >
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                                <td >
                                    &nbsp;</td>
                            </tr>
                            <tr align="center">
                                <td >
                                    &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="text-center" placeholder="USUARIO" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" 
                                        ErrorMessage="El nombre de usuario es obligatorio." 
                                        ToolTip="El nombre de usuario es obligatorio." ValidationGroup="LoginAcces">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="Password" runat="server" CssClass="text-center" onKeyDown="javascript:validar();" 
                                        TextMode="Password" placeholder="CONTRASEÑA" Width="150px"></asp:TextBox>                                    
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." 
                                        ToolTip="La contraseña es obligatoria." ValidationGroup="LoginAcces">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                        Text="Inicio de sesión" ValidationGroup="LoginAcces" CssClass="btn" />
                                </td>
                                <td >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" style="color:Red;" class="style5">
                                    </td>
                                <td align="center" colspan="3" style="color:Red;" class="style1">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                                <td align="center" class="style5" style="color:Red;">
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    </td>
                                <td align="right" colspan="2" >
                                    &nbsp;</td>
                                <td align="right" class="style4">
                                    &nbsp;</td>
                                <td align="right" >
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    </asp:Panel>
<%--    <asp:DropShadowExtender ID="PanelcAPTURA_DropShadowExtender" runat="server" Enabled="True" TargetControlID="LoginAcces" Width="3" Opacity="0.5">
    </asp:DropShadowExtender>--%>
    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" Enabled="True" runat="server" Radius="15" TargetControlID="LoginAcces" Corners="All">
    </asp:RoundedCornersExtender>
</center>
    </asp:Content>

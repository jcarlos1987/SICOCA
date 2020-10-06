<%@ Page Language="vb" MasterPageFile ="~/sitios/SitePrincipal.Master"  AutoEventWireup="false" CodeBehind="Menu.aspx.vb" Inherits="WebSIRECA.Menu" %>
<asp:Content ID="headcontenido1" runat ="server" ContentPlaceHolderID ="head" >
    <link href="../css/menu.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Panel ID="PanelMenu" runat="server" HorizontalAlign="Center">    
    <table style="width:100%;" align="center">
        <tr>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UPanelCiclo1" runat="server" UpdateMode="Conditional">
                <ContentTemplate >
                    <asp:ImageButton ID="IB1ciclo" runat="server" 
                    ImageUrl="~/imagenes/sitios/ciclo1.png" CssClass="buttonMenu" />
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="IB1ciclo" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>                
            </td>
            <td>
                <asp:UpdatePanel ID="UPanelCiclo2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ImageButton ID="IB2ciclo" runat="server" 
                    ImageUrl="~/imagenes/sitios/ciclo2.png" CssClass="buttonMenu" />
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="IB2ciclo" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>                
            </td>
            <td>
                <asp:UpdatePanel ID="UPanelCiclo3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ImageButton ID="IB3ciclo" runat="server" 
                    ImageUrl="~/imagenes/sitios/ciclo3.png" CssClass="buttonMenu" />
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="IB3ciclo" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div id="div1ciclo" class="divciclo" ></div></td>
            <td>
                <div id="div2ciclo" class="divciclo" ></div></td>
            <td>
                <div id="div3ciclo" class="divciclo" >
                </div></td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>


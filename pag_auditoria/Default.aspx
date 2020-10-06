<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default8" %>

<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >

    <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" 
            DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#990000" Orientation="Horizontal" 
        StaticSubMenuIndent="10px">
        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicMenuStyle BackColor="#FFFBD6" />
        <DynamicSelectedStyle BackColor="#FFCC66" />
        <Items>
            <asp:MenuItem Text="CARGAR" Value="CARGAR">
                <asp:MenuItem NavigateUrl="~/rale/cargarRale.aspx" Text="RALE" Value="RALE">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/lgp/cargarLGP.aspx" Text="LGP" Value="LGP">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/procesar/cargarProcesar.aspx" Text="PROCESAR" 
                        Value="PROCESAR"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
            <asp:MenuItem Text="DESCARGAR" Value="DESCARGAR">
                <asp:MenuItem NavigateUrl="~/rale/descargarRale.aspx" Text="RALE" Value="RALE">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/lgp/descargarLGP.aspx" Text="LGP" Value="LGP">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/procesar/descargarProcesar.aspx" Text="PROCESAR" 
                        Value="PROCESAR"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/pag_asps/deudaMeses.aspx" Text="DEUDAS ACOMULADAS" 
                    Value="Nuevo elemento"></asp:MenuItem>
            <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/pag_supervisores/reporteGeneral.aspx" 
                    Text="REPORTE GENERAL" Value="Nuevo elemento"></asp:MenuItem>
            <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/analisisRaleRale/Default.aspx" 
                    Text="ANALISIS RALE vs RALE" Value="| ANALISIS RALE vs RALE">
            </asp:MenuItem>
            <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/pag_auditoria/AuAfil.aspx" Text="No Localizados" 
                Value="No Localizados"></asp:MenuItem>
        </Items>
        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticSelectedStyle BackColor="#FFCC66" />
    </asp:Menu>
</asp:Content>

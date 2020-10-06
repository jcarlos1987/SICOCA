<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="ProVsEco.aspx.vb" Inherits="WebSIRECA.ProVsEco" %>

<asp:Content ID ="c1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" Font-Bold="True" ForeColor="#CC0000">
            Nota: LA DEPURACION POR PROCESAR Y LGP ES DE FORMA AUTOMATICA <br />
            (AL MOMENTO DE CARGAR LOS ARCHIVOS AL SISTEMA)
        </asp:Panel>
    
        <asp:DropDownList ID="DDLPeriodo" runat="server" 
            DataSourceID="SqlDataSourcePeriodos" DataTextField="fechaEco" 
            DataValueField="fechaEco" ToolTip="Periodo a Depurar">
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" Text="DEPURAR POR: "></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="PROCESAR" 
            ToolTip="Click para iniciar la Depuración" BorderColor="#669999" 
            BorderStyle="Solid" BorderWidth="1px" />
        <asp:Button ID="BLGP" runat="server" Text="LGP" BorderColor="#669999" 
            BorderStyle="Solid" BorderWidth="1px" />
        <asp:Button ID="BA" runat="server" Text="A" Visible="False" 
            BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
        <asp:Button ID="BNL" runat="server" Text="NO LOCALIZADO" 
            BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
    <br />
        <asp:Label ID="LabelNL" runat="server"></asp:Label>
    <br />
        <asp:Label ID="LabelCOP" runat="server" Text=""></asp:Label>
    <br />
        <asp:Label ID="LabelCOMP" runat="server" Text=""></asp:Label>
    <br />
        <asp:Label ID="LabelRCV" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="LabelRCVCOMP" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LabelLGP" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LabelAutodeterminado" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSourcePeriodos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>"             
            SelectCommand="SELECT DISTINCT eco.fechaEco FROM sireca.dbo.eco AS eco GROUP BY eco.fechaEco ORDER BY 1 DESC">
        </asp:SqlDataSource>
    
    </div>

</asp:Content>

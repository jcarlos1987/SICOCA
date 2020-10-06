<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default47" %>

<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <center>
    <div class="btn-group input-prepend">
<asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" Width="150px"></asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="RALE C.O.P."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRCop" runat="server" Width="140px" 
        DataSourceID="SqlDataSourceRaleCop" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRaleCop" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 1 [name] as valor
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='COP' 
order by [fecha] desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="RALE R.C.V."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRRcv" runat="server" Width="140px" 
        DataSourceID="SqlDataSourceRaleRcv" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSourceRaleRcv" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 1 [name] as valor
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='RCV' 
order by [fecha] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
    <span class="add-on">
    <asp:LinkButton ID="LBActualizar" CssClass ="btn" runat="server"><i class="icon-refresh"></i>ACTUALIZAR</asp:LinkButton>
    </span> 
</div> 
</center>
<ul>
<li>
    <asp:LinkButton ID="LBINC" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" 
    CssClass="btn">Descargar creditos con INCIDENCIAS POR NOTIFICAR(01) en R.A.L.E. vs fechas de NOTIFICACION(02) en SIRECA</asp:LinkButton>
</li>
<li>

</li>
<li></li>
</ul>

</asp:Content>
<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default46" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="contenido1" runat="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
        <center><asp:Label ID="LMesg" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label></center>
        <table style="width: 500px;" align="center" class ="table-bordered" cellpadding="1" cellspacing="1">
             <tr>
                <td colspan="2" align="center" class ="alert-success" style="border-color: #808080; border-width: 2px; border-top-style: solid; border-bottom-style: solid">
                <asp:Label ID="Label1" runat="server" Text="REGISTRAR FACTURA" Font-Bold="True"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label6" runat="server" Text="CIFRA CONTROL"></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="TBCControl" runat="server" MaxLength="8"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>

                    <asp:Label ID="Label10" runat="server" Text="SUBDELEGACIÓN"></asp:Label>
                </td>
                <td>
                <asp:DropDownList ID="DDLSubdel" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label5" runat="server" Text="TIPO DOCUMENTO"></asp:Label>
                </td>
                <td>

                    <asp:DropDownList ID="DDLTipoDoc" runat="server">
                        <asp:ListItem Value="CAC">CAPITAL CONSTITUTIVO</asp:ListItem>
                        <asp:ListItem Value="RPA">RESOLUCION POR ACLARAR</asp:ListItem>
                        <asp:ListItem Value="NOC">NOTA DE CREDITO</asp:ListItem>
                        <asp:ListItem Value="RES">RESOLUCION</asp:ListItem>
                        <asp:ListItem Value="MRT">MULTA R.T.</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="REG. PATRONAL"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TBRegPat" runat="server" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="RAZON SOCIAL"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TBRazon" runat="server" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="COTIZANTES"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TBCotiz" runat="server" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="IMPORTE"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TBImporte" runat="server" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label3" runat="server" Text="CREDITO"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TBCredito" runat="server" MaxLength="9"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label4" runat="server" Text="PERIODO"></asp:Label>
                </td>
                <td>

                            <asp:DropDownList ID="DDLMes" runat="server" Width="120px">
                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" 
                                data-toggle="dropdown" Width="80px" >
                            </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class ="alert-success" style="border-color: #808080; border-width: 2px; border-top-style: solid; border-bottom-style: solid">
                    <asp:Label ID="Label11" runat="server" Text="ASIGNAR FACTURA" Font-Bold="True"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="INSPECTOR"></asp:Label>
                    </td>
                <td>

            <asp:DropDownList ID="DDLInspector" runat="server" 
                DataSourceID="SqlDataSourceUsuarios" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT us.id, uf.nombre
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE (us.subdel =?) AND (us.user_type = '1')
ORDER BY 2">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label13" runat="server" Text="ASIGNACIÓN"></asp:Label>

                </td>
                <td>
<asp:TextBox ID="TBFAsig" runat="server" MaxLength="10">S/A</asp:TextBox>
<asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFAsig"></asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="DILIGENCIA"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DDLDili" runat="server" DataSourceID="SqlDataSourceDili" 
                        DataTextField="texto" DataValueField="valor">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDili" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as valor,[ACTIVIDAD] as texto
FROM [sireca].[dbo].[catalogo]
WHERE [CVE_OTRAS_FACTURAS]='1'"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="FECHA DILIGENCIA"></asp:Label></td>
                <td>
<asp:TextBox ID="TBFDili" runat="server" MaxLength="10">S/D</asp:TextBox>
<asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFDili"></asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td align="right">
                    <asp:LinkButton CssClass="btn" ID="LBCargarAsignar" runat="server" 
                        BackColor="#468847">ACEPTAR</asp:LinkButton>
                </td>
            </tr>
        </table>
    
    </div>
</asp:Content>

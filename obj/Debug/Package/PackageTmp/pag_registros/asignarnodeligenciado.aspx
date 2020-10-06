<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="asignarnodeligenciado.aspx.vb" Inherits="WebSIRECA.asignarnodeligenciado" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/body.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style5
        {
            width: 4px;
        }
        .style6
        {
            width: 183px;
        }
        .style7
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                    <center><asp:Label ID="TBRegpat" runat="server" Font-Bold="True" ></asp:Label>
                    <asp:Label ID="TBRazon" runat="server" Font-Italic="True" ></asp:Label>
                    <hr />
                    <strong>ACTIVIDAD:</strong>&nbsp;&nbsp;<asp:Label ID="TBActi" runat="server" 
                            Font-Underline="False"></asp:Label>,&nbsp;
                    <strong>DOMICILIO:</strong>&nbsp;&nbsp;<asp:Label ID="TBDom" runat="server" 
                            Font-Underline="False"></asp:Label></center>
                <hr />
        <table align="center" border="0" cellspacing="0">
            <tr>
                <td class="style6">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
                    </asp:ScriptManager>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Button ID="Button1" runat="server" Text="GUARDAR" BackColor="#F4DE7E" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" />
                </td>
                <td class="style7">
                    <asp:Label ID="LMsg" runat="server"></asp:Label>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Label ID="Label1" runat="server" Text="·INTEGRADOR"></asp:Label>
                </td>
                <td class="style7" colspan="2">
                    <asp:DropDownList ID="DDLIntegrador" runat="server" 
                        DataSourceID="SqlDataSourceIntegrador" DataTextField="nombre" 
                        DataValueField="valor">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceIntegrador" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id] as valor
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=us.id) as nombre
FROM [sireca].[dbo].[usuarios] as us
where userIntegrador='1' and subdel=?  order by nombre
">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6" bgcolor="#A3D896">
                    <asp:Label ID="Label2" runat="server" Text="·FECHA DE ASIGNACION"></asp:Label>
                </td>
                <td class="style7" bgcolor="#A3D896" align="right">
                    <asp:TextBox ID="TBFechEntrega" runat="server" BackColor="#FFF3CD" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" 
                        Width="80px"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFechEntrega" Format="dd/MM/yyyy"></asp:CalendarExtender>
                </td>
                <td class="style7" bgcolor="#A3D896">
                    &nbsp;</td>
                <td class="style5" bgcolor="#A3D896">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Label ID="Label3" runat="server" Text="·FECHA LIMITE DE ENTREGA"></asp:Label>
                </td>
                <td class="style7" align="right">
                    <asp:TextBox ID="TBFechLimite" runat="server" BackColor="#FFF3CD" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" 
                        Width="80px"></asp:TextBox>
                    <asp:CalendarExtender id="CalendarExtender2" runat="server" TargetControlID="TBFechLimite" Format="dd/MM/yyyy">
                    </asp:CalendarExtender>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6" bgcolor="#A3D896">
                    <asp:Label ID="Label4" runat="server" Text="·CREDITOS COP"></asp:Label>
                </td>
                <td class="style7" bgcolor="#A3D896" align="right">
                    <asp:Label ID="LCredCop" runat="server" ForeColor="#CC0000" ></asp:Label>
                </td>
                <td class="style7" bgcolor="#A3D896">
                    &nbsp;</td>
                <td class="style5" bgcolor="#A3D896">
                   &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Label ID="Label5" runat="server" Text="·IMPORTE COP"></asp:Label>
                </td>
                <td class="style7" align="right">
                    <asp:Label ID="LImpCop" runat="server" ForeColor="#CC0000" ></asp:Label>
                </td>
                <td class="style7">
                    ,&nbsp;&nbsp; RANGO: 
                    <asp:Label ID="LRango" runat="server" ForeColor="#CC0000" ></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6" bgcolor="#A3D896">
                    <asp:Label ID="Label6" runat="server" Text="·CREDITOS RCV"></asp:Label>
                </td>
                <td class="style7" bgcolor="#A3D896" align="right">
                    <asp:Label ID="LCredRcv" runat="server" ForeColor="#CC0000" ></asp:Label>
                </td>
                <td class="style7" bgcolor="#A3D896">
                    &nbsp;</td>
                <td class="style5" bgcolor="#A3D896">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Label ID="Label7" runat="server" Text="·IMPORTE RCV"></asp:Label>
                </td>
                <td class="style7" align="right">
                    <asp:Label ID="LImpRcv" runat="server" ForeColor="#CC0000" ></asp:Label>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>

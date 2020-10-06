<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="cargardiligenciassinpago.aspx.vb" Inherits="WebSIRECA.cargardiligenciassinpago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="130px" CssClass="btn dropdown-toggle">
                            </asp:DropDownList>
    <asp:DropDownList ID="DDLBase" runat="server" DataSourceID="SqlDataSourceBase" DataTextField="texto" 
                                DataValueField="valor" Width="400px" AutoPostBack="True">
    </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBase" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                
                                
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(2)
SET @SUBDEL=?
exec('
select top 10 ''BASE DEL PERIODO ''+(substring(name,7,2)+''/''+substring(name,9,4))+'' CREADO ''+(substring(name,14,2)+''/''+substring(name,16,2)+''/''+substring(name,18,4)) as texto,(substring(name,7,2)+''_''+substring(name,9,4)) as valor 
from sireca.dbo.sysobjects 
where name like ''C_BC'+@SUBDEL+'%'' order by crdate desc
')
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
    <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" />
        <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#E3A42C" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Strikeout="False" 
                        Font-Underline="False" ForeColor="White">&nbsp;CARGAR DILIGENCIA PATRONAL</asp:LinkButton>
                            <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <table >
                            <tr>
                                <td></td>
                                <td><h4>Cargue solo la base descargada con las diligencias realizadas en Formato .ZIP</h4></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                        Se cargaran al sistema las diligencias que cuenten con:
                        <ol>
                            <li>Las claves de las diligencias descargadas</li>
                            <li>Con fechas (formato <strong >dd/mm/aaaa</strong >)</li>
                        </ol>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong > NOTA: de lo contrario el sistema los rebora.</strong></td>
                                <td></td>
                            </tr>
                        </table>
        </asp:Content>

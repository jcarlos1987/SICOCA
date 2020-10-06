<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="Ciclo3B.aspx.vb" Inherits="WebSIRECA.Ciclo3B" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content id="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <br /><br />
    <br />
    <br />
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td>
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            &nbsp;ASIGNADOS DE
                <asp:TextBox ID="TBFechIni" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="caext1" runat="server" TargetControlID="TBFechIni" Format="dd/MM/yyyy"></asp:CalendarExtender>
&nbsp;A LA
                <asp:TextBox ID="TBFechFin" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="caext2" runat="server" TargetControlID="TBFechFin" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" BackColor="#FFF3CD">&nbsp;&nbsp;ACTUALIZAR&nbsp;&nbsp;</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/pag_registros/Default.aspx" BackColor="#FFF3CD" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
        Font-Overline="False" Font-Underline="False">&nbsp;·&nbsp;CASOS NO DILIGENCIADOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:HyperLink>
            </td>
            <td rowspan="6">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="2" CellSpacing="1" 
                    DataSourceID="SqlDataSource1" EmptyDataText="SIN ASIGNACIÓN" 
                    ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="510px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" ReadOnly="True" 
                            SortExpression="INTEGRADOR" />
                        <asp:BoundField DataField="PENDIENTE" HeaderText="PENDIENTE" ReadOnly="True" 
                            SortExpression="PENDIENTE" DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CANCELADO" HeaderText="CANCELADO" ReadOnly="True" 
                            SortExpression="CANCELADO" DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RESTABLECIMIENTO" HeaderText="RESTABLECIMIENTO" 
                            ReadOnly="True" SortExpression="RESTABLECIMIENTO" 
                            DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" 
                            ReadOnly="True" SortExpression="TOTAL" 
                            DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL = ?
SET @FECH_INI =?
SET @FECH_FIN = ?
select [INTEGRADOR],[PENDIENTE],[CANCELADO],[RESTABLECIMIENTO],([PENDIENTE]+[CANCELADO]+[RESTABLECIMIENTO]) as TOTAL
FROM
(SELECT 
'1' AS CONTROLM
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[C_INTEGRADOR]) as [INTEGRADOR]
,[R_ESTADO_INTEGRACION] as RESULTADO
FROM [sirecaregistros].[dbo].[controlrangos] as cr inner join [sirecaregistros].[dbo].[registrorangos] as rr on cr.id_nd=rr.id_nd
where (select nd.subdel FROM [sirecaregistros].[dbo].[nodiligenciados] as nd where nd.id_nd=cr.id_nd)=@SUBDEL
and [C_FEC_ASIGNAC_EXP] between @FECH_INI and @FECH_FIN
) AS p
PIVOT
(
COUNT(p.CONTROLM)
FOR RESULTADO IN ([PENDIENTE],[CANCELADO],[RESTABLECIMIENTO])
) as pvt
order by [INTEGRADOR]
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                            PropertyName="Text" />
                    </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="HyperLink2" runat="server" BackColor="#FFF3CD" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
        NavigateUrl="~/pag_registros/integracionparacancelacion.aspx" 
        Font-Underline="False">&nbsp;·&nbsp;BAJAS/INTEGRACION PARA CANCELACION 469/2005&nbsp;&nbsp;</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
    <asp:HyperLink ID="HyperLink4" runat="server" BackColor="#FFF3CD" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
        NavigateUrl="~/pag_registros/integracionparalacancelacionsinasignar.aspx" 
        Font-Underline="False">&nbsp;·&nbsp;SIN ASIGNAR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
    <asp:HyperLink ID="HyperLink5" runat="server" BackColor="#FFF3CD" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
        NavigateUrl="~/pag_registros/integracionparalacancelacionasignados.aspx" 
        Font-Underline="False">&nbsp;·&nbsp;ASIGNADOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:HyperLink></td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="HyperLink3" runat="server" BackColor="#FFF3CD" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
        NavigateUrl="~/pag_registros/ActualizarND.aspx?tipo=reg" Font-Underline="False">&nbsp;·&nbsp;REGISTRAR NUEVO CASO NO DILIGENCIADO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>




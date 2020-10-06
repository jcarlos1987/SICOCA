<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="asignacion.aspx.vb" Inherits="WebSIRECA.asignacion1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
                    <ProgressTemplate >CARGANDO...</ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate >
        <table bgcolor="#678FB7" style="width: 100%;">
            <tr>
                <td>
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:Label ID="Label1" runat="server" Text="TRABAJO DEL PERIODO:"></asp:Label>
                            <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True">
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
                                AutoPostBack="True">
                            </asp:DropDownList>
        <asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" Visible="False" />
            
                            </td>
                <td align="center">
                <asp:TextBox ID="TBFecha" runat="server" MaxLength="10" Width="90px" 
                    BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" 
                    TargetControlID="TBFecha" WatermarkText="dd/mm/yyyy" 
                    WatermarkCssClass="watermarked">
                </asp:TextBoxWatermarkExtender>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
            TargetControlID="TBFecha" Format="dd/MM/yyyy">
        </asp:CalendarExtender>
                
                    <asp:Button ID="Button1" runat="server" Text="Asignar Casos" 
                    BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" />
                
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>                    
        <asp:SqlDataSource ID="SqlDataSourceVisitadores" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @ANIO  AS VARCHAR(4)
DECLARE @MES  AS VARCHAR(2)
SET @SUBDEL = ?
SET @ANIO=?
SET @MES=?
SELECT 
DISTINCT us.id,upper(uf.nombre) as nombre, uf.[user] AS usuario, us.sectores, us.subdel,us.totalFacturas,@MES as mes,@ANIO as anio
,(SELECT COUNT(DISTINCT(eco.REG#PATRONAL)) FROM sirecacobros.dbo.eco AS eco 
WHERE (eco.responsable = us.id ) 
AND eco.subdel=@SUBDEL AND month(eco.fechaSeleccion)=@MES and year(fechaSeleccion)=@ANIO) as FACTURAS
,(SELECT COUNT(DISTINCT(eco.REG#PATRONAL)) FROM sirecacobros.dbo.eco AS eco 
WHERE (eco.responsable = us.id ) 
AND eco.subdel=@SUBDEL AND month(eco.fechaSeleccion)=@MES and year(fechaSeleccion)=@ANIO AND (eco.incidencia IS NOT NULL)) AS TRABAJADAS

,(SELECT COUNT(DISTINCT(eco.REG#PATRONAL)) FROM sirecacobros.dbo.eco AS eco 
WHERE (eco.responsable = us.id ) 
AND eco.subdel=@SUBDEL AND month(eco.fechaSeleccion)=@MES and year(fechaSeleccion)=@ANIO AND (eco.incidencia IS NULL)) AS FALTANTES
, @SUBDEL as subdel 
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE us.subdel = @SUBDEL AND (us.userPae2 in ('1') or us.user_type in ('1'))
ORDER BY 2"
            UpdateCommand="UPDATE sireca.[dbo].[usuarios] SET [totalFacturas]=? WHERE [id] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="totalFacturas" Type="Double" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceVisitadores" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" Font-Size="10pt" HorizontalAlign="Left" 
            EmptyDataText="Sin Inspectores">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="nombre" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="user" HeaderText="user" SortExpression="user" 
                    Visible="False" />
                <asp:BoundField ReadOnly="True" />
                <asp:BoundField HeaderText="PATRONES" ReadOnly="True" DataField="FACTURAS" 
                    SortExpression="FACTURAS" />
                <asp:BoundField HeaderText="TRABAJADAS" ReadOnly="True" DataField="TRABAJADAS" 
                    SortExpression="TRABAJADAS"></asp:BoundField>
                <asp:BoundField HeaderText="FALTANTES" ReadOnly="True" DataField="FALTANTES" 
                    SortExpression="FALTANTES" />
                <asp:CommandField ShowEditButton="True" ButtonType="Image" 
                    CancelImageUrl="~/imagenes/page.png" EditImageUrl="~/imagenes/editar.png" 
                    UpdateImageUrl="~/imagenes/page_save.png" />
                <asp:BoundField DataField="totalFacturas" HeaderText="PATRONES x DÍA" 
                    SortExpression="totalFacturas" />
                <asp:HyperLinkField DataNavigateUrlFields="id,nombre,anio,mes,subdel" 
                    DataNavigateUrlFormatString="cobrosAsignados.aspx?userid={0}&amp;nombre={1}&amp;anio={2}&amp;mes={3}&amp;subdel={4}" 
                    NavigateUrl="~/pag_asps/cobrosAsignados.aspx" Target="_blank" 
                    Text="Asignados" />
                <asp:BoundField DataField="id" ReadOnly="True" >
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        
                </td>
                <td>
            <asp:Panel ID="Panel8" runat="server" Height="300px" ScrollBars="Auto" 
            Width="300px">
            
        <asp:GridView ID="GridView7" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceSectoresFaltantes" Font-Size="10pt" 
            HorizontalAlign="Center" GridLines="Horizontal" 
                    EmptyDataText="Asignación Completa">
            <Columns>
                <asp:BoundField DataField="regpat" HeaderText="REG.PATRONAL" 
                    SortExpression="regpat" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                    SortExpression="TOTAL" DataFormatString="falta(n): {0}" >
                <ItemStyle Font-Bold="True" ForeColor="#CC0000" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceSectoresFaltantes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
SET @SUBDEL=?
SELECT reg#patronal as regpat,COUNT(*) as TOTAL,sum(omision) as IMPORTE
FROM [sirecacobros].[dbo].[eco] 
WHERE subdel =@SUBDEL AND incidencia IS NULL AND responsable IS NULL
GROUP BY reg#patronal">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
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
    </ContentTemplate>
                    </asp:UpdatePanel>
    </div>
</asp:Content>

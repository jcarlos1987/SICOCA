<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="supervisor.aspx.vb" Inherits="WebSIRECA.supervisor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="contenido2" runat ="server" ContentPlaceHolderID ="head" >    
</asp:Content>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Panel ID ="panelPestanias" runat ="server" style="margin-bottom: 0px" 
        HorizontalAlign="Left" Width="100%" >&nbsp;&nbsp;
        <table style="width:100%;">
            <tr>
                <td width="400">
                    <asp:Menu ID="MenuSupervisor" runat="server" BackColor="#E3EAEB" 
                        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
                        ForeColor="#666666" Orientation="Horizontal" StaticSubMenuIndent="10px">
                        <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                        <DynamicMenuItemStyle BorderColor="#6600FF" BorderStyle="Solid" 
                            BorderWidth="1px" HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#E3EAEB" />
                        <Items>
                            <asp:MenuItem Text="INSPECTORES" Value="notificadores"></asp:MenuItem>
                            <asp:MenuItem Text="CASOS" Value="CASOS">
                                <asp:MenuItem Text="AUTODETERMINADOS" Value="autodeterminados"></asp:MenuItem>
                                <asp:MenuItem Text="DEPURADOS POR PROCESAR" Value="depurados"></asp:MenuItem>
                                <asp:MenuItem Text="NOTIFICADOS" Value="notificados"></asp:MenuItem>
                                <asp:MenuItem Text="NO LOCALIZADOS" Value="no localizados"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Herramientas" Value="Herramientas">
                                <asp:MenuItem Text="Autodeterminar" Value="autodeterminar"></asp:MenuItem>
                                <asp:MenuItem Text="Busqueda/Sector/Reg.Pat./R.Social/Incidencia" 
                                    Value="busqueda"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="javascript:void window.open('/WebSIRECA/pag_asps/incidencias.aspx','incidencias', 'fullscreen=0 scrollbars=yes width=400 height=200 menubar=0 status=0')" 
                                    Text="Incidencias" Value="Incidencias"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/pag_asps/SetUbicacion.aspx" Target="_blank" 
                                    Text="Registrar Ubicación Patronal" Value="Registrar Ubicación Patronal">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="REPORTE" Value="REPORTE">
                                <asp:MenuItem NavigateUrl="~/pag_asps/resultadosSupervisor.aspx" 
                                    Target="_blank" Text="GENERAL" Value="reportes"></asp:MenuItem>
                            </asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#FF9900" />
                    </asp:Menu>
                </td>
                <td>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="#009900" Text="Periodo:"></asp:Label>
</span> 
                    <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="150px">
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
                    <asp:DropDownList ID="DDLAnio" runat="server" AutoPostBack="True" ToolTip="PERIODO" Width="100">
                    </asp:DropDownList>
</div> 
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
    <asp:Panel ID ="panel1" runat ="server" BackColor="#E3EAEB" BorderColor="White" 
        BorderStyle="Double" ScrollBars="Auto" GroupingText="INSPECTORES" 
        Height="500px">
        <asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" Visible="False" />
            
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            Caption="Inspectores" DataSourceID="SqlDataSourceVisitadores" 
            BackColor="White" 
            CellPadding="0" DataKeyNames="id" Font-Size="10pt" HorizontalAlign="Left" 
            EmptyDataText="Sin Inspectores" CssClass="table-condensed">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="nombre" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="user" HeaderText="user" SortExpression="user" 
                    Visible="False" />
                <asp:BoundField DataField="sectores" HeaderText="SECT." 
                    SortExpression="sectores"  />
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
                <asp:HyperLinkField DataNavigateUrlFields="id,nombre,periodox" 
                    DataNavigateUrlFormatString="cobrosAsignados.aspx?userid={0}&amp;nombre={1}&amp;periodo={2}" 
                    NavigateUrl="~/pag_asps/cobrosAsignados.aspx" Target="_blank" 
                    Text="Asignados" >
                <ControlStyle CssClass="label label-info" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="id" ReadOnly="True" >
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" ForeColor="White" 
                CssClass="btn-info" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        <asp:Panel ID="PanelSectores" runat="server" 
            GroupingText="Sectores Faltantes" Width="400" 
            HorizontalAlign="Center" ScrollBars="Auto" CssClass="well">
            <asp:Panel ID="PanelAsignar" runat="server">
            <div class="btn-group input-prepend">
                <asp:DropDownList ID="DDLTipoEco" runat="server" Font-Size="9pt" Width="160px">
                    <asp:ListItem Value=" AND eco.tipoEco in ('COP','COMP') ">C.O.P. y COMP.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('COP') ">C.O.P.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('COMP') ">COMP.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('COP','RCV') ">C.O.P. y R.C.V.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('COMP','RCVCOMP') ">COMP. y R.C.V.COMP.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('COP','RCV','COMP','RCVCOMP') ">C.O.P., R.C.V., COMP. y R.C.V.COMP.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('RCV') ">R.C.V.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('RCVCOMP') ">R.C.V.COMP.</asp:ListItem>
                    <asp:ListItem Value=" AND eco.tipoEco in ('RCV','RCVCOMP') ">R.C.V. y R.C.V.COMP.</asp:ListItem>
                </asp:DropDownList>
                <asp:HyperLink ID="HLFaltantes" CssClass="btn" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"
                    NavigateUrl="~/pag_asps/Faltantes.aspx" Target="_blank" 
                    ToolTip="Visualiza los casos que faltan." >Faltantes</asp:HyperLink>
            </div>
                <br />
            <div class="btn-group input-prepend">
                <asp:TextBox ID="TBFecha" CssClass="text-center" runat="server" MaxLength="10" Width="150px" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" TargetControlID="TBFecha" WatermarkText="dd/mm/yyyy" WatermarkCssClass="watermarked">
                </asp:TextBoxWatermarkExtender>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFecha" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Asignar" 
                    BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
                    ToolTip="Asigna los casos con los fitros seleccionados" />
            </div>
            </asp:Panel><br />
            <asp:Panel ID="Panel8" runat="server" Height="300px" ScrollBars="Auto" 
            Width="300px">
            
        <asp:GridView ID="GridView7" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceSectoresFaltantes" Font-Size="10pt" 
            HorizontalAlign="Center" GridLines="Horizontal" 
                    EmptyDataText="Asignación Completa">
            <Columns>
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO ECO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" DataFormatString=", del Sector: {0}, " />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                    SortExpression="TOTAL" DataFormatString="falta(n): {0}" >
                <ItemStyle Font-Bold="True" ForeColor="#CC0000" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                CssClass="btn-info" />
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
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT tipoEco,convert(int,sector) as sector,COUNT (sector) as TOTAL
FROM [sireca].[dbo].[eco] 
WHERE fechaEco =(?+?) AND subdel =? AND incidencia IS NULL AND responsable IS NULL
and eco.validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL')
and cambiarIncidencia='9' /*and TP not in ('0*','1*','2*','3*','4*','5*','6*','7*','8*','9*')*/
and tipoeco not in ('EMA','EBA')
GROUP BY tipoEco,sector 
HAVING COUNT(sector) &gt; 0
ORDER BY sector">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
        </asp:Panel>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSourceVisitadores" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
SET @SUBDEL = ?
SET @PERIODO = ?+?

SELECT DISTINCT us.id, upper(uf.nombre) as nombre, uf.[user] AS usuario, us.sectores, us.subdel,us.totalFacturas,@PERIODO as periodox
,(SELECT COUNT(DISTINCT(eco.REG#PATRONAL)) FROM sireca.dbo.eco AS eco 
WHERE (eco.responsable = us.id ) 
AND eco.subdel=@SUBDEL AND eco.fechaEco=@PERIODO ) as FACTURAS

,(SELECT COUNT(DISTINCT(eco.REG#PATRONAL)) FROM sireca.dbo.eco AS eco 
WHERE (eco.responsable = us.id ) 
AND eco.subdel=@SUBDEL AND eco.fechaEco=@PERIODO AND (eco.incidencia IS NOT NULL)) AS TRABAJADAS

,(SELECT COUNT(DISTINCT(eco.REG#PATRONAL)) FROM sireca.dbo.eco AS eco 
WHERE (eco.responsable = us.id ) 
AND eco.subdel=@SUBDEL AND eco.fechaEco=@PERIODO AND (eco.incidencia IS NULL)) AS FALTANTES
 
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE (us.subdel = @SUBDEL) AND (us.user_type in ('1','11'))
ORDER BY 2"
            UpdateCommand="UPDATE sireca.[dbo].[usuarios] SET [sectores] = ?, [totalFacturas]=? WHERE [id] = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="sectores" Type="String" />
                <asp:Parameter Name="totalFacturas" Type="Double" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />                
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel> 
    <asp:Panel ID ="panel2" runat ="server" Visible="False" BackColor="#8FB78E" 
        BorderColor="White" BorderStyle="Double" ScrollBars="Auto" Height="500px" 
        Width="100%" GroupingText="Busqueda">
<div class="btn-group input-prepend">
        <asp:TextBox ID="VXRegPat" runat="server" MaxLength="10" Width="113px" ></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="VXRegPat" 
            WatermarkText="REG. PATRONAL">
        </asp:TextBoxWatermarkExtender>
        <asp:TextBox ID="VXRaSocial" runat="server" MaxLength="20"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="VXRaSocial" 
            WatermarkText="RAZON SOCIAL"></asp:TextBoxWatermarkExtender> 
        <asp:TextBox ID="VXSectores" runat="server" MaxLength="3" Width="60px" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="VXSectores" 
            WatermarkText="SECTOR"></asp:TextBoxWatermarkExtender> 
        <asp:TextBox ID="VXCreditos" runat="server" MaxLength="11" Width="90px" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="VXCreditos" 
            WatermarkText="CREDITO"></asp:TextBoxWatermarkExtender> 
        <asp:TextBox ID="VXIncidencia" runat="server" MaxLength="3" Width="56px"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="VXIncidencia" 
            WatermarkText="INC."></asp:TextBoxWatermarkExtender> 
<span class="add-on">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass ="btn" 
            BorderColor="#BCC7D8" ToolTip="BUSCAR">&nbsp;<i class="icon-search"></i>&nbsp;Buscar</asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server" CssClass ="btn" 
            BorderColor="#BCC7D8" ToolTip="EXPORTAR A EXCEL">&nbsp;<i class="icon-download-alt"></i>&nbsp;Descargar</asp:LinkButton>
</span> 
</div>            
            <asp:Panel ID="Panel6" 
            runat="server" Height="435px" ScrollBars="Auto">

        <asp:SqlDataSource ID="SqlDataSourcePatronesScan" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                SelectCommand="SELECT eco.id as id,eco.tipoEco, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL], ptn.dom AS DOMICILIO, eco.CREDITO, eco.COTIZ, eco.DIAS
, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco
,(SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable, eco.fechaCaptura, eco.sector, eco.incidencia, eco.horaCitatorio,eco.fechaSeleccion 
FROM sireca.dbo.eco AS eco  INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE (eco.subdel = ?) AND (eco.REG#PATRONAL LIKE '%' + ? + '%') AND (eco.fechaEco = ?+?) 
AND (eco.[NOMBRE O RAZON SOCIAL] LIKE '%' + ? + '%') AND (eco.sector LIKE ? ) AND (eco.CREDITO LIKE '%' + ? + '%')  
AND (eco.incidencia like ?+'%')">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="VXRegPat" DefaultValue="00" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="VXRaSocial" DefaultValue="00" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="VXSectores" DefaultValue="00" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="VXCreditos" DefaultValue="0000" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="VXIncidencia" DefaultValue="000" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourcePatronesScan0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT eco.id as id,eco.tipoEco, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL],ptn.dom as DOMICILIO, eco.CREDITO, eco.COTIZ, eco.DIAS
, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable, eco.fechaCaptura, eco.sector, eco.incidencia, eco.horaCitatorio,eco.fechaSeleccion 
FROM sireca.dbo.eco AS eco  INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE (eco.subdel = ?) AND (eco.REG#PATRONAL LIKE '%' + ? + '%') AND (eco.fechaEco = ?+?) 
AND (eco.[NOMBRE O RAZON SOCIAL] LIKE '%' + ? + '%') AND (eco.sector LIKE ? ) AND (eco.CREDITO LIKE '%' + ? + '%')
">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                    <asp:ControlParameter ControlID="VXRegPat" DefaultValue="00" Name="?" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="VXRaSocial" DefaultValue="00" Name="?" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="VXSectores" DefaultValue="00" Name="?" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="VXCreditos" DefaultValue="0000" Name="?" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Caption="Patrones" CellPadding="1" 
                DataSourceID="SqlDataSourcePatronesScan" EmptyDataText="0 PATRONES ENCONTRADOS" 
                Font-Size="9pt" CellSpacing="1">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="id,REG#PATRONAL,fechaEco,incidencia" 
                        DataNavigateUrlFormatString="detallesRegpat.aspx?id={0}&amp;regpat={1}&amp;periodo={2}&amp;incidencia={3}" 
                        NavigateUrl="~/pag_asps/detallesRegpat.aspx" Target="_blank" 
                        Text="Opciones" >
                    <ControlStyle CssClass="label label-info" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                        SortExpression="fechaEco" />
                    <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                        SortExpression="tipoEco" />
                    <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                        SortExpression="sector" />
                    <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG.PAT." 
                        SortExpression="REG#PATRONAL" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" 
                        SortExpression="DOMICILIO" />
                    <asp:BoundField DataField="TP" HeaderText="TP" SortExpression="TP" 
                        Visible="False" />
                    <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" HeaderText="RAZON SOCIAL" 
                        SortExpression="NOMBRE O RAZON SOCIAL" />
                    <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                        SortExpression="CREDITO" />
                    <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" 
                        DataFormatString="{0:N0}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" 
                        DataFormatString="{0:N0}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" 
                        Visible="False" />
                    <asp:BoundField DataField="ACT#" HeaderText="ACT#" SortExpression="ACT#" 
                        Visible="False" />
                    <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" SortExpression="PRIMA" 
                        Visible="False" />
                    <asp:BoundField DataField="OMISION" HeaderText="IMPORTE" 
                        SortExpression="OMISION" DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                        SortExpression="COP/ACT" Visible="False" />
                    <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                        SortExpression="RECARGOS" Visible="False" />
                    <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                        DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                        DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fechaSeleccion" HeaderText="ENTREGADO" 
                        SortExpression="fechaSeleccion" DataFormatString="{0:d}">
                    <ItemStyle BackColor="#99FF99" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="responsable" HeaderText="INSPECTOR" 
                        SortExpression="responsable">
                    <ItemStyle BackColor="#99FF99" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fechaCaptura" HeaderText="NOTIFICADO" 
                        SortExpression="fechaCaptura" DataFormatString="{0:d}">
                    <ItemStyle BackColor="#99FF99" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="incidencia" HeaderText="INC." 
                        SortExpression="incidencia">
                    <ItemStyle BackColor="#99FF99" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="horaCitatorio" HeaderText="Hr. CITATORIO" 
                        SortExpression="horaCitatorio">
                    <ItemStyle BackColor="#99FF99" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                    CssClass="btn-info" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </asp:Panel>
    </asp:Panel> 
    <asp:Panel ID ="panel3" runat ="server" BackColor="#CCCCCC" BorderColor="White" 
        BorderStyle="Double" Height="100%" Visible="False">
    <asp:Panel ID ="panelBusqueda" runat ="server"  GroupingText="Casos" 
            BackColor="#E3EAEB" ScrollBars="Auto" Wrap="False" Height="500px">          
        <asp:ImageButton ID="ImageButton3" runat="server" ImageAlign="Middle" 
        ImageUrl="~/imagenes/page_refresh.png" ToolTip="Buscar o Actualizar" />
        <asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" />
        &nbsp;<asp:SqlDataSource ID="SqlDataSourceSectores" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT DISTINCT (eco.sector) as EMIP_SEC 
FROM sireca.dbo.eco AS eco 
WHERE (eco.responsable IS NOT NULL) AND (eco.fechaEco = ?+?) AND (eco.subdel  = ?) 
AND (eco.incidencia =? OR eco.incidencia =?)
ORDER BY eco.sector
">
            <SelectParameters>
                <asp:ControlParameter ControlID="VAMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:Parameter DefaultValue="9" Name="?" />
                <asp:Parameter DefaultValue="POR PROCESAR" Name="?" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Caption="Patrones Disponibles" 
            CellPadding="1" DataSourceID="SqlDataSourceNL" EmptyDataText="0 CASOS" 
            Font-Size="9pt" BackColor="White" DataKeyNames="id" CellSpacing="1">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="id,REG#PATRONAL,fechaEco,incidencia" 
                    DataNavigateUrlFormatString="detallesRegpat.aspx?id={0}&amp;regpat={1}&amp;periodo={2}&amp;incidencia={3}" 
                    NavigateUrl="~/pag_asps/detallesRegpat.aspx" Target="_blank" Text="Opciones" />
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" ReadOnly="True" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" ReadOnly="True" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" ReadOnly="True" />
                <asp:BoundField DataField="responsable" 
                    SortExpression="responsable" ReadOnly="True" HeaderText="INSPECTOR" >
                <ItemStyle BackColor="#99FF99" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaCaptura" DataFormatString="{0:D}" 
                    HeaderText="NOTIFICADO" SortExpression="fechaCaptura" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" ReadOnly="True" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" ReadOnly="True" />
                <asp:BoundField DataField="TP" HeaderText="TP" 
                    SortExpression="TP" ReadOnly="True" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" 
                    ReadOnly="True" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" ReadOnly="True" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" 
                    ReadOnly="True" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" 
                    ReadOnly="True" />
                <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" 
                    ReadOnly="True" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" SortExpression="ACT#" 
                    ReadOnly="True" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" SortExpression="PRIMA" 
                    ReadOnly="True" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    ReadOnly="True" DataFormatString="{0:C}" />
            </Columns>
            <EditRowStyle BorderColor="Black" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle BorderColor="Black" BorderStyle="None" ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSourceNL" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"             
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT eco.id, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, (SELECT razonSocial FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' ) AS [NOMBRE O RAZON SOCIAL], eco.CREDITO, eco.COTIZ
,eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco,(SELECT uf.nombre
FROM fiscamovil.dbo.Usuarios AS uf 
WHERE uf.id = eco.responsable ) as responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO,eco.fechaCaptura
, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector 
FROM sireca.dbo.eco AS eco 
WHERE (eco.subdel = ?) AND (eco.fechaEco = ?+?) AND (eco.incidencia = ?)" 
            UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="9" Name="?" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cambiarIncidencia" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAuto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT eco.id, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, (SELECT razonSocial FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' ) AS [NOMBRE O RAZON SOCIAL], eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA
, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco,(SELECT uf.nombre
FROM fiscamovil.dbo.Usuarios AS uf 
WHERE uf.id = eco.responsable ) as responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO, eco.diasDisponibles,eco.fechaCaptura
, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector 
FROM sireca.dbo.eco AS eco 
WHERE (eco.subdel = ?) AND (eco.fechaEco = ?+?) AND (eco.incidencia = ?)" 
            UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="A" Name="?" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="0" Name="cambiarIncidencia" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNotificados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT eco.id, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, (SELECT razonSocial FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' ) AS [NOMBRE O RAZON SOCIAL], eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, (SELECT uf.nombre
FROM fiscamovil.dbo.Usuarios AS uf 
WHERE uf.id = eco.responsable ) as responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO, eco.diasDisponibles,eco.fechaCaptura
, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector 
FROM sireca.dbo.eco AS eco
WHERE (eco.subdel = ?) AND (eco.fechaEco = ?+?) AND (eco.incidencia = ?)" 
            UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="2" Name="?" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="0" Name="cambiarIncidencia" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
  </asp:Panel>
 
    </asp:Panel> 
    <asp:Panel ID ="panel4" runat ="server" BackColor="#E3EAEB" BorderColor="White" 
        BorderStyle="Double" Visible="False" GroupingText="Autodeterminar" Height="500px">
        <center >
        <div class="btn-group input-prepend">
<span class="add-on">
        <asp:Label ID="Label12" runat="server" Text="Reg.Patronal:"></asp:Label>
</span>
        <asp:TextBox ID="VARegPat" runat="server" MaxLength="10" Width="120px"></asp:TextBox>
        <asp:Label ID="Label13" runat="server" Text="Periodo:"></asp:Label>
        <asp:DropDownList ID="VAMes" runat="server" Width="100px">
            <asp:ListItem Value="1">Enero</asp:ListItem>
            <asp:ListItem Value="2">Febrero</asp:ListItem>
            <asp:ListItem Value="3">Marzo</asp:ListItem>
            <asp:ListItem Value="4">Abril</asp:ListItem>
            <asp:ListItem Value="5">Mayo</asp:ListItem>
            <asp:ListItem Value="6">Junio</asp:ListItem>
            <asp:ListItem Value="7">Julio</asp:ListItem>
            <asp:ListItem Value="8">Agosto</asp:ListItem>
            <asp:ListItem Value="9">Septiembre</asp:ListItem>
            <asp:ListItem Value="10">Octubre</asp:ListItem>
            <asp:ListItem Value="11">Noviembre</asp:ListItem>
            <asp:ListItem Value="12">Diciembre</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="VAAnio" runat="server" Width="80px">
        </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label14" runat="server" Text="Tipo:"></asp:Label>
</span>
        <asp:DropDownList ID="VATipo" runat="server" Width="80px">
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Confirmar" CssClass="form-inline" />
</span>
<span class="add-on">
        <asp:ImageButton ID="ImageButton9" runat="server" Height="19px" 
            ImageAlign="Middle" ImageUrl="~/imagenes/guardar.png" Width="20px" 
        ToolTip="Autodeterminar" />
        <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
</span>
</div>
        <br />
        <asp:Panel ID="Panel7" runat="server" Height="450px" ScrollBars="Auto">
        
        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceRegAutodeter" 
            ForeColor="Black" GridLines="Vertical" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="regpat" HeaderText="REGISTRO PATRONAL" 
                    SortExpression="regpat" />
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO ECO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="periodo" HeaderText="PERIODO" 
                    SortExpression="periodo" />
                <asp:BoundField DataField="fechaRegistro" HeaderText="FECHA DE REGISTRO" 
                    SortExpression="fechaRegistro" DataFormatString="{0:F}" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings PageButtonCount="30" Position="TopAndBottom" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceRegAutodeter" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT id, regpat, tipoEco, periodo, fechaRegistro, idRegistro, subdel FROM sireca.dbo.autodeterminados ORDER BY fechaRegistro DESC">
        </asp:SqlDataSource>
        </asp:Panel> 
        </center>
    </asp:Panel>
   
    <asp:Panel ID ="panel5" runat ="server" BackColor="#E3EAEB" BorderColor="White" 
        BorderStyle="Double" ScrollBars="Auto" Visible="False" 
        GroupingText="Depurados" Height="500px"><asp:ImageButton ID="ImageButton8" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" />
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            Caption="Visitadores" DataSourceID="SqlDataSource3" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" AllowSorting="True" Font-Size="10pt" PageSize="15" 
            DataKeyNames="id">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="id,REG#PATRONAL,fechaEco,incidencia" 
                    DataNavigateUrlFormatString="detallesRegpat.aspx?id={0}&amp;regpat={1}&amp;periodo={2}&amp;incidencia={3}" 
                    NavigateUrl="~/pag_asps/detallesRegpat.aspx" Target="_blank" Text="Opciones" />
                <asp:BoundField DataField="FEC_MOV" DataFormatString="{0:d}" 
                    HeaderText="FEC_MOV" SortExpression="FEC_MOV">
                <HeaderStyle Font-Bold="True" ForeColor="#FF6600" />
                <ItemStyle ForeColor="#CC6600" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" ReadOnly="True" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" ReadOnly="True" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" ReadOnly="True" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" ReadOnly="True" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="NOMBRE O RAZON SOCIAL" ReadOnly="True" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" ReadOnly="True" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" 
                    SortExpression="COTIZ" ReadOnly="True" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    ReadOnly="True" DataFormatString="{0:C}" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @INCIDENCIA AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
SET @SUBDEL = ?
SET @INCIDENCIA = 'POR PROCESAR'
SET @PERIODO = ?+?

SELECT 
eco.id, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, (SELECT top 1 razonSocial FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' ) AS [NOMBRE O RAZON SOCIAL], eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector 
,(select top 1 MAX(pro.RCP_FEC_MOV) from [procesar].[dbo].[RCPRO] as pro where pro.[RCP_REGPAT]=eco.REG#PATRONAL) as FEC_MOV
FROM sireca.dbo.eco AS eco
WHERE (eco.subdel = @SUBDEL) AND (eco.incidencia=@INCIDENCIA) AND (eco.fechaEco = @PERIODO)" 
            UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cambiarIncidencia" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
           </asp:Content>

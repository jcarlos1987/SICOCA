<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="resultadosSupervisor.aspx.vb" Inherits="WebSIRECA.resultadosSupervisor" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID ="Content2" runat ="server" ContentPlaceHolderID ="head"  >

</asp:Content>
<asp:Content ID ="content1" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server"  >
    <asp:Panel ID="PMenu" runat="server" HorizontalAlign="Left">
<div class="btn-group input-prepend">
<span class="add-on">
    &nbsp;&nbsp;<asp:Label ID="LPeriodo" runat="server" Text="PERIODO: "></asp:Label>
</span>
    <asp:DropDownList ID="DDLPeriodo" runat="server" 
        DataSourceID="SqlDataSourcePeriodo" DataTextField="fechas" 
        DataValueField="fechas" AutoPostBack="True" Width="120px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct (eco.fechaEco) as fechas
FROM [sireca].[dbo].[eco] eco
group by eco.fechaEco
order by fechas desc">
    </asp:SqlDataSource>

    <asp:Label ID="Lfecha" runat="server" Text="FECHA:" Visible="False"></asp:Label>
    <asp:DropDownList ID="DDL1" runat="server" 
        DataSourceID="SqlDataSourceFechasCapturaI" DataTextField="fechas" 
        DataValueField="fechas" Visible="False" DataTextFormatString="{0:d}">
    </asp:DropDownList>
    <asp:Label ID="Lfecha2" runat="server" Text=" A LA " Visible="False"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSourceFechasCaptura" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct(convert(varchar(11),eco.fechaSeleccion)) as fechas
,convert(datetime,convert(varchar(11),eco.fechaSeleccion),103) as orden
FROM [sireca].[dbo].[eco] as eco
where eco.fechaEco=? and eco.subdel=?
and eco.fechaSeleccion is not null
group by eco.fechaSeleccion 
order by 2 desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceFechasCapturaI" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct(convert(varchar(11),eco.fechaSeleccion)) as fechas
,convert(datetime,convert(varchar(11),eco.fechaSeleccion),103) as orden
FROM [sireca].[dbo].[eco] as eco
where eco.fechaEco=? and eco.subdel=?
and eco.fechaSeleccion is not null
group by eco.fechaSeleccion 
order by 2 ">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:DropDownList ID="DDL2" runat="server" 
        DataSourceID="SqlDataSourceFechasCaptura" DataTextField="fechas" 
        DataValueField="fechas" Visible="False" DataTextFormatString="{0:d}">
    </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label2" runat="server" Text="Tipo:"></asp:Label>
</span>
        <asp:DropDownList ID="DDLTipoEco" runat="server" Width="130px">
            <asp:ListItem Value="CO">COP y COMP</asp:ListItem>
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>COMP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
            <asp:ListItem Value="RCVCOMP">RCV COMP</asp:ListItem>
        </asp:DropDownList>
        <asp:ImageButton ID="ImageButton4" CssClass="btn" runat="server" ImageUrl="~/imagenes/actualizar2.png" Width="20px" />
</div>
        <asp:Menu ID="MenuReportes" runat="server" BackColor="#E3EAEB" 
        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="10pt" 
        ForeColor="#666666" Orientation="Horizontal" StaticSubMenuIndent="10px">
        <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicMenuStyle BackColor="#E3EAEB" />
        <DynamicSelectedStyle BackColor="#1C5E55" />
        <Items>
            <asp:MenuItem Text="INCIDENCIAS" 
                Value="INCIDENCIAS" Selected="True"></asp:MenuItem>
            <asp:MenuItem Text="INSPECTORES" Value="NOTIFICADORES">
            </asp:MenuItem>
            <asp:MenuItem Text="SECTORES" Value="SECTORES"></asp:MenuItem>
        </Items>
        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticSelectedStyle BackColor="#FF9900" />
    </asp:Menu>
   </asp:Panel>
    <asp:Panel ID="PContenido" runat="server" BackColor="#E3EAEB" 
        ScrollBars="Auto">
        <asp:Panel ID="PanelGeneral" runat="server" GroupingText="Reporte General">
            <asp:GridView ID="GridViewGeneral" runat="server" AutoGenerateColumns="False" 
                BackColor="White" DataSourceID="SqlDataSourceGeneral" 
                Font-Size="9pt" HorizontalAlign="Left" ShowFooter="True" 
                AllowSorting="True" CssClass="table-condensed">
                <Columns>
                    <asp:BoundField DataField="TIPO DE ECO" HeaderText="TIPO DE ECO" 
                        SortExpression="TIPO DE ECO" />
                    <asp:HyperLinkField DataNavigateUrlFields="PERIODO,TIPO DE ECO" 
                        DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=TODO&amp;tipoEco={1}" 
                        DataTextField="TOTAL" HeaderText="PATRONES" 
                        NavigateUrl="~/pag_asps/detallesSeleccion.aspx" Target="_blank" />
                    <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                        NullDisplayText="0" SortExpression="COTIZANTES" />
                    <asp:BoundField DataField="OMOSION" DataFormatString="{0:C2}" 
                        HeaderText="OMISION" ReadOnly="True" SortExpression="OMOSION" />
                    <asp:BoundField DataField="MULTA" DataFormatString="{0:C2}" HeaderText="MULTA" 
                        ReadOnly="True" SortExpression="MULTA" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" 
                    CssClass="btn-info" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceGeneral" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
  subdel
  ,fechaEco as [PERIODO]
  ,tipoECO as [TIPO DE ECO]
  ,COUNT(*) as TOTAL
  ,SUM(COTIZ) as COTIZANTES
  ,SUM(OMISION) as OMOSION
  ,SUM(MULTA) as MULTA
  FROM [sireca].[dbo].[eco]
  where fechaEco = ? and subdel=? and tipoEco like ?+'%'
  group by subdel,fechaEco,tipoECO
  order by 4">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                    <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="PanelInforme" runat="server" ScrollBars="Auto">
        <asp:Panel ID="PanelCostos" runat="server" GroupingText="Informe General">
            <asp:GridView ID="GVGeneral" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceInforme" HorizontalAlign="Left" 
                ShowFooter="True" Font-Size="9pt" 
                AllowSorting="True" CssClass="table-condensed">
                <Columns>                   
                    <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                        SortExpression="tipoECO" />
                    <asp:TemplateField HeaderText="INCIDENCIA" SortExpression="INCIDENCIA">
                        <ItemTemplate>
                            <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink2" 
                                runat="server" NavigateUrl='<%# Eval("INCIDENCIA", "masDetalles.aspx?tipo={0}") %>' 
                                Text='<%# Eval("INCIDENCIA") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CASOS" HeaderText="PATRONES" ReadOnly="True" 
                        SortExpression="CASOS" />
                    <asp:HyperLinkField DataNavigateUrlFields="fechaEco,INCIDENCIA,tipoEco" 
                        DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=INCIDENCIAGENERAL&amp;tipo2={1}&amp;tipoEco={2}&amp;title={1}" 
                        DataTextField="CASOS" HeaderText="PATRONES" 
                        NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="CASOS" 
                        Target="_blank" />
                    <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                        NullDisplayText="0" ReadOnly="True" SortExpression="COTIZANTES" />
                    <asp:BoundField DataField="OMISION" HeaderText="OMISION" ReadOnly="True" 
                        SortExpression="OMISION" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="MULTA" HeaderText="MULTA" ReadOnly="True" 
                        SortExpression="MULTA" DataFormatString="{0:C}" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" 
                    CssClass="btn-info" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:Chart ID="Chart2" runat="server" 
                DataSourceID="SqlDataSourceInforme" BackColor="Transparent" 
                BackImageTransparentColor="Transparent" Height="350px" Width="700px">
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="INCIDENCIA" 
                        YValueMembers="CASOS" 
                        CustomProperties="PieDrawingStyle=Concave, PieLabelStyle=Disabled" 
                        Font="Calibri, 10pt" IsValueShownAsLabel="True" Label="#PERCENT{P}" 
                        Legend="Legend1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                        <Area3DStyle Enable3D="True" />
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Alignment="Center" Font="Calibri, 10pt" InterlacedRows="True" 
                        IsTextAutoFit="False" Name="Legend1">
                        <CellColumns>
                            <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="color">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Name="nombre" Text="#VALX">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Name="porcentaje">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Name="cantidad" Text="= #VAL">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                        </CellColumns>
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Font="Calibri, 12pt" Name="Title1" Text="Informe por Incidencia">
                    </asp:Title>
                    <asp:Title Font="Calibri, 11pt" Name="Title2">
                    </asp:Title>
                </Titles>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSourceInforme" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="use sireca 
drop table catalogoTemp2
select * into catalogoTemp2
from (
SELECT eco.fechaEco as fechaEco,eco.tipoEco as tipoEco,INCIDENCIA = 
	CASE eco.incidencia
		WHEN '9' THEN 'NO LOCALIZADOS'
		WHEN 'A' THEN 'AUTODETERMINADO'
                                WHEN 'BD' THEN 'BAJA DEFINITIVA'
		WHEN 'RE' THEN 'PAGADO'
		WHEN 'PAGADO' THEN 'PAGADO'
		WHEN 'POR PROCESAR' THEN 'PAGADO'
	ELSE 'POR COBRAR'
	END
,SUM(eco.COTIZ ) as COTIZ,COUNT(*) AS CASOS,SUM(eco.OMISION) AS OMISION,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = ?
and eco.fechaEco = ?
and eco.tipoECO  like ?+'%'
GROUP BY eco.fechaEco,eco.tipoEco,INCIDENCIA
) as temporal
SELECT cat.[INCIDENCIA],SUM(cat.COTIZ) as COTIZANTES,SUM(cat.CASOS) as CASOS,SUM(cat.OMISION) as OMISION,SUM(cat.MULTA) as MULTA,cat.fechaEco,cat.tipoEco
FROM [sireca].[dbo].[catalogoTemp2] as cat
GROUP BY  cat.[INCIDENCIA],cat.fechaEco,cat.tipoEco
ORDER BY 4">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                    <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="PanelDetallesCostos" runat="server" 
            GroupingText="Informe Por Incidencia">
        
        <asp:GridView ID="GVDetallesResumen" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceResumenGeneral" ShowFooter="True" 
                HorizontalAlign="Left" EmptyDataText="0" 
                Font-Size="10pt" AllowSorting="True" CssClass="table-condensed">
            <Columns>
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" />
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="CASOS" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="CASOS" NullDisplayText="0" />
                <asp:HyperLinkField DataNavigateUrlFields="fechaEco,incidenciav,tipoEco,INCIDENCIA" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=INCIDENCIA&amp;tipo2={1}&amp;tipoEco={2}&amp;title={3}" 
                    DataTextField="CASOS" HeaderText="PATRONES" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="CASOS" 
                    Target="_blank" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    NullDisplayText="0" ReadOnly="True" SortExpression="COTIZANTES" />
                <asp:BoundField DataField="OMISION" DataFormatString="{0:C}" 
                    HeaderText="OMISION" ReadOnly="True" SortExpression="OMISION" 
                    NullDisplayText="0" />
                <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                    ReadOnly="True" SortExpression="MULTA" NullDisplayText="0" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" 
                CssClass="btn-info" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
            <asp:Chart ID="Chart1" runat="server" 
                DataSourceID="SqlDataSourceResumenGeneral" BackColor="Transparent" 
                BackImageTransparentColor="Transparent" Height="450px" Width="700px">
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="INCIDENCIA" 
                        YValueMembers="CASOS" 
                        CustomProperties="PieDrawingStyle=Concave, PieLabelStyle=Disabled" 
                        Font="Calibri, 10pt" IsValueShownAsLabel="True" Label="#PERCENT{P}" 
                        Legend="Legend1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                        <Area3DStyle Enable3D="True" />
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Alignment="Center" Font="Calibri, 10pt" InterlacedRows="True" 
                        IsTextAutoFit="False" Name="Legend1">
                        <CellColumns>
                            <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="color">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Name="nombre" Text="#VALX">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Name="porcentaje">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Name="cantidad" Text="= #VAL">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                        </CellColumns>
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Font="Calibri, 12pt" Name="Title1" Text="Informe por Incidencia">
                    </asp:Title>
                    <asp:Title Font="Calibri, 11pt" Name="Title2">
                    </asp:Title>
                </Titles>
            </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSourceResumenGeneral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT eco.fechaEco,eco.tipoECO,eco.incidencia as incidenciav
,&quot;INCIDENCIA&quot; = case 
	when eco.incidencia is null then 'SIN TRABAJAR'
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
,SUM(COTIZ) as COTIZANTES,COUNT(*) AS CASOS,SUM(eco.OMISION) AS OMISION,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = ?
and eco.fechaEco = ?
and eco.tipoECO like ?+'%'
GROUP BY eco.incidencia,eco.fechaEco,eco.tipoECO
ORDER BY 5">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
            <asp:Panel ID="PanelRendimientoInspector" runat="server">
            </asp:Panel>
    </asp:Panel> 
    <asp:GridView ID="GWNotificador" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" 
        Caption="Resultados por Notificador" 
        DataSourceID="SqlDataSourceResultadosPorNotificador" Font-Size="9pt" 
        ShowFooter="True" Visible="False" CssClass="table-condensed">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
            <asp:BoundField DataField="NOTIFICADOR" HeaderText="INSPECTOR" 
                SortExpression="NOTIFICADOR" FooterText="TOTAL:" />
            <asp:BoundField DataField="FACTURAS" HeaderText="PATRONES" ReadOnly="True" 
                SortExpression="FACTURAS" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=casos&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="FACTURAS" HeaderText="PATRONES" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="FACTURAS" 
                Target="_blank" DataTextFormatString="{0}" />
            <asp:BoundField DataField="SIN INCIDENCIA" HeaderText="SIN INCIDENCIA" 
                ReadOnly="True" SortExpression="SIN INCIDENCIA" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=sin_incidencia&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="SIN INCIDENCIA" HeaderText="SIN INCIDENCIA" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="SIN INCIDENCIA" 
                Target="_blank" />
            <asp:BoundField DataField="PAGADO" HeaderText="PAGADO" 
                ReadOnly="True" SortExpression="PAGADO" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=PAGADO&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="PAGADO" HeaderText="PAGADO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="PAGADO" 
                Target="_blank" />
            <asp:BoundField DataField="SP" HeaderText="SP" ReadOnly="True" 
                SortExpression="SP" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=SP&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="SP" HeaderText="SP" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="SP" 
                Target="_blank" />
            <asp:BoundField DataField="BD" HeaderText="BD" NullDisplayText="0" 
                ReadOnly="True" SortExpression="BD" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=BD&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="BD" HeaderText="BD" SortExpression="BD" Target="_blank" />
            <asp:BoundField DataField="DV" HeaderText="DV" 
                ReadOnly="True" SortExpression="DV" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=DV&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="DV" HeaderText="DV" Target="_blank" SortExpression="DV" />
            <asp:BoundField DataField="0" HeaderText="0" ReadOnly="True" 
                SortExpression="0" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=0&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="0" HeaderText="0" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="0" 
                Target="_blank" />
            <asp:BoundField DataField="1" HeaderText="CITATORIO" ReadOnly="True" 
                SortExpression="1" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=1&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="1" HeaderText="CITATORIO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="1" 
                Target="_blank" />
            <asp:BoundField DataField="3" 
                HeaderText="EN ACLARACION" ReadOnly="True" SortExpression="3" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=3&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="3" HeaderText="EN ACLARACION" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="3" 
                Target="_blank" />
            <asp:BoundField DataField="4" 
                HeaderText="PAE" ReadOnly="True" 
                SortExpression="4" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=4&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="4" HeaderText="PAE" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="4" 
                Target="_blank" />
            <asp:BoundField DataField="5" 
                HeaderText="5" ReadOnly="True" 
                SortExpression="5" />
            <asp:BoundField DataField="6" HeaderText="6" ReadOnly="True" 
                SortExpression="6" />
            <asp:BoundField DataField="7" HeaderText="7" ReadOnly="True" 
                SortExpression="7" />
            <asp:BoundField DataField="8" HeaderText="8" ReadOnly="True" 
                SortExpression="8" />
            <asp:BoundField DataField="10" HeaderText="10" ReadOnly="True" 
                SortExpression="10" />
            <asp:BoundField DataField="11" HeaderText="11" ReadOnly="True" 
                SortExpression="11" />
            <asp:BoundField DataField="12" HeaderText="12" ReadOnly="True" 
                SortExpression="12" />
            <asp:BoundField DataField="13" HeaderText="13" ReadOnly="True" 
                SortExpression="13" />
            <asp:BoundField DataField="14" HeaderText="14" ReadOnly="True" 
                SortExpression="14" />
            <asp:BoundField DataField="15" HeaderText="15" ReadOnly="True" 
                SortExpression="15" />
            <asp:BoundField DataField="16" HeaderText="16" ReadOnly="True" 
                SortExpression="16" />
            <asp:BoundField DataField="17" HeaderText="CONVENIO" ReadOnly="True" 
                SortExpression="17" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=17&amp;sireca={1}" 
                DataTextField="17" HeaderText="CONVENIO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="17" 
                Target="_blank" />
            <asp:BoundField DataField="31" HeaderText="31" ReadOnly="True" 
                SortExpression="31" />
            <asp:BoundField DataField="32" HeaderText="32" ReadOnly="True" 
                SortExpression="32" />
            <asp:BoundField DataField="33" HeaderText="33" ReadOnly="True" 
                SortExpression="33" />
            <asp:BoundField DataField="34" HeaderText="34" ReadOnly="True" 
                SortExpression="34" />
            <asp:BoundField DataField="35" HeaderText="35" ReadOnly="True" 
                SortExpression="35" />
            <asp:BoundField DataField="36" HeaderText="36" ReadOnly="True" 
                SortExpression="36" />
            <asp:BoundField DataField="37" HeaderText="37" ReadOnly="True" 
                SortExpression="37" />
            <asp:BoundField DataField="38" HeaderText="38" ReadOnly="True" 
                SortExpression="38" />
            <asp:BoundField DataField="39" HeaderText="39" ReadOnly="True" 
                SortExpression="39" />
            <asp:BoundField DataField="40" HeaderText="40" ReadOnly="True" 
                SortExpression="40" />
            <asp:BoundField DataField="41" HeaderText="41" ReadOnly="True" 
                SortExpression="41" />
            <asp:BoundField DataField="42" HeaderText="42" ReadOnly="True" 
                SortExpression="42" />
            <asp:BoundField DataField="51" HeaderText="51" ReadOnly="True" 
                SortExpression="51" />
            <asp:BoundField DataField="52" HeaderText="52" ReadOnly="True" 
                SortExpression="52" />
            <asp:BoundField DataField="53" HeaderText="53" ReadOnly="True" 
                SortExpression="53" />
            <asp:BoundField DataField="54" HeaderText="54" ReadOnly="True" 
                SortExpression="54" />
            <asp:BoundField DataField="55" HeaderText="55" ReadOnly="True" 
                SortExpression="55" />
            <asp:BoundField DataField="60" HeaderText="60" ReadOnly="True" 
                SortExpression="60" />
            <asp:BoundField DataField="61" HeaderText="61" ReadOnly="True" 
                SortExpression="61" />
            <asp:BoundField DataField="EM" HeaderText="EM" ReadOnly="True" 
                SortExpression="EM" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=EM&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="EM" HeaderText="EM" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="EM" 
                Target="_blank" />
            <asp:BoundField DataField="EI" HeaderText="EI" ReadOnly="True" 
                SortExpression="EI" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=EI&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="EI" HeaderText="EI" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="EI" 
                Target="_blank" />
            <asp:BoundField DataField="EC" HeaderText="EC" ReadOnly="True" 
                SortExpression="EC" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=EC&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="EC" HeaderText="EC" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="EC" 
                Target="_blank" />
            <asp:BoundField DataField="NOTIFICADO" HeaderText="NOTIFICADO" ReadOnly="True" 
                SortExpression="NOTIFICADO" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=2&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="NOTIFICADO" HeaderText="NOTIFICADO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="NOTIFICADO" 
                Target="_blank" />
            <asp:BoundField DataField="$NOTIFICADO" DataFormatString="{0:C}" HeaderText="$" 
                NullDisplayText="0" ReadOnly="True" SortExpression="$NOTIFICADO" />
            <asp:BoundField DataField="NOLOCALIZADO" HeaderText="NOLOCALIZADO" 
                ReadOnly="True" SortExpression="NOLOCALIZADO" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=9&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="NOLOCALIZADO" HeaderText="NOLOCALIZADO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="NOLOCALIZADO" 
                Target="_blank" />
            <asp:BoundField DataField="$NOLOCALIZADO" DataFormatString="{0:C}" 
                HeaderText="$" NullDisplayText="0" ReadOnly="True" 
                SortExpression="$NOLOCALIZADO" />
            <asp:BoundField DataField="AUTODETERMINADO" HeaderText="AUTODETERMINADO" 
                ReadOnly="True" SortExpression="AUTODETERMINADO" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=A&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="AUTODETERMINADO" HeaderText="AUTODETERMINADO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" 
                SortExpression="AUTODETERMINADO" Target="_blank" />
            <asp:BoundField DataField="AUTODETERMINADO1" DataFormatString="{0:C}" 
                HeaderText="$" NullDisplayText="0" ReadOnly="True" 
                SortExpression="AUTODETERMINADO1" />
            <asp:BoundField DataField="RECAUDACION EXTRACTORA" 
                HeaderText="RECAUDACION EXACTORA" ReadOnly="True" 
                SortExpression="RECAUDACION EXTRACTORA">
            <HeaderStyle BackColor="#99CC00" />
            <ItemStyle ForeColor="#99CC00" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=RE&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="RECAUDACION EXTRACTORA" HeaderText="RECAUDACION EXACTORA" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" 
                SortExpression="RECAUDACION EXTRACTORA" Target="_blank" />
            <asp:BoundField DataField="$RECAUDACION EXTRACTORA" DataFormatString="{0:C}" 
                HeaderText="$" NullDisplayText="0" ReadOnly="True" 
                SortExpression="$RECAUDACION EXTRACTORA">
            <HeaderStyle BackColor="#99CC00" />
            <ItemStyle ForeColor="#99CC00" />
            </asp:BoundField>
            <asp:BoundField DataField="POR PROCESAR" HeaderText="POR PROCESAR" 
                ReadOnly="True" SortExpression="POR PROCESAR">
            <HeaderStyle BackColor="#CC9900" />
            <ItemStyle ForeColor="#CC9900" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,iduser,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;tipo=NOT&amp;tipo2=POR PROCESAR&amp;sireca={1}&amp;tipoEco={2}" 
                DataTextField="POR PROCESAR" HeaderText="POR PROCESAR" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="POR PROCESAR" 
                Target="_blank" />
            <asp:BoundField DataField="$POR PROCESAR" DataFormatString="{0:C}" 
                HeaderText="$" NullDisplayText="0" ReadOnly="True" SortExpression="$">
            <HeaderStyle BackColor="#CC9900" />
            <ItemStyle ForeColor="#CC9900" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#FF9966" ForeColor="White" Font-Bold="True" 
            Font-Size="10pt" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
            CssClass="btn-info" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle Font-Bold="True" BorderColor="#FF3300" BorderStyle="Solid" 
            BorderWidth="2px" Font-Size="10pt" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceResultadosPorNotificador" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
        SelectCommand="DECLARE @FECHAINICIO AS VARCHAR(11) 
DECLARE @FECHAFIN AS VARCHAR(11)
DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
DECLARE @TIPOECO AS VARCHAR(50)
SET @FECHAINICIO = ?
SET @FECHAFIN = ?
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPOECO = ?
SELECT eco.fechaEco AS fechaEco,eco.tipoEco as tipoEco,eco.responsable as iduser

, (SELECT usf.nombre FROM fiscamovil.dbo.Usuarios AS usf 
WHERE (usf.id = eco.responsable)) AS NOTIFICADOR

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND eco2.tipoEco like @TIPOECO+'%') AS FACTURAS

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia IS NULL) AND eco2.tipoEco like @TIPOECO+'%') AS [SIN INCIDENCIA]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'PAGADO' OR eco2.incidencia = 'C') AND eco2.tipoEco like @TIPOECO+'%') AS PAGADO

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'SP') AND eco2.tipoEco like @TIPOECO+'%') AS SP

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'DV') AND eco2.tipoEco like @TIPOECO+'%') AS DV

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '0') AND eco2.tipoEco like @TIPOECO+'%') AS [0]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '1') AND eco2.tipoEco like @TIPOECO+'%') AS [1]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'BD') AND eco2.tipoEco like @TIPOECO+'%') AS [BD]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'EM') AND eco2.tipoEco like @TIPOECO+'%') AS [EM]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'EI') AND eco2.tipoEco like @TIPOECO+'%') AS [EI]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'EC') AND eco2.tipoEco like @TIPOECO+'%') AS [EC]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '3') AND eco2.tipoEco like @TIPOECO+'%') AS [3]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '4') AND eco2.tipoEco like @TIPOECO+'%') AS [4]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '5') AND eco2.tipoEco like @TIPOECO+'%') AS [5]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '6') AND eco2.tipoEco like @TIPOECO+'%') AS [6]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '7') AND eco2.tipoEco like @TIPOECO+'%') AS [7]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '8') AND eco2.tipoEco like @TIPOECO+'%') AS [8]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '10') AND eco2.tipoEco like @TIPOECO+'%') AS [10]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '11') AND eco2.tipoEco like @TIPOECO+'%') AS [11]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '12') AND eco2.tipoEco like @TIPOECO+'%') AS [12]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '13') AND eco2.tipoEco like @TIPOECO+'%') AS [13]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '14') AND eco2.tipoEco like @TIPOECO+'%') AS [14]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '15') AND eco2.tipoEco like @TIPOECO+'%') AS [15]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '16') AND eco2.tipoEco like @TIPOECO+'%') AS [16]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '17') AND eco2.tipoEco like @TIPOECO+'%') AS [17]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '31') AND eco2.tipoEco like @TIPOECO+'%') AS [31]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '32') AND eco2.tipoEco like @TIPOECO+'%') AS [32]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '33') AND eco2.tipoEco like @TIPOECO+'%') AS [33]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '34') AND eco2.tipoEco like @TIPOECO+'%') AS [34]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '35') AND eco2.tipoEco like @TIPOECO+'%') AS [35]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '36') AND eco2.tipoEco like @TIPOECO+'%') AS [36]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '37') AND eco2.tipoEco like @TIPOECO+'%') AS [37]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '38') AND eco2.tipoEco like @TIPOECO+'%') AS [38]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '39') AND eco2.tipoEco like @TIPOECO+'%') AS [39]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '40') AND eco2.tipoEco like @TIPOECO+'%') AS [40]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '41') AND eco2.tipoEco like @TIPOECO+'%') AS [41]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '42') AND eco2.tipoEco like @TIPOECO+'%') AS [42]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '51') AND eco2.tipoEco like @TIPOECO+'%') AS [51]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '52') AND eco2.tipoEco like @TIPOECO+'%') AS [52]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '53') AND eco2.tipoEco like @TIPOECO+'%') AS [53]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '54') AND eco2.tipoEco like @TIPOECO+'%') AS [54]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '55') AND eco2.tipoEco like @TIPOECO+'%') AS [55]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '60') AND eco2.tipoEco like @TIPOECO+'%') AS [60]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '61') AND eco2.tipoEco like @TIPOECO+'%') AS [61]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '2') AND eco2.tipoEco like @TIPOECO+'%') AS NOTIFICADO

, (SELECT SUM(eco2.TOTAL) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '2') AND eco2.tipoEco like @TIPOECO+'%') AS [$NOTIFICADO]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '9') AND eco2.tipoEco like @TIPOECO+'%') AS NOLOCALIZADO

, (SELECT SUM(eco2.TOTAL) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = '9') AND eco2.tipoEco like @TIPOECO+'%') AS [$NOLOCALIZADO]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'A') AND eco2.tipoEco like @TIPOECO+'%') AS AUTODETERMINADO

, (SELECT SUM(eco2.TOTAL) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'A') AND eco2.tipoEco like @TIPOECO+'%') AS AUTODETERMINADO

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'RE') AND eco2.tipoEco like @TIPOECO+'%') AS [RECAUDACION EXTRACTORA]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'RE') AND eco2.tipoEco like @TIPOECO+'%') AS [$RECAUDACION EXTRACTORA]

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'POR PROCESAR') AND eco2.tipoEco like @TIPOECO+'%') AS [POR PROCESAR]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE   (eco2.responsable = eco.responsable) 
AND (fechaSeleccion BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.incidencia = 'POR PROCESAR') AND eco2.tipoEco like @TIPOECO+'%') AS [$POR PROCESAR] 

FROM sireca.dbo.eco AS eco 
WHERE  (eco.responsable IS NOT NULL) AND (eco.subdel = @SUBDEL) AND (eco.fechaEco = @PERIODO) and eco.tipoEco like @TIPOECO+'%'
GROUP BY eco.fechaEco,eco.tipoEco,eco.responsable 
ORDER BY 2">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL1" DefaultValue="2012-05-24" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDL2" DefaultValue="2012-05-24" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
            <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="0000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="0000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GWSectores" runat="server" 
        AutoGenerateColumns="False" BorderColor="#CCCCCC" 
        BorderWidth="1px" CellPadding="3" 
        DataSourceID="SqlDataSourceResultadosPorSector" Font-Size="9pt" 
        Font-Strikeout="False" GridLines="Vertical" ShowFooter="True" Visible="False" 
            EmptyDataText="Sin Asignacion" CssClass="table-condensed">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                SortExpression="SECTOR" FooterText="TOTAL:" NullDisplayText="0" />
            <asp:BoundField DataField="ASIGNADAS" HeaderText="PATRONES" ReadOnly="True" 
                SortExpression="ASIGNADAS" NullDisplayText="0" >
            <FooterStyle ForeColor="#FFFF99" />
            <HeaderStyle BackColor="#336600" />
            <ItemStyle ForeColor="#336600" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=asignadas&amp;tipoEco={2}" 
                DataTextField="ASIGNADAS" HeaderText="PATRONES" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="ASIGNADAS" 
                Target="_blank" />
            <asp:BoundField DataField="SIN INCIDENCIA" HeaderText="PENDIENTES" ReadOnly="True" 
                SortExpression="SIN INCIDENCIA" NullDisplayText="0" >
            </asp:BoundField>
            <asp:HyperLinkField DataTextField="SIN INCIDENCIA" HeaderText="PENDIENTES" 
                SortExpression="SIN INCIDENCIA" Target="_blank" 
                DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=sin_incidencia&amp;tipoEco={2}" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" />
            <asp:BoundField DataField="PAGADO" HeaderText="PAGADO" ReadOnly="True" 
                SortExpression="PAGADO" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=PAGADO&amp;tipoEco={2}" 
                DataTextField="PAGADO" HeaderText="PAGADO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="PAGADO" 
                Target="_blank" />
            <asp:BoundField DataField="SP" HeaderText="SP" ReadOnly="True" 
                SortExpression="SP" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=SP&amp;tipoEco={2}" 
                DataTextField="SP" HeaderText="SP" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="SP" 
                Target="_blank" />
            <asp:BoundField DataField="BD" HeaderText="BD" NullDisplayText="0" 
                ReadOnly="True" SortExpression="BD" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=BD&amp;tipoEco={2}" 
                DataTextField="BD" HeaderText="BD" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="BD" 
                Target="_blank" />
            <asp:BoundField DataField="DV" HeaderText="DV" ReadOnly="True" 
                SortExpression="DV" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=DV&amp;tipoEco={2}" 
                DataTextField="DV" HeaderText="DV" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="DV" 
                Target="_blank" />
            <asp:BoundField DataField="0" HeaderText="0" ReadOnly="True" 
                SortExpression="0" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=0&amp;tipoEco={2}" 
                DataTextField="0" HeaderText="0" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="0" 
                Target="_blank" />
            <asp:BoundField DataField="1" HeaderText="1" ReadOnly="True" 
                SortExpression="1" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=1&amp;tipoEco={2}" 
                DataTextField="1" HeaderText="1" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="1" 
                Target="_blank" />
            <asp:BoundField DataField="3" HeaderText="3" ReadOnly="True" 
                SortExpression="3" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=3&amp;tipoEco={2}" 
                DataTextField="3" HeaderText="3" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="3" 
                Target="_blank" />
            <asp:BoundField DataField="4" HeaderText="PAE" ReadOnly="True" 
                SortExpression="4" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=4&amp;tipoEco{2}" 
                DataTextField="4" HeaderText="PAE" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="4" 
                Target="_blank" />
            <asp:BoundField DataField="5" HeaderText="5" ReadOnly="True" 
                SortExpression="5" />
            <asp:BoundField DataField="6" HeaderText="6" ReadOnly="True" 
                SortExpression="6" />
            <asp:BoundField DataField="7" HeaderText="7" ReadOnly="True" 
                SortExpression="7" />
            <asp:BoundField DataField="8" HeaderText="8" ReadOnly="True" 
                SortExpression="8" />
            <asp:BoundField DataField="10" HeaderText="10" ReadOnly="True" 
                SortExpression="10" />
            <asp:BoundField DataField="11" HeaderText="11" ReadOnly="True" 
                SortExpression="11" />
            <asp:BoundField DataField="12" HeaderText="12" ReadOnly="True" 
                SortExpression="12" />
            <asp:BoundField DataField="13" HeaderText="13" ReadOnly="True" 
                SortExpression="13" />
            <asp:BoundField DataField="14" HeaderText="14" ReadOnly="True" 
                SortExpression="14" />
            <asp:BoundField DataField="15" HeaderText="15" ReadOnly="True" 
                SortExpression="15" />
            <asp:BoundField DataField="16" HeaderText="16" ReadOnly="True" 
                SortExpression="16" />
            <asp:BoundField DataField="17" HeaderText="17" ReadOnly="True" 
                SortExpression="17" />
            <asp:BoundField DataField="31" HeaderText="31" ReadOnly="True" 
                SortExpression="31" />
            <asp:BoundField DataField="32" HeaderText="32" ReadOnly="True" 
                SortExpression="32" />
            <asp:BoundField DataField="33" HeaderText="33" ReadOnly="True" 
                SortExpression="33" />
            <asp:BoundField DataField="34" HeaderText="34" ReadOnly="True" 
                SortExpression="34" />
            <asp:BoundField DataField="35" HeaderText="35" ReadOnly="True" 
                SortExpression="35" />
            <asp:BoundField DataField="36" HeaderText="36" ReadOnly="True" 
                SortExpression="36" />
            <asp:BoundField DataField="37" HeaderText="37" ReadOnly="True" 
                SortExpression="37" />
            <asp:BoundField DataField="38" HeaderText="38" ReadOnly="True" 
                SortExpression="38" />
            <asp:BoundField DataField="39" HeaderText="39" ReadOnly="True" 
                SortExpression="39" />
            <asp:BoundField DataField="40" HeaderText="40" ReadOnly="True" 
                SortExpression="40" />
            <asp:BoundField DataField="41" HeaderText="41" ReadOnly="True" 
                SortExpression="41" />
            <asp:BoundField DataField="42" HeaderText="42" ReadOnly="True" 
                SortExpression="42" />
            <asp:BoundField DataField="51" HeaderText="51" ReadOnly="True" 
                SortExpression="51" />
            <asp:BoundField DataField="52" HeaderText="52" ReadOnly="True" 
                SortExpression="52" />
            <asp:BoundField DataField="53" HeaderText="53" ReadOnly="True" 
                SortExpression="53" />
            <asp:BoundField DataField="54" HeaderText="54" ReadOnly="True" 
                SortExpression="54" />
            <asp:BoundField DataField="55" HeaderText="55" ReadOnly="True" 
                SortExpression="55" />
            <asp:BoundField DataField="60" HeaderText="60" ReadOnly="True" 
                SortExpression="60" />
            <asp:BoundField DataField="61" HeaderText="61" ReadOnly="True" 
                SortExpression="61" />
            <asp:BoundField DataField="NOTIFICADO" HeaderText="NOTIFICADO" ReadOnly="True" 
                SortExpression="NOTIFICADO" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=2&amp;tipoEco={2}" 
                DataTextField="NOTIFICADO" HeaderText="NOTIFICADO" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="NOTIFICADO" 
                Target="_blank" />
            <asp:BoundField DataField="$NOTIFICADO" HeaderText="$" 
                ReadOnly="True" SortExpression="$NOTIFICADO" DataFormatString="{0:C}" 
                NullDisplayText="0" />
            <asp:BoundField DataField="NO LOCALIZADOS" HeaderText="NO LOCALIZADOS" 
                ReadOnly="True" SortExpression="NO LOCALIZADOS" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=9&amp;tipoEco={2}" 
                DataTextField="NO LOCALIZADOS" HeaderText="NO LOCALIZADOS" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="NO LOCALIZADOS" 
                Target="_blank" />
            <asp:BoundField DataField="$NO LOCALIZADOS" HeaderText="$" 
                ReadOnly="True" SortExpression="$NO LOCALIZADOS" DataFormatString="{0:C}" 
                NullDisplayText="0" />
            <asp:BoundField DataField="AUTODETERMINADOS" HeaderText="AUTODETERMINADOS" 
                ReadOnly="True" SortExpression="AUTODETERMINADOS" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=A&amp;tipoEco={2}" 
                DataTextField="AUTODETERMINADOS" HeaderText="AUTODETERMINADOS" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" 
                SortExpression="AUTODETERMINADOS" Target="_blank" />
            <asp:BoundField DataField="$AUTODETERMINADOS" HeaderText="$" 
                ReadOnly="True" SortExpression="$AUTODETERMINADOS" 
                DataFormatString="{0:C}" NullDisplayText="0" />
            <asp:BoundField DataField="RECAUDACION EXTRACTORA" 
                HeaderText="RECAUDACION EXACTORA" ReadOnly="True" 
                SortExpression="RECAUDACION EXTRACTORA" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=RE&amp;tipoEco={2}" 
                DataTextField="RECAUDACION EXTRACTORA" HeaderText="RECAUDACION EXACTORA" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" 
                SortExpression="RECAUDACION EXTRACTORA" Target="_blank" />
            <asp:BoundField DataField="$RECAUDACION EXTRACTORA" 
                HeaderText="$" ReadOnly="True" 
                SortExpression="$RECAUDACION EXTRACTORA" DataFormatString="{0:C}" 
                NullDisplayText="0" />
            <asp:BoundField DataField="POR PROCESAR" HeaderText="POR PROCESAR" 
                ReadOnly="True" SortExpression="POR PROCESAR" />
            <asp:HyperLinkField DataNavigateUrlFields="fechaEco,SECTOR,tipoEco" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?periodo={0}&amp;sector={1}&amp;tipo=POR PROCESAR&amp;tipoEco={2}" 
                DataTextField="POR PROCESAR" HeaderText="POR PROCESAR" 
                NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="POR PROCESAR" 
                Target="_blank" />
            <asp:BoundField DataField="$PAGADOS_PROCESAR" HeaderText="$" 
                ReadOnly="True" SortExpression="$PAGADOS_PROCESAR" 
                DataFormatString="{0:C}" NullDisplayText="0" />
        </Columns>
        <FooterStyle BackColor="#FF6600" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" 
            CssClass="btn-info" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="Black" />
        <SelectedRowStyle BorderColor="Red" BorderStyle="Solid" BorderWidth="2px" 
            Font-Bold="True" Font-Size="10pt" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceResultadosPorSector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
DECLARE @TIPOECO AS VARCHAR(50)
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPOECO = ?

SELECT eco.fechaEco,eco.tipoEco as tipoEco,convert(int,eco.[sector]) as SECTOR
,&quot;ASIGNADAS&quot;=
(select count(*)
from sireca .dbo.eco as eco2  
where  eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%')
,&quot;SIN INCIDENCIA&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  and eco2.incidencia is null AND eco2.tipoEco like @TIPOECO+'%') 
,&quot;PAGADO&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='PAGADO') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;SP&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='SP') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;DV&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='DV') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;0&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='0') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;1&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='1') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;BD&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='BD') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )

,&quot;3&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='3') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;4&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='4') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;5&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='5') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;6&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='6') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;7&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='7') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;8&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='8') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )

,&quot;10&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='10') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;11&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='11') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;12&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='12') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;13&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='13') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;14&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='14') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;15&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='15') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;16&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='16') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;17&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='17') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;31&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='31') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;32&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='32') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;33&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='33') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;34&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='34') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;35&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='35') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;36&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='36') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;37&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='37') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;38&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='38') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;39&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='39') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;40&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='40') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;41&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='41') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;42&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='42') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;51&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='51') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;52&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='52') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;53&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='53') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;54&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='54') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;55&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='55') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;60&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='60') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;61&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='61') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
,&quot;NOTIFICADO&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='2') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
,&quot;$NOTIFICADO&quot;=
(select SUM(eco2.TOTAL )  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='2') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;NO LOCALIZADOS&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='9') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
,&quot;$NO LOCALIZADOS&quot;=
(select SUM(eco2.TOTAL )  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='9') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;AUTODETERMINADOS&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='A') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
,&quot;$AUTODETERMINADOS&quot;=
(select SUM(eco2.TOTAL )  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='A') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
 
,&quot;RECAUDACION EXTRACTORA&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='RE') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
,&quot;$RECAUDACION EXTRACTORA&quot;=
(select SUM(eco2.OMISION )
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='RE') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )

,&quot;POR PROCESAR&quot;=
(select count(*)  
from sireca .dbo.eco as eco2  
where  (eco2.incidencia ='POR PROCESAR') AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
,&quot;$PAGADOS_PROCESAR&quot;=
(select SUM(eco2.OMISION)
from sireca .dbo.eco as eco2  
where  eco2.incidencia ='POR PROCESAR' AND eco2.sector =eco.sector AND eco2.fechaEco=@PERIODO AND eco2.subdel=@SUBDEL  AND eco2.tipoEco like @TIPOECO+'%' )
FROM
[sireca].[dbo].[eco] as eco
WHERE
eco.subdel =@SUBDEL
AND eco.fechaEco = @PERIODO
AND eco.tipoEco like @TIPOECO+'%'
GROUP BY eco.fechaEco,eco.tipoECO , eco.sector
ORDER BY SECTOR ASC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="0000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Panel>
    </asp:Content>



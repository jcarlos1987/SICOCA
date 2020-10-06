<%@ Page Language="vb"  MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="Ciclo1.aspx.vb" Inherits="WebSIRECA.Ciclo1" MaintainScrollPositionOnPostback="True" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content id="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Panel ID="PanelPrincipal" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
<div class="btn-group input-prepend">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True" Width="100px">
                            </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label4" runat="server" Text="REPORTE:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLReporte" runat="server" AutoPostBack="True" 
                                Width="120px">
                                <asp:ListItem Value="0">GENERAL</asp:ListItem>
                                <asp:ListItem Value="1">POR FIGURA</asp:ListItem>
                            </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px">
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
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" data-toggle="dropdown" 
                                AutoPostBack="True" Width="80px">
                            </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label8" runat="server" Text="TIPO DE EMISION:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLTipoEmision" runat="server" AutoPostBack="True" 
                                Width="140px">
                                <asp:ListItem Value="1">TODOS</asp:ListItem>
                                <asp:ListItem Value="2">C.O.P.</asp:ListItem>
                                <asp:ListItem Value="3">C.O.P. EST.</asp:ListItem>
                                <asp:ListItem Value="4">C.O.P. COMP.</asp:ListItem>
                                <asp:ListItem Value="5">R.C.V.</asp:ListItem>
                                <asp:ListItem Value="6">R.C.V. EST.</asp:ListItem>
                                <asp:ListItem Value="7">R.C.V. COMP.</asp:ListItem>
                            </asp:DropDownList>

    <asp:LinkButton ID="BActualizarRGeneral" CssClass="btn" runat="server" BorderColor="#5D7BAC" 
                                BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>

</div>
                        </td>
                        <td>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100">
                                <ProgressTemplate>
<div class="progress progress-success progress-striped active">
  <div class="bar" style="width: 70%">CARGANDO...</div>
</div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table border="0" style="width:100%; background-color: #99CB99;" 
                            cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:MultiView ID="MultiViewReportes" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="ViewRGeneral" runat="server">
                                            <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="4" BackColor="#F7F6F3" 
                                                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                Font-Names="Verdana" Font-Size="0.8em" Height="100%" Width="100%" 
                                                FinishCompleteButtonText="">
                                                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                                                    Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                                                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                                                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                                    ForeColor="#284775" />
                                                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                                                <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
                                                    VerticalAlign="Top" Width="100px" />
                                                <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                                                <WizardSteps>
                                                    <asp:WizardStep ID="WizardStep1" runat="server" Title="GENERAL">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td style="vertical-align: top; text-align: left">

<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label10" runat="server" Text="FILTRO POR:"></asp:Label>
</span> 
<asp:DropDownList ID="DDLForaneo2" runat="server" Width="120px" AutoPostBack="True">
        <asp:ListItem Value="T">TODOS</asp:ListItem>
        <asp:ListItem Value="S">FORANEO</asp:ListItem>
        <asp:ListItem Value="SF">CIUDAD</asp:ListItem>
    </asp:DropDownList>
<asp:DropDownList ID="DDLRuta2" runat="server" Width="120px" 
        DataSourceID="SqlDataSourceRutas2" DataTextField="TEXTO" 
        DataValueField="VALOR" AutoPostBack="True" 
        ToolTip="SOLO APLICA PARA EL FILTRO FORANEO">
    <asp:ListItem Value="0">TODOS</asp:ListItem>
    </asp:DropDownList>
    <asp:LinkButton ID="IBMunicipio2" runat="server" CssClass="btn dropdown-toggle" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px" ToolTip ="MUNICIPIOS DE LA RUTA SELECIONADA">&nbsp;<i class="icon-road"></i>&nbsp;</asp:LinkButton> 
    <asp:LinkButton ID="LBForaneo2" CssClass="btn" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
    <asp:SqlDataSource ID="SqlDataSourceRutas2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ruta] AS VALOR
,'RUTA '+CONVERT(VARCHAR(2),[ruta]) as TEXTO
FROM [sireca].[dbo].[foraneo]
GROUP BY [ruta]"></asp:SqlDataSource>
</div> 
<asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="IBMunicipio2" PopupControlID="PanelMunicipio2" DropShadow="true" CancelControlID="LBCerrarMunicipio2" ></asp:ModalPopupExtender>   
<asp:Panel ID="PanelMunicipio2" runat="server" BackColor="#EAA32D" Height="260px" Width="680px" Font-Size="11pt" CssClass="btn-danger">
	<asp:Panel ID="PanelHeaderMunicipio2" runat="server" HorizontalAlign="Right" Font-Strikeout="False" Font-Underline="False">
	<asp:LinkButton ID="LBCerrarMunicipio2" runat="server" Font-Underline="False" 
            ForeColor="White">cerrar&nbsp;&nbsp;</asp:LinkButton>
	</asp:Panel>
    <hr/>
<center><h4>MUNICIPIOS</h4></center>
<asp:Panel ID="Panel11" runat="server" Width="670px" Height ="150" 
        HorizontalAlign="Center" ScrollBars="Auto">
<asp:Repeater ID="RepeaterMunicipios2" runat="server" DataSourceID="SqlDataSourceMunicipios2">
<ItemTemplate>
        <asp:Label ID="Label9" runat="server" Text='<%# Eval("municipio") & ", " %>'></asp:Label>
</ItemTemplate>
</asp:Repeater>
</asp:Panel>
<asp:SqlDataSource ID="SqlDataSourceMunicipios2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RUTA as VARCHAR(2)
SET @RUTA=?
if @RUTA='0'
begin
	SELECT [municipio]
    FROM [sireca].[dbo].[foraneo]
    ORDER BY [orden]
end
else
begin
    SELECT [municipio]
    FROM [sireca].[dbo].[foraneo]
    WHERE convert(varchar(5),[ruta]) = @RUTA
    ORDER BY [orden]
end
">
<SelectParameters>
    <asp:ControlParameter ControlID="DDLRuta2" DefaultValue="0" Name="?" 
        PropertyName="SelectedValue" />
</SelectParameters>
</asp:SqlDataSource>

</asp:Panel>
<asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" Enabled="True" Radius="15" TargetControlID="PanelMunicipio2"></asp:RoundedCornersExtender>
                                                                    <asp:GridView ID="GVRGPorPatron" runat="server" AutoGenerateColumns="False" 
                                                                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Caption="POR PERIODO" 
                                                                        CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                                                                        DataSourceID="SqlDataSourceRGPPatron" EmptyDataText="SIN RESULTADOS">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO" />
                                                                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRGPPatron" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
DECLARE @FORANEO as varchar(15)
DECLARE @RUTA as varchar(15)
DECLARE @ADD_FORANEO as varchar(500)
DECLARE @ADD_RUTA AS VARCHAR(50)
SET @SUBDEL=?
SET @MES = ?
SET @ANIO=?
SET @TIPO_ECO=?
SET @FORANEO=? --FORANEO S=FORANEO, SF=SIN FORANEOS, X=TODOS
SET @RUTA=? --RUTA FORANEA 0=TODAS LAS RUTAS
SET @PERIODO=@MES+@ANIO
--------------------------------RUTA FORANEA
SET @ADD_RUTA=''
if @RUTA&lt;&gt;'0'
begin
	SET @ADD_RUTA = ' and [ruta]='+@RUTA
END
--------------------------------/RUTA FORANEA
--------------------------------FORANEO
SET @ADD_FORANEO=''
if @FORANEO='S'
begin
	SET @ADD_FORANEO=' and exists(SELECT [ruta] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3) '+@ADD_RUTA+')'
end
else
begin 
	if @FORANEO='SF'
	begin
		SET @ADD_FORANEO=' and not exists(SELECT [ruta],[claveForaneo] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3))'
	end
end
--------------------------------/FORANEO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case when '+@TIPO+' then ''TODOS'' end) ' --TODOS
when '2' then ' (case when '+@TIPO+' then ''C.O.P.'' end) ' --COP
when '3' then ' (case when '+@TIPO+' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case when '+@TIPO+' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case when '+@TIPO+' then ''R.C.V.'' end) ' --RCV
when '6' then ' (case when '+@TIPO+' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case when '+@TIPO+' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO+' '+@ADD_FORANEO+' group by '+@ADD_COLUM
exec(
'SELECT 
'''+@MES+'/'+@ANIO+''' as PERIODO
,'+@ADD_COLUM+' as TIPO
,count(distinct([REG#PATRONAL])) as PATRONES
,count(CREDITO) as CREDITOS
,sum(COTIZ) as COTIZANTES
,sum([OMISION]) as IMPORTE
FROM [sireca].[dbo].[eco]
where fechaEco='''+@PERIODO+''' and subdel='''+@SUBDEL+'''' + @ADD_WHERE +'')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLForaneo2" DefaultValue="X" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLRuta2" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRGeneral" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
DECLARE @FORANEO as varchar(15)
DECLARE @RUTA as varchar(15)
DECLARE @ADD_FORANEO as varchar(500)
DECLARE @ADD_RUTA AS VARCHAR(50)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @FORANEO=? --FORANEO S=FORANEO, SF=SIN FORANEOS, X=TODOS
SET @RUTA=? --RUTA FORANEA 0=TODAS LAS RUTAS
SET @PERIODO=@MES+@ANIO
--------------------------------RUTA FORANEA
SET @ADD_RUTA=''
if @RUTA&lt;&gt;'0'
begin
	SET @ADD_RUTA = ' and [ruta]='+@RUTA
END
--------------------------------/RUTA FORANEA
--------------------------------FORANEO
SET @ADD_FORANEO=''
if @FORANEO='S'
begin
	SET @ADD_FORANEO=' and exists(SELECT [ruta] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3) '+@ADD_RUTA+')'
end
else
begin 
	if @FORANEO='SF'
	begin
		SET @ADD_FORANEO=' and not exists(SELECT [ruta],[claveForaneo] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3))'
	end
end
--------------------------------/FORANEO
select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO+' '+@ADD_FORANEO+' group by tipoEco'
exec(
'SELECT 
'+@ADD_COLUM+' as TIPO
,count(distinct([REG#PATRONAL])) as PATRONES
,count(CREDITO) as CREDITOS
,sum(COTIZ) as COTIZANTES
,sum([OMISION]) as IMPORTE
FROM [sireca].[dbo].[eco]
where fechaEco='''+@PERIODO+''' and subdel='''+@SUBDEL+'''' + @ADD_WHERE +'')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLForaneo2" DefaultValue="X" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLRuta2" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:GridView ID="GVRGeneral" runat="server" AutoGenerateColumns="False" 
                                                                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" 
                                                                        CellSpacing="1" DataSourceID="SqlDataSourceRGeneral" AllowSorting="True" 
                                                                        Caption="POR TIPO" CaptionAlign="Left" ShowFooter="True" 
                                                                        EmptyDataText="SIN RESULTADOS">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                SortExpression="TIPO"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                </td>
                                                                <td>
                                                                    <asp:Chart ID="Chart1" runat="server" BackColor="Transparent" 
                                                                        DataSourceID="SqlDataSourceRGeneral" Width="600px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                CustomProperties="PieDrawingStyle=SoftEdge" Label="#PERCENT" Legend="Legend1" 
                                                                                Name="Series1" XValueMember="TIPO" YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="40"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Name="Column1" 
                                                                                        Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX" Alignment="MiddleLeft"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends><Titles><asp:Title Name="Title1"></asp:Title></Titles><BorderSkin BackColor="Transparent" /></asp:Chart>
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
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep2" runat="server" Title="GRUPOS">
                                                    <asp:Panel ID="Panel2" runat="server" Height="450px" ScrollBars="Auto" 
                                                            Width="100%">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td style="vertical-align: top; text-align: left">

<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="FILTRO POR:"></asp:Label>
</span> 
<asp:DropDownList ID="DDLForaneo" runat="server" Width="120px" AutoPostBack="True">
        <asp:ListItem Value="T">TODOS</asp:ListItem>
        <asp:ListItem Value="S">FORANEO</asp:ListItem>
        <asp:ListItem Value="SF">CIUDAD</asp:ListItem>
    </asp:DropDownList>
<asp:DropDownList ID="DDLRuta" runat="server" Width="120px" 
        DataSourceID="SqlDataSourceRutas" DataTextField="TEXTO" 
        DataValueField="VALOR" AutoPostBack="True" 
        ToolTip="SOLO APLICA PARA EL FILTRO FORANEO">
    <asp:ListItem Value="0">TODOS</asp:ListItem>
    </asp:DropDownList>
    <asp:LinkButton ID="IBMunicipio" runat="server" CssClass="btn dropdown-toggle" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px" ToolTip ="MUNICIPIOS DE LA RUTA SELECIONADA">&nbsp;<i class="icon-road"></i>&nbsp;</asp:LinkButton> 
    <asp:LinkButton ID="LBForaneo" CssClass="btn" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
    

    <asp:SqlDataSource ID="SqlDataSourceRutas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ruta] AS VALOR
,'RUTA '+CONVERT(VARCHAR(2),[ruta]) as TEXTO
FROM [sireca].[dbo].[foraneo]
GROUP BY [ruta]"></asp:SqlDataSource>
</div> 
<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="IBMunicipio" PopupControlID="PanelMunicipio" DropShadow="true" CancelControlID="LBCerrarMunicipio" ></asp:ModalPopupExtender>   
<asp:Panel ID="PanelMunicipio" runat="server" BackColor="#EAA32D" Height="260px" Width="680px" Font-Size="11pt" CssClass="btn-danger">
	<asp:Panel ID="PanelHeaderMunicipio" runat="server" HorizontalAlign="Right" Font-Strikeout="False" Font-Underline="False">
	<asp:LinkButton ID="LBCerrarMunicipio" runat="server" Font-Underline="False" 
            ForeColor="White">cerrar&nbsp;&nbsp;</asp:LinkButton>
	</asp:Panel>
    <hr/>
<center><h4>MUNICIPIOS</h4></center>
<asp:Panel ID="Panel10" runat="server" Width="670px" Height ="150" 
        HorizontalAlign="Center" ScrollBars="Auto">
<asp:Repeater ID="RepeaterMunicipios" runat="server" DataSourceID="SqlDataSourceMunicipios">
<ItemTemplate>
        <asp:Label ID="Label9" runat="server" Text='<%# Eval("municipio") & ", " %>'></asp:Label>
</ItemTemplate>
</asp:Repeater>
</asp:Panel>
<asp:SqlDataSource ID="SqlDataSourceMunicipios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RUTA as VARCHAR(2)
SET @RUTA=?
if @RUTA='0'
begin
	SELECT [municipio]
    FROM [sireca].[dbo].[foraneo]
    ORDER BY [orden]
end
else
begin
    SELECT [municipio]
    FROM [sireca].[dbo].[foraneo]
    WHERE convert(varchar(5),[ruta]) = @RUTA
    ORDER BY [orden]
end
">
<SelectParameters>
    <asp:ControlParameter ControlID="DDLRuta" DefaultValue="0" Name="?" 
        PropertyName="SelectedValue" />
</SelectParameters>
</asp:SqlDataSource>

</asp:Panel>
<asp:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" Enabled="True" Radius="15" TargetControlID="PanelMunicipio"></asp:RoundedCornersExtender>
                                                                    <asp:GridView ID="GVGIncidencias" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                        BorderWidth="1px" Caption="POR GRUPO DE INCIDENCIA" CaptionAlign="Left" CellPadding="1" 
                                                                        CellSpacing="1" DataSourceID="SqlDataSourceGIncidencias" ShowFooter="True" 
                                                                        EmptyDataText="SIN RESULTADOS">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                                                                SortExpression="INCIDENCIA"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:HyperLinkField DataNavigateUrlFields="URLV" 
                                                                                DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/Default.aspx{0}" 
                                                                                DataTextField="PATRONES" DataTextFormatString="{0:N0}" HeaderText="PATRONES" 
                                                                                SortExpression="PATRONES" Target="_blank">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:HyperLinkField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGIncidencias" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
DECLARE @FORANEO as varchar(15)
DECLARE @RUTA as varchar(15)
DECLARE @ADD_FORANEO as varchar(500)
DECLARE @ADD_RUTA AS VARCHAR(50)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @FORANEO=? --FORANEO S=FORANEO, SF=SIN FORANEOS, X=TODOS
SET @RUTA=? --RUTA FORANEA 0=TODAS LAS RUTAS
SET @PERIODO=@MES+@ANIO
--------------------------------RUTA FORANEA
SET @ADD_RUTA=''
if @RUTA&lt;&gt;'0'
begin
	SET @ADD_RUTA = ' and [ruta]='+@RUTA
END
--------------------------------/RUTA FORANEA
--------------------------------FORANEO
SET @ADD_FORANEO=''
if @FORANEO='S'
begin
	SET @ADD_FORANEO=' and exists(SELECT [ruta] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3) '+@ADD_RUTA+')'
end
else
begin 
	if @FORANEO='SF'
	begin
		SET @ADD_FORANEO=' and not exists(SELECT [ruta] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3))'
	end
end
--------------------------------/FORANEO
select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT
(''?mes='+@MES+'&amp;conforaneo=s&amp;foraneo='+@FORANEO+'&amp;ruta='+@RUTA+'&amp;anio='+@ANIO+'&amp;subdel='+@SUBDEL+'&amp;tipo_eco='+@TIPO_ECO+'&amp;tipo_file=ALL&amp;incidencia=''
+(
CASE 
		WHEN eco.responsable is null and eco.incidencia in (''POR PROCESAR'') THEN ''DEPURADO''
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGADO''
		WHEN eco.incidencia=''9'' THEN ''NO LOCALIZADOS''
		WHEN eco.incidencia=''BD'' THEN ''BAJA DEFINITIVA''
		WHEN eco.incidencia=''RE'' THEN ''PAGADO''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''PAGADO''
		WHEN eco.incidencia=''SIPARE'' THEN ''PAGADO''
		WHEN eco.incidenciarale in (''01'',''02'',''31'') THEN ''SALDO''
		WHEN eco.incidenciarale in (''32'') THEN ''POR COBRAR''
		WHEN eco.incidenciarale in (''09'') THEN ''NO LOCALIZADOS''
		WHEN eco.incidenciarale in (''05'',''52'') THEN ''CONVENIO''
		WHEN eco.incidenciarale in (''06'',''14'',''15'') THEN ''JUICIO''
		WHEN eco.incidenciarale in (''13'',''19'') THEN ''PROC. COBRO''
		WHEN eco.incidenciarale in (''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'') THEN ''EMBARGO''
		WHEN eco.incidenciarale in (''43'') THEN ''EMB. DE CUENTAS''
	ELSE ''POR COBRAR''
	END
)) as URLV

,('''+@MES+'/'+@ANIO+''') as PERIODO
,(
CASE 
		WHEN eco.responsable is null and eco.incidencia in (''POR PROCESAR'') THEN ''DEPURADO''
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGADO''
		WHEN eco.incidencia=''9'' THEN ''NO LOCALIZADOS''
		WHEN eco.incidencia=''BD'' THEN ''BAJA DEFINITIVA''
		WHEN eco.incidencia=''RE'' THEN ''PAGADO''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''PAGADO''
		WHEN eco.incidencia=''SIPARE'' THEN ''PAGADO''
		WHEN eco.incidenciarale in (''01'',''02'',''31'') THEN ''SALDO''
		WHEN eco.incidenciarale in (''32'') THEN ''POR COBRAR''
		WHEN eco.incidenciarale in (''09'') THEN ''NO LOCALIZADOS''
		WHEN eco.incidenciarale in (''05'',''52'') THEN ''CONVENIO''
		WHEN eco.incidenciarale in (''06'',''14'',''15'') THEN ''JUICIO''
		WHEN eco.incidenciarale in (''13'',''19'') THEN ''PROC. COBRO''
		WHEN eco.incidenciarale in (''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'') THEN ''EMBARGO''
		WHEN eco.incidenciarale in (''43'') THEN ''EMB. DE CUENTAS''
	ELSE ''POR COBRAR''
	END
) as INCIDENCIA
,count(distinct(eco.REG#PATRONAL)) as PATRONES,count(eco.CREDITO) as CREDITOS,SUM(eco.COTIZ) as COTIZANTES,SUM(eco.OMISION) as IMPORTE,SUM(eco.MULTA) as MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.fechaEco = '''+@PERIODO+''' '+@ADD_WHERE+' '+@ADD_FORANEO+'
GROUP BY eco.fechaEco,(
CASE 
		WHEN eco.responsable is null and eco.incidencia in (''POR PROCESAR'') THEN ''DEPURADO''
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGADO''
		WHEN eco.incidencia=''9'' THEN ''NO LOCALIZADOS''
		WHEN eco.incidencia=''BD'' THEN ''BAJA DEFINITIVA''
		WHEN eco.incidencia=''RE'' THEN ''PAGADO''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''PAGADO''		
		WHEN eco.incidencia=''SIPARE'' THEN ''PAGADO''
		WHEN eco.incidenciarale in (''01'',''02'',''31'') THEN ''SALDO''
		WHEN eco.incidenciarale in (''32'') THEN ''POR COBRAR''
		WHEN eco.incidenciarale in (''09'') THEN ''NO LOCALIZADOS''
		WHEN eco.incidenciarale in (''05'',''52'') THEN ''CONVENIO''
		WHEN eco.incidenciarale in (''06'',''14'',''15'') THEN ''JUICIO''
		WHEN eco.incidenciarale in (''13'',''19'') THEN ''PROC. COBRO''
		WHEN eco.incidenciarale in (''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'') THEN ''EMBARGO''
		WHEN eco.incidenciarale in (''43'') THEN ''EMB. DE CUENTAS''
	ELSE ''POR COBRAR''
	END
)
ORDER BY INCIDENCIA
')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter DefaultValue="X" Name="?" ControlID="DDLForaneo" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLRuta" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    <asp:Chart ID="Chart6" runat="server" BackColor="Transparent" 
                                                                        DataSourceID="SqlDataSourceGIncidencias" Width="600px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                CustomProperties="PieDrawingStyle=SoftEdge" Label="#PERCENT" Legend="Legend1" 
                                                                                Name="Series1" XValueMember="INCIDENCIA" YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="40"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1" 
                                                                                        Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends><Titles><asp:Title Name="Title1"></asp:Title></Titles><BorderSkin BackColor="Transparent" /></asp:Chart>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRGGrupIncidencia" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
DECLARE @FORANEO as varchar(15)
DECLARE @RUTA as varchar(15)
DECLARE @ADD_FORANEO as varchar(500)
DECLARE @ADD_RUTA AS VARCHAR(50)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @FORANEO=? --FORANEO S=FORANEO, SF=SIN FORANEOS, X=TODOS
SET @RUTA=? --RUTA FORANEA 0=TODAS LAS RUTAS
SET @PERIODO=@MES+@ANIO
--------------------------------RUTA FORANEA
SET @ADD_RUTA=''
if @RUTA&lt;&gt;'0'
begin
	SET @ADD_RUTA = ' and [ruta]='+@RUTA
END
--------------------------------/RUTA FORANEA
--------------------------------FORANEO
SET @ADD_FORANEO=''
if @FORANEO='S'
begin
	SET @ADD_FORANEO=' and exists(SELECT [ruta] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3) '+@ADD_RUTA+')'
end
else
begin 
	if @FORANEO='SF'
	begin
		SET @ADD_FORANEO=' and not exists(SELECT [ruta],[claveForaneo] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3))'
	end
end
--------------------------------/FORANEO
select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT 
(''?mes='+@MES+'&amp;anio='+@ANIO+'&amp;subdel='+@SUBDEL+'&amp;tipo_eco='+@TIPO_ECO+'&amp;tipo_file=''+eco.tipoEco+''&amp;incidencia=''
+(
CASE 
		WHEN eco.responsable is null and eco.incidencia in (''POR PROCESAR'') THEN ''DEPURADO''
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGADO''
		WHEN eco.incidencia=''9'' THEN ''NO LOCALIZADOS''
		WHEN eco.incidencia=''BD'' THEN ''BAJA DEFINITIVA''
		WHEN eco.incidencia=''RE'' THEN ''PAGADO''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''PAGADO''
		WHEN eco.incidencia=''SIPARE'' THEN ''PAGADO''
		WHEN eco.incidenciarale in (''01'',''02'',''31'') THEN ''SALDO''
		WHEN eco.incidenciarale in (''32'') THEN ''POR COBRAR''
		WHEN eco.incidenciarale in (''09'') THEN ''NO LOCALIZADOS''
		WHEN eco.incidenciarale in (''05'',''52'') THEN ''CONVENIO''
		WHEN eco.incidenciarale in (''06'',''14'',''15'') THEN ''JUICIO''
		WHEN eco.incidenciarale in (''13'',''19'') THEN ''PROC. COBRO''
		WHEN eco.incidenciarale in (''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'') THEN ''EMBARGO''
		WHEN eco.incidenciarale in (''43'') THEN ''EMB. DE CUENTAS''
	ELSE ''POR COBRAR''
	END
)) as URLV
,(
CASE 
		WHEN eco.responsable is null and eco.incidencia in (''POR PROCESAR'') THEN ''DEPURADO''
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGADO''
		WHEN eco.incidencia=''9'' THEN ''NO LOCALIZADOS''
		WHEN eco.incidencia=''BD'' THEN ''BAJA DEFINITIVA''
		WHEN eco.incidencia=''RE'' THEN ''PAGADO''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''PAGADO''
		WHEN eco.incidencia=''SIPARE'' THEN ''PAGADO''
		WHEN eco.incidenciarale in (''01'',''02'',''31'') THEN ''SALDO''
		WHEN eco.incidenciarale in (''32'') THEN ''POR COBRAR''
		WHEN eco.incidenciarale in (''09'') THEN ''NO LOCALIZADOS''
		WHEN eco.incidenciarale in (''05'',''52'') THEN ''CONVENIO''
		WHEN eco.incidenciarale in (''06'',''14'',''15'') THEN ''JUICIO''
		WHEN eco.incidenciarale in (''13'',''19'') THEN ''PROC. COBRO''
		WHEN eco.incidenciarale in (''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'') THEN ''EMBARGO''
		WHEN eco.incidenciarale in (''43'') THEN ''EMB. DE CUENTAS''
	ELSE ''POR COBRAR''
	END
) as INCIDENCIA
,count(distinct(eco.REG#PATRONAL)) as PATRONES,count(eco.CREDITO) as CREDITOS,SUM(eco.COTIZ) as COTIZANTES,SUM(eco.OMISION) as IMPORTE,SUM(eco.MULTA) as MULTA,eco.fechaEco as PERIODO,'+@ADD_COLUM+' as TIPO
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+''' 
and eco.fechaEco = '''+@PERIODO+''' '+@ADD_WHERE+' '+@ADD_FORANEO+'
GROUP BY eco.fechaEco,eco.tipoEco,(
CASE 
		WHEN eco.responsable is null and eco.incidencia in (''POR PROCESAR'') THEN ''DEPURADO''
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGADO''
		WHEN eco.incidencia=''9'' THEN ''NO LOCALIZADOS''
		WHEN eco.incidencia=''BD'' THEN ''BAJA DEFINITIVA''
		WHEN eco.incidencia=''RE'' THEN ''PAGADO''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''PAGADO''
		WHEN eco.incidencia=''SIPARE'' THEN ''PAGADO''
		WHEN eco.incidenciarale in (''01'',''02'',''31'') THEN ''SALDO''
		WHEN eco.incidenciarale in (''32'') THEN ''POR COBRAR''
		WHEN eco.incidenciarale in (''09'') THEN ''NO LOCALIZADOS''
		WHEN eco.incidenciarale in (''05'',''52'') THEN ''CONVENIO''
		WHEN eco.incidenciarale in (''06'',''14'',''15'') THEN ''JUICIO''
		WHEN eco.incidenciarale in (''13'',''19'') THEN ''PROC. COBRO''
		WHEN eco.incidenciarale in (''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'') THEN ''EMBARGO''
		WHEN eco.incidenciarale in (''43'') THEN ''EMB. DE CUENTAS''
	ELSE ''POR COBRAR''
	END
)
ORDER BY TIPO,INCIDENCIA
')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2001" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLForaneo" DefaultValue="X" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLRuta" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:GridView ID="GVRGGrupoIncidencia" runat="server" 
                                                                        AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                        BorderWidth="1px" CellPadding="1" CellSpacing="1" 
                                                                        DataSourceID="SqlDataSourceRGGrupIncidencia" AllowSorting="True" 
                                                                        Caption="POR TIPO Y GRUPO DE INCIDENCIA" CaptionAlign="Left" 
                                                                        ShowFooter="True" EmptyDataText="SIN RESULTADOS">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                SortExpression="TIPO" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                                                                SortExpression="INCIDENCIA" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:HyperLinkField DataNavigateUrlFields="URLV" 
                                                                                DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/Default.aspx{0}" 
                                                                                DataTextField="PATRONES" DataTextFormatString="{0:N0}" HeaderText="PATRONES" 
                                                                                NavigateUrl="~/areaemision/detallesdeseleccion/grupos/Default.aspx" 
                                                                                SortExpression="PATRONES" Target="_blank"><ItemStyle HorizontalAlign="Right" /></asp:HyperLinkField>
                                                                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                                                                SortExpression="CREDITOS" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                                                                SortExpression="COTIZANTES" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                                                                SortExpression="IMPORTE" DataFormatString="{0:C}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                </td>
                                                                <td>
                                                                    <asp:Chart ID="Chart4" runat="server" BackColor="Transparent" 
                                                                        DataSourceID="SqlDataSourceRGGrupIncidencia" Width="600px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                CustomProperties="PieDrawingStyle=SoftEdge" Label="#PERCENT" Legend="Legend1" 
                                                                                Name="Series1" XValueMember="TIPO" YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="40"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Name="Column1" 
                                                                                        Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX" Alignment="MiddleLeft"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends><Titles><asp:Title Name="Title1"></asp:Title></Titles><BorderSkin BackColor="Transparent" /></asp:Chart>
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
                                                        </asp:Panel> 
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep3" runat="server" Title="INCIDENCIAS">
                                                        <asp:Panel ID="Panel1" runat="server" Height="400px" ScrollBars="Auto" 
                                                            Width="100%">
                                                        
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GVRIncidencia" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                        Caption="POR INCIDENCIA" CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                                                                        DataSourceID="SqlDataSourceRIncidencias" ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                                                                SortExpression="INCIDENCIA" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:HyperLinkField DataNavigateUrlFields="URLV" 
                                                                                DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/DefaultInc.aspx{0}" 
                                                                                DataTextField="PATRONES" DataTextFormatString="{0:N0}" HeaderText="PATRONES" 
                                                                                SortExpression="PATRONES" Target="_blank" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:HyperLinkField>
                                                                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                                                                SortExpression="CREDITOS" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                                                                SortExpression="COTIZANTES" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                                                                SortExpression="IMPORTE" DataFormatString="{0:C}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRIncidencias" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO
select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT
(''?mes='+@MES+'&amp;anio='+@ANIO+'&amp;subdel='+@SUBDEL+'&amp;tipo_eco='+@TIPO_ECO+'&amp;tipo_file=ALL&amp;incidencia=''
+(
CASE
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGOS_PARCIALES''
		WHEN eco.incidencia=''9'' THEN ''9''
		WHEN eco.incidencia=''A'' THEN ''A''
		WHEN eco.incidencia=''BD'' THEN ''BD''
		WHEN eco.incidencia=''RE'' THEN ''RE''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''POR PROCESAR''
		WHEN eco.incidencia=''SIPARE'' THEN ''SIPARE''
		WHEN eco.incidenciarale in (''31'') THEN ''31''
		WHEN eco.incidenciarale in (''32'') THEN ''32''		
		WHEN eco.incidenciarale in (''09'') THEN ''9''
		WHEN eco.incidenciarale in (''52'') THEN ''52''
		WHEN eco.incidenciarale in (''05'') THEN ''5''
		WHEN eco.incidenciarale in (''06'') THEN ''6''
		WHEN eco.incidenciarale in (''14'') THEN ''14''
		WHEN eco.incidenciarale in (''15'') THEN ''15''
		WHEN eco.incidenciarale in (''13'') THEN ''13''
		WHEN eco.incidenciarale in (''19'') THEN ''19''
		WHEN eco.incidenciarale in (''33'') THEN ''33''
		WHEN eco.incidenciarale in (''41'') THEN ''41''
		WHEN eco.incidenciarale in (''43'') THEN ''EC''
		WHEN eco.incidenciarale in (''27'') THEN ''A''		
		WHEN eco.incidencia=''2'' THEN ''2''	
		WHEN eco.incidenciarale in (''01'') THEN ''1''
		WHEN eco.incidenciarale in (''02'') THEN ''2''
		WHEN eco.incidencia is null and eco.incidenciarale is null and eco.validacion=''SIN PAGO'' THEN ''SAC''
		WHEN eco.incidencia is null and eco.incidenciarale is not null THEN eco.incidenciarale
		WHEN eco.incidencia is not null THEN eco.incidencia
	ELSE ''SAC''
	END
)) as URLV
,('''+@MES+'/'+@ANIO+''') as PERIODO
,&quot;INCIDENCIA&quot; = (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = 
(
CASE
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGOS_PARCIALES''
		WHEN eco.incidencia=''9'' THEN ''9''
		WHEN eco.incidencia=''A'' THEN ''A''
		WHEN eco.incidencia=''BD'' THEN ''BD''
		WHEN eco.incidencia=''RE'' THEN ''RE''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''POR PROCESAR''
		WHEN eco.incidencia=''SIPARE'' THEN ''SIPARE''
		WHEN eco.incidenciarale in (''31'') THEN ''31''
		WHEN eco.incidenciarale in (''32'') THEN ''32''		
		WHEN eco.incidenciarale in (''09'') THEN ''9''
		WHEN eco.incidenciarale in (''52'') THEN ''52''
		WHEN eco.incidenciarale in (''05'') THEN ''5''
		WHEN eco.incidenciarale in (''06'') THEN ''6''
		WHEN eco.incidenciarale in (''14'') THEN ''14''
		WHEN eco.incidenciarale in (''15'') THEN ''15''
		WHEN eco.incidenciarale in (''13'') THEN ''13''
		WHEN eco.incidenciarale in (''19'') THEN ''19''
		WHEN eco.incidenciarale in (''33'') THEN ''33''
		WHEN eco.incidenciarale in (''41'') THEN ''41''
		WHEN eco.incidenciarale in (''43'') THEN ''EC''
		WHEN eco.incidenciarale in (''27'') THEN ''A''		
		WHEN eco.incidencia=''2'' THEN ''2''	
		WHEN eco.incidenciarale in (''01'') THEN ''1''
		WHEN eco.incidenciarale in (''02'') THEN ''2''
		WHEN eco.incidencia is null and eco.incidenciarale is null and eco.validacion=''SIN PAGO'' THEN ''SAC''
		WHEN eco.incidencia is null and eco.incidenciarale is not null THEN eco.incidenciarale
		WHEN eco.incidencia is not null THEN eco.incidencia
	ELSE ''SAC''
	END
)
)
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.fechaEco = '''+@PERIODO+''' '+@ADD_WHERE+'
GROUP BY 
(
CASE 	
WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGOS_PARCIALES''
		WHEN eco.incidencia=''9'' THEN ''9''
		WHEN eco.incidencia=''A'' THEN ''A''
		WHEN eco.incidencia=''BD'' THEN ''BD''
		WHEN eco.incidencia=''RE'' THEN ''RE''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''POR PROCESAR''		
		WHEN eco.incidencia=''SIPARE'' THEN ''SIPARE''		
		WHEN eco.incidenciarale in (''31'') THEN ''31''
		WHEN eco.incidenciarale in (''32'') THEN ''32''		
		WHEN eco.incidenciarale in (''09'') THEN ''9''
		WHEN eco.incidenciarale in (''52'') THEN ''52''
		WHEN eco.incidenciarale in (''05'') THEN ''5''
		WHEN eco.incidenciarale in (''06'') THEN ''6''
		WHEN eco.incidenciarale in (''14'') THEN ''14''
		WHEN eco.incidenciarale in (''15'') THEN ''15''
		WHEN eco.incidenciarale in (''13'') THEN ''13''
		WHEN eco.incidenciarale in (''19'') THEN ''19''
		WHEN eco.incidenciarale in (''33'') THEN ''33''
		WHEN eco.incidenciarale in (''41'') THEN ''41''
		WHEN eco.incidenciarale in (''43'') THEN ''EC''
		WHEN eco.incidenciarale in (''27'') THEN ''A''
		WHEN eco.incidencia=''2'' THEN ''2''	
		WHEN eco.incidenciarale in (''01'') THEN ''1''
		WHEN eco.incidenciarale in (''02'') THEN ''2''
		WHEN eco.incidencia is null and eco.incidenciarale is null and eco.validacion=''SIN PAGO'' THEN ''SAC''
		WHEN eco.incidencia is null and eco.incidenciarale is not null THEN eco.incidenciarale
		WHEN eco.incidencia is not null THEN eco.incidencia
	ELSE ''SAC''
	END
)
ORDER BY INCIDENCIA
')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    <asp:Chart ID="Chart7" runat="server" BackColor="Transparent" 
                                                                        DataSourceID="SqlDataSourceRIncidencias" Width="600px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                CustomProperties="PieDrawingStyle=SoftEdge" Label="#PERCENT" Legend="Legend1" 
                                                                                Name="Series1" XValueMember="INCIDENCIA" YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1" 
                                                                                        Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends><Titles><asp:Title Name="Title1"></asp:Title></Titles><BorderSkin BackColor="Transparent" /></asp:Chart>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GVRGIncidencias" runat="server" AutoGenerateColumns="False" 
                                                                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" 
                                                                        CellSpacing="1" DataSourceID="SqlDataSourceRGIncidencias" 
                                                                        AllowSorting="True" Caption="POR TIPO Y INCIDENCIA" CaptionAlign="Left" 
                                                                        ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                SortExpression="TIPO" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                                                                SortExpression="INCIDENCIA" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                                                                SortExpression="PATRONES" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                                                                SortExpression="CREDITOS" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                                                                SortExpression="COTIZANTES" DataFormatString="{0:N0}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                                                                SortExpression="IMPORTE" DataFormatString="{0:C}" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRGIncidencias" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO
select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT '+@ADD_COLUM+' as TIPO
,&quot;INCIDENCIA&quot; = (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = 
(
CASE
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGOS_PARCIALES''
		WHEN eco.incidencia=''9'' THEN ''9''
		WHEN eco.incidencia=''A'' THEN ''A''
		WHEN eco.incidencia=''BD'' THEN ''BD''
		WHEN eco.incidencia=''RE'' THEN ''RE''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''POR PROCESAR''
		WHEN eco.incidencia=''SIPARE'' THEN ''SIPARE''
		WHEN eco.incidenciarale in (''01'') THEN ''1''
		WHEN eco.incidenciarale in (''02'') THEN ''2''
		WHEN eco.incidenciarale in (''31'') THEN ''31''
		WHEN eco.incidenciarale in (''32'') THEN ''32''		
		WHEN eco.incidenciarale in (''09'') THEN ''9''
		WHEN eco.incidenciarale in (''52'') THEN ''52''
		WHEN eco.incidenciarale in (''05'') THEN ''5''
		WHEN eco.incidenciarale in (''06'') THEN ''6''
		WHEN eco.incidenciarale in (''14'') THEN ''14''
		WHEN eco.incidenciarale in (''15'') THEN ''15''
		WHEN eco.incidenciarale in (''13'') THEN ''13''
		WHEN eco.incidenciarale in (''19'') THEN ''19''
		WHEN eco.incidenciarale in (''33'') THEN ''33''
		WHEN eco.incidenciarale in (''41'') THEN ''41''
		WHEN eco.incidenciarale in (''43'') THEN ''EC''
		WHEN eco.incidenciarale in (''27'') THEN ''A''		
		WHEN eco.incidencia is null and eco.incidenciarale is null and eco.validacion=''SIN PAGO'' THEN ''SAC''
		WHEN eco.incidencia is null and eco.incidenciarale is not null THEN eco.incidenciarale
		WHEN eco.incidencia is not null THEN eco.incidencia
	ELSE ''SAC''
	END
)
)
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.fechaEco = '''+@PERIODO+''' '+@ADD_WHERE+'
GROUP BY eco.tipoECO,
(
CASE
		WHEN eco.validacion=''DEPURADO RALE'' THEN ''PAGADO''
		WHEN eco.validacion like ''%COMPLETO'' THEN ''PAGADO''
		WHEN eco.validacion like ''%PARCIAL'' THEN ''PAGOS_PARCIALES''
		WHEN eco.incidencia=''9'' THEN ''9''
		WHEN eco.incidencia=''A'' THEN ''A''
		WHEN eco.incidencia=''BD'' THEN ''BD''
		WHEN eco.incidencia=''RE'' THEN ''RE''
		WHEN eco.incidencia=''PAGADO'' THEN ''PAGADO''
		WHEN eco.incidencia=''POR PROCESAR'' THEN ''POR PROCESAR''
		WHEN eco.incidencia=''SIPARE'' THEN ''SIPARE''
		WHEN eco.incidenciarale in (''01'') THEN ''1''
		WHEN eco.incidenciarale in (''02'') THEN ''2''
		WHEN eco.incidenciarale in (''31'') THEN ''31''
		WHEN eco.incidenciarale in (''32'') THEN ''32''		
		WHEN eco.incidenciarale in (''09'') THEN ''9''
		WHEN eco.incidenciarale in (''52'') THEN ''52''
		WHEN eco.incidenciarale in (''05'') THEN ''5''
		WHEN eco.incidenciarale in (''06'') THEN ''6''
		WHEN eco.incidenciarale in (''14'') THEN ''14''
		WHEN eco.incidenciarale in (''15'') THEN ''15''
		WHEN eco.incidenciarale in (''13'') THEN ''13''
		WHEN eco.incidenciarale in (''19'') THEN ''19''
		WHEN eco.incidenciarale in (''33'') THEN ''33''
		WHEN eco.incidenciarale in (''41'') THEN ''41''
		WHEN eco.incidenciarale in (''43'') THEN ''EC''
		WHEN eco.incidenciarale in (''27'') THEN ''A''		
		WHEN eco.incidencia is null and eco.incidenciarale is null and eco.validacion=''SIN PAGO'' THEN ''SAC''
		WHEN eco.incidencia is null and eco.incidenciarale is not null THEN eco.incidenciarale
		WHEN eco.incidencia is not null THEN eco.incidencia
	ELSE ''SAC''
	END
)
ORDER BY TIPO
')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    <asp:Chart ID="Chart5" runat="server" BackColor="Transparent" 
                                                                        DataSourceID="SqlDataSourceRGIncidencias" Width="600px" Height="600px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                CustomProperties="PieDrawingStyle=SoftEdge" Label="#PERCENT" Legend="Legend1" 
                                                                                Name="Series1" XValueMember="TIPO" YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="40"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1" 
                                                                                        Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends><Titles><asp:Title Name="Title1"></asp:Title></Titles><BorderSkin BackColor="Transparent" /></asp:Chart>
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
                                                        </asp:Panel>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep runat="server" Title="RECAUDACIÓN">
                                                        <asp:Panel ID="Panel4" runat="server" Height="450px">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GVRecaudacion" runat="server" 
                                                                        AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                        Caption="ESTADO DE LA META C.O.P. Y RECAUDACION R.C.V." 
                                                                        CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                                                                        DataSourceID="SqlDataSourceRecaudacion">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO" ><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:BoundField DataField="A_RECAUDAR_COP" HeaderText="A RECAU. C.O.P." 
                                                                                ReadOnly="True" SortExpression="A_RECAUDAR_COP" DataFormatString="{0:C}" 
                                                                                NullDisplayText="0" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="RECAUDACION_COP" HeaderText="RECAU. C.O.P." 
                                                                                ReadOnly="True" SortExpression="RECAUDACION_COP" DataFormatString="{0:C}" 
                                                                                NullDisplayText="0" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="META" HeaderText="META" ReadOnly="True" 
                                                                                SortExpression="META" DataFormatString="{0:C}" NullDisplayText="0" 
                                                                                Visible="False" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="DIFERENCIA_IMP_META" 
                                                                                HeaderText="DIF.META" ReadOnly="True" 
                                                                                SortExpression="DIFERENCIA_IMP_META" DataFormatString="{0:C}" 
                                                                                NullDisplayText="0" ><ItemStyle ForeColor="Red" HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="PATRONES_COP_PAGARON" 
                                                                                HeaderText="PAT.  PAG. C.O.P." ReadOnly="True" 
                                                                                SortExpression="PATRONES_COP_PAGARON" DataFormatString="{0:N0}" 
                                                                                NullDisplayText="0" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="TOTAL_PATRONES_COP" HeaderText="TOT.PAT." 
                                                                                ReadOnly="True" SortExpression="TOTAL_PATRONES_COP" 
                                                                                DataFormatString="{0:N0}" NullDisplayText="0" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="META_ALCANSADA" HeaderText="META ALCAN." 
                                                                                ReadOnly="True" SortExpression="META_ALCANSADA" ><ItemStyle Font-Bold="False" ForeColor="Red" HorizontalAlign="Center" /></asp:BoundField>
                                                                            <asp:BoundField DataField="A_RECAUDAR_RCV" HeaderText="A REC. R.C.V." 
                                                                                ReadOnly="True" SortExpression="A_RECAUDAR_RCV" DataFormatString="{0:C}" 
                                                                                NullDisplayText="0" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="RECAUDACION_RCV" HeaderText="RECAU. R.C.V." 
                                                                                ReadOnly="True" SortExpression="RECAUDACION_RCV" DataFormatString="{0:C}" 
                                                                                NullDisplayText="0" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRecaudacion" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PERIODO_ANIO as VARCHAR(4)
DECLARE @PERIODO_MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @PATRONES_COP as INT
DECLARE @IMP_RCV as FLOAT
DECLARE @IMP_DISPONIBLE_COP as FLOAT
DECLARE @PATRONES_DISPONIBLE_COP as INT
DECLARE @IMP_DISPONIBLE_RCV as FLOAT
SET @PERIODO_ANIO=?
SET @PERIODO_MES=?
SET @SUBDEL=?
SET @META_MES=(
SELECT ([meta]) as meta
FROM [sirecacobros].[dbo].[metas]
where mes=@PERIODO_MES and anio=@PERIODO_ANIO
and sub_del=@SUBDEL and [tipo_meta]='cobranza'
)
SET @IMP_COP=(
select sum(omision)
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and eco.tipoEco in ('COP','COMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @PATRONES_COP=(select count(distinct(reg#patronal))
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and eco.tipoEco in ('COP','COMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @IMP_RCV=(select sum(omision)
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and eco.tipoEco in ('RCV','RCVCOMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @IMP_DISPONIBLE_COP=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('COP','COMP')
)
SET @PATRONES_DISPONIBLE_COP=(select count(distinct([REG#PATRONAL])) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('COP','COMP')
)
SET @IMP_DISPONIBLE_RCV=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('RCV','RCVCOMP')
)
select 
(@PERIODO_MES+'/'+@PERIODO_ANIO) as PERIODO
,@IMP_DISPONIBLE_COP as A_RECAUDAR_COP
,@IMP_COP as RECAUDACION_COP
,@META_MES as META
,(@IMP_COP-@IMP_DISPONIBLE_COP) as DIFERENCIA_IMP_META
,@PATRONES_COP as PATRONES_COP_PAGARON
,@PATRONES_DISPONIBLE_COP as TOTAL_PATRONES_COP
,(case when @IMP_COP&gt;=@IMP_DISPONIBLE_COP then 'SI' else 'NO' end) as META_ALCANSADA
,@IMP_DISPONIBLE_RCV as A_RECAUDAR_RCV
,@IMP_RCV as RECAUDACION_RCV
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Chart ID="Chart10" runat="server" DataSourceID="SqlDataSourceRecaudacion" 
                                                                        BackColor="Transparent" Width="750px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                                                Name="Recaudado" XValueMember="PERIODO" YValueMembers="RECAUDACION_COP"></asp:Series><asp:Series ChartArea="ChartArea1" Name="Total" XValueMember="PERIODO" 
                                                                                YValueMembers="A_RECAUDAR_COP" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=Cylinder" Label="#VAL{C}" Legend="Legend1"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1" BackColor="White"><AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                                                    LineColor="Silver"><MajorGrid LineDashStyle="Dot" /></AxisY><AxisX><MajorGrid LineDashStyle="NotSet" /></AxisX></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                        </asp:Panel>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep runat="server" Title="PENDIENTES">
                                                        <asp:Panel ID="Panel8" runat="server" ScrollBars="Auto">
                                                            <table style="width:100%;">
                                                                <tr>
                                                                    <td>
<div class="btn-group input-prepend">
<span class="add-on">
  <asp:Label ID="Label23" runat="server" Text="CUATRIMESTRE:"></asp:Label>
</span> 
                                                                        <asp:DropDownList ID="DDLCuatriTotal" runat="server" AutoPostBack="True" 
                                                                            
        DataSourceID="SqlDataSourceCuatriTotal" DataTextField="texto" 
                                                                            
        DataValueField="valor" Width="100px">
                                                                        </asp:DropDownList>
                                                                        <asp:SqlDataSource ID="SqlDataSourceCuatriTotal" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select 
substring(convert(varchar(10),cuatrimestre_num),1,4)+'('+substring(convert(varchar(10),cuatrimestre_num),5,1)+')' as texto
,cuatrimestre_num as valor
from sireca.dbo.eco
where
subdel=?
and cuatrimestre_ciclo=1
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by cuatrimestre_num
">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        <asp:DropDownList ID="DDLEco" runat="server" AutoPostBack="True" 
                                                                            
        Width="100px">
                                                                            <asp:ListItem Value="%">TODO</asp:ListItem>
                                                                            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                                                                            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                                                                        </asp:DropDownList>
<span class="add-on">
                                                                        <asp:CheckBox ID="CBDel" runat="server" Text="Ver Delegacional" 
                                                                            AutoPostBack="True" 
                                                                            ToolTip="Seleccione para ver el reporte Delegacional" 
                                                                            CssClass="checkbox inline" />
</span> 
</div>
                                                                        <asp:HiddenField ID="HiddenFieldDel" runat="server" />
                                                                        <br /><br /><br />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridViewRCuatriOri" runat="server" 
                                                                            AutoGenerateColumns="False" 
                                                                            Caption="&lt;strong&gt;CUATRIMESTRE INICIAL&lt;/strong&gt;" 
                                                                            DataSourceID="SqlDataSourceRCuatriOri" ShowFooter="True" 
                                                                            CaptionAlign="Left">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="SUBDEL_NOM" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                    SortExpression="SUBDEL_NOM" />
                                                                                <asp:BoundField DataField="PERIODO_NOM" HeaderText="PERIODO" ReadOnly="True" 
                                                                                    SortExpression="PERIODO_NOM" />
                                                                                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataFormatString="{0:P}" 
                                                                                    HeaderText="%CREDITO" DataField="T_CREDITO" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataFormatString="{0:P}" 
                                                                                    HeaderText="%COTIZANTE" DataField="T_COTIZ" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataFormatString="{0:P}" 
                                                                                    HeaderText="%IMPORTE" DataField="T_IMPORTE" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                            </Columns>
                                                                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                                                            <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" />
                                                                        </asp:GridView>
                                                                        <asp:SqlDataSource ID="SqlDataSourceRCuatriOri" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
DECLARE @CUATRIMESTRE as VARCHAR(6)
DECLARE @CUATRIMESTRE_DEL as VARCHAR(6)
DECLARE @TOTAL_CREDITO as FLOAT
DECLARE @TOTAL_IMPORTE as FLOAT
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @CUATRIMESTRE=?
SET @CUATRIMESTRE_DEL=?
if @CUATRIMESTRE_DEL='%'
begin
SET @SUBDEL='%'
end
SET @TOTAL_CREDITO=(
select count(credito)
from sireca.dbo.eco 
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by cuatrimestre_num
)
SET @TOTAL_IMPORTE=(
select sum(omision)
from sireca.dbo.eco 
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by cuatrimestre_num
)
select 
(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end) as SUBDEL_NOM
,@SUBDEL as SUBDEL
,(
case when len(fechaeco)=5 
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) 
end
)
 as PERIODO_NOM
,fechaeco as PERIODO
,count(distinct(reg#patronal)) as PATRONES
,count(credito) as CREDITOS,sum(cotiz) as COTIZANTES
,sum(omision) as IMPORTE
,1 AS T_CREDITO
,1 AS T_COTIZ
,1 AS T_IMPORTE
from sireca.dbo.eco 
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by fechaeco
">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLCuatriTotal" DefaultValue="0000" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="HiddenFieldDel" DefaultValue="subdel" Name="?" 
                                                                                    PropertyName="Value" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                    <td>
                                                                        <strong>ESTE REPORTE USAN LOS FILTROS:</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;-SUBDELEGACION<br />&nbsp;&nbsp;&nbsp;&nbsp;-E.C.O. 
                                                                    (C.O.P. / R.C.V.)<br />&nbsp;&nbsp;&nbsp;&nbsp;-CUATRIMESTRE<br /></td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridViewCuatriSaldo0" runat="server" 
                                                                            AutoGenerateColumns="False" 
                                                                            Caption="&lt;strong&gt;CUATRIMESTRE AVANCE&lt;/strong&gt;" 
                                                                            DataSourceID="SqlDataSourceCuatriSaldo0" ShowFooter="True" 
                                                                            CaptionAlign="Left">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="SUBDEL_NOM" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                    SortExpression="SUBDEL_NOM" />
                                                                                <asp:BoundField DataField="PERIODO_NOM" HeaderText="PERIODO" ReadOnly="True" 
                                                                                    SortExpression="PERIODO_NOM" />
                                                                                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                    <ItemTemplate>
                                                                                        <asp:HyperLink ID="HyperLink3" runat="server" 
                                                                                            Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                                                                                    </ItemTemplate>
                                                                                    <ControlStyle Font-Underline="False" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                    HeaderText="%CREDITO" SortExpression="T_CREDITO">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                    HeaderText="%COTIZANTE" SortExpression="T_COTIZ">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                    HeaderText="%IMPORTE" SortExpression="T_IMPORTE">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                            </Columns>
                                                                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                                                            <HeaderStyle BackColor="#FFE8A6" CssClass="btn-warning" />
                                                                        </asp:GridView>
                                                                        <asp:SqlDataSource ID="SqlDataSourceCuatriSaldo0" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                            
                                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
DECLARE @CUATRIMESTRE as VARCHAR(6)
DECLARE @CUATRIMESTRE_DEL as VARCHAR(6)

SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @CUATRIMESTRE=?
SET @CUATRIMESTRE_DEL=?

if @CUATRIMESTRE_DEL='%'
begin
SET @SUBDEL='%'
end

select 
(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end) as SUBDEL_NOM
,@SUBDEL as SUBDEL
,(
case when len(fechaeco)=5 
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) 
end
)
 as PERIODO_NOM
,fechaeco as PERIODO
,count(distinct(reg#patronal)) as PATRONES, count(credito) as CREDITOS,sum(cotiz) as COTIZANTES,sum(omision) as IMPORTE
,count(credito)/convert(float,(select count(credito)
from sireca.dbo.eco as cx
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_CREDITO
,sum(cotiz)/convert(float,(select sum(cx.cotiz)
from sireca.dbo.eco as cx
where cx.subdel like @SUBDEL
and cx.cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when cx.tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and cx.tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_COTIZ
,sum(omision)/convert(float,(select sum(cx.omision)
from sireca.dbo.eco as cx
where cx.subdel like @SUBDEL
and cx.cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when cx.tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and cx.tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_IMPORTE
,@TIPO_COP_RCV as TIPOECO
,@CUATRIMESTRE as CUATRIMESTRE
from sireca.dbo.eco as eco
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
and validacion not in ('SIN PAGO')
--and incidenciarale not in ('09','05','51','52','53','06','12','14','15','16','19','25','23','21','34','43')
--and (incidencia not in ('9','60') or incidencia is null)
group by fechaeco
">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLCuatriTotal" DefaultValue="22222" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="HiddenFieldDel" DefaultValue="subdel" Name="?" 
                                                                                    PropertyName="Value" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridViewCuatriSaldo" runat="server" 
                                                                            AutoGenerateColumns="False" 
                                                                            Caption="&lt;strong&gt;CUATRIMESTRE SALDO&lt;/strong&gt;" 
                                                                            DataSourceID="SqlDataSourceCuatriSaldo" ShowFooter="True" 
                                                                            CaptionAlign="Left">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="SUBDEL_NOM" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                    SortExpression="SUBDEL_NOM" />
                                                                                <asp:BoundField DataField="PERIODO_NOM" HeaderText="PERIODO" ReadOnly="True" 
                                                                                    SortExpression="PERIODO_NOM" />
                                                                                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                    <ItemTemplate>
                                                                                    <asp:LinkButton ID="LBCuatriSaldo" runat="server" Text='<%# Eval("PATRONES", "{0:N0}") %>' OnClick ='<%# "javascript:window.open(""../areacobros/seleccioncuatrimestre/saldo.aspx?periodo="  & Eval("PERIODO") & "&subdel=" & Eval("SUBDEL") & "&tipoeco=" & Eval("TIPOECO") & "&cuatrimestre=" & Eval("CUATRIMESTRE") +""",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ControlStyle Font-Underline="False" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                    HeaderText="%CREDITO" SortExpression="T_CREDITO" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                    HeaderText="%COTIZANTE" SortExpression="T_COTIZ" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                    HeaderText="%IMPORTE" SortExpression="T_IMPORTE" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                            </Columns>
                                                                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                                                            <HeaderStyle BackColor="#FFE8A6" CssClass="btn-warning" />
                                                                        </asp:GridView>
                                                                        <asp:SqlDataSource ID="SqlDataSourceCuatriSaldo" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
DECLARE @CUATRIMESTRE as VARCHAR(6)
DECLARE @CUATRIMESTRE_DEL as VARCHAR(6)
DECLARE @TOTAL_CREDITO as FLOAT
DECLARE @TOTAL_IMPORTE as FLOAT
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @CUATRIMESTRE=?
SET @CUATRIMESTRE_DEL=?
if @CUATRIMESTRE_DEL='%'
begin
SET @SUBDEL='%'
end

select 
(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end) as SUBDEL_NOM
,@SUBDEL as SUBDEL
,(
case when len(fechaeco)=5 
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) 
end
)
 as PERIODO_NOM
,fechaeco as PERIODO
,count(distinct(reg#patronal)) as PATRONES, count(credito) as CREDITOS,sum(cotiz) as COTIZANTES,sum(omision) as IMPORTE
,count(credito)/convert(float,(select count(credito)
from sireca.dbo.eco as cx
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_CREDITO
,sum(cotiz)/convert(float,(select sum(cx.cotiz)
from sireca.dbo.eco as cx
where cx.subdel like @SUBDEL
and cx.cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when cx.tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and cx.tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_COTIZ
,sum(omision)/convert(float,(select sum(cx.omision)
from sireca.dbo.eco as cx
where cx.subdel like @SUBDEL
and cx.cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when cx.tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and cx.tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_IMPORTE
,@TIPO_COP_RCV as TIPOECO
,@CUATRIMESTRE as CUATRIMESTRE
from sireca.dbo.eco as eco
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
and validacion='SIN PAGO'
and incidenciarale not in ('09','05','51','52','53','06','12','14','15','16','19','25','23','21','34','43')
--and (incidencia not in ('9','60') or incidencia is null)
group by fechaeco
">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLCuatriTotal" DefaultValue="22222" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="HiddenFieldDel" DefaultValue="subdel" Name="?" 
                                                                                    PropertyName="Value" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridViewCuatriSaldo1" runat="server" 
                                                                            AutoGenerateColumns="False" 
                                                                            Caption="&lt;strong&gt;CUATRIMESTRE IMPEDIMENTO DE COBRO&lt;/strong&gt;" 
                                                                            DataSourceID="SqlDataSourceCuatriImpediCobro" ShowFooter="True" 
                                                                            CaptionAlign="Left">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="SUBDEL_NOM" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                    SortExpression="SUBDEL_NOM" />
                                                                                <asp:BoundField DataField="PERIODO_NOM" HeaderText="PERIODO" ReadOnly="True" 
                                                                                    SortExpression="PERIODO_NOM" />
                                                                                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                    <ItemTemplate>
                                                                                    <asp:LinkButton ID="LBCuatriSaldo1" runat="server" Text='<%# Eval("PATRONES", "{0:N0}") %>' OnClick ='<%# "javascript:window.open(""../areacobros/seleccioncuatrimestre/saldoimpedimentodecobro.aspx?periodo=" & Eval("PERIODO") & "&subdel=" & Eval("SUBDEL") & "&tipoeco=" & Eval("TIPOECO") & "&cuatrimestre=" & Eval("CUATRIMESTRE") +""",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ControlStyle Font-Underline="False" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                    HeaderText="%CREDITO" SortExpression="T_CREDITO" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                    HeaderText="%COTIZANTE" SortExpression="T_COTIZ" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                    HeaderText="%IMPORTE" SortExpression="T_IMPORTE" >
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:BoundField>
                                                                            </Columns>
                                                                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                                                            <HeaderStyle BackColor="#FFE8A6" CssClass="btn-warning" />
                                                                        </asp:GridView>
                                                                        <asp:SqlDataSource ID="SqlDataSourceCuatriImpediCobro" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
DECLARE @CUATRIMESTRE as VARCHAR(6)
DECLARE @CUATRIMESTRE_DEL as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @CUATRIMESTRE=?
SET @CUATRIMESTRE_DEL=?
if @CUATRIMESTRE_DEL='%'
begin
SET @SUBDEL='%'
end

select 
(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end) as SUBDEL_NOM
,@SUBDEL as SUBDEL
,(
case when len(fechaeco)=5 
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) 
end
)
 as PERIODO_NOM
,fechaeco as PERIODO
,count(distinct(reg#patronal)) as PATRONES
,count(credito) as CREDITOS,sum(cotiz) as COTIZANTES
,sum(omision) as IMPORTE
,count(credito)/convert(float,(select count(credito)
from sireca.dbo.eco as cx
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_CREDITO
,sum(cotiz)/convert(float,(select sum(cx.cotiz)
from sireca.dbo.eco as cx
where cx.subdel like @SUBDEL
and cx.cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when cx.tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and cx.tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_COTIZ
,sum(omision)/convert(float,(select sum(cx.omision)
from sireca.dbo.eco as cx
where cx.subdel like @SUBDEL
and cx.cuatrimestre_num=@CUATRIMESTRE
and cx.fechaeco=eco.fechaeco
and (case when tipoeco in ('COP','COMP') then 'COP' when cx.tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and cx.tipoeco in ('COP','COMP','RCV','RCVCOMP')
)) AS T_IMPORTE
,@TIPO_COP_RCV as TIPOECO
,@CUATRIMESTRE as CUATRIMESTRE
from sireca.dbo.eco 
where subdel like @SUBDEL
and cuatrimestre_num=@CUATRIMESTRE
and (case when tipoeco in ('COP','COMP') then 'COP' when tipoeco in ('RCV','RCVCOMP') then 'RCV' else 'X' end) like @TIPO_COP_RCV
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
and validacion='SIN PAGO'
and incidenciarale in ('09','05','51','52','53','06','12','14','15','16','19','25','23','21','34','43')
--and (incidencia not in ('9','60') or incidencia is null)
group by fechaeco
">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="DDLCuatriTotal" DefaultValue="22222" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="HiddenFieldDel" DefaultValue="subdel" Name="?" 
                                                                                    PropertyName="Value" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </asp:WizardStep>
                                                </WizardSteps>
                                            </asp:Wizard>
                                        </asp:View>
                                        <asp:View ID="ViewRPorInspector" runat="server">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td colspan="2">
                                                        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
<div class="btn-group input-prepend">
<span class="add-on">
                                                                    <asp:Label ID="Label5" runat="server" Text="INSPECTOR:"></asp:Label>
</span>
                                                                    <asp:DropDownList ID="DDLInspector" runat="server" AutoPostBack="True" 
                                                                        DataSourceID="SqlDataSourceInspector" DataTextField="nombre" 
                                                                        DataValueField="valor">
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
responsable as valor
,upper((SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where id=responsable)) as nombre
FROM [sireca].[dbo].[eco]
where subdel=? and fechaeco=(?+?) and responsable is not null
group by responsable">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2001" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
<span class="add-on">
                                                                    <asp:Label ID="Label6" runat="server" Text=" ASIGNACION DE: "></asp:Label>
</span>
                                                                    <asp:DropDownList ID="DDLFecInicio" runat="server" AutoPostBack="True" 
                                                                        DataSourceID="SqlDataSourceFechaInicio" DataTextField="fecha" 
                                                                        DataTextFormatString="{0:d}" DataValueField="fecha">
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSourceFechaInicio" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
((case when len(convert(varchar,day([fechaSeleccion])))=1 then '0'+convert(varchar,day([fechaSeleccion])) else convert(varchar,day([fechaSeleccion])) end)
+'-'+
(case when len(convert(varchar,month([fechaSeleccion])))=1 then '0'+convert(varchar,month([fechaSeleccion])) else convert(varchar,month([fechaSeleccion])) end)
+'-' +
convert(varchar,year([fechaSeleccion]))) as fecha
,(convert(datetime,(convert(varchar,day([fechaSeleccion]))+'-'+convert(varchar,month([fechaSeleccion]))+'-' +convert(varchar,year([fechaSeleccion]))),103)) as orden
FROM [sireca].[dbo].[eco]
where subdel=? and fechaeco=(?+?) and fechaSeleccion is not null
and responsable=?
group by convert(varchar,day([fechaSeleccion])),convert(varchar,month([fechaSeleccion])),convert(varchar,year([fechaSeleccion]))
order by 2
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2001" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
<span class="add-on">
                                                                    <asp:Label ID="Label7" runat="server" Text=" AL "></asp:Label>
</span>
                                                                    <asp:DropDownList ID="DDLFechFin" runat="server" AutoPostBack="True" 
                                                                        DataSourceID="SqlDataSourceFechaFin" DataTextField="fecha" 
                                                                        DataTextFormatString="{0:d}" DataValueField="fecha">
                                                                    </asp:DropDownList>
<span class="add-on">
                                                                    <asp:Button ID="BActualizarInspector" runat="server" Text="Actualizar" 
        BackColor="#FFFBFF" CssClass="btn" />
</span> 
                                                                    <asp:SqlDataSource ID="SqlDataSourceFechaFin" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
((case when len(convert(varchar,day([fechaSeleccion])))=1 then '0'+convert(varchar,day([fechaSeleccion])) else convert(varchar,day([fechaSeleccion])) end)
+'-'+
(case when len(convert(varchar,month([fechaSeleccion])))=1 then '0'+convert(varchar,month([fechaSeleccion])) else convert(varchar,month([fechaSeleccion])) end)
+'-' +
convert(varchar,year([fechaSeleccion]))) as fecha
,(convert(datetime,(convert(varchar,day([fechaSeleccion]))+'-'+convert(varchar,month([fechaSeleccion]))+'-' +convert(varchar,year([fechaSeleccion]))),103)) as orden
FROM [sireca].[dbo].[eco]
where subdel=? and fechaeco=(?+?) and fechaSeleccion is not null
and responsable=?
group by convert(varchar,day([fechaSeleccion])),convert(varchar,month([fechaSeleccion])),convert(varchar,year([fechaSeleccion]))
order by 2 desc
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2001" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Wizard ID="Wizard2" runat="server" ActiveStepIndex="3" BackColor="#F7F6F3" 
                                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                                        FinishCompleteButtonText="" Font-Names="Verdana" Font-Size="0.8em" 
                                                                        Height="100%" Width="100%">
                                                                        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                                                                            Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                                                                        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                                                                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                                                            ForeColor="#284775" />
                                                                        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                                                                        <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
                                                                            VerticalAlign="Top" Width="100px" />
                                                                        <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                                                                        <WizardSteps>
                                                                            <asp:WizardStep runat="server" title="Inspector A">
                                                                                <table style="width:100%;">
                                                                                    <tr>
                                                                                        <td class="style15">
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="style15">
                                                                                            <asp:ImageButton ID="IBFoto" runat="server" BorderStyle="Outset" Height="150px" 
                                                                                                ImageUrl="~/imagenes/usuarios/avatar/usuarioSireca.jpg" Width="150px" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DetailsView ID="DVInspector" runat="server" AutoGenerateRows="False" 
                                                                                                BorderStyle="Dashed" BorderWidth="1px" CellPadding="4" 
                                                                                                DataSourceID="SqlDataSourceInfoInspector" Font-Bold="True" Font-Size="Large" 
                                                                                                ForeColor="Black" GridLines="Horizontal" Height="50px" 
                                                                                                BorderColor="#99CB99">
                                                                                                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                                                <Fields>
                                                                                                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE:" ReadOnly="True" 
                                                                                                        SortExpression="NOMBRE"><ItemStyle Font-Bold="False" Font-Italic="True" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="SUBDELEGACION" HeaderText="SUBDELEGACIÓN:" 
                                                                                                        SortExpression="SUBDELEGACION"><ItemStyle Font-Bold="False" Font-Italic="True" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="CARGO" HeaderText="CARGO:" ReadOnly="True" 
                                                                                                        SortExpression="CARGO"><ItemStyle Font-Bold="False" Font-Italic="True" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="CREDENCIAL" HeaderText="CREDENCIAL:" 
                                                                                                        SortExpression="CREDENCIAL"><ItemStyle Font-Bold="False" Font-Italic="True" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="ANTIGUEDAD" HeaderText="ANTIGUEDAD:" ReadOnly="True" 
                                                                                                        SortExpression="ANTIGUEDAD" DataFormatString="{0} AÑOS"><ItemStyle Font-Bold="False" Font-Italic="True" /></asp:BoundField>
                                                                                                </Fields>
                                                                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                                            </asp:DetailsView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceInfoInspector" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT upper((SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id])) as NOMBRE 
,subdel as SUBDELEGACION
,upper((SELECT [cargo] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id])) as CARGO
,credencial  as CREDENCIAL
,upper((SELECT (year(getdate())-year([ingreso])) FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id])) as ANTIGUEDAD 
  FROM [sireca].[dbo].[usuarios] as sire 
where sire.id=?">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="style15" colspan="2">
                                                                                            <asp:Panel ID="Panel7" runat="server">
                                                                                                <asp:Panel ID="PObservaciones" runat="server" 
                                                                                                    GroupingText="Observaciones (INSPECTOR)" ScrollBars="Auto">
                                                                                                    <asp:Panel ID="Panel9" runat="server" ScrollBars="Auto" Height="300">
                                                                                                    <asp:Repeater ID="Repeater1" runat="server" 
                                                    DataSourceID="SqlDataSourceObservacion">
                                                    <ItemTemplate >
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="51">
                                                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# "~/imagenes/usuarios/avatar/" & Eval("idobservo") & ".jpg"%>' Width="50" Height="50" ToolTip='<%# Eval("OBSERVO")%>' BorderStyle="Ridge" BorderWidth="1" BorderColor="#9BBD99" />
                                                                    </td>                                                                    
                                                                    <td>
                                                                    <asp:Panel ID="PanelObservacion" runat="server" BackColor="#A9DBA6" BorderStyle="None">
                                                                    <table border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("OBSERVACION")%>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# "(" & Eval("FECH_OBSERVACION") & ")"%>' Font-Size="8" Font-Italic="True" ForeColor="Gray"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    </table> 
                                                                    </asp:Panel>
                                                                    </td> 
                                                                    </tr> 
                                                            </table>
                                                    
                                                        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="PanelObservacion" Radius="15" Enabled="True"></asp:RoundedCornersExtender>
                                                    </ItemTemplate>
                                                    <SeparatorTemplate >
                                                    <br />
                                                    </SeparatorTemplate>
                                                </asp:Repeater>
                                                                                                    </asp:Panel>
                                                                                                    <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
                                                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_oi] as ID
,[id_observo] as idobservo
,(select nombre from fiscamovil.dbo.usuarios where [id]=[id_inspector]) as INSPECTOR
,upper((select nombre from fiscamovil.dbo.usuarios where [id]=[id_observo])) as OBSERVO
,[fecha_observacion] as FECH_OBSERVACION
,[observacion] as OBSERVACION
FROM [sirecaObservaciones].[dbo].[ObservacionInspector]
WHERE [id_inspector]=?
order by [fecha_observacion]">
                                                                                                        <SelectParameters>
                                                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="00" Name="?" 
                                                                                                                PropertyName="SelectedValue" />
                                                                                                        </SelectParameters>
                                                                                                    </asp:SqlDataSource>
                                                                                                    <asp:TextBox ID="TBObservacion" runat="server" MaxLength="254" Width="424px" 
                                                                                                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                                                                                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkCssClass="watermarked" TargetControlID="TBObservacion" WatermarkText="Escriba aqui..."></asp:TextBoxWatermarkExtender>
                                                                                                    <asp:Button ID="BComentar" runat="server" Text="Comentar" BorderColor="#BCC7D8" 
                                                                                                        BorderStyle="Solid" BorderWidth="1px" />
                                                                                                    <asp:Label ID="LError" runat="server" Font-Bold="True" Font-Size="10pt" 
                                                                                                        ForeColor="#CC0000"></asp:Label>
                                                                                                </asp:Panel>
                                                                                            </asp:Panel>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </asp:WizardStep>
                                                                            <asp:WizardStep runat="server" title="Trabajo">
                                                                                <table style="width:100%;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:GridView ID="GVRPorInspectorPatron" runat="server" 
                                                                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                                                BorderWidth="1px" Caption="TRABAJO POR PERIODO" CaptionAlign="Left" 
                                                                                                CellPadding="1" CellSpacing="1" 
                                                                                                DataSourceID="SqlDataSourcePorInspectorPatron">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" />
                                                                                                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <HeaderStyle BackColor="#99CB99" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourcePorInspectorPatron" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(50)
DECLARE @FECH_FIN AS VARCHAR(50)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT 
('''+@MES+'/'+@ANIO+''') as PERIODO
,count(distinct(REG#PATRONAL)) as PATRONES
,count(CREDITO) as CREDITOS
,sum(COTIZ) as COTIZANTES
,sum([OMISION]) as IMPORTE
FROM [sireca].[dbo].[eco]
where fechaEco='''+@PERIODO+''' and subdel='''+@SUBDEL+'''
and responsable='''+@RESPONSABLE+''' '+@ADD_WHERE+'
and (convert(datetime,(convert(varchar,day([fechaSeleccion]))+''/''+convert(varchar,month([fechaSeleccion]))+''/'' +convert(varchar,year([fechaSeleccion]))),103)) 
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
group by fechaEco
')">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                                                                                                        Name="?" PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:SqlDataSource ID="SqlDataSourcePorInspector" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(50)
DECLARE @FECH_FIN AS VARCHAR(50)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT '+@ADD_COLUM+' as TIPO
,count(distinct(REG#PATRONAL)) as PATRONES
,count(CREDITO) as CREDITOS
,sum(COTIZ) as COTIZANTES
,sum([OMISION]) as IMPORTE
FROM [sireca].[dbo].[eco]
where fechaEco='''+@PERIODO+''' and subdel='''+@SUBDEL+'''
and responsable='''+@RESPONSABLE+''' '+@ADD_WHERE+'
and (convert(datetime,(convert(varchar,day([fechaSeleccion]))+''/''+convert(varchar,month([fechaSeleccion]))+''/'' +convert(varchar,year([fechaSeleccion]))),103)) 
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
group by tipoeco
')">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="999999" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                                                                                                        Name="?" PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                            <asp:GridView ID="GVRPorInspector" runat="server" AllowSorting="True" 
                                                                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                                                BorderWidth="1px" Caption="TRABAJO POR TIPO" CaptionAlign="Left" 
                                                                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourcePorInspector">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                                        SortExpression="TIPO"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <HeaderStyle BackColor="#99CB99" />
                                                                                            </asp:GridView>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Chart ID="Chart2" runat="server" BackColor="Transparent" 
                                                                                                DataSourceID="SqlDataSourcePorInspector" Height="250px" Width="480px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                                        CustomProperties="DrawingStyle=Cylinder, PieDrawingStyle=SoftEdge" 
                                                                                                        Legend="Legend1" Name="Series1" XValueMember="TIPO" YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="60"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2" 
                                                                                                                Text="#LEGENDTEXT #PERCENT"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Name="Column3" Text="#VAL{N0} de #TOTAL{N0} PATRONES"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
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
                                                                            </asp:WizardStep>
                                                                            <asp:WizardStep runat="server" Title="Resultados">
                                                                                <asp:Panel ID="Panel5" runat="server" Height="450px" ScrollBars="Auto">
                                                                                <table style="width:100%;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:GridView ID="GVRPorInspectorPatron0" runat="server" 
                                                                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                                                BorderWidth="1px" Caption="POR INCIDENCIA" CaptionAlign="Left" CellPadding="1" 
                                                                                                CellSpacing="1" DataSourceID="SqlDataSourcePorInspectorInc" 
                                                                                                AllowSorting="True">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                                                                                                        SortExpression="PERIODO"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                                                                                                        SortExpression="INCIDENCIA"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <HeaderStyle BackColor="#99CB99" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourcePorInspectorInc" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(50)
DECLARE @FECH_FIN AS VARCHAR(50)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT 
('''+@MES+'/'+@ANIO+''') as PERIODO
,&quot;INCIDENCIA&quot; = case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.fechaEco = '''+@PERIODO+'''
and eco.responsable='''+@RESPONSABLE+''' '+@ADD_WHERE+'
and (convert(datetime,(convert(varchar,day([fechaSeleccion]))+''/''+convert(varchar,month([fechaSeleccion]))+''/'' +convert(varchar,year([fechaSeleccion]))),103)) 
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
GROUP BY eco.incidencia
ORDER BY INCIDENCIA
')
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                                                                                                        Name="?" PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Chart ID="Chart9" runat="server" BackColor="Transparent" 
                                                                                                DataSourceID="SqlDataSourcePorInspectorInc" Height="250px" Width="480px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                                        CustomProperties="DrawingStyle=Cylinder, PieDrawingStyle=SoftEdge" 
                                                                                                        Label="#PERCENT" Legend="Legend1" Name="Series1" XValueMember="INCIDENCIA" 
                                                                                                        YValueMembers="PATRONES"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="60"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2" Text="#LEGENDTEXT "><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Name="Column3" Text="#VAL{N0} de #TOTAL{N0} PATRONES"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:GridView ID="GVRPorInspector0" runat="server" AllowSorting="True" 
                                                                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                                                                BorderWidth="1px" Caption="POR TIPO Y INCIDENCIA" CaptionAlign="Left" 
                                                                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceFiguraTipoInc">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                                        SortExpression="TIPO"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                                                                                                        SortExpression="INCIDENCIA"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:HyperLinkField DataNavigateUrlFields="URLV" 
                                                                                                        DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/incidenciaejecutor.aspx{0}" 
                                                                                                        DataTextField="PATRONES" HeaderText="PATRONES" 
                                                                                                        NavigateUrl="~/areaemision/detallesdeseleccion/grupos/incidenciaejecutor.aspx" 
                                                                                                        SortExpression="PATRONES" Target="_blank" />
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <HeaderStyle BackColor="#99CB99" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceFiguraTipoInc" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(50)
DECLARE @FECH_FIN AS VARCHAR(50)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT '+@ADD_COLUM+' as TIPO
,(''?mes='+@MES+'&amp;anio='+@ANIO+'&amp;subdel='+@SUBDEL+'&amp;responsable='+@RESPONSABLE+'&amp;fech_inicio='+@FECH_INICIO+'&amp;fech_fin='+@FECH_FIN+'&amp;tipo_eco='+@TIPO_ECO+'&amp;tipo_file=''+eco.tipoEco+''&amp;incidencia=''
+(
case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
)
) as URLV
,&quot;INCIDENCIA&quot; = case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.fechaEco = '''+@PERIODO+'''
and eco.responsable='''+@RESPONSABLE+''' '+@ADD_WHERE+'
and (convert(datetime,(convert(varchar,day([fechaSeleccion]))+''/''+convert(varchar,month([fechaSeleccion]))+''/'' +convert(varchar,year([fechaSeleccion]))),103)) 
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
GROUP BY eco.tipoEco,eco.incidencia
ORDER BY TIPO,INCIDENCIA
')
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                                                                                                        Name="?" PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Chart ID="Chart8" runat="server" BackColor="Transparent" 
                                                                                                DataSourceID="SqlDataSourceFiguraTipoInc" Height="250px" Width="480px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Pie" 
                                                                                                        CustomProperties="DrawingStyle=Cylinder, PieDrawingStyle=SoftEdge" 
                                                                                                        Legend="Legend1" Name="Series1" XValueMember="TIPO" 
                                                                                                        YValueMembers="PATRONES" Label="#PERCENT"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="Transparent" Name="ChartArea1"></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="60"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2" 
                                                                                                                Text="#LEGENDTEXT "><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Name="Column3" Text="#VAL{N0} de #TOTAL{N0} PATRONES"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                                </asp:Panel>
                                                                            </asp:WizardStep>
                                                                            <asp:WizardStep runat="server" Title="Recaudación">
                                                                                <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto">
                                                                                
                                                                                <table style="width:100%;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:GridView ID="GVRecaudacion0" runat="server" AutoGenerateColumns="False" 
                                                                                                BorderColor="Black" BorderStyle="Solid" 
                                                                                                Caption="ESTADO DE LA META C.O.P. Y RECAUDACION R.C.V." CaptionAlign="Left" 
                                                                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceRecaInsp">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                                        SortExpression="PERIODO"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="A_RECAUDAR_COP" DataFormatString="{0:C}" 
                                                                                                        HeaderText="A RECAU. C.O.P." NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="A_RECAUDAR_COP"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="RECAUDACION_COP" DataFormatString="{0:C}" 
                                                                                                        HeaderText="RECAU. C.O.P." NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="RECAUDACION_COP"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="META" DataFormatString="{0:C}" HeaderText="META" 
                                                                                                        NullDisplayText="0" ReadOnly="True" SortExpression="META" Visible="False"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="DIFERENCIA_IMP_META" DataFormatString="{0:C}" 
                                                                                                        HeaderText="DIF.META" NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="DIFERENCIA_IMP_META"><ItemStyle ForeColor="Red" HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="PATRONES_COP_PAGARON" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="PAT.  PAG. C.O.P." NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="PATRONES_COP_PAGARON"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="TOTAL_PATRONES_COP" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="TOT.PAT." NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="TOTAL_PATRONES_COP"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="META_ALCANSADA" HeaderText="META ALCAN." 
                                                                                                        ReadOnly="True" SortExpression="META_ALCANSADA"><ItemStyle Font-Bold="False" ForeColor="Red" HorizontalAlign="Center" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="A_RECAUDAR_RCV" DataFormatString="{0:C}" 
                                                                                                        HeaderText="A REC. R.C.V." NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="A_RECAUDAR_RCV"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="RECAUDACION_RCV" DataFormatString="{0:C}" 
                                                                                                        HeaderText="RECAU. R.C.V." NullDisplayText="0" ReadOnly="True" 
                                                                                                        SortExpression="RECAUDACION_RCV"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <FooterStyle Font-Bold="True" />
                                                                                                <HeaderStyle BackColor="#99CB99" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceRecaInsp" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PERIODO_ANIO as VARCHAR(4)
DECLARE @PERIODO_MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @PATRONES_COP as INT
DECLARE @IMP_RCV as FLOAT
DECLARE @IMP_DISPONIBLE_COP as FLOAT
DECLARE @PATRONES_DISPONIBLE_COP as INT
DECLARE @IMP_DISPONIBLE_RCV as FLOAT
DECLARE @RESPONSABLE AS VARCHAR(6)
SET @PERIODO_ANIO=?
SET @PERIODO_MES=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @META_MES=(
SELECT ([meta]) as meta
FROM [sirecacobros].[dbo].[metas]
where mes=@PERIODO_MES and anio=@PERIODO_ANIO
and sub_del=@SUBDEL and [tipo_meta]='cobranza'
)
SET @IMP_COP=(
select sum(omision)
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and responsable=@RESPONSABLE
and eco.tipoEco in ('COP','COMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @PATRONES_COP=(select count(distinct(reg#patronal))
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and responsable=@RESPONSABLE
and eco.tipoEco in ('COP','COMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @IMP_RCV=(select sum(omision)
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and responsable=@RESPONSABLE
and eco.tipoEco in ('RCV','RCVCOMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @IMP_DISPONIBLE_COP=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and responsable=@RESPONSABLE
and tipoEco in ('COP','COMP')
)
SET @PATRONES_DISPONIBLE_COP=(select count(distinct([REG#PATRONAL])) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and responsable=@RESPONSABLE
and tipoEco in ('COP','COMP')
)
SET @IMP_DISPONIBLE_RCV=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and responsable=@RESPONSABLE
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('RCV','RCVCOMP')
)
select 
(@PERIODO_MES+'/'+@PERIODO_ANIO) as PERIODO
,@IMP_DISPONIBLE_COP as A_RECAUDAR_COP
,@IMP_COP as RECAUDACION_COP
,@META_MES as META
,(@IMP_COP-@IMP_DISPONIBLE_COP) as DIFERENCIA_IMP_META
,@PATRONES_COP as PATRONES_COP_PAGARON
,@PATRONES_DISPONIBLE_COP as TOTAL_PATRONES_COP
,(case when @IMP_COP&gt;=@IMP_DISPONIBLE_COP then 'SI' else 'NO' end) as META_ALCANSADA
,@IMP_DISPONIBLE_RCV as A_RECAUDAR_RCV
,@IMP_RCV as RECAUDACION_RCV
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Chart ID="Chart11" runat="server" BackColor="Transparent" 
                                                                                                DataSourceID="SqlDataSourceRecaInsp" Width="750px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                                        CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                                                                        Name="Recaudado" XValueMember="PERIODO" YValueMembers="RECAUDACION_COP"></asp:Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                                        CustomProperties="DrawingStyle=Cylinder" Label="#VAL{C}" Legend="Legend1" 
                                                                                                        Name="Total" XValueMember="PERIODO" YValueMembers="A_RECAUDAR_COP"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="White" Name="ChartArea1"><AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                                                                            LineColor="Silver"><MajorGrid LineDashStyle="Dot" /><MajorGrid 
                                                                                                LineDashStyle="Dot" /></AxisY><AxisX><MajorGrid LineDashStyle="NotSet" /><MajorGrid 
                                                                                                LineDashStyle="NotSet" /></AxisX></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart><br />

                                                                                            <asp:Chart ID="Chart12" runat="server" BackColor="Transparent" 
                                                                                                DataSourceID="SqlDataSourceIncInspector" Width="750px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                                        CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                                                                        Name="Recaudado" XValueMember="incidencia" YValueMembers="PRO_IMP_COP"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="White" Name="ChartArea1"><AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                                                                            LineColor="Silver"><MajorGrid LineDashStyle="Dot" /><MajorGrid 
                                                                                                LineDashStyle="Dot" /></AxisY><AxisX><MajorGrid LineDashStyle="NotSet" /><MajorGrid 
                                                                                                LineDashStyle="NotSet" /></AxisX></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}"><Margins Left="15" Right="15" /><Margins 
                                                                                                Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>

                                                                                            <asp:SqlDataSource ID="SqlDataSourceIncInspector" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PERIODO_ANIO as VARCHAR(4)
DECLARE @PERIODO_MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @PATRONES_COP as INT
DECLARE @IMP_RCV as FLOAT
DECLARE @IMP_DISPONIBLE_COP as FLOAT
DECLARE @PATRONES_DISPONIBLE_COP as INT
DECLARE @IMP_DISPONIBLE_RCV as FLOAT
DECLARE @RESPONSABLE AS VARCHAR(6)
SET @PERIODO_ANIO=?
SET @PERIODO_MES=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @META_MES=(
SELECT ([meta]/[num_ejecutores]) as meta
FROM [sirecacobros].[dbo].[metas]
where mes=@PERIODO_MES and anio=@PERIODO_ANIO
and sub_del=@SUBDEL and [tipo_meta]='cobranza'
)
SET @IMP_COP=(select sum(pro.[RCP_IMP_COP]) as PRO_IMP_COP
FROM [procesar].[dbo].[RCPRO] as pro inner join sireca.dbo.eco as eco 
on eco.fechaeco=(substring(RCP_PER,6,2)+substring(RCP_PER,1,4)) and [REG#PATRONAL]=[RCP_REGPAT] and eco.tipoEco in ('COP','COMP')
where 
RCP_FEC_MOV between DATEADD(month, 1, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO) and DATEADD(month, 3, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO)
and RCP_SUB=@SUBDEL and RCP_PER=(@PERIODO_ANIO+'/'+@PERIODO_MES)
and eco.responsable=@RESPONSABLE
and pro.[RCP_IMP_COP] not in ('0')
)
SET @PATRONES_COP=(select count(distinct(pro.[RCP_REGPAT])) as PRO_IMP_COP
FROM [procesar].[dbo].[RCPRO] as pro inner join sireca.dbo.eco as eco 
on eco.fechaeco=(substring(RCP_PER,6,2)+substring(RCP_PER,1,4)) and [REG#PATRONAL]=[RCP_REGPAT] and tipoEco in ('COP','COMP')
where 
RCP_FEC_MOV between DATEADD(month, 1, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO) and DATEADD(month, 3, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO)
and RCP_SUB=@SUBDEL and RCP_PER=(@PERIODO_ANIO+'/'+@PERIODO_MES)
and eco.responsable=@RESPONSABLE
and pro.[RCP_IMP_COP] not in ('0')
)
SET @IMP_RCV=(select sum(pro.[RCP_IMP_RCV]) as PRO_IMP_RCV
FROM [procesar].[dbo].[RCPRO] as pro 
inner join sireca.dbo.eco as eco on eco.fechaeco=(substring(RCP_PER,6,2)+substring(RCP_PER,1,4)) and [REG#PATRONAL]=[RCP_REGPAT] and tipoEco in ('RCV','RCVCOMP')
where 
RCP_FEC_MOV between DATEADD(month, 1, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO) and DATEADD(month, 3, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO)
and RCP_SUB=@SUBDEL and RCP_PER=(@PERIODO_ANIO+'/'+@PERIODO_MES)
and eco.responsable=@RESPONSABLE
and pro.[RCP_IMP_RCV] not in ('0')
)
SET @IMP_DISPONIBLE_COP=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('COP','COMP')
and eco.responsable=@RESPONSABLE
)
SET @PATRONES_DISPONIBLE_COP=(select count(distinct([REG#PATRONAL])) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('COP','COMP')
and eco.responsable=@RESPONSABLE
)
SET @IMP_DISPONIBLE_RCV=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('RCV','RCVCOMP')
and eco.responsable=@RESPONSABLE
)
/*
select 
(@PERIODO_MES+'/'+@PERIODO_ANIO) as PERIODO
,@IMP_DISPONIBLE_COP as A_RECAUDAR_COP
,@IMP_COP as RECAUDACION_COP
,@META_MES as META
,(@IMP_COP-@IMP_DISPONIBLE_COP) as DIFERENCIA_IMP_META
,@PATRONES_COP as PATRONES_COP_PAGARON
,@PATRONES_DISPONIBLE_COP as TOTAL_PATRONES_COP
,(case when @IMP_COP&gt;=@IMP_DISPONIBLE_COP then 'SI' else 'NO' end) as META_ALCANSADA
,(@IMP_COP/@IMP_DISPONIBLE_COP) as EFECTIVIDAD
,@IMP_DISPONIBLE_RCV as A_RECAUDAR_RCV
,@IMP_RCV as RECAUDACION_RCV
*/
--------------------------------------------------
select eco.subdel as subdel,eco.incidencia as [incidencia],sum(pro.[RCP_IMP_COP]) as PRO_IMP_COP 
FROM [procesar].[dbo].[RCPRO] as pro inner join sireca.dbo.eco as eco 
on eco.fechaeco=(substring(RCP_PER,6,2)+substring(RCP_PER,1,4)) and [REG#PATRONAL]=[RCP_REGPAT] and eco.tipoEco in ('COP','COMP')
where 
RCP_FEC_MOV between DATEADD(month, 1, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO) and DATEADD(month, 3, '1/'+@PERIODO_MES+'/'+@PERIODO_ANIO)
and RCP_SUB=@SUBDEL and RCP_PER=(@PERIODO_ANIO+'/'+@PERIODO_MES)
and eco.responsable=@RESPONSABLE
and pro.[RCP_IMP_COP] not in ('0')
group by eco.subdel,eco.incidencia
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                                </asp:Panel>
                                                                            </asp:WizardStep>
                                                                            <asp:WizardStep runat="server" Title="Pendientes">
                                                                                <asp:Panel ID="Panel6" runat="server">
                                                                                    <table style="width:100%;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                                                                                                    AutoGenerateColumns="False" Caption="ACOMULADO C.O.P. y RCV" CaptionAlign="Left" 
                                                                                                    CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceAtrasados">
                                                                                                    <Columns>
                                                                                                        <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                                                                                            SortExpression="INSPECTOR" />
                                                                                                        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                                            SortExpression="PERIODO" />
                                                                                                        <asp:HyperLinkField DataTextField="PATRONES" DataTextFormatString="{0:N0}" 
                                                                                                            HeaderText="PATRONES" SortExpression="PATRONES" Target="_blank" 
                                                                                                            DataNavigateUrlFields="URLV" 
                                                                                                            DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/pendientesxejecutor.aspx{0}" 
                                                                                                            NavigateUrl="~/areaemision/detallesdeseleccion/grupos/pendientesxejecutor.aspx" />
                                                                                                        <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                            HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                        <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                            HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                        <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                                            HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    </Columns>
                                                                                                    <HeaderStyle BackColor="#99CB99" />
                                                                                                </asp:GridView>
                                                                                                <asp:SqlDataSource ID="SqlDataSourceAtrasados" runat="server" 
                                                                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL=?
SELECT 
'?anio='+@ANIO+'&amp;mes='+@MES+'&amp;responsable='+responsable+'&amp;patrones=' +convert(varchar, count(distinct(reg#patronal))) +'&amp;cotizantes='+convert(varchar,sum(cotiz))+'&amp;importe='+convert(varchar,sum(omision)) +'&amp;subdel='+@SUBDEL+'&amp;fechaEco='+convert(varchar,fechaEco) as URLV
,upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=responsable)) as INSPECTOR
,(case len([fechaeco]) when 5 then '0'+substring(convert(varchar,fechaeco),0,2)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),0,3)+'/'+ substring(convert(varchar,fechaeco),3,4) end) as PERIODO
,count(distinct(reg#patronal)) as PATRONES
,count(credito) as CREDITOS
,sum(cotiz) as COTIZANTES
,sum(omision) as IMPORTE
FROM [sireca].[dbo].[eco]
where (incidencia is null or incidencia in ('2','1','0'))
and responsable is not null
and tipoEco in ('COP','COMP','RCV','RCVCOMP')
and fechaeco in ('42013','52013','62013','72013','82013','92013','102013')
and (incidencia in ('0','1','2','A','SIN ATENDER') or incidencia is null)
and validacion = 'SIN PAGO' and incidenciarale in ('00','01','02')
and responsable=?
group by responsable,fechaeco
order by 1,2
">
                                                                                                    <SelectParameters>
                                                                                                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                                                            PropertyName="SelectedValue" />
                                                                                                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                                            PropertyName="SelectedValue" />
                                                                                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                            PropertyName="SelectedValue" />
                                                                                                        <asp:ControlParameter ControlID="DDLInspector" DefaultValue="09999" Name="?" 
                                                                                                            PropertyName="SelectedValue" />
                                                                                                    </SelectParameters>
                                                                                                </asp:SqlDataSource>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
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
                                                                                </asp:Panel>
                                                                            </asp:WizardStep>
                                                                        </WizardSteps>
                                                                    </asp:Wizard>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class="style6">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style9">
                                                        &nbsp;</td>
                                                    <td class="style10">
                                                        &nbsp;</td>
                                                    <td class="style6">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                    </asp:MultiView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DDLSubdel" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLMes" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLAnio" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLReporte" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLInspector" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLFecInicio" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLFechFin" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DDLSubdel" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="DDLMes" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="DDLAnio" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="DDLReporte" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="DDLInspector" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="DDLFecInicio" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="DDLFechFin" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style6
        {
            width: 1%;
        }
        .style9
        {
            width: 427px;
        }
        .style10
        {
            width: 53%;
        }
        .style15
        {
        }
    </style>
</asp:Content>


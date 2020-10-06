<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="Ciclo2B.aspx.vb" Inherits="WebSIRECA.Ciclo2B" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
    <script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content id="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Panel ID="PanelPrincipal" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width:100%;">
                    <tr>
                        <td height="40">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
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
                            <asp:Label ID="Label4" runat="server" Text="REPORTE:"></asp:Label>
                            <asp:DropDownList ID="DDLReporte" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0">GENERAL</asp:ListItem>
                                <asp:ListItem Value="1">POR FIGURA</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="Label5" runat="server" Text="INSPECTOR:" Visible="False"></asp:Label>
                            <asp:DropDownList ID="DDLInspector" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourceInspector" DataTextField="nombre" 
                                DataValueField="valor" Visible="False">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ID_RESPONSABLE] as valor
,upper((SELECT fc.[nombre] FROM [fiscamovil].[dbo].[Usuarios] as fc where fc.id=[ID_RESPONSABLE])) as nombre
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=? and year(fech_asig)=? and month(fech_asig)=?
group by [ID_RESPONSABLE]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="Label8" runat="server" Text="FECH. INICIO:"></asp:Label>
                            <asp:DropDownList ID="DDLFInicio" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourceFechInicio" DataTextField="FECHA" 
                                DataValueField="FECHA">
                            </asp:DropDownList>
                            <asp:Label ID="Label2" runat="server" Text="FECH. FIN:"></asp:Label>
                            <asp:DropDownList ID="DDLFFin" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourceFechFin" DataTextField="FECHA" 
                                DataValueField="FECHA">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceFechInicio" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT convert(varchar,day(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,month(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,year(convert(datetime,FECH_ASIG,103))) as FECHA
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
WHERE subdel=?
and year(FECH_ASIG)=? and month(FECH_ASIG)=?
group by convert(datetime,FECH_ASIG,103)
order by convert(datetime,FECH_ASIG,103)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFechFin" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT convert(varchar,day(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,month(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,year(convert(datetime,FECH_ASIG,103))) as FECHA
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
WHERE subdel=?
and year(FECH_ASIG)=? and month(FECH_ASIG)=?
group by convert(datetime,FECH_ASIG,103)
order by convert(datetime,FECH_ASIG,103) desc">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="BActualizarRGeneral" runat="server" Text="Actualizar" 
                                BackColor="#FFFBFF" BorderColor="#5DA6D7" BorderStyle="Solid" BorderWidth="1px" 
                                ForeColor="#284775" />
                        </td>
                        <td height="40">
                            &nbsp;</td>
                        <td height="40">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100">
                                <ProgressTemplate>
                                    <asp:Label ID="Label22" runat="server" Text="CARGANDO..." Font-Bold="True" 
                                        ForeColor="#CC0000"></asp:Label>
                                    <asp:Image ID="Image1" runat="server" ImageAlign="AbsBottom" 
                                        ImageUrl="~/imagenes/sitios/loading.gif" ClientIDMode="AutoID" 
                                        BackColor="Black" BorderColor="Black" BorderStyle="Solid" 
                                        BorderWidth="2px" />                                                                        
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table border="0" style="width:100%; background-color: #678FB7;" 
                            cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:MultiView ID="MultiViewReportes" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="ViewRGeneral" runat="server">
                                            <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="3" BackColor="#F7F6F3" 
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
                                                    VerticalAlign="Top" Width="150px" />
                                                <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                                                <WizardSteps>
                                                    <asp:WizardStep ID="WizardStep11" runat="server" Title="GENERAL">
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
                                                                    <asp:GridView ID="GVReporte2" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                                                                        BorderStyle="None" BorderWidth="1px" 
                                                                        Caption="&lt;strong&gt;REPORTE PRINCIPAL SALDO 0&lt;/strong&gt;" 
                                                                        CellPadding="3" DataSourceID="SqlDataSourceReporte2" Font-Bold="False" 
                                                                        GridLines="Vertical" ShowFooter="True" CaptionAlign="Left">
                                                                        <AlternatingRowStyle BackColor="Gainsboro" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="subdel" HeaderText="subdel" 
                                                                                SortExpression="subdel" />
                                                                            <asp:TemplateField HeaderText="TIPO_TRABAJO" SortExpression="TIPO_TRABAJO"><ItemTemplate><asp:HyperLink ID="HyperLink3" runat="server" 
                                                                                        NavigateUrl='<%# "../informes/reporteDescriptivo.aspx?subdel=" & Eval("subdel") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=general&patrones=" & Eval("PATRONES") & "&creditos=" & Eval("CREDITOS") & "&cotizantes=" & Eval("COTIZANTES") & "&importe=" & Eval("ADEUDO") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                                                                                        rel="gb_page_fs[]" Text='<%# Eval("TIPO_TRABAJO") %>' title="Detalles"></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink4" runat="server" 
                                                                                        NavigateUrl='<%# "../informes/detallesSeleccion.aspx?subdel=" & Eval("subdel") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=general&tipo_estado=abcde&creditos=" & Eval("CREDITOS") & "&cotizantes=" & Eval("COTIZANTES") & "&importe=" & Eval("ADEUDO") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                                                                                        rel="gb_page_fs[]" Text='<%# Eval("PATRONES") %>' title="Detalles"></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                                ReadOnly="True" SortExpression="ADEUDO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="ADEUDO_T" DataFormatString="{0:P}" HeaderText="%" 
                                                                                SortExpression="ADEUDO_T"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#CCCCCC" Font-Bold="True" Font-Italic="False" 
                                                                            ForeColor="Black" HorizontalAlign="Right" />
                                                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                        <SortedDescendingHeaderStyle BackColor="#000065" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceReporte2" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @ADEUDO_TOTAL FLOAT
SET @SUBDEL=?
SET @FECH_INICIO=?
SET @FECH_FIN=?

UPDATE [sirecacobros].[dbo].[ecoTiposHistorial] 
SET [TIPO_TRABAJO]=(CASE
WHEN (SELECT COUNT(*) FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth1 WHERE eth1.REGPATR=eth.REGPATR AND eth1.INC_CAP IN ('31','x'))&gt;0 THEN 'SALDO'
ELSE 'ATENDIDO' END)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as  eth 
WHERE subdel=@SUBDEL
-----------------------------------------------------------
SET @ADEUDO_TOTAL=(
select
sum(adeudo) as ADEUDO
FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth
where 
subdel=@SUBDEL 
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103) 
)
---------------------------------------------------------------------REPORTE SUBDELEGACIONAL
select subdel
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,[TIPO_TRABAJO]
,'%' as id_ejecutor
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@ADEUDO_TOTAL) as ADEUDO_T
FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth
where 
subdel=@SUBDEL 
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103) 
group by subdel,[TIPO_TRABAJO]
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
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
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep22" runat="server" Title="GRUPOS">
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
                                                                    <asp:GridView ID="GVReporte3" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                                                                        BorderStyle="None" BorderWidth="1px" 
                                                                        Caption="&lt;strong&gt;REPORTE DESCRIPTIVO ATENDIDO&lt;/strong&gt;" CellPadding="3" 
                                                                        DataSourceID="SqlDataSourceReporte3" Font-Size="10pt" GridLines="Vertical" 
                                                                        HorizontalAlign="Left" CaptionAlign="Left">
                                                                        <AlternatingRowStyle BackColor="Gainsboro" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="tipo_estado" HeaderText="ESTADO" ReadOnly="True" 
                                                                                SortExpression="tipo_estado"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:HyperLinkField DataNavigateUrlFields="subdel,fech_inicio,fech_fin,tipo_trabajo,tipo_estado,CREDITOS,COTIZANTES,ADEUDO,id_ejecutor" 
                                                                                DataNavigateUrlFormatString="../informes/detallesSeleccion.aspx?subdel={0}&amp;fech_inicio={1}&amp;fech_fin={2}&amp;tipo_trabajo={3}&amp;tipo_reporte=descriptivo&amp;tipo_estado={4}&amp;creditos={5}&amp;cotizantes={6}&amp;importe={7}&amp;id_ejecutor={8}" 
                                                                                DataTextField="PATRONES" HeaderText="PATRONES" 
                                                                                NavigateUrl="~/informes/detallesSeleccion.aspx" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:HyperLinkField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                                ReadOnly="True" SortExpression="ADEUDO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="PORCENTAJE" DataFormatString="{0:P2}" HeaderText="%" 
                                                                                SortExpression="PORCENTAJE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                        <SortedDescendingHeaderStyle BackColor="#000065" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceReporte3" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
SET @SUBDEL=?
SET @TIPO_TRAB=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_REPORTE=?
--------------------------------------------------------------
SET @IMPORT_TOTAL=(SELECT 
sum(adeudo) as PORCENTAJE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103))
--------------------------------------------------------------
SELECT 
@SUBDEL as subdel
,@TIPO_TRAB as tipo_trabajo
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_REPORTE as tipo_reporte
,case
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
ELSE [INC_CAP]
end as tipo_estado
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,'%' as id_ejecutor
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
group by (case 
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
else [INC_CAP]
end)
order by 1
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:Parameter DefaultValue="ATENDIDO" Name="?" />
                                                                            <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:Parameter DefaultValue="general" Name="?" />
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
                                                                    <asp:GridView ID="GVReporte4" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                                                                        BorderStyle="None" BorderWidth="1px" 
                                                                        Caption="&lt;strong&gt;REPORTE DESCRIPTIVO SALDO&lt;/strong&gt;" CellPadding="3" 
                                                                        DataSourceID="SqlDataSourceReporte4" Font-Size="10pt" GridLines="Vertical" 
                                                                        HorizontalAlign="Left" CaptionAlign="Left">
                                                                        <AlternatingRowStyle BackColor="Gainsboro" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="tipo_estado" HeaderText="ESTADO" ReadOnly="True" 
                                                                                SortExpression="tipo_estado"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                            <asp:HyperLinkField DataNavigateUrlFields="subdel,fech_inicio,fech_fin,tipo_trabajo,tipo_estado,CREDITOS,COTIZANTES,ADEUDO,id_ejecutor" 
                                                                                DataNavigateUrlFormatString="../informes/detallesSeleccion.aspx?subdel={0}&amp;fech_inicio={1}&amp;fech_fin={2}&amp;tipo_trabajo={3}&amp;tipo_reporte=descriptivo&amp;tipo_estado={4}&amp;creditos={5}&amp;cotizantes={6}&amp;importe={7}&amp;id_ejecutor={8}" 
                                                                                DataTextField="PATRONES" HeaderText="PATRONES" 
                                                                                NavigateUrl="~/informes/detallesSeleccion.aspx" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:HyperLinkField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                                ReadOnly="True" SortExpression="ADEUDO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="PORCENTAJE" DataFormatString="{0:P2}" HeaderText="%" 
                                                                                SortExpression="PORCENTAJE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                        <SortedDescendingHeaderStyle BackColor="#000065" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceReporte4" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
SET @SUBDEL=? 
SET @TIPO_TRAB=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_REPORTE=?
--------------------------------------------------------------------------
SET @IMPORT_TOTAL=(
SELECT sum(adeudo) as PORCENTAJE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
)
--------------------------------------------------------------------------
SELECT 
@SUBDEL as subdel
,@TIPO_TRAB as tipo_trabajo
,'%' as id_ejecutor
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_REPORTE as tipo_reporte
,case
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
ELSE [INC_CAP]
end as tipo_estado
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
group by (case 
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
else [INC_CAP]
end)
order by 1
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:Parameter DefaultValue="SALDO" Name="?" />
                                                                            <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:Parameter DefaultValue="general" Name="?" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep1" runat="server" Title="RECAUDACIÓN">
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
                                                                    <asp:GridView ID="GVRecaudacion" runat="server" AutoGenerateColumns="False" 
                                                                        BorderColor="Black" BorderStyle="Solid" 
                                                                        Caption="ESTADO DE LA META C.O.P. Y RECAUDACION R.C.V." CaptionAlign="Left" 
                                                                        CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceRecaudacion">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO"></asp:BoundField>
                                                                            <asp:BoundField DataField="RECAUDACION_COP" DataFormatString="{0:C}" 
                                                                                HeaderText="RECAUDACION_COP" ReadOnly="True" SortExpression="RECAUDACION_COP"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="META" DataFormatString="{0:C}" HeaderText="META" 
                                                                                ReadOnly="True" SortExpression="META"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="DIFERENCIA_IMP_META" DataFormatString="{0:C}" 
                                                                                HeaderText="DIFERENCIA_IMP_META" ReadOnly="True" 
                                                                                SortExpression="DIFERENCIA_IMP_META"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="META_ALCANSADA" HeaderText="META_ALCANSADA" 
                                                                                ReadOnly="True" SortExpression="META_ALCANSADA"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                                                            <asp:BoundField DataField="EFECTIVIDAD" DataFormatString="{0:P}" 
                                                                                HeaderText="EFECTIVIDAD" ReadOnly="True" SortExpression="EFECTIVIDAD"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="RECAUDACION_RCV" DataFormatString="{0:C}" 
                                                                                HeaderText="RECAUDACION_RCV" ReadOnly="True" SortExpression="RECAUDACION_RCV"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle Font-Bold="True" />
                                                                        <HeaderStyle BackColor="#99CB99" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceRecaudacion" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @IMP_RCV as FLOAT
DECLARE @RESPONSABLE AS VARCHAR(6)
SET @ANIO=?
SET @MES=?
SET @SUBDEL=?
SET @RESPONSABLE=''
SET @META_MES=(
SELECT ([meta]) as meta
FROM [sirecacobros].[dbo].[metas]
where mes=@MES and anio=@ANIO
and sub_del=@SUBDEL and [tipo_meta]='cobranza'
)
SET @IMP_COP=(select sum(pro.[RCP_IMP_COP]) as PRO_IMP_COP
FROM [procesar].[dbo].[RCPRO] as pro inner join [sirecacobros].[dbo].[ecoTiposHistorial] as eth
on convert(varchar,year([PERIODO]))+'/'+(case when len(month([PERIODO]))=1 then '0'+convert(varchar,month([PERIODO])) else convert(varchar,month([PERIODO])) end)=RCP_PER
and [REGPATR]=substring(rcp_regpat,1,10)
and eth.tipoFile in ('COP')
where 
year(fech_asig)=@ANIO
and month(fech_asig)=@MES
and year(RCP_FEC_MOV)=@ANIO
and month(RCP_FEC_MOV)=@MES
and RCP_SUB=@SUBDEL
--and eco.responsable=@RESPONSABLE
and pro.[RCP_IMP_COP] not in ('0')
)
SET @IMP_RCV=(select sum(pro.[RCP_IMP_RCV]) as PRO_IMP_RCV
FROM [procesar].[dbo].[RCPRO] as pro inner join [sirecacobros].[dbo].[ecoTiposHistorial] as eth
on convert(varchar,year([PERIODO]))+'/'+(case when len(month([PERIODO]))=1 then '0'+convert(varchar,month([PERIODO])) else convert(varchar,month([PERIODO])) end)=RCP_PER
and [REGPATR]=substring(rcp_regpat,1,10)
and eth.tipoFile in ('RCV')
where 
year(fech_asig)=@ANIO
and month(fech_asig)=@MES
and year(RCP_FEC_MOV)=@ANIO
and month(RCP_FEC_MOV)=@MES
and RCP_SUB=@SUBDEL
--and eco.responsable=@RESPONSABLE
and pro.[RCP_IMP_RCV] not in ('0')
)

select 
(@MES+'/'+@ANIO) as PERIODO
,@IMP_COP as RECAUDACION_COP
,@META_MES as META
,(@IMP_COP-@META_MES) as DIFERENCIA_IMP_META
,(case when @IMP_COP&gt;=@META_MES then 'SI' else 'NO' end) as META_ALCANSADA
,(@IMP_COP/@META_MES) as EFECTIVIDAD
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
                                                                    <asp:Chart ID="Chart11" runat="server" BackColor="Transparent" 
                                                                        DataSourceID="SqlDataSourceRecaudacion" Width="750px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                                                Name="Recaudado" XValueMember="PERIODO" YValueMembers="RECAUDACION_COP"></asp:Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=Emboss" Label="#VAL{C}" Legend="Legend1" 
                                                                                Name="Meta" XValueMember="PERIODO" YValueMembers="META"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="White" Name="ChartArea1"><AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                                                    LineColor="Silver"><MajorGrid LineDashStyle="Dot" /></AxisY><AxisX><MajorGrid LineDashStyle="NotSet" /></AxisX></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="CUATRIMESTRE" runat="server">
                                                        <asp:GridView ID="GVRGIncidencias" runat="server" AllowSorting="True" 
                                                            AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                            BorderWidth="1px" Caption="RESULTADO CUATRIMESTRE POR INSPECTOR" CaptionAlign="Left" 
                                                            CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceRGIncidencias" 
                                                            ShowFooter="True">
                                                            <Columns>
                                                                <asp:BoundField DataField="RESPONSABLE" HeaderText="RESPONSABLE" 
                                                                    SortExpression="RESPONSABLE" />
                                                                <asp:TemplateField HeaderText="INCIDENCIA" SortExpression="INCIDENCIA">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" ToolTip="Detalles"  Target="_blank" rel="gb_page_fs[]"  
                                                                            NavigateUrl='<%# Eval("vurl", "../areacobros/seleccioncuatrimestre/seleccioninspectorinc.aspx{0}") %>' 
                                                                            Text='<%# Eval("INCIDENCIA") %>'></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
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
                                                            </Columns>
                                                            <FooterStyle Font-Bold="True" />
                                                            <HeaderStyle BackColor="#99CB99" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSourceRGIncidencias" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                            
                                                            
                                                            
                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @SUBDEL AS VARCHAR(2)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SELECT 
('?subdel='+@SUBDEL+'&amp;inspector='+(case when eco.responsable is null then 'vacio' else eco.responsable end)+'&amp;incidencia='+(case when eco.incidencia is null then 'vacio' else eco.incidencia end)) as vurl
,upper((case when responsable is null then 'SIN TRABAJAR' else (select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=responsable) end)) as RESPONSABLE
,&quot;INCIDENCIA&quot; = (case when eco.incidencia is null then 'SIN PAGO'
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia) end)
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE
FROM [sirecacobros].[dbo].[eco] as eco
WHERE eco.subdel = @SUBDEL
and (incidenciarale in ('31','00','01','02','27') or incidenciarale is null)
and (incidencia in ('31','0','1','2','A') or incidencia is null)
and validacion='SIN PAGO'
--and year(eco.fechaSeleccion) = @ANIO and month(eco.fechaSeleccion) = @MES
GROUP BY responsable,eco.incidencia
ORDER BY INCIDENCIA">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:GridView ID="GVRGIncidencias0" runat="server" AllowSorting="True" 
                                                            AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                            BorderWidth="1px" Caption="RESULTADO CUATRIMESTRE POR INSPECTOR Y PERIODO" 
                                                            CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                                                            DataSourceID="SqlDataSourceRGIncidenciasPeriodo" ShowFooter="True">
                                                            <Columns>
                                                                <asp:BoundField DataField="RESPONSABLE" HeaderText="RESPONSABLE" 
                                                                    SortExpression="RESPONSABLE" />
                                                                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                                                                    SortExpression="PERIODO" />
                                                                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                                                    SortExpression="INCIDENCIA">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
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
                                                            </Columns>
                                                            <FooterStyle Font-Bold="True" />
                                                            <HeaderStyle BackColor="#99CB99" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSourceRGIncidenciasPeriodo" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                            
                                                            
                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @SUBDEL AS VARCHAR(2)
SET @MES = ?
SET @ANIO = ?
SET @SUBDEL= ?
SELECT 
upper((case when responsable is null then 'SIN TRABAJAR' else (select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=responsable) end)) as RESPONSABLE
,(case len(fechaeco) 
when 5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4)
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4)
end) as PERIODO
,&quot;INCIDENCIA&quot; = (case when eco.incidencia is null then 'SIN PAGO'
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia) end)
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE
FROM [sirecacobros].[dbo].[eco] as eco
WHERE eco.subdel = @SUBDEL
and validacion='SIN PAGO'
and (incidenciarale in ('31','00','01','02','27') or incidenciarale is null)
and (incidencia in ('31','0','1','2','A') or incidencia is null)
--and year(eco.fechaSeleccion) = @ANIO and month(eco.fechaSeleccion) = @MES
GROUP BY responsable,fechaeco,eco.incidencia
ORDER BY INCIDENCIA">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </asp:WizardStep>
                                                </WizardSteps>
                                            </asp:Wizard>
                                        </asp:View>
                                        <asp:View ID="ViewRPorInspector" runat="server">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td>
                                                        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Wizard ID="Wizard2" runat="server" ActiveStepIndex="0" BackColor="#F7F6F3" 
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
                                                                            <asp:WizardStep ID="WizardStep2" runat="server" title="Inspector B">
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
                                                                                                ImageUrl="~/imagenes/usuarios/usuarioSireca.jpg" Width="150px" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DetailsView ID="DVInspector" runat="server" AutoGenerateRows="False" 
                                                                                                BorderStyle="Dashed" BorderWidth="1px" CellPadding="4" 
                                                                                                DataSourceID="SqlDataSourceInfoInspector" Font-Bold="True" Font-Size="Large" 
                                                                                                ForeColor="Black" GridLines="Horizontal" Height="50px" 
                                                                                                BorderColor="#678FB7">
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
                                                                                                <RowStyle BorderStyle="None" />
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
                                                                                            <asp:Panel ID="Panel1" runat="server">
                                                                                                <asp:Panel ID="PObservaciones" runat="server" 
                                                                                                    GroupingText="Observaciones (INSPECTOR)" ScrollBars="Auto">
                                                                                                    <asp:Panel ID="Panel9" runat="server" Height="300px" ScrollBars="Auto">
                                                                                                        <asp:Repeater ID="Repeater1" runat="server" 
                                                                                                            DataSourceID="SqlDataSourceObservacion0">
                                                                                                            <ItemTemplate>
                                                                                                                <table border="0" cellpadding="0" cellspacing="0">
                                                                                                                    <tr>
                                                                                                                        <td width="51">
                                                                                                                            <asp:ImageButton ID="ImageButton2" runat="server" BorderColor="#9BBD99" 
                                                                                                                                BorderStyle="Ridge" BorderWidth="1" Height="50" 
                                                                                                                                ImageUrl='<%# "~/imagenes/usuarios/avatar/" & Eval("idobservo") & ".jpg"%>' 
                                                                                                                                ToolTip='<%# Eval("OBSERVO")%>' Width="50" />
                                                                                                                        </td>
                                                                                                                        <td>
                                                                                                                            <asp:Panel ID="PanelObservacion" runat="server" BackColor="#A9DBA6" 
                                                                                                                                BorderStyle="None">
                                                                                                                                <table border="0">
                                                                                                                                    <tr>
                                                                                                                                        <td>
                                                                                                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("OBSERVACION")%>'></asp:Label>
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                    <tr>
                                                                                                                                        <td>
                                                                                                                                            <asp:Label ID="Label3" runat="server" Font-Italic="True" Font-Size="8" 
                                                                                                                                                ForeColor="Gray" Text='<%# "(" & Eval("FECH_OBSERVACION") & ")"%>'></asp:Label>
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                </table>
                                                                                                                            </asp:Panel>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
                                                                                                                    Enabled="True" Radius="15" TargetControlID="PanelObservacion"></asp:RoundedCornersExtender>
                                                                                                            </ItemTemplate>
                                                                                                            <SeparatorTemplate>
                                                                                                                <br />
                                                                                                            </SeparatorTemplate>
                                                                                                        </asp:Repeater>
                                                                                                    </asp:Panel>
                                                                                                    <asp:SqlDataSource ID="SqlDataSourceObservacion0" runat="server" 
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
                                                                                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" 
                                                                                                        WatermarkCssClass="watermarked" TargetControlID="TBObservacion" 
                                                                                                        WatermarkText="Escriba aqui..."></asp:TextBoxWatermarkExtender>
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
                                                                            <asp:WizardStep ID="WizardStep3" runat="server" title="Trabajo">
                                                                                <table style="width:100%;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:GridView ID="GVReporte1" runat="server" 
                                                                                                AutoGenerateColumns="False" BorderColor="#999999" BorderStyle="None" 
                                                                                                BorderWidth="1px" Caption="&lt;strong&gt;REPORTE PRINCIPAL SALDO 0&lt;/strong&gt;" 
                                                                                                CellPadding="3" 
                                                                                                DataSourceID="SqlDataSourceReporte1" AllowSorting="True" BackColor="White" 
                                                                                                Font-Bold="False" GridLines="Vertical" ShowFooter="True" 
                                                                                                CaptionAlign="Left">
                                                                                                <AlternatingRowStyle BackColor="Gainsboro" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="subdel" HeaderText="subdel" 
                                                                                                        SortExpression="subdel" />
                                                                                                    <asp:TemplateField HeaderText="TIPO_TRABAJO" SortExpression="TIPO_TRABAJO"><ItemTemplate><asp:HyperLink ID="HyperLink1" runat="server" 
                                                                                                                NavigateUrl='<%# "../informes/reporteDescriptivo.aspx?subdel=" & Eval("subdel") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=general&patrones=" & Eval("PATRONES") & "&creditos=" & Eval("CREDITOS") & "&cotizantes=" & Eval("COTIZANTES") & "&importe=" & Eval("ADEUDO") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                                                                                                                rel="gb_page_fs[]" Text='<%# Eval("TIPO_TRABAJO") %>' title="Detalles"></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Left" /></asp:TemplateField>
                                                                                                    <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink2" runat="server" 
                                                                                                                NavigateUrl='<%# "../informes/detallesSeleccion.aspx?subdel=" & Eval("subdel") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=general&tipo_estado=abcde&creditos=" & Eval("CREDITOS") & "&cotizantes=" & Eval("COTIZANTES") & "&importe=" & Eval("ADEUDO") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                                                                                                                rel="gb_page_fs[]" Text='<%# Eval("PATRONES") %>' title="Detalles"></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                                                        ReadOnly="True" SortExpression="ADEUDO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="%" DataField="ADEUDO_TOTAL" 
                                                                                                        DataFormatString="{0:P}" SortExpression="ADEUDO_TOTAL"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" Font-Italic="False" 
                                                                                                    ForeColor="Black" HorizontalAlign="Right" />
                                                                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                                                <SortedDescendingHeaderStyle BackColor="#000065" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceReporte1" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @ADEUDO_T FLOAT
SET @SUBDEL=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @ID_EJECUTOR=?
UPDATE [sirecacobros].[dbo].[ecoTiposHistorial] 
SET [TIPO_TRABAJO]=(CASE
WHEN (SELECT COUNT(*) FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth1 WHERE eth1.REGPATR=eth.REGPATR AND eth1.INC_CAP IN ('31','x'))&gt;0 THEN 'SALDO'
ELSE 'ATENDIDO' END)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as  eth 
WHERE subdel=@SUBDEL
------------------------------------------------------------------------
SET @ADEUDO_T=(select
sum(adeudo) as ADEUDO_TOTAL
FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth
where 
subdel=@SUBDEL 
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] like @ID_EJECUTOR+'%'
)
---------------------------------------------------------------------REPORTE SUBDELEGACIONAL
select subdel
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,[TIPO_TRABAJO]
,@ID_EJECUTOR as id_ejecutor
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@ADEUDO_T) as ADEUDO_TOTAL
FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth
where 
subdel=@SUBDEL 
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] like @ID_EJECUTOR+'%'
group by subdel,[TIPO_TRABAJO]
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="%" Name="?" 
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
                                                                            <asp:WizardStep ID="WizardStep4" runat="server" Title="Resultados">
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
                                                                                            <asp:GridView ID="GVReporte5" runat="server" AllowSorting="True" 
                                                                                                AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                                                                                                BorderStyle="None" BorderWidth="1px" 
                                                                                                Caption="&lt;strong&gt;REPORTE DESCRIPTIVO ATENDIDO&lt;/strong&gt;" 
                                                                                                CaptionAlign="Left" CellPadding="3" DataSourceID="SqlDataSourceReporte5" 
                                                                                                Font-Size="10pt" GridLines="Vertical" HorizontalAlign="Left">
                                                                                                <AlternatingRowStyle BackColor="Gainsboro" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="tipo_estado" HeaderText="ESTADO" ReadOnly="True" 
                                                                                                        SortExpression="tipo_estado"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:HyperLinkField DataNavigateUrlFields="subdel,fech_inicio,fech_fin,tipo_trabajo,tipo_estado,CREDITOS,COTIZANTES,ADEUDO,id_ejecutor" 
                                                                                                        DataNavigateUrlFormatString="../informes/detallesSeleccion.aspx?subdel={0}&amp;fech_inicio={1}&amp;fech_fin={2}&amp;tipo_trabajo={3}&amp;tipo_reporte=descriptivo&amp;tipo_estado={4}&amp;creditos={5}&amp;cotizantes={6}&amp;importe={7}&amp;id_ejecutor={8}" 
                                                                                                        DataTextField="PATRONES" HeaderText="PATRONES" 
                                                                                                        NavigateUrl="~/informes/detallesSeleccion.aspx" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:HyperLinkField>
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                                                        ReadOnly="True" SortExpression="ADEUDO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="PORCENTAJE" DataFormatString="{0:P2}" HeaderText="%" 
                                                                                                        SortExpression="PORCENTAJE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                                                <SortedDescendingHeaderStyle BackColor="#000065" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceReporte5" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
SET @SUBDEL=?
SET @TIPO_TRAB=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_REPORTE=?
SET @ID_EJECUTOR=?
--------------------------------------------------------------
SET @IMPORT_TOTAL=(SELECT 
sum(adeudo) as PORCENTAJE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103)
and [ID_RESPONSABLE] = @ID_EJECUTOR)
--------------------------------------------------------------
SELECT 
@SUBDEL as subdel
,@TIPO_TRAB as tipo_trabajo
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_REPORTE as tipo_reporte
,case
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
ELSE [INC_CAP]
end as tipo_estado
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,@ID_EJECUTOR as id_ejecutor
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] = @ID_EJECUTOR
group by (case 
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
else [INC_CAP]
end)
order by 1
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:Parameter DefaultValue="ATENDIDO" Name="?" />
                                                                                                    <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:Parameter DefaultValue="general" Name="?" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
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
                                                                                            <asp:GridView ID="GVReporte6" runat="server" AllowSorting="True" 
                                                                                                AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                                                                                                BorderStyle="None" BorderWidth="1px" 
                                                                                                Caption="&lt;strong&gt;REPORTE DESCRIPTIVO SALDO&lt;/strong&gt;" 
                                                                                                CaptionAlign="Left" CellPadding="3" DataSourceID="SqlDataSourceReporte6" 
                                                                                                Font-Size="10pt" GridLines="Vertical" HorizontalAlign="Left">
                                                                                                <AlternatingRowStyle BackColor="Gainsboro" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="tipo_estado" HeaderText="ESTADO" ReadOnly="True" 
                                                                                                        SortExpression="tipo_estado"><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                                                                                                    <asp:HyperLinkField DataNavigateUrlFields="subdel,fech_inicio,fech_fin,tipo_trabajo,tipo_estado,CREDITOS,COTIZANTES,ADEUDO,id_ejecutor" 
                                                                                                        DataNavigateUrlFormatString="../informes/detallesSeleccion.aspx?subdel={0}&amp;fech_inicio={1}&amp;fech_fin={2}&amp;tipo_trabajo={3}&amp;tipo_reporte=descriptivo&amp;tipo_estado={4}&amp;creditos={5}&amp;cotizantes={6}&amp;importe={7}&amp;id_ejecutor={8}" 
                                                                                                        DataTextField="PATRONES" HeaderText="PATRONES" 
                                                                                                        NavigateUrl="~/informes/detallesSeleccion.aspx" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:HyperLinkField>
                                                                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                        HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                                                        ReadOnly="True" SortExpression="ADEUDO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="PORCENTAJE" DataFormatString="{0:P2}" HeaderText="%" 
                                                                                                        SortExpression="PORCENTAJE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                                                <SortedDescendingHeaderStyle BackColor="#000065" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceReporte6" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
DECLARE @ID_EJECUTOR VARCHAR(50)
SET @SUBDEL=? 
SET @TIPO_TRAB=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_REPORTE=?
SET @ID_EJECUTOR=?
--------------------------------------------------------------------------
SET @IMPORT_TOTAL=(
SELECT sum(adeudo) as PORCENTAJE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103)
and [ID_RESPONSABLE] = @ID_EJECUTOR
)
--------------------------------------------------------------------------
SELECT 
@SUBDEL as subdel
,@TIPO_TRAB as tipo_trabajo
,@ID_EJECUTOR as id_ejecutor
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_REPORTE as tipo_reporte
,case
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
ELSE [INC_CAP]
end as tipo_estado
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] = @ID_EJECUTOR
group by (case 
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
else [INC_CAP]
end)
order by 1
">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:Parameter DefaultValue="SALDO" Name="?" />
                                                                                                    <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                                                                                                        PropertyName="SelectedValue" />
                                                                                                    <asp:Parameter DefaultValue="general" Name="?" />
                                                                                                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="999999" Name="?" 
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
                                                                            </asp:WizardStep>
                                                                            <asp:WizardStep ID="WizardStep5" runat="server" Title="Recaudación">
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
                                                                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceRecaudacion0">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                                        SortExpression="PERIODO" />
                                                                                                    <asp:BoundField DataField="RECAUDACION_COP" DataFormatString="{0:C}" 
                                                                                                        HeaderText="RECAUDACION_COP" ReadOnly="True" SortExpression="RECAUDACION_COP"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="META" DataFormatString="{0:C}" HeaderText="META" 
                                                                                                        ReadOnly="True" SortExpression="META"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="DIFERENCIA_IMP_META" DataFormatString="{0:C}" 
                                                                                                        HeaderText="DIFERENCIA_IMP_META" ReadOnly="True" 
                                                                                                        SortExpression="DIFERENCIA_IMP_META"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="META_ALCANSADA" HeaderText="META_ALCANSADA" 
                                                                                                        ReadOnly="True" SortExpression="META_ALCANSADA"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="EFECTIVIDAD" DataFormatString="{0:P}" 
                                                                                                        HeaderText="EFECTIVIDAD" ReadOnly="True" SortExpression="EFECTIVIDAD"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                    <asp:BoundField DataField="RECAUDACION_RCV" DataFormatString="{0:C}" 
                                                                                                        HeaderText="RECAUDACION_RCV" ReadOnly="True" SortExpression="RECAUDACION_RCV"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                                                </Columns>
                                                                                                <FooterStyle Font-Bold="True" />
                                                                                                <HeaderStyle BackColor="#99CB99" />
                                                                                            </asp:GridView>
                                                                                            <asp:SqlDataSource ID="SqlDataSourceRecaudacion0" runat="server" 
                                                                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                                
                                                                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @IMP_RCV as FLOAT
DECLARE @RESPONSABLE AS VARCHAR(6)
SET @ANIO=?
SET @MES=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @META_MES=(
SELECT ([meta]/num_ejecutores) as meta
FROM [sirecacobros].[dbo].[metas]
where mes=@MES and anio=@ANIO
and sub_del=@SUBDEL and [tipo_meta]='cobranza'
)
SET @IMP_COP=(select sum(pro.[RCP_IMP_COP]) as PRO_IMP_COP
FROM [procesar].[dbo].[RCPRO] as pro inner join [sirecacobros].[dbo].[ecoTiposHistorial] as eth
on convert(varchar,year([PERIODO]))+'/'+(case when len(month([PERIODO]))=1 then '0'+convert(varchar,month([PERIODO])) else convert(varchar,month([PERIODO])) end)=RCP_PER
and [REGPATR]=substring(rcp_regpat,1,10)
and eth.tipoFile in ('COP')
where 
year(fech_asig)=@ANIO
and month(fech_asig)=@MES
and year(RCP_FEC_MOV)=@ANIO
and month(RCP_FEC_MOV)=@MES
and RCP_SUB=@SUBDEL
and id_responsable=@RESPONSABLE
and pro.[RCP_IMP_COP] not in ('0')
)
SET @IMP_RCV=(select sum(pro.[RCP_IMP_RCV]) as PRO_IMP_RCV
FROM [procesar].[dbo].[RCPRO] as pro inner join [sirecacobros].[dbo].[ecoTiposHistorial] as eth
on convert(varchar,year([PERIODO]))+'/'+(case when len(month([PERIODO]))=1 then '0'+convert(varchar,month([PERIODO])) else convert(varchar,month([PERIODO])) end)=RCP_PER
and [REGPATR]=substring(rcp_regpat,1,10)
and eth.tipoFile in ('RCV')
where 
year(fech_asig)=@ANIO
and month(fech_asig)=@MES
and year(RCP_FEC_MOV)=@ANIO
and month(RCP_FEC_MOV)=@MES
and RCP_SUB=@SUBDEL
and id_responsable=@RESPONSABLE
and pro.[RCP_IMP_RCV] not in ('0')
)

select 
(@MES+'/'+@ANIO) as PERIODO
,@IMP_COP as RECAUDACION_COP
,@META_MES as META
,(@IMP_COP-@META_MES) as DIFERENCIA_IMP_META
,(case when @IMP_COP&gt;=@META_MES then 'SI' else 'NO' end) as META_ALCANSADA
,(@IMP_COP/@META_MES) as EFECTIVIDAD
,@IMP_RCV as RECAUDACION_RCV
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
                                                                                            <asp:Chart ID="Chart12" runat="server" BackColor="Transparent" 
                                                                                                DataSourceID="SqlDataSourceRecaudacion0" Width="750px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                                                Name="Recaudado" XValueMember="PERIODO" YValueMembers="RECAUDACION_COP"></asp:Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=Emboss" Label="#VAL{C}" Legend="Legend1" 
                                                                                Name="Meta" XValueMember="PERIODO" YValueMembers="META"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="White" Name="ChartArea1"><AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                                                                            LineColor="Silver"><MajorGrid LineDashStyle="Dot" /></AxisY><AxisX><MajorGrid LineDashStyle="NotSet" /></AxisX></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
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
                                            </table>
                                        </asp:View>
                                    </asp:MultiView>
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DDLSubdel" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLMes" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DDLAnio" 
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
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

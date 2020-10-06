<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="Ciclo2.aspx.vb" Inherits="WebSIRECA.Ciclo2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
<%--<script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content id="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Panel ID="PanelPrincipal" runat="server">
    <table width="100%" >
    <tr>
    <td>
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            ToolTip="SUBDELEGACION" Width="100px">
        </asp:DropDownList>
<span class="add-on">
        E.C.O.:
</span>
<asp:DropDownList ID="DDLEco" runat="server" AutoPostBack="True" 
            Width="100px">
            <asp:ListItem Value="%">TODO</asp:ListItem>
            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        REPORTE:
</span>
        <asp:DropDownList ID="DDLReporte" runat="server" AutoPostBack="True" 
            Width="120px">
            <asp:ListItem Value="0">GENERAL</asp:ListItem>
            <asp:ListItem Value="1">POR FIGURA</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECHA_INI as VARCHAR(10)
DECLARE @FECHA_FIN as VARCHAR(10)
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
select distinct valor,nombre
from
(
SELECT [AC_CP_INSPEC] as valor
,upper((SELECT fc.[nombre] FROM [fiscamovil].[dbo].[Usuarios] as fc where fc.id=[AC_CP_INSPEC])) as nombre
FROM [sirecacobros].[dbo].[CO_ACCIONES]
where [AC_SUBDEL]=@SUBDEL and [AC_CP_FECH_ASIG] between @FECHA_INI and @FECHA_FIN
union all 
SELECT [CP_INSPEC] as valor 
,upper((SELECT fc.[nombre] FROM [fiscamovil].[dbo].[Usuarios] as fc where fc.id=[CP_INSPEC])) as nombre
FROM [sirecacobros].[dbo].[CO_CPATRONAL]
where [CP_FECH_ASIG] between @FECHA_INI and @FECHA_FIN
and [CP_SUBDEL]=@SUBDEL
) as resultado
order by nombre
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
        <asp:DropDownList ID="DDLInspector" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSourceInspector" DataTextField="nombre" 
            DataValueField="valor" Visible="False">
        </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label8" runat="server" Text="ASIGNACION "></asp:Label>
</span>
        <asp:TextBox ID="TBFechIni" runat="server" 
            BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
        <asp:CalendarExtender ID="caext1" runat="server" Format="dd/MM/yyyy" 
            TargetControlID="TBFechIni">
        </asp:CalendarExtender>
<span class="add-on">
        &nbsp;AL&nbsp;
</span>
        <asp:TextBox ID="TBFechFin" runat="server" 
            BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
        <asp:CalendarExtender ID="caext2" runat="server" Format="dd/MM/yyyy" 
            TargetControlID="TBFechFin">
        </asp:CalendarExtender>
    <asp:LinkButton ID="BActualizarRGeneral" runat="server" CssClass="btn" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
    <asp:LinkButton ID="BExportar" runat="server" CssClass="btn" ToolTip="Exporta las asignaciones del la subdelegacion, tipo de archivo y rango de fechas seleccionadas" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Exportar Asignaciones</asp:LinkButton>
<span class="add-on">
        <asp:Label ID="Label24" runat="server"></asp:Label>
</span>
</div>
        </td>
    <td>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100">
                                <ProgressTemplate>
<div class="progress progress-info progress-striped active">
  <div class="bar" style="width: 70%">CARGANDO...</div>
</div>                                    
                                </ProgressTemplate>
                            </asp:UpdateProgress>
    </td>
    </tr>
    </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>               
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" 
                            style="width:100%; background-color: #678FB7;">
                            <tr>
                                <td>
                                    <asp:MultiView ID="MultiViewReportes" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="ViewRGeneral" runat="server">
                                            <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="3" BackColor="#F7F6F3" 
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
                                                                    <asp:GridView ID="GridViewGeneral" runat="server" AutoGenerateColumns="False" 
                                                                        Caption="&lt;strong&gt;GENERAL&lt;/strong&gt;" 
                                                                        DataSourceID="SqlDataSourceGeneral">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL" />
                                                                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#BCC7D8" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGeneral" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @TIPO_REP as VARCHAR(6) --general=0, por figura=1
DECLARE @TIPO_COP_RCV as VARCHAR(6)

SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN= ?
SET @TIPO_REP=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?

if @TIPO_REP='0'
begin
SET @INSPECTOR='%'
end

---------------------general
select
subdel AS SUBDEL
,count(patrones) AS PATRONES
,sum(creditos) AS CREDITOS
,sum(cotizantes) AS COTIZANTES
,sum(importe) AS IMPORTE
from
(
select
resultado.SUBDEL
,PATRONES as PATRONES
,COUNT(CREDITOS) as CREDITOS
,cotiz as COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_VIVO='SI' and RA_INC in ('01','02','31','32','43')
) as resultado left join sireca.dbo.patrones on regpat=patrones
group by resultado.SUBDEL,PATRONES,cotiz
) as resultado2
group by subdel
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLReporte" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
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
                                                                    <asp:GridView ID="GridViewTipo" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" 
                                                                        Caption="&lt;strong&gt;POR TIPO (P.A.E./CUATRIMESTRE)&lt;/strong&gt;" 
                                                                        DataSourceID="SqlDataSourceTipo">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL" />
                                                                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                SortExpression="TIPO" />
                                                                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#BCC7D8" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceTipo" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @TIPO_REP as VARCHAR(6) --general=0, por figura=1
DECLARE @TIPO_COP_RCV as VARCHAR(6)

SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN= ?
SET @TIPO_REP=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?

if @TIPO_REP='0'
begin
SET @INSPECTOR='%'
end

---------------------por cuatrimestre
select
resultado.SUBDEL
,(case when cuatrimestre_num is null then 'P.A.E.' else 'CUA. '+cuatrimestre_num end) as TIPO
,count(distinct(PATRONES)) as PATRONES
,COUNT(CREDITOS) as CREDITOS
,'...' AS COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_VIVO='SI' and RA_INC in ('01','02','31','32','43')
) as resultado
group by resultado.SUBDEL,cuatrimestre_num
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLReporte" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
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
                                                    <asp:WizardStep ID="WizardStep22" runat="server" Title="DILIGENCIA">
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
                                                                    <asp:GridView ID="GridViewGrupoDili" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" 
                                                                        Caption="&lt;strong&gt;POR DILIGENCIA&lt;/strong&gt;" 
                                                                        DataSourceID="SqlDataSourceGrupoDili" ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL" />
                                                                            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                                                                SortExpression="DILIGENCIA" />
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink1" runat="server" 
                                                                                        NavigateUrl='<%# Eval("urlv", "../areacobros/seleccioncuatrimestre/diligenciapaegeneral.aspx{0}") %>' 
                                                                                        Target="_blank" Text='<%# Eval("PATRONES") %>'></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#BCC7D8" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGrupoDili" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @TIPO_REP as VARCHAR(6) --general=0, por figura=1
DECLARE @TIPO_COP_RCV as VARCHAR(6)

SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN= ?
SET @TIPO_REP=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?

if @TIPO_REP='0'
begin
SET @INSPECTOR='%'
end
select 
*
--SUM(importe) AS PAGOS
from (
---------------------por tipo y grupo de incidencias
select
resultado.SUBDEL
,('?diligencia='+convert(varchar(6),(case when DILIGENCIA is null then 999 else DILIGENCIA end))+'&amp;subdel='+resultado.SUBDEL+'&amp;fechaini='+@FECH_INI +'&amp;fechafin='+@FECH_FIN +'&amp;reportetipo='+@TIPO_REP +'&amp;inspector='+@INSPECTOR +'&amp;tipoeco=' +@TIPO_COP_RCV) as urlv
,DILIGENCIA as DILIGENCIAV
,(case when DILIGENCIA is null then 'SALDO' else (SELECT replace(replace([desc_diligencia],'(foto)',''),'&gt; seleccione','CITATORIO') FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=DILIGENCIA) end) as DILIGENCIA
,count(distinct(PATRONES)) as PATRONES
,COUNT(CREDITOS) as CREDITOS
,'...' AS COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and RA_VIVO='SI'
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_INC in ('01','02','31','32','43')
) as resultado
group by resultado.SUBDEL,DILIGENCIA
) as resultado
WHERE DILIGENCIAV IS NULL
UNION ALL
select 
*
--SUM(importe) AS PAGOS
from (
---------------------por tipo y grupo de incidencias
select
resultado.SUBDEL
,('?diligencia='+convert(varchar(6),(case when DILIGENCIA is null then 999 else DILIGENCIA end))+'&amp;subdel='+resultado.SUBDEL+'&amp;fechaini='+@FECH_INI +'&amp;fechafin='+@FECH_FIN +'&amp;reportetipo='+@TIPO_REP +'&amp;inspector='+@INSPECTOR +'&amp;tipoeco=' +@TIPO_COP_RCV) as urlv
,DILIGENCIA as DILIGENCIAV
,(case when DILIGENCIA is null then 'SALDO' else (SELECT replace(replace([desc_diligencia],'(foto)',''),'&gt; seleccione','CITATORIO') FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=DILIGENCIA) end) as DILIGENCIA
,count(distinct(PATRONES)) as PATRONES
,COUNT(CREDITOS) as CREDITOS
,'...' AS COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_INC in ('01','02','31','32','43')
) as resultado
group by resultado.SUBDEL,DILIGENCIA
) as resultado
WHERE DILIGENCIAV IS NOT NULL
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLReporte" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
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
                                                                    <asp:GridView ID="GridViewTipoDili" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" 
                                                                        Caption="&lt;strong&gt;POR DILIGENCIA P.A.E./CUATRIMESTRE&lt;/strong&gt;" 
                                                                        DataSourceID="SqlDataSourceTipoDili">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL" />
                                                                            <asp:BoundField DataField="CUATRIMESTRE" HeaderText="CUATRIMESTRE" 
                                                                                ReadOnly="True" SortExpression="CUATRIMESTRE" />
                                                                            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                                                                SortExpression="DILIGENCIA" />
                                                                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#BCC7D8" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceTipoDili" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @TIPO_REP as VARCHAR(6) --general=0, por figura=1
DECLARE @TIPO_COP_RCV as VARCHAR(6)

SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN= ?
SET @TIPO_REP=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?


if @TIPO_REP='0'
begin
SET @INSPECTOR='%'
end
---------------------por tipo y grupo de incidencias
SELECT * FROM 
(
select
resultado.SUBDEL
,(case when cuatrimestre_num is null then 'P.A.E.' else 'CUA.'+cuatrimestre_num end) as CUATRIMESTRE
,DILIGENCIA AS DILIGENCIAV
,(case when DILIGENCIA is null then 'SALDO' else (SELECT replace(replace([desc_diligencia],'(foto)',''),'&gt; seleccione','CITATORIO') FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=DILIGENCIA) end) as DILIGENCIA
,count(distinct(PATRONES)) as PATRONES
,COUNT(CREDITOS) as CREDITOS
,'...' AS COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_VIVO='SI' and RA_INC in ('01','02','31','32','43')
) as resultado
group by resultado.SUBDEL,cuatrimestre_num,DILIGENCIA
) AS RESULTADO WHERE DILIGENCIAV IS NULL
UNION ALL
SELECT * FROM (
select
resultado.SUBDEL
,(case when cuatrimestre_num is null then 'P.A.E.' else 'CUA.'+cuatrimestre_num end) as CUATRIMESTRE
,DILIGENCIA AS DILIGENCIAV
,(case when DILIGENCIA is null then 'SALDO' else (SELECT replace(replace([desc_diligencia],'(foto)',''),'&gt; seleccione','CITATORIO') FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=DILIGENCIA) end) as DILIGENCIA
,count(distinct(PATRONES)) as PATRONES
,COUNT(CREDITOS) as CREDITOS
,'...' AS COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_INC in ('01','02','31','32','43')
) as resultado
group by resultado.SUBDEL,cuatrimestre_num,DILIGENCIA
) AS RESULTADO WHERE DILIGENCIAV IS NOT NULL
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLReporte" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
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
                                                                    <asp:GridView ID="GridViewGrupoDili0" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" Caption="&lt;strong&gt;RECAUDADO&lt;/strong&gt;" 
                                                                        DataSourceID="SqlDataSourceGrupoDili0" EmptyDataText="SIN RESULTADOS" 
                                                                        ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL" />
                                                                            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                                                                SortExpression="DILIGENCIA" />
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink2" runat="server" 
                                                                                        NavigateUrl='<%# Eval("urlv", "../areacobros/seleccioncuatrimestre/diligenciapaegeneral.aspx{0}") %>' 
                                                                                        Target="_blank" Text='<%# Eval("PATRONES") %>'></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#BCC7D8" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGrupoDili0" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @TIPO_REP as VARCHAR(6) --general=0, por figura=1
DECLARE @TIPO_COP_RCV as VARCHAR(6)

SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN= ?
SET @TIPO_REP=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?

if @TIPO_REP='0'
begin
SET @INSPECTOR='%'
end
select 
*
--SUM(importe) AS PAGOS
from (
---------------------por tipo y grupo de incidencias
select
resultado.SUBDEL
,('?diligencia='+convert(varchar(6),(case when DILIGENCIA is null then '999' else DILIGENCIA end))+'&amp;subdel='+resultado.SUBDEL+'&amp;fechaini='+@FECH_INI +'&amp;fechafin='+@FECH_FIN +'&amp;reportetipo='+@TIPO_REP +'&amp;inspector='+@INSPECTOR +'&amp;tipoeco=' +@TIPO_COP_RCV) as urlv
,DILIGENCIA as DILIGENCIAV
,(case when DILIGENCIA is null then 'SALDO' else (SELECT replace(replace([desc_diligencia],'(foto)',''),'&gt; seleccione','CITATORIO') FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=DILIGENCIA) end) as DILIGENCIA
,count(distinct(PATRONES)) as PATRONES
,COUNT(CREDITOS) as CREDITOS
,'...' AS COTIZANTES
,SUM(IMPORTE) as IMPORTE
from
(
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in ('COP','COMP','RCV','RCVCOMP')
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like @INSPECTOR
and cp_subdel=@SUBDEL
and ra_subdel=@SUBDEL
and RA_TIPO like @TIPO_COP_RCV
and [CP_FECH_ASIG] between @FECH_INI and @FECH_FIN
and RA_INC in ('01','02','31','32','43')
) as resultado
group by resultado.SUBDEL,DILIGENCIA
) as resultado
WHERE DILIGENCIAV IN ('3','5','16','24')
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLReporte" DefaultValue="0" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLEco" DefaultValue="%" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:Chart ID="Chart15" runat="server" BackColor="WhiteSmoke" 
                                                                        DataSourceID="SqlDataSourceGrupoDili0" ImageType="Jpeg" Width="750px"><Series><asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                                                CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                                                Name="Recaudado" XValueMember="DILIGENCIA" YValueMembers="IMPORTE"></asp:Series></Series><ChartAreas><asp:ChartArea BackColor="White" Name="ChartArea1"><AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                                                    LineColor="Silver"><MajorGrid LineDashStyle="Dot" /></AxisY><AxisX><MajorGrid LineDashStyle="NotSet" /></AxisX></asp:ChartArea></ChartAreas><Legends><asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50"><CellColumns><asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1"><Margins Left="15" Right="15" /></asp:LegendCellColumn><asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}"><Margins Left="15" Right="15" /></asp:LegendCellColumn></CellColumns></asp:Legend></Legends></asp:Chart>
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
                                                    <asp:WizardStep ID="CUATRIMESTRE" runat="server">
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
and cuatrimestre_ciclo=2
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by cuatrimestre_num
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
<span class="add-on">
                                                                    <asp:CheckBox ID="CBDel" runat="server" AutoPostBack="True" 
                                                                        Text="Ver Delegacional" CssClass="checkbox inline" />
</span>
                                                                    <asp:HiddenField ID="HiddenFieldDel" runat="server" />
</div><br /><br />
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
                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                HeaderText="%CREDITO" SortExpression="T_CREDITO" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                HeaderText="%COTIZANTE" SortExpression="T_COTIZ" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                    HeaderText="%IMPORTE" SortExpression="T_IMPORTE" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
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
                                                                </td>
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
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink4" runat="server" 
                                                                                        Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink></ItemTemplate><ControlStyle Font-Underline="False" /><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                HeaderText="%CREDITO" SortExpression="T_CREDITO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                HeaderText="%COTIZANTE" SortExpression="T_COTIZ"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                HeaderText="%IMPORTE" SortExpression="T_IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
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
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink1" runat="server" 
                                                                                        NavigateUrl='<%# "../areacobros/seleccioncuatrimestre/saldo.aspx?periodo=" & Eval("PERIODO") & "&subdel=" & Eval("SUBDEL") & "&tipoeco=" & Eval("TIPOECO") & "&cuatrimestre=" & Eval("CUATRIMESTRE")%>' 
                                                                                        Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink></ItemTemplate><ControlStyle Font-Underline="False" /><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                HeaderText="%CREDITO" SortExpression="T_CREDITO" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                HeaderText="%COTIZANTE" SortExpression="T_COTIZ" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                HeaderText="%IMPORTE" SortExpression="T_IMPORTE" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
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
                                                                        CaptionAlign="Left" Font-Bold="False">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL_NOM" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL_NOM" />
                                                                            <asp:BoundField DataField="PERIODO_NOM" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO_NOM" />
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES"><ItemTemplate><asp:HyperLink ID="HyperLink3" runat="server" 
                                                                                        NavigateUrl='<%# "../areacobros/seleccioncuatrimestre/saldoimpedimentodecobro.aspx?periodo=" & Eval("PERIODO") & "&subdel=" & Eval("SUBDEL") & "&tipoeco=" & Eval("TIPOECO") & "&cuatrimestre=" & Eval("CUATRIMESTRE")%>' 
                                                                                        Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink></ItemTemplate><ControlStyle Font-Underline="False" /><ItemStyle HorizontalAlign="Right" /></asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_CREDITO" DataFormatString="{0:P}" 
                                                                                HeaderText="%CREDITO" SortExpression="T_CREDITO" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_COTIZ" DataFormatString="{0:P}" 
                                                                                HeaderText="%COTIZANTE" SortExpression="T_COTIZ" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="T_IMPORTE" DataFormatString="{0:P}" 
                                                                                HeaderText="%IMPORTE" SortExpression="T_IMPORTE" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
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
                                                    <asp:WizardStep runat="server" Title="RECIBO PROVI.">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TBRegpat" runat="server" BorderStyle="Solid" 
                                                                        BorderWidth="1px" MaxLength="30" Width="460px"></asp:TextBox>
                                                                    <asp:TextBoxWatermarkExtender ID="TBE1" runat="server" Enabled="True" 
                                                                        TargetControlID="TBRegpat" WatermarkCssClass="watermarked" 
                                                                        WatermarkText="REG./ RAZON/ N°RESIVO/ FECHA DE RECIVO dd/mm/aaaa">
                                                                    </asp:TextBoxWatermarkExtender>
                                                                    &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" Height="20px" 
                                                                        ImageAlign="AbsBottom" ImageUrl="~/imagenes/sitios/buscar.png" />
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
                                                                    <asp:SqlDataSource ID="SqlDataSourceResivos" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @BUSCADOR AS VARCHAR(100)
SET @BUSCADOR=?
SELECT 
[PA_SUBDEL]
,RA_REGPATR AS REGPAT
,RAZONSOCIAL AS RAZON
,[PA_PAGO] AS PAGO
,[PA_RECIBO_PROVI] AS RESIVO_PROVICIONAL
,[PA_FECH_RECIBO_PROVI] AS FECHA_RESIVO
,RA_NUMCRED AS CREDITO
,SUBSTRING(RA_PERIODO,4,7) AS PERIODO
FROM [sirecacobros].[dbo].[CO_PAGOS] 
INNER JOIN [sirecacobros].[dbo].[CO_RALE] 
ON RA_FOLIO_PAG=[PA_RA_FOLIO_PAG]
LEFT JOIN SIRECA.DBO.PATRONES ON REGPAT=RA_REGPATR
WHERE ([PA_RA_FOLIO_PAG] LIKE @BUSCADOR+'%' OR [PA_RECIBO_PROVI] LIKE @BUSCADOR+'%' or convert(nvarchar(10),[PA_FECH_RECIBO_PROVI],103) LIKE '%'+@BUSCADOR or RAZONSOCIAL like '%'+@BUSCADOR+'%')

">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="TBRegpat" Name="?" PropertyName="Text" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:GridView ID="GridViewResivos" runat="server" AllowPaging="True" 
                                                                        AutoGenerateColumns="False" DataSourceID="SqlDataSourceResivos" 
                                                                        EmptyDataText="SIN RESULTADOS" PageSize="20">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="PA_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="PA_SUBDEL"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                                                            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                                                                                SortExpression="REGPAT" />
                                                                            <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                                                                                SortExpression="RAZON" />
                                                                            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                                                                                ReadOnly="True" SortExpression="PAGO"><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                                            <asp:BoundField DataField="RESIVO_PROVICIONAL" HeaderText="RESIVO_PROVICIONAL" 
                                                                                ReadOnly="True" SortExpression="RESIVO_PROVICIONAL" />
                                                                            <asp:BoundField DataField="FECHA_RESIVO" DataFormatString="{0:d}" 
                                                                                HeaderText="FECHA_RESIVO" ReadOnly="True" SortExpression="FECHA_RESIVO" />
                                                                            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                                                                                SortExpression="CREDITO" />
                                                                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                SortExpression="PERIODO" />
                                                                        </Columns>
                                                                        <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
                                                                    </asp:GridView>
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
                                        </asp:View>
                                        <asp:View ID="ViewRPorInspector" runat="server">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
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
                                                                                                BorderColor="#678FB7" BorderStyle="Dashed" BorderWidth="1px" CellPadding="4" 
                                                                                                DataSourceID="SqlDataSourceInfoInspector" Font-Bold="True" Font-Size="Large" 
                                                                                                ForeColor="Black" GridLines="Horizontal" Height="50px">
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
                                                                                                    <asp:BoundField DataField="ANTIGUEDAD" DataFormatString="{0} AÑOS" 
                                                                                                        HeaderText="ANTIGUEDAD:" ReadOnly="True" SortExpression="ANTIGUEDAD"><ItemStyle Font-Bold="False" Font-Italic="True" /></asp:BoundField>
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
                                                                                                                    Enabled="True" Radius="15" TargetControlID="PanelObservacion">
                                                                                                                </asp:RoundedCornersExtender>
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
                                                                                                    <asp:TextBox ID="TBObservacion" runat="server" BorderColor="#BCC7D8" 
                                                                                                        BorderStyle="Solid" BorderWidth="1px" MaxLength="254" Width="424px"></asp:TextBox>
                                                                                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" 
                                                                                                        TargetControlID="TBObservacion" WatermarkCssClass="watermarked" 
                                                                                                        WatermarkText="Escriba aqui...">
                                                                                                    </asp:TextBoxWatermarkExtender>
                                                                                                    <asp:Button ID="BComentar" runat="server" BorderColor="#BCC7D8" 
                                                                                                        BorderStyle="Solid" BorderWidth="1px" Text="Comentar" />
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
                                                                        </WizardSteps>
                                                                    </asp:Wizard>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                    </asp:MultiView>
                                </td>
                            </tr>                           
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DDLSubdel" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DDLSubdel" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default44" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="btn-group input-prepend" >
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" CssClass="btn dropdown-toggle btn-small" Width="180px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="TIPO"></asp:Label>
</span>
        <asp:DropDownList ID="DropDownTipo" runat="server" AutoPostBack="True" 
        Width="100px">
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
            <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="RALE"></asp:Label>
</span> 
        <asp:DropDownList ID="DropDownRale" runat="server" 
            DataSourceID="SqlDataSourceRALES" DataTextField="texto" 
        DataValueField="valor" AutoPostBack="True" Width="150px">
        </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label3" runat="server" Text="ALTA DEL CREDITO"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLAltaCredito" runat="server" 
            DataSourceID="SqlDataSourceAlta" DataTextField="valor" 
        DataValueField="valor" AutoPostBack="True" Width="100px">
        </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceAlta" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="exec('
SELECT distinct(year([FALTA])) as valor
FROM [rale].[dbo].['+?+']
order by 1 desc
')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownRale" DefaultValue="abcde" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
<span class="add-on">
    <asp:LinkButton ID="LBBuscador" runat="server" CssClass="btn" BackColor="#BCC7D8">Actualizar</asp:LinkButton>
</span> 
<span class="add-on">
<asp:LinkButton CssClass="btn" ID="LBSearch" runat="server" BackColor="#BCC7D8"><i class="icon-search"></i></asp:LinkButton>
        </span>
                            <asp:SqlDataSource ID="SqlDataSourceRales" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 20 REPLACE(replace([name],'01A','33A'),'ARCV','ACOP') as valor
,convert(nvarchar,[fecha],103) as texto
,count(*) as totales
FROM [rale].[dbo].[tablas]
GROUP BY REPLACE(replace([name],'01A','33A'),'ARCV','ACOP'),[fecha]
having count(*)=4
order by fecha desc
">
                            </asp:SqlDataSource>
</div> 
    <asp:GridView ID="GridViewResult" runat="server" AutoGenerateColumns="False" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" 
        CellSpacing="1" CssClass="table-bordered" DataSourceID="SqlDataSourceResult" 
        HorizontalAlign="Center" ShowFooter="True" 
        Caption="&lt;strong&gt;CREDITOS DIGITALIZADOS QUE SIGUEN EN LA CARTERA&lt;/strong&gt;">
        <Columns>
            <asp:BoundField DataField="DIGITALIZADO" HeaderText="DIGITALIZADO" 
                ReadOnly="True" SortExpression="DIGITALIZADO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                SortExpression="PATRONES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='<%# Eval("CREDITOS", "{0:N0}") %>' runat="server" PostBackUrl='<%# "detallesdigitalizado.aspx?" & Eval("vurl") & "&tipo=" & Request.QueryString("tipo").ToString %>'>
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="%CREDITO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="%IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    &nbsp;&nbsp;&nbsp;
    <asp:SqlDataSource ID="SqlDataSourceResult" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALE1 as VARCHAR(50)
DECLARE @RALE2 as VARCHAR(50)
DECLARE @RALE_RCV1 as VARCHAR(50)
DECLARE @RALE_RCV2 as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(50)
DECLARE @ANIO_ADD as VARCHAR(50)
DECLARE @ANIO_ALTA as VARCHAR(50)
--inicio de carga de variables
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @RALE1=?
SET @ANIO_ALTA=?
--fin de carga de variables

SET @ANIO_ADD=''
if @ANIO_ALTA&lt;&gt;'%'
begin
	SET @ANIO_ADD='and year(FALTA)='+@ANIO_ALTA
end

SET @RALE2=replace(@RALE1,'33A','01A')
SET @RALE_RCV1=REPLACE(@RALE1,'ACOP','ARCV')
SET @RALE_RCV2=REPLACE(@RALE2,'ACOP','ARCV')

if @RALE1='x' or @RALE2='x'
begin
select '' AS DIGITALIZADO,'' as PATRONES,'' as CREDITOS,'' as IMPORTE
end
else
begin
exec('
SELECT 
(''alta='+@ANIO_ALTA+'&amp;subdel='+@SUBDEL+'&amp;tipocoprcv='+@TIPO_COP_RCV+'&amp;rale='+@RALE1+'&amp;digi=''+DIGITALIZADO) as vurl
,DIGITALIZADO
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,sum([IMPORTE]) as IMPORTE
 FROM (
select
SUBDEL,TIPO,INC,REGPATR,NUMCRED,IMPORTE
,(CASE WHEN DIG_TIPO IS NULL THEN ''NO'' ELSE ''SI'' END) AS DIGITALIZADO
from (
SELECT
''33'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE1+'] 
where inc not in (''00'')
'+@ANIO_ADD+'
union all
SELECT
''01'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE2+'] 
where inc not in (''00'')
'+@ANIO_ADD+'
UNION ALL
SELECT
''33'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE_RCV1+'] 
where inc not in (''00'')
'+@ANIO_ADD+'
union all
SELECT
''01'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
FROM [rale].[dbo].['+@RALE_RCV2+'] 
where inc not in (''00'')
'+@ANIO_ADD+'
) as resultado 
left join [sireca].[dbo].[CD_DIGITALIZADO] 
on [DIG_REGPAT]=REPLACE(REGPATR,''-'','''') and [DIG_CREDITO]=NUMCRED
WHERE TIPO LIKE '''+@TIPO_COP_RCV+'''
AND SUBDEL LIKE '''+@SUBDEL+'''
) AS resultado2
group by DIGITALIZADO
ORDER BY DIGITALIZADO DESC
')
end
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownTipo" DefaultValue="COP" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownRale" DefaultValue="abcdef" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAltaCredito" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>


<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBSearch" PopupControlID="PanelMenu" DropShadow="true" CancelControlID="LBCerrarMenu" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelMenu" runat="server" Height="260px" Width="680px" 
        Font-Size="11pt" CssClass="btn-danger" >
	<asp:Panel ID="PanelHeaderMenu" runat="server" HorizontalAlign="Right" Font-Strikeout="False" Font-Underline="False">
	<asp:LinkButton ID="LBCerrarMenu" runat="server" Font-Underline="False" 
            ForeColor="White">cerrar&nbsp;&nbsp;</asp:LinkButton>
	</asp:Panel>
<asp:UpdateProgress ID="UpdateProgressBuscador" runat="server" AssociatedUpdatePanelID="UpdatePanelBuscador">
    <ProgressTemplate>BUSCANDO...</ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanelBuscador" runat="server" UpdateMode="Conditional">
<ContentTemplate >

<div class="btn-group input-prepend">
<asp:TextBox ID="TBBuscador" runat="server"></asp:TextBox>
<span class="add-on">
        <asp:LinkButton CssClass="btn" ID="LBBuscar" runat="server" BackColor="#BCC7D8">BUSCAR</asp:LinkButton>
</span>
</div>
<asp:GridView ID="GridViewBusqueda" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceBusqueda" HorizontalAlign="Center" PageSize="5" 
            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" 
            CellSpacing="1" CssClass="table-bordered" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" />
                <asp:TemplateField HeaderText="ARCHIVO" SortExpression="ARCHIVO">
                    <ItemTemplate>
                        
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle ForeColor="White" />
            <PagerSettings PageButtonCount="30" Position="TopAndBottom" />
            <PagerStyle Font-Size="10pt" ForeColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceBusqueda" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @BUSCAR AS VARCHAR(50)
SET @BUSCAR=?
SELECT TOP 100
[DIG_SUBDEL] as SUBDEL
,[DIG_REGPAT] AS REGPAT
,razonSocial as RAZON
,[DIG_CREDITO] AS CREDITO
,SUBSTRING(CONVERT(NVARCHAR(10),[DIG_PERIODO],103),4,7) AS PERIODO
,[DIG_TIPO] AS TIPO
,(
CASE WHEN (SELECT [DIGD_FILE] FROM [sireca].[dbo].[CD_DIGITALIZADO_DOC] WHERE [DIGD_DIG_ID]=[DIG_ID]) IS NULL THEN '0'
ELSE
(SELECT [DIGD_FILE] FROM [sireca].[dbo].[CD_DIGITALIZADO_DOC] WHERE [DIGD_DIG_ID]=[DIG_ID]) 
END
)AS ARCHIVO
FROM [sireca].[dbo].[CD_DIGITALIZADO] LEFT JOIN sireca.dbo.patrones on regpat=[DIG_REGPAT]
WHERE ([DIG_REGPAT] like '%'+@BUSCAR+'%' or [DIG_CREDITO] like '%'+@BUSCAR+'%' or razonSocial like '%'+@BUSCAR+'%')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBBuscador" DefaultValue="abcdefg" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>
<asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelMenu"></asp:RoundedCornersExtender>

</asp:Content>

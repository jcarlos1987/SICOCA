<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="reporte.aspx.vb" Inherits="WebSIRECA.reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="btn-group input-prepend">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="130px" CssClass="btn dropdown-toggle">
                            </asp:DropDownList>
    <asp:DropDownList ID="DDLBase" runat="server" DataSourceID="SqlDataSourceBase" DataTextField="texto" 
                                DataValueField="valor" Width="400px" AutoPostBack="True">
    </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBase" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(2)
SET @SUBDEL=?

if @SUBDEL='%'
begin
exec('
select texto,valor from (
select top 50 ''BASE DEL PERIODO ''+(substring(name,7,2)+''/''+substring(name,9,4))+'' CREADO ''+(substring(name,14,2)+''/''+substring(name,16,2)+''/''+substring(name,18,4)) as texto,''C_BC00''+substring(name,7,15) as valor 
from sireca.dbo.sysobjects 
where name like ''C_BC'+@SUBDEL+'%'' order by crdate
) as resultado
group by texto,valor
')
end
else
begin
exec('
select top 50 ''BASE DEL PERIODO ''+(substring(name,7,2)+''/''+substring(name,9,4))+'' CREADO ''+(substring(name,14,2)+''/''+substring(name,16,2)+''/''+substring(name,18,4)) as texto,name as valor 
from sireca.dbo.sysobjects 
where name like ''C_BC'+@SUBDEL+'%'' order by crdate
')
end
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
<asp:LinkButton ID="BActualizarRGeneral" CssClass="btn" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px">Exporta</asp:LinkButton>
</div> 
    <asp:GridView ID="GridViewRep0" runat="server" 
    DataSourceID="SqlDataSource0" AutoGenerateColumns="False" 
    HorizontalAlign="Center" Caption="&lt;strong&gt;BASE INICIAL&lt;/strong&gt;" 
        Width="500px">
        <Columns>
            <asp:BoundField DataField="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
            <asp:BoundField DataField="REGPAT" DataFormatString="{0:N0}" 
                HeaderText="REGPAT" ReadOnly="True" SortExpression="REGPAT">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server"
                        Text='<%# Eval("CREDITOS","{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle ForeColor="#4095D2" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @CONSULTA AS VARCHAR(900)
DECLARE @TBASE1 AS VARCHAR(30)
DECLARE @TBASE2 AS VARCHAR(30)
SET @SUBDEL =?
SET @TBASE1=?
if @SUBDEL='%'
begin
	SET @TBASE2=replace(@TBASE1,'C_BC00','C_BC33')
	SET @TBASE1=replace(@TBASE1,'C_BC00','C_BC01')
end
SET @CONSULTA='
select ''TOTAL'' AS DILIGENCIA,count(DISTINCT(REG_PATRONAL)) as REGPAT,COUNT(CREDITO) AS CREDITOS,SUM(IMPORTE) AS IMPORTE
FROM (
SELECT [REG_PATRONAL]
,[TD]
,[INC]
,[CREDITO]
,[PERIODO]
,[IMPORTE]
,[RAZON_SOCIAL]
,[COTIZANTES]
,[SECTOR]
,''...'' as [DILIGENCIA]
,''...'' as [FECH_DILIGENCIA]
FROM [sireca].[dbo].['+@TBASE1+'] '
if @SUBDEL='%'
begin
SET @CONSULTA = @CONSULTA + 'union all
SELECT [REG_PATRONAL]
,[TD]
,[INC]
,[CREDITO]
,[PERIODO]
,[IMPORTE]
,[RAZON_SOCIAL]
,[COTIZANTES]
,[SECTOR]
,''...'' as [DILIGENCIA]
,''...'' as [FECH_DILIGENCIA]
FROM [sireca].[dbo].['+@TBASE2+']
'
end
SET @CONSULTA = @CONSULTA + ') AS RESULT
group by DILIGENCIA '
exec(@CONSULTA)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLBase" DefaultValue="xxxx" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridViewRep" runat="server" 
    DataSourceID="SqlDataSourceRep" AllowSorting="True" AutoGenerateColumns="False" 
    HorizontalAlign="Center" ShowFooter="True" 
        Caption="&lt;strong&gt;AVANCE DE LA BASE INICIAL&lt;/strong&gt;" 
        Width="600px">
        <Columns>
            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
            <asp:BoundField DataField="REGPAT" DataFormatString="{0:N0}" 
                HeaderText="REGPAT" ReadOnly="True" SortExpression="REGPAT">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl='<%# "~/sinpago/reportedetalles.aspx?subdel=" & DDLSubdel.SelectedValue & "&base=" & DDLBase.SelectedValue & "&dili=" & Eval("DILIGENCIA") %>' Text='<%# Eval("CREDITOS","{0:N0}") %>'>LinkButton</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="%CREDITOS" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="%IMPORTE" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle ForeColor="#5A95D2" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRep" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TBASE AS VARCHAR(300)
DECLARE @RALECOP01 AS VARCHAR(15)
DECLARE @RALECOP33 AS VARCHAR(15)
DECLARE @EMAPERIODO AS VARCHAR(4)
DECLARE @ADD_RALECOP AS VARCHAR(400)
SET @SUBDEL =?
SET @TBASE='select * from [sireca].[dbo].['+?+']'
SET @EMAPERIODO=substring(@TBASE,37,2)+substring(@TBASE,41,2)
SET @EMAPERIODO=substring(@TBASE,37,2)+substring(@TBASE,41,2)
SET @RALECOP01 = (select top 1 name from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (select top 1 name from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
if @SUBDEL='%'
begin
	SET @TBASE = replace(@TBASE,'C_BC00','C_BC01') +' union all ' +replace(@TBASE,'C_BC00','C_BC33')
	SET @ADD_RALECOP = ' select ''01'' as rsubdel, * from rale.dbo.['+@RALECOP01+'] as rx
where rx.td in (''02'',''01'')
union all 
select ''33'' as rsubdel, * from rale.dbo.['+@RALECOP33+'] as rx
where rx.td in (''02'',''01'') '
end
else
begin
	if  @SUBDEL='01' 
	begin
		SET @ADD_RALECOP = ' select '''+@SUBDEL+''' as rsubdel, * from rale.dbo.['+@RALECOP01+'] as rx where rx.td in (''02'',''01'') '
	end
	else
	begin
		SET @ADD_RALECOP = ' select '''+@SUBDEL+''' as rsubdel, * from rale.dbo.['+@RALECOP33+'] as rx where rx.td in (''02'',''01'') '
	end
end

exec('
select (CASE WHEN DILIGENCIA IS NULL THEN ''SIN ACTUALIZACION'' ELSE DILIGENCIA END) AS DILIGENCIA,count(DISTINCT(REG_PATRONAL)) as REGPAT,COUNT(CREDITO) AS CREDITOS,SUM(IMPORTE) AS IMPORTE
FROM (
SELECT base.[REG_PATRONAL]
,base.[TD]
,base.[INC]
,base.[CREDITO]
,base.[PERIODO]
,base.[IMPORTE]
,base.[RAZON_SOCIAL]
,base.[COTIZANTES]
,base.[SECTOR]
,(
case 
when rale.inc is null 
then ''DEPURADO RALE''
when exists(
	SELECT [EMIP_PATRON]
	FROM [sireca].[dbo].[EMMA3301'+@EMAPERIODO+']
	where substring([EMIP_PATRON],2,11)=REG_PATRONAL
	and pagos is not null
) then ''PAGADO''
when exists(
	SELECT [EMIP_PATRON]
	FROM [sireca].[dbo].[EMMA3333'+@EMAPERIODO+']
	where substring([EMIP_PATRON],2,11)=REG_PATRONAL
	and pagos is not null
) then ''PAGADO''
/*when EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO]
WHERE [RCP_IMP_COP]&gt;0 --and RCP_SUB like '''+@SUBDEL+'''
AND [RCP_REGPAT]=base.REG_PATRONAL and (''01/''+substring([RCP_PER],6,2)+''/''+substring([RCP_PER],1,4))=base.PERIODO
) then ''PAGADO''*/
when base.inc=rale.inc 
then 
(
	SELECT TOP 1 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[SP_DILI])
	FROM [sireca].[dbo].[C_SIN_PAGO]
	WHERE substring([SP_REGPAT],1,10)=substring(base.REG_PATRONAL,1,10)
	AND [SP_CREDITO]= base.CREDITO
	AND [SP_PERIODO]=base.PERIODO
	ORDER BY [SP_FECH_DILI] DESC
)
when rale.inc=''25''
then ''SIPARE''
else 
	(SELECT inr.[descripcion] FROM [sireca].[dbo].[inc_rale] as inr WHERE inr.[inc]=rale.[INC])
end
) as [DILIGENCIA]
,(
case when base.inc=rale.inc 
then 
(
	SELECT TOP 1 SP_FECH_DILI
	FROM [sireca].[dbo].[C_SIN_PAGO]
	WHERE substring([SP_REGPAT],1,10)=substring(base.REG_PATRONAL,1,10)
	AND [SP_CREDITO]= base.CREDITO
	AND [SP_PERIODO]=base.PERIODO
	ORDER BY [SP_FECH_DILI] DESC
)
end
) as [FECH_DILIGENCIA]
FROM ('+@TBASE+') as base
left join
(
'+@ADD_RALECOP+'
) as rale
on 
replace([REGPATR],''-'','''')=substring(REG_PATRONAL,1,10) 
and rale.[PERIODO]=base.PERIODO 
and rsubdel like '''+@SUBDEL+'''
) AS RESULT
WHERE RESULT.DILIGENCIA IN (''DEPURADO RALE'',''PAGADO'',''SIPARE'') 
GROUP BY DILIGENCIA
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLBase" DefaultValue="x" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewRep1" runat="server" 
    DataSourceID="SqlDataSourceRep0" AllowSorting="True" AutoGenerateColumns="False" 
    HorizontalAlign="Center" ShowFooter="True" 
        Caption="&lt;strong&gt;SALDO DE LA BASE INICIAL&lt;/strong&gt;" 
        Width="600px">
        <Columns>
            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
            <asp:BoundField DataField="REGPAT" DataFormatString="{0:N0}" 
                HeaderText="REGPAT" ReadOnly="True" SortExpression="REGPAT">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("CREDITOS","{0:N0}") %>' PostBackUrl='<%# "~/sinpago/reportedetalles.aspx?subdel=" & DDLSubdel.SelectedValue & "&base=" & DDLBase.SelectedValue & "&dili=" & Eval("DILIGENCIA") %>'>LinkButton</asp:LinkButton>          
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="%CREDITOS" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="%IMPORTE" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle ForeColor="#5A95D2" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRep0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TBASE AS VARCHAR(300)
DECLARE @RALECOP01 AS VARCHAR(15)
DECLARE @RALECOP33 AS VARCHAR(15)
DECLARE @EMAPERIODO AS VARCHAR(4)
DECLARE @ADD_RALECOP AS VARCHAR(400)
SET @SUBDEL =?
SET @TBASE='select * from [sireca].[dbo].['+?+']'
SET @EMAPERIODO=substring(@TBASE,37,2)+substring(@TBASE,41,2)
SET @RALECOP01 = (select top 1 name from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (select top 1 name from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
if @SUBDEL='%'
begin
	SET @TBASE = replace(@TBASE,'C_BC00','C_BC01') +' union all ' +replace(@TBASE,'C_BC00','C_BC33')
	SET @ADD_RALECOP = ' select ''01'' as rsubdel, * from rale.dbo.['+@RALECOP01+'] as rx
where rx.td in (''02'',''01'')
union all 
select ''33'' as rsubdel, * from rale.dbo.['+@RALECOP33+'] as rx
where rx.td in (''02'',''01'') '
end
else
begin
	if  @SUBDEL='01' 
	begin
		SET @ADD_RALECOP = ' select '''+@SUBDEL+''' as rsubdel, * from rale.dbo.['+@RALECOP01+'] as rx where rx.td in (''02'',''01'') '
	end
	else
	begin
		SET @ADD_RALECOP = ' select '''+@SUBDEL+''' as rsubdel, * from rale.dbo.['+@RALECOP33+'] as rx where rx.td in (''02'',''01'') '
	end
end

exec('
select (CASE WHEN DILIGENCIA IS NULL THEN ''SIN ACTUALIZACION'' ELSE DILIGENCIA END) AS DILIGENCIA,count(DISTINCT(REG_PATRONAL)) as REGPAT,COUNT(CREDITO) AS CREDITOS,SUM(IMPORTE) AS IMPORTE
FROM (
SELECT base.[REG_PATRONAL]
,base.[TD]
,base.[INC]
,base.[CREDITO]
,base.[PERIODO]
,base.[IMPORTE]
,base.[RAZON_SOCIAL]
,base.[COTIZANTES]
,base.[SECTOR]
,(
case 
when rale.inc is null 
then ''DEPURADO RALE''
when exists(
	SELECT [EMIP_PATRON]
	FROM [sireca].[dbo].[EMMA3301'+@EMAPERIODO+']
	where substring([EMIP_PATRON],2,11)=REG_PATRONAL
	and pagos is not null
) then ''PAGADO''
when exists(
	SELECT [EMIP_PATRON]
	FROM [sireca].[dbo].[EMMA3333'+@EMAPERIODO+']
	where substring([EMIP_PATRON],2,11)=REG_PATRONAL
	and pagos is not null
) then ''PAGADO''
/*when EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO]
WHERE [RCP_IMP_COP]&gt;0 --and RCP_SUB like '''+@SUBDEL+'''
AND [RCP_REGPAT]=base.REG_PATRONAL and (''01/''+substring([RCP_PER],6,2)+''/''+substring([RCP_PER],1,4))=base.PERIODO
) then ''PAGADO''*/
when base.inc=rale.inc 
then 
(
	SELECT TOP 1 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[SP_DILI])
	FROM [sireca].[dbo].[C_SIN_PAGO]
	WHERE substring([SP_REGPAT],1,10)=substring(base.REG_PATRONAL,1,10)
	AND [SP_CREDITO]= base.CREDITO
	AND [SP_PERIODO]=base.PERIODO
	ORDER BY [SP_FECH_DILI] DESC
)
when rale.inc=''25''
then ''SIPARE''
else 
	(SELECT inr.[descripcion] FROM [sireca].[dbo].[inc_rale] as inr WHERE inr.[inc]=rale.[INC])
end
) as [DILIGENCIA]
,(
case when base.inc=rale.inc 
then 
(
	SELECT TOP 1 SP_FECH_DILI
	FROM [sireca].[dbo].[C_SIN_PAGO]
	WHERE substring([SP_REGPAT],1,10)=substring(base.REG_PATRONAL,1,10)
	AND [SP_CREDITO]= base.CREDITO
	AND [SP_PERIODO]=base.PERIODO
	ORDER BY [SP_FECH_DILI] DESC
)
end
) as [FECH_DILIGENCIA]
FROM ('+@TBASE+') as base
left join
('+@ADD_RALECOP+') as rale
on 
replace([REGPATR],''-'','''')=substring(REG_PATRONAL,1,10) 
and rale.[PERIODO]=base.PERIODO 
and rsubdel like '''+@SUBDEL+'''
) AS RESULT
WHERE (RESULT.DILIGENCIA NOT IN (''DEPURADO RALE'',''PAGADO'',''SIPARE'') or RESULT.DILIGENCIA is null)
GROUP BY DILIGENCIA
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLBase" DefaultValue="x" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="paeemisioncobrosinfo.aspx.vb" Inherits="WebSIRECA.paeemisioncobrosinfo" %>

<asp:Content ID ="Contend1" runat ="server" ContentPlaceHolderID ="head" >
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
                        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSourceRaleUtilizado" ShowHeader="False">
                            <Columns>
                                <asp:BoundField DataField="RALE" DataFormatString="R.A.L.E. C.O.P. del {0:D}" />
                                <asp:BoundField DataField="RALERCV" 
                                    DataFormatString="R.A.L.E. R.C.V. del {0:D}" HeaderText="RALERCV" 
                                    SortExpression="RALERCV" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceRaleUtilizado" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as DATETIME
DECLARE @RALERCV as DATETIME
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @RALECOP=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SELECT @RALECOP as RALE,@RALERCV as RALERCV">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <asp:DropDownList ID="DDLSubdel" runat="server" Width="210px" 
                        AutoPostBack="True">
                        </asp:DropDownList>
                    AREA:<asp:DropDownList ID="DDLArea" runat="server">
                            <asp:ListItem>EMISION</asp:ListItem>
                            <asp:ListItem>COBROS</asp:ListItem>
        </asp:DropDownList>
                        TIPO<asp:DropDownList ID="DDLTipo" runat="server">
                            <asp:ListItem Value="%">TODOS</asp:ListItem>
                            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
        </asp:DropDownList>
                                    INCIDENCIAS<asp:DropDownList ID="DDLInc" runat="server">
    <asp:ListItem>31</asp:ListItem>
    <asp:ListItem Value="31_32">31 y 32</asp:ListItem>
                    </asp:DropDownList>
                                    <asp:LinkButton ID="BLActualizar" runat="server" BackColor="#F0F0F0" 
                                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Width="100px">&nbsp;&nbsp;&nbsp;&nbsp;Actualizar</asp:LinkButton>
                            <hr />
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                &nbsp;
            <asp:SqlDataSource ID="SqlDataSourceMunicipio" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @AREA AS VARCHAR(7)
DECLARE @INSPECTOR AS VARCHAR(15)
DECLARE @INCIDENCIASX AS VARCHAR(50)
DECLARE @INCIDENCIAS_COBRAR AS VARCHAR(50)
DECLARE @FECH_CUTRIMESTRE1 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE2 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE3 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE4 AS VARCHAR(10)
DECLARE @TIPO_ECO AS VARCHAR(3)

SET @SUBDEL=?
-- @AREA = [ EMISION | COBROS ]
SET @AREA=?
SET @TIPO_ECO=?

SET @INCIDENCIASX=?
IF @INCIDENCIASX='31'
BEGIN
SET @INCIDENCIAS_COBRAR='''31'''
END
ELSE
BEGIN
SET @INCIDENCIAS_COBRAR='''31'',''32'''
END
-- @INSPECTOR es DISPONIBLES,TODOS,NUMERO es la instruccion is null
SET @INSPECTOR='TODOS'
SET @FECH_CUTRIMESTRE1=(
select top 1
(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end)
as fechaecox
from sireca.dbo.eco
where tipoeco in ('COP','RCV','COMP','RCVCOMP')
order by convert(datetime,(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end),103) desc
)
SET @FECH_CUTRIMESTRE2='01/'+
(
case 
when len(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(4))

SET @FECH_CUTRIMESTRE3='01/'+
(
case 
when len(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(4))
SET @FECH_CUTRIMESTRE4='01/'+
(
case 
when len(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(4))
EXEC('
update sirecacobros.dbo.co_rale
set ra_inc=''31''
from sireca.dbo.eco INNER JOIN sirecacobros.dbo.co_rale on RA_REGPATR=substring(REG#PATRONAL,1,10)
where
subdel='''+@SUBDEL+'''
and RA_NUMCRED like (''''+substring(CREDITO,1,2)+''_''+substring(CREDITO,4,6)+'''')
and RA_PERIODO=(''01/''+(case when len(fechaEco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end))
and ra_inc in (''01'',''02'')
and datediff(day,fechacaptura,getdate())&gt;19
and incidencia in (''2'',''1'') 
and incidenciarale in (''01'',''02'')
and validacion=''SIN PAGO''
')

SET @CONSULTA='	SELECT 
	'''+@SUBDEL+''' AS SUBDEL	
	,CP_INSPEC as ID_INSPECTOR
	,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.ID=CP_INSPEC) AS INSPECTOR
	,[RA_REGPATR] AS REGPAT
	,MAX(ptn.RAZONSOCIAL) AS RAZON_SOCIAL
	,MAX(ptn.LOC) as MUNICIPIO 
	,MAX(rale.ra_sector) as SECTOR
	,MAX(ptn.CP) as CP 
	,MAX(ptn.DOM) AS DOMICILIO
	,COUNT(RALE.[RA_NUMCRED]) AS CREDITOS
	,MAX(ptn.COTIZ) AS COTIZANTES
	,SUM([RA_IMPORTE]) AS IMPORTE
	,(
	select sum(cr.ra_importe) 
	from sirecacobros.dbo.co_rale as cr 
	LEFT JOIN [sireca].[dbo].[patrones] AS ptn2 ON ptn2.REGPAT=cr.[RA_REGPATR]
	where cr.ra_sector=MAX(rale.ra_sector) 
    and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=cr.[RA_REGPATR] and aplica like ''%PAE'')
	and cr.ra_inc in ('+@INCIDENCIAS_COBRAR+')
	and substring(ptn2.LOC,1,6)=MAX(ptn.LOC)
	and cr.ra_subdel='''+@SUBDEL+''' 
	and cr.ra_tipo like '''+@TIPO_ECO+'''
	and cr.[RA_VIVO]=''SI'' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA		
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''		
		AND CORA.ra_sector=MAX(rale.ra_sector) 
		AND CORA.[RA_REGPATR]=cr.[RA_REGPATR]
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)'
	SET @CONSULTA=@CONSULTA + ') as IMP_SECTORES
	-------------------------------------------------------
	,(
	select count(distinct(cr.ra_regpatr))
	from sirecacobros.dbo.co_rale as cr 
	LEFT JOIN [sireca].[dbo].[patrones] AS ptn2 ON ptn2.REGPAT=cr.[RA_REGPATR]
	where cr.ra_sector=MAX(rale.ra_sector) 
    and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=cr.[RA_REGPATR] and aplica like ''%PAE'')
	and substring(ptn2.LOC,1,6)=MAX(ptn.LOC)
	and cr.ra_inc in ('+@INCIDENCIAS_COBRAR+')
	and cr.ra_subdel='''+@SUBDEL+''' 
	and cr.ra_tipo like '''+@TIPO_ECO+'''
	and cr.[RA_VIVO]=''SI'' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''
		AND CORA.[RA_REGPATR]=cr.[RA_REGPATR]		
		AND CORA.ra_sector=MAX(rale.ra_sector) 
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)'
	SET @CONSULTA=@CONSULTA + ') as PAT_SECTORES
	-------------------------------------------------------
	FROM [sirecacobros].[dbo].[CO_RALE] AS rale 
	LEFT JOIN (select substring(ptnx.LOC,1,6) as LOC,substring(ptnx.LOC,len(ptnx.LOC)-5,6) as CP,ptnx.dom,ptnx.cotiz,ptnx.regpat,ptnx.razonsocial from [sireca].[dbo].[patrones] as ptnx ) AS ptn ON ptn.REGPAT=rale.[RA_REGPATR]
	LEFT JOIN [sirecacobros].[dbo].[CO_CPATRONAL] ON CP_REGPAT=ptn.REGPAT
	WHERE 
	rale.[RA_VIVO]=''SI''
    AND not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=[CP_REGPAT] and aplica like ''%PAE'')
	AND RA_SUBDEL='''+@SUBDEL+'''
	AND CP_SUBDEL='''+@SUBDEL+'''
	AND ra_tipo like '''+@TIPO_ECO+'''
	'
	if @INSPECTOR='DISPONIBLES'
	begin 
		SET @CONSULTA=@CONSULTA+' AND CP_INSPEC is null '
	end
	else
	begin
		if isnumeric(@INSPECTOR)&gt;0
		begin 
			SET @CONSULTA=@CONSULTA+' AND CP_INSPEC = '''+@INSPECTOR+''''
		end
	end
	SET @CONSULTA=@CONSULTA+' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''
		AND CORA.[RA_REGPATR]=RALE.[RA_REGPATR]
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)
	AND RALE.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	GROUP BY RALE.[RA_REGPATR],CP_INSPEC
--	ORDER BY IMP_SECTORES desc,MUNICIPIO,CP,IMPORTE
	'
	exec('select '''+@SUBDEL+''' as SUBDEL,'''+@AREA+''' AS AREAV ,'''+@TIPO_ECO+''' AS TIPOECOV ,'''+@INCIDENCIASX+''' AS INCIDENCIAV,(case when municipio='''' then ''DESCONOCIDO'' else upper(municipio) end) as MUNICIPIO,count(distinct(SECTOR)) as SECTORES,count(*) as PATRONES,sum(importe) as IMPORTE from ('+@CONSULTA+') as resultaso group by municipio order by municipio,importe')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLArea" DefaultValue="EMISION" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="31" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewMunicipio" runat="server" AutoGenerateColumns="False" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSourceMunicipio" HorizontalAlign="Center" AllowSorting="True" 
                    Caption="POR MUNICIPIO" ShowFooter="True" 
                    EmptyDataText="SIN RESULTADOS DE LOS FILTROS SELECCIONADOS">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" />
            <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" ReadOnly="True" 
                SortExpression="MUNICIPIO" />
            <asp:BoundField DataField="SECTORES" DataFormatString="{0:N0}" 
                HeaderText="SECTORES" ReadOnly="True" SortExpression="SECTORES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "paeemisioncobrosinfodetalles.aspx?subdel=" & Eval("SUBDEL") & "&localidad=" & Eval("MUNICIPIO") & "&sector=%&area=" & Eval("AREAV") & "&tipoeco=" & Eval("TIPOECOV") & "&incidencia=" & Eval("INCIDENCIAV") & "&patrones=" & Eval("PATRONES") %>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>' Target="_blank"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="#BCC7D8" />
    </asp:GridView>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            <asp:SqlDataSource ID="SqlDataSourceMunicipioSector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @AREA AS VARCHAR(7)
DECLARE @INSPECTOR AS VARCHAR(15)
DECLARE @INCIDENCIAS_COBRAR AS VARCHAR(50)
DECLARE @INCIDENCIASX AS VARCHAR(50)
DECLARE @FECH_CUTRIMESTRE1 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE2 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE3 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE4 AS VARCHAR(10)
DECLARE @TIPO_ECO AS VARCHAR(3)

SET @SUBDEL=?
-- @AREA = [ EMISION | COBROS ]
SET @AREA=?
SET @TIPO_ECO=?
SET @INCIDENCIASX=?
IF @INCIDENCIASX='31'
BEGIN
SET @INCIDENCIAS_COBRAR='''31'''
END
ELSE
BEGIN
SET @INCIDENCIAS_COBRAR='''31'',''32'''
END
-- @INSPECTOR es DISPONIBLES,TODOS,NUMERO es la instruccion is null
SET @INSPECTOR='TODOS'
SET @FECH_CUTRIMESTRE1=(
select top 1
(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end)
as fechaecox
from sireca.dbo.eco
where tipoeco in ('COP','RCV','COMP','RCVCOMP')
order by convert(datetime,(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end),103) desc
)
SET @FECH_CUTRIMESTRE2='01/'+
(
case 
when len(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(4))

SET @FECH_CUTRIMESTRE3='01/'+
(
case 
when len(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(4))
SET @FECH_CUTRIMESTRE4='01/'+
(
case 
when len(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(4))
EXEC('
update sirecacobros.dbo.co_rale
set ra_inc=''31''
from sireca.dbo.eco INNER JOIN sirecacobros.dbo.co_rale on RA_REGPATR=substring(REG#PATRONAL,1,10)
where
subdel='''+@SUBDEL+'''
and RA_NUMCRED like (''''+substring(CREDITO,1,2)+''_''+substring(CREDITO,4,6)+'''')
and RA_PERIODO=(''01/''+(case when len(fechaEco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end))
and ra_inc in (''01'',''02'')
and datediff(day,fechacaptura,getdate())&gt;19
and incidencia in (''2'',''1'') 
and incidenciarale in (''01'',''02'')
and validacion=''SIN PAGO''
')

SET @CONSULTA='	SELECT 
	'''+@SUBDEL+''' AS SUBDEL	
	,CP_INSPEC as ID_INSPECTOR
	,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.ID=CP_INSPEC) AS INSPECTOR
	,[RA_REGPATR] AS REGPAT
	,MAX(ptn.RAZONSOCIAL) AS RAZON_SOCIAL
	,MAX(ptn.LOC) as MUNICIPIO 
	,MAX(rale.ra_sector) as SECTOR
	,MAX(ptn.CP) as CP 
	,MAX(ptn.DOM) AS DOMICILIO
	,COUNT(RALE.[RA_NUMCRED]) AS CREDITOS
	,MAX(ptn.COTIZ) AS COTIZANTES
	,SUM([RA_IMPORTE]) AS IMPORTE
	,(
	select sum(cr.ra_importe) 
	from sirecacobros.dbo.co_rale as cr 
	LEFT JOIN [sireca].[dbo].[patrones] AS ptn2 ON ptn2.REGPAT=cr.[RA_REGPATR]
	where cr.ra_sector=MAX(rale.ra_sector) 
    and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=cr.[RA_REGPATR] and aplica like''%PAE'')
	and cr.ra_inc in ('+@INCIDENCIAS_COBRAR+')
	and substring(ptn2.LOC,1,6)=MAX(ptn.LOC)
	and cr.ra_subdel='''+@SUBDEL+''' 
	and cr.ra_tipo like '''+@TIPO_ECO+'''
	and cr.[RA_VIVO]=''SI'' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA		
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''		
		AND CORA.ra_sector=MAX(rale.ra_sector) 
		AND CORA.[RA_REGPATR]=cr.[RA_REGPATR]
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)'
	SET @CONSULTA=@CONSULTA + ') as IMP_SECTORES
	-------------------------------------------------------
	,(
	select count(distinct(cr.ra_regpatr))
	from sirecacobros.dbo.co_rale as cr 
	LEFT JOIN [sireca].[dbo].[patrones] AS ptn2 ON ptn2.REGPAT=cr.[RA_REGPATR]
	where cr.ra_sector=MAX(rale.ra_sector) 
    and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=cr.[RA_REGPATR] and aplica like''%PAE'')
	and substring(ptn2.LOC,1,6)=MAX(ptn.LOC)
	and cr.ra_inc in ('+@INCIDENCIAS_COBRAR+')
	and cr.ra_subdel='''+@SUBDEL+''' 
	and cr.ra_tipo like '''+@TIPO_ECO+'''
	and cr.[RA_VIVO]=''SI'' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''
		AND CORA.[RA_REGPATR]=cr.[RA_REGPATR]		
		AND CORA.ra_sector=MAX(rale.ra_sector) 
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)'
	SET @CONSULTA=@CONSULTA + ') as PAT_SECTORES
	-------------------------------------------------------
	FROM [sirecacobros].[dbo].[CO_RALE] AS rale 
	LEFT JOIN (select substring(ptnx.LOC,1,6) as LOC,substring(ptnx.LOC,len(ptnx.LOC)-5,6) as CP,ptnx.dom,ptnx.cotiz,ptnx.regpat,ptnx.razonsocial from [sireca].[dbo].[patrones] as ptnx ) AS ptn ON ptn.REGPAT=rale.[RA_REGPATR]
	LEFT JOIN [sirecacobros].[dbo].[CO_CPATRONAL] ON CP_REGPAT=ptn.REGPAT
	WHERE 
	rale.[RA_VIVO]=''SI''
    AND not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=[CP_REGPAT] and aplica like''%PAE'')
	AND RA_SUBDEL='''+@SUBDEL+'''
	AND CP_SUBDEL='''+@SUBDEL+'''
	AND ra_tipo like '''+@TIPO_ECO+'''
	'
	if @INSPECTOR='DISPONIBLES'
	begin 
		SET @CONSULTA=@CONSULTA+' AND CP_INSPEC is null '
	end
	else
	begin
		if isnumeric(@INSPECTOR)&gt;0
		begin 
			SET @CONSULTA=@CONSULTA+' AND CP_INSPEC = '''+@INSPECTOR+''''
		end
	end
	SET @CONSULTA=@CONSULTA+' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''
		AND CORA.[RA_REGPATR]=RALE.[RA_REGPATR]
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)
	AND RALE.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	GROUP BY RALE.[RA_REGPATR],CP_INSPEC
--	ORDER BY IMP_SECTORES desc,MUNICIPIO,CP,IMPORTE
	'	
	exec('select '''+@SUBDEL+''' as SUBDEL,'''+@AREA+''' AS AREAV ,'''+@TIPO_ECO+''' AS TIPOECOV ,'''+@INCIDENCIASX+''' AS INCIDENCIAV,(case when municipio='''' then ''DESCONOCIDO'' else upper(municipio) end) as MUNICIPIO,SECTOR,count(*) as PATRONES,sum(importe) as IMPORTE from ('+@CONSULTA+') as resultaso group by municipio,sector order by municipio,sector,importe')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLArea" DefaultValue="EMISION" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="31" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewMunicipioSector" runat="server" 
        AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceMunicipioSector" 
        HorizontalAlign="Center" AllowSorting="True" Caption="POR MUNICIPIO Y SECTOR" 
                    ShowFooter="True" 
                    EmptyDataText="SIN RESULTADOS DE LOS FILTROS SELECCIONADOS">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" />
            <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" ReadOnly="True" 
                SortExpression="MUNICIPIO" />
            <asp:BoundField DataField="SECTOR" DataFormatString="{0:N0}" 
                HeaderText="SECTOR" ReadOnly="True" SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "paeemisioncobrosinfodetalles.aspx?subdel=" & Eval("SUBDEL") & "&localidad=" & Eval("MUNICIPIO") & "&sector=" & Eval("SECTOR") & "&area=" & Eval("AREAV") & "&tipoeco=" & Eval("TIPOECOV") & "&incidencia=" & Eval("INCIDENCIAV") & "&patrones=" & Eval("PATRONES") %>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>' Target="_blank"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="#BCC7D8" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Content>

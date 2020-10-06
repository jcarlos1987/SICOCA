<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="paeemisioncobrosinfodetalles.aspx.vb" Inherits="WebSIRECA.paeemisioncobrosinfodetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource1" Font-Size="10pt" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="SUBDEL_NOM" HeaderText="SUBDEL_NOM" ReadOnly="True" 
                    SortExpression="SUBDEL_NOM" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="SECTOR" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" ReadOnly="True" 
                    SortExpression="ACTIVIDAD" />
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                    SortExpression="LOCALIDAD" />
                <asp:BoundField DataField="CP" HeaderText="CP" ReadOnly="True" 
                    SortExpression="CP" />
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="ID_INSPECTOR" HeaderText="ID_INSPECTOR" 
                    ReadOnly="True" SortExpression="ID_INSPECTOR" />
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @DEL AS VARCHAR(2)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @AREA AS VARCHAR(7)
DECLARE @INSPECTOR AS VARCHAR(15)
DECLARE @INCIDENCIAS_COBRAR AS VARCHAR(50)
DECLARE @FECH_CUTRIMESTRE1 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE2 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE3 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE4 AS VARCHAR(10)
DECLARE @TIPO_ECO AS VARCHAR(3)
DECLARE @LOCALIDAD as VARCHAR(6)
DECLARE @SECTOR as VARCHAR(2)

SET @DEL=?
SET @SUBDEL=?
-- @AREA = [ EMISION | COBROS ]
SET @AREA=?
SET @TIPO_ECO=?
SET @INCIDENCIAS_COBRAR=?
SET @LOCALIDAD=?
SET @SECTOR=?


IF @INCIDENCIAS_COBRAR='31'
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
	,(select CT_NOM_SUBDEL from sireca.dbo.catalogodelegacional where ct_del='''+@DEL+''' and ct_subdel='''+@SUBDEL+''') as SUBDEL_NOM
	,(select CT_DOM_SUBDEL from sireca.dbo.catalogodelegacional where ct_del='''+@DEL+''' and ct_subdel='''+@SUBDEL+''') as DOM_SUBDEL
	,RA_TIPO as TIPO
	,(rale.ra_sector) as SECTOR	
	,[RA_REGPATR] AS REGPAT
	,(ptn.RAZONSOCIAL) AS RAZON_SOCIAL
	,ptn.act as ACTIVIDAD
	,(ptn.LOC) as LOCALIDAD
	,(ptn.CP) as CP 
	,(ptn.DOM) AS DOMICILIO
	,substring(RA_PERIODO,4,7) as PERIODO
	,(RALE.[RA_NUMCRED]) AS CREDITO
	,(ptn.COTIZ) AS COTIZANTES
	,([RA_IMPORTE]) AS IMPORTE
	,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.ID=CP_INSPEC) AS INSPECTOR
	,CP_INSPEC as ID_INSPECTOR
	FROM [sirecacobros].[dbo].[CO_RALE] AS rale 
	LEFT JOIN (select (case when len(ptnx.loc)=40 then substring(ptnx.loc,1,len(ptnx.loc)-5) else ptnx.loc end) as LOC,(case when len(ptnx.loc)=40 then substring(ptnx.loc,len(ptnx.loc)-5,6) else '''' end) as CP,ptnx.dom,ptnx.cotiz,upper(ptnx.act) as act,ptnx.regpat,ptnx.razonsocial from [sireca].[dbo].[patrones] as ptnx ) AS ptn ON ptn.REGPAT=rale.[RA_REGPATR]
	LEFT JOIN [sirecacobros].[dbo].[CO_CPATRONAL] ON CP_REGPAT=ptn.REGPAT
	WHERE 
	rale.[RA_VIVO]=''SI''
	AND substring(ptn.LOC,1,6)='''+@LOCALIDAD+'''
	AND rale.ra_sector like '''+@SECTOR+'''
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
        AND not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='''+@SUBDEL+''' and pa.[regpatr]=[CP_REGPAT] and aplica like ''%PAE'')
		AND CORA.[RA_REGPATR]=RALE.[RA_REGPATR]
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.ra_tipo like '''+@TIPO_ECO+'''
		AND CORA.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')
	)
	AND RALE.[RA_INC] in ('+@INCIDENCIAS_COBRAR+')	
	ORDER BY LOCALIDAD,CP,DOMICILIO,convert(datetime,RA_PERIODO,103)
	'
	exec(@CONSULTA)
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAdel" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="" Name="?" QueryStringField="area" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipoeco" />
                <asp:QueryStringParameter DefaultValue="31" Name="?" 
                    QueryStringField="incidencia" />
                <asp:QueryStringParameter DefaultValue="localidad" Name="?" 
                    QueryStringField="localidad" />
                <asp:QueryStringParameter DefaultValue="99" Name="?" 
                    QueryStringField="sector" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

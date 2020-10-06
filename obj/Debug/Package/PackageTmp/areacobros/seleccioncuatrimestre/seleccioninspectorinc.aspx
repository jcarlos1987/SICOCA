<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="seleccioninspectorinc.aspx.vb" Inherits="WebSIRECA.seleccioninspectorinc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="10pt">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                DataNavigateUrlFormatString="../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                DataTextField="PATRONES" HeaderText="REG.PATRONAL" 
                NavigateUrl="~/observacionPatronal/Default.aspx" SortExpression="PATRONES" 
                Target="_blank" />
            <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                HeaderText="NOMBRE O RAZON SOCIAL" ReadOnly="True" 
                SortExpression="NOMBRE O RAZON SOCIAL" />
            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                SortExpression="CREDITOS" />
            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="ASIGNADO" DataFormatString="{0:d}" 
                HeaderText="ASIGNADO" ReadOnly="True" SortExpression="ASIGNADO" />
            <asp:BoundField DataField="CAPTURADO" DataFormatString="{0:d}" 
                HeaderText="CAPTURADO" ReadOnly="True" SortExpression="CAPTURADO" />
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TIPO_RALE" HeaderText="TIPO_RALE" 
                SortExpression="TIPO_RALE" />
            <asp:BoundField DataField="INC_RALE_COP" HeaderText="INC_RALE" 
                SortExpression="INC_RALE_COP" NullDisplayText="DEPURADO">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="#A9BFD6" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INCIDENCIA AS VARCHAR(50)
DECLARE @INSPECTOR AS VARCHAR(50)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
SET @SUBDEL=?
SET @INCIDENCIA=?
SET @INSPECTOR=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)


if @INCIDENCIA='vacio' and @INSPECTOR='vacio'
begin
exec(
'SELECT
eco.REG#PATRONAL as PATRONES,eco.[NOMBRE O RAZON SOCIAL],eco.CREDITO as CREDITOS,COTIZ as COTIZANTES,eco.OMISION as IMPORTE,rale.INC as INC_RALE_COP,(select top 1 upper(nombre) from fiscamovil.dbo.usuarios where id=eco.responsable) as INSPECTOR,eco.fechaSeleccion as ASIGNADO,eco.fechaCaptura as CAPTURADO,eco.MULTA as MULTA,eco.sector as SECTOR
,rale.tr as TIPO_RALE
FROM [sirecacobros].[dbo].[eco] as eco left join (select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
WHERE eco.subdel = '''+@SUBDEL+''' 
and (incidenciarale in (''31'',''00'',''01'',''02'',''27'') or incidenciarale is null)
and (incidencia is null)
and eco.responsable is null
and validacion=''SIN PAGO''
')
end
else
begin
--------------------------------------------------
	if @INCIDENCIA='vacio' and @INSPECTOR is not null
	begin
	exec(
	'SELECT 
	eco.REG#PATRONAL as PATRONES,eco.[NOMBRE O RAZON SOCIAL],eco.CREDITO as CREDITOS,COTIZ as COTIZANTES,eco.OMISION as IMPORTE,rale.INC as INC_RALE_COP,(select top 1 upper(nombre) from fiscamovil.dbo.usuarios where id=eco.responsable) as INSPECTOR,eco.fechaSeleccion as ASIGNADO,eco.fechaCaptura as CAPTURADO,eco.MULTA as MULTA,eco.sector as SECTOR
	,rale.tr as TIPO_RALE
	FROM [sirecacobros].[dbo].[eco] as eco left join (select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
	on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
	WHERE eco.subdel = '''+@SUBDEL+''' 
and (incidenciarale in (''31'',''00'',''01'',''02'',''27'') or incidenciarale is null)
and (incidencia is null)
	and eco.responsable = '''+@INSPECTOR+'''
	and validacion=''SIN PAGO''
	')
	end
	else
	---------------------------------------------------
	begin
		if @INCIDENCIA is not null and @INSPECTOR='vacio'
		begin
		exec(
		'SELECT 
		eco.REG#PATRONAL as PATRONES,eco.[NOMBRE O RAZON SOCIAL],eco.CREDITO as CREDITOS,COTIZ as COTIZANTES,eco.OMISION as IMPORTE,rale.INC as INC_RALE_COP,(select top 1 upper(nombre) from fiscamovil.dbo.usuarios where id=eco.responsable) as INSPECTOR,eco.fechaSeleccion as ASIGNADO,eco.fechaCaptura as CAPTURADO,eco.MULTA as MULTA,eco.sector as SECTOR
		,rale.tr as TIPO_RALE
		FROM [sirecacobros].[dbo].[eco] as eco left join (select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
		on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
		WHERE eco.subdel = '''+@SUBDEL+''' 
		and eco.incidencia = '''+@INCIDENCIA+'''
        and responsable is null
and (incidenciarale in (''31'',''00'',''01'',''02'',''27'') or incidenciarale is null)
		and validacion=''SIN PAGO''
		')
		end
		else
		begin
		exec(
		'SELECT 
		eco.REG#PATRONAL as PATRONES,eco.[NOMBRE O RAZON SOCIAL],eco.CREDITO as CREDITOS,COTIZ as COTIZANTES,eco.OMISION as IMPORTE,rale.INC as INC_RALE_COP,(select top 1 upper(nombre) from fiscamovil.dbo.usuarios where id=eco.responsable) as INSPECTOR,eco.fechaSeleccion as ASIGNADO,eco.fechaCaptura as CAPTURADO,eco.MULTA as MULTA,eco.sector as SECTOR
		,rale.tr as TIPO_RALE
		FROM [sirecacobros].[dbo].[eco] as eco left join (select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
		on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
		WHERE eco.subdel = '''+@SUBDEL+''' 
		and eco.incidencia = '''+@INCIDENCIA+'''
and (incidenciarale in (''31'',''00'',''01'',''02'',''27'') or incidenciarale is null)
		and eco.responsable = '''+@INSPECTOR+'''
		and validacion=''SIN PAGO''
		')		
		end
	---------------------------------------------------
	end
---------------------------------------------------
end">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="incidencia" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="inspector" />
        </SelectParameters>
    </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>

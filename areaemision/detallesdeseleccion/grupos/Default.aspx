<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default27" %>

<asp:Content ID ="contenido2"  runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="10pt">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                DataNavigateUrlFormatString="../../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
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
            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" 
                HeaderText="PAGO" ReadOnly="True" SortExpression="PAGO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="ASIGNADO" DataFormatString="{0:d}" 
                HeaderText="ASIGNADO" ReadOnly="True" SortExpression="ASIGNADO" />
            <asp:BoundField DataField="INC_CAP" HeaderText="INC_CAP" 
                SortExpression="INC_CAP" />
            <asp:BoundField DataField="CAPTURADO" DataFormatString="{0:d}" 
                HeaderText="CAPTURADO" ReadOnly="True" SortExpression="CAPTURADO" />
            <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                ReadOnly="True" SortExpression="MULTA" Visible="False">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO" />
            <asp:BoundField DataField="TIPO_RALE" HeaderText="TIPO_RALE" 
                SortExpression="TIPO_RALE" />
            <asp:BoundField DataField="INC_RALE_COP" HeaderText="INC_RALE" 
                SortExpression="INC_RALE_COP">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="#8FB78E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
DECLARE @INCIDENCIA AS VARCHAR(50)
DECLARE @TIPO_FILE AS VARCHAR(50)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
DECLARE @CONSULTA AS VARCHAR(3500)
DECLARE @FORANEO as varchar(15)
DECLARE @RUTA as varchar(15)
DECLARE @ADD_FORANEO as varchar(500)
DECLARE @ADD_RUTA AS VARCHAR(50)
SET @MES =?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @INCIDENCIA=?
SET @TIPO_FILE=?
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
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)

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

SET @CONSULTA = 'SELECT 
eco.REG#PATRONAL as PATRONES,eco.[NOMBRE O RAZON SOCIAL],eco.CREDITO as CREDITOS,COTIZ as COTIZANTES,eco.OMISION as IMPORTE,rale.INC as INC_RALE_COP,(select top 1 upper(nombre) from fiscamovil.dbo.usuarios where id=eco.responsable) as INSPECTOR,eco.fechaSeleccion as ASIGNADO,eco.incidencia as INC_CAP,eco.fechaCaptura as CAPTURADO,eco.MULTA as MULTA,'+@ADD_COLUM+' as TIPO,eco.sector as SECTOR
,rale.tr as TIPO_RALE,eco.pago as PAGO
FROM [sireca].[dbo].[eco] as eco left join (select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
WHERE eco.subdel = '''+@SUBDEL+''' 
and eco.fechaEco = '''+@PERIODO+''' '+@ADD_WHERE+' '+@ADD_FORANEO+'
and (
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
)='''+@INCIDENCIA+''' '
IF @TIPO_FILE&lt;&gt;'ALL'
BEGIN
SET @CONSULTA = @CONSULTA + ' and tipoEco in ('''+@TIPO_FILE+''') '
END
SET @CONSULTA = @CONSULTA + ' ORDER BY TIPO,INCIDENCIA'

exec(@CONSULTA)
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
            <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                QueryStringField="anio" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="1" Name="?" 
                QueryStringField="tipo_eco" />
            <asp:QueryStringParameter DefaultValue="incidencia" Name="?" 
                QueryStringField="incidencia" />
            <asp:QueryStringParameter DefaultValue="FILE" Name="?" 
                QueryStringField="tipo_file" />
            <asp:QueryStringParameter DefaultValue="X" Name="?" 
                QueryStringField="foraneo" />
            <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="ruta" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

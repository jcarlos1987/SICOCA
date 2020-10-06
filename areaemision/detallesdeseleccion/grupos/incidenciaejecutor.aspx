<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteGeneral.Master" CodeBehind="incidenciaejecutor.aspx.vb" Inherits="WebSIRECA.incidenciaejecutor" %>

<asp:Content ID ="contenido2"  runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="10pt">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                DataNavigateUrlFormatString="../../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=zaron" 
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
                SortExpression="TIPO_RALE">
            </asp:BoundField>
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
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(50)
DECLARE @FECH_FIN AS VARCHAR(50)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
DECLARE @TIPO_FILE AS VARCHAR(50)
DECLARE @INCIDENCIA AS VARCHAR(50)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
SET @MES =?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @TIPO_FILE=?
SET @INCIDENCIA=?
SET @PERIODO=@MES+@ANIO
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
exec(
'SELECT 
(''?mes='+@MES+'&amp;anio='+@ANIO+'&amp;subdel='+@SUBDEL+'&amp;responsable='+@RESPONSABLE+'&amp;fech_inicio='+@FECH_INICIO+'&amp;fech_fin='+@FECH_FIN+'&amp;tipo_eco='+@TIPO_ECO+'&amp;tipo_file=''+eco.tipoEco+''&amp;incidencia=''
+(
case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
)
) as URLV
,eco.REG#PATRONAL as PATRONES,eco.[NOMBRE O RAZON SOCIAL],eco.CREDITO as CREDITOS,rale.INC as INC_RALE_COP,COTIZ as COTIZANTES,eco.OMISION as IMPORTE,(select top 1 upper(nombre) from fiscamovil.dbo.usuarios where id=eco.responsable) as INSPECTOR,eco.fechaSeleccion as ASIGNADO,eco.fechaCaptura as CAPTURADO,eco.MULTA as MULTA,'+@ADD_COLUM+' as TIPO,eco.sector as SECTOR
,rale.tr as TIPO_RALE
FROM [sireca].[dbo].[eco] as eco left join (select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.fechaEco = '''+@PERIODO+'''
and eco.responsable='''+@RESPONSABLE+'''
and (convert(datetime,(convert(varchar,day([fechaSeleccion]))+''/''+convert(varchar,month([fechaSeleccion]))+''/'' +convert(varchar,year([fechaSeleccion]))),103)) 
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
and (
case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
)='''+@INCIDENCIA+''' and tipoeco='''+@TIPO_FILE+'''
ORDER BY TIPO,INCIDENCIA
')
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
            <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                QueryStringField="anio" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="0999" Name="?" 
                QueryStringField="responsable" />
            <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                QueryStringField="fech_inicio" />
            <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                QueryStringField="fech_fin" />
            <asp:QueryStringParameter DefaultValue="ECO" Name="?" 
                QueryStringField="tipo_eco" />
            <asp:QueryStringParameter DefaultValue="" Name="?" 
                QueryStringField="tipo_file" />
            <asp:QueryStringParameter DefaultValue="incidencia" Name="?" 
                QueryStringField="incidencia" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

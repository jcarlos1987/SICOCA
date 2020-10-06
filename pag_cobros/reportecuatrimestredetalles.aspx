<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="reportecuatrimestredetalles.aspx.vb" Inherits="WebSIRECA.reportecuatrimestredetalles" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
    
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="10pt">
        <Columns>
            <asp:BoundField DataField="SUBDEL" 
                HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" />
            <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                DataTextField="PATRONES" HeaderText="REG.PATRONAL" SortExpression="PATRONES" />
            <asp:BoundField DataField="RAZON" 
                HeaderText="RAZON" ReadOnly="True" SortExpression="RAZON">
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" 
                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">            
            </asp:BoundField>
            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" 
                HeaderText="INSPECTOR" ReadOnly="True" SortExpression="INSPECTOR" />
            <asp:BoundField DataField="INC_CAP" HeaderText="INC_CAP" 
                SortExpression="INC_CAP" ReadOnly="True" />
            <asp:BoundField DataField="CAPTURADO" 
                HeaderText="CAPTURADO" ReadOnly="True" SortExpression="CAPTURADO" 
                DataFormatString="{0:d}" />
            <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                ReadOnly="True" SortExpression="INC_RALE">
            </asp:BoundField>
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                SortExpression="SECTOR">
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" />
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" 
                SortExpression="TIPO" ReadOnly="True" />
            <asp:BoundField DataField="TIPO_RALE" HeaderText="TIPO_RALE" 
                SortExpression="TIPO_RALE" ReadOnly="True">
            </asp:BoundField>
            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                ReadOnly="True" SortExpression="PAGO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="#8FB78E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @CONSULTA as VARCHAR(2000)
DECLARE @PER as VARCHAR(10)
DECLARE @PER_INI as VARCHAR(10)
DECLARE @PER_FIN as VARCHAR(10)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_ECO as VARCHAR(3)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
--RANGO, 01/01/2013
SET @PER='01/'+?
SET @PER_INI=?
SET @PER_FIN=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @INSPECTOR=?

SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)

SET @CONSULTA='
SELECT subdel as SUBDEL
,regpat as PATRONES
,RAZON as RAZON
,credito as CREDITOS
,cotiz as COTIZANTES
,omision as IMPORTE
,(case when (select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=inspector) is null then ''SIN ASIGNACION'' else upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=inspector)) end) as INSPECTOR
,ecoc.inc as INC_CAP
,ecoc.FECH_CAP as CAPTURADO
,rale.INC as INC_RALE
,ecoc.sector as SECTOR
,ecoc.periodo as PERIODO
,ecoc.eco as TIPO
,rale.tr as TIPO_RALE
,ecoc.pago as PAGO
FROM sireca.[dbo].[ecocontrol] as ecoc
left join 
(select ''RALE COP'' as tr,* from [rale].[dbo].['+@RALECOP+'] union all 
select ''RALE RCV'' as tr,* from [rale].[dbo].['+@RALERCV+']) as rale 
on  replace(rale.regpatr,''-'','''')=substring(REGPAT,1,10) and rale.NUMCRED=credito
where validacion=''SIN PAGO''
and subdel='''+@SUBDEL+'''
and eco like '''+@TIPO_ECO+'%'' '
if @PER='01/RANGO'
begin
SET @CONSULTA= @CONSULTA + ' and convert(datetime,''01/''+ecoc.periodo,103) between '''+@PER_INI+''' and '''+@PER_FIN+''' '
end
else
begin
	SET @CONSULTA= @CONSULTA + ' and convert(datetime,''01/''+ecoc.periodo,103)= '''+@PER+''' '
end
SET @CONSULTA= @CONSULTA + ' and (inc_rale not in (''34'',''43'',''09'',''32'',''05'',''52'',''19''))
and (ecoc.inc not in (''9'',''60'') or ecoc.inc is null) '
if @INSPECTOR='SIN ASIGNACION'
begin
SET @CONSULTA= @CONSULTA +' and inspector is null '
end
else
begin
SET @CONSULTA= @CONSULTA +' and inspector like '''+@INSPECTOR+''' '
end

SET @CONSULTA= @CONSULTA + ' order by SUBDEL,convert(datetime,''01/''+ecoc.PERIODO) '
exec(@CONSULTA)
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="periodo_ini" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="periodo_fin" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="eco" Name="?" 
                QueryStringField="tipoeco" />
            <asp:QueryStringParameter DefaultValue="%" Name="?" 
                QueryStringField="inspector" />
        </SelectParameters>
    </asp:SqlDataSource>

    </div>
</asp:Content>

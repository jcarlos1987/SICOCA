<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="deudasNumMeses.aspx.vb" Inherits="WebSIRECA.deudasNumMeses" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalls</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
<asp:LinkButton ID="LinkButton2" runat="server" BackColor="#F2B63B" 
            Font-Bold="True" Font-Underline="False">&nbsp;&nbsp;Exportar a EXCEL&nbsp;&nbsp;</asp:LinkButton>
        </asp:Panel>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataSourceID="SqlDataSource1" HorizontalAlign="Center" 
            AllowSorting="True" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" 
                    SortExpression="PERIODOS" />
                <asp:TemplateField HeaderText="REG_PATRONAL" SortExpression="REGPATR">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "../observacionPatronal/DefaultClear.aspx?regpat=" & Eval("REGPATR") & "&razon=razon" %>' 
                            Text='<%# Eval("REGPATR") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ControlStyle Font-Underline="False" />
                </asp:TemplateField>                
                <asp:BoundField DataField="razon" HeaderText="RAZON" SortExpression="razon" />
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FECH_ASIG" DataFormatString="{0:d}" 
                    HeaderText="FECH.ASIGNACION" SortExpression="FECH_ASIG" />
                <asp:BoundField HeaderText="INSPECTOR" DataField="INSPECTOR" 
                    SortExpression="INSPECTOR" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("REGPATR", "asignardeudameses.aspx?regpat={0}") %>' 
                            Text="Asignar"></asp:HyperLink>
                    </ItemTemplate>
                    <ControlStyle Font-Underline="False" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--SqlDataSource1
DECLARE @RALECOP01 as VARCHAR(50)
DECLARE @RALECOP33 as VARCHAR(50)
DECLARE @RALERCV01 as VARCHAR(50)
DECLARE @RALERCV33 as VARCHAR(50)
DECLARE @PERIODO_INI as VARCHAR(10)
DECLARE @PERIODO_FIN as VARCHAR(10)

DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_DOC as VARCHAR(5)
DECLARE @TIPO_DOC2 as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(50)
DECLARE @TIPO_COP_RCV2 as VARCHAR(50)
DECLARE @MOVIMIENTOS as VARCHAR(50)
DECLARE @NUM_PERIODOS as VARCHAR(5)
SET @SUBDEL=?
SET @PERIODO_INI=?
SET @PERIODO_FIN=?
SET @TIPO_DOC=?
SET @TIPO_COP_RCV=?
SET @MOVIMIENTOS='no'
SET @NUM_PERIODOS=?


IF @MOVIMIENTOS='no'
BEGIN
	SET @MOVIMIENTOS=' [MOV] not in (''2'') '
END
ELSE 
BEGIN 
	SET @MOVIMIENTOS=' [MOV] in (''2'') '
END

IF @TIPO_COP_RCV&lt;&gt;'%'
begin
	SET @TIPO_COP_RCV2= ' AND TIPO = '''+@TIPO_COP_RCV+''' '
end

IF @TIPO_DOC='02'
BEGIN 
	SET @TIPO_DOC2=' AND TD IN (''02'') '
END
IF @TIPO_DOC='03'
BEGIN 
	SET @TIPO_DOC2=' AND TD IN (''03'') '
END
IF @TIPO_DOC='%'
BEGIN 
	SET @TIPO_DOC2=' AND TD IN (''02'',''03'') '
END

SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALERCV33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='RCV' order by fecha desc)
exec('
select 
REGPATR
,RAZON
,COUNT(PERIODO) AS PERIODOS
,SUM(IMPORTE) AS IMPORTE
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=(CP_INSPEC)) as INSPECTOR
,(CP_FECH_ASIG) as FECH_ASIG
from (
SELECT 
RALE.SUBDEL
,TIPO
,REGPATR
,RAZONSOCIAL AS RAZON
,MOV
,FMOV
,PTN.SECTOR
,PERIODO
,NUMCRED
,COTIZ AS COTIZANTES
,TD
,INC
,IMPORTE
FROM (
select ''01'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP01+']
where '+@MOVIMIENTOS+'
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''33'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP33+']
where '+@MOVIMIENTOS+'
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''01'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV01+']
where '+@MOVIMIENTOS+'
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''33'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV33+']
where '+@MOVIMIENTOS+'
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
) as rale left join sireca.dbo.patrones as ptn on ptn.regpat=replace(rale.regpatr,''-'','''')
where len([PERIODO]) not in (''7'')
'+@TIPO_DOC2+' AND rale.SUBDEL like '''+@SUBDEL+''' '+@TIPO_COP_RCV2+'
and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel like '''+@SUBDEL+''' and pa.[regpatr]=replace(rale.[REGPATR],''-'','''') and aplica like ''%PAE'')
) as resultados
left join sirecacobros.dbo.CO_CPATRONAL on CP_REGPAT=replace(REGPATR,''-'',''-'')
group by REGPATR,RAZON,CP_INSPEC,CP_FECH_ASIG
having COUNT(PERIODO)='+@NUM_PERIODOS+'
order by 3 desc
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_ini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipodoc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipocoprcv" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="numperiodos" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

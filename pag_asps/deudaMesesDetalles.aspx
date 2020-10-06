<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="deudaMesesDetalles.aspx.vb" Inherits="WebSIRECA.deudaMesesDetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView4" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource5" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" ForeColor="Black" HorizontalAlign="Center" 
            Width="557px" Font-Size="10pt" BorderStyle="Solid" CellSpacing="1" 
            ShowFooter="True">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="PATRON" SortExpression="REGPATR">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "../observacionPatronal/DefaultClear.aspx?regpat=" & Eval("REGPATR") & "&razon=razon" %>' 
                            Text='<%# Eval("REGPATR") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:BoundField DataField="razon" HeaderText="RAZON" SortExpression="razon" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                    SortExpression="PERIODOS" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="Tan" HorizontalAlign="Right" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
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
SET @SUBDEL=?
SET @PERIODO_INI=?
SET @PERIODO_FIN=?
SET @TIPO_DOC=?
SET @TIPO_COP_RCV=?
SET @MOVIMIENTOS=?

IF @MOVIMIENTOS='ok'
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
group by REGPATR,RAZON
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01/01/2012" Name="?" 
                    QueryStringField="fech_ini" />
                <asp:QueryStringParameter DefaultValue="01/01/2012" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipo_doc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipo_cop_rcv" />
                <asp:QueryStringParameter DefaultValue="no" Name="?" 
                    QueryStringField="movCancelados" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

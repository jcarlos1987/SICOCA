<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="saldo.aspx.vb" Inherits="WebSIRECA.saldo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SALDO CUATRIMESTRE</title>
    <link href="../../css/sireca.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewSaldo" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSourceSaldo" HorizontalAlign="Center" 
            Font-Size="8pt">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                    DataNavigateUrlFormatString="../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="PATRONES" HeaderText="REG.PATRONAL" SortExpression="PATRONES" 
                    Target="_blank" >
                <ControlStyle Font-Underline="False" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="razonSocial" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="razonSocial" />
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" ReadOnly="True" 
                    SortExpression="INC_RALE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPORALE" HeaderText="TIPORALE" ReadOnly="True" 
                    SortExpression="TIPORALE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceSaldo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
DECLARE @CUATRIMESTRE as VARCHAR(6)
DECLARE @PERIODO as VARCHAR(10)
DECLARE @RALECOP01 AS VARCHAR(50)
DECLARE @RALERCV01 AS VARCHAR(50)
DECLARE @RALECOP33 AS VARCHAR(50)
DECLARE @RALERCV33 AS VARCHAR(50)

SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @CUATRIMESTRE=?
SET @PERIODO=?

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALERCV01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='RCV' order by fecha desc)

exec('
select 
subdel as SUBDEL
,(
case 
when cuatrimestre_ciclo=1 then (select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) 
when cuatrimestre_ciclo=2 then (select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=(select top 1 CP_INSPEC from sirecacobros.dbo.CO_CPATRONAL where CP_REGPAT=substring(reg#patronal,1,10) and CP_SUBDEL like '''+@SUBDEL+''')) 
else ''''
end) as INSPECTOR
,reg#patronal as PATRONES
,[NOMBRE O RAZON SOCIAL] as razonSocial
,credito as CREDITOS
,cotiz as COTIZANTES
,omision as IMPORTE
,rale.inc as INC_RALE
,rale.TIPORALE
,(case 
when TIPOECO in (''COP'',''COMP'') then
(case 
when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
when rale.TIPORALE in (''RCV'',''RCVCOMP'') then
(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
from sireca.dbo.eco as eco left join 
(
select ''COP'' as TIPORALE,* from [rale].[dbo].['+@RALECOP01+'] union all select ''RCV'' as TIPORALE,* from [rale].[dbo].['+@RALERCV01+']
union all
select ''COP'' as TIPORALE,* from [rale].[dbo].['+@RALECOP33+'] union all select ''RCV'' as TIPORALE,* from [rale].[dbo].['+@RALERCV33+']
) as rale 
on replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
where subdel like '''+@SUBDEL+'''
and cuatrimestre_num='''+@CUATRIMESTRE+'''
and (case when tipoeco in (''COP'',''COMP'') then ''COP'' when tipoeco in (''RCV'',''RCVCOMP'') then ''RCV'' else ''X'' end) like '''+@TIPO_COP_RCV+'''
and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and validacion=''SIN PAGO''
and incidenciarale not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'',''34'',''43'')
--and (incidencia not in (''9'',''60'') or incidencia is null)
and fechaeco='''+@PERIODO+'''
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="eco" Name="?" 
                    QueryStringField="tipoeco" />
                <asp:QueryStringParameter DefaultValue="" Name="?" 
                    QueryStringField="cuatrimestre" />
                <asp:QueryStringParameter DefaultValue="12000" Name="?" 
                    QueryStringField="periodo" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

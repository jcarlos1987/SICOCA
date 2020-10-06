<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesincporpatron.aspx.vb" Inherits="WebSIRECA.detallesincporpatron" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
<asp:LinkButton ID="LinkButton2" runat="server" BackColor="#F2B63B" 
            Font-Bold="True" Font-Underline="False">&nbsp;&nbsp;Exportar a EXCEL&nbsp;&nbsp;</asp:LinkButton>
        </asp:Panel>
        
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="N" DataFormatString="{0:N0}" HeaderText="N" 
                    SortExpression="N" />
                <asp:TemplateField HeaderText="REGPAT" SortExpression="REGPAT">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("REGPAT", "../observacionPatronal/Default.aspx?regpat={0}&razon=razon") %>' 
                            Target="REGPAT" Text='<%# Eval("REGPAT") %>' Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                    SortExpression="PERIODOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA as VARCHAR(4000)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALERCV01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @RALERCV33 as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(3)
DECLARE @INCIDENCIA as VARCHAR(3)
DECLARE @LOS20MAYORES as VARCHAR(10)

SET @SUBDEL=?
SET @TIPO=?
SET @INCIDENCIA=?
SET @LOS20MAYORES=?

SET @INCIDENCIA = (case when len(@INCIDENCIA)=1 then '0'+@INCIDENCIA else @INCIDENCIA end)
SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALERCV01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='RCV' order by fecha desc)


SET @CONSULTA = '
DECLARE @IMPORTE_RALE as FLOAT 
DECLARE @PERIODO_PROPUESTA_EMITIDA as VARCHAR(15) 
SELECT ROW_NUMBER() OVER(ORDER BY RESULTADO.REGPAT DESC) as N,RESULTADO.REGPAT,RAZONSOCIAL AS razon,COTIZ AS COTIZANTES,CREDITO,PERIODO AS PERIODOS,IMPORTE FROM (
SELECT 
[REGPATR] as [REGPAT]	
,count([NUMCRED]) as [CREDITO]
,sum([IMPORTE]) as [IMPORTE]
,count(distinct([PERIODO])) as [PERIODO]
  FROM ('
  if @SUBDEL='01' and @TIPO='COP' 
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP01+']'
end
if @SUBDEL='01' and @TIPO='RCV' 
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV01+']'
end
if @SUBDEL='01' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all '
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV01+']'
end
if @SUBDEL='33' and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP33+']'
end
if @SUBDEL='33'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='33' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP33+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='%'  and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP33+']'	
end
if @SUBDEL='%'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='%'  and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR FROM [rale].[dbo].['+@RALECOP33+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR FROM [rale].[dbo].['+@RALERCV33+']'
end
 SET @CONSULTA = @CONSULTA+' ) as rale  
where INC = '''+@INCIDENCIA+''' 
and not exists(
SELECT [regpatr]
  FROM [sirecacobros].[dbo].[patronesAlianza]
  where [idAlias]=''2'' and [regpatr]=replace(rale.regpatr,''-'','''')
) '
if @LOS20MAYORES='SI'
begin
SET @CONSULTA = @CONSULTA+' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=REPLACE(rale.regpatr,''-'','''') and om_subdel like '''+@SUBDEL+''') '
end
else
begin
if @LOS20MAYORES='NO'
begin
SET @CONSULTA = @CONSULTA+' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=REPLACE(rale.regpatr,''-'','''') and om_subdel like '''+@SUBDEL+''') '
end
end
SET @CONSULTA = @CONSULTA+' 
group by REGPATR
) as resultado left join sireca.dbo.patrones as ptn on ptn.regpat=REPLACE(resultado.regpat,''-'','''')
order by 1
'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="cop" Name="?" QueryStringField="tipo" />
                <asp:QueryStringParameter DefaultValue="vacia" Name="?" 
                    QueryStringField="incidencia" />
                <asp:QueryStringParameter DefaultValue="todos" Name="?" 
                    QueryStringField="mayoresn" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

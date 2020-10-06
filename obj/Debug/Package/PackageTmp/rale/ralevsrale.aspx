<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="ralevsrale.aspx.vb" Inherits="WebSIRECA.ralevsrale" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
<div class="btn-group input-prepend">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True" Width="140px">
                            </asp:DropDownList>
<span class="add-on">
                            TIPO:
</span> 
                            <asp:DropDownList ID="DDLTipo" runat="server" AutoPostBack="True" 
                                Width="100px">
                                <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                                <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                                <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        RALE A COMPARAR DEL
</span> 
        <asp:DropDownList ID="DDLRAEL1" runat="server" DataSourceID="SqlDataSourceRales" 
                                DataTextField="texto" DataValueField="valor" Width="140px">
        </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceRales" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT REPLACE(replace([name],'01A','33A'),'ARCV','ACOP') as valor
,convert(nvarchar,[fecha],103) as texto
,count(*) as totales
FROM [rale].[dbo].[tablas]
GROUP BY REPLACE(replace([name],'01A','33A'),'ARCV','ACOP'),[fecha]
having count(*)=4
order by fecha desc
">
                            </asp:SqlDataSource>
<span class="add-on">
&nbsp;CON LA DEL
</span> 
<asp:DropDownList ID="DDLRAEL2" runat="server" DataSourceID="SqlDataSourceRales" 
                                DataTextField="texto" DataValueField="valor" Width="140px">
        </asp:DropDownList>
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass ="btn" BorderStyle="Solid" BorderWidth="1px" 
                                BorderColor="#BCC7D8"><i class ="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
</div> 
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top">
                            <asp:SqlDataSource ID="SqlDataSourceRale1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALE1 as VARCHAR(50)
DECLARE @RALE2 as VARCHAR(50)
DECLARE @RALE_RCV1 as VARCHAR(50)
DECLARE @RALE_RCV2 as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(50)
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @RALE1=?

SET @RALE2=replace(@RALE1,'33A','01A')
SET @RALE_RCV1=REPLACE(@RALE1,'ACOP','ARCV')
SET @RALE_RCV2=REPLACE(@RALE2,'ACOP','ARCV')

if @RALE1='x' or @RALE2='x'
begin
select '' as INCIDENCIA,'' as PATRONES,'' as CREDITOS,'' as IMPORTE
end
else
begin
exec('
select
[INC] as INCIDENCIA
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,sum([IMPORTE]) as IMPORTE
,sum(DIAS)/count(*)as DIAS_PROMEDIO
from (
SELECT
''33'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE1+'] 
where inc not in (''00'')
union all
SELECT
''01'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE2+'] 
where inc not in (''00'')
UNION ALL
SELECT
''33'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE_RCV1+'] 
where inc not in (''00'')
union all
SELECT
''01'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE_RCV2+'] 
where inc not in (''00'')
) as resultado
WHERE TIPO LIKE '''+@TIPO_COP_RCV+'''
AND SUBDEL LIKE '''+@SUBDEL+'''
group by [INC]
order by inc
')
end
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLRAEL1" DefaultValue="x" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridViewRale1" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSourceRale1" AllowSorting="True" ShowFooter="True">
                                <Columns>
                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                        SortExpression="INCIDENCIA" />
                                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DIAS_PROMEDIO" DataFormatString="{0:N0}" 
                                        HeaderText="DIAS PROMEDIO" SortExpression="DIAS_PROMEDIO">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                            </asp:GridView>
                                    </td>
                                    <td style="vertical-align: top; text-align: left">
                            <asp:SqlDataSource ID="SqlDataSourceRale3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALE1 as VARCHAR(50)
DECLARE @RALE2 as VARCHAR(50)
DECLARE @RALE_RCV1 as VARCHAR(50)
DECLARE @RALE_RCV2 as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(50)
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @RALE1=?

SET @RALE2=replace(@RALE1,'33A','01A')
SET @RALE_RCV1=REPLACE(@RALE1,'ACOP','ARCV')
SET @RALE_RCV2=REPLACE(@RALE2,'ACOP','ARCV')

if @RALE1='x' or @RALE2='x'
begin
select '' as INCIDENCIA,'' as PATRONES,'' as CREDITOS,'' as IMPORTE
end
else
begin
exec('
select
[INC] as INCIDENCIA
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,sum([IMPORTE]) as IMPORTE
,sum(DIAS)/count(*)as DIAS_PROMEDIO
from (
SELECT
''33'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE1+'] 
where inc not in (''00'')
union all
SELECT
''01'' AS SUBDEL
,''COP'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE2+'] 
where inc not in (''00'')
UNION ALL
SELECT
''33'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE_RCV1+'] 
where inc not in (''00'')
union all
SELECT
''01'' AS SUBDEL
,''RCV'' AS TIPO
,[INC]
,REGPATR
,NUMCRED
,[IMPORTE]
,DIAS
FROM [rale].[dbo].['+@RALE_RCV2+'] 
where inc not in (''00'')
) as resultado
WHERE TIPO LIKE '''+@TIPO_COP_RCV+'''
AND SUBDEL LIKE '''+@SUBDEL+'''
group by [INC]
order by inc
')
end
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLRAEL2" DefaultValue="x" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridViewRale3" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSourceRale3" AllowSorting="True" ShowFooter="True">
                                <Columns>
                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                        SortExpression="INCIDENCIA" />
                                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DIAS_PROMEDIO" DataFormatString="{0:N0}" 
                                        HeaderText="DIAS PROMEDIO" SortExpression="DIAS_PROMEDIO">
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                            </asp:GridView>
                                    </td>
                                    <td style="vertical-align: top">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
    </div>
</asp:Content>

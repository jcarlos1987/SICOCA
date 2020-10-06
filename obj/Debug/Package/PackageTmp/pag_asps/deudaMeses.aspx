<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master"  CodeBehind="deudaMeses.aspx.vb" Inherits="WebSIRECA.deudaMeses" %>
<asp:Content ID="header1" runat ="server" ContentPlaceHolderID ="head" >
    <script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />


    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content id="contend1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <asp:Panel ID="Panel1" runat="server" BorderStyle="None" 
            HorizontalAlign="Center">        
            <table style="width:100%;">
                <tr>
                    <td align="center">
<div class="btn btn-group input-prepend">
                        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                            CssClass="btn" Width="120px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLTipoCopRcv" runat="server" AutoPostBack="True" 
                            CssClass="btn" Width="140px">
                            <asp:ListItem Value="COP">COP</asp:ListItem>
                            <asp:ListItem>RCV</asp:ListItem>
                            <asp:ListItem Value="%">COP y RCV</asp:ListItem>
                        </asp:DropDownList>
<span class="add-on">
                        <asp:Label ID="Label1" runat="server" Text="TD:"></asp:Label>
</span>
                        <asp:DropDownList ID="DDLTipoDoc" runat="server" AutoPostBack="True" 
                            CssClass="btn" Width="100px">
                            <asp:ListItem Value="%">02 y 03</asp:ListItem>
                            <asp:ListItem Value="02">02</asp:ListItem>
                            <asp:ListItem Value="03">03</asp:ListItem>
                        </asp:DropDownList>
<span class="add-on">
                        <asp:Label ID="Label2" runat="server" Text="PERIODO:"></asp:Label>
</span>
                        <asp:DropDownList ID="DDLMes0" runat="server" CssClass="btn" Width="120px">
                            <asp:ListItem Value="01">Enero</asp:ListItem>
                            <asp:ListItem Value="02">Febrero</asp:ListItem>
                            <asp:ListItem Value="03">Marzo</asp:ListItem>
                            <asp:ListItem Value="04">Abril</asp:ListItem>
                            <asp:ListItem Value="05">Mayo</asp:ListItem>
                            <asp:ListItem Value="06">Junio</asp:ListItem>
                            <asp:ListItem Value="07">Julio</asp:ListItem>
                            <asp:ListItem Value="08">Agosto</asp:ListItem>
                            <asp:ListItem Value="09">Septiembre</asp:ListItem>
                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLAnio0" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="ANIO" DataValueField="ANIO" CssClass="btn" Width="100px">
                        </asp:DropDownList>
<span class="add-on">
                        -
</span>
                        <asp:DropDownList ID="DDLMes" runat="server" CssClass="btn" Width="120px">
                            <asp:ListItem Value="01">Enero</asp:ListItem>
                            <asp:ListItem Value="02">Febrero</asp:ListItem>
                            <asp:ListItem Value="03">Marzo</asp:ListItem>
                            <asp:ListItem Value="04">Abril</asp:ListItem>
                            <asp:ListItem Value="05">Mayo</asp:ListItem>
                            <asp:ListItem Value="06">Junio</asp:ListItem>
                            <asp:ListItem Value="07">Julio</asp:ListItem>
                            <asp:ListItem Value="08">Agosto</asp:ListItem>
                            <asp:ListItem Value="09">Septiembre</asp:ListItem>
                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLAnio" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="ANIO" DataValueField="ANIO" CssClass="btn" Width="100px">
                        </asp:DropDownList>

                        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FBDD81" BorderStyle="Solid" BorderWidth="1px" CssClass="btn">ACTUALIZAR</asp:LinkButton>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--SqlDataSource2
DECLARE @RALECOP01 as VARCHAR(50)
DECLARE @RALECOP33 as VARCHAR(50)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)

exec('
SELECT year([PERIODO]) as [ANIO]	
FROM 
(
select * from [rale].[dbo].['+@RALECOP01+']
union all
select * from [rale].[dbo].['+@RALECOP33+']
) as resultado
where len([PERIODO]) not in (''7'')
and td=''02'' and inc not in (''09'',''05'',''51'',''52'',''53'')
group  by year([PERIODO]) order by year([PERIODO]) desc
')
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
</div>
                    </td>
                    <td align="left">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" GroupingText="MOVIMIENTOS">
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            BorderStyle="Solid" BorderWidth="1px" 
                            Caption="&lt;strong&gt;VIVOS, MOV &lt;&gt; 2&lt;br/&gt; INC &lt;&gt; (09,05,51,52,53,06,12,14,15,16,19,25,23,21)&lt;/strong&gt;" 
                            CellPadding="4" CellSpacing="1" 
                            DataSourceID="SqlDataSource4" 
                            HorizontalAlign="Center" Width="515px" Font-Size="10pt" 
                            BorderColor="#CCCCCC">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink2" runat="server" 
                                            NavigateUrl='<%# "deudaMesesDetalles.aspx?fech_fin=" & Eval("fechafin") & "&movCancelados=ok&subdel=" & Eval("subdel") & "&fech_ini=" & Eval("fechaini") & "&tipo_doc=" & Eval("tipodoc") & "&tipo_cop_rcv=" & Eval("tipocoprcv")& "&patrones=" & Eval("PATRONES") %>' 
                                            rel="gb_page_fs[]" Text='<%# Eval("PATRONES","{0:N0}") %>' title="Detalles"></asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="-- SqlDataSource4
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
SET @SUBDEL=?
SET @PERIODO_INI='01/'+?+'/'+?
SET @PERIODO_FIN='01/'+?+'/'+?
SET @TIPO_DOC=?
SET @TIPO_COP_RCV=?

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
SELECT 
COUNT(distinct([REGPATR])) AS PATRONES,SUM([IMPORTE]) AS IMPORTE
,'''+@PERIODO_INI+''' as fechaini
,'''+@PERIODO_FIN+''' as fechafin
,'''+@RALECOP01+''' as ralex
,'''+@SUBDEL+''' as subdel
,'''+@TIPO_DOC+''' as tipodoc
,'''+@TIPO_COP_RCV+''' as tipocoprcv
FROM (
select ''01'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP01+']
UNION ALL
select ''33'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP33+']
UNION ALL
select ''01'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV01+']
UNION ALL
select ''33'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV33+']
) as rale
WHERE LEN(PERIODO) NOT IN (''7'')
and rale.inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel LIKE '''+@SUBDEL+''' and pa.[regpatr]=replace(rale.[REGPATR],''-'','''') and aplica like ''%PAE'')
and PERIODO BETWEEN CONVERT(DATETIME,'''+@PERIODO_INI+''',103) and CONVERT(DATETIME,'''+@PERIODO_FIN+''',103)
'+@TIPO_DOC2+'  and [MOV] not in (''2'') AND SUBDEL LIKE '''+@SUBDEL+''' AND TIPO LIKE '''+@TIPO_COP_RCV+'''
')
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLTipoDoc" DefaultValue="%" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLTipoCopRcv" DefaultValue="%" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                            BorderStyle="Solid" BorderWidth="1px" 
                            
                            
                            
                            Caption="&lt;strong&gt;CANCELADOS, MOV=2&lt;br/&gt; INC &lt;&gt; (09,05,51,52,53,06,12,14,15,16,19,25,23,21)&lt;/strong&gt;" CellPadding="4" 
                            CellSpacing="1" DataSourceID="SqlDataSource5" HorizontalAlign="Center" 
                            Width="515px" Font-Size="10pt" BorderColor="#CCCCCC">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink3" runat="server" 
                                            NavigateUrl='<%# "deudaMesesDetalles.aspx?fech_fin=" & Eval("fechafin") & "&movCancelados=no&subdel=" & Eval("subdel") & "&fech_ini=" & Eval("fechaini") & "&tipo_doc=" & Eval("tipodoc") & "&tipo_cop_rcv=" & Eval("tipocoprcv") & "&patrones=" & Eval("PATRONES") %>'
                                            rel="gb_page_fs[]" Text='<%# Eval("PATRONES","{0:N0}") %>' title="Detalles"></asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="-- SqlDataSource4
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
SET @SUBDEL=?
SET @PERIODO_INI='01/'+?+'/'+?
SET @PERIODO_FIN='01/'+?+'/'+?
SET @TIPO_DOC=?
SET @TIPO_COP_RCV=?

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
SELECT 
COUNT(distinct([REGPATR])) AS PATRONES,SUM([IMPORTE]) AS IMPORTE
,'''+@PERIODO_INI+''' as fechaini
,'''+@PERIODO_FIN+''' as fechafin
,'''+@RALECOP01+''' as ralex
,'''+@SUBDEL+''' as subdel
,'''+@TIPO_DOC+''' as tipodoc
,'''+@TIPO_COP_RCV+''' as tipocoprcv
FROM (
select ''01'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP01+']
UNION ALL
select ''33'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP33+']
UNION ALL
select ''01'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV01+']
UNION ALL
select ''33'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV33+']
) as rale
WHERE LEN(PERIODO) NOT IN (''7'')
and rale.inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel LIKE '''+@SUBDEL+''' and pa.[regpatr]=replace(rale.[REGPATR],''-'','''') and aplica like ''%PAE'')
and PERIODO BETWEEN CONVERT(DATETIME,'''+@PERIODO_INI+''',103) and CONVERT(DATETIME,'''+@PERIODO_FIN+''',103)
'+@TIPO_DOC2+'  and [MOV] in (''2'') AND SUBDEL LIKE '''+@SUBDEL+''' AND TIPO LIKE '''+@TIPO_COP_RCV+'''
')
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLTipoDoc" DefaultValue="%" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLTipoCopRcv" DefaultValue="%" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>            
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" GroupingText="ADEUDO">
        <table style="width:100%;">
            <tr>
                <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" AllowSorting="True" 
            Width="515px" 
                        Caption="&lt;strong&gt;POR PERIODOS&lt;br/&gt; INC &lt;&gt; (09,05,51,52,53,06,12,14,15,16,19,25,23,21) &lt;br/&gt; MOV &lt;&gt;2&lt;/strong&gt;" ShowFooter="True" 
            HorizontalAlign="Center" CellSpacing="1" Font-Size="10pt">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" >
                <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "deudaMesesPeriodo.aspx?periodo=" & Eval("PERIODOX") & "&subdel=" & Eval("subdel") & "&patrones=" & Eval("PATRONES")& "&tipodoc=" & Eval("tipodoc")& "&tipocoprcv=" & Eval("tipocoprcv")& "&fech_ini=" & Eval("fech_ini")& "&fech_fin=" & Eval("fech_fin") %>' 
                            Text='<%# Eval("PATRONES","{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#999966" ForeColor="#000066" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" BackColor="#E3EAEB" />
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
SET @SUBDEL=?
SET @PERIODO_INI='01/'+?+'/'+?
SET @PERIODO_FIN='01/'+?+'/'+?
SET @TIPO_DOC=?
SET @TIPO_COP_RCV=?

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
SELECT substring(rale.[PERIODO],4,7) as PERIODO
,'''+@SUBDEL+''' as subdel
,'''+@TIPO_DOC+''' as tipodoc
,'''+@TIPO_COP_RCV+''' as tipocoprcv
,'''+@PERIODO_INI+''' as fech_ini
,'''+@PERIODO_FIN+''' as fech_fin
,rale.[PERIODO] as PERIODOX
,COUNT(distinct(rale.[REGPATR])) as PATRONES
,COUNT(rale.NUMCRED) as CREDITOS
,SUM(ptn.COTIZ) as COTIZANTES
,SUM(rale.[IMPORTE]) as IMPORTE
FROM (
select ''01'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP01+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''33'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP33+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''01'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV01+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''33'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV33+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
) as rale left join sireca.dbo.patrones as ptn on ptn.regpat=replace(rale.regpatr,''-'','''')
where len([PERIODO]) not in (''7'')
'+@TIPO_DOC2+' AND rale.SUBDEL like '''+@SUBDEL+''' '+@TIPO_COP_RCV2+'
and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel like '''+@SUBDEL+''' and pa.[regpatr]=replace(rale.[REGPATR],''-'','''') and aplica like ''%PAE'')
group  by [PERIODO]
order by convert(datetime,[PERIODO],103) desc
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" 
                    Name="?" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipoDoc" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipoCopRcv" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
                <td style="vertical-align: top">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceResumenPeriodos" CellPadding="3" Width="515px" AllowSorting="True" 
                        Caption="&lt;strong&gt;POR NUMERO DE PERIODOS&lt;br/&gt; INC &lt;&gt; (09,05,51,52,53,06,12,14,15,16,19,25,23,21)&lt;br/&gt; MOV &lt;&gt; 2&lt;/strong&gt;" ShowFooter="True" 
            HorizontalAlign="Center" BorderStyle="Solid" BorderWidth="1px" CellSpacing="1" 
                        Font-Size="10pt" BorderColor="#CCCCCC">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" 
                    SortExpression="PERIODOS" >
                <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "deudasNumMeses.aspx?subdel=" & Eval("subdel") & "&patrones=" & Eval("PATRONES")& "&tipodoc=" & Eval("tipodoc")& "&tipocoprcv=" & Eval("tipocoprcv")& "&fech_ini=" & Eval("fech_ini")& "&fech_fin=" & Eval("fech_fin")& "&numperiodos=" & Eval("PERIODOS") %>' 
                            Text='<%# Eval("PATRONES","{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#999966" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Right" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceResumenPeriodos" runat="server" 
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
SET @SUBDEL=?
SET @PERIODO_INI='01/'+?+'/'+?
SET @PERIODO_FIN='01/'+?+'/'+?
SET @TIPO_DOC=?
SET @TIPO_COP_RCV=?

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
'''+@SUBDEL+''' as subdel
,'''+@TIPO_DOC+''' as tipodoc
,'''+@TIPO_COP_RCV+''' as tipocoprcv
,'''+@PERIODO_INI+''' as fech_ini
,'''+@PERIODO_FIN+''' as fech_fin
,PERIODOS
,COUNT(DISTINCT(PATRONES)) AS PATRONES
,SUM(CREDITOS) as CREDITOS
,SUM(COTIZANTES) AS COTIZANTES
,SUM(IMPORTE) AS IMPORTE
from (
SELECT rale.[REGPATR] as PATRONES
,'''+@SUBDEL+''' as subdel
,'''+@TIPO_DOC+''' as tipodoc
,'''+@TIPO_COP_RCV+''' as tipocoprcv
,COUNT(distinct(rale.[PERIODO])) as PERIODOS
,COUNT(rale.NUMCRED) as CREDITOS
,MAX(ptn.COTIZ) as COTIZANTES
,SUM(rale.[IMPORTE]) as IMPORTE
FROM (
select ''01'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP01+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''33'' AS SUBDEL,''COP'' AS TIPO,* from [rale].[dbo].['+@RALECOP33+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''01'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV01+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
UNION ALL
select ''33'' AS SUBDEL,''RCV'' AS TIPO,* from [rale].[dbo].['+@RALERCV33+']
where [MOV] not in (''2'') 
and inc not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and [PERIODO] between convert(datetime,'''+@PERIODO_INI+''',103) and convert(datetime,'''+@PERIODO_FIN+''',103)
) as rale left join sireca.dbo.patrones as ptn on ptn.regpat=replace(rale.regpatr,''-'','''')
where len([PERIODO]) not in (''7'')
'+@TIPO_DOC2+' AND rale.SUBDEL like '''+@SUBDEL+''' '+@TIPO_COP_RCV2+'
and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel like '''+@SUBDEL+''' and pa.[regpatr]=replace(rale.[REGPATR],''-'','''') and aplica like ''%PAE'')
group  by rale.[REGPATR]
--order by PERIODOS desc
) as resultado
group by PERIODOS
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" 
                    Name="?" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipoDoc" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipoCopRcv" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>
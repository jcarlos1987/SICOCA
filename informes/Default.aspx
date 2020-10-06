<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default18" %>
<asp:Content ID="header1" runat ="server" ContentPlaceHolderID ="head" >
    
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .style1
    { height: 21px; }
    .style3
    { width: 55px; }
        .style5
        {
            height: 21px;
            width: 186px;
        }
        .style6
        {
            width: 186px;
        }
    </style>
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" Text="FECH. INICIO:"></asp:Label>
        <asp:DropDownList ID="DDLFInicio" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSourceFechInicio" DataTextField="FECHA" 
            DataValueField="FECHA">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceFechInicio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT convert(varchar,day(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,month(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,year(convert(datetime,FECH_ASIG,103))) as FECHA
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
WHERE subdel=?
group by convert(datetime,FECH_ASIG,103)
order by convert(datetime,FECH_ASIG,103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="FECH. FIN:"></asp:Label>
        <asp:DropDownList ID="DDLFFin" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSourceFechFin" DataTextField="FECHA" 
            DataValueField="FECHA">
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="Ejecutor"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="SqlDataSourceEjecutor" DataTextField="nombre" 
            DataValueField="id_usuario">
            <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceEjecutor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
[ID_RESPONSABLE] as id_usuario
,upper((SELECT uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.id=[ID_RESPONSABLE])) as nombre
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=?
/*and convert(datetime,FECH_ASIG,103) 
between convert(datetime,?,103)
and convert(datetime,?,103)*/
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <hr />
        <asp:SqlDataSource ID="SqlDataSourceFechFin" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT convert(varchar,day(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,month(convert(datetime,FECH_ASIG,103)))+'-'+convert(varchar,year(convert(datetime,FECH_ASIG,103))) as FECHA
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
WHERE subdel=?
group by convert(datetime,FECH_ASIG,103)
order by convert(datetime,FECH_ASIG,103) desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="PInformacion" runat="server" HorizontalAlign="Center" 
            Visible="False">
        <center >
            <table style="width:100%;" border="0" cellpadding="0" cellspacing="0" 
                frame="below">
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:ImageButton ID="IBInspector" runat="server" Height="188px" 
                            ImageUrl="~/imagenes/usuarios/avatar/default.jpg" Width="186px" 
                            BorderColor="Black" BorderStyle="Double" />
                    </td>
                    <td class="style1">
                        <table style="width:100%;">
                            <tr bgcolor="#D4D0C8">
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Nombre:</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LNombre" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    </td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LAntiguedad" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#D4D0C8">
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Cargo:</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LCargo" runat="server"></asp:Label>
                                    (INSPECTOR B)</td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Credencial:</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LCredencial" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;" 
                                    bgcolor="#D4D0C8">
                                    Subdelegacion:</td>
                                <td align="left"  bgcolor="#D4D0C8" style="font-size: 24px">
                                    <asp:Label ID="LSubdel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    &nbsp;</td>
                                <td align="left" style="font-size: 24px" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Recaudacion:</td>
                                <td align="left" style="font-size: 24px" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Meta:</td>
                                <td align="left" style="font-size: 24px" >
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="style1">
                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSourceReporte1" 
                            Width="523px" BackColor="Transparent">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1" XValueMember="TIPO_TRABAJO" 
                                    YValueMembers="PATRONES" Label="#PERCENT{P}" Legend="Legend1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Alignment="Center">
                                    <CellColumns>
                                        <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="color">
                                            <Margins Left="15" Right="15" />
                                        </asp:LegendCellColumn>
                                        <asp:LegendCellColumn Name="tipo">
                                            <Margins Left="15" Right="15" />
                                        </asp:LegendCellColumn>
                                        <asp:LegendCellColumn Alignment="MiddleLeft" Name="nombre" Text="#AXISLABEL">
                                            <Margins Left="15" Right="15" />
                                        </asp:LegendCellColumn>
                                        <asp:LegendCellColumn Name="Column2" Text="#VAL de #TOTAL">
                                            <Margins Left="15" Right="15" />
                                        </asp:LegendCellColumn>
                                    </CellColumns>
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                        </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            </center>
        </asp:Panel>
        <asp:GridView ID="GVReporte1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceReporte1" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;REPORTE PRINCIPAL SALDO 0&lt;/strong&gt;" CellPadding="3" 
            GridLines="Vertical" AllowSorting="True" Font-Bold="False" 
            ShowFooter="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="subdel" HeaderText="subdel" 
                    SortExpression="subdel" />
                <asp:TemplateField HeaderText="TIPO_TRABAJO" SortExpression="TIPO_TRABAJO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" title="Detalles" rel="gb_page_fs[]"  
                            NavigateUrl='<%# "reporteDescriptivo.aspx?subdel=" & Eval("subdel") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=general&patrones=" & Eval("PATRONES") & "&creditos=" & Eval("CREDITOS") & "&cotizantes=" & Eval("COTIZANTES") & "&importe=" & Eval("ADEUDO") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                            Text='<%# Eval("TIPO_TRABAJO") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" title="Detalles" rel="gb_page_fs[]"  
                            NavigateUrl='<%# "detallesSeleccion.aspx?subdel=" & Eval("subdel") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=general&tipo_estado=abcde&creditos=" & Eval("CREDITOS") & "&cotizantes=" & Eval("COTIZANTES") & "&importe=" & Eval("ADEUDO") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                            Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES PROMEDIO" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                    SortExpression="ADEUDO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField HeaderText="%">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" Font-Bold="True" 
                Font-Italic="False" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceReporte1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
SET @SUBDEL=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @ID_EJECUTOR=?
UPDATE [sirecacobros].[dbo].[ecoTiposHistorial] 
SET [TIPO_TRABAJO]=(CASE
WHEN (SELECT COUNT(*) FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth1 WHERE eth1.REGPATR=eth.REGPATR AND eth1.INC_CAP IN ('31','x'))&gt;0 THEN 'SALDO'
ELSE 'ATENDIDO' END)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as  eth 
WHERE subdel=@SUBDEL
---------------------------------------------------------------------REPORTE SUBDELEGACIONAL
select subdel
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,[TIPO_TRABAJO]
,@ID_EJECUTOR as id_ejecutor
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth
where 
subdel=@SUBDEL 
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] like @ID_EJECUTOR+'%'
group by subdel,[TIPO_TRABAJO]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource><hr />
        <asp:DropDownList ID="DDLTipoTrabajo" runat="server" AutoPostBack="True">
            <asp:ListItem>ATENDIDO</asp:ListItem>
            <asp:ListItem>SALDO</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="GVDepurcion" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceDepuracion" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            Caption="&lt;strong&gt;Dupuracion&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSourceDepuracion" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @RALECOP as varchar(50)
DECLARE @RALERCV as varchar(50)
DECLARE @FECH_INICIO as varchar(50)
DECLARE @FECH_FIN as varchar(50)
DECLARE @ID_EJECUTOR as varchar(50)
DECLARE @TIPO_TRABAJO as varchar(50)   --SALDO,ATENDIDO
DECLARE @SUBDEL as varchar(2)
SET @SUBDEL = ?
SET @TIPO_TRABAJO=?
SET @FECH_INICIO = ?
SET @FECH_FIN = ?
SET @ID_EJECUTOR = ?

SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)
exec(
'SELECT (case when rale.NUMCRED is null then ''DEPURADO COP'' else ''COP'' end) as TIPO,count(distinct(eth.[REGPATR])) as PATRONES,count(*) as CREDITOS,sum(adeudo) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as eth
left join rale.dbo.[' + @RALECOP + '] as rale
on eth.REGPATR=rale.REGPATR and convert(int,eth.[NUMCRED])=convert(int,rale.[NUMCRED])
where tipoFile=''COP'' and eth.subdel='''+@SUBDEL+''' 
and [TIPO_TRABAJO]='''+@TIPO_TRABAJO+'''
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,''' + @FECH_INICIO + ''',103)
and convert(datetime,''' + @FECH_FIN + ''',103)
and convert(nvarchar(50),[ID_RESPONSABLE]) like ''' + @ID_EJECUTOR + '''+''%''
group by (case when rale.NUMCRED is null then ''DEPURADO COP'' else ''COP'' end)
union
SELECT (case when rale.NUMCRED is null then ''DEPURADO RCV'' else ''RCV'' end) as TIPO,count(distinct(eth.[REGPATR])) as PATRONES,count(*) as CREDITOS,sum(adeudo) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as eth
left join rale.dbo.[' + @RALERCV + '] as rale
on eth.REGPATR=rale.REGPATR and convert(int,eth.[NUMCRED])=convert(int,rale.[NUMCRED])
where tipoFile=''RCV'' and eth.subdel='''+@SUBDEL+''' 
and [TIPO_TRABAJO]='''+@TIPO_TRABAJO+'''
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,'''+@FECH_INICIO+''',103)
and convert(datetime,'''+@FECH_FIN+''',103)
and convert(nvarchar(50),[ID_RESPONSABLE]) like ''' + @ID_EJECUTOR + '''+''%''
group by (case when rale.NUMCRED is null then ''DEPURADO RCV'' else ''RCV'' end) '
)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipoTrabajo" DefaultValue="VACIO" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFInicio" DefaultValue="01-01-2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFFin" DefaultValue="01-01-2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="999999" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="PObservaciones" runat="server" 
            GroupingText="Observaciones (INSPECTOR)">
            <asp:GridView ID="GVObservacion" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSourceObservacion" 
                EmptyDataText="SIN COMENTARIOS" ForeColor="#333333" GridLines="None" 
                ShowHeader="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="OBSERVO" HeaderText="OBSERVO" ReadOnly="True" 
                        SortExpression="OBSERVO" >
                    <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FECH_OBSERVACION" DataFormatString="({0:d}):" 
                        HeaderText="FECH_OBSERVACION" SortExpression="FECH_OBSERVACION">
                    <ItemStyle Font-Italic="True" Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                        SortExpression="OBSERVACION" >
                    <ItemStyle HorizontalAlign="Left" />
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
            <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_oi] as ID
,(select nombre from fiscamovil.dbo.usuarios where [id]=[id_inspector]) as INSPECTOR
,upper((select nombre from fiscamovil.dbo.usuarios where [id]=[id_observo])) as OBSERVO
,[fecha_observacion] as FECH_OBSERVACION
,[observacion] as OBSERVACION
FROM [sirecaObservaciones].[dbo].[ObservacionInspector]
WHERE [id_inspector]=?
order by [fecha_observacion]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="TBObservacion" runat="server" MaxLength="254" Width="424px"></asp:TextBox>
            <asp:Button ID="BComentar" runat="server" Text="Comentar" />
            <asp:Label ID="LError" runat="server" Font-Bold="True" Font-Size="10pt" 
                ForeColor="#CC0000"></asp:Label>
        </asp:Panel>
</div>
</asp:Content>

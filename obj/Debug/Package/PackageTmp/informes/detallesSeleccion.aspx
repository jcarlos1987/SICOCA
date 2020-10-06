<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="detallesSeleccion.aspx.vb" Inherits="WebSIRECA.detallesSeleccion1" %>



<asp:Content ID="contenido1" runat="server" ContentPlaceHolderID ="head" >
    <title></title>
    
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="contenido2" runat="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:GridView ID="GVDRepotGeneral" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceReportGeneral" Font-Size="10pt" 
            GridLines="Vertical" HorizontalAlign="Center" AllowSorting="True" 
            ShowFooter="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="PATRON">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("PATRON", "/WebSireca/observacionPatronal/Default.aspx?regpat={0}&razon=default") %>' 
                            Text='<%# Eval("PATRON") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detallesCreditos.aspx?regpat=" & Eval("PATRON") & "&fech_inicio=" & Eval("fech_inicio") & "&fech_fin=" & Eval("fech_fin") & "&subdel=" & Eval("subdel") & "&razonSocial=" & Eval("RAZON_SOCIAL") & "&cotizantes=" & Eval("COTIZANTES") & "&adeudo=" & Eval("ADEUDO") & "&tipo_trabajo=" & Eval("tipo_trabajo") & "&tipo_reporte=" & Eval("tipo_reporte") & "&tipo_estado=" & Eval("tipo_estado") & "&id_ejecutor=" & Eval("id_ejecutor") %>' 
                            Text='<%# Eval("CREDITOS") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES" 
                    NullDisplayText="0">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                    ReadOnly="True" SortExpression="ADEUDO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PORCENTAJE" DataFormatString="{0:P2}" HeaderText="%" 
                    SortExpression="PORCENTAJE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceReportGeneral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRABAJO VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
SET @SUBDEL=?
SET @TIPO_TRABAJO=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_REPORTE=?
SET @ID_EJECUTOR=?
SET @IMPORT_TOTAL=?
---------------------------------------------------------------------REPORTE SUBDELEGACIONAL
select
REGPATR as PATRON
,@TIPO_TRABAJO as tipo_trabajo
,@SUBDEL as subdel
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_REPORTE as tipo_reporte
,@ID_EJECUTOR as id_ejecutor
,'abcd' as  tipo_estado
,max(RAZON_SOCIAL) as RAZON_SOCIAL
,count(*) as CREDITOS
,max(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS eth
where 
subdel=@SUBDEL 
and [TIPO_TRABAJO]=@TIPO_TRABAJO 
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103)
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] like @ID_EJECUTOR+'%'
group by REGPATR">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="tipo_trabajo" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_inicio" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="0000" Name="?" 
                    QueryStringField="tipo_reporte" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="id_ejecutor" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="importe" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceReportDescrip" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRABAJO VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_ESTADO VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
SET @SUBDEL=?
SET @TIPO_TRABAJO=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ESTADO=?
SET @TIPO_REPORTE=?
SET @ID_EJECUTOR=?
SET @IMPORT_TOTAL=?
---------------------------------------------------------------------REPORTE SUBDELEGACIONAL
SELECT 
REGPATR as PATRON
,@TIPO_TRABAJO as tipo_trabajo
,@SUBDEL as subdel
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_ESTADO as tipo_estado
,@TIPO_REPORTE as tipo_reporte
,@ID_EJECUTOR as id_ejecutor
,max(RAZON_SOCIAL) as RAZON_SOCIAL
,count(*) as CREDITOS
,max(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
and [TIPO_TRABAJO]=@TIPO_TRABAJO
and [ID_RESPONSABLE] like @ID_EJECUTOR+'%'
and (case
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
ELSE [INC_CAP]
end)=@TIPO_ESTADO
group by REGPATR
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="tipo_trabajo" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_inicio" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="tipo_estado" />
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="tipo_reporte" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="id_ejecutor" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="importe" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

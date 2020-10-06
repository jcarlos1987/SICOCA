<%@ Page Language="vb" MasterPageFile ="~/Site.Master" AutoEventWireup="false" CodeBehind="reporteGeneral.aspx.vb" Inherits="WebSIRECA.reporteGeneral" %>
<asp:Content ID ="Content2" runat ="server" ContentPlaceHolderID ="head"  >
<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
    </script>

    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="content1" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server"  >
        <asp:HiddenField ID="HFsubdel" runat="server" />
        <asp:Label ID="Lsubdel" runat="server" Text="Subdelegación: "></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="Periodo: "></asp:Label>
        <asp:DropDownList ID="DDLPeriodo" runat="server" 
            DataSourceID="SqlDataSourcePeriodo" DataTextField="fechaEco" 
            DataValueField="fechaEco">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT DISTINCT eco.fechaEco FROM sireca.dbo.eco AS eco GROUP BY eco.fechaEco ORDER BY 1 DESC">
        </asp:SqlDataSource>
        <asp:Label ID="Label3" runat="server" Text="Tipo Eco: "></asp:Label>
        <asp:DropDownList ID="DDLEco" runat="server">
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>COMP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
            <asp:ListItem>RCVCOMP</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Actualizar" />
        <asp:Panel ID="Panel2" runat="server" GroupingText="Reporte General"><br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourceMesesFaltantes" ForeColor="#FF6600" 
            GridLines="Horizontal" BorderStyle="None" ShowHeader="False" Font-Bold="True">
            <Columns>
                <asp:BoundField DataField="tipoBusqueda" HeaderText="tipoBusqueda" 
                    SortExpression="tipoBusqueda" Visible="False" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "DetallesRepGeneral.aspx?tipo=deudas&periodo=" & Eval("fechaEco") & "&subdel=" & Eval("subdel") %>' 
                            Text='<%# Eval("PATRONES", "Deudas de este y el periodo anterior {0} patrones") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ControlStyle ForeColor="#FF6500" />
                    <ItemStyle ForeColor="#FF6500" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTE" DataFormatString=" con {0} cotizantes" 
                    HeaderText="COTIZANTE" SortExpression="COTIZANTE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="OMISION" 
                    DataFormatString="y {0:C} de omision." HeaderText="OMISION" 
                    SortExpression="OMISION" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" 
                HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMesesFaltantes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @PERIODO FLOAT
DECLARE @TIPOBUSQUEDA VARCHAR(50)
DECLARE @PERIODO2 FLOAT
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPOBUSQUEDA = '2'
SET @PERIODO2 = @PERIODO-10000

use sireca
drop table reportePorCobrar
select * into reportePorCobrar
from (

SELECT distinct([REG#PATRONAL]),tipoBusqueda = '2'
, [id]
,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[incidencia]) as incidencia
      ,[TP]
      ,[NOMBRE O RAZON SOCIAL]
      ,[CREDITO]
      ,[COTIZ]
      ,[DIAS]
      ,[CL]
      ,[ACT#]
      ,[PRIMA]
      ,[OMISION]
      ,[COP/ACT]
      ,[RECARGOS]
      ,[MULTA]
      ,[TOTAL]
      ,[fechaEco]
      ,[responsable]
      ,[fechaSeleccion]
      ,[cambiarIncidencia]
      ,[tipoECO]
      ,[diasDisponibles]
      ,[clave]
      ,[nomResponsable]
      ,[horaCitatorio]
      ,[fechaCaptura]
      ,[ecoOriginal]
      ,[cobrarMulta]
      ,[subdel]
      ,[sector]
      ,[grado1]
      ,[grado3]
FROM [sireca].[dbo].[eco] as eco
where fechaEco in (@PERIODO) and subdel=@SUBDEL
and [REG#PATRONAL] 
in (
SELECT distinct([REG#PATRONAL]) FROM [sireca].[dbo].[eco] as eco2
where eco2.fechaEco in (@PERIODO2) and eco2.[REG#PATRONAL]=eco.[REG#PATRONAL] and eco2.subdel=@SUBDEL 
and (eco2.incidencia not in ('9','A','BD','RE','PAGADO','POR PROCESAR') or eco2.incidencia is null)
)
and (incidencia not in ('9','A','BD','RE','PAGADO','POR PROCESAR') or incidencia is null)

) as temporal
select ran.subdel,ran.fechaEco,ran.tipoBusqueda, count(*) as PATRONES,sum(ran.cotiz) AS COTIZANTE,sum(ran.omision) AS OMISION
FROM [sireca].[dbo].reportePorCobrar as ran
WHERE tipoBusqueda=@TIPOBUSQUEDA
group by ran.subdel,ran.fechaEco,ran.tipoBusqueda
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>    <br />
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderWidth="0px" 
            CellPadding="2" DataSourceID="SqlDataSourceAntDesNot" ForeColor="#3333CC" 
            GridLines="Horizontal" BorderStyle="None" ShowHeader="False" Font-Bold="True">
        <Columns>
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" 
                SortExpression="ESTADO" 
                DataFormatString="- Pagado {0} de la notificacion:" />
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                        NavigateUrl='<%# "DetallesRepGeneral.aspx?tipo=pagados&periodo=" & Eval("fechaEco") & "&subdel=" & Eval("subdel") & "&tipoEco=" & Eval("tipoEco") & "&estado=" & Eval("ESTADO") %>' 
                        Text='<%# Eval("PATRONES", "{0} patrones") %>'></asp:HyperLink>
                </ItemTemplate>
                <ControlStyle ForeColor="#3130CE" />
            </asp:TemplateField>
            <asp:BoundField DataField="COTIZANTE" HeaderText="COTIZANTE" 
                SortExpression="COTIZANTE" DataFormatString="con {0} cotizantes" />
            <asp:BoundField DataField="OMISION" DataFormatString=" y {0:C} de omision." 
                HeaderText="OMISION" SortExpression="OMISION" />
        </Columns>
        <EditRowStyle BorderColor="White" BorderStyle="None" BorderWidth="0px" />
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" 
            HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAntDesNot" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @PERIODO FLOAT
DECLARE @TIPOBUSQUEDA VARCHAR(50)
DECLARE @TIPOECO VARCHAR(50)
DECLARE @PERIODO2 FLOAT
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPOBUSQUEDA = 'PAGADO'
SET @TIPOECO = ?

use sireca
drop table reporteAntesNotificacion
select * into reporteAntesNotificacion
from (
SELECT DISTINCT([REG#PATRONAL])
,(SELECT max(pro2.[RCP_FEC_MOV]) FROM procesar.dbo.rcpro as pro2 WHERE CONVERT(FLOAT,(SUBSTRING(pro2.RCP_PER,6,2) + SUBSTRING(pro2.RCP_PER ,1,4)))=eco.fechaEco and pro2.[RCP_REGPAT]=eco.[REG#PATRONAL]) as PAGO_PRO
,(SELECT min(distinct(his2.[fecha])) FROM [sireca].[dbo].[HistorialInc] as his2 WHERE his2.incidencia in ('2') and his2.[regpat]=eco.[REG#PATRONAL]) as CAPTURA
,estado = CASE WHEN datediff(Day
,(SELECT min(DISTINCT(his2.[fecha])) FROM [sireca].[dbo].[HistorialInc] as his2 WHERE his2.incidencia in ('2') and his2.[regpat]=eco.[REG#PATRONAL])
,(SELECT max(pro2.[RCP_FEC_MOV]) FROM procesar.dbo.rcpro as pro2 WHERE CONVERT(FLOAT,(SUBSTRING(pro2.RCP_PER,6,2) + SUBSTRING(pro2.RCP_PER ,1,4)))=eco.fechaEco and pro2.[RCP_REGPAT]=eco.[REG#PATRONAL])
)  is not null THEN
 case when datediff(Day
,(SELECT min(DISTINCT(his2.[fecha])) FROM [sireca].[dbo].[HistorialInc] as his2 WHERE his2.incidencia in ('2') and his2.[regpat]=eco.[REG#PATRONAL])
,(SELECT max(pro2.[RCP_FEC_MOV]) FROM procesar.dbo.rcpro as pro2 WHERE CONVERT(FLOAT,(SUBSTRING(pro2.RCP_PER,6,2) + SUBSTRING(pro2.RCP_PER ,1,4)))=eco.fechaEco and pro2.[RCP_REGPAT]=eco.[REG#PATRONAL])
) &gt;= '0' then
'despues'
else
'antes'
end
END
,tipoBusqueda = 'PAGADO'
, [id]
      ,[TP]
,[incidencia]
      ,[NOMBRE O RAZON SOCIAL]
      ,[CREDITO]
      ,[COTIZ]
      ,[DIAS]
      ,[CL]
      ,[ACT#]
      ,[PRIMA]
      ,[OMISION]
      ,[COP/ACT]
      ,[RECARGOS]
      ,[MULTA]
      ,[TOTAL]
      ,[fechaEco]
      ,[responsable]
      ,[fechaSeleccion]
      ,[cambiarIncidencia]
      ,[tipoECO]
      ,[diasDisponibles]
      ,[clave]
      ,[nomResponsable]
      ,[horaCitatorio]
      ,[fechaCaptura]
      ,[ecoOriginal]
      ,[cobrarMulta]
      ,[subdel]
      ,[sector]
      ,[grado1]
      ,[grado3]
FROM [sireca].[dbo].[eco] AS eco
WHERE eco.subdel=@SUBDEL AND eco.fechaEco=@PERIODO and eco.incidencia in ('PAGADO','POR PROCESAR','RE') and eco.fechaCaptura is not null and tipoEco=@TIPOECO
) as temporal
select ran.subdel,ran.fechaEco,ran.tipoEco,ran.tipoBusqueda,ran.estado as ESTADO, count(ran.estado) as PATRONES,sum(ran.cotiz) as COTIZANTE,sum(ran.omision) as OMISION
FROM [sireca].[dbo].reporteAntesNotificacion as ran
WHERE ran.estado is not null and tipoBusqueda=@TIPOBUSQUEDA
group by ran.subdel,ran.fechaEco,ran.tipoEco,ran.tipoBusqueda,ran.estado
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLEco" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource><br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            CellPadding="3" DataKeyNames="INCIDENCIAKEY" DataSourceID="SqlDataSourceRG" 
            Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                    SortExpression="INCIDENCIA" />
                    <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                        <ItemTemplate>
                            <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# "DetallesRepGeneral.aspx?g1=" & Eval("INCIDENCIAKEY") & "&tipo=1&subdel=" & Eval("subdel") & "&periodo=" & Eval("periodo") & "&tipoEco=" & Eval("tipo") %>'
                                Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="OMISION" DataFormatString="{0:C}" 
                    HeaderText="OMISION" ReadOnly="True" SortExpression="OMISION" />
                <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                    ReadOnly="True" SortExpression="MULTA" />
                <asp:CommandField SelectText="Detalles" ShowSelectButton="True" 
                    ButtonType="Image" SelectImageUrl="~/imagenes/naveg_der.png" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>        
        <asp:SqlDataSource ID="SqlDataSourceRG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
DECLARE @TIPO AS VARCHAR(50)
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPO = ?
select subdel=@SUBDEL,periodo=@PERIODO,tipo=@TIPO, (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=eco.grado1) as INCIDENCIA,eco.grado1 as INCIDENCIAKEY,count(eco.grado1) as PATRONES,sum(eco.cotiz) as COTIZANTES,sum(eco.omision) as OMISION, sum(eco.multa) as MULTA
FROM [sireca].[dbo].[eco] as eco
where eco.subdel = @SUBDEL and eco.fechaEco = @PERIODO and eco.tipoEco = @TIPO
group by eco.grado1">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLEco" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Descripción">    
    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="#639A9C" BorderStyle="Solid" 
            BorderWidth="3px" CellPadding="2" DataSourceID="SqlDataSourceRGAD" 
            Font-Size="9pt" ForeColor="Black" GridLines="None" 
            DataKeyNames="INCIDENCIAKEY" HorizontalAlign="Left">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="INCIDENCIA2" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA2" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "DetallesRepGeneral.aspx?g1=" & Eval("INCIDENCIA") & "&g2=" & Eval("INCIDENCIAKEY") & "&tipo=2&subdel=" & Eval("subdel") & "&periodo=" & Eval("periodo") & "&tipoEco=" & Eval("tipo")%>' 
                            Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="OMISION" DataFormatString="{0:C}" 
                    HeaderText="OMISION" ReadOnly="True" SortExpression="OMISION" />
                <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                    ReadOnly="True" SortExpression="MULTA" />
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/imagenes/naveg_der.png" 
                    ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        
        
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="#639A9C" BorderStyle="Solid" 
            BorderWidth="3px" CellPadding="2" DataKeyNames="INCIDENCIAKEY" 
            DataSourceID="SqlDataSourceRGAD3" Font-Size="9pt" ForeColor="Black" 
            GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="INCIDENCIA2" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA2" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "DetallesRepGeneral.aspx?g1=" & Eval("gradoU") & "&g2=" & Eval("INCIDENCIA") & "&g3=" & Eval("INCIDENCIAKEY") & "&tipo=3&subdel=" & Eval("subdel") & "&periodo=" & Eval("periodo") & "&tipoEco=" & Eval("tipo") %>' 
                            Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="OMISION" DataFormatString="{0:C}" 
                    HeaderText="OMISION" ReadOnly="True" SortExpression="OMISION" />
                <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                    ReadOnly="True" SortExpression="MULTA" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceRGAD" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
DECLARE @TIPO AS VARCHAR(50)
DECLARE @GRADO AS VARCHAR(50)
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPO = ?
SET @GRADO = ?
select  subdel=@SUBDEL,periodo=@PERIODO,tipo=@TIPO,eco.grado1 as INCIDENCIA,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=eco.grado2) as INCIDENCIA2,eco.grado2 as INCIDENCIAKEY,count(eco.grado1) as PATRONES,sum(eco.cotiz) as COTIZANTES,sum(eco.omision) as OMISION, sum(eco.multa) as MULTA
FROM [sireca].[dbo].[eco] as eco
where eco.subdel = @SUBDEL and eco.fechaEco = @PERIODO and eco.tipoEco = @TIPO and eco.grado1 = @GRADO
group by eco.grado1,eco.grado2">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLEco" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>    
        <asp:SqlDataSource ID="SqlDataSourceRGAD3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT
DECLARE @TIPO AS VARCHAR(50)
DECLARE @GRADO AS VARCHAR(50)
DECLARE @GRADO1 AS VARCHAR(50)
SET @SUBDEL = ?
SET @PERIODO = ?
SET @TIPO = ?
SET @GRADO = ?
SET @GRADO1 = ?
select  subdel=@SUBDEL,periodo=@PERIODO,tipo=@TIPO,gradoU=@GRADO1, eco.grado2 as INCIDENCIA,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=eco.grado3) as INCIDENCIA2,eco.grado3 as INCIDENCIAKEY,count(eco.grado3) as PATRONES,sum(eco.cotiz) as COTIZANTES,sum(eco.omision) as OMISION, sum(eco.multa) as MULTA
FROM [sireca].[dbo].[eco] as eco
where eco.subdel = @SUBDEL and eco.fechaEco = @PERIODO and eco.tipoEco = @TIPO and eco.grado2 = @GRADO and eco.grado1=@GRADO1
group by eco.grado2,eco.grado3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLEco" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>    
    </div>
</asp:Content> 
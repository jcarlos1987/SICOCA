<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="reporteDescriptivo.aspx.vb" Inherits="WebSIRECA.reporteDescriptivo" %>

<asp:Content ID="contenido1" runat="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
    <asp:GridView ID="GVReporte2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceReporte2" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        Caption="&lt;strong&gt;REPORTE DESCRIPTIVO&lt;/strong&gt;" CellPadding="3" GridLines="Vertical" 
            Font-Size="10pt" HorizontalAlign="Center" AllowSorting="True">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="tipo_estado" HeaderText="ESTADO" ReadOnly="True" 
                SortExpression="tipo_estado" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="subdel,fech_inicio,fech_fin,tipo_trabajo,tipo_estado,CREDITOS,COTIZANTES,ADEUDO,id_ejecutor" 
                DataNavigateUrlFormatString="detallesSeleccion.aspx?subdel={0}&amp;fech_inicio={1}&amp;fech_fin={2}&amp;tipo_trabajo={3}&amp;tipo_reporte=descriptivo&amp;tipo_estado={4}&amp;creditos={5}&amp;cotizantes={6}&amp;importe={7}&amp;id_ejecutor={8}" 
                DataTextField="PATRONES" HeaderText="PATRONES" 
                NavigateUrl="~/informes/detallesSeleccion.aspx" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:HyperLinkField>
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
    <asp:SqlDataSource ID="SqlDataSourceReporte2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @TIPO_REPORTE VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @IMPORT_TOTAL FLOAT
SET @SUBDEL=?
SET @TIPO_TRAB=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_REPORTE=?
SET @ID_EJECUTOR=?
SET @IMPORT_TOTAL=?
SELECT 
@SUBDEL as subdel
,@TIPO_TRAB as tipo_trabajo
,@FECH_INICIO as fech_inicio
,@FECH_FIN as fech_fin
,@TIPO_REPORTE as tipo_reporte
,@ID_EJECUTOR as id_ejecutor
,case
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
ELSE [INC_CAP]
end as tipo_estado
,count(distinct(REGPATR)) as PATRONES
,count(*) as CREDITOS
,avg(COTIZ) as COTIZANTES
,sum(adeudo) as ADEUDO
,(sum(adeudo)/@IMPORT_TOTAL) as PORCENTAJE
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=@SUBDEL
and [TIPO_TRABAJO]=@TIPO_TRAB
and convert(datetime,FECH_ASIG,103) 
between convert(datetime,@FECH_INICIO,103) 
and convert(datetime,@FECH_FIN,103) 
and [ID_RESPONSABLE] like @ID_EJECUTOR+'%'
group by (case 
when [INC_CAP] in ('05','52','54','RB','RE', '23') then 'COBRADO'
when [INC_CAP] in ('09') then 'NO LOCALIZADO'
when [INC_CAP] in ('31','x') then 'PENDIENTE'
when [INC_CAP] in ('33') then 'REMOCION'
when [INC_CAP] in ('43') then 'EMB. CUENTA'
when [INC_CAP] in ('34') then 'EMB. INMUEBLE'
when [INC_CAP] in ('32') then 'EMB. MONTAÑO'
when [INC_CAP] in ('03') then 'EN ACLARACION'
else [INC_CAP]
end)
order by 1
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="" Name="?" 
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
        <center><a href ="http://11.1.33.226/fiscal/juicio.php" target ="_blank" >
            <asp:Image ID="Image1" runat="server" Height="53px" 
                ImageUrl="~/imagenes/sijur.png" Width="137px" />
            </a> 
            </center>
    </div>
</asp:Content>

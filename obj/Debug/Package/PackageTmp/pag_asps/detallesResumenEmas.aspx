<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesResumenEmas.aspx.vb" Inherits="WebSIRECA.detallesResumenEmas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" />
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            Caption="Resultados" DataSourceID="SqlDataSourceDetallesSeleccion" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" AllowSorting="True" Font-Size="10pt" PageSize="15" 
            CaptionAlign="Left">
            <Columns>
            <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='http://11.200.24.211/emamovil/accionSIRECA.asp?menu=&periodo=052012&del=01&srch=p&asg=G624116510' Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/FISCAMOVIL.png" BorderColor="White" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="subdel" HeaderText="SUB." 
                    SortExpression="subdel" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" />
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                    SortExpression="INCIDENCIA" ReadOnly="True" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" HeaderText="NOMBRE O RAZON SOCIAL" 
                    SortExpression="NOMBRE O RAZON SOCIAL" >
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" 
                    SortExpression="COTIZ" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" 
                    SortExpression="DIAS" />
                <asp:BoundField DataField="CL" HeaderText="CL" 
                    SortExpression="CL" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" 
                    SortExpression="ACT#" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" 
                    SortExpression="PRIMA" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    DataFormatString="{0:C}" />
                <asp:BoundField DataField="responsable" HeaderText="INSPECTOR" 
                    SortExpression="responsable" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDetallesSeleccion" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]
	  ,eco.[REG#PATRONAL]
      ,eco.[NOMBRE O RAZON SOCIAL]
      ,eco.[CREDITO]
      ,eco.[COTIZ]
      ,eco.[DIAS]
      ,eco.[CL]
      ,eco.[ACT#]
      ,eco.[PRIMA]
      ,eco.[OMISION]
      ,eco.[COP/ACT]
      ,eco.[RECARGOS]
      ,eco.[MULTA]
      ,eco.[TOTAL]
      ,eco.[fechaEco]
      ,eco.[responsable]
      ,eco.[cambiarIncidencia]
      ,eco.[tipoECO]
      ,eco.[subdel]
      ,eco.[sector]
FROM 
 [sireca].[dbo].[eco] as eco, [rale].[dbo].[3301ACOP240712] AS rale inner join [sireca].[dbo].[patrones3301] AS emma
on (
substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) 
WHERE
eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'
and eco.fechaEco='52012' and tipoEco in ('COP','COMP')
and rale.[TD] in ('02')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='5'
and eco.incidencia = ?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0000000000" Name="?" 
                    QueryStringField="incidenciakey" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceDetallesSeleccionDeven" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]
	  ,eco.[REG#PATRONAL]
      ,eco.[NOMBRE O RAZON SOCIAL]
      ,eco.[CREDITO]
      ,eco.[COTIZ]
      ,eco.[DIAS]
      ,eco.[CL]
      ,eco.[ACT#]
      ,eco.[PRIMA]
      ,eco.[OMISION]
      ,eco.[COP/ACT]
      ,eco.[RECARGOS]
      ,eco.[MULTA]
      ,eco.[TOTAL]
      ,eco.[fechaEco]
      ,eco.[responsable]
      ,eco.[cambiarIncidencia]
      ,eco.[tipoECO]
      ,eco.[subdel]
      ,eco.[sector]
FROM 
  [sireca].[dbo].[eco] as eco,[rale].[dbo].[3301ACOP240712] AS rale inner join [sireca].[dbo].[patrones3301] AS emma
on (
substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) 
WHERE
eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'
and eco.fechaEco='32012' and tipoEco in ('COP','COMP')
and rale.[TD] in ('9999')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='3'
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0000000000" Name="?" 
                    QueryStringField="incidenciakey" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceEmmaNoestan" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]
	  ,eco.[REG#PATRONAL]
      ,eco.[NOMBRE O RAZON SOCIAL]
      ,eco.[CREDITO]
      ,eco.[COTIZ]
      ,eco.[DIAS]
      ,eco.[CL]
      ,eco.[ACT#]
      ,eco.[PRIMA]
      ,eco.[OMISION]
      ,eco.[COP/ACT]
      ,eco.[RECARGOS]
      ,eco.[MULTA]
      ,eco.[TOTAL]
      ,eco.[fechaEco]
      ,eco.[responsable]
      ,eco.[cambiarIncidencia]
      ,eco.[tipoECO]
      ,eco.[subdel]
      ,eco.[sector]
FROM 
 [sireca].[dbo].[eco] as eco,[rale].[dbo].[3301ACOP240712] AS rale
WHERE
(
select substring(emma2.[EMIP_PATRON],2,10) 
from [sireca].[dbo].[patrones3301] AS emma2 
where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) is null
and eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'
and eco.fechaEco='52012' and tipoEco in ('COP','COMP')
and rale.[TD] in ('9999')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='5'">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0000000000" Name="?" 
                    QueryStringField="incidenciakey" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

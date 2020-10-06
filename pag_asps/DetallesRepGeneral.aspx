<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesRepGeneral.aspx.vb" Inherits="WebSIRECA.DetallesRepGeneral" %>

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
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" DataSourceID="reporteGeneralG1" 
            Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" Visible="False" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" Visible="False" />
                <asp:BoundField DataField="fechaSeleccion" HeaderText="ASIGNADO" 
                    SortExpression="fechaSeleccion" Visible="False" />
                <asp:BoundField DataField="responsable" HeaderText="INSPECTOR" 
                    SortExpression="responsable" />
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="fechaCaptura" HeaderText="CAPTURADO" 
                    SortExpression="fechaCaptura" Visible="False" />
                <asp:BoundField DataField="subdel" HeaderText="SUBDEL" 
                    SortExpression="subdel" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" Visible="False" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="TP" HeaderText="TP" SortExpression="TP" 
                    Visible="False" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" 
                    Visible="False" />
                <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" SortExpression="ACT#" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" SortExpression="PRIMA" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    DataFormatString="{0:C}" />
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
        <asp:SqlDataSource ID="reporteGeneralG1" runat="server" SelectCommand="SELECT
      [INCIDENCIA]
      ,[id]
      ,[REG#PATRONAL]
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
     , (select uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.[id]=eco.[responsable]) as [responsable]
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
  FROM [sireca].[dbo].eco
WHERE grado1=? and subdel=? and fechaEco=? and tipoEco=?" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="g1" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="reporteGeneralG1G2" runat="server" SelectCommand="SELECT
      [INCIDENCIA]
      ,[id]
      ,[REG#PATRONAL]
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
, (select uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.[id]=eco.[responsable]) as [responsable]
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
  FROM [sireca].[dbo].eco
WHERE grado1=? and subdel=? and fechaEco=? and tipoEco=? and grado2=?" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="g1" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" QueryStringField="g2" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="reporteGeneralG1G2G3" runat="server" SelectCommand="SELECT
      [INCIDENCIA]
      ,[id]
      ,[REG#PATRONAL]
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
, (select uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.[id]=eco.[responsable]) as [responsable]
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
  FROM [sireca].[dbo].eco
WHERE grado1=? and subdel=? and fechaEco=? and tipoEco=? and grado2=? and grado3=?" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="g1" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" QueryStringField="g2" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" QueryStringField="g3" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="reporteGeneralDeudas" runat="server" SelectCommand="SELECT
      [INCIDENCIA]
      ,[id]
      ,[REG#PATRONAL]
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
, (select uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.[id]=[responsable]) as [responsable]
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
  FROM [sireca].[dbo].[reportePorCobrar]
WHERE  subdel=? and fechaEco=?" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="reporteGeneralPagados" runat="server" SelectCommand="SELECT
      [INCIDENCIA]
      ,[id]
      ,[REG#PATRONAL]
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
, (select uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.[id]=[responsable]) as [responsable]
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
  FROM [sireca].[dbo].[reporteAntesNotificacion]
WHERE  subdel=? and fechaEco=? and estado=? and tipoEco=?" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="estado" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

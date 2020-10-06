<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Bajaspor251.aspx.vb" Inherits="WebSIRECA.Bajaspor251" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bajas por 251</title>
     <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="REG. PATRONAL:"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="TBRegpat" runat="server"></asp:TextBox>
    
        <asp:HiddenField ID="HFSubdel" runat="server" Value="%" />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSourceBajas251" 
            Font-Size="9pt" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="FECHA_MOV_AFIL_251" DataFormatString="{0:D}" 
                    HeaderText="FECHA_MOV_AFIL_251" SortExpression="FECHA_MOV_AFIL_251" />
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
                    SortExpression="OMISION" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" />
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
        <asp:SqlDataSource ID="SqlDataSourceBajas251" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
  distinct(nl.[regpat]) as [REG_PATRONAL]
       ,nl.incidencia as [INCIDENCIA]
      ,eco.[id]
      ,eco.[REG#PATRONAL]
      ,eco.[TP]
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
      ,(select uf.nombre FROM fiscamovil.dbo.usuarios as uf where uf.[id]=eco.[responsable]) as [responsable]
      ,eco.[fechaSeleccion]
      ,eco.[cambiarIncidencia]
      ,eco.[tipoECO]
      ,eco.[diasDisponibles]
      ,eco.[clave]
      ,eco.[nomResponsable]
      ,eco.[horaCitatorio]
      ,eco.[fechaCaptura]
      ,eco.[ecoOriginal]
      ,eco.[cobrarMulta]
      ,eco.[subdel]
      ,eco.[sector]
      ,eco.[grado1]
      ,eco.[grado3]
  ,afi.[subdel] as [SUBDEL]
  ,afi.[fecha_mov] as [FECHA_MOV_AFIL_251]  
  ,eco.fechaEco 
  ,nl.[idEco]
FROM [sireca].[dbo].[eco] as eco, [sireca].[dbo].[nolocalizados] as nl inner join sireca.dbo.afil as afi on afi.regpat = substring(nl.regpat,1,10)
where nl.incidencia in ('BD') 
and eco.[REG#PATRONAL] like nl.regpat+'%'
and eco.fechaEco in (convert(varchar,(month(afi.[fecha_mov])-2))+convert(varchar,year(afi.[fecha_mov])))
and afi.sindo like '%BAJA%'
and nl.regpat like '%'+?+'%'
and eco.subdel like ?+'%'">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="0" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="HFSubdel" DefaultValue="%" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

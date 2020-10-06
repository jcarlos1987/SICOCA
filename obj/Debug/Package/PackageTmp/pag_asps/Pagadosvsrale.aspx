<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Pagadosvsrale.aspx.vb" Inherits="WebSIRECA.Pagadosvsrale" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pagados Vs Rale</title>
         <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="RALE:"></asp:Label>&nbsp;&nbsp;
        <asp:DropDownList ID="DDLTabla" runat="server" 
            DataSourceID="SqlDataSourceRale" DataTextField="name" 
            DataValueField="name">
        </asp:DropDownList>
        <asp:HiddenField ID="HFTabla" runat="server" />
        <asp:SqlDataSource ID="SqlDataSourceRale" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT name FROM rale.dbo.tablas WHERE (subdel LIKE ?+'%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="HFSubdel" DefaultValue="1" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:HiddenField ID="HFSubdel" runat="server" Value="%" />
    
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="REG. PATRONAL:"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="TBRegpat" runat="server"></asp:TextBox>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSourcePagVsRale" 
            Font-Size="9pt" HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="RALE_FECHA_MOV" DataFormatString="{0:D}" 
                    HeaderText="RALE_FECHA_MOV" SortExpression="RALE_FECHA_MOV" />
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
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
        <asp:SqlDataSource ID="SqlDataSourcePagVsRale" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT eco.[id]
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
      ,eco.[responsable]
      ,eco.[fechaSeleccion]
      ,eco.[cambiarIncidencia]
      ,eco.[tipoECO]
      ,eco.[diasDisponibles]
      ,eco.[clave]
      ,eco.[incidencia]
      ,eco.[nomResponsable]
      ,eco.[horaCitatorio]
      ,eco.[fechaCaptura]
      ,eco.[ecoOriginal]
      ,eco.[cobrarMulta]
      ,eco.[subdel]
      ,eco.[sector]
      ,eco.[grado1]
      ,eco.[grado2]
      ,eco.[grado3]
,rale.mov as [RALE_MOV]
,rale.fmov as [RALE_FECHA_MOV]
,rale.numcred as [RALE_NUM_CREDITO]
,rale.falta as [RALE_FALTA]
,rale.feinc as [RALE_FECHA_INI]
,rale.importe as [RALE_IMPORTE]
	  ,(convert(varchar,month(rale.[PERIODO]))+convert(varchar,year(rale.[PERIODO])))
	  ,substring(rale.[PERIODO],7,4)
  FROM [sireca].[dbo].[eco] as eco,[rale].[dbo].[3301ARCV240712] as rale
  WHERE eco.[REG#PATRONAL] like replace(rale.[REGPATR],'-','')+'%'
and eco.fechaEco in ((convert(varchar,month(rale.[PERIODO]))+convert(varchar,year(rale.[PERIODO]))))
and eco.[REG#PATRONAL] like ?+'%'
and eco.subdel like ?+'%'
order by eco.[COTIZ] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="0" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

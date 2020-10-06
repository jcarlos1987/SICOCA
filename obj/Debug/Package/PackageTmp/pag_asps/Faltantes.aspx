<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Faltantes.aspx.vb" Inherits="WebSIRECA.Faltantes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Casos Faltantes</title>
    <style type="text/css"> 
        body { font-family: "Calibri" }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceSinAsignacion" 
            Font-Size="9pt" GridLines="None" AllowSorting="True" 
            HorizontalAlign="Center">
            <Columns>
                <asp:HyperLinkField />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" 
                    SortExpression="MUNICIPIO" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" />
                <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" SortExpression="ACT#" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" SortExpression="PRIMA" />
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
                <asp:BoundField DataField="CODIGO_POSTAL" HeaderText="COD. POSTAL" 
                    SortExpression="CODIGO_POSTAL" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceSinAsignacion" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT eco.id, eco.REG#PATRONAL, eco.TP, eco.[NOMBRE O RAZON SOCIAL], eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT]
, eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco,  (SELECT top 1  [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable, eco.fechaSeleccion
, eco.cambiarIncidencia, eco.tipoECO, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable
, eco.horaCitatorio, convert(int,eco.sector) as sector, ptn.longitud as longitud, ptn.latitud as latitud
,(SELECT top 1 right(loc,6) FROM sireca.dbo.patrones WHERE substring(eco.REG#PATRONAL,1,10) = regpat) as CODIGO_POSTAL
,(SELECT top 1 case when right(loc,6)='' then loc else substring(loc,1,(len(loc)-5)) end FROM sireca.dbo.patrones WHERE substring(eco.REG#PATRONAL,1,10) = regpat) as MUNICIPIO
FROM sireca.dbo.eco AS eco LEFT JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.subdel = ?) AND eco.fechaEco=? AND  responsable IS NULL and incidencia is null
and eco.validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL')
and cambiarIncidencia='9' and TP not in ('0*','1*','2*','3*','4*','5*','6*','7*','8*','9*')
and eco.tipoeco not in ('EMA','EBA')
order by sector,2">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

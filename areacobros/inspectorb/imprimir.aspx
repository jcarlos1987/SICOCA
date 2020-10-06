<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="imprimir.aspx.vb" Inherits="WebSIRECA.imprimirb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IMPRIMIR</title>
    <style type="text/css">
        .style2
        {
            width: 256px;
        }
        body {
	font-family: "Calibri";
}
        .style3
        {
            width: 262px;
        }
        .style4
        {
            width: 262px;
        }
    </style>
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" 
            ImageAlign="Left" ImageUrl="~/imagenes/imprimir1.jpg" 
            onclientclick="javascript:window.print();" Width="40px" />
    <asp:Label ID="LNombre1" runat="server" Text=""></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="Factura(s)" 
            CellPadding="3" DataSourceID="SqlDataSource2" Font-Size="7pt" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                    SortExpression="emi_sec" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" />
                <asp:BoundField DataField="horaCitatorio" HeaderText="Hora del Citatorio" 
                    SortExpression="horaCitatorio" DataFormatString="{0:t}" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE_O_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="NOMBRE_O_RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
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
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL
, ptn.dom AS EMIP_DOM, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#
, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.sector AS emi_sec
, eco.incidencia, convert(datetime,eco.horaCitatorio,108) as horaCitatorio 
,substring(ptn.loc,1,6) as muni
,substring(ptn.loc,len(ptn.loc)-5,6) as cp
FROM sirecacobros.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE (eco.responsable = ?) AND (eco.subdel = ?) AND convert(varchar(11),eco.fechaSeleccion)= substring(?,1,11)
ORDER BY emi_sec, muni, cp, EMIP_DOM">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00000" Name="?" SessionField="SIRECAid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="fecha" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceResumenIncidencias" 
            Font-Size="10pt" GridLines="None">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" NullDisplayText="SIN CAPTURA">
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                    SortExpression="TOTAL">
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="COP" HeaderText="COP" ReadOnly="True" 
                    SortExpression="COP" />
                <asp:BoundField DataField="COMP" HeaderText="COMP" ReadOnly="True" 
                    SortExpression="COMP" />
                <asp:BoundField DataField="RCV" HeaderText="RCV" ReadOnly="True" 
                    SortExpression="RCV" />
                <asp:BoundField DataField="RCVCOMP" HeaderText="RCVCOMP" ReadOnly="True" 
                    SortExpression="RCVCOMP" />
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
        <asp:SqlDataSource ID="SqlDataSourceResumenIncidencias" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RESPONSABLE VARCHAR(50)
DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECHABUSQUEDA VARCHAR(50)
SET @RESPONSABLE = ?
SET @SUBDEL = ?
SET @FECHABUSQUEDA = ?
SELECT 
(SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = incidencia) as INCIDENCIA
, COUNT(*) as TOTAL
, (
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='COP'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccion)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;COP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='COMP'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccion)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;COMP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='RCV'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccion)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;RCV&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='RCVCOMP'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccion)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;RCVCOMP&quot;
FROM sirecacobros.dbo.eco AS eco 
WHERE (eco.responsable = @RESPONSABLE) 
AND (eco.subdel = @SUBDEL )
AND (convert(nvarchar(11),eco.fechaSeleccion)=substring( @FECHABUSQUEDA ,1,11))  
group by incidencia
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="2012-05-29 07:11:15.000" Name="?" 
                    QueryStringField="fecha" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <table style="width: 890;">
        <tr>
            <td class="style3">
                <asp:Label ID="LNombre2" runat="server" Font-Size="10pt"></asp:Label>
<hr/>
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
                <hr/>
            </td>
        </tr>
        <tr>
            <td class="style3" align="center">
                <strong>Nombre y Firma del Inspector</strong> </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                <strong>Nombre y Firma del Supervisor</strong> </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
    </center>
</body>
</html>

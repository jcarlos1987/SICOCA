<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cobrosAsignados.aspx.vb" Inherits="WebSIRECA.cobrosAsignados1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" language="javascript">
var infowindow;
  var map;
    function initialize() {
    //---------------------------------------------------------------------
    //var marcadores = [];
   // <%Response.Write (HiddenField1.Value) %>
    //---------------------------------------------------------------------
    var myLatlng = new google.maps.LatLng(20.996017505661825, -89.64557575559616);
    var myOptions = {
      zoom: 13,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    //downloadUrl("xmls/data.xml", function(data) {
    //  var markers = data.documentElement.getElementsByTagName("marker");
      //for (var i = 0; i < (marcadores.length-1); i++) {
        //var latlng = new google.maps.LatLng(parseFloat(markers[i].getAttribute("lat")),
                               //     parseFloat(markers[i].getAttribute("lng")));
        //var marker = new google.maps.Marker({position: marcadores[i], map: map});
        <%Response.Write(HiddenField1.Value) %>
       //}
     //});
  }   
  function createMarker(name, latlng) {
    var marker = new google.maps.Marker({position: latlng, map: map});
    google.maps.event.addListener(marker, "click", function() {
      if (infowindow) infowindow.close();
      infowindow = new google.maps.InfoWindow({content: name});
      infowindow.open(map, marker);
    });
    return marker;
  }
   //window.onload();
</script>
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" 
            ImageAlign="Left" ImageUrl="~/imagenes/imprimir1.jpg" 
            onclientclick="javascript:window.print();" Width="40px" />
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSourceFechas" DataTextField="fechas" 
            DataValueField="fechas" AutoPostBack="True">
        </asp:DropDownList><br />
        <asp:SqlDataSource ID="SqlDataSourceFechas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct (convert(nvarchar(11),eco.fechaSeleccionPae)) as fechas
FROM [sireca].[dbo].[eco] as eco
where eco.fechaSeleccionPae is not null
and eco.subdel=? and eco.fechaEco=? and responsablePae=?
order by fechas desc">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="userid" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:Label ID="LNom1" runat="server"></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="Factura(s)" 
            CellPadding="3" DataSourceID="SqlDataSource2" Font-Size="9pt" 
            AllowSorting="True" EmptyDataText="Sin Facturas Disponibles">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                    SortExpression="emi_sec" />
                <asp:BoundField DataField="fechaCaptura" DataFormatString="{0:D}" 
                    HeaderText="FECHA NOTIFICACIÓN" SortExpression="fechaCaptura" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" />
                <asp:BoundField DataField="horaCitatorio" HeaderText="Hora del Citatorio" 
                    SortExpression="horaCitatorio" DataFormatString="{0:t}" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE_O_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="NOMBRE_O_RAZON_SOCIAL" />
                <asp:BoundField DataField="EMIP_DOM" HeaderText="DOM." 
                    SortExpression="EMIP_DOM" />
                <asp:BoundField DataField="EMIP_LOC" HeaderText="MUNICIPIO" 
                    SortExpression="EMIP_LOC" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="lat">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="CODIGO_POSTAL" HeaderText="COD. POSTAL" 
                    SortExpression="CODIGO_POSTAL" />
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
, ptn.dom AS EMIP_DOM, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#
, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco
, eco.sector AS emi_sec, eco.incidencia, eco.horaCitatorio,eco.fechaCaptura 
,ptn.lat as lat
,ptn.lng as lng
,right(ptn.loc,6) as CODIGO_POSTAL
, case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end AS EMIP_LOC
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE (eco.responsable = ?) AND (eco.subdel = ?) AND (convert(nvarchar(11),eco.fechaSeleccion)=substring( ? ,1,11))  
ORDER BY eco.clave, emi_sec, EMIP_DOM">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="userid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DropDownList1" 
                    DefaultValue="2012-05-29 07:11:15.000" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceResumenIncidencias" 
            Font-Size="10pt" GridLines="None">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA">
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
, COUNT(incidencia ) as TOTAL
, (
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsablePae = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='COP'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccionPae)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;COP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsablePae = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='COMP'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccionPae)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;COMP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsablePae = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='RCV'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccionPae)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;RCV&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsablePae = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='RCVCOMP'
and eco2.incidencia =eco.incidencia 
AND (convert(nvarchar(11),eco2.fechaSeleccionPae)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;RCVCOMP&quot;
FROM sireca.dbo.eco AS eco 
WHERE (eco.responsablePae = @RESPONSABLE) 
AND (eco.subdel = @SUBDEL ) 
AND eco.incidencia is not null
AND (convert(nvarchar(11),eco.fechaSeleccionPae)=substring( @FECHABUSQUEDA ,1,11))  
group by incidencia
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="userid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DropDownList1" 
                    DefaultValue="2012-05-29 07:11:15.000" Name="?" PropertyName="SelectedValue" />
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
               <asp:Label ID="LNom2" runat="server" Font-Size="10pt"></asp:Label>
                <hr />
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style3">
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
    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFOrigen" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFDestino" runat="server" ClientIDMode="Static" />        
            <div id="map_canvas" style="float:left;width:100%;height:400px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
    </form>
    </center>
</body>
</html>


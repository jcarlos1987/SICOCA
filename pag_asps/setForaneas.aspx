<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="setForaneas.aspx.vb" Inherits="WebSIRECA.setForaneas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asignacion Foranea</title>
    
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" language="javascript">
var infowindow;
  var map;
    function initialize() {
    //---------------------------------------------------------------------
    //var marcadores = [];   
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
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" 
            BorderWidth="1px" Caption="Patrones Disponibles" 
            CellPadding="3" DataSourceID="SqlDataSourceNL" EmptyDataText="0 CASOS" 
            Font-Size="9pt" BackColor="White" DataKeyNames="id">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="id,REG#PATRONAL,fechaEco,incidencia" 
                    DataNavigateUrlFormatString="detallesRegpat.aspx?id={0}&amp;regpat={1}&amp;periodo={2}&amp;incidencia={3}" 
                    NavigateUrl="~/pag_asps/detallesRegpat.aspx" Target="_blank" Text="Opciones" />
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" ReadOnly="True" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" ReadOnly="True" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" ReadOnly="True" />
                <asp:BoundField DataField="fechaCaptura" DataFormatString="{0:D}" 
                    HeaderText="NOTIFICADO" SortExpression="fechaCaptura" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" ReadOnly="True" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" ReadOnly="True" />
                <asp:BoundField DataField="TP" HeaderText="TP" 
                    SortExpression="TP" ReadOnly="True" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" 
                    ReadOnly="True" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" ReadOnly="True" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" 
                    ReadOnly="True" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" 
                    ReadOnly="True" />
                <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" 
                    ReadOnly="True" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" SortExpression="ACT#" 
                    ReadOnly="True" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" SortExpression="PRIMA" 
                    ReadOnly="True" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="DOMICILIO" 
                    SortExpression="DOMICILIO" HeaderText="DOMICILIO" >
                </asp:BoundField>
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" 
                    SortExpression="LOCALIDAD" />
                <asp:BoundField DataField="lat" SortExpression="lat">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng" SortExpression="lng">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BorderColor="Black" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle BorderColor="Black" BorderStyle="None" ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNL" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT fora.ruta AS RUTA, eco.id, SUBSTRING(eco.REG#PATRONAL, 1, 10) AS REG#PATRONAL, 
(SELECT dom FROM sireca.dbo.patrones WHERE (eco.REG#PATRONAL LIKE regpat + '%')) as DOMICILIO
,(SELECT loc FROM sireca.dbo.patrones WHERE (eco.REG#PATRONAL LIKE regpat + '%')) as LOCALIDAD
,eco.TP, (SELECT razonSocial FROM sireca.dbo.patrones WHERE (eco.REG#PATRONAL LIKE regpat + '%')) AS [NOMBRE O RAZON SOCIAL], eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, (SELECT nombre FROM fiscamovil.dbo.Usuarios AS uf WHERE (id = eco.responsable)) AS responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO, eco.fechaCaptura, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector 
,(select lat from sireca.dbo.patrones where regpat = SUBSTRING(eco.REG#PATRONAL, 1, 10)) as lat
,(select lng from sireca.dbo.patrones where regpat = SUBSTRING(eco.REG#PATRONAL, 1, 10)) as lng
FROM sireca.dbo.foraneo AS fora INNER JOIN sireca.dbo.eco AS eco ON eco.REG#PATRONAL LIKE fora.claveForaneo + '%' WHERE (eco.subdel = ?) AND (eco.fechaEco = ?) AND (fora.ruta = ?) and tipoeco in ('COP','COMP','RCV','RCVCOMP') AND (eco.responsable is null) and incidencia is null" 
            UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="52012" Name="?" 
                    QueryStringField="fechaEco" />
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="ruta" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cambiarIncidencia" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
            <div id="map_canvas" style="float:left;width:100%;height:600px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
    </div>
    </form>
</body>
</html>

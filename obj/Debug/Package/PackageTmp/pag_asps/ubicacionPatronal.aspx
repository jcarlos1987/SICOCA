<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ubicacionPatronal.aspx.vb" Inherits="WebSIRECA.ubicacionPatronal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
  html { height: 100% }
  body { height: 100%; margin: 0px; padding: 0px; font-family: "Calibri" }
  #map_canvas { height: 100% }
</style>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&libraries=places"></script>

<script type="text/javascript">
    function initialize() {
        var latitud = document.getElementById("<%=HFLatitud.ClientId%>").value
        var longitud = document.getElementById("<%=HFLongitud.ClientId%>").value
        var informacion = document.getElementById("<%=HFInfo.ClientId%>").value

        var myLatlng = new google.maps.LatLng(latitud, longitud);
        var myOptions = {
        zoom: 16,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    var marker = new google.maps.Marker({
        position: myLatlng, 
        map: map,
        title:informacion
    });

    //google.maps.event.addListener(bermudaTriangle, 'click', showArrays);
    infowindow = new google.maps.InfoWindow();

}

function showArrays(event) {
    // Since this Polygon only has one path, we can call getPath()
    // to return the MVCArray of LatLngs
    var vertices = this.getPath();

    var contentString = "Clicked Location: <br />" + event.latLng.lat() + "," + event.latLng.lng() + "<br />";

    // Iterate over the vertices.
    //for (var i = 0; i < vertices.length; i++) {
       // var xy = vertices.getAt(i);
      //  contentString += "<br />" + "Coordinate: " + i + "<br />" + xy.lat() + "," + xy.lng();
    //}

    // Replace our Info Window's content and position
    infowindow.setContent(contentString);
    infowindow.setPosition(event.latLng);

    infowindow.open(map);
} 
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:HiddenField ID="HFLatitud" runat="server" Value="20.999" />
   <asp:HiddenField ID="HFLongitud" runat="server" Value="-89.59999" />
   <asp:HiddenField ID="HFInfo" runat="server" />
   <div id="map_canvas" style="width:100%; height:500px">

    </div>

    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mapaPatronesAdeudo.aspx.vb" Inherits="WebSIRECA.mapaPatronesAdeudo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>Adeudos</title>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="util.js"></script>
<script type="text/javascript">
    var infowindow;
    var map;

    function initialize() {
        var myLatlng = new google.maps.LatLng(20.999, -89.59999);
        var myOptions = {
            zoom: 13,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        downloadUrl("xmls/patronX.xml", function (data) {
            var markers = data.documentElement.getElementsByTagName("marker");
            for (var i = 0; i < markers.length; i++) {
                var latlng = new google.maps.LatLng(parseFloat(markers[i].getAttribute("lat")),
                                    parseFloat(markers[i].getAttribute("lng")));
                var marker = createMarker(markers[i].getAttribute("regpat") + "<br/><em>" + markers[i].getAttribute("razonsocial") + "</em>", latlng);
            }
        });
    }

    function createMarker(name, latlng) {
        var marker = new google.maps.Marker({ position: latlng, map: map });
        google.maps.event.addListener(marker, "click", function () {
            if (infowindow) infowindow.close();
            infowindow = new google.maps.InfoWindow({ content: name });
            infowindow.open(map, marker);
        });
        return marker;
    }

</script>
</head>
<body  onload="initialize()">
    <form id="form1" runat="server">
    <div>
    <div id="map_canvas" style="width:500; height:500"></div>
    </div>
    </form>
</body>
</html>

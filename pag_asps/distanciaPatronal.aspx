<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="distanciaPatronal.aspx.vb" Inherits="WebSIRECA.calculoTiempo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
        body {
	        font-family: "Calibri";
        }
</style>    
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/css3.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/general.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/afdemos.css" media="screen" />
<script type="text/javascript">
    window.google_analytics_uacct = "UA-7130344-6";
</script>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-7130344-6']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div >
    <div >
        <div id="mapa" style="width: 100%; height: 100%;">                          
            <label for="origen" style="float: left">Origen </label>
            <input type="text" name="origen" id="origen" size="50" placeholder="calle, ciudad, estado..." style="float: left" value=",centro,merida,yucatan"/>
            <label for="destino" style="float: left">Destino </label>
            <input type="text" name="destino" id="destino" size="50" placeholder="calle, ciudad, estado..." style="float: left" value=",centro,merida,yucatan"/>
            <input type="button" id="buscar" value="Buscar ruta" style="float: left"/>
            <br/><br/><br/>
            <div id="rutaOps" style="float: left">
                <label style="float: left">Opciones de ruta</label>
                <select id="modo_viaje" class="opciones_ruta">
                    <option value="DRIVING" selected="selected">Auto</option>
                    <option value="BICYCLING">Bicicleta</option>
                    <option value="WALKING">Caminando</option>
                </select>
                <select id="tipo_sistema" class="opciones_ruta">
                    <option value="METRIC" selected="selected">Metrico</option>
                    <option value="IMPERIAL">Imperial</option>
                </select>
            </div>
            <br />
            <br />
            <div>
                <div id="map_canvas" style="float:left; width:60%; height:400px"></div>
                <div id="panel_ruta" style="float:left; overflow: auto; width:40%; height: 400px"></div>
            </div>
            <br/>
        </div>
    </div>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
    var map;
    var directionsDisplay = new google.maps.DirectionsRenderer();
    var directionsService = new google.maps.DirectionsService();

    $(document).ready(function () {
        load_map();
    });
    function load_map() {
        var myLatlng = new google.maps.LatLng(20.999, -89.59999);
        var myOptions = {
            zoom: 4,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map($("#map_canvas").get(0), myOptions);
    }
    function rockAndRoll() {
        var request = {
            origin: $('#origen').val(),
            destination: $('#destino').val(),
            travelMode: google.maps.DirectionsTravelMode[$('#modo_viaje').val()],
            unitSystem: google.maps.DirectionsUnitSystem[$('#tipo_sistema').val()],
            provideRouteAlternatives: true
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setMap(map);
                directionsDisplay.setPanel($("#panel_ruta").get(0));
                directionsDisplay.setDirections(response);
            } else {
                alert("No existen rutas entre ambos puntos");
            }
        });
    }
    $('#buscar').live('click', function () {
        rockAndRoll();
    });

    $('.opciones_ruta').live('change', function () {
        rockAndRoll();
    });
</script>
</div>
    </form>
</body>
</html>

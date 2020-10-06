<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SetUbicacion.aspx.vb" Inherits="WebSIRECA.SetUbicacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Registro</title>
<style type="text/css">
  html { height: 100% }
  body { height: 100%; margin: 0px; padding: 0px; font-family: "Calibri" }
  #map_canvas { height: 100% }
    #address
    {
        width: 297px;
    }
</style>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">    
    <div class="error"></div>
    <asp:Label ID="Label1" runat="server" Text="Reg.Patronal:"></asp:Label>&nbsp;
    <asp:TextBox ID="TBRegpat" runat="server" MaxLength="11">0000000000</asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="Buscar" />&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="ó Direccion:"></asp:Label>&nbsp;
    <input type="text" maxlength="100" size="80px" id="address" placeholder="Direccion"/>
    <input type="button" id="search" value="Buscar" />
        <asp:DropDownList ID="DDLlong" runat="server" 
            DataSourceID="SqlDataSourceDetallePatronal" DataTextField="latitud" 
            DataValueField="latitud">
            <asp:ListItem>-89.59999</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DDLlat" runat="server" 
            DataSourceID="SqlDataSourceDetallePatronal" DataTextField="longitud" 
            DataValueField="longitud">
            <asp:ListItem>20.999</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Guardar >>>" 
        Visible="False" />
        
        <asp:SqlDataSource ID="SqlDataSourceDetallePatronal" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id]
      ,[subdel]
      ,[sector]
      ,[regpat]
      ,[rfc]
      ,[dom]
      ,[loc]
      ,[act]
      ,lng as [longitud]
      ,lat as [latitud]
      ,[razonSocial]
      ,[tipoPatron]
  FROM [sireca].[dbo].[patrones]
WHERE id=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div style="width: 20%; float: left;">
        <asp:Panel ID="Panel1" runat="server" Height="500px" ScrollBars="Auto">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSourceRegPat" 
                AllowPaging="True" AllowSorting="True" Font-Size="9pt">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="sector" HeaderText="sector" 
                    SortExpression="sector" />
                <asp:BoundField DataField="regpat" HeaderText="regpat" 
                    SortExpression="regpat" />
                <asp:BoundField DataField="dom" HeaderText="dom" 
                    SortExpression="dom" />
                <asp:BoundField DataField="razonSocial" HeaderText="razonSocial" 
                    SortExpression="razonSocial" />
                <asp:BoundField DataField="longitud" HeaderText="longitud" 
                    SortExpression="longitud" />
                <asp:BoundField DataField="latitud" HeaderText="latitud" 
                    SortExpression="latitud" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        </asp:Panel>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceRegPat" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 10 [id]
      ,[subdel]
      ,[sector]
      ,[regpat]
      ,[rfc]
      ,[dom]
      ,[loc]
      ,[act]
      ,lng as [longitud]
      ,lat as [latitud]
      ,[razonSocial]
      ,[tipoPatron]
  FROM [sireca].[dbo].[patrones]
WHERE [regpat] like ?+'%'">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="00000000000" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
    </asp:SqlDataSource>
    <div id="map_canvas" style="width: 80%; height: 500px; position: relative; background-color: rgb(229, 227, 223); overflow-x: hidden; overflow-y: hidden; ">
    </div>
  <script type="text/javascript">
      $(document).ready(function () {
          load_map();
      });

      var map;

      function load_map() {
          var long = document.getElementById("<%=DDLlat.ClientId%>").value;
          var lat = document.getElementById("<%=DDLlong.ClientId%>").value;
          var myLatlng = new google.maps.LatLng(lat, long);
          var myOptions = {
              zoom: 16,
              center: myLatlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          map = new google.maps.Map($("#map_canvas").get(0), myOptions);

          var markerOptions2 = { position: myLatlng, icon: '../imagenes/iconos/patronUbicado.png' }
          var marker = new google.maps.Marker(markerOptions2);
          marker.setMap(map);
      }

      $('#search').live('click', function () {
          var address = $('#address').val();
          var geocoder = new google.maps.Geocoder();
          geocoder.geocode({
              'address': address
          }, geocodeResult);
      });

      function geocodeResult(results, status) {
          if (status == 'OK' && results.length > 0) {
              var mapOptions = {
                  zoom: 16,
                  center: results[0].geometry.location,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              };
              map = new google.maps.Map($("#map_canvas").get(0), mapOptions);
              map.fitBounds(results[0].geometry.viewport);
              var markerOptions = { position: results[0].geometry.location, draggable: true, animation: google.maps.Animation.DROP, icon: '../imagenes/iconos/patronUbicado.png' }
              var marker = new google.maps.Marker(markerOptions);
              marker.setMap(map);
              google.maps.event.addListener(marker, 'click', toggleBounce);
              google.maps.event.addListener(marker, 'mouseup', function () {
                  this.setIcon('../imagenes/iconos/patronUbicado.png');
              });
              google.maps.event.addListener(marker, 'mouseout', function () {
                  //this.setIcon('patronUbicado.png');
              });
              //google.maps.event.addListener(marker, 'mouseover', function (event) {
                  //this.setIcon('patronSeleccionado.png');
                  //document.getElementById("<%=DDLlat.ClientId%>").value = event.latLng.lat();
                  //document.getElementById("<%=DDLlong.ClientId%>").value = event.latLng.lng();                  
                  //$('#longitudx').val(event.latLng.lat());
              //});
              google.maps.event.addListener(marker, 'mousedown', function () {
                  this.setIcon('../imagenes/iconos/patronSeleccionado.png');
              });
          } else {
              showError("El Geocode no fue exitoso debido a: " + status);
          }
      }
      function toggleBounce() {
          if (marker.getAnimation() != null) {
              marker.setAnimation(null);
          } else {
              marker.setAnimation(google.maps.Animation.BOUNCE);
          }
      }
      function showError(text) {
          $('.error').html('');
          $('.error').append(text);
          $('.error').show('slow');
          setTimeout("$('.error').hide('slow')", 5000);
      }

  </script>
   
    </form>
</body>
</html>

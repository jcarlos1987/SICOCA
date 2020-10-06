<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="detallesSeleccionDeven.aspx.vb" Inherits="WebSIRECA.detallesSeleccionDeven" ValidateRequest="False" WarningLevel="0" %>

<asp:Content  ID ="c1" runat ="server" ContentPlaceHolderID ="head" >
    <title>Detalles</title>
    
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
    var marker = new google.maps.Marker({position: latlng, map: map, icon: 'icon/patronUbicado.png'});
    google.maps.event.addListener(marker, "click", function() {
      if (infowindow) infowindow.close();
      infowindow = new google.maps.InfoWindow({content: name});
      infowindow.open(map, marker);
    });
    return marker;
  }
   //window.onload();
</script>
</asp:Content>
<asp:Content  ID ="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/imagenes/exportarexcel.png" />
        <asp:GridView ID="GVDeven" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="DEBEN" CellPadding="3" 
            DataSourceID="SqlDataSourceDeben" Font-Size="9pt">
            <Columns>
            <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='http://11.200.24.211/emamovil/accionSIRECA.asp?menu=&periodo=052012&del=01&srch=p&asg=G624116510' Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/FISCAMOVIL.png" BorderColor="White" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" 
                    SortExpression="PATRONES" Visible="False" />
                <asp:BoundField DataField="PAGADO POR" HeaderText="PAGADO POR" 
                    SortExpression="PAGADO POR" />
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" NullDisplayText="$ 0.00" SortExpression="IMPORTE" />
                <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" 
                    SortExpression="NUMCRED" />
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                <asp:BoundField DataField="FEINC" DataFormatString="{0:d}" HeaderText="FEINC" 
                    NullDisplayText="-- / -- / --" SortExpression="FEINC" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    NullDisplayText="0" SortExpression="COTIZANTES" 
                    DataFormatString="{0:N0}" />
                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                    NullDisplayText="$ 0.00" SortExpression="PAGO" />
                <asp:BoundField DataField="FECHA DE PAGO" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE PAGO" NullDisplayText="-- / -- / --" 
                    SortExpression="FECHA DE PAGO" />
                <asp:BoundField DataField="RAZON SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="RAZON SOCIAL" />
                <asp:BoundField DataField="PAGO A" HeaderText="PAGO A" NullDisplayText="--" 
                    SortExpression="PAGO A" />
                <asp:BoundField DataField="lat" SortExpression="lat" NullDisplayText="20.999">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng" SortExpression="lng" 
                    NullDisplayText="-89.59999">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="REGPATR,RAZON SOCIAL" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon={1}" 
                    NavigateUrl="~/observacionPatronal/Default.aspx" Text="observacion" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                Font-Size="11pt" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDeben" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ESTADO]
      ,[PATRONES]
      ,[PAGADO POR]
      ,[INCIDENCIA]
      ,[REGPATR]
      ,[IMPORTE]
      ,[NUMCRED]
      ,(SELECT '('+rd.[docto]+')'+rd.[descripcion] FROM [sireca].[dbo].[doc_rale] as rd where rd.[docto]=[TD]) as [TD]
      ,(SELECT '('+sr.[inc]+')'+sr.[descripcion] FROM [sireca].[dbo].[inc_rale] as sr where sr.[inc]=[INC]) as [INC]
      ,[FEINC]
      ,[COTIZANTES]
      ,[PAGO]
      ,[FECHA DE PAGO]
      ,[RAZON SOCIAL]
      ,[PAGO A]
      ,[rale]
      ,[subdel]
      ,[periodo]
      ,[anio]
      ,[mes]
  FROM [sireca].[dbo].[TEMPDEBEN127_0_0_1] as tp
where estado='sin ema'"></asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
            <div id="map_canvas" style="float:left;width:100%;height:600px">   
             <script type="text/javascript" language="javascript">initialize();</script>         
            </div>
    </div>
</asp:Content>

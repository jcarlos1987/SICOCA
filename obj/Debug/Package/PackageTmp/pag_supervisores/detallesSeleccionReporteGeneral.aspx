<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="detallesSeleccionReporteGeneral.aspx.vb" Inherits="WebSIRECA.detallesSeleccionReporteGeneral" %>

<asp:Content  ID ="c1" runat ="server" ContentPlaceHolderID ="head" >
    <title>Detalles</title>
    
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" language="javascript">
var infowindow;
  var map;
    function initialize() {
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
  function createMarker(name, latlng, iconoImagen) {
    var marker = new google.maps.Marker({position: latlng, map: map, icon: iconoImagen});
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
<asp:Content  ID ="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >


    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/imagenes/exportarexcel.png" />
        <asp:GridView ID="GVEma" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="EMA" CellPadding="3" 
            DataSourceID="SqlDataSourceEma" HorizontalAlign="Center" Font-Size="10pt">
            <Columns>
            <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='http://11.200.24.211/emamovil/accionSIRECA.asp?menu=&periodo=052012&del=01&srch=p&asg=G624116510' Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/FISCAMOVIL.png" BorderColor="White" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="REG PATRONAL" HeaderText="REG PATRONAL" 
                    ReadOnly="True" SortExpression="REG PATRONAL" />
                <asp:BoundField DataField="RAZON SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="RAZON SOCIAL" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" />
                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                    NullDisplayText="$ 0.00" SortExpression="PAGO" />
                <asp:BoundField DataField="FECHA DE PAGO" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE PAGO" NullDisplayText="-- / -- / --" 
                    SortExpression="FECHA DE PAGO" />
                <asp:BoundField DataField="EMISION" DataFormatString="{0:C}" 
                    HeaderText="EMISION" SortExpression="EMISION" />
                <asp:BoundField DataField="PAGADO POR" HeaderText="ORIGEN DE PAGO" 
                    SortExpression="PAGADO POR" />
                <asp:BoundField DataField="PAGO A" HeaderText="PAGO A" NullDisplayText="--" 
                    SortExpression="PAGO A" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" NullDisplayText="0" 
                    SortExpression="sector" />
                <asp:BoundField DataField="lat" NullDisplayText="20.999" 
                    SortExpression="lat" >
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng" NullDisplayText="-89.59999" 
                    SortExpression="lng" >
                    
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="REG PATRONAL,RAZON SOCIAL" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon={1}" 
                    NavigateUrl="~/observacionPatronal/Default.aspx" Text="observacion" />    
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
        <asp:SqlDataSource ID="SqlDataSourceEma" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
      substring([EMIP_PATRON],2,10) as [REG PATRONAL]
      ,[EMIP_NOM_PATRON] as [RAZON SOCIAL]
      ,[EMIP_NUM_TRAB_COT] as [COTIZANTES]
	  ,[pagos] as [PAGO]
      ,[fecha] as [FECHA DE PAGO]
      ,[emision] as [EMISION]
	  ,[PAGADO POR] as [PAGADO POR]
      ,[tipodepago] as [PAGO A]
  FROM [sireca].[dbo].[EMMA33010112]"></asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
            <div id="map_canvas" style="float:left;width:100%;height:600px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
    </div>
</asp:Content>

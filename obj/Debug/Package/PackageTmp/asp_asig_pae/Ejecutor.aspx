<%@ Page Language="vb" MasterPageFile ="~/Site.Master" AutoEventWireup="false" CodeBehind="Ejecutor.aspx.vb" Inherits="WebSIRECA.Ejecutor1" %>

<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
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
</asp:Content>
<asp:Content ID ="Contend1" runat ="server" ContentPlaceHolderID="ContentPlaceHolder1"  >
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="32px" 
            ImageAlign="Middle" ImageUrl="~/imagenes/imprimir1.jpg" Width="31px" 
            ToolTip="Imprimir" BorderStyle="Solid" />&nbsp;&nbsp;&nbsp;        
        <asp:DropDownList ID="DDLFechas" runat="server" 
            DataSourceID="SqlDataSourceFechas" DataTextField="fechas" 
            DataValueField="fechas" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Actualizar" />
        <asp:SqlDataSource ID="SqlDataSourceFechas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct(convert(nvarchar(11),eco.fechaSeleccionPae)) as fechas
FROM [sireca].[dbo].[eco] as eco
where eco.fechaSeleccionPae is not null
and eco.subdel=? and responsablePae=? and cambiarIncidenciaPae in ('0','1')
and ((year(fechaseleccionPae)=year(getdate()) and month(fechaseleccionPae)=month(getdate()))
or (year(fechaseleccionPae)=year(getdate()) and month(fechaseleccionPae)=month(getdate())-1))
order by fechas desc">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView 
            ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" Font-Size="9pt" 
            BorderColor="Black" BorderStyle="Groove" BorderWidth="1px" CellPadding="4" 
            AllowSorting="True" ForeColor="#333333" 
            Caption="Patrones Seleccionados" EmptyDataText="0">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                    SortExpression="emi_sec" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" />
                <asp:BoundField DataField="REG#PATRONAL" 
                    HeaderText="REGISTRO" 
                    SortExpression="REG#PATRONAL" />
                <asp:TemplateField HeaderText="NOMBRE O RAZON SOCIAL" 
                    SortExpression="NOMBRE_O_RAZON_SOCIAL">
                    <ItemTemplate>
                        <asp:HyperLink title="Zona de Captura" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detallespatron.aspx?regpat=" & Eval("[REG#PATRONAL]") & "&fechaEco=" & Eval("[fechaEco]") & "&emisec=" & Eval("[emi_sec]") & "&tipoE=" & Eval("[tipoEco]") & "&fecha=" & Eval("[fechaSeleccion]") & "&id=" & Eval("[id]") & "&credito=" & Eval("[CREDITO]") %>' 
                            Text='<%# Eval("NOMBRE_O_RAZON_SOCIAL") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EMIP_DOM" HeaderText="DOMICILIO" 
                    SortExpression="EMIP_DOM" />
                <asp:BoundField DataField="TP" HeaderText="TP" SortExpression="TP" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="longitud">
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
                <asp:BoundField DataField="latitud">
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" BorderColor="Black" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" BorderColor="Black" BorderStyle="None" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL, ptn.dom AS EMIP_DOM
, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.sector AS emi_sec, eco.incidencia
,eco.id ,convert(nvarchar(11),eco.fechaSeleccionPae) as fechaSeleccion, ptn.lng as longitud, ptn.lat as latitud
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE  (eco.subdel = ?)  AND eco.responsablePae=? AND eco.cambiarIncidenciaPae in ('0','1')  and convert(nvarchar(11),fechaSeleccionPae)=?
ORDER BY eco.sector,ptn.lng,ptn.lat">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="0000" Name="?" SessionField="SIRECAid" />
                <asp:ControlParameter ControlID="DDLFechas" DefaultValue="2000-05-15" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFOrigen" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFDestino" runat="server" ClientIDMode="Static" />        
            <div id="map_canvas" style="float:left;width:100%;height:400px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
            
    </div>
   
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/Site.Master"  AutoEventWireup="false" CodeBehind="PaesAsignados.aspx.vb" Inherits="WebSIRECA.PaesAsignados" %>

<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
    <title>PAES ASIGNADOS</title>
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
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
        <%Response.Write(HiddenField1.Value) %>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceP1" 
            EmptyDataText="SIN PATRONES ASIGNADOS" HorizontalAlign="Center" 
            Font-Size="9pt" ShowFooter="True">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="REGPATR,RAZON_SOCIAL,TIPO" 
                    DataNavigateUrlFormatString="CreditosPae.aspx?regpat={0}&amp;razon={1}&amp;tipoECO={2}" 
                    Text="TIPO" HeaderText="Ver CREDITO" DataTextField="TIPO" />
                <asp:BoundField DataField="FECH_ASIG" HeaderText="FECH_ASIG" 
                    SortExpression="FECH_ASIG" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" />
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CASOS" HeaderText="CASOS" ReadOnly="True" 
                    SortExpression="CASOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                    SortExpression="ADEUDO" DataFormatString="{0:C}" NullDisplayText="$ 0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="lat">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "Reasignacion.aspx?regpat=" & Eval("REGPATR") & "&clasificacion=" & Eval("clasificacion") & "&grupo=" & Eval("grupo") & "&responsable=" & Eval("responsable") & "&nombre=" & Request.QueryString("nombre").ToString %>' 
                            Text="REASIGNAR"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Font-Size="9pt" />
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSourceP1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
	[FECH_ASIG],  [REGPATR]
	  ,replace((select razonSocial from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')),'#','') as [RAZON_SOCIAL]
      ,COUNT(CASOS) as CASOS
      ,SUM([ADEUDO]) as ADEUDO
,MAX(SECTOR) as SECTOR
,(select lat from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')) as [lat]
,(select lng from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')) as [lng]
,tipofile as TIPO
,clasificacion as clasificacion
,grupo as grupo
,[ID_RESPONSABLE] as responsable
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
  where clasificacion=? and subdel=? and [ID_RESPONSABLE]=convert(varchar,?)
  and grupo='PAE'
  group by [FECH_ASIG],[REGPATR],tipofile,clasificacion,grupo,[ID_RESPONSABLE]">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="clasificacion" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="userid" />
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

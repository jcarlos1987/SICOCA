<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteInspectorB.Master" AutoEventWireup="false" CodeBehind="Ejecutor.aspx.vb" Inherits="WebSIRECA.Ejecutor2" %>
<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
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
    
        <asp:DropDownList ID="DDLFecha" runat="server" 
            DataSourceID="SqlDataSourceFechCap" DataTextField="fecha" 
            DataTextFormatString="{0:d}" DataValueField="fecha">
        </asp:DropDownList>
        <asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/imprimir1.jpg" ToolTip="Imprimir Reporte" />
        <asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/imprimir1.jpg" ToolTip="Imprimir Reporte" 
            Visible="False" />
        <asp:SqlDataSource ID="SqlDataSourceFechCap" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT convert(varchar(11),fech_cap) as fecha
FROM [sirecacobros].[dbo].[ecoTiposHistorialCap]
where id_responsable=? and fech_cap is not null
group by convert(varchar(11),fech_cap)
order by 1 desc">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:Label ID="Label2" runat="server" Text="REG.PATRONAL:"></asp:Label>
        <asp:TextBox ID="TBRegPat" runat="server" MaxLength="10" BorderStyle="Solid" 
            BorderColor="#BCC7D8"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" BorderStyle="Solid" Text="Buscar en la lista de Asignación" 
            BorderColor="#BCC7D8" />
        <asp:Label ID="Label3" runat="server" Text="Formato (XXXXXXXXXX) 10 CARACTERES" 
            Font-Italic="True" Font-Strikeout="False" ForeColor="#CC0000"></asp:Label><hr />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceP1" HorizontalAlign="Center" 
            AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" CellPadding="1" EmptyDataText="PAE's asignados 0" 
            ShowFooter="True" AllowPaging="True" CellSpacing="1">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "CreditosPae.aspx?regpat=" & Eval("REGPATR") & "&razon=" & Eval("RAZON_SOCIAL") & "&tipoECO=" & Eval("TIPO") %>' 
                            Text='<%# Eval("TIPO") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="FECH_ASIG" />
                <asp:TemplateField HeaderText="REGPATR" SortExpression="REGPATR">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" title="Observacion" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# Eval("REGPATR", "../observacionPatronal/Default.aspx?regpat={0}&razon=razon") %>' 
                            Text='<%# Eval("REGPATR") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CASOS" HeaderText="CASOS" ReadOnly="True" 
                    SortExpression="CASOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                    SortExpression="ADEUDO" DataFormatString="{0:C}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="lat">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSourceP1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
	tipofile as TIPO	  
      ,[REGPATR]
	  ,replace((select razonSocial from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')),'#','') as [RAZON_SOCIAL]
      ,COUNT(CASOS) as CASOS
      ,SUM([ADEUDO]) as ADEUDO
,(select lat from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')) as [lat]
,(select lng from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')) as [lng]
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
  where subdel=? and [ID_RESPONSABLE]=convert(varchar,?) --clasificacion
  and grupo='PAE' and [REGPATR] like ?+'%'
  and inc_cap='x'
  group by tipofile,[REGPATR],tipofile">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAid" />
                <asp:ControlParameter ControlID="TBRegPat" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFOrigen" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFDestino" runat="server" ClientIDMode="Static" />        
            <div id="map_canvas" style="float:left;width:100%;height:400px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
        <asp:Panel ID="PObservaciones" runat="server" GroupingText="Observaciones (INSPECTOR)">
            <asp:GridView ID="GVObservacion" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSourceObservacion" 
                EmptyDataText="SIN COMENTARIOS" ForeColor="#333333" GridLines="None" 
                ShowHeader="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="OBSERVO" HeaderText="OBSERVO" ReadOnly="True" 
                        SortExpression="OBSERVO" >
                    <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FECH_OBSERVACION" DataFormatString="({0:d}):" 
                        HeaderText="FECH_OBSERVACION" SortExpression="FECH_OBSERVACION">
                    <ItemStyle Font-Italic="True" Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                        SortExpression="OBSERVACION" >
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_oi] as ID
,(select nombre from fiscamovil.dbo.usuarios where [id]=[id_inspector]) as INSPECTOR
,upper((select nombre from fiscamovil.dbo.usuarios where [id]=[id_observo])) as OBSERVO
,[fecha_observacion] as FECH_OBSERVACION
,[observacion] as OBSERVACION
FROM [sirecaObservaciones].[dbo].[ObservacionInspector]
WHERE [id_inspector]=?
order by [fecha_observacion]">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="10099" Name="?" SessionField="SIRECAid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="TBObservacion" runat="server" MaxLength="254" Width="424px" 
                BorderColor="#BCC7D8" BorderStyle="Solid"></asp:TextBox>
            <asp:Button ID="BComentar" runat="server" Text="Comentar" BorderColor="#BCC7D8" 
                BorderStyle="Solid" />
            <asp:Label ID="LError" runat="server" 
    Font-Bold="True" Font-Size="10pt" ForeColor="#CC0000"></asp:Label>

        </asp:Panel>
    </div>
</asp:Content>

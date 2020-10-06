<%@ Page Language="vb" MasterPageFile="~/Site2.Master" AutoEventWireup="false" CodeBehind="ejecutor.aspx.vb" Inherits="WebSIRECA.ejecutor" %>
<asp:Content ID="contendhead" runat ="server" ContentPlaceHolderID="head">
    <style type="text/css"> @import url("../css/body.css"); </style>
    <script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
    </script>

    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false" language="javascript"></script>
<script type="text/javascript">
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
    var oldDirections = [];
    var currentDirections = null;

    function initialize() {
        var myOptions = {
            zoom: 13,
            center: new google.maps.LatLng(20.999, -89.59999),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

        directionsDisplay = new google.maps.DirectionsRenderer({
            'map': map,
            'preserveViewport': true,
            'draggable': true
        });
        directionsDisplay.setPanel(document.getElementById("directions_panel"));

        google.maps.event.addListener(directionsDisplay, 'directions_changed',
      function () {
          if (currentDirections) {
              oldDirections.push(currentDirections);
              setUndoDisabled(false);
          }
          currentDirections = directionsDisplay.getDirections();
      });

        setUndoDisabled(true);

        calcRoute();
    }

    function calcRoute() {
        //------------------------------------------------------------------------
        var marcadores = [];
        <%Response.Write(HiddenField1.Value)%>
        //------------------------------------------------------------------------
        var start = new google.maps.LatLng(20.996017505661825, -89.64557575559616);
        var end = new google.maps.LatLng(20.996017505661825, -89.64557575559616);

        var request = {
            origin: start,
            waypoints: marcadores,
            destination: end,
            optimizeWaypoints: true,
            unitSystem: google.maps.DirectionsUnitSystem.METRIC,
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };        
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });
    }

    function undo() {
        currentDirections = null;
        directionsDisplay.setDirections(oldDirections.pop());
        if (!oldDirections.length) {
            setUndoDisabled(true);
        }
    }

    function setUndoDisabled(value) {
        document.getElementById("undo").disabled = value;
    }
</script>
    </asp:Content>
<asp:Content ID="contend1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
    <asp:ImageButton ID="ImageButton5" runat="server" 
                ImageUrl="~/imagenes/guardar.png" ToolTip="guardar cambios" />
        <asp:Panel ID="Panel1" runat="server" Height="600px" ScrollBars="Auto">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceEjecutor" AllowSorting="True" Font-Size="9pt" 
                AutoGenerateColumns="False" DataKeyNames="REGPATR" 
                HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="+MAPA">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="NOMBRE O RAZON SOCIAL">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CASOS" DataFormatString="{0:N0}" HeaderText="CASOS" 
                    SortExpression="CASOS" />
                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTE" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTE" NullDisplayText="0" SortExpression="COTIZANTE" />
                <asp:BoundField DataField="EMISION" DataFormatString="{0:C}" 
                    HeaderText="EMISION" NullDisplayText="0" SortExpression="EMISION">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="INCIDENCIA">
                    <ItemTemplate>
                        <asp:HiddenField ID="HFIncidencia" runat="server" Value="31" />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSourceIncidencias" DataTextField="nombre" 
                            DataValueField="incidencia" Font-Size="8pt" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:FileUpload ID="FUImagen" runat="server" Visible="False" />
                        <asp:Button ID="BSubir" runat="server" Text="subir imagen" Visible="False" />
                        <asp:SqlDataSource ID="SqlDataSourceIncidencias" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @INCIDENCIA VARCHAR(50)
SET @INCIDENCIA=?
SELECT [incidencia]
      ,[nombre]
  FROM [sirecacobros].[dbo].[incidenciassicofi]
WHERE [clave31]=@INCIDENCIA">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HFIncidencia" DefaultValue="000" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OBSERVACIONES">
                    <ItemTemplate>
                        <asp:TextBox ID="TBObservacion" runat="server" Height="76px" MaxLength="254" 
                            Width="229px"></asp:TextBox>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TIPO_ADEUDO" HeaderText="TIPO_ADEUDO" 
                    SortExpression="TIPO_ADEUDO" />
                <asp:TemplateField HeaderText="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "creditosPatronEjecutor.aspx?regpat=" & Eval("REGPATR") & "&razonsocial=" & Eval("RAZON_SOCIAL") & "&tipoeco=COP" %>' 
                            rel="gb_page_fs[]" Text="" title="Detalles COP">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/lista_casos.png" BorderStyle="None" /></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# "creditosPatronEjecutor.aspx?regpat=" & Eval("REGPATR") & "&razonsocial=" & Eval("RAZON_SOCIAL") & "&tipoeco=RCV" %>' 
                            rel="gb_page_fs[]" Text="" title="Detalles RCV">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/lista_casos.png" BorderStyle="None" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="lat" SortExpression="lat">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
                <asp:BoundField DataField="lng" SortExpression="lng">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
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
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEjecutor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sirecacobros.dbo.sysobjects where name = 'Busqueda_PAE_TIPO')
begin
SELECT  
      distinct([REGPATR])
	  --,[TIPOECO]
      ,[RAZON_SOCIAL]
      ,sum([CASOS]) as [CASOS]
      ,sum([ADEUDO]) as [ADEUDO]
      ,[COTIZANTE]
      ,[EMISION]
      ,[TIPO_ADEUDO]
      ,[ASIGNADO]
      ,[INCIDENCIA_CAPTURADA]
      ,[EJECUTOR]
      ,[FECHA_CAPTURA]
      ,[SUPERVISOR]
      ,[FECHA_ASIGNACION]
      ,[IP_CAPTURA]
      ,[IP_ASIGNACION]
      ,[lat]
      ,[lng]
FROM sirecacobros.dbo.Busqueda_PAE_TIPO
where [EJECUTOR]=convert(nvarchar,?)
group by 
	[REGPATR]
	--  ,[TIPOECO]
      ,[RAZON_SOCIAL]
      --,[CASOS]
      --,[ADEUDO]
      ,[COTIZANTE]
      ,[EMISION]
      ,[TIPO_ADEUDO]
      ,[ASIGNADO]
      ,[INCIDENCIA_CAPTURADA]
      ,[EJECUTOR]
      ,[FECHA_CAPTURA]
      ,[SUPERVISOR]
      ,[FECHA_ASIGNACION]
      ,[IP_CAPTURA]
      ,[IP_ASIGNACION]
      ,[lat]
      ,[lng]
order by [TIPO_ADEUDO]
end">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="VACIO" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
            </asp:SqlDataSource>            
            <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" 
                Value="marcadores.push({ location: new google.maps.LatLng(20.996017505661825, -89.64557575559616) });" />
     </asp:Panel> 
     <asp:Button ID="Button1" runat="server" Text="AGREGAR PATONES AL MAPA" />
     <div id="map_canvas" style="float:left;width:70%;height:600px"></div>
<div style="float:right;width:30%;height:600px; overflow:scroll">
  <button id="undo" style="display:block;margin:auto" onclick="undo()">Ruta Anterior
  </button>
  <div id="directions_panel" style="width:100%"></div>
</div>
  <script type="text/javascript" language="javascript">
      initialize();
  </script>
    </div>
  
</asp:Content>
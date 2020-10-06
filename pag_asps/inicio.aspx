<%@ Page Language="vb" MasterPageFile="~/sitios/SiteInspectorA.Master" CodeBehind="inicio.aspx.vb" Inherits="WebSIRECA.inicio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
</asp:Content>
<asp:Content ID ="Contend1" runat ="server" ContentPlaceHolderID="ContentPlaceHolder1"  >
    <div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate >
            <asp:Panel ID="Panel1" runat="server" GroupingText="Impimir Reportes" 
                HorizontalAlign="Right">                    
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
        <asp:DropDownList ID="DDLFechas" runat="server" 
            DataSourceID="SqlDataSourceFechas" DataTextField="fechas" 
            DataValueField="fechas" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Actualizar" BorderColor="#BCC7D8" 
            BorderStyle="Solid" />&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" Height="32px" 
            ImageAlign="AbsMiddle" ImageUrl="~/imagenes/imprimir1.jpg" Width="31px" 
            ToolTip="Imprimir" BorderStyle="Solid" BorderColor="#BCC7D8" BorderWidth="1px" />
        <asp:SqlDataSource ID="SqlDataSourceFechas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select top 10 resultado.fechas as fechas
from (
SELECT convert(nvarchar(10),eco.fechaSeleccion,103) as fechas
FROM [sireca].[dbo].[eco] as eco
where eco.fechaSeleccion is not null
and eco.subdel=? and responsable=? and cambiarIncidencia in ('0','1')
) as resultado
group by resultado.fechas
order by convert(datetime,fechas,103) desc
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
        <ProgressTemplate >CARGANDO...</ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
                        <ProgressTemplate >CARGANDO...</ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="UpdatePanel2" 
            runat="server" DisplayAfter="50">
            <ProgressTemplate >
            CARGANDO...
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table style="width:100%;">
            <tr>
                <td>
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
                            <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:Label ID="Label8" runat="server" Text="TIPO DE EMISION:"></asp:Label>
                            <asp:DropDownList ID="DDLTipoEmision" runat="server" 
                        AutoPostBack="True">
                                <asp:ListItem Value="1">TODOS</asp:ListItem>
                                <asp:ListItem Value="2">C.O.P.</asp:ListItem>
                                <asp:ListItem Value="3">C.O.P. EST.</asp:ListItem>
                                <asp:ListItem Value="4">C.O.P. COMP.</asp:ListItem>
                                <asp:ListItem Value="5">R.C.V.</asp:ListItem>
                                <asp:ListItem Value="6">R.C.V. EST.</asp:ListItem>
                                <asp:ListItem Value="7">R.C.V. COMP.</asp:ListItem>
                            </asp:DropDownList>
                                                                    <asp:Label ID="Label6" 
                        runat="server" Text=" ASIGNACION DE: "></asp:Label>
                                                                    <asp:DropDownList ID="DDLFecInicio" runat="server" AutoPostBack="True" 
                                                                        
                        DataSourceID="SqlDataSourceFechaFin" DataTextField="fecha" 
                                                                        
                        DataTextFormatString="{0:d}" DataValueField="fecha">
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSourceFechaInicio" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 10 * from (SELECT
distinct convert(varchar(10),[fechaSeleccion],103) as fecha
,convert(datetime,convert(varchar(10),[fechaSeleccion],103),103) as orden
FROM [sireca].[dbo].[eco]
where subdel=? and fechaSeleccion is not null
and responsable=?
group by convert(varchar(10),[fechaSeleccion],103)
) as rest
order by 2 desc
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:Label ID="Label7" 
                        runat="server" Text=" AL "></asp:Label>
                                                                    <asp:DropDownList ID="DDLFechFin" runat="server" AutoPostBack="True" 
                                                                        
                        DataSourceID="SqlDataSourceFechaFin" DataTextField="fecha" 
                                                                        
                        DataTextFormatString="{0:d}" DataValueField="fecha">
                                                                    </asp:DropDownList>
                                                                    <asp:Button ID="BActualizarInspector" runat="server" Text="Actualizar" 
                                                                        BackColor="#FFFBFF" 
                        BorderColor="#5D7B9D" BorderStyle="Solid" BorderWidth="1px" 
                                                                        ForeColor="#284775" />
                                                                    <asp:SqlDataSource ID="SqlDataSourceFechaFin" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 10 * from (SELECT
distinct convert(varchar(10),[fechaSeleccion],103) as fecha
,convert(datetime,convert(varchar(10),[fechaSeleccion],103),103) as orden
FROM [sireca].[dbo].[eco]
where subdel=? and fechaSeleccion is not null
and responsable=?
group by convert(varchar(10),[fechaSeleccion],103)
) as result
order by 2 desc
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate >                    
                    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#E6E2D8" 
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Names="Verdana" Font-Size="0.8em" Height="100%" Width="100%">
                        <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" 
                            BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" 
                            HorizontalAlign="Center" />
                        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" 
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                            ForeColor="#1C5E55" />
                        <SideBarButtonStyle ForeColor="White" />
                        <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" 
                            Width="100px" />
                        <StepStyle BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" 
                            BorderWidth="2px" />
                        <WizardSteps>
                            <asp:WizardStep runat="server" title="Patrones">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TBRegpat" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                                MaxLength="15" Width="280px"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="TBE1" runat="server" TargetControlID="TBRegpat" WatermarkCssClass="watermarked" WatermarkText="REG.PATRONAL/ RAZON SOCIAL/ CREDITO">
                        </asp:TextBoxWatermarkExtender> 
                                            <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#FFE8A6" 
                                                BorderColor="#BCC7D8" Font-Underline="False">&nbsp;&nbsp;BUSCAR&nbsp;&nbsp;</asp:LinkButton>
                                            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                BorderWidth="1px" Caption="Patrones Seleccionados" CellPadding="1" 
                                                CellSpacing="1" DataSourceID="SqlDataSource2" EmptyDataText="0" Font-Size="9pt" 
                                                ForeColor="#333333">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                                                        SortExpression="tipoEco" />
                                                    <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                                                        SortExpression="emi_sec" />
                                                    <asp:BoundField DataField="PERIODO7" HeaderText="PERIODO" 
                                                        SortExpression="PERIODO7">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                                                        SortExpression="CREDITO" />
                                                    <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                                                        SortExpression="incidencia" />
                                                    <asp:TemplateField HeaderText="REG.PATRONAL" SortExpression="REGISTRO">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink2" runat="server" 
                                                                NavigateUrl='<%# Eval("REGISTRO", "../observacionPatronal/Default.aspx?regpat={0}&razon=razon") %>' 
                                                                Target="_blank" rel="gb_page_fs[]" Text='<%# Eval("REGISTRO") %>' ToolTip="Agregar Observacion al PATRON"></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ControlStyle Font-Underline="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="NOMBRE O RAZON SOCIAL" 
                                                        SortExpression="NOMBRE_O_RAZON_SOCIAL">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                                                NavigateUrl='<%# "capturaincidencianotificacioncredito.aspx?regpat=" & Eval("[REG#PATRONAL]") & "&fechaEco=" & Eval("[fechaEco]") & "&emisec=" & Eval("[emi_sec]") & "&tipoE=" & Eval("[tipoEco]") & "&fecha=" & Eval("[fechaSeleccion]") & "&regpatid=" & Eval("[id]") & "&credito=" & Eval("[CREDITO]") %>' 
                                                                rel="gb_page_fs[]" Target ="_blank"  Text='<%# Eval("NOMBRE_O_RAZON_SOCIAL") %>' 
                                                                title="Ir a Zona de Captura"></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ControlStyle Font-Underline="False" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="EMIP_DOM" HeaderText="DOMICILIO" 
                                                        SortExpression="EMIP_DOM">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" BorderColor="Black" />
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
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
                                                
                                                
                                                
                                                
                                                
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @REGPAT AS VARCHAR(10)
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @REGPAT=?
if @REGPAT='%'
begin
SELECT ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL,substring(eco.REG#PATRONAL,1,10) as REGISTRO, ptn.dom AS EMIP_DOM
, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.sector AS emi_sec, eco.incidencia
,eco.id ,eco.fechaSeleccion as fechaSeleccion, ptn.lng as longitud, ptn.lat as latitud
,substring(ptn.loc,1,6) as muni
,substring(ptn.loc,len(ptn.loc)-5,6) as cp
,(case 
when len(fechaeco)=5
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) as PERIODO7
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE  eco.subdel = @SUBDEL
AND eco.responsable=@RESPONSABLE
AND eco.cambiarIncidencia in ('0','1')
AND convert(varchar(10),[fechaSeleccion],103) between convert(datetime,@FECH_INICIO,103) and convert(datetime,@FECH_FIN,103)
ORDER BY eco.REG#PATRONAL,convert(datetime,'01/'+(case 
when len(fechaeco)=5
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end),103)
end
else
begin
SELECT top 24 ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL,substring(eco.REG#PATRONAL,1,10) as REGISTRO, ptn.dom AS EMIP_DOM
, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.sector AS emi_sec, eco.incidencia
,eco.id ,eco.fechaSeleccion as fechaSeleccion, ptn.lng as longitud, ptn.lat as latitud
,substring(ptn.loc,1,6) as muni
,substring(ptn.loc,len(ptn.loc)-5,6) as cp
,(case 
when len(fechaeco)=5
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) as PERIODO7
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE  eco.subdel = @SUBDEL
AND eco.responsable=@RESPONSABLE
and (eco.REG#PATRONAL like @REGPAT+'%' or [NOMBRE O RAZON SOCIAL] like @REGPAT+'%' or eco.CREDITO like @REGPAT+'%')
AND eco.cambiarIncidencia in ('0','1')
ORDER BY eco.REG#PATRONAL,convert(datetime,'01/'+(case 
when len(fechaeco)=5
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end),103)
end
">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:SessionParameter DefaultValue="0000" Name="?" SessionField="SIRECAid" />
                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01-01-2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01-01-2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="TBRegpat" DefaultValue="%" Name="?" 
                                                        PropertyName="Text" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" title="Geolocalización">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
<%# "<script type ='text/javascript' >"%>
    <asp:Repeater runat="server" id="markers">
        <ItemTemplate>
        <%# " var marker = createMarker  ('" + Eval("razonSocial") + "',new google.maps.LatLng(" + Eval("latitud") + ", " + Eval("longitud") + ")); " %>
        </ItemTemplate>
    </asp:Repeater>
<%# "</script>"%>
<script type="text/javascript">
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
    //Response.Write(HiddenField1.Value)
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
</script><div id="map_canvas" style="float:left;width:800px;height:400px">
<script language="javascript" type="text/javascript">initialize();</script>
                                            </div>
                                            <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField ID="HFDestino" runat="server" ClientIDMode="Static" />
                                            <asp:HiddenField ID="HFOrigen" runat="server" ClientIDMode="Static" />
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(50)
DECLARE @FECH_FIN AS VARCHAR(50)
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SELECT ptn.razonSocial as razonSocial, eco.tipoECO AS tipoEco,substring(eco.REG#PATRONAL,1,10) as registro, ptn.dom AS domicilio
, ptn.loc as localidad, eco.CREDITO as credito, eco.COTIZ as cotizantes, eco.OMISION as importe
, eco.fechaEco as periodo, eco.sector as sector, eco.incidencia
,eco.fechaSeleccion as fechaAsignacion, ptn.lng as longitud, ptn.lat as latitud
,substring(ptn.loc,1,6) as municipio
,substring(ptn.loc,len(ptn.loc)-5,6) as cp
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE  eco.subdel = @SUBDEL
AND eco.responsable=@RESPONSABLE
AND eco.cambiarIncidencia in ('0','1')
AND (convert(datetime,(convert(varchar,day([fechaSeleccion]))+'/'+convert(varchar,month([fechaSeleccion]))+'/' +convert(varchar,year([fechaSeleccion]))),103)) between convert(datetime,@FECH_INICIO,103) and convert(datetime,@FECH_FIN,103)
ORDER BY eco.sector,muni,cp,emip_dom">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:SessionParameter DefaultValue="0000" Name="?" SessionField="SIRECAid" />
                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01-01-2000" 
                                                        Name="?" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01-01-2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td >
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td >
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" Title="Resultados">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GVRPorInspectorPatron0" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                BorderWidth="1px" Caption="POR INCIDENCIA" CaptionAlign="Left" CellPadding="1" 
                                                CellSpacing="1" DataSourceID="SqlDataSourcePorInspectorInc">
                                                <Columns>
                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                                                        SortExpression="PERIODO">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                                                        SortExpression="INCIDENCIA">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <HeaderStyle BackColor="#99CB99" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourcePorInspectorInc" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                
                                                
                                                
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT 
('''+@MES+'/'+@ANIO+''') as PERIODO
,&quot;INCIDENCIA&quot; = case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.responsable='''+@RESPONSABLE+''' '+@ADD_WHERE+'
and eco.fechaeco = '''+@PERIODO+'''
and convert(varchar(10),[fechaSeleccion],103)
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
GROUP BY eco.incidencia
ORDER BY INCIDENCIA
')
">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAid" />
                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                                                        Name="?" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GVRPorInspector0" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                BorderWidth="1px" Caption="POR TIPO Y INCIDENCIA" CaptionAlign="Left" 
                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceFiguraTipoInc">
                                                <Columns>
                                                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                        SortExpression="TIPO">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                                                        SortExpression="INCIDENCIA">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:HyperLinkField DataNavigateUrlFields="URLV" 
                                                        DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/incidenciaejecutor.aspx{0}" 
                                                        DataTextField="PATRONES" HeaderText="PATRONES" 
                                                        NavigateUrl="~/areaemision/detallesdeseleccion/grupos/incidenciaejecutor.aspx" 
                                                        SortExpression="PATRONES" Target="_blank" />
                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <HeaderStyle BackColor="#99CB99" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceFiguraTipoInc" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                
                                                
                                                
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RESPONSABLE AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @TIPO AS VARCHAR(254)
DECLARE @TIPO_ECO AS VARCHAR(2)
DECLARE @ADD_COLUM AS VARCHAR(254)
DECLARE @ADD_WHERE AS VARCHAR(254)
SET @MES = ?
SET @ANIO=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
SET @PERIODO=@MES+@ANIO

select @TIPO =(select (case @TIPO_ECO
when '1' then ' tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') ' --TODOS
when '2' then ' tipoEco in (''COP'',''COMP'') ' --COP
when '3' then ' tipoEco in (''COP'') ' --COP ESTR
when '4' then ' tipoEco in (''COMP'') ' --COMP
when '5' then ' tipoEco in (''RCV'',''RCVCOMP'') ' --RCV
when '6' then ' tipoEco in (''RCV'') ' --RCV EST
when '7' then ' tipoEco in (''RCVCOMP'') ' --RCV COMP
end))
SET @ADD_COLUM=(select (case @TIPO_ECO
when '1' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --TODOS
when '2' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' when ''COMP'' then ''C.O.P. COMP.'' end) ' --COP
when '3' then ' (case tipoEco when ''COP'' then ''C.O.P. EST.'' end) ' --COP ESTR
when '4' then ' (case tipoEco when ''COMP'' then ''C.O.P. COMP.'' end) ' --COMP
when '5' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV
when '6' then ' (case tipoEco when ''RCV'' then ''R.C.V. EST.'' end) ' --RCV EST
when '7' then ' (case tipoEco when ''RCVCOMP'' then ''R.C.V. COMP.'' end) ' --RCV COMP
end))

SET @ADD_WHERE=' and '+@TIPO
exec(
'SELECT '+@ADD_COLUM+' as TIPO
,(''?mes='+@MES+'&amp;anio='+@ANIO+'&amp;subdel='+@SUBDEL+'&amp;responsable='+@RESPONSABLE+'&amp;fech_inicio='+@FECH_INICIO+'&amp;fech_fin='+@FECH_FIN+'&amp;tipo_eco='+@TIPO_ECO+'&amp;tipo_file=''+eco.tipoEco+''&amp;incidencia=''
+(
case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
)
) as URLV
,&quot;INCIDENCIA&quot; = case 
	when eco.incidencia is null then ''SIN TRABAJAR''
	else (SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia)
	end
,COUNT(distinct(REG#PATRONAL)) AS PATRONES,COUNT(CREDITO) AS CREDITOS,SUM(COTIZ) as COTIZANTES,SUM(eco.OMISION) AS IMPORTE,SUM(eco.MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE eco.subdel = '''+@SUBDEL+'''
and eco.responsable='''+@RESPONSABLE+''' '+@ADD_WHERE+'
and eco.fechaeco = '''+@PERIODO+'''
and convert(varchar(10),[fechaSeleccion],103) 
between convert(datetime,'''+@FECH_INICIO+''',103) and convert(datetime,'''+@FECH_FIN+''',103)
GROUP BY eco.tipoEco,eco.incidencia
ORDER BY TIPO,INCIDENCIA
')
">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAid" />
                                                    <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                                                        Name="?" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLTipoEmision" DefaultValue="1" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" Title="Recaudado">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GVRecaudacion0" runat="server" AutoGenerateColumns="False" 
                                                BorderColor="Black" BorderStyle="Solid" 
                                                Caption="ESTADO DE LA META C.O.P. Y RECAUDACION R.C.V." CaptionAlign="Left" 
                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceRecaInsp">
                                                <Columns>
                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                        SortExpression="PERIODO">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="A_RECAUDAR_COP" DataFormatString="{0:C}" 
                                                        HeaderText="A RECAU. C.O.P." NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="A_RECAUDAR_COP">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="RECAUDACION_COP" DataFormatString="{0:C}" 
                                                        HeaderText="RECAU. C.O.P." NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="RECAUDACION_COP">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="META" DataFormatString="{0:C}" HeaderText="META" 
                                                        NullDisplayText="0" ReadOnly="True" SortExpression="META" Visible="False">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="DIFERENCIA_IMP_META" DataFormatString="{0:C}" 
                                                        HeaderText="DIF.META" NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="DIFERENCIA_IMP_META">
                                                    <ItemStyle ForeColor="Red" HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="PATRONES_COP_PAGARON" DataFormatString="{0:N0}" 
                                                        HeaderText="PAT.  PAG. C.O.P." NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="PATRONES_COP_PAGARON">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TOTAL_PATRONES_COP" DataFormatString="{0:N0}" 
                                                        HeaderText="TOT.PAT." NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="TOTAL_PATRONES_COP">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="META_ALCANSADA" HeaderText="META ALCAN." 
                                                        ReadOnly="True" SortExpression="META_ALCANSADA">
                                                    <ItemStyle Font-Bold="False" ForeColor="Red" HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="A_RECAUDAR_RCV" DataFormatString="{0:C}" 
                                                        HeaderText="A REC. R.C.V." NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="A_RECAUDAR_RCV">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="RECAUDACION_RCV" DataFormatString="{0:C}" 
                                                        HeaderText="RECAU. R.C.V." NullDisplayText="0" ReadOnly="True" 
                                                        SortExpression="RECAUDACION_RCV">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <FooterStyle Font-Bold="True" />
                                                <HeaderStyle BackColor="#99CB99" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceRecaInsp" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                
                                                
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PERIODO_ANIO as VARCHAR(4)
DECLARE @PERIODO_MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @PATRONES_COP as INT
DECLARE @IMP_RCV as FLOAT
DECLARE @IMP_DISPONIBLE_COP as FLOAT
DECLARE @PATRONES_DISPONIBLE_COP as INT
DECLARE @IMP_DISPONIBLE_RCV as FLOAT
DECLARE @RESPONSABLE AS VARCHAR(6)
SET @PERIODO_ANIO=?
SET @PERIODO_MES=?
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @META_MES=(
SELECT top 1  ([meta]) as meta
FROM [sirecacobros].[dbo].[metas]
where mes=@PERIODO_MES and anio=@PERIODO_ANIO
and sub_del=@SUBDEL and [tipo_meta]='cobranza'
)
SET @IMP_COP=(
select sum(omision)
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and responsable=@RESPONSABLE
and eco.tipoEco in ('COP','COMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @PATRONES_COP=(select count(distinct(reg#patronal))
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and responsable=@RESPONSABLE
and eco.tipoEco in ('COP','COMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @IMP_RCV=(select sum(omision)
FROM sireca.dbo.eco as eco
where 
eco.fechaeco=(@PERIODO_MES+@PERIODO_ANIO) 
and responsable=@RESPONSABLE
and eco.tipoEco in ('RCV','RCVCOMP')
and (
CASE 
		WHEN eco.validacion='DEPURADO RALE' THEN 'PAGADO'
		WHEN eco.validacion like '%COMPLETO' THEN 'PAGADO'
		WHEN eco.validacion like '%PARCIAL' THEN 'PAGADO'
		WHEN eco.incidencia='9' THEN 'NO LOCALIZADOS'
		WHEN eco.incidencia='BD' THEN 'BAJA DEFINITIVA'
		WHEN eco.incidencia='RE' THEN 'PAGADO'
		WHEN eco.incidencia='PAGADO' THEN 'PAGADO'
		WHEN eco.incidencia='POR PROCESAR' THEN 'PAGADO'
		WHEN eco.incidenciarale in ('01','02','31','32') THEN 'POR COBRAR'
		WHEN eco.incidenciarale in ('09') THEN 'NO LOCALIZADOS'
		WHEN eco.incidenciarale in ('05','52') THEN 'CONVENIO'
		WHEN eco.incidenciarale in ('06','14','15') THEN 'JUICIO'
		WHEN eco.incidenciarale in ('13','19') THEN 'PROC. COBRO'
		WHEN eco.incidenciarale in ('33','34','35','36','37','38','39','40','41','42','43') THEN 'EMBARGO'
		WHEN eco.incidenciarale in ('43') THEN 'EMB. DE CUENTAS'
	ELSE 'POR COBRAR'
	END
)='PAGADO'
and subdel=@SUBDEL
)
SET @IMP_DISPONIBLE_COP=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and responsable=@RESPONSABLE
and tipoEco in ('COP','COMP')
)
SET @PATRONES_DISPONIBLE_COP=(select count(distinct([REG#PATRONAL])) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and responsable=@RESPONSABLE
and tipoEco in ('COP','COMP')
)
SET @IMP_DISPONIBLE_RCV=(select sum(omision) as IMPORTE_DISPONIBLE from sireca.dbo.eco
where subdel=@SUBDEL 
and responsable=@RESPONSABLE
and fechaEco=(@PERIODO_MES+@PERIODO_ANIO)
and tipoEco in ('RCV','RCVCOMP')
)
select 
(@PERIODO_MES+'/'+@PERIODO_ANIO) as PERIODO
,@IMP_DISPONIBLE_COP as A_RECAUDAR_COP
,@IMP_COP as RECAUDACION_COP
,@META_MES as META
,(@IMP_COP-@IMP_DISPONIBLE_COP) as DIFERENCIA_IMP_META
,@PATRONES_COP as PATRONES_COP_PAGARON
,@PATRONES_DISPONIBLE_COP as TOTAL_PATRONES_COP
,(case when @IMP_COP&gt;=@IMP_DISPONIBLE_COP then 'SI' else 'NO' end) as META_ALCANSADA
,@IMP_DISPONIBLE_RCV as A_RECAUDAR_RCV
,@IMP_RCV as RECAUDACION_RCV
">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Chart ID="Chart11" runat="server" BackColor="Transparent" 
                                                DataSourceID="SqlDataSourceRecaInsp" Width="750px">
                                                <Series>
                                                    <asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                        CustomProperties="DrawingStyle=LightToDark" Label="#VAL{C}" Legend="Legend1" 
                                                        Name="Recaudado" XValueMember="PERIODO" YValueMembers="RECAUDACION_COP">
                                                    </asp:Series>
                                                    <asp:Series ChartArea="ChartArea1" ChartType="Bar" 
                                                        CustomProperties="DrawingStyle=Cylinder" Label="#VAL{C}" Legend="Legend1" 
                                                        Name="Total" XValueMember="PERIODO" YValueMembers="A_RECAUDAR_COP">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea BackColor="White" Name="ChartArea1">
                                                        <AxisY InterlacedColor="Silver" IntervalAutoMode="VariableCount" 
                                                            LineColor="Silver">
                                                            <MajorGrid LineDashStyle="Dot" />
                                                        </AxisY>
                                                        <AxisX>
                                                            <MajorGrid LineDashStyle="NotSet" />
                                                        </AxisX>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Legends>
                                                    <asp:Legend Alignment="Center" Name="Legend1" TextWrapThreshold="50">
                                                        <CellColumns>
                                                            <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column2">
                                                                <Margins Left="15" Right="15" />
                                                            </asp:LegendCellColumn>
                                                            <asp:LegendCellColumn Alignment="MiddleLeft" Name="Column1">
                                                                <Margins Left="15" Right="15" />
                                                            </asp:LegendCellColumn>
                                                            <asp:LegendCellColumn Alignment="MiddleRight" Name="Column3" Text="#TOTAL{C}">
                                                                <Margins Left="15" Right="15" />
                                                            </asp:LegendCellColumn>
                                                        </CellColumns>
                                                    </asp:Legend>
                                                </Legends>
                                            </asp:Chart>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" Title="Pendientes">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" Caption="ACOMULADO C.O.P. y R.C.V." CaptionAlign="Left" 
                                                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceAtrasados">
                                                <Columns>
                                                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                                        SortExpression="INSPECTOR" />
                                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                        SortExpression="PERIODO" />
                                                    <asp:HyperLinkField DataNavigateUrlFields="URLV" 
                                                        DataNavigateUrlFormatString="../areaemision/detallesdeseleccion/grupos/pendientesxejecutor.aspx{0}" 
                                                        DataTextField="PATRONES" DataTextFormatString="{0:N0}" HeaderText="PATRONES" 
                                                        NavigateUrl="~/areaemision/detallesdeseleccion/grupos/pendientesxejecutor.aspx" 
                                                        SortExpression="PATRONES" Target="_blank" />
                                                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <HeaderStyle BackColor="#99CB99" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceAtrasados" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL=?
SELECT 
'?anio='+@ANIO+'&amp;mes='+@MES+'&amp;responsable='+responsable+'&amp;patrones=' +convert(varchar, count(distinct(reg#patronal))) +'&amp;cotizantes='+convert(varchar,sum(cotiz))+'&amp;importe='+convert(varchar,sum(omision)) +'&amp;subdel='+@SUBDEL+'&amp;fechaEco='+convert(varchar,fechaEco) as URLV
,upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=responsable)) as INSPECTOR
,(case len([fechaeco]) when 5 then '0'+substring(convert(varchar,fechaeco),0,2)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),0,3)+'/'+ substring(convert(varchar,fechaeco),3,4) end) as PERIODO
,count(distinct(reg#patronal)) as PATRONES
,count(credito) as CREDITOS
,sum(cotiz) as COTIZANTES
,sum(omision) as IMPORTE
FROM [sireca].[dbo].[eco]
where 
tipoEco in ('COP','COMP','RCV','RCVCOMP')
and fechaeco in ('42013','52013','62013','72013','82013','92013','102013')
and (incidencia in ('0','1','2','A','SIN ATENDER') or incidencia is null)
and validacion = 'SIN PAGO' and incidenciarale in ('00','01','02')
and responsable is not null
and responsable=?
group by responsable,fechaeco
order by 1,2
">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:SessionParameter DefaultValue="09999" Name="?" SessionField="SIRECAid" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" Title="Observaciones">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="PObservaciones" runat="server" Height="400px" ScrollBars="Auto">
                                                <asp:Repeater ID="Repeater1" runat="server" 
                                                    DataSourceID="SqlDataSourceObservacion">
                                                    <ItemTemplate >
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="51">
                                                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# "~/imagenes/usuarios/avatar/" & Eval("idobservo") & ".jpg"%>' Width="50" Height="50" ToolTip='<%# Eval("OBSERVO")%>' BorderStyle="Ridge" BorderWidth="1" BorderColor="#9BBD99" />
                                                                    </td>                                                                    
                                                                    <td>
                                                                    <asp:Panel ID="PanelObservacion" runat="server" BackColor="#A9DBA6" BorderStyle="None">
                                                                    <table border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("OBSERVACION")%>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# "(" & Eval("FECH_OBSERVACION") & ")"%>' Font-Size="8" Font-Italic="True" ForeColor="Gray"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    </table> 
                                                                    </asp:Panel>
                                                                    </td> 
                                                                    </tr> 
                                                            </table>
                                                    
                                                        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="PanelObservacion" Radius="15" Enabled="True">
                                                        </asp:RoundedCornersExtender>
                                                    </ItemTemplate>
                                                    <SeparatorTemplate >
                                                    <br />
                                                    </SeparatorTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                    
                                                    
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_oi] as ID
,[id_observo] as idobservo
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
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TBObservacion" runat="server" BorderColor="#BCC7D8" 
                                                BorderStyle="Solid" MaxLength="254" Width="424px"></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkCssClass="watermarked" TargetControlID="TBObservacion" WatermarkText="Escriba aqui...">
                                                </asp:TextBoxWatermarkExtender>
                                            <asp:Button ID="BComentar" runat="server" BorderColor="#BCC7D8" 
                                                BorderStyle="Solid" Text="Comentar" />
                                            <asp:Label ID="LError" runat="server" Font-Bold="True" Font-Size="10pt" 
                                                ForeColor="#CC0000"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" Title="Configuración">
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Wizard1" EventName="ActiveStepChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
        
        <br />
    </div>
   
</asp:Content>

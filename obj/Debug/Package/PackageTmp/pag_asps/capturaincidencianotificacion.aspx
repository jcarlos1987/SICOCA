<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteInspectorA.Master" CodeBehind="capturaincidencianotificacion.aspx.vb" Inherits="WebSIRECA.capturaincidencianotificacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />

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
<asp:Content ID="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >

                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
                            <asp:DropDownList ID="DDLMes" runat="server" 
        AutoPostBack="True">
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
                            <asp:Label ID="Label8" runat="server" 
        Text="TIPO DE EMISION:"></asp:Label>
                            <asp:DropDownList ID="DDLTipoEmision" runat="server">
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
                                                                    <asp:DropDownList ID="DDLFecInicio" 
                                runat="server" 
                                                                        
                        DataSourceID="SqlDataSourceFechaInicio" DataTextField="fecha" 
                                                                        
                        DataTextFormatString="{0:d}" DataValueField="fecha">
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSourceFechaInicio" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
convert(varchar(10),[fechaSeleccion],103) as fecha
,convert(datetime,convert(varchar(10),[fechaSeleccion],103),103) as orden
FROM [sireca].[dbo].[eco]
where subdel=? and fechaeco=(?+?) and fechaSeleccion is not null
and responsable=?
group by convert(varchar(10),[fechaSeleccion],103)
order by 2 desc
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2001" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:Label ID="Label7" 
                        runat="server" Text=" AL "></asp:Label>
                                                                    <asp:DropDownList ID="DDLFechFin" 
                                runat="server" 
                                                                        
                        DataSourceID="SqlDataSourceFechaFin" DataTextField="fecha" 
                                                                        
                        DataTextFormatString="{0:d}" DataValueField="fecha">
                                                                    </asp:DropDownList>
                                                                    <asp:LinkButton ID="LinkButton2" 
                                runat="server" BackColor="#FFE8A6" BorderColor="#43577B" BorderStyle="Solid" 
                                BorderWidth="1px" Font-Strikeout="False">&nbsp;&nbsp;&nbsp;ACTUALIZAR&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                                                                    <asp:SqlDataSource ID="SqlDataSourceFechaFin" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
convert(varchar(10),[fechaSeleccion],103) as fecha
,convert(datetime,convert(varchar(10),[fechaSeleccion],103),103) as orden
FROM [sireca].[dbo].[eco]
where subdel=? and fechaeco=(?+?) and fechaSeleccion is not null
and responsable=?
group by convert(varchar(10),[fechaSeleccion],103)
order by 2 desc
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2001" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                <asp:Panel ID="Panel1" runat="server" 
                                BackColor="#E6A42B" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                                                    &nbsp;&nbsp;FILTROS DE BUSQUEDA &nbsp;<asp:TextBox ID="VXRegPat" runat="server" BorderColor="#BCC7D8" 
                                                                        BorderStyle="None" BorderWidth="1px" MaxLength="30" Width="300px"></asp:TextBox>
                                                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" 
                                                                        TargetControlID="VXRegPat" WatermarkText="  REG. PATRONAL /RAZON SOCIAL /CREDITO"></asp:TextBoxWatermarkExtender>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#FFE8A6" 
                                                                        BorderColor="#43577B" BorderStyle="Solid" BorderWidth="1px" 
                                                                        Font-Strikeout="False">&nbsp;&nbsp;&nbsp;BUSCAR&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                            </asp:Panel>
                                                                <asp:GridView runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" 
        Caption="Patrones Seleccionados" CellPadding="1" CellSpacing="1" 
        EmptyDataText="0" DataSourceID="SqlDataSource2" BorderColor="Black" 
        BorderWidth="1px" BorderStyle="Solid" Font-Size="9pt" ForeColor="#333333" 
        ID="GridView2" HorizontalAlign="Center">
                                                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                                    <Columns>
                                                                        <asp:BoundField DataField="tipoEco" HeaderText="TIPO" SortExpression="tipoEco">
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                                                                            SortExpression="emi_sec"></asp:BoundField>
                                                                        <asp:BoundField DataField="PERIODO7" HeaderText="PERIODO" 
                                                                            SortExpression="PERIODO7">
                                                                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                                                                            SortExpression="CREDITO"></asp:BoundField>
                                                                        <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                                                                            SortExpression="incidencia"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="REG.PATRONAL" SortExpression="REGISTRO">
                                                                            <ItemTemplate>
                                                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                                NavigateUrl='<%# Eval("REGISTRO", "../observacionPatronal/Default.aspx?regpat={0}&razon=razon") %>' 
                                                                Target="_blank" rel="gb_page_fs[]" Text='<%# Eval("REGISTRO") %>' 
                                                                ToolTip="Agregar Observacion al PATRON"></asp:HyperLink>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="NOMBRE O RAZON SOCIAL" 
                                                                            SortExpression="NOMBRE_O_RAZON_SOCIAL">
                                                                            <ItemTemplate>
                                                                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                                NavigateUrl='<%# "capturaincidencianotificacioncredito.aspx?regpatid=" & Eval("[id]") %>' 
                                                                rel="gb_page_fs[]" Target ="_blank"  Text='<%# Eval("NOMBRE_O_RAZON_SOCIAL") %>' 
                                                                title="Ir a Zona de Captura"></asp:HyperLink>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="EMIP_DOM" HeaderText="DOMICILIO" 
                                                                            SortExpression="EMIP_DOM">
                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#7C6F57" BorderColor="Black"></EditRowStyle>
                                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White">
                                                                    </FooterStyle>
                                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White">
                                                                    </HeaderStyle>
                                                                    <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White">
                                                                    </PagerStyle>
                                                                    <RowStyle BackColor="#E3EAEB" BorderColor="Black" BorderStyle="None"></RowStyle>
                                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333">
                                                                    </SelectedRowStyle>
                                                                    <SortedAscendingCellStyle BackColor="#F8FAFA">
                                                                    </SortedAscendingCellStyle>
                                                                    <SortedAscendingHeaderStyle BackColor="#246B61">
                                                                    </SortedAscendingHeaderStyle>
                                                                    <SortedDescendingCellStyle BackColor="#D4DFE1">
                                                                    </SortedDescendingCellStyle>
                                                                    <SortedDescendingHeaderStyle BackColor="#15524A">
                                                                    </SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" 
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
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO7
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
SELECT TOP 24 ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL,substring(eco.REG#PATRONAL,1,10) as REGISTRO, ptn.dom AS EMIP_DOM
, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.sector AS emi_sec, eco.incidencia
,eco.id ,eco.fechaSeleccion as fechaSeleccion, ptn.lng as longitud, ptn.lat as latitud
,substring(ptn.loc,1,6) as muni
,substring(ptn.loc,len(ptn.loc)-5,6) as cp
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO7
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE  eco.subdel = @SUBDEL
AND eco.responsable=@RESPONSABLE
and (eco.REG#PATRONAL like @REGPAT+'%' or [NOMBRE O RAZON SOCIAL] like @REGPAT+'%' or CREDITO like @REGPAT+'%')
AND eco.cambiarIncidencia in ('0','1')
ORDER BY eco.REG#PATRONAL,convert(datetime,'01/'+(case 
when len(fechaeco)=5
then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end),103)
end
" ID="SqlDataSource2">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" PropertyName="SelectedValue" 
                DefaultValue="00" Name="?"></asp:ControlParameter>
            <asp:SessionParameter SessionField="SIRECAid" DefaultValue="0000" Name="?">
            </asp:SessionParameter>
            <asp:ControlParameter ControlID="DDLFecInicio" PropertyName="SelectedValue" 
                DefaultValue="01-01-2000" Name="?"></asp:ControlParameter>
            <asp:ControlParameter ControlID="DDLFechFin" PropertyName="SelectedValue" 
                DefaultValue="01-01-2000" Name="?"></asp:ControlParameter>
            <asp:ControlParameter ControlID="VXRegPat" DefaultValue="%" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFOrigen" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFDestino" runat="server" ClientIDMode="Static" />
        <div id="map_canvas" style="float:left;width:100%;height:400px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
</asp:Content>

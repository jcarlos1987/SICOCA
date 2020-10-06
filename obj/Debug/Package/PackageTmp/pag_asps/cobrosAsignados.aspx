<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cobrosAsignados.aspx.vb" Inherits="WebSIRECA.cobrosAsignados" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ASIGNACION</title>
    <style type="text/css">
        .style2
        {
            width: 256px;
        }
        body {
	        font-family: "Calibri";
        }
        .style3
        {
            width: 262px;
        }
        .style4
        {
            width: 262px;
        }
    </style>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn" BorderColor="#BCC7D8" onclientclick="javascript:window.print();"><i class="icon-print"></i><i title="IMPRIMIR ASIGNACIÓN">ASIGNACIÓN</i></asp:LinkButton>
        <asp:LinkButton ID="LBContNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-print"></i><i title="CONTROL DE TRABAJO DEL DESPACHO DE LA DILIGENCIA DE LA NOTIFICACION">CONT.NOTIFICACION</i></asp:LinkButton>
    </span>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSourceFechas" DataTextField="fechas" 
            DataValueField="fechas" AutoPostBack="True" Width="120px">
        </asp:DropDownList>
        <span class="add-on">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-refresh"></i></asp:LinkButton>
        </span>
        </div> 
        <br />
    <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="CITATORIOS"></asp:Label>
    </span>
        <span class="add-on">
        <asp:LinkButton ID="LBCopFisica" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA FISICA">COP(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBCopMoral" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA MORAL">COP(MORAL)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvFisica" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA FISICA">RCV(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvMoral" runat="server" CssClass="btn" 
            BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA MORAL">RCV(MORAL)</i></asp:LinkButton>
        </span>
    </div> 
        <br />
    <div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="Label2" runat="server" Text="ACT. DE NOTIFICACIÓN"></asp:Label>
        </span>
        <span class="add-on">        
        <asp:LinkButton ID="LBCopFisicaActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA FISICA">COP(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBCopMoralActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA MORAL">COP(MORAL)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvFisicaActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA FISICA">RCV(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvMoralActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA MORAL">RCV(MORAL)</i></asp:LinkButton>
        </span> 
    </div> 
        <br />
    <div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="Label3" runat="server" Text="IMPRIMIR DOC. DEL"></asp:Label>
        </span>
        <asp:TextBox ID="TBBuscar" runat="server" MaxLength="10"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="TBBuscar" 
            WatermarkText="REGISTRO PATRONAL"></asp:TextBoxWatermarkExtender> 
        <span class="add-on">
            <asp:LinkButton ID="LBBuscar" runat="server" CssClass ="btn">Buscar</asp:LinkButton>
        </span> 
   </div> 
        <br />
        <asp:SqlDataSource ID="SqlDataSourceFechas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select top 15 fechas as fechas
from 
(
SELECT (convert(nvarchar(11),eco.fechaSeleccion,103)) as fechas
FROM [sireca].[dbo].[eco] as eco
where eco.fechaSeleccion is not null
and eco.subdel=? and responsable=?
) as resultado
group by fechas
order by convert(datetime,fechas,103) desc
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="userid" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:Label ID="LNom1" runat="server"></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderColor="#CCCCCC" BorderWidth="1px" Caption="Factura(s)" 
            CellPadding="3" DataSourceID="SqlDataSource2" Font-Size="8pt" 
            AllowSorting="True" EmptyDataText="Sin Facturas Disponibles">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                    SortExpression="emi_sec" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaCaptura" DataFormatString="{0:d}" 
                    HeaderText="FECHA DILIGENCIA" SortExpression="fechaCaptura" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="incidencia" HeaderText="DILIGENCIA" 
                    SortExpression="incidencia" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="RALE INC." SortExpression="RALE_INC">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RALE_INC") %>' 
                            ToolTip="INCIDENCIA DEL ULTIMO RALE CARGADO"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFFF66" Font-Bold="True" ForeColor="#CC0000" 
                        HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RALE FECHA DE NOT." 
                    SortExpression="RALE_FECH_NOT">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Eval("RALE_FECH_NOT", "{0:d}") %>' 
                            ToolTip="FECHA DE NOTIFICACION DEL ULTIMO RALE CARGADO"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFFF66" Font-Bold="True" ForeColor="#CC0000" 
                        HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="horaCitatorio" HeaderText="Hora del Citatorio" 
                    SortExpression="horaCitatorio" DataFormatString="{0:t}" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE_O_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="NOMBRE_O_RAZON_SOCIAL" />
                <asp:BoundField DataField="EMIP_DOM" HeaderText="DOM." 
                    SortExpression="EMIP_DOM" />
                <asp:BoundField DataField="EMIP_LOC" HeaderText="MUNICIPIO" 
                    SortExpression="EMIP_LOC" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="CODIGO_POSTAL" HeaderText="COD. POSTAL" 
                    SortExpression="CODIGO_POSTAL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton ID="printRectDom" runat="server" CommandArgument ='<%# Eval("id_eco") %>' 
                            ToolTip="9313-009-047 INVITACION PARA RATIFICAR O RECTIFICAR DOM" onprerender="printRectDom_PreRender" 
                            ><i class="icon-print"></i></asp:LinkButton>
                    <asp:LinkButton ID="printDomDistinct" runat="server" CommandArgument ='<%# Eval("id_eco") %>' 
                            ToolTip="9313-009-048 INFORME DE NOTIFICACION EN DOMICILIO DISTINTO" onprerender="printDomDistinct_PreRender"><i class="icon-print"></i></asp:LinkButton>
                    <asp:LinkButton ID="printActCircunsHechos" runat="server" CommandArgument ='<%# Eval("id_eco") %>' 
                            ToolTip="ACTA CIRCUNSTANCIADA DE HECHOS" 
                            onprerender="printActCircunsHechos_PreRender"><i class="icon-print"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(10)
DECLARE @REGPAT as VARCHAR(15)
DECLARE @FECH_ASIG as VARCHAR(10)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_ASIG=?
SET @REGPAT=?

SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
EXEC('
SELECT * 
,isnull((
SELECT top 1 [REG#PATRONAL]
FROM [sireca].[dbo].[eco] AS ECON
WHERE ECON.incidencia=''9'' and ECON.subdel='''+@SUBDEL+''' and ECON.[REG#PATRONAL]=RESULTADOT.[REG#PATRONAL] 
and (''01/''+(case
when ECON.[tipoECO] in (''COP'',''COMP'') then
(case when len(ECON.fechaeco)=5 then ''0''+substring(convert(varchar,ECON.fechaeco),1,1)+''/''+substring(convert(varchar,ECON.fechaeco),2,4) else substring(convert(varchar,ECON.fechaeco),1,2)+''/''+substring(convert(varchar,ECON.fechaeco),3,4) end)
when ECON.[tipoECO] in (''RCV'',''RCVCOMP'') then
(case when len(ECON.fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,ECON.fechaeco),1,1))/2)+''/''+substring(convert(varchar,ECON.fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,ECON.fechaeco),1,2))/2)+''/''+substring(convert(varchar,ECON.fechaeco),3,4) end)
end
))=(case 
when RESULTADOT.tipoEco in (''COP'',''COMP'') then dateadd(month,-1,''01/''+RESULTADOT.fechaEco)
when RESULTADOT.tipoEco in (''RCV'',''RCVCOMP'') then dateadd(month,-2,''01/''+RESULTADOT.fechaEco)
end)
),''0'') as color
FROM (
SELECT * FROM (
SELECT eco.id as id_eco, ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL
, ptn.dom AS EMIP_DOM, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#
, eco.PRIMA, eco.OMISION, eco.RECARGOS, eco.MULTA, eco.TOTAL
,(case
when [tipoECO] in (''COP'',''COMP'') then
(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in (''RCV'',''RCVCOMP'') then
(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
end
) as fechaEco
, eco.sector AS emi_sec, eco.incidencia, eco.horaCitatorio,eco.fechaCaptura 
,ptn.lat as lat
,ptn.lng as lng
,right(ptn.loc,6) as CODIGO_POSTAL
,(case when right(ptn.loc,6)='''' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end) AS EMIP_LOC
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE eco.responsable ='''+@INSPECTOR+''' AND eco.subdel = '''+@SUBDEL+'''
AND convert(nvarchar(11),eco.fechaSeleccion,103)='''+@FECH_ASIG+'''
and SUBSTRING(eco.REG#PATRONAL,1,10) like '''+@REGPAT+'''
) AS RECO
LEFT JOIN 
(
	SELECT REPLACE(REGPATR,''-'','''') AS RALE_REGPAT,NUMCRED AS RALE_CREDITO,FNOTIFICACION AS RALE_FECH_NOT,INC AS RALE_INC,DIAS AS RALE_DIAS,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO
	FROM [rale].[dbo].['+@RALECOP+']
UNION ALL
	SELECT REPLACE(REGPATR,''-'','''') AS RALE_REGPAT,NUMCRED AS RALE_CREDITO,FNOTIFICACION AS RALE_FECH_NOT,INC AS RALE_INC,DIAS AS RALE_DIAS,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO 
	FROM [rale].[dbo].['+@RALERCV+']
) AS RALE ON 
RALE_REGPAT=SUBSTRING(REG#PATRONAL,1,10) AND RALE_CREDITO=CREDITO AND RALE_PERIODO=fechaEco
) AS RESULTADOT 
ORDER BY clave,emi_sec,EMIP_DOM
')
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="userid" />
                <asp:ControlParameter ControlID="DropDownList1" 
                    DefaultValue="01/01/2000" Name="?" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBBuscar" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceResumenIncidencias" 
            Font-Size="10pt" GridLines="None">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA">
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                    SortExpression="TOTAL">
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="COP" HeaderText="COP" ReadOnly="True" 
                    SortExpression="COP" />
                <asp:BoundField DataField="COMP" HeaderText="COMP" ReadOnly="True" 
                    SortExpression="COMP" />
                <asp:BoundField DataField="RCV" HeaderText="RCV" ReadOnly="True" 
                    SortExpression="RCV" />
                <asp:BoundField DataField="RCVCOMP" HeaderText="RCVCOMP" ReadOnly="True" 
                    SortExpression="RCVCOMP" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceResumenIncidencias" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RESPONSABLE VARCHAR(50)
DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECHABUSQUEDA VARCHAR(11)
SET @RESPONSABLE = ?
SET @SUBDEL = ?
SET @FECHABUSQUEDA = ?
SELECT 
isnull((SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = incidencia),'SIN DILIGENCIAR') as INCIDENCIA
, COUNT(*) as TOTAL
, (
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE eco2.responsable = @RESPONSABLE
AND eco2.subdel = @SUBDEL
AND eco2.tipoECO='COP'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND convert(nvarchar(11),eco2.fechaSeleccion,103)=@FECHABUSQUEDA
) as &quot;COP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE eco2.responsable = @RESPONSABLE
AND eco2.subdel = @SUBDEL
AND eco2.tipoECO='COMP'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND convert(nvarchar(11),eco2.fechaSeleccion,103)=@FECHABUSQUEDA
) as &quot;COMP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE eco2.responsable = @RESPONSABLE
AND eco2.subdel = @SUBDEL
AND eco2.tipoECO='RCV'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND convert(nvarchar(11),eco2.fechaSeleccion,103)=@FECHABUSQUEDA
) as &quot;RCV&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE eco2.responsable = @RESPONSABLE
AND eco2.subdel = @SUBDEL
AND eco2.tipoECO='RCVCOMP'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND convert(nvarchar(11),eco2.fechaSeleccion,103)=@FECHABUSQUEDA
) as &quot;RCVCOMP&quot;
FROM sireca.dbo.eco AS eco 
WHERE eco.responsable = @RESPONSABLE
AND eco.subdel = @SUBDEL
AND convert(nvarchar(11),eco.fechaSeleccion,103)=@FECHABUSQUEDA  
group by incidencia
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="userid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:ControlParameter ControlID="DropDownList1" 
                    DefaultValue="2012-05-29 07:11:15.000" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <table style="width: 890;">
        <tr>
            <td class="style3" align="center">
               <asp:Label ID="LNom2" runat="server" Font-Size="10pt"></asp:Label>
                <hr />
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Nombre y Firma del Inspector</strong> </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                <strong>Nombre y Firma del Supervisor</strong> </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFOrigen" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFDestino" runat="server" ClientIDMode="Static" />        
            <div id="map_canvas" style="float:left;width:100%;height:400px">   
             <script type="text/javascript" language="javascript">                 initialize();</script>         
            </div>
    </form>
    </center>
</body>
</html>


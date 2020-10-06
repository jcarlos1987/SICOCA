<%@ Page Language="vb"  AutoEventWireup="false" CodeBehind="detallesSeleccion.aspx.vb" Inherits="WebSIRECA.detallesSeleccion" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Detalles</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		html { height: 100% }
		body { height: 100%; margin: 0px; padding: 0px; font-family: "Calibri" }
		#map_canvas { height: 100% }
	</style>	
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>

    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		html { height: 100% }
		body { height: 100%; margin: 0px; padding: 0px; font-family: "Calibri" }
		#map_canvas { height: 100% }
	</style>
</head>
<body>
<center >
    <form id="form1" runat="server">
    <div>
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/imagenes/exportarexcel.png" ToolTip="Exportar a Excel" />
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            Caption="Visitadores" DataSourceID="SqlDataSourceDetallesSeleccion" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" AllowSorting="True" Font-Size="10pt" PageSize="900" 
            DataKeyNames="id">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink title="Fiscamovil" rel="gb_page_fs[]" ID="HyperLink1" runat="server" NavigateUrl='http://11.200.24.211/emamovil/accionSIRECA.asp?menu=&periodo=052012&del=01&srch=p&asg=G624116510' Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/FISCAMOVIL.png" BorderColor="White" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="id,REG#PATRONAL,fechaEco,tipoECO,sector,incidencia" 
                    DataNavigateUrlFormatString="setIncidencia.aspx?id={0}&amp;regpat={1}&amp;fechaEco={2}&amp;tipoEcox={3}&amp;emisec={4}&amp;incidencia={5}" 
                    NavigateUrl="~/pag_asps/setIncidencia.aspx" Target="_blank" 
                    Text="CAMBIAR INCIDENCIA" />
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" ReadOnly="True" />
                <asp:BoundField DataField="tipoECO" HeaderText="tipoECO" 
                    SortExpression="tipoECO" ReadOnly="True" />
                <asp:BoundField DataField="responsable" HeaderText="INSPECTOR" 
                    SortExpression="responsable" >
                <ItemStyle BackColor="#99FF99" />
                </asp:BoundField>
                <asp:BoundField DataField="incidencia" HeaderText="incidencia" 
                    SortExpression="incidencia" ReadOnly="True" />
                <asp:BoundField DataField="fechaCap" DataFormatString="{0:d}" 
                    HeaderText="FECH_INC" SortExpression="fechaCap" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                    SortExpression="REG#PATRONAL" ReadOnly="True" />
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="TP" HeaderText="TP" 
                    SortExpression="TP" ReadOnly="True" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" HeaderText="NOMBRE O RAZON SOCIAL" 
                    SortExpression="NOMBRE O RAZON SOCIAL" ReadOnly="True" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" ReadOnly="True" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" 
                    SortExpression="COTIZ" ReadOnly="True" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" 
                    SortExpression="DIAS" ReadOnly="True" />
                <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" 
                    ReadOnly="True" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" SortExpression="ACT#" 
                    ReadOnly="True" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" SortExpression="PRIMA" 
                    ReadOnly="True" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    ReadOnly="True" DataFormatString="{0:C}" />
                <asp:BoundField DataField="longitud" Visible="False">
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
                <asp:BoundField DataField="latitud" Visible="False">
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaSeleccion" DataFormatString="{0:d}" 
                    HeaderText="Entrgada" SortExpression="fechaSeleccion" />
                <asp:BoundField DataField="CODIGO_POSTAL" HeaderText="COD.POSTAL" 
                    SortExpression="CODIGO_POSTAL" />
                <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" 
                    SortExpression="MUNICIPIO" />
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
    <asp:SqlDataSource ID="SqlDataSourceDetallesSeleccion" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            SelectCommand="SELECT eco.id,eco.subdel, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, (SELECT razonSocial FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' ) AS [NOMBRE O RAZON SOCIAL]
,(SELECT dom FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' )  as DOMICILIO
, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION
, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO, eco.diasDisponibles, eco.clave
, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector , ptn.longitud as longitud, ptn.latitud as latitud
,(SELECT right(loc,6) FROM sireca.dbo.patrones WHERE substring(eco.REG#PATRONAL,1,10) = regpat) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,(SELECT case when right(loc,6)='' then loc else substring(loc,1,(len(loc)-5)) end FROM sireca.dbo.patrones WHERE substring(eco.REG#PATRONAL,1,10) = regpat) as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE (eco.subdel = ?) AND (eco.incidencia = ? ) 
AND (eco.fechaEco = ?) AND eco.sector=? AND tipoEco=?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="vacio" Name="?" 
                QueryStringField="tipo" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="vacio" Name="?" 
                QueryStringField="sector" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
    <asp:SqlDataSource ID="SqlDataSourceDSSAsig" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.subdel = ?) AND eco.fechaEco=? AND eco.sector =?  AND tipoEco=?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="vacio" Name="?" 
                QueryStringField="sector" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDSSFal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.subdel = ?) AND eco.fechaEco=? AND eco.sector =? and eco.cambiarIncidencia ='9'  AND tipoEco=?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="vacio" Name="?" 
                QueryStringField="sector" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDSSSInci" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.subdel = ?) AND eco.fechaEco=? AND eco.sector =? and eco.incidencia is null  AND tipoEco=?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="vacio" Name="?" 
                QueryStringField="sector" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDSSN" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.responsable = ?) 
AND eco.subdel=? AND eco.fechaEco=? AND (eco.incidencia = ?) 
AND(CONVERT(datetime,CONVERT(nvarchar(11),eco.fechaSeleccion),101) BETWEEN convert(datetime,?,101) AND convert(datetime,?,101))  AND tipoEco=?">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="sireca" />
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="vacio" Name="?" 
                QueryStringField="tipo2" />
            <asp:SessionParameter DefaultValue="0" Name="?" 
                SessionField="SIRECAbuscarfechaI" />
            <asp:SessionParameter DefaultValue="0" Name="?" 
                SessionField="SIRECAbuscarfechaF" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDSSNCasos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            
            
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.responsable = ?) 
AND eco.subdel=? AND eco.fechaEco=?
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco.fechaSeleccion),101) BETWEEN convert(datetime,?,101) AND convert(datetime,?,101))  AND tipoEco=?">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="sireca" />
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:SessionParameter DefaultValue="0" Name="?" 
                SessionField="SIRECAbuscarfechaI" />
            <asp:SessionParameter DefaultValue="0" Name="?" 
                SessionField="SIRECAbuscarfechaF" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDSSNSIncidencia" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
            
            
            
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.responsable = ?) 
AND eco.subdel=? AND eco.fechaEco=? AND (CONVERT(datetime,CONVERT(nvarchar(11),eco.fechaSeleccion),101) BETWEEN convert(datetime,?,101) AND convert(datetime,?,101)) AND (eco.incidencia IS NULL)  AND tipoEco=?">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="sireca" />
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                QueryStringField="periodo" />
            <asp:SessionParameter DefaultValue="0" Name="?" 
                SessionField="SIRECAbuscarfechaI" />
            <asp:SessionParameter DefaultValue="0" Name="?" 
                SessionField="SIRECAbuscarfechaF" />
            <asp:QueryStringParameter DefaultValue="000" Name="?" 
                QueryStringField="tipoEco" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNotificados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
  WHERE eco.incidencia=?
 and eco.cobrarMulta = '1' and eco.responsable =? 
 and eco.fechaEco = ? and (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0000" Name="?" 
                    QueryStringField="tipo2" />
                <asp:QueryStringParameter DefaultValue="0000" Name="?" 
                    QueryStringField="responsable" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNotificadosAll" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
  WHERE eco.cobrarMulta = '1' and eco.responsable =? and eco.fechaEco = ? and (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0000" Name="?" 
                    QueryStringField="responsable" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceIncidenciaAll" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.incidencia = ?) AND (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="tipo2" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceIncidenciaNULA" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id,eco.subdel, eco.id AS Expr1, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL], eco.TP, (SELECT razonSocial FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' ) AS [NOMBRE O RAZON SOCIAL],(SELECT dom FROM sireca.dbo.patrones WHERE eco.REG#PATRONAL like regpat+'%' )  as DOMICILIO, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco,  (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector , ptn.longitud as longitud, ptn.latitud as latitud
,(SELECT right(loc,6) FROM sireca.dbo.patrones WHERE substring(eco.REG#PATRONAL,1,10) = regpat) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,(SELECT case when right(loc,6)='' then loc else substring(loc,1,(len(loc)-5)) end FROM sireca.dbo.patrones WHERE substring(eco.REG#PATRONAL,1,10) = regpat) as MUNICIPIO
FROM sireca.dbo.eco AS eco  INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.incidencia is null) AND (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.incidencia = 'A') AND (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNLG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.incidencia = '9') AND (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.incidencia IN ('RE', 'POR PROCESAR','PAGADO')) AND (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePCG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
 WHERE (eco.incidencia NOT IN ('A', '9', 'POR PROCESAR', 'RE', 'PAGADO', 'BD') OR eco.incidencia IS NULL) AND (eco.fechaEco = ?) AND (eco.subdel = ?) AND (eco.tipoECO = ?)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceBDG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            
            
            
            
            
            
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE (eco.incidencia = 'BD') AND (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceTG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="SELECT DISTINCT eco.id, eco.id AS Expr1,eco.subdel
, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, eco.TP
, eco.CREDITO
, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA
, eco.TOTAL, eco.fechaEco
, (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO
, eco.diasDisponibles, eco.clave, eco.incidencia
, eco.nomResponsable, eco.horaCitatorio
, eco.sector 
, ptn.longitud as longitud, ptn.latitud as latitud
, ptn.razonSocial AS [NOMBRE O RAZON SOCIAL]
, ptn.dom as DOMICILIO
, right(ptn.loc,6) as CODIGO_POSTAL
,fechaCaptura as fechaCap
,case when right(ptn.loc,6)='' then ptn.loc else substring(ptn.loc,1,(len(ptn.loc)-5)) end as MUNICIPIO
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
WHERE  (eco.fechaEco = ?) AND (eco.subdel = ?)  AND tipoEco=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="periodo" />
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoEco" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
    </center>    
</body>
</html>

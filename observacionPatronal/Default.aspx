<%@ Page Language="vb" MasterPageFile="~/sitios/SiteGeneral.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default13" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="head" runat ="server" ContentPlaceHolderID ="head" >
    <title>Observaciones</title>
        <script type="text/javascript">
            var GB_ROOT_DIR = '../greybox/';
            function ocultar(idobjeto) {
                alert('Publicando mensaje.');
                document.getelEmentById(idobjeto).style.display = 'none';
                alert(idobjeto);
            }
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="PanelHeadGeneral" runat="server" BorderColor="#293955" 
            BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">
        <asp:Image ID="ImageDesplegableGeneral" runat="server" ImageUrl="~/imagenes/expand_blue.jpg" 
                AlternateText="Ocultar" ImageAlign="AbsMiddle" Width="20px" />
                    <asp:Label ID="Label8" runat="server" Text="DATOS DEL PATRON" Font-Bold="True" 
                        Font-Size="14pt"></asp:Label>
                    <asp:HiddenField ID="HFImagenes" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="HFImagenes32" runat="server" 
                ClientIDMode="Static" />
                    <script language="javascript" type="text/javascript">
        //galleria de imagenes
        function OpenImageSet() {
            var image_set = [{ 'caption': 'Galeria de IMAGENES', 'url': '../fotosIncidencia/imss.png' }
            <%Response.Write (HFImagenes.Value) %>];
            return GB_showImageSet(image_set, 1);
        }
        function OpenImageSet32() {
            var image_set = [{ 'caption': 'Galeria de IMAGENES', 'url': '../fotosIncidencia/imss.png' }
            <%Response.Write (HFImagenes.Value) %>];
            return GB_showImageSet(image_set, 1);
        }
    </script>
        </asp:Panel>
        <asp:Panel ID="PanelContentGeneral" runat="server">
          <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    
                    </td>
                <td>
                
                </td>
            </tr>
            <tr>
                <td>
                <table border="0" cellpadding="0" cellspacing="0" class="well" >
            <tr>
                <td align="left" bgcolor="#BCC7D8">

                    <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="#006600" 
                        Text="&nbsp;&nbsp;SUBDELEGACION:"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8">
                    <asp:Label ID="LSUBDEL" runat="server"></asp:Label>
                </td>
                <td align="left"  bgcolor="#BCC7D8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#006600" 
                        Text="&nbsp;&nbsp;REGISTRO PATRONAL:"></asp:Label>
                </td>
                <td align="left" class="style11">
                    <asp:Label ID="LRegpat" runat="server"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#BCC7D8" class="style9">
                    <asp:Label ID="Label6" runat="server" Text="&nbsp;&nbsp;RAZON SOCIAL:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8" class="style11">
                    <asp:Label ID="LRazon" runat="server"></asp:Label>
                </td>
                <td bgcolor="#BCC7D8" class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    <asp:Label ID="Label1" runat="server" Text="&nbsp;&nbsp;SECTOR:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" class="style11">
                    <asp:Label ID="LSector" runat="server"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#BCC7D8" class="style9">
                    <asp:Label ID="Label4" runat="server" Text="&nbsp;&nbsp;RFC:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8" class="style11">
                    <asp:Label ID="LRfc" runat="server"></asp:Label>
                </td>
                <td bgcolor="#BCC7D8" class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    <asp:Label ID="Label7" runat="server" Text="&nbsp;&nbsp;DOMICILIO:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" class="style11">
                    <asp:Label ID="LDomicilio" runat="server"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#BCC7D8" class="style9">
                    <asp:Label ID="Label10" runat="server" Text="&nbsp;&nbsp;LOCALIDAD:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8" class="style11">
                    <asp:Label ID="LLocalidad" runat="server"></asp:Label>
                </td>
                <td bgcolor="#BCC7D8" class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    <asp:Label ID="Label12" runat="server" Text="&nbsp;&nbsp;ACTIVIDAD:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" class="style11">
                    <asp:Label ID="LActividad" runat="server"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#BCC7D8" class="style9">
                    <asp:Label ID="Label14" runat="server" Text="&nbsp;&nbsp;COTIZANTES:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8" class="style11">
                    <asp:Label ID="LCotizantes" runat="server"></asp:Label>
                </td>
                <td bgcolor="#BCC7D8" class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    <asp:Label ID="Label16" runat="server" Text="&nbsp;&nbsp;ULTIMA EMISION:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" class="style11">
                    <asp:Label ID="LUltimaVigencia" runat="server"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#BCC7D8" class="style9">
                    <asp:Label ID="Label18" runat="server" Text="&nbsp;&nbsp;TELEFONO:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8" class="style11">
                    <asp:Label ID="LTelefono" runat="server"></asp:Label>
                </td>
                <td bgcolor="#BCC7D8" class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    <asp:Label ID="Label20" runat="server" Text="&nbsp;&nbsp;CORREO:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" class="style11"> 
                <asp:HyperLink ID="HLCorreo" runat="server" Font-Underline="False"></asp:HyperLink>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#BCC7D8" class="style9">
                    <asp:Label ID="Label2" runat="server" Text="&nbsp;&nbsp;REPRESENTANTE LEGAL:" Font-Bold="True" 
                        ForeColor="#006600"></asp:Label>
                </td>
                <td align="left" bgcolor="#BCC7D8" class="style11">
                    <asp:Label ID="LRepreLegal" runat="server"></asp:Label>
                </td>
                <td bgcolor="#BCC7D8" class="style4">
                    &nbsp;</td>
            </tr>
        </table>
                </td>
                <td>
                <div style="width: 500px" class="well">
                <asp:Panel ID="Panel3" runat="server">
<div class="btn-group input-prepend">
                    <asp:Button ID="Button1" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" Text="Ver Comentarios" 
                        CssClass="btn" />
                    <asp:LinkButton ID="LBApliPAE" runat="server" CssClass="btn" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px">Aplicar P.A.E.</asp:LinkButton>

                    <asp:HyperLink ID="HLAsignar" Visible="false" runat="server" CssClass="btn" BackColor="#BCC7D8">ASIGNAR</asp:HyperLink>
                    <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" onclientclick="javascript:window.print();"><i class="icon-print"></i>&nbsp;&nbsp;Imprimir</asp:LinkButton>
    &nbsp;&nbsp;
                    <asp:ImageButton CssClass="img-rounded" ID="ImageButton3" runat="server" 
                        ImageAlign="AbsBottom" ImageUrl="~/imagenes/menuFotos.png" 
                        onclientclick="return OpenImageSet();" Visible="False" />
                    <asp:HyperLink CssClass="img-rounded" ID="HyperLink1" rel="gb_page_fs[]" title="Archivo(s)" runat="server" NavigateUrl="~/pag_cobros/galeriaarchivoscargados.aspx">
                    <asp:Image  CssClass="img-rounded" ID="Image2" runat="server" ImageUrl="~/imagenes/menuFotos.png" BorderStyle="None" ImageAlign="AbsBottom" /></asp:HyperLink>
                    <a href ="http://11.1.33.226/fiscal/juicio.php" class="img-rounded" target ="_blank" >
                        <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="~/imagenes/sijur.png" Width="70px" ToolTip="Ir al sitio de SIJUR" ImageAlign="AbsMiddle" />
                    </a>
</div> 

                </asp:Panel> 
        <asp:Panel ID="PanelObsHeader" runat="server" GroupingText="Observaciones:" 
            HorizontalAlign="Left" >
            <asp:Panel ID="PObservaciones" runat="server" Font-Size="10pt" Height="200px" 
            ScrollBars="Auto" HorizontalAlign="Left">
            
        <asp:ListView ID="FVObservacion" runat="server" 
            DataSourceID="SqlDataSourceObsExpediente">
            <AlternatingItemTemplate>
                <li style="background-color: #FFF8DC;">
                    <asp:Label ID="FECHA_REGISTROLabel" runat="server" Font-Bold="True" 
                        Font-Italic="True" Text='<%# Eval("FECHA_REGISTRO") %>'></asp:Label>
                    <asp:Label ID="DELabel" runat="server" Font-Bold="True" 
                        Text='<%# Eval("DE") %>'></asp:Label>
                    :<asp:Label ID="OBSERVACIONLabel" runat="server" 
                        Text='<%# Eval("OBSERVACION") %>' ForeColor="#336600" ></asp:Label>
                <br />                    
                    <asp:ListView ID="LVComenObserv" runat="server" 
        DataSourceID="SqlDataSourceComenObser">
        <ItemTemplate>
            <li style="">
                <asp:Label ID="FECHALabel" runat="server" Text='<%# Eval("FECHA") %>' Font-Bold="True" />
                <asp:Label ID="DELabel" runat="server" Text='<%# Eval("DE") %>' Font-Bold="True" />:                
                <asp:Label ID="COMENTARIOLabel" runat="server" 
                    Text='<%# Eval("COMENTARIO") %>' ForeColor="#336600" />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>       
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceComenObser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
      [fechaSystema] as FECHA
      ,(select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=[idUser]) as DE
      ,[comentario] as COMENTARIO
  FROM [sirecaObservaciones].[dbo].[comentarioObservacion]
where [idObservacion]=? order by FECHA ">
        <SelectParameters>
            <asp:ControlParameter ControlID="HFIdObser" DefaultValue="00" Name="?" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HFIdObser" runat="server" Value='<%# Eval("ID") %>' />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HLComentar"  ToolTip="Comentar" runat="server" NavigateUrl='<%# "Comentario.aspx?idOb=" & Eval("ID") & "&regpat=" & Request.QueryString("regpat").ToString & "&razon=" & Request.QueryString("razon").ToString  & "&subdel=" & LSUBDEL.Text%>'>Comentar</asp:HyperLink>
                </li>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                No se han devuelto datos.
            </EmptyDataTemplate>            
            <ItemSeparatorTemplate>
<br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="background-color: #DCDCDC; color: #000000;">
                    <asp:Label ID="FECHA_REGISTROLabel" runat="server" Font-Bold="True" 
                        Font-Italic="True" Text='<%# Eval("FECHA_REGISTRO") %>'></asp:Label>
                    <asp:Label ID="DELabel" runat="server" Font-Bold="True" 
                        Text='<%# Eval("DE") %>' />
                    :
                    <asp:Label ID="OBSERVACIONLabel" runat="server" 
                        Text='<%# Eval("OBSERVACION") %>' ForeColor="#336600"></asp:Label>
                    <br />
                    <asp:ListView ID="LVComenObserv" runat="server" 
        DataSourceID="SqlDataSourceComenObser">
        <ItemTemplate>
            <li style="">
                <asp:Label ID="FECHALabel" runat="server" Text='<%# Eval("FECHA") %>' Font-Bold="True" />
                <asp:Label ID="DELabel" runat="server" Text='<%# Eval("DE") %>' Font-Bold="True" />:                
                <asp:Label ID="COMENTARIOLabel" runat="server" 
                    Text='<%# Eval("COMENTARIO") %>' ForeColor="#336600" />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>       
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceComenObser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
      [fechaSystema] as FECHA
      ,(select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=[idUser]) as DE
      ,[comentario] as COMENTARIO
  FROM [sirecaObservaciones].[dbo].[comentarioObservacion]
where [idObservacion]=? order by FECHA ">
        <SelectParameters>
            <asp:ControlParameter ControlID="HFIdObser" DefaultValue="00" Name="?" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HFIdObser" runat="server" Value='<%# Eval("ID") %>' />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HLComentar" ToolTip="Comentar" runat="server" NavigateUrl='<%# "Comentario.aspx?idOb=" & Eval("ID") & "&regpat=" & Request.QueryString("regpat").ToString & "&razon=" & Request.QueryString("razon").ToString & "&subdel=" & LSUBDEL.Text %>'>Comentar</asp:HyperLink>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>           
        </asp:ListView>
        </asp:Panel>
        </asp:Panel>
                </div>
                <div class="well" style="width: 500px">
<div class="btn-group input-prepend">
        <asp:TextBox ID="TBObservacion" runat="server" MaxLength="200" Width="276px" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                        WatermarkCssClass="watermarked" TargetControlID="TBObservacion" 
                        WatermarkText="Escriba aqui...">
                    </asp:TextBoxWatermarkExtender>
        <asp:DropDownList ID="DDLObservacion" runat="server" 
            DataSourceID="SqlDataSourceObservacion" DataTextField="texto" 
            DataValueField="clave">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [clave]
      ,[texto]
,orden
  FROM [sirecaObservaciones].[dbo].[catalogoObservaciones]
order by orden"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceObsExpediente" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @TIPO as VARCHAR(2)
DECLARE @ID_USUARIO as VARCHAR(10)
DECLARE @REGPAT as VARCHAR(15)
set @TIPO=?
set @ID_USUARIO=?
set @REGPAT=?
if @TIPO='2'
begin
SELECT [id] as ID,[fechaSystema] AS FECHA_REGISTRO      
,([observacion]+'. ( '+(SELECT [texto] FROM [sirecaObservaciones].[dbo].[catalogoObservaciones] where [clave]=[tipo])+')') AS OBSERVACION
,(select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=[idUser]) AS DE
,[tipo] as tipo
FROM [sirecaObservaciones].[dbo].[observacionPatronal]
where [idRegpat]= SUBSTRING(replace(@REGPAT,'-',''),1,10) order by FECHA_REGISTRO
end
else
begin
SELECT [id] as ID,[fechaSystema] AS FECHA_REGISTRO      
,([observacion]+'. ( '+(SELECT [texto] FROM [sirecaObservaciones].[dbo].[catalogoObservaciones] where [clave]=[tipo])+')') AS OBSERVACION
,(select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=[idUser]) AS DE
,[tipo] as tipo
FROM [sirecaObservaciones].[dbo].[observacionPatronal]
where [idRegpat]= SUBSTRING(replace(@REGPAT,'-',''),1,10) and idUser=@ID_USUARIO
order by FECHA_REGISTRO
end
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="?" 
                    SessionField="SIRECAobservacionPatronal" />
                <asp:SessionParameter DefaultValue="999999" Name="?" SessionField="SIRECAid" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" QueryStringField="regpat" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
<asp:LinkButton ID="BAddObservaciony" runat="server" ToolTip="Publicar Observacion" 
        CssClass="btn" BackColor="#BCC7D8" onclientclick="javascript:ocultar(this.id);" 
        BorderColor="#293955" BorderStyle="Solid" BorderWidth="1px">&nbsp;Listo&nbsp;</asp:LinkButton>
<asp:Label ID="LEstadoRegistro" runat="server" ForeColor="#CC0000"></asp:Label>
</div>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContentGeneral" 
            CollapseControlID="PanelHeadGeneral" ExpandControlID="PanelHeadGeneral" 
            SuppressPostBack="True" ImageControlID="ImageDesplegableGeneral" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
        </asp:CollapsiblePanelExtender>
<!-- Panel Contenido vehicular-->
<%  If Not Session.Item("SIRECAnombre") Is Nothing Then %>
   <% If Session.Item("SIRECAdatos_vehiculares").ToString.Equals("1") Then%>
<asp:Panel ID="PanelHeadVehicular" runat="server" BorderColor="#293955" BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">
        <asp:Image ID="ImageDesplegableVehicular" runat="server" ImageUrl="~/imagenes/expand_blue.jpg" AlternateText="Ocultar" ImageAlign="AbsMiddle" Width="20px" />
	<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14pt" Text="DATOS VEHICULARES"></asp:Label>
</asp:Panel>
<asp:Panel ID="PanelContendVehicular" runat="server">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate >
                <asp:GridView ID="GridViewDomReg" runat="server" AutoGenerateColumns="False" 
                    Caption="DOMICILIO REGISTRADO" DataSourceID="SqlDataSourceDomReg" 
                    EmptyDataText="SIN DOMICILIO REGISTRADO" AllowSorting="True" 
                    Font-Size="9pt" HorizontalAlign="Center" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="DR_NOMBRE" HeaderText="NOMBRE" ReadOnly="True" 
                            SortExpression="DR_NOMBRE" />
                        <asp:BoundField DataField="DR_APELLIDO_PATERNO" HeaderText="APELLIDO PATERNO" 
                            ReadOnly="True" SortExpression="DR_APELLIDO_PATERNO" />
                        <asp:BoundField DataField="DR_APELLIDO_MATERNO" HeaderText="APELLIDO MATERNO" 
                            ReadOnly="True" SortExpression="DR_APELLIDO_MATERNO" />
                        <asp:BoundField DataField="DR_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                            ReadOnly="True" SortExpression="DR_RAZON_SOCIAL" />
                        <asp:BoundField DataField="DR_CORREO" HeaderText="CORREO" ReadOnly="True" 
                            SortExpression="DR_CORREO" />
                        <asp:BoundField DataField="DR_CALLE" HeaderText="CALLE" ReadOnly="True" 
                            SortExpression="DR_CALLE" />
                        <asp:BoundField DataField="DR_NUM_EXTERIOR" HeaderText="# EXT." ReadOnly="True" 
                            SortExpression="DR_NUM_EXTERIOR" />
                        <asp:BoundField DataField="DR_NUM_INTERIOR" HeaderText="#INT." ReadOnly="True" 
                            SortExpression="DR_NUM_INTERIOR" />
                        <asp:BoundField DataField="DR_CRUZAMIENTO" HeaderText="CRUZAMIENTOS" 
                            ReadOnly="True" SortExpression="DR_CRUZAMIENTO" />
                        <asp:BoundField DataField="DR_CP" HeaderText="C.P." ReadOnly="True" 
                            SortExpression="DR_CP" />
                        <asp:BoundField DataField="DR_COLONIA" HeaderText="COLONIA" ReadOnly="True" 
                            SortExpression="DR_COLONIA" />
                        <asp:BoundField DataField="DR_LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                            SortExpression="DR_LOCALIDAD" />
                        <asp:BoundField DataField="DR_MUNICIPIO" HeaderText="MUNICIPIO" ReadOnly="True" 
                            SortExpression="DR_MUNICIPIO" />
                        <asp:BoundField DataField="DR_ESTADO" HeaderText="ESTADO" ReadOnly="True" 
                            SortExpression="DR_ESTADO" />
                        <asp:BoundField DataField="DR_PAIS" HeaderText="PAIS" ReadOnly="True" 
                            SortExpression="DR_PAIS" />
                    </Columns>
                    <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDomReg" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                    SelectCommand="SELECT [DR_RFC]
      ,[DR_NOMBRE]
      ,[DR_APELLIDO_PATERNO]
      ,[DR_APELLIDO_MATERNO]
      ,[DR_RAZON_SOCIAL]
      ,[DR_CORREO]
      ,[DR_CALLE]
      ,[DR_NUM_EXTERIOR]
      ,[DR_NUM_INTERIOR]
      ,[DR_CRUZAMIENTO]
      ,[DR_CP]
      ,[DR_COLONIA]
      ,[DR_LOCALIDAD]
      ,[DR_MUNICIPIO]
      ,[DR_ESTADO]
      ,[DR_PAIS]
  FROM [sirecacobros].[dbo].[D_DOM_REGISTRADOS]
  WHERE [DR_RFC]=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LRfc" DefaultValue="99999999999" Name="?" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewDVehiculares" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceDVehicular" 
                    Font-Size="9pt" AllowSorting="True" EmptyDataText="SIN DATOS DE VEHICULOS" 
                    HorizontalAlign="Center" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="DV_SERIE" HeaderText="SERIE" 
                            ReadOnly="True" SortExpression="DV_SERIE" />
                        <asp:BoundField DataField="DV_NOM_PROPIETARIO" HeaderText="NOM_PROPIETARIO" ReadOnly="True" 
                            SortExpression="DV_NOM_PROPIETARIO" />
                        <asp:BoundField DataField="DV_APELLIDO_PATERNO" HeaderText="APELLIDO PATERNO" 
                            ReadOnly="True" SortExpression="DV_APELLIDO_PATERNO" />
                        <asp:BoundField DataField="DV_APELLIDO_MATERNO" HeaderText="APELLIDO MATERNO" 
                            ReadOnly="True" SortExpression="DV_APELLIDO_MATERNO" />
                        <asp:BoundField DataField="DV_CALLE" 
                            HeaderText="CALLE" ReadOnly="True" 
                            SortExpression="DV_CALLE" />
                        <asp:BoundField DataField="DV_NUM_EXTERIOR" 
                            HeaderText="NUM. EXTERIOR" ReadOnly="True" 
                            SortExpression="DV_NUM_EXTERIOR" />
                        <asp:BoundField DataField="DV_NUM_INTERIOR" HeaderText="NUM. INTERIOR" ReadOnly="True" 
                            SortExpression="DV_NUM_INTERIOR" />
                        <asp:BoundField DataField="DV_CRUZA1" HeaderText="CRUZAMIENTO 1" ReadOnly="True" 
                            SortExpression="DV_CRUZA1" />
                        <asp:BoundField DataField="DV_CRUZA2" HeaderText="CRUZAMIENTO 2" 
                            ReadOnly="True" SortExpression="DV_CRUZA2" />
                        <asp:BoundField DataField="DV_CP" HeaderText="C.P." 
                            ReadOnly="True" SortExpression="DV_CP" />
                        <asp:BoundField DataField="DV_COLONIA" HeaderText="COLONIA" ReadOnly="True" 
                            SortExpression="DV_COLONIA" />
                        <asp:BoundField DataField="DV_MUNICIPIO" HeaderText="MUNICIPIO" ReadOnly="True" 
                            SortExpression="DV_MUNICIPIO" />
                        <asp:BoundField DataField="DV_ESTADO" HeaderText="ESTADO" ReadOnly="True" 
                            SortExpression="DV_ESTADO" />
                        <asp:BoundField DataField="DV_PAIS" HeaderText="PAIS" ReadOnly="True" 
                            SortExpression="DV_PAIS" />
                    </Columns>
                    <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDVehicular" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                    SelectCommand="SELECT [DV_ID_VEHICULO]
      ,[DV_SERIE]
      ,[DV_ID_PROPIETARIO]
      ,[DV_NOM_PROPIETARIO]
      ,[DV_APELLIDO_PATERNO]
      ,[DV_APELLIDO_MATERNO]
      ,[DV_RFC]
      ,[DV_CALLE]
      ,[DV_NUM_EXTERIOR]
      ,[DV_NUM_INTERIOR]
      ,[DV_CRUZA1]
      ,[DV_CRUZA2]
      ,[DV_CP]
      ,[DV_COLONIA]
      ,[DV_MUNICIPIO]
      ,[DV_ESTADO]
      ,[DV_PAIS]
  FROM [sirecacobros].[dbo].[D_VEHICULOS]
  WHERE [DV_RFC]=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LRfc" DefaultValue="99999999999" Name="?" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
	</asp:UpdatePanel>
</asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender6" runat="server" CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendVehicular" CollapseControlID="PanelHeadVehicular" ExpandControlID="PanelHeadVehicular" 
            SuppressPostBack="True" ImageControlID="ImageDesplegableEcos" CollapsedText="Desplegar" ExpandedText="Ocultar">
</asp:CollapsiblePanelExtender>
   <% End If %>
<% End If %>
<!-- /Panel Contenido vehicular-->
        <asp:Panel ID="PanelHeadEcos" runat="server" BorderColor="#293955" 
            BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">
        <asp:Image ID="ImageDesplegableEcos" runat="server" ImageUrl="~/imagenes/expand_blue.jpg" 
                AlternateText="Ocultar" ImageAlign="AbsMiddle" Width="20px" />
            <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="14pt" 
                Text="HISTORIAL DE ECOS"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelContendEcos" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate >

            <asp:GridView ID="GridViewEcos" runat="server" AutoGenerateColumns="False" 
                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceEcos" 
                Font-Size="10pt" AllowSorting="True" AllowPaging="True" 
                HorizontalAlign="Center" PageSize="6" Width="100%">
                <AlternatingRowStyle BackColor="#D4D0C8" />
                <Columns>
                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                        SortExpression="SUBDEL" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                        SortExpression="PERIODO" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                        SortExpression="TIPO" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                        HeaderText="NOMBRE/RAZON SOCIAL" ReadOnly="True" 
                        SortExpression="NOMBRE O RAZON SOCIAL" />
                    <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                        SortExpression="CREDITO" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                        SortExpression="COTIZ" DataFormatString="{0:N0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                        SortExpression="IMPORTE" DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PAGO" HeaderText="PAGO" ReadOnly="True" 
                        SortExpression="PAGO" DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DIFERENCIA" HeaderText="DIFERENCIA" ReadOnly="True" 
                        SortExpression="DIFERENCIA" DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FECH_ASIG" DataFormatString="{0:d}" 
                        HeaderText="FECH_ASIG" ReadOnly="True" SortExpression="FECH_ASIG" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                        SortExpression="INSPECTOR" Visible="False" />
                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                        SortExpression="INCIDENCIA" Visible="False" />
                    <asp:BoundField DataField="FECH_CAPTURA" DataFormatString="{0:d}" 
                        HeaderText="FECH_CAPTURA" ReadOnly="True" SortExpression="FECH_CAPTURA" 
                        Visible="False" />
                    <asp:BoundField DataField="incidenciarale" HeaderText="incidenciarale" 
                        ReadOnly="True" SortExpression="incidenciarale" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="CAPTURAS">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenFieldIdEcos" runat="server" 
                                Value='<%# Eval("id") %>' />
                            <asp:GridView ID="GridViewCapturas" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSourceCapturas" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="CICLO" HeaderText="CICLO" SortExpression="CICLO" />
                                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                        SortExpression="INSPECTOR" />
                                    <asp:BoundField DataField="FECH_CAPTURA" HeaderText="FECH_DILIGENCIA" 
                                        SortExpression="FECH_CAPTURA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                                        SortExpression="INCIDENCIA" />
                                    <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                                        SortExpression="OBSERVACION" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceCapturas" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ID_ECO as varchar(50)
SET @ID_ECO=?
SELECT 
'1' as CICLO
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[usuario]) as INSPECTOR
,[fecha] as FECH_CAPTURA
,[incidencia] as INCIDENCIA
,[observaciones] as OBSERVACION
FROM [sireca].[dbo].[HistorialInc]
where idEco=@ID_ECO
union all
SELECT 
'2' as CICLO
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[AC_CP_INSPEC]) as INSPECTOR
,AC_FECH_DILIGENCIA as FECH_CAPTURA
,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=[AC_DILIGENCIA]) as INCIDENCIA
,(SELECT (case when [desc_observacion]='&gt; seleccione' then '' else [desc_observacion] end) FROM [sirecacobros].[dbo].[cae_observacion] WHERE [id_observacion]=[AC_OBSERVACION]) as OBSERVACION
FROM sireca.dbo.eco 
inner join 
[sirecacobros].[dbo].[CO_ACCIONES]
on AC_RA_REGPATR=substring(reg#patronal,1,10) and AC_RA_NUMCRED=credito
where id=@ID_ECO
union all
SELECT 
'3' as CICLO
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[C_INTEGRADOR]) as INSPECTOR
,(case when [C_FEC_DEV_EXP] is null then (case when [C_FEC_LIM_ENTREGA] is null then [C_FEC_ASIGNAC_EXP] else null end) else [C_FEC_DEV_EXP] end) as FECH_CAPTURA
,[R_ESTADO_INTEGRACION] as [R_ESTADO_INTEGRACION]
,[C_OBSEVACION] as OBSERVACION
FROM sireca.dbo.eco as eco inner join [sirecaregistros].[dbo].[registrorangos] as rr on substring(reg#patronal,1,10)=[R_REGPAT] inner join [sirecaregistros].[dbo].[controlrangos] as cr
on rr.id_nd=cr.id_nd
where eco.id=@ID_ECO
order by CICLO desc,FECH_CAPTURA
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HiddenFieldIdEcos" DefaultValue="000" Name="?" 
                                        PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                <PagerSettings Position="TopAndBottom" />
                <PagerStyle BackColor="#D4D0C8" Font-Bold="True" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceEcos" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
[subdel] as SUBDEL
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,[tipoECO] as TIPO
,[NOMBRE O RAZON SOCIAL]
,[CREDITO]
,[COTIZ]
,[OMISION] as IMPORTE
,(case when [pago] is null then 0 else [pago] end) as PAGO
,([OMISION]-(case when [pago] is null then 0 else [pago] end)) as DIFERENCIA
,[fechaSeleccion] as FECH_ASIG 
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) as INSPECTOR
,[incidencia] as INCIDENCIA
,[fechaCaptura] as FECH_CAPTURA
,[incidenciarale]
,id
  FROM [sireca].[dbo].[eco]
where substring(reg#patronal,1,10)=substring(replace(?,'-',''),1,10)
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
order by SUBDEL,
convert(datetime,(case when len([fechaEco]) = 5 then '01/0'+(substring(convert(varchar,[fechaEco]),1,1)+'/'+substring(convert(varchar,[fechaEco]),2,4)) else ('01/'+substring(convert(varchar,[fechaEco]),1,2)+'/'+substring(convert(varchar,[fechaEco]),3,4)) end),103) desc
">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="00000000000" Name="?" 
                        QueryStringField="regpat" />
                </SelectParameters>
            </asp:SqlDataSource>

            </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendEcos" 
            CollapseControlID="PanelHeadEcos" ExpandControlID="PanelHeadEcos" 
            SuppressPostBack="True" ImageControlID="ImageDesplegableEcos" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
        </asp:CollapsiblePanelExtender>

<asp:Panel ID="PanelHeadSivepas" runat="server" BorderColor="#293955" BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">
        <asp:Image ID="ImageDesplegableSivepas" runat="server" ImageUrl="~/imagenes/expand_blue.jpg" AlternateText="Ocultar" ImageAlign="AbsMiddle" Width="20px" />
	<asp:Label ID="LabelSivepas" runat="server" Font-Bold="True" Font-Size="14pt" Text="HISTORIAL DE SIVEPAS"></asp:Label>
</asp:Panel>
<asp:Panel ID="PanelContendSivepas" runat="server">
	<asp:UpdatePanel ID="UpdatePanelSivepas" runat="server" UpdateMode="Conditional">
            <ContentTemplate >
                <asp:GridView ID="GridViewSivepa" runat="server" 
                    DataSourceID="SqlDataSourceSivepa" HorizontalAlign="Center" 
                    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                    PageSize="6" Font-Size="10pt">
                    <Columns>
                        <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                            SortExpression="SUBDEL" />
                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                            SortExpression="TIPO" />
                        <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" ReadOnly="True" 
                            SortExpression="SIVEPA" />
                        <asp:BoundField DataField="FECHA" HeaderText="FECHA" ReadOnly="True" 
                            SortExpression="FECHA" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                            SortExpression="PERIODO" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                            ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                            SortExpression="CREDITO" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                            SortExpression="COTIZ" DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EMI_REAL" HeaderText="EMI_REAL" ReadOnly="True" 
                            SortExpression="EMI_REAL" DataFormatString="{0:C}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RECAUDACION" HeaderText="RECAUDACION" 
                            ReadOnly="True" SortExpression="RECAUDACION" DataFormatString="{0:C}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DIFERENCIA" HeaderText="DIFERENCIA" ReadOnly="True" 
                            SortExpression="DIFERENCIA" DataFormatString="{0:C}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CIFRA_CONTROL" HeaderText="CIFRA_CONTROL" 
                            ReadOnly="True" SortExpression="CIFRA_CONTROL" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenFieldIdSivepa" runat="server" Value='<%# Eval("ID")%>' />
                                <asp:GridView ID="GridViewDiliSivepa" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="SqlDataSourceDiliSivepa" Font-Size="10pt">
                                    <Columns>
                                        <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                            SortExpression="INSPECTOR" />
                                        <asp:BoundField DataField="FECHA_DILIGENCIA" HeaderText="FECHA_DILIGENCIA" 
                                            ReadOnly="True" SortExpression="FECHA_DILIGENCIA" 
                                            DataFormatString="{0:d}" >
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                            SortExpression="DILIGENCIA" />
                                        <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                                            ReadOnly="True" SortExpression="OBSERVACION" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceDiliSivepa" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                                    SelectCommand="SELECT 
(SELECT upper(nombre) from fiscamovil.dbo.usuarios WHERE id=[SVD_USUARIO]) as INSPECTOR
,[SVD_FECH_DILI] as FECHA_DILIGENCIA
,[SVD_DILI] AS DILIGENCIA
,[SVD_OBSERV] AS OBSERVACION
FROM [sirecasivepas].[dbo].[SV_DILI_BASE]
WHERE [SVD_SV_ID]=?">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldIdSivepa" DefaultValue="9999" 
                                            Name="?" PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="btn-info" ForeColor="White" />
                    <PagerSettings Position="TopAndBottom" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
           
                <asp:SqlDataSource ID="SqlDataSourceSivepa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                    SelectCommand="SELECT [SV_ID] AS ID
,[SV_SUBDEL] AS SUBDEL
,[SV_TIPO] AS TIPO
,[SV_SIVEPA] AS SIVEPA
,[SV_FECHA] AS FECHA
,substring(convert(varchar(10),[SV_PERIODO],103),4,7) AS PERIODO
,[SV_RAZON_SOCIAL] AS RAZON_SOCIAL
,[SV_CREDITO] AS CREDITO
,[SV_COTIZ] AS COTIZ
,[SV_EMI_REAL] AS EMI_REAL
,[SV_RECAUDACION] AS RECAUDACION
,[SV_DIFERENCIA] AS DIFERENCIA
,[SV_CLAVE] AS CIFRA_CONTROL
FROM [sirecasivepas].[dbo].[SV_BASE]
WHERE substring([SV_REG_PATRONAL],1,10)=substring(replace(?,'-',''),1,10)
ORDER BY SV_FECHA DESC,SV_PERIODO
">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="99999999" Name="?" 
                            QueryStringField="regpat" />
                    </SelectParameters>
                </asp:SqlDataSource>
           
            </ContentTemplate>
	</asp:UpdatePanel>
</asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtenderSivepas" runat="server" CollapsedImage="~/imagenes/collapse_blue.jpg" ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendSivepas" CollapseControlID="PanelHeadSivepas" ExpandControlID="PanelHeadSivepas" SuppressPostBack="True" ImageControlID="ImageDesplegableSivepas" CollapsedText="Desplegar" ExpandedText="Ocultar">
</asp:CollapsiblePanelExtender>

<asp:Panel ID="PanelHeadGInc" runat="server" BorderColor="#293955" BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">       
        <asp:Image ID="Image3" runat="server" AlternateText="Ocultar" ImageAlign="AbsMiddle" ImageUrl="~/imagenes/expand_blue.jpg" Width="20px" />
	<asp:Label ID="Label5" runat="server" Text="INCIDENCIAS" Font-Bold="True" Font-Size="14pt"></asp:Label>
</asp:Panel>
<asp:Panel ID="PanelContendGInc" runat="server">
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
                <asp:GridView ID="GridViewGInc" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                    Caption="&lt;strong&gt;RESUMEN POR INC, SUB:01&lt;/strong&gt;" CellPadding="1" 
                    CellSpacing="1" DataSourceID="SqlDataSourceGInc" HorizontalAlign="Center" 
                    ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                            SortExpression="INC" />
                        <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                            SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PERIODOS" DataFormatString="{0:N0}" 
                            HeaderText="PERIODOS" ReadOnly="True" SortExpression="PERIODOS">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                            HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                            SortExpression="TIPO">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceGInc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @REGPAT=?
SET @TIPO_COP_RCV=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
--and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
exec('
select 
(select ''(''+incr.inc + '')'' + incr.descripcion from sireca.dbo.inc_rale as incr where incr.inc=rale.INC) as INC
,count((NUMCRED)) as CREDITOS
,count(distinct(PERIODO)) as PERIODOS
,sum([IMPORTE]) as IMPORTE
,rale.TIPO
from (select ''RCV'' as TIPO,* from [rale].[dbo].['+@RALERCV+'] union all select ''COP'' as TIPO,* from [rale].[dbo].['+@RALECOP+']) as rale
left join sireca.dbo.patrones as ptn on ptn.regpat=replace(REGPATR,''-'','''')
where TIPO like '''+@TIPO_COP_RCV+'''
and replace(REGPATR,''-'','''') like '''+@REGPAT+'''
group by rale.TIPO,INC
order by inc
')
">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="01" Name="?" />
                        <asp:ControlParameter ControlID="LRegpat" DefaultValue="regpat" Name="?" 
                            PropertyName="Text" />
                        <asp:Parameter DefaultValue="%" Name="?" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridViewGInc0" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                    Caption="&lt;strong&gt;RESUMEN POR INC, SUB:33&lt;/strong&gt;" CellPadding="1" 
                    CellSpacing="1" DataSourceID="SqlDataSourceGInc0" HorizontalAlign="Center" 
                    ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                            SortExpression="INC" />
                        <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                            SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PERIODOS" DataFormatString="{0:N0}" 
                            HeaderText="PERIODOS" ReadOnly="True" SortExpression="PERIODOS">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                            HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                            SortExpression="TIPO">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="#BCC7D8" CssClass="btn-info" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceGInc0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @REGPAT=?
SET @TIPO_COP_RCV=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
--and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
exec('
select 
(select ''(''+incr.inc + '')'' + incr.descripcion from sireca.dbo.inc_rale as incr where incr.inc=rale.INC) as INC
,count((NUMCRED)) as CREDITOS
,count(distinct(PERIODO)) as PERIODOS
,sum([IMPORTE]) as IMPORTE
,rale.TIPO
from (select ''RCV'' as TIPO,* from [rale].[dbo].['+@RALERCV+'] union all select ''COP'' as TIPO,* from [rale].[dbo].['+@RALECOP+']) as rale
left join sireca.dbo.patrones as ptn on ptn.regpat=replace(REGPATR,''-'','''')
where TIPO like '''+@TIPO_COP_RCV+'''
and replace(REGPATR,''-'','''') like '''+@REGPAT+'''
group by rale.TIPO,INC
order by inc
')
">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="33" Name="?" />
                        <asp:ControlParameter ControlID="LRegpat" DefaultValue="regpat" Name="?" 
                            PropertyName="Text" />
                        <asp:Parameter DefaultValue="%" Name="?" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
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
</asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendGInc" 
            CollapseControlID="PanelHeadGInc" ExpandControlID="PanelHeadGInc" 
            SuppressPostBack="True" ImageControlID="Image3" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
</asp:CollapsiblePanelExtender>

<asp:Panel ID="PanelHeadAdeudo" runat="server" BorderColor="#293955" 
            BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">
            <table style="width:100%;">
                <tr>
                    <td class="style1" rowspan="2">
                        <asp:Image ID="ImageDesplegableAdeudo" runat="server" AlternateText="Ocultar" 
                            ImageAlign="AbsMiddle" ImageUrl="~/imagenes/expand_blue.jpg" Width="20px" />
                    </td>
                    <td class="style7" rowspan="2">
                        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="14pt" 
                            Text="ADEUDO"></asp:Label>
                    </td>
                    <td>
                        <asp:GridView ID="GridViewAdeudosFech" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="SqlDataSourceRelesActuales" 
                            ShowHeader="False" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="c1" HeaderText="c1" ReadOnly="True" 
                                    SortExpression="c1">
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="subdel" HeaderText="subdel" ReadOnly="True" 
                                    SortExpression="subdel" />
                                <asp:BoundField DataField="c2" HeaderText="c2" ReadOnly="True" 
                                    SortExpression="c2">
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ralecop" DataFormatString="{0:D}" 
                                    HeaderText="ralecop" ReadOnly="True" SortExpression="ralecop" />
                                <asp:BoundField DataField="c3" HeaderText="c3" ReadOnly="True" 
                                    SortExpression="c3">
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ralercv" DataFormatString="{0:D}" 
                                    HeaderText="ralercv" ReadOnly="True" SortExpression="ralercv" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceRelesActuales" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as DATETIME
DECLARE @RALERCV as DATETIME
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @RALECOP=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

SELECT 'RALE DE LA SUBDELEGACION: ' as c1
,@SUBDEL as subdel
,', C.O.P.: ' as c2
,@RALECOP as ralecop
,', R.C.V.: ' as c3
,@RALERCV as ralercv
">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="01" Name="?" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridViewAdeudosFech0" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="SqlDataSourceRelesActuales0" 
                            ShowHeader="False" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="c1" HeaderText="c1" ReadOnly="True" 
                                    SortExpression="c1">
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="subdel" HeaderText="subdel" ReadOnly="True" 
                                    SortExpression="subdel" />
                                <asp:BoundField DataField="c2" HeaderText="c2" ReadOnly="True" 
                                    SortExpression="c2">
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ralecop" DataFormatString="{0:D}" 
                                    HeaderText="ralecop" ReadOnly="True" SortExpression="ralecop" />
                                <asp:BoundField DataField="c3" HeaderText="c3" ReadOnly="True" 
                                    SortExpression="c3">
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ralercv" DataFormatString="{0:D}" 
                                    HeaderText="ralercv" ReadOnly="True" SortExpression="ralercv" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceRelesActuales0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as DATETIME
DECLARE @RALERCV as DATETIME
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @RALECOP=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

SELECT 'RALE DE LA SUBDELEGACION: ' as c1
,@SUBDEL as subdel
,', C.O.P.: ' as c2
,@RALECOP as ralecop
,', R.C.V.: ' as c3
,@RALERCV as ralercv
">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="33" Name="?" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
<asp:Panel ID="PanelContendAdeudo" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:GridView ID="GridViewAdeudo" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                            Caption="DEL R.A.L.E &lt;strong&gt;01&lt;/strong&gt;" CellPadding="1" 
                            CellSpacing="1" DataSourceID="SqlDataSourceAdeudo" HorizontalAlign="Right" 
                            ShowFooter="True">
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                                <asp:BoundField DataField="PERIODOS" DataFormatString="{0:N0}" 
                                    HeaderText="PERIODO(S)" SortExpression="PERIODOS">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#D4D4D4" CssClass="btn-info" ForeColor="White" />
                        </asp:GridView>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left">
                        <asp:GridView ID="GridViewAdeudo0" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                            Caption="DEL R.A.L.E &lt;strong&gt;33&lt;/strong&gt;" CellPadding="1" 
                            CellSpacing="1" DataSourceID="SqlDataSourceAdeudo0" HorizontalAlign="Left" 
                            ShowFooter="True">
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                                <asp:BoundField DataField="PERIODOS" DataFormatString="{0:N0}" 
                                    HeaderText="PERIODO(S)" SortExpression="PERIODOS">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#D4D4D4" CssClass="btn-info" ForeColor="White" />
                        </asp:GridView>
                    </td>
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
            <asp:SqlDataSource ID="SqlDataSourceAdeudo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
SET @SUBDEL=?
SET @REGPAT=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
--and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
exec('
SELECT 
''CUOTAS COP'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''02''
and len(PERIODO) not in (''7'')
union all
SELECT 
''MULTAS COP'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''80''
and len(PERIODO) not in (''7'')
union all
SELECT 
''SIVEPAS COP'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''03''
and len(PERIODO) not in (''7'')
union all
SELECT 
''MULTAS SIV. COP y RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''82''
and len(PERIODO) not in (''7'')
union all
SELECT 
''CUOTAS RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALERCV+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''06''
and len(PERIODO) not in (''7'')
union all
SELECT 
''MULTAS RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''81''
and len(PERIODO) not in (''7'')
union all
SELECT 
''SIVEPAS RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALERCV+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''03''
and len(PERIODO) not in (''7'')
')
">
                <SelectParameters>
                    <asp:Parameter DefaultValue="01" Name="?" />
                    <asp:ControlParameter ControlID="LRegpat" DefaultValue="0000000000" Name="?" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAdeudo0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
SET @SUBDEL=?
SET @REGPAT=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
--and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
exec('
SELECT 
''CUOTAS COP'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''02''
and len(PERIODO) not in (''7'')
union all
SELECT 
''MULTAS COP'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''80''
and len(PERIODO) not in (''7'')
union all
SELECT 
''SIVEPAS COP'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''03''
and len(PERIODO) not in (''7'')
union all
SELECT 
''MULTAS SIV. COP y RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''82''
and len(PERIODO) not in (''7'')
union all
SELECT 
''CUOTAS RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALERCV+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''06''
and len(PERIODO) not in (''7'')
union all
SELECT 
''MULTAS RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALECOP+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''81''
and len(PERIODO) not in (''7'')
union all
SELECT 
''SIVEPAS RCV'' as TIPO
,count(distinct(PERIODO)) as PERIODOS
,(case when SUM(IMPORTE) is null then 0 else SUM(IMPORTE) end) as IMPORTE
FROM [rale].[dbo].['+@RALERCV+']
where replace(REGPATR,''-'','''')='''+@REGPAT+''' and TD =''03''
and len(PERIODO) not in (''7'')
')
">
                <SelectParameters>
                    <asp:Parameter DefaultValue="33" Name="?" />
                    <asp:ControlParameter ControlID="LRegpat" DefaultValue="0000000000" Name="?" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;</asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendAdeudo" 
            CollapseControlID="PanelHeadAdeudo" ExpandControlID="PanelHeadAdeudo" 
            SuppressPostBack="True" ImageControlID="ImageDesplegableAdeudo" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
        </asp:CollapsiblePanelExtender>

<asp:Panel ID="PanelHeadHistPago" runat="server" BorderColor="#293955" 
            BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">       
                        <asp:Image ID="ImageDesplegableHistPago" runat="server" AlternateText="Ocultar" 
                            ImageAlign="AbsMiddle" ImageUrl="~/imagenes/expand_blue.jpg" Width="20px" />
            <asp:Label ID="Label24" runat="server" Text="HISTORIAL DE PAGO" Font-Bold="True" Font-Size="14pt"></asp:Label>
        </asp:Panel>   
        <center >
<asp:Panel ID="PanelContendHistPago" runat="server"  CssClass="img-polaroid">
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSourceHistPago0" 
                Height="500px" Width="1200px">
                <Series>
                    <asp:Series ChartArea="ChartArea1" CustomProperties="DrawingStyle=Cylinder" 
                        Legend="Legend1" Name="EMISION" ToolTip="#VAL{C} EMISION" 
                        XValueMember="PERIODO" YValueMembers="EMISION">
                        <EmptyPointStyle Label="0" />
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" CustomProperties="DrawingStyle=Cylinder" 
                        Legend="Legend1" Name="PAGO" ToolTip="#VAL{C} PAGO" XValueMember="PERIODO" 
                        YValueMembers="PAGO">
                        <EmptyPointStyle Label="0" />
                    </asp:Series>
                    <asp:Series BorderWidth="4" ChartArea="ChartArea1" ChartType="StepLine" 
                        Color="192, 0, 0" CustomProperties="IsXAxisQuantitative=False" Legend="Legend1" 
                        Name="COTIZANTES" ToolTip="#VAL COTIZANTES" XAxisType="Secondary" 
                        XValueMember="TIPO_PAGO" YAxisType="Secondary" YValueMembers="COTIZANTES">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY>
                            <MajorGrid LineColor="Gray" LineDashStyle="Dot" />
                        </AxisY>
                        <AxisX IntervalAutoMode="VariableCount" IsLabelAutoFit="False" 
                            LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, LabelsAngleStep90, WordWrap">
                            <MajorGrid LineColor="DarkGray" LineDashStyle="Dot" />
                            <LabelStyle Angle="-90" />
                        </AxisX>
                        <AxisX2 IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                            <MajorGrid LineColor="ActiveCaption" LineDashStyle="Dot" />
                            <MinorGrid LineColor="Maroon" />
                            <LabelStyle Angle="-90" />
                        </AxisX2>
                        <AxisY2>
                            <MajorGrid LineColor="Maroon" LineDashStyle="Dot" />
                        </AxisY2>
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Alignment="Center" Name="Legend1">
                        <CellColumns>
                            <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                            <asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2">
                                <Margins Left="15" Right="15" />
                            </asp:LegendCellColumn>
                        </CellColumns>
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Name="Title1" 
                        Text="HISTORIAL DE PAGO(S), DE LA(S) ULTIMAS 12 EMISIONES">
                    </asp:Title>
                </Titles>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSourceHistPago0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @DEL as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPATRONAL as VARCHAR(50)
DECLARE @TIPO_PAGO as VARCHAR(15)
DECLARE @FECHA as DATETIME
DECLARE @CAD1 as VARCHAR(255)
DECLARE @CAD2 as VARCHAR(255)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @MESES as int
DECLARE @CONSULTA as VARCHAR(8000)
SET @CAD1=' as PERIODO,(case when [tipodepago] is null then ''SIN PAGO'' else [tipodepago] end) as TIPO_PAGO,EMIP_NUM_TRAB_COT as COTIZANTES,emision as EMISION,(case when pagos is null then 0 else pagos end) as PAGO,fecha as FECHA_PAGO FROM [sireca].[dbo].['
SET @CAD2='] WHERE substring([EMIP_PATRON],2,10)='
SET @FECHA=dateadd(month,0,getdate())
SET @CONSULTA=''
SET @MES=''
SET @ANIO=''
SET @DEL=?
SET @SUBDEL=?
SET @MESES=-12
SET @REGPATRONAL=?

WHILE (@MESES&lt;0)
BEGIN
	SET @MES=(case when len(month(dateadd(month,@MESES,@FECHA)))=1 then '0'+convert(varchar,month(dateadd(month,@MESES,@FECHA))) else convert(varchar,month(dateadd(month,@MESES,@FECHA))) end)
	SET @ANIO=convert(varchar,year(dateadd(month,@MESES,@FECHA)))
	SET @MESES=@MESES+1
	SET @TIPO_PAGO='EMMA'+@DEL+@SUBDEL+@MES+substring(@ANIO,3,2)

	IF EXISTS(SELECT * FROM sireca.dbo.sysobjects WHERE NAME = @TIPO_PAGO) 
	BEGIN
		SET @CONSULTA=@CONSULTA+'SELECT '''+@MES+'/'+@ANIO+''''+@CAD1+@TIPO_PAGO+@CAD2+''''+@REGPATRONAL+''''
		SET @CONSULTA=@CONSULTA+' union all '
	END
END
SET @CONSULTA = SUBSTRING(@CONSULTA,1,LEN(@CONSULTA)-10)
EXEC(@CONSULTA)
">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="SIRECAdel" DefaultValue="33" />
                    <asp:ControlParameter ControlID="LSUBDEL" DefaultValue="01" Name="?" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="LRegpat" DefaultValue="0000000000" Name="?" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendHistPago" 
            CollapseControlID="PanelHeadHistPago" ExpandControlID="PanelHeadHistPago" 
            SuppressPostBack="True" ImageControlID="ImageDesplegableHistPago" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
        </asp:CollapsiblePanelExtender>
    </center>     
    <hr />
    </div>
        </asp:Content>

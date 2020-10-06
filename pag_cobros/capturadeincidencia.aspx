<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="capturadeincidencia.aspx.vb" Inherits="WebSIRECA.capturadeincidencia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CAPTURA</title>
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />    
    <style type="text/css">
        .style3
        {
            height: 21px;
        }  
        .style8
        {
            height: 22px;
        }
        .style10
        {
        }
        .style11
        {
            width: 962px;
        }
        .style12
        {
            width: 96px;
        }
        .style13
        {
            width: 223px;
        }
        .style14
        {
            width: 489px;
        }
        .style15
        {
            height: 22px;
            width: 96px;
        }
        .style16
        {
            width: 154px;
            height: 22px;
        }
        .style17
        {
            width: 1188px;
        }
        .style18
        {
            width: 4px;
        }
        .style19
        {
            width: 222px;
        }
    </style>
</head>
<body bgcolor="#293955">
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>
        <table border="0" align="center" cellpadding="0" cellspacing="0" 
            class="style17">
            <tr>
                <td class="style10" bgcolor="White" align="left" colspan="2">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Left" 
                        ImageUrl="~/imagenes/sitios/imss_principal.jpg" />
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Right" 
                        ImageUrl="~/imagenes/sitios/sireca.png" />
                    <asp:Menu ID="MenuHerramientas" runat="server" BackColor="#FFFBD6" 
                        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
                        ForeColor="#990000" StaticSubMenuIndent="10px">
                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#FFFBD6" />
                        <DynamicSelectedStyle BackColor="#FFCC66" />
                        <Items>
                            <asp:MenuItem ImageUrl="~/imagenes/usuarios/avatar/usuarioSireca.jpg">
                                <asp:MenuItem Text="CERRAR SESION" Value="CERRAR SESION"></asp:MenuItem>
                                <asp:MenuItem Text="CICLO">
                                    <asp:MenuItem Text="CICLO 1" Value="CICLO 1" 
                                        NavigateUrl="~/pag_asps/inicio.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="CICLO 2" Value="CICLO 2">
                                        <asp:MenuItem NavigateUrl="~/informesPDF/cobros/inspector/Default.aspx?tipo=IB" 
                                            Text="REPORTE DILIGENCIAS" Value="REPORTE DILIGENCIAS"></asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/informesPDF/cobros/inspector/reporteasignacionpae.aspx?tipo=IB" 
                                            Text="REPORTE ASIGNACION" Value="REPORTE ASIGNACION"></asp:MenuItem>
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/pag_cobros/generalresumen.aspx" 
                                    Text="RESUMEN DE PENDIENTES" Value="RESUMEN DE PENDIENTES"></asp:MenuItem>
                            </asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#FFCC66" />
                    </asp:Menu>
                    </td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style19" bgcolor="#D4D0C8" align="left" rowspan="2">
                    <asp:HyperLink ID="HLCore" runat="server" rel="gb_page_fs[]" title="Detalles ECOS PENDIENTES" 
                        NavigateUrl="~/pag_cobros/ecos.aspx" Target="_blank" Font-Bold="True" Font-Italic="False" 
                        Font-Underline="False" ForeColor="White" Width="210px" 
                        CssClass="accordionHeader">1.-PENDIENTES PARA LA 31</asp:HyperLink><br />
                    <asp:HyperLink ID="HLCitatorio" runat="server" rel="gb_page_fs[]" title="Detalles CITATORIOS PENDIENTES" 
                        NavigateUrl="~/pag_cobros/citatorios.aspx" Target="_blank" Font-Bold="True" 
                        Font-Italic="False" Font-Underline="False" ForeColor="White" Width="210px" CssClass="accordionHeader">2.-CITATORIO(S)</asp:HyperLink><br />
                    <asp:HyperLink ID="HLPae" rel="gb_page_fs[]" title="Detalles PENDIENTES PARA EL P.A.E.(Procedimiento Administrativo de Ejecución)" runat="server" 
                        Target="_blank" NavigateUrl="~/pag_cobros/pae.aspx" Font-Bold="True" Font-Italic="False" 
                        Font-Underline="False" ForeColor="White" Width="210px" CssClass="accordionHeader">3.-PENDIENTES PARA EL P.A.E.</asp:HyperLink><br />
                <asp:LinkButton ID="LinkButtonCargar" runat="server" CssClass="accordionHeader" Font-Strikeout="False" 
                        Width="210" Font-Bold="True" ForeColor="White">&nbsp;CARGAR DATOS&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" 
                                    ImageUrl="~/imagenes/sitios/lista.png" ImageAlign="AbsMiddle" />
                            </asp:LinkButton>                              
                    <asp:Panel ID="Panel1" runat="server" Height="420px">                    
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="5" 
                        AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate >
                        CARGANDO...</ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate >
                    
                    <asp:DropDownList ID="DDLSubdel" runat="server" Width="210px">
                        </asp:DropDownList><br />
                        <asp:DropDownList ID="DDLTipo" runat="server" Width="210px" 
                        AutoPostBack="True">
                            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                            <asp:ListItem Value="%">TODOS</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="TBRegpat" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                            MaxLength="30" Width="180px"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="TBE1" runat="server" TargetControlID="TBRegpat" WatermarkCssClass="watermarked" WatermarkText="REG./RAZON SOCIAL/CREDITO">
                        </asp:TextBoxWatermarkExtender> 
                        <asp:ImageButton ID="ImageButton3" runat="server" 
                            ImageUrl="~/imagenes/sitios/buscar.png" Height="20px" 
                            ImageAlign="AbsBottom" />
                        <br />
                            <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" 
            TargetControlID="PanelRegpatContend" 
            CollapseControlID="PanelRegpatHeader" ExpandControlID="PanelRegpatHeader" 
            SuppressPostBack="True" ExpandDirection="Horizontal" ></asp:CollapsiblePanelExtender>
                        
                        <asp:Panel ID="PanelRegpatHeader" runat="server" CssClass="accordionHeader" 
                            Width="210px">
                            PATRONES
                            <asp:Label ID="LPatrones" runat="server"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="PanelRegpatContend" runat="server" BackColor="#D4D0C8" 
                            BorderStyle="None" BorderWidth="1px" Height="150px" ScrollBars="Auto" 
                            Width="210px">
                            
                            <asp:RadioButtonList ID="RadioButtonListRegPat" runat="server" 
                                DataSourceID="SqlDataSourceRegPat" DataTextField="texto" 
                                DataValueField="valor" Font-Size="9">
                            </asp:RadioButtonList>                            
                            <asp:SqlDataSource ID="SqlDataSourceRegPat" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(5)
DECLARE @TIPO as VARCHAR(3)
DECLARE @BUSCAR as VARCHAR(50)
SET @SUBDEL=?
SET @TIPO=?
SET @INSPECTOR=?
SET @BUSCAR=?
SELECT 
distinct [CP_REGPAT] as valor
,[CP_REGPAT] as texto
,razonSocial
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join [sirecacobros].[dbo].[CO_RALE] on CP_REGPAT=RA_REGPATR
left join sireca.dbo.patrones on regpat=cp_regpat
WHERE RA_SUBDEL=@SUBDEL
and [CP_INSPEC] like @INSPECTOR
and RA_TIPO like @TIPO
and (CP_REGPAT like @BUSCAR+'%' or razonSocial like '%'+@BUSCAR+'%' or RA_NUMCRED like @BUSCAR or RA_PERIODO like @BUSCAR+'%')
">
                                <selectparameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="00" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAid" />
                                    <asp:ControlParameter ControlID="TBRegpat" DefaultValue="REGPATRAZON" Name="?" 
                                        PropertyName="Text" />
                                </selectparameters>
                            </asp:SqlDataSource>
                        </asp:Panel>                        
                </ContentTemplate>
                </asp:UpdatePanel>
                </asp:Panel>    
                <br />

                    </td>
                <td class="style11">
                    <table border="0" cellpadding="0" cellspacing="0" class="style11">
                        <tr>
                            <td class="style3" colspan="5">
                                <asp:Panel ID="PanelMsg" runat="server" BackColor="#F9D571" 
                                    BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" Width="960px">
                                &nbsp;&nbsp;<asp:Label ID="LMensaje" runat="server" ForeColor="#000099" 
                                        Text="AREA DE CAPTURA DE LOS PERIODOS Y CREDITOS DEL RESULTADO DE LA BUSQUEDA." 
                                        Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;<asp:HyperLink ID="HLPrintDili" runat="server" 
                                        NavigateUrl="~/informesPDF/cobros/inspector/Default.aspx?tipo=IB" 
                                        Target="_blank"><i class="icon-print"></i>&nbsp;Diligencia</asp:HyperLink>
                                    &nbsp;&nbsp;<asp:HyperLink ID="HLPrintAsig" runat="server" 
                                        NavigateUrl="~/informesPDF/cobros/inspector/reporteasignacionpae.aspx?tipo=IB" 
                                        Target="_blank"><i class="icon-print"></i>&nbsp;Asignación</asp:HyperLink>
                                    &nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server"><i class="icon-off"></i>&nbsp;SALIR</asp:LinkButton>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#6B99E3" class="style12">
                                &nbsp;<asp:Label ID="Label6" runat="server" Text="DOC.CAPTURA:" Font-Bold="True" 
                                    ForeColor="White" Font-Size="10pt"></asp:Label>
                            </td>
                            <td bgcolor="#6B99E3" class="style13">
                                <asp:DropDownList ID="DDLDocEntreg" runat="server" BackColor="#BCC7D8" 
                                    DataSourceID="SqlDataSourceDocEntreg" DataTextField="texto" 
                                    DataValueField="valor" Font-Size="9pt" Width="210px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceDocEntreg" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_tipo] AS valor
      ,[desc_tipo] AS texto
  FROM [sirecacobros].[dbo].[cae_tipodoc]
WHERE visibleInspectorb='1'
ORDER BY [desc_tipo]"></asp:SqlDataSource>
                            </td>
                            <td bgcolor="#6B99E3" class="style14">
                                <asp:Panel ID="PanelPago" runat="server" BackColor="#81D65A" 
                                    BorderColor="#006600" BorderStyle="None" BorderWidth="1px">&nbsp;
                                    <asp:Label ID="Label1" runat="server" Text="IMPORTE $" Font-Bold="True" 
                                        ForeColor="#006600" Font-Size="10pt"></asp:Label>
                                    <asp:TextBox ID="TBPago" runat="server" BackColor="#81D65A" 
                                        BorderColor="#006600" BorderStyle="None" BorderWidth="1px" MaxLength="10" 
                                        Width="80px">0.00</asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Escriba la cantidad con dos decimales <br/>Ejemplo: <br/>250 escribir 250.00" 
                                        ControlToValidate="TBPago" ValidationExpression="\d{1,10}.\d{2}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RegularExpressionValidator1"></asp:ValidatorCalloutExtender>
                                    <asp:Label ID="Label2" runat="server" Text="RECIBO" Font-Bold="True" 
                                        ForeColor="#006600" Font-Size="10pt"></asp:Label>
                                    <asp:TextBox ID="TBResvProv" runat="server" BackColor="#81D65A" 
                                        BorderColor="#006600" BorderStyle="None" BorderWidth="1px" MaxLength="15" 
                                        Width="90px">000000000</asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="El RESIVO PROVICIONAL debe tener minimo 5 numeros." 
                                        ControlToValidate="TBResvProv" ValidationExpression="\d{5,9}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RegularExpressionValidator2"></asp:ValidatorCalloutExtender>
                                    <asp:Label ID="Label3" runat="server" Text="FECH.RECIBO" Font-Bold="True" 
                                        ForeColor="#006600" Font-Size="10pt"></asp:Label>
                                    <asp:TextBox ID="TBFechResvProv" runat="server" BackColor="#81D65A" 
                                        BorderColor="#006600" BorderStyle="None" BorderWidth="1px" MaxLength="10" 
                                        Width="80px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFechResvProv" Format="dd/MM/yyyy"></asp:CalendarExtender>  
                                </asp:Panel>
                                </td>
                            <td colspan="2" bgcolor="#81D65A">
                                    <asp:LinkButton ID="BLGuardarPago" runat="server" BackColor="#F0F0F0" 
                                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Width="100px">&nbsp;Guardar Pago</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#6B99E3" class="style15">
                                &nbsp;<asp:Label ID="Label4" runat="server" Text="DILIGENCIA:" Font-Bold="True" 
                                    ForeColor="White" Font-Size="10pt"></asp:Label>
                            </td>
                            <td bgcolor="#6B99E3" class="style8" colspan="3">
                                <asp:DropDownList ID="DDLDiligencia" runat="server" BackColor="#BCC7D8" 
                                    DataSourceID="SqlDataSourceDelig" DataTextField="texto" 
                                    DataValueField="valor" Font-Size="9pt" Width="210px">
                    </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceDelig" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    
                                    
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_diligencia] as valor
      ,[desc_diligencia] as texto
  FROM [sirecacobros].[dbo].[cae_diligencia]
WHERE visibleInspectorb='1'
order by [desc_diligencia]
"></asp:SqlDataSource>
                                &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="White" 
                                    Text="FECH.DILI./CITA.:" Font-Size="10pt"></asp:Label>
                    <asp:TextBox ID="TBFechDeligencia" runat="server" BorderStyle="None" BorderWidth="1px" 
                                    Width="80px" BackColor="#6B99E3"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TBFechDeligencia" Format="dd/MM/yyyy"></asp:CalendarExtender>  
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="White" 
                                    Text="HORA.CITATORIO:" Font-Size="10pt"></asp:Label>
                                <asp:DropDownList ID="DDLHoras" runat="server" BackColor="#BCC7D8" 
                                    Font-Size="9pt" Width="100px">
                                </asp:DropDownList>
                                <asp:LinkButton ID="LBCargarImg" runat="server" ToolTip="Carga de Fotos/Documentos" 
                                    Font-Bold="True" Font-Underline="False" ForeColor="#CC0000">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/sitios/foto_doc.png" Height="22" ImageAlign="AbsMiddle" /></asp:LinkButton>
                            </td>
                            <td bgcolor="#6B99E3" class="style16">
                                <asp:LinkButton ID="BLGuardarDeligencia" runat="server" BackColor="#F0F0F0" 
                                    BorderStyle="Solid" Font-Underline="False" Width="100px" BorderWidth="1px">&nbsp;Guardar Dilig.</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#6B99E3" class="style15">
                                &nbsp;<asp:Label ID="Label7" runat="server" Text="OBSERVACIÓN:" Font-Bold="True" 
                                    ForeColor="White" Font-Size="10pt"></asp:Label>
                            </td>
                            <td bgcolor="#6B99E3" class="style8" colspan="3">
                                <asp:DropDownList ID="DDLObservacion" runat="server" BackColor="#BCC7D8" 
                                    DataSourceID="SqlDataSourceObs" DataTextField="texto" 
                                    DataValueField="valor" Font-Size="8.5pt" Width="200px">
                    </asp:DropDownList>
                                <asp:TextBox ID="TBEmbargos" runat="server" MaxLength="7000" Width="300px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TBEmbargos" WatermarkCssClass="watermarked" WatermarkText="OBJETOS QUE EMBARGARON...">
                                </asp:TextBoxWatermarkExtender> 
                                <asp:SqlDataSource ID="SqlDataSourceObs" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_observacion] as valor
      ,[desc_observacion] as texto
  FROM [sirecacobros].[dbo].[cae_observacion]
WHERE [visibleInspector]='1'
ORDER BY [desc_observacion]"></asp:SqlDataSource>
                                </td>
                            <td bgcolor="#6B99E3" class="style16">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#ECECED" class="style11">
                    <asp:Panel ID="PanelResultados" runat="server" Height="460px" ScrollBars="Auto" 
                        Width="960px" Font-Bold="True">                    
                        <asp:LinkButton ID="LBSelec" runat="server" BackColor="#FAC149" 
                            Font-Underline="False">&nbsp;&nbsp;Marcar Todo&nbsp;&nbsp;</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="LBDeselec" runat="server" BackColor="#FAC149" 
                            Font-Underline="False">&nbsp;&nbsp;Desmarca Todo&nbsp;&nbsp;</asp:LinkButton>
                        <asp:GridView ID="GridViewResultados" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                            CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceResultados" 
                            Font-Size="10pt">
                            <Columns>
                                <asp:BoundField DataField="CLAVE" HeaderText="CLAVE" ReadOnly="True" 
                                    SortExpression="CLAVE">
                                <HeaderStyle Font-Size="1pt" />
                                <ItemStyle Font-Size="1pt" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUBDEL" HeaderText="SUB" ReadOnly="True" 
                                    SortExpression="SUBDEL" />
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                    SortExpression="TIPO" />
                                <asp:BoundField DataField="FECH_ASIGNACION" DataFormatString="{0:d}" 
                                    HeaderText="ASIGNA." ReadOnly="True" SortExpression="FECH_ASIGNACION" />
                                <asp:TemplateField HeaderText="REG.PAT." SortExpression="REG_PATRONAL">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# Eval("REG_PATRONAL", "../observacionPatronal/DefaultClear.aspx?regpat={0}&razon=razonsinheader") %>' 
                                            rel="gb_page_fs[]" Text='<%# Eval("REG_PATRONAL") %>' title="Detalles"></asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                    SortExpression="INCIDENCIA" />
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CREDITO(S)" HeaderText="CREDITO" ReadOnly="True" 
                                    SortExpression="CREDITO(S)" />
                                <asp:BoundField DataField="PERIODO(S)" HeaderText="PERIODO" ReadOnly="True" 
                                    SortExpression="PERIODO(S)" />
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
                                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                                    SortExpression="COTIZ" />
                                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                                    SortExpression="SECTOR" />
                                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                                    SortExpression="DOMICILIO" Visible="False" />
                                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                                    SortExpression="LOCALIDAD" Visible="False" />
                                <asp:BoundField DataField="CP" HeaderText="CP" ReadOnly="True" 
                                    SortExpression="CP" Visible="False" />
                                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" ReadOnly="True" 
                                    SortExpression="ACTIVIDAD" Visible="False" />
                                <asp:TemplateField HeaderText="HIST.DILI.">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <!-- -->
                                        <asp:HiddenField ID="HiddenFieldIdCred" runat="server" 
                                            Value='<%# Bind("CLAVE") %>' />
                                        <asp:GridView ID="GridViewHDeli" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" DataSourceID="SqlDataSourceHDili" Font-Size="8pt" 
                                            PageSize="2" ShowHeader="False">
                                            <Columns>
                                                <asp:BoundField DataField="DOC" HeaderText="TIPO_DOC." SortExpression="DOC" />
                                                <asp:BoundField DataField="HORAS" DataFormatString="hace {0} hr." 
                                                    HeaderText="HORAS" SortExpression="HORAS" />
                                                <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                                    SortExpression="DILIGENCIA" />
                                                <asp:BoundField DataField="AC_FECH_DILIGENCIA" DataFormatString="{0:d}" 
                                                    HeaderText="AC_FECH_DILIGENCIA" SortExpression="AC_FECH_DILIGENCIA" />
                                                <asp:BoundField DataField="AC_OBSERVACION" HeaderText="AC_OBSERVACION" 
                                                    SortExpression="AC_OBSERVACION" />
                                            </Columns>
                                            <PagerSettings Position="Top" />
                                            <PagerStyle HorizontalAlign="Left" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSourceHDili" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(case when [AC_DOC_ENTRGADO]=0 then '' else (SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) end) as DOC
,
(
(case when AC_HORA_CITATORIO='--:-- -.-.' then NULL else
datediff(hour,replace(cast(day(AC_FECH_DILIGENCIA) as varchar(2))+'/'+ cast(month(AC_FECH_DILIGENCIA) as varchar(2))+'/'+cast(year(AC_FECH_DILIGENCIA) as varchar(4)) + ' ' + AC_HORA_CITATORIO,'H.r.',''),getdate()) 
end)-((SELECT [sirecacobros].[dbo].[diasInabiles](AC_FECH_DILIGENCIA,getdate()))*24)
) as HORAS
,(case when [AC_DILIGENCIA]=0 then '' else (SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA]) end) as DILIGENCIA
      ,[AC_FECH_DILIGENCIA]
      ,(case when [AC_OBSERVACION]=0 then '' else (SELECT [desc_observacion] FROM [sirecacobros].[dbo].[cae_observacion] where [id_observacion]=[AC_OBSERVACION]) end ) as [AC_OBSERVACION]
  FROM [sirecacobros].[dbo].[CO_ACCIONES]
where ac_ra_id=?
order by [AC_FECH_DILIGENCIA] desc,[AC_FECH_SISTEM] desc">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="HiddenFieldIdCred" DefaultValue="000" Name="?" 
                                                    PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <!-- -->
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="vigencia" HeaderText="ULTIMA EMI." ReadOnly="True" 
                                    SortExpression="vigencia" />
                                <asp:BoundField DataField="SUPERVISOR" HeaderText="SUPERVISOR" ReadOnly="True" 
                                    SortExpression="SUPERVISOR" Visible="False" />
                                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                    SortExpression="INSPECTOR" Visible="False" />
                            </Columns>
                            <HeaderStyle BackColor="#D2D2D4" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceResultados" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 

                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(300)
DECLARE @GROUP_MOV as VARCHAR(300)
DECLARE @GROUP_TD as VARCHAR(300)
DECLARE @GROUP_INC as VARCHAR(300)
DECLARE @CONSULTA as VARCHAR(3000)
DECLARE @INSPECTOR as VARCHAR(50)
DECLARE @NUM_FILAS as VARCHAR(6)
DECLARE @REGPAT as VARCHAR(10)
SET @SUBDEL=?
SET @TIPO=?
SET @GROUP_MOV='TODOS'
SET @GROUP_TD='TODOS'
SET @GROUP_INC='''02'',''01'',''31'',''32'',''43'''
SET @INSPECTOR='TODOS'
SET @REGPAT=?
SET @NUM_FILAS='TODOS'

IF @NUM_FILAS='TODOS'
	SET @CONSULTA='SELECT '
ELSE
	SET @CONSULTA='SELECT TOP '+ @NUM_FILAS

SET @CONSULTA= @CONSULTA + '
 RA_ID as CLAVE
,[CP_SUBDEL] as SUBDEL
,RA_TIPO as TIPO
,[CP_ID_SUPER] as SUPERVISOR
,[CP_FECH_ASIG] as FECH_ASIGNACION
,[CP_INSPEC] as INSPECTOR
,[CP_REGPAT] as REG_PATRONAL
,ptn.razonSocial as RAZON_SOCIAL
,(SELECT ''(''+[mov_pat]+'')''+[descripcion] FROM [sireca].[dbo].[mov_rale] WHERE [mov_pat]= [RA_MOV]) as MOVIMIENTO
,(SELECT ''(''+[docto]+'')''+[descripcion] FROM [sireca].[dbo].[doc_rale] WHERE [docto]=[RA_TD]) as TIPO_DOC
,(SELECT ''(''+[inc]+'')''+[descripcion] FROM [sireca].[dbo].[inc_rale] WHERE [inc]=[RA_INC]) as INCIDENCIA
,[RA_NUMCRED] as [CREDITO(S)]
,(SUBSTRING([RA_PERIODO],4,7)) as [PERIODO(S)]
,[RA_IMPORTE] as IMPORTE
,ptn.cotiz as COTIZ
,ptn.sector as SECTOR
,ptn.dom as DOMICILIO
,(CASE WHEN LEN(ptn.loc)&lt;=10 THEN ptn.loc ELSE (substring(ptn.loc,0,len(ptn.loc)-6)) END ) as LOCALIDAD
,(CASE WHEN LEN(ptn.loc)&lt;=10 THEN '''' ELSE (substring(ptn.loc,len(ptn.loc)-6,len(ptn.loc))) END) as CP
,ptn.act as ACTIVIDAD
,datename(month,ptn.vigencia)+''/''+datename(year,ptn.vigencia) as vigencia
  FROM ([sirecacobros].[dbo].[CO_CPATRONAL] inner join 
(select RA_ID,RA_TIPO,[RA_REGPATR],[RA_MOV],[RA_TD],[RA_INC],[RA_NUMCRED],[RA_PERIODO],[RA_IMPORTE] from sirecacobros.dbo.co_rale where [RA_SUBDEL]='''+@SUBDEL+''' 
'
IF @GROUP_MOV&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_MOV] in ('+@GROUP_MOV+')' 
IF @GROUP_TD&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_TD] in ('+@GROUP_TD+') '
IF @GROUP_INC&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_INC] in ('+@GROUP_INC+') '
IF @TIPO&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + ' and [RA_TIPO] like '''+@TIPO+''' '

SET @CONSULTA = @CONSULTA +
' ) as ra
on ra.[RA_REGPATR]=[CP_REGPAT]) left join sireca.dbo.patrones as ptn on [CP_REGPAT]=ptn.regpat
WHERE CP_SUBDEL='''+@SUBDEL+''''
IF @INSPECTOR&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + ' and [CP_INSPEC]=' + @INSPECTOR
	
SET @CONSULTA = @CONSULTA + ' and [CP_REGPAT]=''' + @REGPAT +''''
SET @CONSULTA = @CONSULTA + ' order by ra.[RA_REGPATR],CONVERT(DATETIME,ra.[RA_PERIODO]) '
EXEC(@CONSULTA)
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="RadioButtonListRegPat" DefaultValue="0000000" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
</asp:Panel>
                </td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style19">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <asp:Panel ID="AnimatedModalPopupPanel" runat="server" BorderStyle="Solid" Height="20" Width="200" BackColor="#293955">
    <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Right">
            <asp:Button ID="CloseButton" runat="server" Text="Cerrar" BorderStyle="Solid" BorderWidth="1" />
            </asp:Panel>
    <!-- -->
        <asp:Panel ID="PanelHeadCarga" runat="server" HorizontalAlign="Center" 
            Height="60" BackColor="#6B99E3"><br />
            <asp:Label ID="Label9" runat="server" Text="FOTO(S) A CARGAR CON LA DILIGENCIA" Font-Bold="True" ForeColor="White"></asp:Label>
        </asp:Panel> 
        <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">
            <br />
        <asp:Label ID="Label10" runat="server" Text="FOTO(1)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label11" runat="server" Text="FOTO(2)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload2" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label12" runat="server" Text="FOTO(3)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload3" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label13" runat="server" Text="FOTO(4)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload4" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label14" runat="server" Text="FOTO(5)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload5" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label15" runat="server" Text="FOTO(6)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload6" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label16" runat="server" Text="FOTO(7)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload7" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        <asp:Label ID="Label17" runat="server" Text="FOTO(8)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload8" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        </asp:Panel>
    <!-- -->
    </asp:Panel> 
    <asp:ModalPopupExtender ID="OpenButton_AnimatedModalPopupExtender1" runat="server"
            CancelControlID="CloseButton" Enabled="True" PopupControlID="AnimatedModalPopupPanel"
            TargetControlID="LBCargarImg">
            <Animations>
                    <OnShowing>
                        <Sequence>
                            <StyleAction AnimationTarget="CloseButton" Attribute="display" Value="none" />
                            <Resize Duration="0" Height="70px" Width="100px" />
                        </Sequence>
                    </OnShowing>
                    <OnShown>
                        <Sequence>
                            <Parallel>
                                <FadeIn />
                                <Scale ScaleFactor="5" Center="True" />
                            </Parallel>
                            <StyleAction AnimationTarget="CloseButton" Attribute="display" Value="" />
                        </Sequence>
                    </OnShown>    
                    <OnHiding>
                        <Sequence>                            
                            <StyleAction AnimationTarget="CloseButton" Attribute="display" Value="none" />
                            <Parallel>
                                <FadeOut />
                                <Scale ScaleFactor="5" Center="True" />
                            </Parallel>
                        </Sequence>
                    </OnHiding>            
            </Animations>
        </asp:ModalPopupExtender>
    </form>
</body>
</html>

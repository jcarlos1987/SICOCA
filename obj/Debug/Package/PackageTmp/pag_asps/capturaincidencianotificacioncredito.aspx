<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="capturaincidencianotificacioncredito.aspx.vb" Inherits="WebSIRECA.capturaincidencianotificacioncredito" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DILIGENCIA</title>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />    
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style4
        {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server">
                    </asp:ScriptManager>
    <div>
        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0" >
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
                    <asp:Panel ID="Panel3" runat="server" BackColor="#99CB99" Height="300px" 
                        Width="600px">
                        <asp:RoundedCornersExtender ID="Panel3_RoundedCornersExtender" runat="server" 
                            TargetControlID="Panel3" Radius="20" Corners="Right">
                        </asp:RoundedCornersExtender>
                        <table style="width:100%;">
                        <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#2C7320" 
                                        Text="Fecha de la Diligencia:"></asp:Label>
                                    <asp:TextBox ID="TBFechDili" runat="server" BorderStyle="None" 
                                        BorderWidth="1px" MaxLength="10" Width="80px" BackColor="#99CB99" 
                                        Font-Underline="False"></asp:TextBox>
                                    <asp:CalendarExtender ID="caext1" runat="server" Format="dd/MM/yyyy" 
                                        TargetControlID="TBFechDili">
                                    </asp:CalendarExtender>
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="LBCargarImg" runat="server" Font-Bold="True" 
                                        Font-Underline="False" ForeColor="#CC0000" ToolTip="Carga de Fotos/Documentos">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/sitios/foto_doc.png" 
                                        Height="22" ImageAlign="AbsMiddle" /></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink1" rel="gb_page_fs[]" title="Archivo(s)" runat="server" NavigateUrl="~/pag_cobros/galeriaarchivoscargados.aspx">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/menuFotos.png" BorderStyle="None" ImageAlign="AbsBottom" />
                    </asp:HyperLink>
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                        AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="5">
                                        <ProgressTemplate>
                                            <asp:Panel ID="Panel2" runat="server" BackColor="#E6A42B" 
                                                HorizontalAlign="Center">
                                                CARGANDO...
                                            </asp:Panel>
                                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            
                                <table style="width:100%;">
                                    <tr>
                                        <td colspan="2">
                                            &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#2C7320" 
                                                Text="Diligencia:"></asp:Label>
                                            <asp:DropDownList ID="DDLDiligencia" runat="server" AutoPostBack="True" 
                                                DataSourceID="SqlDataSourceCatalogo" DataTextField="actividad" 
                                                DataValueField="clave" Font-Size="8pt" Width="230px">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceCatalogo" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as clave
      ,[ACTIVIDAD] as actividad
  FROM [sireca].[dbo].[catalogo]
WHERE [grupoInspector]='1'
ORDER BY actividad"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        <asp:Panel ID="PanelHora" runat="server" Visible="False">
                                            &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="10pt" 
                                                ForeColor="#009900" Text="Hora de Citatorio  H:MM: "></asp:Label>
                                            <asp:DropDownList ID="DDLHora" runat="server" ToolTip="Hora">
                                                <asp:ListItem>00</asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DDLMinuto" runat="server" ToolTip="Minuto">
                                                <asp:ListItem>00</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>35</asp:ListItem>
                                                <asp:ListItem>40</asp:ListItem>
                                                <asp:ListItem>45</asp:ListItem>
                                                <asp:ListItem>50</asp:ListItem>
                                                <asp:ListItem>55</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DDLAP" runat="server">
                                                <asp:ListItem Value="pm">pm</asp:ListItem>
                                                <asp:ListItem>am</asp:ListItem>
                                            </asp:DropDownList>
                                            </asp:Panel> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="LMsg" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                                    </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="Panel1" runat="server" GroupingText="Observacón">
                                        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" BorderWidth="1px" 
                                            Height="100%" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;</td>
                                <td class="style4" align="right">
                                    <asp:LinkButton ID="LBGuardar" runat="server" BackColor="#2D3E5B" 
                                        Font-Underline="False" ForeColor="White">&nbsp;&nbsp;GUARDAR&nbsp;&nbsp;</asp:LinkButton>
                                </td>
                                <td class="style4">
                                    </td>
                            </tr>
                        </table>
                        </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
                <td>
    <asp:Panel ID="Panel5" runat="server" BackColor="#D8D8D8" >
                        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
                            TargetControlID="Panel5" Radius="20" Corners="Left">
                        </asp:RoundedCornersExtender>
                        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource1" Width="100%" EmptyDataText="ACCESO DENEGADO, LA DILIGENCIA NO SE GUARDARA" 
                            GridLines="None">
            <AlternatingRowStyle BackColor="#BCC7D8" />
            <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC0000" />
            <Fields>
                <asp:BoundField DataField="SUBDEL" HeaderText="&nbsp;&nbsp;SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;REG.PATRONAL" SortExpression="REGPAT">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("REGPAT", "../observacionPatronal/Default.aspx?regpat={0}") %>' 
                            Target="_blank" Text='<%# Eval("REGPAT") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON" HeaderText="&nbsp;&nbsp;RAZON" ReadOnly="True" 
                    SortExpression="RAZON" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="DOMICILIO" HeaderText="&nbsp;&nbsp;DOMICILIO" 
                    SortExpression="DOMICILIO">
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="&nbsp;&nbsp;CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO" HeaderText="&nbsp;&nbsp;TIPO" ReadOnly="True" 
                    SortExpression="TIPO" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="&nbsp;&nbsp;PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="&nbsp;&nbsp;COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="&nbsp;&nbsp;IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="&nbsp;&nbsp;DILIGENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="SECTOR" HeaderText="&nbsp;&nbsp;SECTOR">
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;Hist.DILI." SortExpression="IDECO">
                    <ItemTemplate>                        
                        <asp:HiddenField ID="HiddenField1" runat="server" Value ='<%# Eval("IDECO") %>' />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" ShowHeader="False" 
                            EmptyDataText="SIN HISTORIAL" Width="100%" Font-Size="8pt">
                            <Columns>
                                <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="fecha" 
                                    SortExpression="fecha" />
                                <asp:BoundField DataField="incidencia" HeaderText="incidencia" 
                                    SortExpression="incidencia" />
                                <asp:BoundField DataField="observaciones" HeaderText="observaciones" 
                                    SortExpression="observaciones" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT fecha
,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=incidencia) as incidencia
,observaciones
FROM sireca.dbo.HistorialInc 
WHERE idEco=?
order by id desc">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="0" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>                    
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:BoundField DataField="PERIODOV">
                <ItemStyle Font-Size="1pt" ForeColor="White" />
                </asp:BoundField>
            </Fields>
            <HeaderStyle Font-Bold="True" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
 eco.[subdel] as SUBDEL
,[REG#PATRONAL] as REGPAT
,[NOMBRE O RAZON SOCIAL] AS RAZON
,[CREDITO]
,[tipoECO] as TIPO
,
(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,fechaeco AS PERIODOV
,eco.[COTIZ] as COTIZANTES
,[OMISION] as IMPORTE
,[incidencia] as INCIDENCIA
,eco.id as IDECO
,RESPONSABLE
,ptn.dom as DOMICILIO
,eco.sector as SECTOR
FROM [sireca].[dbo].[eco] as eco LEFT JOIN sireca.dbo.patrones as ptn on substring(REG#PATRONAL,1,10)=ptn.regpat
where tipoeco in ('COP','COMP','RCV','RCVCOMP')
and eco.id =? and responsable=?
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="regpatid" />
                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </asp:Panel> 
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

    </div>
    <asp:Panel ID="AnimatedModalPopupPanel" runat="server" BorderStyle="Solid" 
        Height="20" Width="200" BackColor="#224422">
    <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Right">         
            <asp:Button ID="CloseButton" runat="server" Text="Cerrar" BorderStyle="Solid" BorderWidth="1" />
            </asp:Panel>
    <!-- -->
        <asp:Panel ID="PanelHeadCarga" runat="server" HorizontalAlign="Center" 
            Height="60" BackColor="#4E9C4E"><br />
            <asp:Label ID="Label9" runat="server" Text="FOTO(S)/DOC. A CARGAR DE LA DILIGENCIA" Font-Bold="True" ForeColor="White"></asp:Label>
        </asp:Panel> 
        <asp:Panel ID="Panel22" runat="server" HorizontalAlign="Center">
            <br />
        <asp:Label ID="Label10" runat="server" Text="FOTO/DOC.(1)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label11" runat="server" Text="FOTO/DOC.(2)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload2" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label12" runat="server" Text="FOTO/DOC.(3)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload3" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label13" runat="server" Text="FOTO/DOC.(4)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload4" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label14" runat="server" Text="FOTO/DOC.(5)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload5" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label15" runat="server" Text="FOTO/DOC.(6)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload6" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label16" runat="server" Text="FOTO/DOC.(7)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload7" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
                ForeColor="White" /><br />
        <asp:Label ID="Label17" runat="server" Text="FOTO/DOC.(8)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload8" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#224422" BorderColor="#224422" 
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

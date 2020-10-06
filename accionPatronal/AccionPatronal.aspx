<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AccionPatronal.aspx.vb" Inherits="WebSIRECA.AccionPatronal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accion Patronal</title>
    <script type="text/javascript" src="../jscalendar-1.0/calendar.js"></script>
    <script type="text/javascript" src="../jscalendar-1.0/calendar-setup.js"></script>
    <script type="text/javascript" src="../jscalendar-1.0/lang/calendar-es.js"></script>
    <style type="text/css"> @import url("../jscalendar-1.0/calendar-win2k-cold-2.css"); </style>

    <style type="text/css">
        .style1
        {
            width: 286px;
        }
        .style2
        {
            width: 312px;
        }
        .style3
        {
            height: 23px;
        }
        .style4
        {
            height: 23px;
            width: 121px;
        }
        .style7
        {
            width: 121px;
        }
        .style10
        {
            height: 23px;
            width: 175px;
        }
        .style11
        {
            width: 175px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="style1" align="right">
                <asp:Label ID="Label1" runat="server" Text="Rales:"></asp:Label>
                </td>
                <td class="style2">
                <asp:DropDownList
                        ID="DDLRCOP" runat="server" DataSourceID="SqlDataSourceRCOP" 
                        DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRCOP" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 1 [name]
FROM [rale].[dbo].[tablas]
where subdel =? and tipo='COP'
order by convert(datetime,fecha,103) desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DDLRRCV" runat="server" DataSourceID="SqlDataSourceRRCV" 
                        DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRRCV" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 1 [name]
FROM [rale].[dbo].[tablas]
where subdel =? and tipo='RCV'
order by convert(datetime,fecha,103) desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Crear Rale COP y RCV" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    &nbsp;Subdelegación:</td>
                <td class="style2">
                    
                    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    &nbsp; Ingrese el registro patronal:</td>
                <td class="style2">
                <asp:TextBox ID="TBBuscador" runat="server" MaxLength="12" Width="218px"></asp:TextBox>
                </td>
                <td>
                <asp:Button ID="BBuscar" runat="server" Text="BUSCAR" />
    
                </td>
            </tr>
        </table>
    <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            PageSize="1" DataKeyNames="REGPAT" 
            EmptyDataText="No se encuentra en el RALE">
            <Columns>
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                    SortExpression="SECTOR" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" SortExpression="RAZON" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
rale.[sector] AS SECTOR
      ,[regpatr] AS REGPAT
      ,[razonSocial] AS RAZON
      ,[cotiz] as COTIZANTES     
  FROM [sirecacobros].[dbo].[ralecoprcvtemp] as rale left join [sireca].[dbo].[patrones] as ptn
  on replace(REGPATR,'-','') = regpat
  where replace([REGPATR],'-','') like replace(?,'-','')+'%' and inc in ('31','32','43')
group by REGPATR,rale.sector ,razonSocial ,cotiz">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBBuscador" DefaultValue="000000000000000" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:Panel ID="PanelAcciones" runat="server">
            <table style="width:100%;">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            Caption="DATOS GENERALES" DataSourceID="SqlDataSource2" BackColor="White" 
                            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                    SortExpression="SUBDEL" />
                                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                                    SortExpression="SECTOR" />
                                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" 
                                    SortExpression="REGPAT" />
                                <asp:BoundField DataField="RFC" HeaderText="RFC" SortExpression="RFC" />
                                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" 
                                    SortExpression="DOMICILIO" />
                                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                                    SortExpression="LOCALIDAD" />
                                <asp:BoundField DataField="CP" HeaderText="CP" ReadOnly="True" 
                                    SortExpression="CP" />
                                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" 
                                    SortExpression="ACTIVIDAD" />
                                <asp:BoundField DataField="RAZON" HeaderText="RAZON" SortExpression="RAZON" />
                                <asp:BoundField DataField="LAT" HeaderText="LAT" SortExpression="LAT" />
                                <asp:BoundField DataField="LNG" HeaderText="LNG" SortExpression="LNG" />
                                <asp:BoundField DataField="COTIZANTE" HeaderText="COTIZANTE" 
                                    SortExpression="COTIZANTE" />
                                <asp:BoundField DataField="VIGENCIA" HeaderText="VIGENCIA" 
                                    SortExpression="VIGENCIA" />
                            </Fields>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [subdel] AS SUBDEL
      ,[sector] AS SECTOR
      ,[regpat] AS REGPAT
      ,[rfc] AS RFC
      ,[dom] AS DOMICILIO
	  ,case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end as LOCALIDAD
	  ,case when len(loc)=40 then substring(loc,len(loc)-5,6) else '' end as CP
      ,[act] AS ACTIVIDAD
      ,[razonSocial] AS RAZON 
      ,[lat] AS LAT
      ,[lng] AS LNG
      ,[cotiz] AS COTIZANTE
      ,[vigencia] AS VIGENCIA
  FROM [sireca].[dbo].[patrones]
  WHERE regpat=replace(?,'-','')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" DefaultValue="0000000" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Panel ID="PanelImpresion" runat="server" Visible="False">

                            <table style="width:100%;">
                                <tr>
                                    <td colspan="4" class="style3">
                                        </td>
                                </tr>
                                <tr>
                                <td bgcolor="#CCCCCC" class="style10">
                                        INCIDENCIAS</td>
                                    <td bgcolor="#F0F0F0" class="style4">
                                        <asp:TextBox ID="TBFecha" runat="server" MaxLength="10" Width="92px"></asp:TextBox>
                                        <asp:ImageButton ID="IBFecha" runat="server" ImageAlign="Middle" 
                                            ImageUrl="~/jscalendar-1.0/img.gif" />
                                        <script type="text/javascript">
                                            Calendar.setup({
                                                ifFormat: "%d/%m/%Y",
                                                inputField: "<%=TBFecha.ClientId%>",
                                                button: "<%=IBFecha.ClientId%>",
                                                align: "Br"
                                            });
          </script>
                                        </td>
                                    <td bgcolor="#F0F0F0" class="style3">
                                        TIPO DE IMPRESION<asp:DropDownList ID="DDLTipo" runat="server" 
                                            AutoPostBack="True">
                                            <asp:ListItem>COP</asp:ListItem>
                                            <asp:ListItem>RCV</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style3">
                                        </td>
                                </tr>
                                <tr>
                                <td bgcolor="#CCCCCC" rowspan="11" class="style11">
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
                                            DataSourceID="SqlDataSourceInc" DataTextField="INC" DataValueField="VALOR">
                                        </asp:CheckBoxList>
                                        <asp:SqlDataSource ID="SqlDataSourceInc" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                            
                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT CONVERT(VARCHAR,COUNT(*))+' '+tipo+', con INC:'+[INC] AS INC, INC  AS VALOR
FROM [sirecacobros].[dbo].[ralecoprcvtemp]
where REGPATR = ? AND INC in ('31','32','43','09','52')
and TIPO=?
GROUP BY tipo,INC
">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView1" DefaultValue="00000000" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="000" Name="?" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        <asp:HyperLink ID="HLMandamiento" runat="server" 
                                            NavigateUrl="~/accionPatronal/MandamientoCOPRCV.aspx" Target="_blank">IMPRIMIR</asp:HyperLink>
                                    </td>
                                    <td bgcolor="#F0F0F0">
                                        MANDAMIENTO</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        <asp:HyperLink ID="HLAmpliacion" runat="server" 
                                            NavigateUrl="~/accionPatronal/AmpliacionCOPRCV.aspx" Target="_blank">IMPRIMIR</asp:HyperLink>
                                    </td>
                                    <td bgcolor="#F0F0F0">
                                        AMPLIACION</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        <asp:HyperLink ID="HLRemocion" runat="server" 
                                            NavigateUrl="~/accionPatronal/RemocionCOPRCV.aspx" Target="_blank">IMPRIMIR</asp:HyperLink>
                                    </td>
                                    <td bgcolor="#F0F0F0">
                                        REMOCIÓN</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        <asp:HyperLink ID="HLCerrajero" runat="server" 
                                            NavigateUrl="~/accionPatronal/RemocionCOPRCV.aspx" Target="_blank">IMPRIMIR</asp:HyperLink>
                                    </td>
                                    <td bgcolor="#F0F0F0">
                                        CERRAJERO
                                        <asp:Label ID="Label2" runat="server" Text="(COP y RCV)" Font-Italic="True"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        <asp:HyperLink ID="HLCitatorio" runat="server" 
                                            NavigateUrl="~/accionPatronal/CitatorioCOPRCV.aspx" Target="_blank">IMPRIMIR</asp:HyperLink>
                                    </td>
                                    <td bgcolor="#F0F0F0">
                                        CITATORIO</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        <asp:HyperLink ID="HLObservacion" runat="server" 
                                            NavigateUrl="~/observacionPatronal/Default.aspx" 
                                            ToolTip="Agregar Observacion al patron">OBSERVACION</asp:HyperLink>
                                    </td>
                                    <td bgcolor="#F0F0F0">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        &nbsp;</td>
                                    <td bgcolor="#F0F0F0">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        &nbsp;</td>
                                    <td bgcolor="#F0F0F0">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        &nbsp;</td>
                                    <td bgcolor="#F0F0F0">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        &nbsp;</td>
                                    <td bgcolor="#F0F0F0">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F0F0F0" class="style7">
                                        &nbsp;</td>
                                    <td bgcolor="#F0F0F0">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>

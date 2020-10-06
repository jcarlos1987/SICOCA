<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteInspectorA.Master"  CodeBehind="sivepasasignados.aspx.vb" Inherits="WebSIRECA.sivepasasignados" %>

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
</asp:Content>
<asp:Content ID="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >

                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
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
                                                                        
                                                                        
                                                                        
                                                                        
                        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 15 convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103) as fecha
FROM [sirecasivepas].[dbo].[SV_BASE]
where [SV_SUBDEL]=?
and [SV_ASIG_INSPECTOR]=?
group by convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103)
order by convert(datetime,convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103),103) desc">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
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
                                                                        
                                                                        
                                                                        
                                                                        
                        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 15 convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103) as fecha
FROM [sirecasivepas].[dbo].[SV_BASE]
where [SV_SUBDEL]=?
and [SV_ASIG_INSPECTOR]=?
group by convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103)
order by convert(datetime,convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103),103)">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
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
                                                                    <asp:LinkButton ID="LBImpRep" runat="server" BackColor="#FFE8A6" 
                                                                        BorderColor="#43577B" BorderStyle="Solid" BorderWidth="1px" 
                                                                        Font-Strikeout="False">IMPRIMIR REPORTE</asp:LinkButton>
                            </asp:Panel>
                                                                <asp:GridView runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" 
        Caption="Patrones Seleccionados" CellPadding="1" CellSpacing="1" 
        EmptyDataText="0" DataSourceID="SqlDataSource2" BorderColor="Black" 
        BorderWidth="1px" BorderStyle="Solid" Font-Size="9pt" ForeColor="#333333" 
        ID="GridView2" HorizontalAlign="Center">
                                                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                                    <Columns>
                                                                        <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                                                            SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
                                                                        <asp:BoundField DataField="FECH_ASIG" HeaderText="FECH_ASIG" 
                                                                            SortExpression="FECH_ASIG" ReadOnly="True" DataFormatString="{0:d}">
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" 
                                                                            SortExpression="INSPECTOR" ReadOnly="True"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="REG.PATRONAL" SortExpression="REGPAT">
                                                                            <ItemTemplate>
                                                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                                NavigateUrl='<%# Eval("REGPAT", "../observacionPatronal/Default.aspx?regpat={0}&razon=razon") %>' 
                                                                Target="_blank" Text='<%# Eval("REGPAT") %>' 
                                                                ToolTip="Agregar Observacion al PATRON"></asp:HyperLink>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="RAZON SOCIAL" 
                                                                            SortExpression="RAZON_SOCIAL">
                                                                            <ItemTemplate>
                                                                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                                NavigateUrl='<%# "diligenciarsivepa.aspx?regpatid=" & Eval("[ID]") & "&regpat=" & Eval("[REGPAT]") %>' 
                                                                Target ="_blank"  Text='<%# Eval("RAZON_SOCIAL") %>' 
                                                                title="Ir a Zona de Captura"></asp:HyperLink>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>                                                                        
                                                                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                            SortExpression="TIPO" />
                                                                        <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" ReadOnly="True" 
                                                                            SortExpression="SIVEPA" />
                                                                        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                            SortExpression="PERIODO" >
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                                                                            SortExpression="CREDITO" >
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                                                            SortExpression="COTIZANTES" >
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="EMISION" HeaderText="EMISION" ReadOnly="True" 
                                                                            SortExpression="EMISION" DataFormatString="{0:C}" >
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
DECLARE @INSPECTOR AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @BUSCAR AS VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @BUSCAR=?

SELECT [SV_ID] as ID
,[SV_SUBDEL] as SUBDEL
,[SV_ASIG_INSPECTOR_FECHA] as FECH_ASIG
,SV_FECHA
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[SV_ASIG_INSPECTOR]) as INSPECTOR
,[SV_REG_PATRONAL] as REGPAT
,razonSocial as RAZON_SOCIAL
,(case when SV_TIPO='SIVEPA_OPORT' then 'OPORTUNO' WHEN SV_TIPO='SIVEPA_ANUAL' THEN 'ANUAL' else 'EXTEMPORANEO' end) as TIPO
,(case when SV_SIVEPA='SIVEPA-IMSS' then 'COP' else 'RCV' end ) as SIVEPA
,substring(convert(nvarchar(10),SV_PERIODO,103),4,7) as PERIODO
,SV_CREDITO as CREDITO
,SV_COTIZ as COTIZANTES
,SV_EMI_REAL as EMISION
,SV_RECAUDACION as RECAUDACION
,SV_DIFERENCIA as DIFERENCIA
FROM [sirecasivepas].[dbo].[SV_BASE] as cptn 
LEFT JOIN [sireca].[dbo].[patrones] as ptn on ptn.regpat=substring(cptn.[SV_REG_PATRONAL],1,10)
WHERE convert(varchar(10),[SV_ASIG_INSPECTOR_FECHA],103) between CONVERT(DATETIME,@FECH_INICIO,103) and CONVERT(DATETIME,@FECH_FIN,103) 
and [SV_ASIG_INSPECTOR]=@INSPECTOR 
and ([SV_REG_PATRONAL] like @BUSCAR)
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

</asp:Content>
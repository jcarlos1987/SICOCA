<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ecos.aspx.vb" Inherits="WebSIRECA.ecos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
                    <asp:DropDownList ID="DDLInspector" runat="server" Width="210px" 
                        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
                        DataValueField="valor">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USUARIO_TIPO as VARCHAR(3)
DECLARE @USUARIO_ID as VARCHAR(5)
DECLARE @SUBDEL as VARCHAR(2)
SET @USUARIO_TIPO=?
SET @USUARIO_ID=?
SET @SUBDEL=?

IF @USUARIO_TIPO='0'
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1')
	order by texto
end
else 
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1')
	and sire.id=@USUARIO_ID
	order by texto
end">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="999" Name="?" 
                                    SessionField="SIRECAuser_type" />
                                <asp:SessionParameter DefaultValue="999" Name="?" SessionField="SIRECAid" />
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                        <asp:DropDownList ID="DDLTipo" runat="server" Width="210px">
                            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                            <asp:ListItem Value="COPM">C.O.P.COPM.</asp:ListItem>
                            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                            <asp:ListItem>R.C.V.COMP.</asp:ListItem>
                            <asp:ListItem Value="%">TODOS</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLdias" runat="server">
                            <asp:ListItem Value="&gt;19">MAYOR A 19 DIAS</asp:ListItem>
                            <asp:ListItem Value="&lt;= 19 ">MENOR O IGUAL A 19 DIAS</asp:ListItem>
        </asp:DropDownList>
                        <asp:LinkButton ID="LBActualizar" runat="server" 
            BorderColor="#F0BC4D" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
            Font-Underline="False" ForeColor="#293955" BackColor="#FFF3CD">&nbsp;Actualizar&nbsp;</asp:LinkButton><asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="AbsBottom" 
                        onclientclick="javascript:window.print();" Height="32px" 
                        ImageUrl="~/imagenes/imprimir1.jpg" Width="32px" ToolTip="Imprimir datos del Patron" />
                        <hr />
        <!-- Resumen por periodo -->
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender11" runat="server" 
            TargetControlID="PanelResumenContend" 
            CollapseControlID="PanelResumenHeader" ExpandControlID="PanelResumenHeader" 
            SuppressPostBack="True" ></asp:CollapsiblePanelExtender>
        <asp:Panel ID="PanelResumenHeader" runat="server" CssClass="accordionHeader">RESUMEN GENERAL PARA EL CAMBIO A LA 31
        </asp:Panel>
        <asp:Panel ID="PanelResumenContend" runat="server">
            <asp:GridView ID="GridViewEco" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceEco" 
                Font-Size="10pt" HorizontalAlign="Center" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                        SortExpression="SUBDEL" />
                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" 
                        SortExpression="INSPECTOR" />
                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                    <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                        SortExpression="INCIDENCIA" />
                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                        HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                rel="gb_page_fs[]" Target="_blank" Text='<%# Eval("CREDITOS") %>' 
                                title="Detalles"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                        HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                        HeaderText="IMPORTE" SortExpression="IMPORTE">
                    <ItemStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DIAS_MAXIMO" DataFormatString="{0:N0}" 
                        HeaderText="DIAS_MAXIMO" ReadOnly="True" SortExpression="DIAS_MAXIMO">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle Font-Bold="True" ForeColor="#990000" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#D2D2D4" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceEco" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(8)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @DIAS as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO=?
SET @INSPECTOR=?
SET @DIAS=?
exec('
select 
subdel as SUBDEL
,tipoeco as TIPO
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) as INSPECTOR
,incidencia as INCIDENCIAV
,(select ''(''+[CVE DILIG#]+'')''+ACTIVIDAD from sireca.dbo.catalogo where [CVE DILIG#]=incidencia) as INCIDENCIA
,count(distinct(reg#patronal)) as PATRONES
,sum(cotiz) as COTIZANTES
,count(*) as CREDITOS
,sum(omision) as IMPORTE
,max(datediff(day,fechacaptura,getdate())) as DIAS_MAXIMO
from sireca.dbo.eco
where tipoeco like '''+@TIPO+'''
and incidencia in (''2'',''1'') 
and responsable like '''+@INSPECTOR+'''
and datediff(day,fechacaptura,getdate())'+@DIAS+'
and incidenciarale in (''01'',''02'')
and subdel='''+@SUBDEL+'''
and validacion=''SIN PAGO''
group by subdel,responsable,tipoeco,incidencia
order by subdel,inspector,incidencia
')
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLdias" DefaultValue="&lt;0" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <!-- Resumen detallado --> 
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender12" runat="server" 
            TargetControlID="PanelDetalleContend" 
            CollapseControlID="PanelDetalleHeader" ExpandControlID="PanelDetalleHeader" 
            SuppressPostBack="True" ExpandDirection="Horizontal" ></asp:CollapsiblePanelExtender>
        <asp:Panel ID="PanelDetalleHeader" runat="server" CssClass="accordionHeader">DETALLES
        </asp:Panel>
        <asp:Panel ID="PanelDetalleContend" runat="server" Height="400px" 
            ScrollBars="Auto">
            <asp:GridView ID="GridViewPendientes" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourcePendientes" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            Font-Size="10pt" HorizontalAlign="Center" 
            BackColor="White">
                <Columns>
                    <asp:BoundField DataField="Nº" DataFormatString="{0:N0}" HeaderText="Nº" 
                        SortExpression="Nº">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" />
                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                    <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                        SortExpression="CREDITO" />
                    <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                    SortExpression="SECTOR" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/DefaultClear.aspx?regpat={0}&amp;razon=razonsinheader" 
                    DataTextField="REGPAT" HeaderText="REGPAT" 
                    NavigateUrl="~/observacionPatronal/DefaultClear.aspx" SortExpression="REGPAT" >
                    <ItemStyle Font-Underline="False" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" />
                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FECH_DILIGENCIA" DataFormatString="{0:d}" 
                        HeaderText="FECH_DILIGENCIA" SortExpression="FECH_DILIGENCIA" />
                    <asp:BoundField DataField="INCIDENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" />
                    <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
                    SortExpression="DIAS" />
                </Columns>
                <FooterStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#D2D2D4" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourcePendientes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
    
                
                SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(8)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @DIAS as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO=?
SET @INSPECTOR=?
SET @DIAS=?
EXEC('
select 
ROW_NUMBER() OVER(ORDER BY subdel,(case when len(fechaEco)=5 then substring(convert(varchar,fechaeco),2,4)+''/''+''0''+substring(convert(varchar,fechaeco),1,1) else substring(convert(varchar,fechaeco),3,4)+''/''+substring(convert(varchar,fechaeco),1,2) end),DIAS) AS Nº
,subdel as SUBDEL
,(SELECT upper(nombre) FROM fiscamovil.dbo.usuarios WHERE id=responsable) as INSPECTOR
,tipoeco as TIPO
,case when tipoeco in (''RCV'',''RCVCOMP'')  then 
(case when len(fechaEco)=5 then ''0''+convert(varchar,convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(varchar,convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end) 
else
(case when len(fechaEco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end) 
end
as PERIODO
,CREDITO as CREDITO
,sector as SECTOR
,REG#PATRONAL as REGPAT
,[NOMBRE O RAZON SOCIAL]
,COTIZ as COTIZANTES
,OMISION as IMPORTE
,(select ''(''+[CVE DILIG#]+'')''+ACTIVIDAD from sireca.dbo.catalogo where [CVE DILIG#]=incidencia) as INCIDENCIA
,fechacaptura as FECH_DILIGENCIA
,(datediff(day,fechacaptura,getdate())) as DIAS
from sireca.dbo.eco
where 
subdel='''+@SUBDEL+'''
and tipoeco like '''+@TIPO+'''
and responsable like '''+@INSPECTOR+'''
and datediff(day,fechacaptura,getdate())'+@DIAS+'
and incidencia in (''2'',''1'') 
and incidenciarale in (''01'',''02'')
and validacion=''SIN PAGO''
')
EXEC('
update sirecacobros.dbo.co_rale
set ra_inc=''31''
from sireca.dbo.eco INNER JOIN sirecacobros.dbo.co_rale on RA_REGPATR=substring(REG#PATRONAL,1,10)
where
subdel='''+@SUBDEL+'''
and RA_NUMCRED like (''''+substring(CREDITO,1,2)+''_''+substring(CREDITO,4,6)+'''')
and RA_PERIODO=(''01/''+(case when len(fechaEco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end))
and ra_inc in (''01'',''02'')
and tipoeco like '''+@TIPO+'''
and responsable like '''+@INSPECTOR+'''
and datediff(day,fechacaptura,getdate())&gt;19
and incidencia in (''2'',''1'') 
and incidenciarale in (''01'',''02'')
and validacion=''SIN PAGO''
')
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLdias" DefaultValue="&lt;00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>

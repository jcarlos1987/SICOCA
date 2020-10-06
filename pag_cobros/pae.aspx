<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pae.aspx.vb" Inherits="WebSIRECA.pae" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                                <asp:SessionParameter DefaultValue="99" Name="?" 
                                    SessionField="SIRECAuser_type" />
                                <asp:SessionParameter DefaultValue="99" Name="?" SessionField="SIRECAid" />
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                        <asp:DropDownList ID="DDLTipo" runat="server" Width="210px">
                            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                            <asp:ListItem Value="%">TODOS</asp:ListItem>
                        </asp:DropDownList>
                        <asp:LinkButton ID="LBActualizar" runat="server" 
            BorderColor="#F0BC4D" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
            Font-Underline="False" ForeColor="#293955" BackColor="#FFF3CD">&nbsp;Actualizar&nbsp;</asp:LinkButton>
            <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="AbsBottom" 
                        onclientclick="javascript:window.print();" Height="32px" 
                        ImageUrl="~/imagenes/imprimir1.jpg" Width="32px" ToolTip="Imprimir datos del Patron" />
        <hr />
    <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender11" runat="server" 
            TargetControlID="PanelResumenContend" 
            CollapseControlID="PanelResumenHeader" ExpandControlID="PanelResumenHeader" 
            SuppressPostBack="True" ></asp:CollapsiblePanelExtender>
        <asp:Panel ID="PanelResumenHeader" runat="server" CssClass="accordionHeader">RESUMEN GENERAL (31)POR INICIAR LA TRAMITACION PARA EL P.A.E.(Procedimiento Administrativo de Ejecución)
        </asp:Panel>
        <asp:Panel ID="PanelResumenContend" runat="server" >
            <asp:GridView ID="GridViewPae" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourcePae" 
                Font-Size="10pt" HorizontalAlign="Center" ShowFooter="True" 
                EmptyDataText="SIN PENDIENTES POR INICIAR LA TRAMITACION">
                <Columns>
                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                        SortExpression="INSPECTOR" />
                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                        SortExpression="PERIODO" />
                    <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                        HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                        HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#D2D2D4" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourcePae" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(8)
DECLARE @INSPECTOR as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO=?
SET @INSPECTOR=?
----------------------------------
select 
INSPECTOR
,PERIODO
,orden
,COUNT(DISTINCT(REGPAT)) AS PATRONES
,COUNT(CREDITOS) AS CREDITOS
,SUM(COTIZANTES) AS COTIZANTES
,SUM(IMPORTE) AS IMPORTE
from (
select distinct
(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE

from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO='SI'
and RA_INC='31'
and RA_SUBDEL=@SUBDEL
and RA_TIPO like @TIPO
and CP_INSPEC like @INSPECTOR
)as resultado
group by inspector,PERIODO,orden
ORDER BY inspector,orden
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="%" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>


        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender12" runat="server" 
            TargetControlID="PanelDetalleContend" 
            CollapseControlID="PanelDetalleHeader" ExpandControlID="PanelDetalleHeader" 
            SuppressPostBack="True" ></asp:CollapsiblePanelExtender>
        <asp:Panel ID="PanelDetalleHeader" runat="server" CssClass="accordionHeader">DETALLES
        </asp:Panel>
        <asp:Panel ID="PanelDetalleContend" runat="server" >
            <asp:GridView ID="GridViewDetalles" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceDetalles" 
                EmptyDataText="SIN PENDIENTES POR INICIAR LA TRAMITACION" Font-Size="10pt" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="Nº" HeaderText="Nº" ReadOnly="True" 
                        SortExpression="Nº" />
                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                        SortExpression="INSPECTOR" />
                    <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/DefaultClear.aspx?regpat={0}&amp;razon=razonsinheader" 
                    DataTextField="REGPAT" HeaderText="REGPAT" 
                    NavigateUrl="~/observacionPatronal/DefaultClear.aspx" SortExpression="REGPAT" >
                    <ItemStyle Font-Underline="False" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                        ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                    <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                        HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                        SortExpression="LOCALIDAD" />
                    <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                        SortExpression="DOMICILIO" />
                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                        SortExpression="PERIODO" />
                    <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                        SortExpression="CREDITOS" />
                    <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                        HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#D2D2D4" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceDetalles" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(8)
DECLARE @INSPECTOR as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO=?
SET @INSPECTOR=?

select ROW_NUMBER() OVER(ORDER BY inspector,orden) as Nº,*
from (
select distinct
(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_REGPATR as REGPAT
,ptn.razonSocial as RAZON_SOCIAL
,ptn.cotiz as COTIZANTES
,ptn.loc as LOCALIDAD
,ptn.dom as DOMICILIO
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE

from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO='SI'
and RA_INC='31'
and RA_SUBDEL=@SUBDEL
and RA_TIPO like @TIPO
and CP_INSPEC like @INSPECTOR
)as resultado
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLTipo" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="%" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

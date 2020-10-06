<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default45" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="Content2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <center >
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
        AutoPostBack="True" Width="100px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="INSPECTOR:"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLInspector" runat="server" Width="260px" 
        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
        DataValueField="valor" Font-Size="9pt">
    </asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USUARIO_TIPO as VARCHAR(3)
DECLARE @USUARIO_ID as VARCHAR(5)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_INSPECTOR as VARCHAR(50)
DECLARE @TIPO_INSPECTORV as VARCHAR(1)
SET @USUARIO_TIPO=?
SET @USUARIO_ID=?
SET @SUBDEL=?
SET @TIPO_INSPECTORV='1'

if @TIPO_INSPECTORV='1'
begin 
SET @TIPO_INSPECTOR='INSPECTOR A'
end
else
begin
SET @TIPO_INSPECTOR='INSPECTOR B EJECUCION FISCAL'
end
IF @USUARIO_TIPO='0'
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1') and substring(chmod,13,1)='x'
	and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) in (@TIPO_INSPECTOR)
	order by texto
end
else 
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1') and substring(chmod,13,1)='x'
	and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) in (@TIPO_INSPECTOR)
	and sire.id=@USUARIO_ID
	order by texto
end
">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="99999" Name="?" 
                                    SessionField="SIRECAuser_type" />
                                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                    </asp:SqlDataSource>
<span class="add-on">
                            <asp:Label ID="Label5" runat="server" Text="PERIODO:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px" 
                                CssClass="btn dropdown-toggle btn-small">
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
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" data-toggle="dropdown" 
                                AutoPostBack="True" Width="80px" 
                                CssClass="btn dropdown-toggle btn-small">
                            </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="ASIGNACIÓN DEL:"></asp:Label>
</span>
    <asp:TextBox ID="TBFechAsig" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#A0A0A0">x</asp:TextBox>
    <asp:CalendarExtender ID="caext1" runat="server" Format="dd/MM/yyyy" TargetControlID="TBFechAsig"></asp:CalendarExtender>
</div>
<div class="btn-group input-prepend">
    <asp:TextBox ID="TBBuscar" runat="server"></asp:TextBox>
    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="TBBuscar" 
            WatermarkText="CREDITO"></asp:TextBoxWatermarkExtender> 
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="INCIDENCIA:"></asp:Label>
</span>
<asp:DropDownList ID="DDLInc" runat="server" Width="140px" Font-Size="9pt">
    <asp:ListItem Value="2">NOTIFICADOS</asp:ListItem>
    <asp:ListItem Value="9">NO LOCALIZADOS / ND</asp:ListItem>
    <asp:ListItem Value="PAGADO">PAGADOS</asp:ListItem>
</asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" runat="server" CssClass="btn" BackColor="#BCC7D8"><i class="icon-refresh"></i></asp:LinkButton>
    <asp:LinkButton ID="LBPrint" runat="server" CssClass="btn" BackColor="#BCC7D8"><i class="icon-print"></i></asp:LinkButton>
</span>
</div>
</center>
    <asp:GridView ID="GridViewSeleccion" runat="server" 
        AutoGenerateColumns="False" 
        Caption="&lt;strong&gt;Seleccionados ECO&lt;/strong&gt;" 
        DataSourceID="SqlDataSourceSelecion" Font-Size="9pt" 
        HorizontalAlign="Center" CssClass="table-condensed">
        <Columns>
            <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="V_SUBDEL">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_TIPO_ECO" HeaderText="COP/RCV" ReadOnly="True" 
                SortExpression="V_TIPO_ECO" />
            <asp:BoundField DataField="V_ORI_MUL" HeaderText="ORIGEN/MULTA" ReadOnly="True" 
                SortExpression="V_ORI_MUL" />
            <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                ReadOnly="True" SortExpression="V_INC_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA DE DILIGENCIA" 
                SortExpression="V_FECHA_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
    <asp:GridView ID="GridViewSeleccionSivepas" runat="server" 
        AutoGenerateColumns="False" 
        Caption="&lt;strong&gt;Seleccionados SIVEPAS&lt;/strong&gt;" 
        DataSourceID="SqlDataSourceSelecionSivepas" Font-Size="9pt" 
        HorizontalAlign="Center" CssClass="table-condensed">
        <Columns>
            <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="V_SUBDEL">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_TIPO_ECO" HeaderText="IMSS/RCV" ReadOnly="True" 
                SortExpression="V_TIPO_ECO" />
            <asp:BoundField DataField="V_ORI_MUL" HeaderText="ORIGEN/MULTA" ReadOnly="True" 
                SortExpression="V_ORI_MUL" />
            <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                ReadOnly="True" SortExpression="V_INC_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA DE DILIGENCIA" 
                SortExpression="V_FECHA_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
    <center >
    <asp:SqlDataSource ID="SqlDataSourceSelecion" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT
[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('COP') then 'ORI/MUL' else V_ORI_MUL end) as V_ORI_MUL
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,convert(varchar(10),[V_FECHA_CAPTURA],103) as V_FECHA_CAPTURA
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) not in ('RE','POR PROCESAR','PAGADO','9')
and V_INC_CAPTURA =@INC_CAP
and [V_FOLIO_P1] is null
group by [V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103)
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
,(case when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('COP') then 'ORI/MUL' else V_ORI_MUL end)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
order by CREDITOS
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="2" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSelecionSivepas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT
[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('SIVEPA-IMSS') then 'ORI/MUL' else V_ORI_MUL end) as V_ORI_MUL
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,convert(varchar(10),[V_FECHA_CAPTURA],103) as V_FECHA_CAPTURA
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) not in ('RE','POR PROCESAR','PAGADO','9')
and V_INC_CAPTURA =@INC_CAP
and [V_FOLIO_P1] is null
group by [V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103)
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
,(case when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('SIVEPA-IMSS') then 'ORI/MUL' else V_ORI_MUL end)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
order by CREDITOS
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="2" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:Label ID="LMLimite" runat="server" Font-Bold="True" 
            ForeColor="#CC0000" ></asp:Label>
    <asp:GridView ID="GridViewSeleccion0" runat="server" 
        AutoGenerateColumns="False" 
        Caption="&lt;strong&gt;Seleccionados ECO&lt;/strong&gt;" 
        DataSourceID="SqlDataSourceSelecion0" Font-Size="9pt" 
        HorizontalAlign="Center" CssClass="table-condensed">
        <Columns>
            <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="V_SUBDEL">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_TIPO_ECO" HeaderText="COP/RCV" ReadOnly="True" 
                SortExpression="V_TIPO_ECO" />
            <asp:BoundField DataField="V_ORI_MUL" HeaderText="ORIGEN/MULTA" ReadOnly="True" 
                SortExpression="V_ORI_MUL" />
            <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                ReadOnly="True" SortExpression="V_INC_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
    <asp:GridView ID="GridViewSeleccion0Sivepas" runat="server" 
        AutoGenerateColumns="False" 
        Caption="&lt;strong&gt;Seleccionados Sivepas&lt;/strong&gt;" 
        DataSourceID="SqlDataSourceSelecion0Sivepas" Font-Size="9pt" 
        HorizontalAlign="Center" CssClass="table-condensed">
        <Columns>
            <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="V_SUBDEL">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_TIPO_ECO" HeaderText="IMSS/RCV" ReadOnly="True" 
                SortExpression="V_TIPO_ECO" />
            <asp:BoundField DataField="V_ORI_MUL" HeaderText="ORIGEN/MULTA" ReadOnly="True" 
                SortExpression="V_ORI_MUL" />
            <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                ReadOnly="True" SortExpression="V_INC_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceSelecion0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT
[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case 
when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('COP') then 'ORI/MUL'
when V_INC_CAPTURA in ('9') then 'ORI/MUL'
else V_ORI_MUL 
end) as V_ORI_MUL
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and V_INC_CAPTURA not in ('2')
and [V_FOLIO_P1] is null
group by [V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
,(case 
when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('COP') then 'ORI/MUL' 
when V_INC_CAPTURA in ('9') then 'ORI/MUL'
else V_ORI_MUL end)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
order by CREDITOS
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="2" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSelecion0Sivepas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT
[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case 
when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('SIVEPA-IMSS') then 'ORI/MUL'
when V_INC_CAPTURA in ('9') then 'ORI/MUL'
else V_ORI_MUL 
end) as V_ORI_MUL
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and V_INC_CAPTURA not in ('2')
and [V_FOLIO_P1] is null
group by [V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
,(case 
when V_INC_CAPTURA in ('2') and V_TIPO_ECO in ('SIVEPA-IMSS') then 'ORI/MUL' 
when V_INC_CAPTURA in ('9') then 'ORI/MUL'
else V_ORI_MUL end)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
order by CREDITOS
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="2" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <asp:Label ID="LMLimite0" runat="server" Font-Bold="True" 
            ForeColor="#CC0000" ></asp:Label></center>
    <asp:GridView ID="GridViewAValidar" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceAValidar" Font-Size="9pt" AllowSorting="True" 
        HorizontalAlign="Center" AllowPaging="True" PageSize="2">
        <Columns>
            <asp:BoundField DataField="N" DataFormatString="{0:N0}" HeaderText="N°" 
                SortExpression="N">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TIPO_ECO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO_ECO" />
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" />
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="OMISION" HeaderText="OMISION" ReadOnly="True" 
                SortExpression="OMISION" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                SortExpression="PAGO">
            <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_PAGO" DataFormatString="{0:d}" 
                HeaderText="FECHA PAGO" SortExpression="FECHA_PAGO">
            <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_NOTIFICACION" DataFormatString="{0:d}" 
                HeaderText="FECHA NOTIFICACION" SortExpression="FECHA_NOTIFICACION">
            <ItemStyle Font-Bold="True" ForeColor="#006600" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO/BIMESTRE" ReadOnly="True" 
                SortExpression="PERIODO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="CAPTURO" HeaderText="CAPTURO" 
                ReadOnly="True" SortExpression="CAPTURO" />
            <asp:BoundField DataField="FECHA_ASIGNACION" HeaderText="FECHA ASIGNACION" 
                ReadOnly="True" SortExpression="FECHA_ASIGNACION" 
                DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC_CAPTURA" HeaderText="DILIGENCIA" 
                ReadOnly="True" SortExpression="INC_CAPTURA" >
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#C19111" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_CAPTURA" HeaderText="FECHA DILIGENCIA" 
                ReadOnly="True" SortExpression="FECHA_CAPTURA" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#C19111" />
            </asp:BoundField>
            <asp:BoundField DataField="ID_CONFIRMO_P1" HeaderText="CONFIRMO P1" 
                ReadOnly="True" SortExpression="ID_CONFIRMO_P1" Visible="False" />
            <asp:TemplateField>
                <ItemTemplate>
<asp:Panel ID="Panel1" runat="server" Visible='<%# IIF(IsDBNull(Eval("INC_CAPTURA")),"false",IIF(Eval("INC_CAPTURA")="PAGADO" or Eval("INC_CAPTURA")="POR PROCESAR" or Eval("INC_CAPTURA")="RE" or Eval("INC_CAPTURA")="A" or Eval("INC_CAPTURA")="2" or Eval("INC_CAPTURA")="9","true","false")) %>'>
<asp:LinkButton ID="LBHF" runat="server" ><i class ="icon-ok"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBHF" PopupControlID="PanelAct" DropShadow="true" CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" Height="200px" Width="400px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label4" runat="server" Text="Confirme su Verificación" Font-Size="18" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
	<asp:LinkButton ID="LBguardar" runat="server" CssClass ="btn btn-success" 
        OnClick="LBguardar_Click" 
        CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("ID_ECO") & "-" & Eval("INC_CAPTURA") %>' 
        Height="50"><i class="icon-ok"></i><br/>CONFIRMAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarAct" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" Height="50"><i class="icon-remove"></i><br/>CANCELAR</asp:LinkButton>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
</asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:LinkButton ID="LBHFCanInc" runat="server" ><i class ="icon-pencil"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2CanInc" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBHFCanInc" PopupControlID="PanelActCanInc" DropShadow="true" CancelControlID="LBCerrarActCanInc" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelActCanInc" runat="server" Height="300px" Width="600px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderActCanInc" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label4CanInc" runat="server" Text="Cambio de Incidencia" Font-Size="18" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
    <asp:Label ID="Label8" runat="server" Text="INSPECTOR QUE LO DILIGENCIO:" Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:DropDownList ID="DDLInspector" runat="server" 
        DataSourceID="SqlDataSourceUsuarios" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT us.id as valor, uf.nombre as texto
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE (us.subdel =?) AND (us.user_type = '1')
ORDER BY 2">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label6" runat="server" Text='<%# "DILIGENCIA ACTUAL: " & Eval("INC_CAPTURA") & ", EN EL DÍA: " & Eval("FECHA_CAPTURA","{0:d}") %>' Font-Bold="True" ForeColor="#2A3B58"></asp:Label>
    <br />
    <asp:DropDownList ID="DDLInc" runat="server" Width="160px">
        <asp:ListItem Value="2">(2) NOTIFICADO</asp:ListItem>
        <asp:ListItem>PAGADO</asp:ListItem>
        <asp:ListItem Value="9">(9) NO LOCALIZADO</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TBFechInc" runat="server" Width="100px" 
        oninit="TBFechInc_Init"></asp:TextBox>
    <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechInc"></asp:CalendarExtender>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Observación"></asp:Label>
    <br />
    <asp:TextBox ID="TBObservacion" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
	<asp:LinkButton ID="LBguardarCanInc" runat="server" CssClass ="btn btn-success" 
        CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("ID_ECO") & "-" & Eval("INC_CAPTURA") %>' 
         OnClick="LBguardarCanInc_Click">CAMBIAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarActCanInc" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" >CANCELAR</asp:LinkButton>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1CanInc" runat="server" Enabled="True" Radius="15" TargetControlID="PanelActCanInc"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="btn-warning" ForeColor="White" />
        <PagerSettings PageButtonCount="30" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceAValidar" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INC AS VARCHAR(15)
DECLARE @INSPECTOR AS VARCHAR(15)
DECLARE @FECH_ASIGNACION AS VARCHAR(10)
DECLARE @PERIODO AS VARCHAR(7)
DECLARE @CREDITO AS VARCHAR(30)
SET @SUBDEL=?
SET @INC=?
SET @INSPECTOR=?
SET @FECH_ASIGNACION=?
SET @PERIODO=(?+'/'+?)
SET @CREDITO=?
SET @CREDITO=(case 
when charindex('!',@CREDITO) not in (0) then substring(@CREDITO,charindex('!',@CREDITO)+1,9)
else @CREDITO end
)
if len(@FECH_ASIGNACION)&lt;&gt;10
begin 
	SET @FECH_ASIGNACION='%'
end
if @CREDITO='%'
begin
SELECT 
ROW_NUMBER() OVER(order by REGPAT ) as N
,* FROM (
SELECT 
id as ID_ECO
,[tipoECO] AS TIPO_ECO
,[subdel] AS SUBDEL
,[REG#PATRONAL] AS REGPAT
,[NOMBRE O RAZON SOCIAL] AS RAZON_SOCIAL
,[CREDITO] AS CREDITO
,[COTIZ] AS COTIZ
,[OMISION] AS OMISION
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,(select upper(nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) AS CAPTURO
,[responsable] AS ID_CAPTURO
,[fechaSeleccion] AS FECHA_ASIGNACION
,isnull([incidencia],'') AS INC_CAPTURA
,[fechaCaptura] AS FECHA_CAPTURA
,[sector] AS SECTOR
,[validacion] AS VALIDACION
,[pago] AS PAGO
,[fech_pago] AS FECHA_PAGO
,NULL AS ID_CONFIRMO_P1
,NULL AS FECHA_CONFIRMACION_INC_P1
,(case when eco.incidencia in ('2') then eco.fechaCaptura else
(
	SELECT top 1 hinc.fecha
	FROM [sireca].[dbo].[HistorialInc] as hinc
	where hinc.incidencia='2' and hinc.ideco=eco.id
	order by hinc.id desc
) end
) as FECHA_NOTIFICACION
FROM [sireca].[dbo].[eco]
where subdel=@SUBDEL
and ((case when incidencia in ('PAGADO','POR PROCESAR','RE','A') then 'PAGADO' else incidencia end)=@INC)
and (responsable LIKE @INSPECTOR or responsable is null)
and (convert(varchar(10),[fechaSeleccion],103) like @FECH_ASIGNACION or fechaSeleccion is null)
and (case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
)=@PERIODO
) as r
WHERE not exists(SELECT [V_ID_ECO]
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_ID_ECO]=ID_ECO and V_INC_CAPTURA=INC_CAPTURA)
and r.CREDITO like @CREDITO+'%'
end
else
begin
SELECT 
ROW_NUMBER() OVER(order by REGPAT ) as N
,* FROM (
SELECT 
id as ID_ECO
,[tipoECO] AS TIPO_ECO
,[subdel] AS SUBDEL
,[REG#PATRONAL] AS REGPAT
,[NOMBRE O RAZON SOCIAL] AS RAZON_SOCIAL
,[CREDITO] AS CREDITO
,[COTIZ] AS COTIZ
,[OMISION] AS OMISION
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,(select upper(nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) AS CAPTURO
,[responsable] AS ID_CAPTURO
,[fechaSeleccion] AS FECHA_ASIGNACION
,isnull([incidencia],'') AS INC_CAPTURA
,[fechaCaptura] AS FECHA_CAPTURA
,[sector] AS SECTOR
,[validacion] AS VALIDACION
,[pago] AS PAGO
,[fech_pago] AS FECHA_PAGO
,NULL AS ID_CONFIRMO_P1
,NULL AS FECHA_CONFIRMACION_INC_P1
,(case when eco.incidencia in ('2') then eco.fechaCaptura else
(
	SELECT top 1 hinc.fecha
	FROM [sireca].[dbo].[HistorialInc] as hinc
	where hinc.incidencia='2' and hinc.ideco=eco.id
	order by hinc.id desc
) end
) as FECHA_NOTIFICACION
FROM [sireca].[dbo].[eco]
where subdel=@SUBDEL
) as r
WHERE /*not exists(SELECT [V_ID_ECO]
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_ID_ECO]=ID_ECO and V_INC_CAPTURA=INC_CAPTURA)
and*/ r.CREDITO=@CREDITO
end
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="2" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFechAsig" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBBuscar" DefaultValue="%" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewAValidarSivepa" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceAValidarSivepa" Font-Size="9pt" AllowSorting="True" 
        HorizontalAlign="Center" AllowPaging="True" PageSize="2">
        <Columns>
            <asp:BoundField DataField="N" DataFormatString="{0:N0}" HeaderText="N°" 
                SortExpression="N">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TIPO_ECO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO_ECO" />
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" />
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="OMISION" HeaderText="DIFERENCIA" ReadOnly="True" 
                SortExpression="OMISION" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                SortExpression="PAGO">
            <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_PAGO" DataFormatString="{0:d}" 
                HeaderText="FECHA PAGO" SortExpression="FECHA_PAGO">
            <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_NOTIFICACION" DataFormatString="{0:d}" 
                HeaderText="FECHA NOTIFICACION" SortExpression="FECHA_NOTIFICACION">
            <ItemStyle Font-Bold="True" ForeColor="#006600" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO/BIMESTRE" ReadOnly="True" 
                SortExpression="PERIODO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="CAPTURO" HeaderText="CAPTURO" 
                ReadOnly="True" SortExpression="CAPTURO" />
            <asp:BoundField DataField="FECHA_ASIGNACION" HeaderText="FECHA ASIGNACION" 
                ReadOnly="True" SortExpression="FECHA_ASIGNACION" 
                DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC_CAPTURA" HeaderText="DILIGENCIA" 
                ReadOnly="True" SortExpression="INC_CAPTURA" >
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#C19111" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_CAPTURA" HeaderText="FECHA DILIGENCIA" 
                ReadOnly="True" SortExpression="FECHA_CAPTURA" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#C19111" />
            </asp:BoundField>
            <asp:BoundField DataField="ID_CONFIRMO_P1" HeaderText="CONFIRMO P1" 
                ReadOnly="True" SortExpression="ID_CONFIRMO_P1" Visible="False" />
            <asp:TemplateField>
                <ItemTemplate>
<asp:Panel ID="Panel2" runat="server" >
<asp:LinkButton ID="LBHF0" runat="server" ><i class ="icon-ok"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP30" runat="server" Enabled="True" 
        BackgroundCssClass="modalBackground" TargetControlID="LBHF0" 
        PopupControlID="PanelAct0" DropShadow="true" CancelControlID="LBCerrarAct0" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct0" runat="server" Height="200px" Width="400px" 
        Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderAct0" runat="server" HorizontalAlign="Center" 
        Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label9" runat="server" Text="Confirme su Verificación" 
            Font-Size="18" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
	<asp:LinkButton ID="LBguardar0" runat="server" CssClass ="btn btn-success" 
        CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("ID_ECO") & "-" & Eval("INC_CAPTURA") %>' 
        Height="50" onclick="LBguardar0_Click"><i class="icon-ok"></i><br/>CONFIRMAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarAct0" runat="server" CssClass ="btn btn-danger" 
        Font-Underline="False" ForeColor="White" Height="50"><i class="icon-remove"></i><br/>CANCELAR</asp:LinkButton>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE20" runat="server" Enabled="True" Radius="15" 
        TargetControlID="PanelAct0"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
</asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
<asp:LinkButton ID="LBHFCanInc0" runat="server" ><i class ="icon-pencil"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2CanInc0" runat="server" Enabled="True" 
                        BackgroundCssClass="modalBackground" TargetControlID="LBHFCanInc0" 
                        PopupControlID="PanelActCanInc0" DropShadow="true" 
                        CancelControlID="LBCerrarActCanInc0" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelActCanInc0" runat="server" Height="300px" Width="600px" Font-Size="11pt" 
                        HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderActCanInc0" runat="server" HorizontalAlign="Center" 
        Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label4CanInc0" runat="server" Text="Cambio de Incidencia" 
            Font-Size="18" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
    <asp:Label ID="Label10" runat="server" Text="INSPECTOR QUE LO DILIGENCIO:" 
        Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:DropDownList ID="DDLInspector0" runat="server" 
        DataSourceID="SqlDataSourceUsuarios0" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceUsuarios0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT us.id as valor, uf.nombre as texto
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE (us.subdel =?) AND (us.user_type = '1')
ORDER BY 2">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label11" runat="server" 
        Text='<%# "DILIGENCIA ACTUAL: " & Eval("INC_CAPTURA") & ", EN EL DÍA: " & Eval("FECHA_CAPTURA","{0:d}") %>' 
        Font-Bold="True" ForeColor="#2A3B58"></asp:Label>
    <br />
    <asp:DropDownList ID="DDLInc0" runat="server" Width="160px">
        <asp:ListItem Value="2">(2) NOTIFICADO</asp:ListItem>
        <asp:ListItem>PAGADO</asp:ListItem>
        <asp:ListItem Value="9">(9) NO LOCALIZADO</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TBFechInc0" runat="server" Width="100px" 
        oninit="TBFechInc_Init"></asp:TextBox>
    <asp:CalendarExtender ID="caext30" runat="server" Enabled="True" 
        Format="dd/MM/yyyy" TargetControlID="TBFechInc0"></asp:CalendarExtender>
    <br />
    <asp:Label ID="Label12" runat="server" Text="Observación"></asp:Label>
    <br />
    <asp:TextBox ID="TBObservacion0" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
	<asp:LinkButton ID="LBguardarCanInc0" runat="server" CssClass ="btn btn-success" 
        
        CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("ID_ECO") & "-" & Eval("INC_CAPTURA") %>' 
        onclick="LBguardarCanInc0_Click" >CAMBIAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarActCanInc0" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" >CANCELAR</asp:LinkButton>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1CanInc0" runat="server" Enabled="True" Radius="15" TargetControlID="PanelActCanInc0"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="btn-warning" ForeColor="White" />
        <PagerSettings PageButtonCount="30" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceAValidarSivepa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @CREDITO AS VARCHAR(15)
DECLARE @DILIGENCIA AS VARCHAR(2)
SET @SUBDEL=?
SET @CREDITO=?
SET @DILIGENCIA=?
SELECT  
ROW_NUMBER() OVER(order by [REGPAT] ) as N
,ID_ECO,TIPO_ECO,SUBDEL,REGPAT,RAZON_SOCIAL,CREDITO,COTIZ,OMISION,PERIODO,CAPTURO,ID_CAPTURO,FECHA_ASIGNACION,INC_CAPTURA,FECHA_CAPTURA,SECTOR,VALIDACION
,RC_IMP_TOT AS PAGO,RC_FEC_MOV AS FECHA_PAGO,ID_CONFIRMO_P1,FECHA_CONFIRMACION_INC_P1,FECHA_NOTIFICACION
FROM (
SELECT
[SV_ID] AS ID_ECO
,[SV_SIVEPA] AS TIPO_ECO
,[SV_SUBDEL] AS SUBDEL
,substring([SV_REG_PATRONAL],1,10) as REGPAT
,[SV_RAZON_SOCIAL] AS RAZON_SOCIAL
,[SV_CREDITO] AS CREDITO
,[SV_COTIZ] AS COTIZ
,[SV_DIFERENCIA] AS OMISION
,(CASE WHEN LEN(MONTH([SV_PERIODO]))=1 THEN '0'+CONVERT(VARCHAR,MONTH([SV_PERIODO])) ELSE CONVERT(VARCHAR,MONTH([SV_PERIODO])) END)+'/'+CONVERT(VARCHAR,YEAR([SV_PERIODO])) AS PERIODO
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE ID=[SV_ASIG_INSPECTOR]) AS CAPTURO
,[SV_ASIG_INSPECTOR] AS ID_CAPTURO
,[SV_ASIG_FECHA] AS FECHA_ASIGNACION
,(SELECT TOP 1 [SVD_DILI]
FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI=@DILIGENCIA and [SVD_SV_ID]=SV_ID
order by SVD_ID desc) AS INC_CAPTURA
,(SELECT TOP 1 [SVD_FECH_DILI]
FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI=@DILIGENCIA and [SVD_SV_ID]=SV_ID
order by SVD_ID desc) AS FECHA_CAPTURA
,'' AS SECTOR
,'' AS VALIDACION
/*,'' AS PAGO
,'' AS FECHA_PAGO*/
,'' AS ID_CONFIRMO_P1
,'' AS FECHA_CONFIRMACION_INC_P1
,(SELECT TOP 1 [SVD_FECH_DILI]
FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='2' and [SVD_SV_ID]=SV_ID
order by SVD_ID desc) AS FECHA_NOTIFICACION
FROM [sirecasivepas].[dbo].[SV_BASE]
where [SV_SUBDEL]=@SUBDEL AND [SV_CREDITO]=@CREDITO
) AS sivepas
left join (
SELECT [RC_PATRON],[RC_PER],[RC_CRED],SUM([RC_IMP_TOT]) AS [RC_IMP_TOT],MAX([RC_FEC_MOV]) AS [RC_FEC_MOV] FROM (
SELECT [RC_FEC_MOV]
,(SUBSTRING([RC_PATRON],2,8)+[RC_MOD]) AS [RC_PATRON]
,[RC_PER]
,[RC_CRED]
,[RC_IMP_TOT]
FROM [lgp].[dbo].[RC]
where [RC_CRED]=@CREDITO
) AS LGP
GROUP BY [RC_PATRON],[RC_PER],[RC_CRED]
) AS pagos on RC_PATRON=REGPAT AND YEAR(RC_PER+'/01')=YEAR('01/'+PERIODO) AND MONTH(RC_PER+'/01')=MONTH('01/'+PERIODO)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBBuscar" DefaultValue="%" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="2" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

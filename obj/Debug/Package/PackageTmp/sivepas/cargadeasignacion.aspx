<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="cargadeasignacion.aspx.vb" Inherits="WebSIRECA.cargadeasignacion1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
<div class="btn-group input-prepend">
    <span class="add-on"><i class="icon-search"></i></span>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" Width="150px">
        </asp:DropDownList>
    <asp:TextBox ID="TBBuscar" runat="server" MaxLength="30" placeholder="CREDITO" 
        TabIndex="9"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CssClass="btn">BUSCAR</asp:LinkButton>
</div>
        <asp:SqlDataSource ID="SqlDataSourceBuscar" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
      [SV_ID] as ID
      ,[SV_TIPO] as TIPO
      ,[SV_SIVEPA] AS SIVEPA
      ,[SV_FECHA] AS FECHA_EMITIO
      ,substring(convert(varchar(10),[SV_PERIODO],103),4,7) AS PERIODO
      ,[SV_PERIODO] AS ORDEN_PERIODO
      ,[SV_SUBDEL] AS SUBDEL
      ,[SV_REG_PATRONAL] AS REGPAT
      ,[SV_RAZON_SOCIAL] AS RAZON_SOCIAL
      ,[SV_CREDITO] AS CREDITO
      ,[SV_COTIZ] AS COTIZ
      ,[SV_DIAS] AS DIAS
      ,[SV_C] AS C
      ,[SV_ACT] AS ACT
      ,[SV_PRIMA] AS PRIMA
      ,[SV_EMI_REAL] AS EMI_REAL
      ,[SV_RECAUDACION] AS RECAUDACION
      ,[SV_DIFERENCIA] AS DIFERENCIA
  FROM [sirecasivepas].[dbo].[SV_BASE]
  WHERE [SV_SUBDEL] like ?
and [SV_CREDITO] like ?+'%' 
and [SV_ASIG_INSPECTOR] is null">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBBuscar" DefaultValue="CREDITO" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewBuscar" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceBuscar" AllowPaging="True" Font-Size="8pt">
            <Columns>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" />
                <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" ReadOnly="True" 
                    SortExpression="SIVEPA" />
                <asp:BoundField DataField="FECHA_EMITIO" HeaderText="FECHA EMITIO" 
                    ReadOnly="True" SortExpression="FECHA_EMITIO" DataFormatString="{0:d}" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="ORDEN_PERIODO" />
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:TemplateField>
                    <ItemTemplate>
<asp:LinkButton ID="LBHF" runat="server" ><i class ="icon-ok"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBHF" PopupControlID="PanelAct" DropShadow="true" CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" Height="150px" Width="600px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label4" runat="server" Text="Asignación" Font-Size="18" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLInspector" runat="server" 
        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
        DataValueField="valor">
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
	<asp:LinkButton ID="LBguardar" runat="server" CssClass ="btn btn-success" OnClick="LBguardar_Click" CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("ID") %>'>ASIGNAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarAct" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White">CANCELAR</asp:LinkButton>
</span>
</div> 
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
                    SortExpression="DIAS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="C" HeaderText="C" ReadOnly="True" 
                    SortExpression="C" />
                <asp:BoundField DataField="ACT" HeaderText="ACT" ReadOnly="True" 
                    SortExpression="ACT" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" ReadOnly="True" 
                    SortExpression="PRIMA" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="EMI_REAL" HeaderText="EMI_REAL" ReadOnly="True" 
                    SortExpression="EMI_REAL" />
                <asp:BoundField DataField="RECAUDACION" HeaderText="RECAUDACION" 
                    ReadOnly="True" SortExpression="RECAUDACION" />
                <asp:BoundField DataField="DIFERENCIA" HeaderText="DIFERENCIA" ReadOnly="True" 
                    SortExpression="DIFERENCIA" />
            </Columns>
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>   
    </div>
</asp:Content>

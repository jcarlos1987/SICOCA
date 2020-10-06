<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="detallesRegpat.aspx.vb" Inherits="WebSIRECA.detallesRegpat" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            Caption="Datos Generales del Patron" DataSourceID="SqlDataSource3" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" Font-Size="10pt" PageSize="15" 
            DataKeyNames="id" CssClass="table-bordered" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" ReadOnly="True" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" ReadOnly="True" />
                <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                    SortExpression="incidencia" ReadOnly="True" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" ReadOnly="True" />
                <asp:BoundField DataField="TP" HeaderText="TP" 
                    SortExpression="TP" ReadOnly="True" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" HeaderText="RAZON SOCIAL" 
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            
            SelectCommand="SELECT eco.id, substring(eco.REG#PATRONAL,1,10) as REG#PATRONAL, eco.TP, eco.[NOMBRE O RAZON SOCIAL], eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#
, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.responsable, eco.fechaSeleccion
, eco.cambiarIncidencia, eco.tipoECO, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.sector 
FROM sireca.dbo.eco AS eco WHERE eco.id=?" 
            
            
            
            
            
                
                
                UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000" Name="?" QueryStringField="id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cambiarIncidencia" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </asp:Panel>
<center >
<div class="btn-group input-prepend">
<span class="add-on">
        <asp:Label ID="Label3" runat="server" Text="Cambio de Sector: " Font-Bold="True"></asp:Label>
</span> 
        <asp:TextBox ID="TextBox1" runat="server" MaxLength="2" Width="117px" 
            BorderStyle="Solid" BorderWidth="1px">0</asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Guardar" CssClass="btn"/>
</div> 
<br />
<div class="btn-group input-prepend">
<span class="add-on">
            <asp:Label ID="Label2" runat="server"></asp:Label>
</span> 
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSourceUsuarios" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT us.id, uf.nombre
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE (us.subdel =?) AND (us.user_type = '1')
ORDER BY 2">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Text="Asignar" CssClass ="btn"/>
</div> 
<br />
<div class="btn-group input-prepend">
<span class="add-on">
            <asp:Label ID="Label1" runat="server" Text="Diligencia Actual: "></asp:Label>
</span> 
<span class="add-on">
            <asp:Label ID="LIncidencia" runat="server"></asp:Label>
</span> 
</div> 
<br />
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label5" runat="server" Text="Cambiar a:"></asp:Label>
</span> 
            <asp:DropDownList ID="DDLIncidencia" runat="server" 
                DataSourceID="SqlDataSourceIncidenciasLista" DataTextField="actividad" 
                DataValueField="clave">
            </asp:DropDownList>
<span class="add-on">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="10pt" 
                ForeColor="#009900" Text="Fecha:"></asp:Label>
</span> 
            <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Font-Bold="True" 
                ForeColor="#CC3300" MaxLength="20" Width="99px"></asp:TextBox>
                <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox2">
                </asp:CalendarExtender>
            <asp:Button ID="BIncidencia" runat="server" Text="Guardar" CssClass ="btn"/>
</div>
<br />
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:CheckBox ID="CBReset" runat="server" ForeColor="#CC0000" />
</span> 
        <asp:Button ID="BReset" runat="server" 
        Text="<--Confirma, REGRESAR AL LISTADO DE PENDIENTES" CssClass="btn" ForeColor="#CC0000"/>
</div>
</center>
        <asp:Panel ID="PIncidencia" runat="server" GroupingText="INCIDENCIA(S)">
            <asp:Label ID="LERROR" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSourceIncidenciasLista" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as clave
      ,[ACTIVIDAD] as actividad
  FROM [sireca].[dbo].[catalogo]
where grupoSupervisor='1'
ORDER BY actividad"></asp:SqlDataSource>
            <asp:GridView ID="GVIncidencia" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                DataSourceID="SqlDataSourceIncidencias" AutoGenerateColumns="False" 
                Font-Size="10pt">
                <Columns>
                    <asp:BoundField DataField="Column1" ReadOnly="True" SortExpression="Column1" />
                    <asp:BoundField DataField="periodo" HeaderText="PERIODO" 
                        SortExpression="periodo" />
                    <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                        SortExpression="tipoEco" />
                    <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                        SortExpression="sector" />
                    <asp:BoundField DataField="incidencia" HeaderText="INCIDENCIA" 
                        SortExpression="incidencia" />
                    <asp:BoundField DataField="fecha" HeaderText="FECHA INCIDENCIA" 
                        SortExpression="fecha" />
                    <asp:BoundField DataField="observaciones" HeaderText="OBSERVACIONES" 
                        SortExpression="observaciones" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <sortedascendingcellstyle backcolor="#F1F1F1" />
                <sortedascendingheaderstyle backcolor="#007DBB" />
                <sorteddescendingcellstyle backcolor="#CAC9C9" />
                <sorteddescendingheaderstyle backcolor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceIncidencias" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                SelectCommand="SELECT
      (SELECT uf.nombre
FROM fiscamovil.dbo.Usuarios AS uf 
WHERE uf.id = his.usuario )   
      ,his.[sector]
      ,his.[regpat]
      ,his.[periodo]
      ,his.[fecha]
      ,his.[incidencia]
      ,his.[observaciones]
      ,his.[tipoEco]
  FROM [sireca].[dbo].[HistorialInc] as his
  where his.idEco = ?
  order by his.id desc">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        
        <asp:Panel ID="PPagosProcesar" runat="server" 
            GroupingText="PAGO(S) DE PROCESAR">
            <asp:GridView ID="GVPProcesar" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                Font-Size="10pt" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceProcesar">
                <Columns>
                    <asp:BoundField DataField="RCP_PLAZA" HeaderText="RCP_PLAZA" 
                        SortExpression="RCP_PLAZA" />
                    <asp:BoundField DataField="RCP_FOLIO" HeaderText="RCP_FOLIO" 
                        SortExpression="RCP_FOLIO" />
                    <asp:BoundField DataField="RCP_PER" HeaderText="RCP_PER" 
                        SortExpression="RCP_PER" />
                    <asp:BoundField DataField="RCP_FEC_MOV" HeaderText="RCP_FEC_MOV" 
                        SortExpression="RCP_FEC_MOV" />
                    <asp:BoundField DataField="RCP_IMP_COP" DataFormatString="{0:C}" 
                        HeaderText="RCP_IMP_COP" SortExpression="RCP_IMP_COP" />
                    <asp:BoundField DataField="RCP_IMP_RCV" DataFormatString="{0:C}" 
                        HeaderText="RCP_IMP_RCV" SortExpression="RCP_IMP_RCV" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <sortedascendingcellstyle backcolor="#F1F1F1" />
                <sortedascendingheaderstyle backcolor="#007DBB" />
                <sorteddescendingcellstyle backcolor="#CAC9C9" />
                <sorteddescendingheaderstyle backcolor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceProcesar" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                SelectCommand="SELECT [RCP_PLAZA]
      ,[RCP_FOLIO]
      ,[RCP_PER]
      ,[RCP_FEC_MOV]
      ,[RCP_IMP_COP]
      ,[RCP_IMP_RCV]
  FROM [procesar].[dbo].[RCPRO]
  WHERE [RCP_REGPAT] like '%'+ ? +'%'
  AND (convert(float,(SUBSTRING(RCP_PER,6,2) + SUBSTRING(RCP_PER ,1,4)))) = ? and RCP_SUB=?">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="000" Name="?" 
                        QueryStringField="regpat" />
                    <asp:QueryStringParameter DefaultValue="0000" Name="?" 
                        QueryStringField="periodo" />
                    <asp:SessionParameter DefaultValue="0000" Name="?" 
                        SessionField="SIRECAsubdel" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>

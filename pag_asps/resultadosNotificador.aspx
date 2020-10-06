<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="resultadosNotificador.aspx.vb" Inherits="WebSIRECA.resultadosNotificador" %>

<asp:Content ID ="Contend1" runat ="server" ContentPlaceHolderID="ContentPlaceHolder1"  >
    <asp:Label ID="Label2" runat="server" Text="Fecha de Captura"></asp:Label>
    <asp:DropDownList ID="DDLfechaCaptura" runat="server" 
        DataSourceID="SqlDataSourceFechasCaptura" DataTextField="fechaCaptura" 
        DataValueField="fechaCaptura">
    </asp:DropDownList>&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton4" runat="server" Height="30px" 
        ImageUrl="~/imagenes/imprimir1.jpg" Width="31px" />
    <asp:SqlDataSource ID="SqlDataSourceFechasCaptura" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT eco.fechaCaptura
FROM [sireca].[dbo].[eco] eco, sireca .dbo .patrones as ptn
where ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)
and ptn.subdel=?
group by eco.fechaCaptura">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="000" Name="?" SessionField="SIRECAsubdel" />
        </SelectParameters>
    </asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceResultados" 
        AllowSorting="True" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="fechaEco" HeaderText="fechaEco" 
            SortExpression="fechaEco" />
        <asp:BoundField DataField="tipoECO" HeaderText="tipoECO" 
            SortExpression="tipoECO" />
        <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
            SortExpression="REG#PATRONAL" />
        <asp:BoundField DataField="incidencia" HeaderText="incidencia" 
            SortExpression="incidencia" />
        <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
            HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" />
        <asp:BoundField DataField="TP" HeaderText="TP" SortExpression="TP" />
        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
            SortExpression="CREDITO" />
        <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
            SortExpression="OMISION" />
        <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
            SortExpression="COP/ACT" />
        <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
            SortExpression="RECARGOS" />
        <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" />
        <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" />
        <asp:BoundField DataField="clave" HeaderText="clave" SortExpression="clave" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceResultados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
        SelectCommand="SELECT eco.id, ptn.sectores, eco.REG#PATRONAL, eco.TP, ptn.razonSocial, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco, eco.responsable, eco.fechaSeleccion, eco.cambiarIncidencia, eco.tipoECO, eco.diasDisponibles, eco.clave, eco.incidencia, eco.nomResponsable, eco.horaCitatorio, eco.fechaCaptura FROM sireca.dbo.eco AS eco CROSS JOIN sireca.dbo.patrones AS ptn WHERE (ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)) AND (ptn.subdel = ?) AND (fechaCaptura = ?) AND (eco.responsable = ?)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="?" 
                SessionField="SIRECAsubdel" />
            <asp:ControlParameter ControlID="DDLfechaCaptura" DefaultValue="000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter DefaultValue="00000" Name="?" SessionField="SIRECAuser" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


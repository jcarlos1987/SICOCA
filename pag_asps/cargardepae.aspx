<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="cargardepae.aspx.vb" Inherits="WebSIRECA.cargardepae" %>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
    </asp:DropDownList>
    <asp:Label ID="Label3" runat="server" Text="PERIODO: " Font-Bold="True"></asp:Label>
    <asp:DropDownList ID="DDLPeriodo" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSourcePeriodo" DataTextField="fechaEco" 
        DataValueField="fechaEco">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="SELECT DISTINCT eco.fechaEco FROM sireca.dbo.eco AS eco GROUP BY eco.fechaEco ORDER BY 1 DESC">
    </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="server" Height="400px" ScrollBars="Auto" 
        Width="100%">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSourcePAE" CellPadding="4" 
        Font-Size="10pt" ForeColor="#333333" GridLines="None" AllowSorting="True" 
            BackColor="White" EmptyDataText="Sin Resultados.">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" >
            <ItemStyle Font-Size="1pt" />
            </asp:BoundField>
            <asp:TemplateField ShowHeader="False" HeaderText="INSPECTOR" 
                SortExpression="responsable">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("responsable") %>'></asp:Label><br />
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceInspectores" DataTextField="nombre" 
                        DataValueField="id" Font-Size="9pt">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceInspectores" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT us.id, uf.nombre
FROM sireca.dbo.usuarios AS us INNER JOIN fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
WHERE (us.subdel =?) AND (us.user_type = '1')
ORDER BY 2">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                SortExpression="fechaEco" />
            <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                SortExpression="tipoEco" />
            <asp:BoundField DataField="sector" HeaderText="sector" 
                SortExpression="sector" />
            <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG.PATRONAL" 
                ReadOnly="True" SortExpression="REG#PATRONAL" />
            <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                HeaderText="NOMBRE O RAZON SOCIAL" ReadOnly="True" 
                SortExpression="NOMBRE O RAZON SOCIAL" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                SortExpression="CREDITO" />
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                SortExpression="COTIZANTES" />
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" SortExpression="IMPORTE" />
            <asp:BoundField DataField="incidencia" HeaderText="incidencia" 
                SortExpression="incidencia" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        DataSourceID="SqlDataSourceIncidenciaPAE" DataTextField="texto" 
                        DataValueField="valor" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSourceIncidenciaPAE" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as valor
      ,[ACTIVIDAD] as texto
  FROM [sireca].[dbo].[catalogo]
  where grupoPAE='1'"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#666633" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#669999" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>    
    <asp:SqlDataSource ID="SqlDataSourcePAE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT eco.id as id
, eco.sector
, eco.tipoEco, SUBSTRING(eco.REG#PATRONAL,1,10) AS [REG#PATRONAL]
, (eco.[NOMBRE O RAZON SOCIAL]) AS [NOMBRE O RAZON SOCIAL]
, eco.fechaCaptura as CAPTURADO
, datediff(day,eco.fechaCaptura,getdate()) as DIAS_
, eco.CREDITO
, eco.COTIZ as COTIZANTES
, eco.OMISION as IMPORTE
,eco.incidencia
, eco.fechaEco
,(SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=eco.responsable) as responsable
FROM sireca.dbo.eco AS eco 
WHERE eco.subdel = ?
and eco.incidencia='2'
and eco.fechaEco=?
and eco.fechaCaptura is not null
and datediff(day,eco.fechaCaptura,getdate())&gt;15
order by DIAS_">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Panel>
    <asp:Button ID="Button1" runat="server" Text="Guardar" />
</asp:Content>

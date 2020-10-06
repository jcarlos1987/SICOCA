<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/Site.Master" CodeBehind="AuAfil.aspx.vb" Inherits="WebSIRECA.AuAfil" %>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Panel ID="Panel1" runat="server" Height="350px" ScrollBars="Auto">    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceNoLoccalizados" 
            Font-Size="10pt" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id" 
                    SortExpression="id" InsertVisible="False" ReadOnly="True" >
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
                <asp:BoundField DataField="idEco" 
                    SortExpression="idEco" >
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="tipoECO" HeaderText="TIPO" 
                    SortExpression="tipoECO" />
                <asp:BoundField DataField="regpat" HeaderText="REG.PATRONAL" 
                    SortExpression="regpat" />
                <asp:BoundField DataField="dom" HeaderText="DOMICILIO" 
                    SortExpression="dom" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" 
                    SortExpression="NOMBRE O RAZON SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" />
                <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" />
                <asp:BoundField DataField="ACT#" HeaderText="ACT#" 
                    SortExpression="ACT#" />
                <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" 
                    SortExpression="PRIMA" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" DataFormatString="{0:C}" />
                <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" 
                    SortExpression="COP/ACT" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" 
                    SortExpression="MULTA" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" 
                    SortExpression="TOTAL" DataFormatString="{0:C}">
                </asp:BoundField>
                <asp:BoundField DataField="fechaCaptura" HeaderText="REGISTRO" 
                    SortExpression="fechaCaptura">
                <ItemStyle BackColor="#999966" />
                </asp:BoundField>
                <asp:BoundField DataField="idResponsable" HeaderText="INSPECTOR" 
                    SortExpression="idResponsable">
                <ItemStyle BackColor="#999966" />
                </asp:BoundField>
                <asp:BoundField DataField="idInvestigadopor" HeaderText="INVESTIGADOR" 
                    SortExpression="idInvestigadopor">
                <ItemStyle BackColor="#669999" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="incidencia" SortExpression="incidencia">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("incidencia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("incidencia") %>'></asp:Label><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSourceIncidencias" DataTextField="actividad" 
                            DataValueField="clave">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceIncidencias" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as clave
      ,[ACTIVIDAD] as actividad
  FROM [sireca].[dbo].[catalogo]
WHERE [grupoNoLocalizado]='1'
ORDER BY actividad"></asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle BackColor="#669999" />
                </asp:TemplateField>
                <asp:BoundField DataField="observaciones" HeaderText="observaciones" 
                    SortExpression="observaciones">
                <ItemStyle BackColor="#669999" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNoLoccalizados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT nl.[id]
	  ,eco.[fechaEco]
	  ,eco.[tipoECO]
      ,nl.[idEco]      
      ,nl.[incidencia]
      ,nl.[regpat]
	  ,ptn.[dom]
	  ,eco.[NOMBRE O RAZON SOCIAL]
      ,eco.[CREDITO]
      ,eco.[COTIZ]
      ,eco.[DIAS]
      ,eco.[CL]
      ,eco.[ACT#]
      ,eco.[PRIMA]
      ,eco.[OMISION]
      ,eco.[COP/ACT]
      ,eco.[RECARGOS]
      ,eco.[MULTA]
      ,eco.[TOTAL]
	  ,nl.[fechaCaptura]
      ,(SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=nl.[idResponsable]) as idResponsable
      ,nl.[observaciones]
      ,(SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where [id]=nl.[idInvestigadopor]) as idInvestigadopor
  FROM [sireca].[dbo].[patrones] AS ptn ,[sireca].[dbo].[nolocalizados] AS nl INNER JOIN [sireca].[dbo].[eco] AS eco ON eco.id LIKE nl.idEco
WHERE ptn.regpat=substring(nl.regpat,1,10) and eco.subdel=?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
        </asp:Panel>
    <asp:Button ID="Button1" runat="server" Text="Guardar" />
</asp:Content>    
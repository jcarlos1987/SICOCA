<%@ Page Language="vb" MasterPageFile ="~/Site.Master" AutoEventWireup="false" CodeBehind="NoLocalizados.aspx.vb" Inherits="WebSIRECA.NoLocalizados" %>

<asp:Content ID ="contentd1" runat ="server"  ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    <center>
        <asp:Label ID="Label1" runat="server" Text="Subdelegacion:" Font-Bold="True"></asp:Label>&nbsp;
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList></center><hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceNL" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            HorizontalAlign="Center" AllowSorting="True" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="FECH_CAPTURA" HeaderText="FECH_CAPTURA" 
                    SortExpression="FECH_CAPTURA" DataFormatString="{0:d}" ReadOnly="True" />
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" 
                    SortExpression="EJECUTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RFC" HeaderText="RFC" ReadOnly="True" 
                    SortExpression="RFC" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" 
                    SortExpression="RAZON" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" 
                    ReadOnly="True" SortExpression="COTIZ" DataFormatString="{0:N0}" />
                <asp:BoundField DataField="DOM" HeaderText="DOM" ReadOnly="True" 
                    SortExpression="DOM" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="LOC" HeaderText="LOC" 
                    ReadOnly="True" SortExpression="LOC" />
                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO">
                <ItemStyle HorizontalAlign="Right" />
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
        <asp:SqlDataSource ID="SqlDataSourceNL" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
max(FECH_CAP) as FECH_CAPTURA
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=id_responsable) as EJECUTOR
,REPLACE([REGPATR],'-','') AS REGPAT
,max(RFC)  AS RFC
,max(razonSocial)  AS RAZON
,max(ptn.cotiz) AS COTIZ
,max(dom) AS DOM
,max(loc) AS LOC
,sum(ADEUDO) as ADEUDO
  FROM [sirecacobros].[dbo].[ecoTiposHistorial] as eth left join sireca.dbo.patrones as ptn on regpat=substring(replace([REGPATR],'-',''),1,10)
  where inc_cap='09' and eth.subdel=?
  group by [REGPATR],id_responsable">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

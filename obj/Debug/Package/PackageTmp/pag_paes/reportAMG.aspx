<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="reportAMG.aspx.vb" Inherits="WebSIRECA.reportAMG" %>
<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
    
<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:Label ID="Label2" runat="server" Text="SUBDEL.:"></asp:Label>
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
    </asp:DropDownList>&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="TIPO:"></asp:Label>&nbsp;
    <asp:DropDownList ID="DDLTFile" runat="server">
        <asp:ListItem Value=" and tipofile in (-COP-,-RCV-)">TODOS</asp:ListItem>
        <asp:ListItem Value=" and tipofile in (-COP-)">COP</asp:ListItem>
        <asp:ListItem Value=" and tipofile in (-RCV-)">RCV</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;
    <asp:Button ID="BActualizar" runat="server" Text="Actualizar" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSourceRG" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" title="Detalles PATRONES" rel="gb_page_fs[]" runat="server" 
                        NavigateUrl='<%# "DetallesSeleccionAMGP.aspx?tipo=" & Eval("TIPO") & "&tipofile=" & Eval("TIPOFILE") & "&subdel=" & Eval("SUBDEL") & "&credito=" & Eval("CREDITO") & "&importe=" & Eval("IMPORTE") & "&patrones=" & Eval("PATRONES") %>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CREDITO" SortExpression="CREDITO">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" title="Detalles CREDITOS" rel="gb_page_fs[]" runat="server" NavigateUrl='<%# "DetallesSeleccionAMGPCRED.aspx?tipo=" & Eval("TIPO") & "&tipofile=" & Eval("TIPOFILE") & "&subdel=" & Eval("SUBDEL") & "&credito=" & Eval("CREDITO") & "&importe=" & Eval("IMPORTE") & "&patrones=" & Eval("PATRONES") %>' 
                        Text='<%# Eval("CREDITO", "{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" >
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
    <asp:SqlDataSource ID="SqlDataSourceRG" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @TF as varchar(50)
SET @TF=?
SELECT TIPO
,@TF as TIPOFILE
,count(distinct(regpatr)) as PATRONES
,count(numcred) as CREDITO
,case when TIPO='MULTAS' then (sum(adeudo)*0.1) else sum(adeudo) end as IMPORTE
,max(subdel) as SUBDEL
  FROM [sirecacobros].[dbo].[ecoTiposReporte]
  where subdel=?
  and tipofile in ('COP','RCV')
  group by tipo">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLTFile" DefaultValue="000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
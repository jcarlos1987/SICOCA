<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="addForaneos.aspx.vb" Inherits="WebSIRECA.addForaneos" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head"  >
<%--<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
    </script>

    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID ="cont" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<div class="btn-group input-prepend">
<span class="add-on">
        <asp:Label ID="Label2" runat="server" Text="PERIODO"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLMes" runat="server" 
            AutoPostBack="True" Width="120px" 
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
        <asp:DropDownList ID="DDLAnio" runat="server" 
            ToolTip="PERIODO" data-toggle="dropdown" 
                                AutoPostBack="True" Width="80px" 
                                CssClass="btn dropdown-toggle btn-small">
                            </asp:DropDownList>
</div> 
        <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [fechaEco]      
  FROM [sireca].[dbo].[eco]
where fechaEco is not null
group by fechaEco
order by 1 desc"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceForaneos" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" HorizontalAlign="Center" Caption="Patrones Foraneos" 
            AllowSorting="True" DataKeyNames="RUTA" Font-Size="10pt">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="RUTA" HeaderText="RUTA" 
                    SortExpression="RUTA" DataFormatString="Ruta {0}" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "setForaneas.aspx?ruta=" & Eval("RUTA") & "&fechaEco=" & Eval("fechaEco")  %>' 
                            Text='<%# Eval("PATRONES") %>' Target="_blank"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" ReadOnly="True" />
                <asp:BoundField DataField="OMISION" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="OMISION" />
                <asp:TemplateField HeaderText="RUTAS">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RUTA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DataList ID="DataList1" runat="server" 
                            DataSourceID="SqlDataSourceMunicipio" RepeatDirection="Horizontal" 
                            ShowFooter="False" ShowHeader="False">
                            <ItemTemplate> 
                                ,&nbsp;<asp:Label ID="municipioLabel" runat="server" Text='<%# Eval("municipio") %>' />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("RUTA") %>' />
                        <asp:SqlDataSource ID="SqlDataSourceMunicipio" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                            SelectCommand="SELECT [municipio]  FROM [sireca].[dbo].[foraneo] where ruta=?">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"/>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceForaneos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @FECHAECO FLOAT
SET @FECHAECO=?+''+?
SELECT fora.[ruta] AS RUTA,COUNT(*) AS PATRONES,SUM(eco.[COTIZ]) AS COTIZANTES,SUM(eco.[OMISION]) AS OMISION
,@FECHAECO as fechaEco
FROM [sireca].[dbo].[foraneo] AS fora INNER JOIN [sireca].[dbo].[eco] AS eco ON eco.[REG#PATRONAL] LIKE fora.claveForaneo+'%'
WHERE eco.[subdel] = ? AND eco.[fechaEco] = @FECHAECO  AND (eco.incidencia is null)
 and responsable is null
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
GROUP BY fora.[ruta]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="05" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>    
    </asp:Content>    

<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="pendientes.aspx.vb" Inherits="WebSIRECA.pendientesparaocr" %>

<asp:Content ID ="contend1"  runat ="server" ContentPlaceHolderID ="head" >
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="Content1"  runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
                    </asp:DropDownList><hr />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridViewEco" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceEco" AllowSorting="True" BorderStyle="Solid" 
                        BorderWidth="1px" CellPadding="1" CellSpacing="1" Font-Size="10pt" 
                        ShowFooter="True" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                SortExpression="SUBDEL" />
                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                SortExpression="INCIDENCIA" />
                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                HeaderText="PATRONES" SortExpression="PATRONES">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" rel="gb_page_fs[]" title="Detalles" runat="server" NavigateUrl='<%# "detallespendientes.aspx?subdel=" & Eval("SUBDEL") & "&tipo=" & Eval("TIPO") & "&inc=" & Eval("INCIDENCIAV") %>' 
                                        Target="_blank" Text='<%# Eval("CREDITOS") %>'></asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                HeaderText="IMPORTE" SortExpression="IMPORTE">
                            <ItemStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DIAS_MAXIMO" HeaderText="DIAS_MAXIMO" 
                                ReadOnly="True" SortExpression="DIAS_MAXIMO" DataFormatString="{0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#990000" />
                        <HeaderStyle BackColor="#F3C458" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceEco" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select 
subdel as SUBDEL
,tipoeco as TIPO
,incidencia as INCIDENCIAV
,(select '('+[CVE DILIG#]+')'+ACTIVIDAD from sireca.dbo.catalogo where [CVE DILIG#]=incidencia) as INCIDENCIA
,count(distinct(reg#patronal)) as PATRONES
,sum(cotiz) as COTIZANTES
,count(*) as CREDITOS
,sum(omision) as IMPORTE
,max(datediff(day,fechacaptura,getdate())) as DIAS_MAXIMO
from sireca.dbo.eco
where tipoeco in ('COP','COMP','RCV','RCVCOMP')
and incidencia in ('2','1') 
and datediff(day,fechacaptura,getdate())&gt;=19
and incidenciarale in ('01','02')
and subdel=?
and validacion='SIN PAGO'
group by subdel,tipoeco,incidencia
order by subdel,incidencia
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>

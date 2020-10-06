<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default41" %>

<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Label ID="Label3" runat="server" Text="CARGA DE SIVEPAS"></asp:Label>
    <asp:Label
        ID="Label4" runat="server" Text="(Archivo txt en zip.)" 
            Font-Italic="True" ForeColor="#FF3300"></asp:Label>
    <hr />
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" 
                        GroupingText="Como preparar el zip a subir" Height="310px" 
                        ScrollBars="Auto" BackColor="#8FB78E" BorderColor="#7EAC7D" BorderStyle="Solid" 
                        BorderWidth="1px" HorizontalAlign="Left">
                    <asp:Image ID="Image1" runat="server" 
                            ImageUrl="~/imagenes/cargas/CargarRalePaso1.jpg" />
                    <br />
                    <asp:Image ID="Image2" runat="server" 
                            ImageUrl="~/imagenes/cargas/CargarRalePaso2.jpg" />
                </asp:Panel>
            </td>
            <td rowspan="3">
                <table style="width:100%;">
                    <tr align="left">
                        <td bgcolor="#BCC7D8">TIPO:<asp:DropDownList ID="DDLTipoSivepa" runat="server" 
                                BackColor="#BCC7D8" Width="250px">
                            <asp:ListItem Value="-">-seleccione-</asp:ListItem>
                            <asp:ListItem Value="SIVEPA_EXTEM">EXTEMPORANEO</asp:ListItem>
                            <asp:ListItem Value="SIVEPA_OPORT">OPORTUNO</asp:ListItem>
                            <asp:ListItem Value="SIVEPA_ANUAL">ANUAL</asp:ListItem>
                            </asp:DropDownList><br />
                            <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px" Width="230px" BackColor="#BCC7D8" />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Cargar" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px" Width="290px" />
                            <br />
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#009900"></asp:Label>
                            <br />
                        </td>
                        <td>
                                &nbsp;</td>
                        <td>
                                &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                                    Width="290px">
                            </asp:DropDownList>
                        </td>
                        <td>
                                &nbsp;</td>
                        <td>
                                &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewCOP" runat="server" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                    Caption="&lt;strong&gt;ULTIMOS SIVEPAS COP CARGADOS&lt;/strong&gt;" 
                                    CellPadding="3" DataSourceID="SqlDataSourceCOP" ForeColor="Black" 
                                    GridLines="Vertical" ShowHeader="False" Width="250px">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                            SortExpression="SUBDEL" ReadOnly="True" />
                                    <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" 
                                            ReadOnly="True" SortExpression="SIVEPA" />
                                    <asp:BoundField DataField="FECHA" DataFormatString="{0:d}" HeaderText="FECHA" 
                                        ReadOnly="True" SortExpression="FECHA" />
                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                        SortExpression="PERIODO" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceCOP" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    
                                
                                
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 10 *
FROM (
SELECT 
distinct
[SV_SUBDEL] as SUBDEL
,(case 
when [SV_TIPO]='SIVEPA_EXTEM' then 'EXTEMPORANEO' 
when [SV_TIPO]='SIVEPA_ANUAL' then 'ANUAL' 
else 'OPORTUNO' 
end) as SIVEPA
,[SV_FECHA] as FECHA
,substring(convert(nvarchar(10),[SV_PERIODO],103),4,7) as PERIODO
,convert(datetime,convert(varchar,SV_FECH_CARGA,103)) as SV_FECH_CARGA
FROM [sirecasivepas].[dbo].[SV_BASE]
WHERE [SV_SUBDEL]=? and [SV_SIVEPA]='SIVEPA-IMSS'
) as resultado
order by SV_FECH_CARGA desc
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
                            <asp:GridView ID="GridViewRCV" runat="server" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                    Caption="&lt;strong&gt;ULTIMOS SIVEPAS RCV CARGADOS&lt;/strong&gt;" 
                                    CellPadding="3" DataSourceID="SqlDataSourceRCV" ForeColor="Black" 
                                    GridLines="Vertical" ShowHeader="False" Width="250px">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                            SortExpression="SUBDEL" ReadOnly="True" />
                                    <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" 
                                            ReadOnly="True" SortExpression="SIVEPA" />
                                    <asp:BoundField DataField="FECHA" DataFormatString="{0:d}" HeaderText="FECHA" 
                                        ReadOnly="True" SortExpression="FECHA" />
                                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                        SortExpression="PERIODO" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceRCV" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    
                                
                                
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 10 *
FROM (
SELECT 
distinct
[SV_SUBDEL] as SUBDEL
,(case 
when [SV_TIPO]='SIVEPA_EXTEM' then 'EXTEMPORANEO'
when [SV_TIPO]='SIVEPA_ANUAL' then 'ANUAL' 
else 'OPORTUNO' end) as SIVEPA
,[SV_FECHA] as FECHA
,substring(convert(nvarchar(10),[SV_PERIODO],103),4,7) as PERIODO
,convert(datetime,convert(varchar,SV_FECH_CARGA,103)) as SV_FECH_CARGA
FROM [sirecasivepas].[dbo].[SV_BASE]
WHERE [SV_SUBDEL]='01' and [SV_SIVEPA]='SIVEPA-IMSS'
) as resultado
order by SV_FECH_CARGA desc">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                            PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <br />
                            <br />
                        </td>
                        <td>
                                &nbsp;</td>
                        <td>
                                &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
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
        </tr>
    </table>
</asp:Content>

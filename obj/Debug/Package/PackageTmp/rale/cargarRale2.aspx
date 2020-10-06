<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="cargarRale2.aspx.vb" Inherits="WebSIRECA.cargarRale2" %>
<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Label ID="Label3" runat="server" Text="CARGA DEL RALE"></asp:Label><asp:Label
        ID="Label4" runat="server" Text="(Archivo Nativo generado por el sistema en zip.)" 
            Font-Italic="True" ForeColor="#FF3300"></asp:Label><hr />
        <table style="width:100%;">
            <tr>
                <td>                    
                    <asp:Panel ID="Panel1" runat="server" 
                        GroupingText="Como preparar el zip a subir" Height="310px" 
                        ScrollBars="Auto" BackColor="#8FB78E" BorderColor="#7EAC7D" BorderStyle="Solid" 
                        BorderWidth="1px" HorizontalAlign="Left">
                        <asp:Image ID="Image1" runat="server" 
                            ImageUrl="~/imagenes/cargas/CargarRalePaso1.jpg" /><br />
                        <asp:Image ID="Image2" runat="server" 
                            ImageUrl="~/imagenes/cargas/CargarRalePaso2.jpg" />
                    </asp:Panel>
                </td>
                <td rowspan="3">
                    <table style="width:100%;">
                    <tr align="left">
                            <td>
                                
     <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px" Width="230px" /><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Cargar" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px" Width="230px" />
                                <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#009900"></asp:Label>
                                
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                                    Width="230px">
                                </asp:DropDownList>
                                <asp:LinkButton ID="LinkButton5" runat="server"><i class="icon-envelope"></i></asp:LinkButton>
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
                                    Caption="&lt;strong&gt;ULTIMOS RALES COP CARGADOS&lt;/strong&gt;" 
                                    CellPadding="3" DataSourceID="SqlDataSourceCOP" ForeColor="Black" 
                                    GridLines="Vertical" ShowHeader="False" Width="250px">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="subdel" HeaderText="subdel" 
                                            SortExpression="subdel" />
                                        <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="fecha" 
                                            ReadOnly="True" SortExpression="fecha" />
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
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 3 [name] as nombre    
,convert(datetime,[fecha],103) as fecha
,subdel
FROM [rale].[dbo].[tablas]
where subdel=? and tipo ='COP'
order by 2 desc">
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
                                    Caption="&lt;strong&gt;ULTIMOS RALES RCV CARGADOS&lt;/strong&gt;" 
                                    CellPadding="3" DataSourceID="SqlDataSourceRCV" ForeColor="Black" 
                                    GridLines="Vertical" ShowHeader="False" Width="250px">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="subdel" HeaderText="subdel" 
                                            SortExpression="subdel" />
                                        <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="fecha" 
                                            ReadOnly="True" SortExpression="fecha" />
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
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 3 [name] as nombre    
,convert(datetime,[fecha],103) as fecha
,subdel
FROM [rale].[dbo].[tablas]
where subdel=? and tipo ='RCV'
order by 2 desc">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSourceRaleJuridico" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    
                                    
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="USE RALE
--GO*/
DROP TABLE rale.dbo.ralesjuridico

CREATE TABLE rale.[dbo].[ralesjuridico](
	[REGPATR] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[SUBDEL] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[NUMCRED] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[TD] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[IMPORTE] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[PERIODO] DATETIME NULL
) ON [PRIMARY]
GRANT ALTER ON [dbo].[ralesjuridico] TO [juridico]
GRANT CONTROL ON [dbo].[ralesjuridico] TO [juridico]
GRANT DELETE ON [dbo].[ralesjuridico] TO [juridico]
GRANT INSERT ON [dbo].[ralesjuridico] TO [juridico]
GRANT REFERENCES ON [dbo].[ralesjuridico] TO [juridico]
GRANT SELECT ON [dbo].[ralesjuridico] TO [juridico]
GRANT TAKE OWNERSHIP ON [dbo].[ralesjuridico] TO [juridico]
GRANT UPDATE ON [dbo].[ralesjuridico] TO [juridico]
GRANT VIEW DEFINITION ON [dbo].[ralesjuridico] TO [juridico]

DECLARE @TABLA3301ACOP SYSNAME
DECLARE @TABLA3301ARCV SYSNAME
DECLARE @TABLA3333ACOP SYSNAME
DECLARE @TABLA3333ARCV SYSNAME

SET @TABLA3301ACOP = (SELECT TOP 1 [name] FROM [rale].[dbo].[tablas] where [subdel]='01' and [tipo]='COP' order by [fecha] desc)
SET @TABLA3301ARCV = (SELECT TOP 1 [name] FROM [rale].[dbo].[tablas] where [subdel]='01' and [tipo]='RCV' order by [fecha] desc)
SET @TABLA3333ACOP = (SELECT TOP 1 [name] FROM [rale].[dbo].[tablas] where [subdel]='33' and [tipo]='COP' order by [fecha] desc)
SET @TABLA3333ARCV = (SELECT TOP 1 [name] FROM [rale].[dbo].[tablas] where [subdel]='33' and [tipo]='RCV' order by [fecha] desc)

DECLARE @SQLString NVARCHAR(MAX)

SET @SQLString = N'insert into rale.dbo.ralesjuridico '
				+ 'SELECT REGPATR,'+'3301'+' AS SUBDEL,NUMCRED,TD,IMPORTE,PERIODO FROM ['+ @TABLA3301ACOP + ']'
				+ ' UNION '
				+ 'SELECT REGPATR,'+'3301'+' AS SUBDEL,NUMCRED,TD,IMPORTE,PERIODO FROM ['+ @TABLA3301ARCV + ']'
				+ ' UNION '
				+ 'SELECT REGPATR,'+'3333'+' AS SUBDEL,NUMCRED,TD,IMPORTE,PERIODO FROM ['+ @TABLA3333ACOP + ']'
				+ ' UNION '
				+ 'SELECT REGPATR,'+'3333'+' AS SUBDEL,NUMCRED,TD,IMPORTE,PERIODO FROM ['+ @TABLA3333ARCV + ']'		
EXEC sp_executesql @SQLString

select 'CARGADO' as estatus"></asp:SqlDataSource>
                                <asp:GridView ID="GridViewJuridico" runat="server" 
                                    DataSourceID="SqlDataSourceRaleJuridico">
                                </asp:GridView>
                                <br /><br />
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
    <br />
        <br />
    </div>
</asp:Content>

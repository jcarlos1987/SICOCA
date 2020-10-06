<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master"  AutoEventWireup="false" CodeBehind="cargareco2.aspx.vb" Inherits="WebSIRECA.cargareco2" %>

<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Label ID="Label3" runat="server" Text="CARGA DEL LA E.C.O."></asp:Label><asp:Label
        ID="Label4" runat="server" Text="(Archivo Nativo en zip.)" 
            Font-Italic="True" ForeColor="#FF3300"></asp:Label><hr />
        <table style="width:100%;">
            <tr>
                <td>                    
                    <asp:Panel ID="Panel1" runat="server" 
                        GroupingText="Como preparar el zip a subir" Height="310px" 
                        ScrollBars="Auto" BackColor="#8FB78E" BorderColor="#7EAC7D" BorderStyle="Solid" 
                        BorderWidth="1px" HorizontalAlign="Left">
                        <asp:Image ID="Image1" runat="server" 
                            ImageUrl="~/imagenes/cargas/CargarEcoPaso1.png" /><br />
                    </asp:Panel>
                </td>
                <td rowspan="3">
                    <table style="width:100%;">
                    <tr align="left">
                            <td>Cifra Control:
                                <asp:TextBox ID="TBCifraControl" runat="server" MaxLength="6" Width="100px"></asp:TextBox>
                                <br />
                                <asp:DropDownList ID="DDLTipoEco" runat="server">
                                    <asp:ListItem Value="----">-seleccionar el tipo-</asp:ListItem>
                                    <asp:ListItem Value="ESTR">Estrategico</asp:ListItem>
                                    <asp:ListItem Value="COMP">Complemento</asp:ListItem>
                                </asp:DropDownList>
                                <br />
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
                                    Caption="&lt;strong&gt;ULTIMOS E.C.O.'s CARGADOS&lt;/strong&gt;" 
                                    CellPadding="3" DataSourceID="SqlDataSourceCOP" ForeColor="Black" 
                                    GridLines="Vertical" ShowHeader="False" Width="250px">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                            SortExpression="SUBDEL" ReadOnly="True" />
                                        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                                            ReadOnly="True" SortExpression="PERIODO" />
                                        <asp:BoundField DataField="ECO" HeaderText="ECO" ReadOnly="True" 
                                            SortExpression="ECO" />
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
                                    
                                    
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
select * from (
SELECT TOP 10 subdel as SUBDEL
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,tipoeco as ECO
FROM [sireca].[dbo].[eco]
WHERE tipoeco in ('COP','COMP')
and subdel=@SUBDEL
group by subdel,fechaeco,tipoeco
order by convert(datetime,'01/'+(
case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
),103) desc) as x

union all
select * from (
SELECT TOP 10 subdel as SUBDEL
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,tipoeco as ECO
FROM [sireca].[dbo].[eco]
WHERE tipoeco in ('RCV','RCVCOMP')
and subdel=@SUBDEL
group by subdel,fechaeco,tipoeco
order by convert(datetime,'01/'+(
case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
),103) desc) as y
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
                                <br /><br /><br />
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

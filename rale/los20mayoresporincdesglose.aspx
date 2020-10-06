<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="los20mayoresporincdesglose.aspx.vb" Inherits="WebSIRECA.los20mayoresporincdesglose" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
        <ProgressTemplate>
            <asp:Panel ID="Panel2" runat="server" BackColor="#FF9933" 
                HorizontalAlign="Center">
            <asp:Label ID="Label1" runat="server" Text="CARGANDO..." Font-Bold="True"></asp:Label>
            </asp:Panel>
        </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
<div class="btn-group input-prepend">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True" CssClass="btn dropdown-toggle" Width="130px">
                            </asp:DropDownList>
<span class="add-on">
                            E.C.O.:
</span>
                            <asp:DropDownList ID="DDLEco" runat="server" 
            AutoPostBack="True" CssClass="btn dropdown-toggle" Width="100px">
                                <asp:ListItem Value="%">TODO</asp:ListItem>
                                <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                                <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                            </asp:DropDownList>
</div>
</asp:Panel>
                            <asp:GridView ID="GridViewMayores" runat="server" AllowSorting="True" 
                                AutoGenerateColumns="False" DataSourceID="SqlDataSourceMayores" 
                                HorizontalAlign="Center" ShowFooter="True">
                                <Columns>
                                    <asp:BoundField DataField="SIBDEL" HeaderText="SIBDEL" ReadOnly="True" 
                                        SortExpression="SIBDEL" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                                        DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                                        DataTextField="REGPAT" HeaderText="REGPAT" SortExpression="REGPAT" />
                                    <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                                        SortExpression="RAZON" />
                                    <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                        SortExpression="INC" />
                                    <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                        SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                                        SortExpression="PERIODOS" DataFormatString="{0:N0}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                        SortExpression="IMPORTE" DataFormatString="{0:C}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                        SortExpression="TIPO" />
                                </Columns>
                                <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
                            <asp:SqlDataSource ID="SqlDataSourceMayores" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALERCV01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @RALERCV33 as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @REGPAT='%'
SET @TIPO_COP_RCV=?
SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALERCV01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='RCV' order by fecha desc)
--and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
exec('
select 
om_subdel as SIBDEL
,om_regpat as REGPAT
,ptn.razonSocial as RAZON
,(select ''(''+incr.inc + '')'' + incr.descripcion from sireca.dbo.inc_rale as incr where incr.inc=rale.INC) as INC
,count((NUMCRED)) as CREDITOS
,count(distinct(PERIODO)) as PERIODOS
,sum([IMPORTE]) as IMPORTE
,rale.TIPO
from sirecacobros.dbo.patronesomitirresumeninc left join (
select ''RCV'' as TIPO,''01'' as RSUBDEL,* from [rale].[dbo].['+@RALERCV01+'] 
union all 
select ''COP'' as TIPO,''01'' as RSUBDEL,* from [rale].[dbo].['+@RALECOP01+']
union all
select ''RCV'' as TIPO,''33'' as RSUBDEL,* from [rale].[dbo].['+@RALERCV33+'] 
union all 
select ''COP'' as TIPO,''33'' as RSUBDEL,* from [rale].[dbo].['+@RALECOP33+']
) as rale on replace(REGPATR,''-'','''')=om_regpat
left join sireca.dbo.patrones as ptn on ptn.regpat=om_regpat
where om_subdel like '''+@SUBDEL+''' and RSUBDEL like '''+@SUBDEL+''' and TIPO like '''+@TIPO_COP_RCV+'''
and replace(REGPATR,''-'','''') like '''+@REGPAT+'''
group by om_subdel,om_regpat,ptn.razonSocial,rale.TIPO,INC
order by regpat,inc
')
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DDLEco" DefaultValue="COP" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
</asp:Content>

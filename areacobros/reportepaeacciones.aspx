<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master"  CodeBehind="reportepaeacciones.aspx.vb" Inherits="WebSIRECA.reportepaeacciones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="contenido2" runat ="server" ContentPlaceHolderID="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">        
                                <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                                <asp:DropDownList ID="DDLTipoEco" runat="server">
                                    <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                                    <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                                    <asp:ListItem Value="%">TODOS</asp:ListItem>
                                </asp:DropDownList>
                            &nbsp;DILIGENCIADOS DE
                <asp:TextBox ID="TBFechIni" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="caext1" runat="server" TargetControlID="TBFechIni" Format="dd/MM/yyyy"></asp:CalendarExtender>
&nbsp;AL
                <asp:TextBox ID="TBFechFin" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="caext2" runat="server" TargetControlID="TBFechFin" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" BackColor="#FFF3CD">&nbsp;&nbsp;ACTUALIZAR&nbsp;&nbsp;</asp:LinkButton>
                                </asp:Panel>
                                <hr />
        <asp:GridView ID="GridViewReportePae" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceReportePae" HorizontalAlign="Center" 
                                    AllowSorting="True" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                                    CellSpacing="1">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField DataField="AC_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="AC_SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                    SortExpression="PERIODOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField SortExpression="id_inspector">
                    
                    <ItemTemplate>                        
                        <asp:HiddenField ID="HFIdInspector" runat="server" Value='<%# Eval("id_inspector") %>' />
                        <asp:GridView ID="GridViewDiliInspec" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="SqlDataSourceDiliInspec" 
                            AllowSorting="True" Font-Size="10pt">
                            <Columns>
                                <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                    SortExpression="DILIGENCIA" />
                                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceDiliInspec" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @USUARIO as VARCHAR(6)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @TIPO_ECO as VARCHAR(5)
SET @SUBDEL=?
SET @USUARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
select
(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA]) as DILIGENCIA
,count(distinct([AC_RA_REGPATR])) as PATRONES
,count(distinct([AC_RA_NUMCRED])) as CREDITOS
,sum([RA_IMPORTE]) as IMPORTE
from [sirecacobros].[dbo].[CO_ACCIONES] inner join [sirecacobros].[dbo].[CO_RALE] on RA_ID=AC_RA_ID
where [AC_SUBDEL]=@SUBDEL and [AC_CP_INSPEC]=@USUARIO
and RA_TIPO like @TIPO_ECO
and [AC_FECH_DILIGENCIA] between @FECH_INI and @FECH_FIN
group by AC_DILIGENCIA

">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HFIdInspector" DefaultValue="99999" Name="?" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="ECO" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceReportePae" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @AREA as VARCHAR(2) -- 1=EMISION, 2=COBROS
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @TIPO_ECO as VARCHAR(5)
SET @SUBDEL=?
SET @AREA=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @TIPO_ECO=?
IF @AREA='1'
begin
SELECT 
[AC_SUBDEL]
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[AC_CP_INSPEC]) as INSPECTOR
,count(distinct([AC_RA_REGPATR])) as PATRONES
,count(distinct([AC_RA_NUMCRED])) as CREDITOS
,count(distinct([AC_RA_PERIODO])) as PERIODOS
,[AC_CP_INSPEC] as id_inspector
,sum([RA_IMPORTE]) as IMPORTE
FROM [sirecacobros].[dbo].[CO_ACCIONES] inner join [sirecacobros].[dbo].[CO_RALE] on RA_ID=AC_RA_ID
where ac_subdel=@SUBDEL
and RA_TIPO like @TIPO_ECO
and [AC_FECH_DILIGENCIA] between @FECH_INI and @FECH_FIN
and exists(select us.id from sireca.dbo.usuarios as us where us.id=[AC_CP_INSPEC] and user_type='1')
group by [AC_SUBDEL],[AC_CP_INSPEC]
end
else 
begin
SELECT 
[AC_SUBDEL]
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[AC_CP_INSPEC]) as INSPECTOR
,count(distinct([AC_RA_REGPATR])) as PATRONES
,count(distinct([AC_RA_NUMCRED])) as CREDITOS
,count(distinct([AC_RA_PERIODO])) as PERIODOS
,[AC_CP_INSPEC] as id_inspector
,sum([RA_IMPORTE]) as IMPORTE
FROM [sirecacobros].[dbo].[CO_ACCIONES] inner join [sirecacobros].[dbo].[CO_RALE] on RA_ID=AC_RA_ID
where ac_subdel=@SUBDEL
and RA_TIPO like @TIPO_ECO
and [AC_FECH_DILIGENCIA] between @FECH_INI and @FECH_FIN
and exists(select us.id from sireca.dbo.usuarios as us where us.id=[AC_CP_INSPEC] and userpae2='1')
group by [AC_SUBDEL],[AC_CP_INSPEC]
end
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="tipo" />
                <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DDLTipoEco" DefaultValue="ECO" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>

</asp:Content>

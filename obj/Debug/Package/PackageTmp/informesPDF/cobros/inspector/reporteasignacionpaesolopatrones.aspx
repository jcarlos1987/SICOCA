<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="reporteasignacionpaesolopatrones.aspx.vb" Inherits="WebSIRECA.reporteasignacionpaesolopatrones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <asp:Panel ID="PanelHerramientas" runat="server" HorizontalAlign="Center">
    <div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
            AutoPostBack="True" Width="120px">
        </asp:DropDownList>
    </div> 
    </asp:Panel>
    <asp:Panel ID="PanelReporte" runat="server" HorizontalAlign="Center">    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceUltimasAsig" HorizontalAlign="Center" 
            Width="100%" AllowPaging="True" PageSize="5">
            <Columns>
                <asp:BoundField DataField="FECHA_ASIGNACION" DataFormatString="{0:d}" 
                    HeaderText="ULTIMAS ASIGNACIONES" ReadOnly="True" 
                    SortExpression="FECHA_ASIGNACION" />
                <asp:TemplateField HeaderText="INSPECTORES" SortExpression="FECHA_ASIGNACION">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value ='<%# Eval("FECHA_ASIGNACION") %>' />
                        
                        <asp:Repeater ID="Repeater1" runat="server" 
                            DataSourceID="SqlDataSourceInspecAsignado">
                            <ItemTemplate >
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick='<%# "javascript:window.open(""rep_paesolopatrones.aspx" & Eval("urlv") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>'  Text='<%# Eval("INSPECTOR") %>' ></asp:LinkButton>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSourceInspecAsignado" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_ASIG AS VARCHAR(10)
SET @SUBDEL=?
SET @FECHA_ASIG=?

SELECT 
'?subdel='+@SUBDEL+'&amp;fecha='+@FECHA_ASIG+'&amp;inspector='+convert(varchar,CP_INSPEC) as urlv
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=CP_INSPEC) as INSPECTOR
FROM [sirecacobros].[dbo].[CO_CPATRONAL]
where CP_SUBDEL=@SUBDEL
and convert(nvarchar(10),[CP_FECH_ASIG],103)=convert(nvarchar(10),@FECHA_ASIG,103)
group by CP_INSPEC
order by CP_INSPEC
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="01/01/2000" 
                                    Name="?" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
            <PagerSettings Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceUltimasAsig" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 20 (convert(datetime,convert(nvarchar(10),[CP_FECH_ASIG],103),103)) as FECHA_ASIGNACION
FROM [sirecacobros].[dbo].[CO_CPATRONAL]
where CP_SUBDEL=?
and [CP_FECH_ASIG] is not null
group by convert(datetime,convert(nvarchar(10),[CP_FECH_ASIG],103),103)
order by convert(datetime,convert(nvarchar(10),[CP_FECH_ASIG],103),103) desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

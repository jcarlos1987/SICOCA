<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="reportecuatrimestre.aspx.vb" Inherits="WebSIRECA.reportecuatrimestre" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
    <asp:DropDownList ID="DDLSubdel" runat="server" 
                           AutoPostBack="True">
                        </asp:DropDownList>
                        TIPO DE E.C.O.:<asp:DropDownList ID="DropDownListTIPO" runat="server" 
                        AutoPostBack="True">
                        <asp:ListItem Value="%">TODOS</asp:ListItem>
                        <asp:ListItem Value="CO">C.O.P.</asp:ListItem>
                        <asp:ListItem Value="RC">R.C.V.</asp:ListItem>
                    </asp:DropDownList>
                    PERIODO:
                        <asp:DropDownList ID="DDLMes" runat="server">
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
                    <asp:DropDownList ID="DDLAnio" runat="server">
                    </asp:DropDownList>
                        &nbsp;al
                        <asp:DropDownList ID="DDLMes0" runat="server">
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
                    <asp:DropDownList ID="DDLAnio0" runat="server">
                    </asp:DropDownList>
                        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Height="19px">&nbsp;ACTUALIZAR&nbsp;</asp:LinkButton>
                        <asp:LinkButton ID="LBExportar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" 
            Height="19px">&nbsp;EXPORTAR&nbsp;</asp:LinkButton>
                        <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource1" Font-Size="9pt" HorizontalAlign="Center" 
            AllowSorting="True" Caption="&lt;strong&gt;REPORTE GENERAL&lt;/strong&gt;" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("urlv", "reportecuatrimestredetalles.aspx{0}") %>' 
                            Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @PER_INI as VARCHAR(10)
DECLARE @PER_FIN as VARCHAR(10)
DECLARE @TIPO_ECO as VARCHAR(3)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @PER_INI='01/'+?+'/'+?
SET @PER_FIN='01/'+?+'/'+?
SET @TIPO_ECO=?
SELECT subdel as SUBDEL
,'?patrones='+convert(varchar,count(distinct(regpat)))+'&amp;periodo='+periodo+'&amp;periodo_ini='+@PER_INI+'&amp;periodo_fin='+@PER_FIN+'&amp;subdel='+@SUBDEL+'&amp;inspector=%&amp;tipoeco='+@TIPO_ECO as urlv
,'...' as INSPECTOR
,periodo as PERIODO
--,eco as TIPO
,count(distinct(regpat)) as PATRONES
,sum(cotiz) as COTIZANTES
,count(credito) as CREDITOS
,sum(omision) as IMPORTE
FROM sireca.[dbo].[ecocontrol]
where validacion='SIN PAGO'
and subdel=@SUBDEL
and convert(datetime,'01/'+periodo,103) between @PER_INI and @PER_FIN
and (inc_rale not in ('34','43','09','32','05','52','19'))
and (inc not in ('9','60') or inc is null)
and eco like @TIPO_ECO+'%'
group by subdel,periodo,validacion
order by SUBDEL,convert(datetime,'01/'+PERIODO)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownListTIPO" DefaultValue="ECO" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource2" Font-Size="9pt" HorizontalAlign="Center" 
            AllowSorting="True" 
            Caption="&lt;strong&gt;REPORTE POR INSPECTOR&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODOS" ReadOnly="True" 
                    SortExpression="PERIODO" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                    DataNavigateUrlFormatString="reportecuatrimestredetalles.aspx{0}" 
                    DataTextField="PATRONES" DataTextFormatString="{0:N0}" HeaderText="PATRONES" 
                    SortExpression="PATRONES" Target="_blank">
                <ItemStyle HorizontalAlign="Right" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @PER_INI as VARCHAR(10)
DECLARE @PER_FIN as VARCHAR(10)
DECLARE @TIPO_ECO as VARCHAR(3)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @PER_INI='01/'+?+'/'+?
SET @PER_FIN='01/'+?+'/'+?
SET @TIPO_ECO=?
SELECT subdel as SUBDEL
,'?patrones='+convert(varchar,count(distinct(regpat)))+'&amp;periodo=rango&amp;periodo_ini='+@PER_INI+'&amp;periodo_fin='+@PER_FIN+'&amp;subdel='+@SUBDEL+'&amp;inspector='+convert(nvarchar,case when inspector is null then 'SIN ASIGNACION' else inspector end)+'&amp;tipoeco='+@TIPO_ECO as urlv
,(case when (select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=inspector) is null then 'SIN ASIGNACION' else upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=inspector)) end) as INSPECTOR
,count(distinct(periodo)) as PERIODO
,count(distinct(regpat)) as PATRONES
,sum(cotiz) as COTIZANTES
,count(credito) as CREDITOS
,sum(omision) as IMPORTE
FROM sireca.[dbo].[ecocontrol] 
where 
validacion='SIN PAGO'
and subdel=@SUBDEL
and convert(datetime,'01/'+periodo,103) between @PER_INI and @PER_FIN
and (inc_rale not in ('34','43','09','32','05','52','19'))
and (inc not in ('9','60') or inc is null)
--periodo in ('42013')
and eco like @TIPO_ECO+'%'
group by subdel,inspector,validacion
order by 1,2
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownListTIPO" DefaultValue="ECO" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource3" Font-Size="9pt" HorizontalAlign="Center" 
            AllowSorting="True" 
            Caption="&lt;strong&gt;REPORTE A DETALLE POR INSPECTOR&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                    DataNavigateUrlFormatString="reportecuatrimestredetalles.aspx{0}" 
                    DataTextField="PATRONES" DataTextFormatString="{0:N0}" HeaderText="PATRONES" 
                    SortExpression="PATRONES" Target="_blank">
                <ItemStyle HorizontalAlign="Right" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @PER_INI as VARCHAR(10)
DECLARE @PER_FIN as VARCHAR(10)
DECLARE @TIPO_ECO as VARCHAR(3)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @PER_INI='01/'+?+'/'+?
SET @PER_FIN='01/'+?+'/'+?
SET @TIPO_ECO=?
SELECT subdel as SUBDEL
,'?patrones='+convert(varchar,count(distinct(regpat)))+'&amp;periodo='+periodo+'&amp;periodo_ini='+@PER_INI+'&amp;periodo_fin='+@PER_FIN+'&amp;subdel='+@SUBDEL+'&amp;inspector='+convert(nvarchar,case when inspector is null then 'SIN ASIGNACION' else inspector end)+'&amp;tipoeco='+@TIPO_ECO as urlv
,(case when (select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=inspector) is null then 'SIN ASIGNACION' else upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=inspector)) end) as INSPECTOR
,periodo as PERIODO
,count(distinct(regpat)) as PATRONES
,sum(cotiz) as COTIZANTES
,count(credito) as CREDITOS
,sum(omision) as IMPORTE
FROM sireca.[dbo].[ecocontrol]
where validacion='SIN PAGO'
and subdel=@SUBDEL
and eco like @TIPO_ECO+'%'
and convert(datetime,'01/'+periodo,103) between @PER_INI and @PER_FIN
and (inc_rale not in ('34','43','09','32','05','52','19'))
and (inc not in ('9','60') or inc is null)
group by subdel,inspector,periodo,validacion
order by SUBDEL,convert(datetime,'01/'+PERIODO)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownListTIPO" DefaultValue="ECO" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

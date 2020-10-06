<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master"  CodeBehind="generalresumen.aspx.vb" Inherits="WebSIRECA.generalresumen" %>
<asp:Content ID ="contedtHead" runat ="server" ContentPlaceHolderID ="head" >
<%--<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />--%>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />    

    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <%--<script src="../bootstrap/js/jquery-1.10.1.min.js" type="text/javascript"></script>--%>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate ><center >CARGANDO...</center></ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate >
            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
<div class="btn-group input-prepend">
                    <asp:DropDownList ID="DDLSubdel" runat="server" Width="100px" 
                           AutoPostBack="True" CssClass="btn dropdown-toggle btn-small">
                        </asp:DropDownList>
                    <asp:DropDownList ID="DDLInspector" runat="server" Width="210px" 
                        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
                        DataValueField="valor" CssClass="btn dropdown-toggle btn-small">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLMes" runat="server" Width="130px" 
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
                    <asp:DropDownList ID="DDLAnio" runat="server" Width="100px" 
                        CssClass="btn dropdown-toggle btn-small">
                    </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label4" runat="server" Text="A"></asp:Label>
</span>
                        <asp:DropDownList ID="DDLMes0" runat="server" Width="130px" 
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
                    <asp:DropDownList ID="DDLAnio0" runat="server" Width="100px" 
                        CssClass="btn dropdown-toggle btn-small">
                    </asp:DropDownList>
                        <asp:LinkButton ID="LBActualizar" runat="server" CssClass="btn" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" OnClientClick="javascript:window.print();"><i class="icon-print"></i>&nbsp;IMPRIMIR</asp:LinkButton>
</div> 
                        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USUARIO_TIPO as VARCHAR(3)
DECLARE @USUARIO_ID as VARCHAR(5)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_INSPECTOR as VARCHAR(50)
DECLARE @TIPO_INSPECTORV as VARCHAR(1)
SET @USUARIO_TIPO=?
SET @USUARIO_ID=?
SET @SUBDEL=?
SET @TIPO_INSPECTORV=?
if @TIPO_INSPECTORV='1'
begin 
SET @TIPO_INSPECTOR='INSPECTOR A'
end
else
begin
SET @TIPO_INSPECTOR='INSPECTOR B EJECUCION FISCAL'
end
IF @USUARIO_TIPO='0'
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1') and substring(chmod,13,1)='x'
	and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) in (@TIPO_INSPECTOR)
	order by texto
end
else 
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1') and substring(chmod,13,1)='x'
	and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) in (@TIPO_INSPECTOR)
	and sire.id=@USUARIO_ID
	order by texto
end
">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="999" Name="?" 
                                    SessionField="SIRECAuser_type" />
                                <asp:SessionParameter DefaultValue="999" Name="?" SessionField="SIRECAid" />
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="tipo" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                        </asp:Panel>
    
        <asp:GridView ID="GridViewResumen1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceR3" AllowSorting="True" HorizontalAlign="Center" 
                        Font-Size="10pt" ShowFooter="True" 
                Caption="&lt;strong&gt;REPORTE GENERAL&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="ASIGNADO" DataFormatString="{0:N0}" 
                    HeaderText="PAT.ASIG." SortExpression="ASIGNADO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="E.C.O.(PAT.)" SortExpression="ECO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" Target="_blank"  rel="gb_page_fs[]" 
                            title="Detalles" runat="server" NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("ECO") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=ECO&subdel=" & Eval("SUBDEL")  & "&periodo=" & Eval("PERIODO") & "&periodofin=" & Eval("PERIODO_FIN") %>' 
                            Text='<%# Eval("ECO") %>' Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CITATORIO (PAT. P.A.E.)" 
                    SortExpression="CITATORIO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" Target="_blank" rel="gb_page_fs[]" 
                            title="Detalles" runat="server" 
                            NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("CITATORIO") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=CITATORIOS&subdel=" & Eval("SUBDEL")  & "&periodo=" & Eval("PERIODO") & "&periodofin=" & Eval("PERIODO_FIN") %>' 
                            Text='<%# Eval("CITATORIO") %>' Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P.A.E. (PAT.)" SortExpression="PAE">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" Target="_blank" rel="gb_page_fs[]" 
                            title="Detalles" runat="server" 
                            NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("PAE") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=PAE&subdel=" & Eval("SUBDEL") & "&periodo=" & Eval("PERIODO") & "&periodofin=" & Eval("PERIODO_FIN") %>' 
                            Text='<%# Eval("PAE") %>' Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SALDO(PAT.)" SortExpression="SALDO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink4" Target="_blank" rel="gb_page_fs[]" 
                            title="Detalles" runat="server" 
                            NavigateUrl='<%# "generalsaldototal.aspx?cantidad=" & Eval("SALDO") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=PAE&subdel=" & Eval("SUBDEL") & "&periodo=" & Eval("PERIODO") & "&periodofin=" & Eval("PERIODO_FIN") & "&saldototal=si" %>' 
                            Text='<%# Eval("SALDO") %>' Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="EFECTIVIDAD" DataFormatString="{0:P}" 
                    HeaderText="EFECTIVIDAD" SortExpression="EFECTIVIDAD">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle HorizontalAlign="Right" />
            <HeaderStyle BackColor="#D2D2D4" />
        </asp:GridView>
    
            <asp:SqlDataSource ID="SqlDataSourceR3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
                
                
                
                
                
                
                
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(5)
DECLARE @PERIODO as datetime
DECLARE @PERIODO_FIN as datetime
DECLARE @TIPO_INSPECTOR as VARCHAR(50)
DECLARE @TIPO_INSPECTORV as VARCHAR(1)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @PERIODO = ('01/'+?+'/'+?)
SET @PERIODO_FIN = ('01/'+?+'/'+?)
SET @TIPO_INSPECTORV=?

if @TIPO_INSPECTORV='1'
begin 
SET @TIPO_INSPECTOR='INSPECTOR A'
end
else
begin
SET @TIPO_INSPECTOR='INSPECTOR B EJECUCION FISCAL'
end

select @SUBDEL as SUBDEL
,@PERIODO as PERIODO
,@PERIODO_FIN as PERIODO_FIN
,(select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=[ID_INSPECTOR]) as CARGO
,(case when [ID_INSPECTOR] is null then 'SN' else convert(varchar(6),[ID_INSPECTOR]) end) as [ID_INSPECTOR]
,(case when [INSPECTOR] is null then 'SIN ASIGNAR' else [INSPECTOR] end) as [INSPECTOR]
,case when [ASIGNADO] is null then 0 else [ASIGNADO] end as ASIGNADO
,case when [ECO] is null then 0 else [ECO] end as ECO
,case when [CITATORIOS] is null then 0 else [CITATORIOS] end as CITATORIO
,case when [PAE] is null then 0 else [PAE] end as PAE
,(
case when [ECO] is null then 0 else [ECO] end
+
case when [CITATORIOS] is null then 0 else [CITATORIOS] end
+
case when [PAE] is null then 0 else [PAE] end
) as SALDO
,(
(([ASIGNADO]-
convert(float,
case when [ECO] is null then 0 else [ECO] end
+
case when [CITATORIOS] is null then 0 else [CITATORIOS] end
+
case when [PAE] is null then 0 else [PAE] end
))/[ASIGNADO])
) as EFECTIVIDAD
from
(
---------------------------------------ASIGNADO
--&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;
select 
	ID_INSPECTOR,INSPECTOR,TIPO,count(distinct(PATRONES)) as PATRONES
from
(
SELECT 
CP_INSPEC as ID_INSPECTOR
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=CP_INSPEC) as INSPECTOR
,'ASIGNADO' as TIPO
,CP_REGPAT as PATRONES
FROM [sirecacobros].[dbo].CO_CPATRONAL INNER JOIN [sirecacobros].[dbo].CO_RALE ON CP_REGPAT=RA_REGPATR AND RA_SUBDEL=CP_SUBDEL
WHERE
CP_SUBDEL=@SUBDEL
AND (CP_INSPEC LIKE @INSPECTOR)
and RA_TD in ('02','01')
AND ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
UNION ALL
SELECT 
responsable as ID_INSPECTOR
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) as INSPECTOR
,'ASIGNADO' as TIPO
,substring(REG#PATRONAL,1,10) as PATRONES
FROM [sireca].[dbo].eco
WHERE
SUBDEL=@SUBDEL
AND (responsable LIKE @INSPECTOR)
AND (case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) between @PERIODO and @PERIODO_FIN
union all
select 
ID_INSPECTOR
,INSPECTOR
,'ASIGNADO' as TIPO
,REGPAT AS PATRONES
from (
select distinct
CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_PERIODO
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
--not exists(
	--select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
--	where ac2.AC_RA_ID=RA_ID
--)
--and RA_VIVO='SI'
--and RA_INC='31'
RA_SUBDEL=@SUBDEL
and RA_TD in ('02','01')
and [CP_SUBDEL]=@SUBDEL
and (CP_INSPEC like @INSPECTOR)
and ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
)as resultado
) as rex
group by ID_INSPECTOR,INSPECTOR,TIPO
--&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;
---------------------------------------E.C.O.
union all
select 
responsable as ID_INSPECTOR
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) as INSPECTOR
,'ECO' as TIPO
,count(distinct(reg#patronal)) as PATRONES
from sireca.dbo.eco
where (incidencia in ('2','1') or incidencia is null)
and datediff(day,fechacaptura,getdate())&lt;=19
and incidenciarale in ('00','01','02')
and subdel=@SUBDEL
and responsable like @INSPECTOR
AND (
case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end
) between @PERIODO and @PERIODO_FIN
and validacion='SIN PAGO'
group by subdel,responsable
---------------------------------------CITATORIO
union all
select 
ID_INSPECTOR
,INSPECTOR
,'CITATORIOS' as TIPO
,COUNT(DISTINCT(PATRONES)) as PATRONES
from 
(select distinct
AC_CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=AC_CP_INSPEC) as INSPECTOR
,AC_RA_REGPATR as PATRONES
,ptn.cotiz as COTIZANTES
,AC_RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_RALE inner join [sirecacobros].[dbo].[CO_ACCIONES] as ac on AC_RA_ID=RA_ID
left join sireca.dbo.patrones as ptn on ptn.regpat=AC_RA_REGPATR
where
(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	order by ac2.AC_FECH_DILIGENCIA desc,ac2.AC_FECH_SISTEM desc
)='18'
and
(
	select top 1 max(ac2.AC_FECH_SISTEM) from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	group by ac2.AC_RA_ID
)=ac.AC_FECH_SISTEM
and RA_VIVO='SI'
and RA_INC='31'
and RA_TD in ('02','01')
and RA_SUBDEL=@SUBDEL
AND ('01/'+substring(convert(varchar(10),AC_CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
and (AC_CP_INSPEC like @INSPECTOR)
) as resultado
GROUP BY ID_INSPECTOR,INSPECTOR
---------------------------------------P.A.E.
union all
select 
ID_INSPECTOR
,INSPECTOR
,'PAE' as TIPO
,COUNT(DISTINCT(REGPAT)) AS PATRONES
from (
select distinct
CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO='SI'
and RA_INC='31'
and RA_TD in ('02','01')
and RA_SUBDEL=@SUBDEL
and (CP_INSPEC like @INSPECTOR)
and ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
--RA_PERIODO
)as resultado
group by ID_INSPECTOR,inspector
------------------------------------------------
) as p
PIVOT
(
sum(p.PATRONES)
for [TIPO] in ([ASIGNADO],[ECO],[CITATORIOS],[PAE])
) as pvt
where (select substring(us.chmod,13,1) from sireca.dbo.usuarios as us where us.id=ID_INSPECTOR)='x'
and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=[ID_INSPECTOR]) in (@TIPO_INSPECTOR)
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="tipo" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewResumen3" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" 
                Caption="&lt;strong&gt;REPORTE POR PERIODO&lt;/strong&gt;" 
                DataSourceID="SqlDataSourceR1" Font-Size="10pt" HorizontalAlign="Center" 
                ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" />
                    <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                        SortExpression="INSPECTOR" />
                    <asp:BoundField DataField="PERIODO_RR" 
                        HeaderText="PERIODO" SortExpression="PERIODO_R" />
                    <asp:BoundField DataField="ASIGNADO" DataFormatString="{0:N0}" 
                        HeaderText="PAT.ASIG." SortExpression="ASIGNADO">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="E.C.O.(PAT.)" SortExpression="ECO">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink4" runat="server" 
                                NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("ECO") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=ECO&subdel=" & Eval("SUBDEL")  & "&periodo=" & Eval("PERIODO_R") & "&periodofin=" & Eval("PERIODO_R") %>' 
                                rel="gb_page_fs[]" Target="_blank" Text='<%# Eval("ECO") %>' 
                                title="Detalles" Font-Underline="False"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CITATORIO(PAT. P.A.E.)" 
                        SortExpression="CITATORIO">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" runat="server" 
                                NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("CITATORIO") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=CITATORIOS&subdel=" & Eval("SUBDEL")  & "&periodo=" & Eval("PERIODO_R") & "&periodofin=" & Eval("PERIODO_R") %>' 
                                rel="gb_page_fs[]" Target="_blank" Text='<%# Eval("CITATORIO") %>' 
                                title="Detalles" Font-Underline="False"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="P.A.E.(PAT.)" SortExpression="PAE">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" 
                                NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("PAE") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=PAE&subdel=" & Eval("SUBDEL") & "&periodo=" & Eval("PERIODO_R") & "&periodofin=" & Eval("PERIODO_R") %>' 
                                rel="gb_page_fs[]" Target="_blank" Text='<%# Eval("PAE") %>' 
                                title="Detalles" Font-Underline="False"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="SALDO" DataFormatString="{0:N0}" HeaderText="SALDO(PAT.)" 
                        ReadOnly="True" SortExpression="SALDO">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EFECTIVIDAD" DataFormatString="{0:P}" 
                        HeaderText="EFECTIVIDAD" SortExpression="EFECTIVIDAD">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle HorizontalAlign="Right" Font-Bold="True" />
                <HeaderStyle BackColor="#D2D2D4" />
            </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceR1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(5)
DECLARE @PERIODO as datetime
DECLARE @PERIODO_FIN as datetime
DECLARE @TIPO_INSPECTOR as VARCHAR(50)
DECLARE @TIPO_INSPECTORV as VARCHAR(1)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @PERIODO = ('01/'+?+'/'+?)
SET @PERIODO_FIN = ('01/'+?+'/'+?)
SET @TIPO_INSPECTORV=?

if @TIPO_INSPECTORV='1'
begin 
SET @TIPO_INSPECTOR='INSPECTOR A'
end
else
begin
SET @TIPO_INSPECTOR='INSPECTOR B EJECUCION FISCAL'
end
select @SUBDEL as SUBDEL
,@PERIODO as PERIODO
,@PERIODO_FIN as PERIODO_FIN
,convert(datetime,PERIODO_R,103) as PERIODO_R
,substring(PERIODO_R,4,7) as PERIODO_RR
,(select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=[ID_INSPECTOR]) as CARGO
,(case when [ID_INSPECTOR] is null then 'SN' else convert(varchar(6),[ID_INSPECTOR]) end) as [ID_INSPECTOR]
,(case when [INSPECTOR] is null then 'SIN ASIGNAR' else [INSPECTOR] end) as [INSPECTOR]
,case when [ASIGNADO] is null then 0 else [ASIGNADO] end as ASIGNADO
,case when [ECO] is null then 0 else [ECO] end as ECO
,case when [CITATORIOS] is null then 0 else [CITATORIOS] end as CITATORIO
,case when [PAE] is null then 0 else [PAE] end as PAE
,(
case when [ECO] is null then 0 else [ECO] end
+
case when [CITATORIOS] is null then 0 else [CITATORIOS] end
+
case when [PAE] is null then 0 else [PAE] end
) as SALDO
,(
(([ASIGNADO]-
convert(float,
case when [ECO] is null then 0 else [ECO] end
+
case when [CITATORIOS] is null then 0 else [CITATORIOS] end
+
case when [PAE] is null then 0 else [PAE] end
))/[ASIGNADO])
) as EFECTIVIDAD
from
(
---------------------------------------ASIGNADO
--&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;
select 
	ID_INSPECTOR,INSPECTOR,PERIODO_R,TIPO,count(distinct(PATRONES)) as PATRONES
from
(
SELECT 
CP_INSPEC as ID_INSPECTOR
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=CP_INSPEC) as INSPECTOR
,RA_PERIODO as PERIODO_R
,'ASIGNADO' as TIPO
,CP_REGPAT as PATRONES
FROM [sirecacobros].[dbo].CO_CPATRONAL INNER JOIN [sirecacobros].[dbo].CO_RALE ON CP_REGPAT=RA_REGPATR AND RA_SUBDEL=CP_SUBDEL
WHERE
CP_SUBDEL=@SUBDEL
and RA_TD in ('02','01')
AND (CP_INSPEC LIKE @INSPECTOR)
AND ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
UNION ALL
SELECT 
responsable as ID_INSPECTOR
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) as INSPECTOR
,(case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) as PERIODO_R
,'ASIGNADO' as TIPO
,substring(REG#PATRONAL,1,10) as PATRONES
FROM [sireca].[dbo].eco
WHERE
SUBDEL=@SUBDEL
AND (responsable LIKE @INSPECTOR)
AND (case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) between @PERIODO and @PERIODO_FIN
union all
select 
ID_INSPECTOR
,INSPECTOR
,RA_PERIODO as PERIODO_R
,'ASIGNADO' as TIPO
,REGPAT AS PATRONES
from (
select distinct
CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_PERIODO
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
--not exists(
	--select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
--	where ac2.AC_RA_ID=RA_ID
--)
--and RA_VIVO='SI'
--and RA_INC='31'
RA_SUBDEL=@SUBDEL
and [CP_SUBDEL]=@SUBDEL
and (CP_INSPEC like @INSPECTOR)
and RA_TD in ('02','01')
and ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
)as resultado
) as rex
group by ID_INSPECTOR,INSPECTOR,PERIODO_R,TIPO
--&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;
---------------------------------------E.C.O.
union all
select 
responsable as ID_INSPECTOR
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) as INSPECTOR
,(
case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end
) as PERIODO_R
,'ECO' as TIPO
,count(distinct(reg#patronal)) as PATRONES
from sireca.dbo.eco
where (incidencia in ('2','1') or incidencia is null)
and datediff(day,fechacaptura,getdate())&lt;=19
and incidenciarale in ('00','01','02')
and subdel=@SUBDEL
and (responsable like @INSPECTOR)
AND (
case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end
) between @PERIODO and @PERIODO_FIN
and validacion='SIN PAGO'
group by subdel,responsable,fechaeco
---------------------------------------CITATORIO
union all
select 
ID_INSPECTOR
,INSPECTOR
,RA_PERIODO as PERIODO_R
,'CITATORIOS' as TIPO
,COUNT(DISTINCT(PATRONES)) as PATRONES
from 
(select distinct
AC_CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=AC_CP_INSPEC) as INSPECTOR
,RA_PERIODO
,substring(AC_RA_PERIODO,4,7) as PERIODO
,AC_RA_REGPATR as PATRONES
,ptn.cotiz as COTIZANTES
,AC_RA_PERIODO as PERIODOS
,AC_RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_RALE inner join [sirecacobros].[dbo].[CO_ACCIONES] as ac on AC_RA_ID=RA_ID
left join sireca.dbo.patrones as ptn on ptn.regpat=AC_RA_REGPATR
where
(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	order by ac2.AC_FECH_DILIGENCIA desc,ac2.AC_FECH_SISTEM desc
)='18'
and RA_VIVO='SI'
and RA_INC='31'
and RA_SUBDEL=@SUBDEL
and RA_TD in ('02','01')
AND ('01/'+substring(convert(varchar(10),AC_CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
and (AC_CP_INSPEC like @INSPECTOR)
) as resultado
GROUP BY ID_INSPECTOR,INSPECTOR,RA_PERIODO
---------------------------------------P.A.E.
union all
select 
ID_INSPECTOR
,INSPECTOR
,RA_PERIODO as PERIODO_R
,'PAE' as TIPO
,COUNT(DISTINCT(REGPAT)) AS PATRONES
from (
select distinct
CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_PERIODO
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO='SI'
and RA_INC='31'
and RA_SUBDEL=@SUBDEL
and RA_TD in ('02','01')
and (CP_INSPEC like @INSPECTOR)
and ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
)as resultado
group by ID_INSPECTOR,inspector,RA_PERIODO
------------------------------------------------
) as p
PIVOT
(
sum(p.PATRONES)
for [TIPO] in ([ASIGNADO],[ECO],[CITATORIOS],[PAE])
) as pvt
where (select substring(us.chmod,13,1) from sireca.dbo.usuarios as us where us.id=ID_INSPECTOR)='x'
and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=[ID_INSPECTOR]) in (@TIPO_INSPECTOR)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="tipo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewResumen2" runat="server" DataSourceID="SqlDataSourceR2" 
                        AllowSorting="True" AutoGenerateColumns="False" HorizontalAlign="Center" 
                        Font-Size="10pt" ShowFooter="True" 
                Caption="&lt;strong&gt;SALDO ACUMULADO&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" Target="_blank"  rel="gb_page_fs[]" 
                            title="Detalles" runat="server" NavigateUrl='<%# "generaldetalle.aspx?cantidad=" & Eval("PATRONES") & "&inspector=" & Eval("ID_INSPECTOR") & "&tipo=" & Eval("TIPO") & "&subdel=" & Eval("SUBDEL")  & "&periodo=" & Eval("PERIODO") & "&periodofin=" & Eval("PERIODO_FIN") %>' 
                            Text='<%# Eval("PATRONES") %>' Font-Underline="False"></asp:HyperLink>
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
            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#D2D2D4" />
        </asp:GridView>
    
                    <asp:SqlDataSource ID="SqlDataSourceR2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                       
                
                
                
                
                
                
                
                
                
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(5)
DECLARE @PERIODO as datetime
DECLARE @PERIODO_FIN as datetime
DECLARE @TIPO_INSPECTOR as VARCHAR(50)
DECLARE @TIPO_INSPECTORV as VARCHAR(1)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @PERIODO = ('01/'+?+'/'+?)
SET @PERIODO_FIN = ('01/'+?+'/'+?)
SET @TIPO_INSPECTORV=?
if @TIPO_INSPECTORV='1'
begin 
SET @TIPO_INSPECTOR='INSPECTOR A'
end
else
begin
SET @TIPO_INSPECTOR='INSPECTOR B EJECUCION FISCAL'
end

select 
@SUBDEL as SUBDEL
,convert(varchar(10),@PERIODO,103) as PERIODO
,convert(varchar(10),@PERIODO_FIN,103) as PERIODO_FIN
,INSPECTOR as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=INSPECTOR) as INSPECTOR
,TIPO
,PATRONES
,COTIZANTES
,CREDITOS
,IMPORTE
from (
select 
(responsable) as INSPECTOR
,'ECO' as TIPO
,count(distinct(reg#patronal)) as PATRONES
,sum(cotiz) as COTIZANTES
,count(*) as CREDITOS
,sum(omision) as IMPORTE
from sireca.dbo.eco
where (incidencia in ('2','1') or incidencia is null)
and datediff(day,fechacaptura,getdate())&lt;=19
and incidenciarale in ('00','01','02')
and subdel=@SUBDEL
and validacion='SIN PAGO'
and (
case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end
) between @PERIODO and @PERIODO_FIN
and responsable like @INSPECTOR
group by subdel,responsable
--order by inspector
---------------------------------------CITATORIO
union all
select 
INSPECTOR
,'CITATORIOS' as TIPO
,COUNT(DISTINCT(PATRONES)) as PATRONES
,COUNT(PATRONES) as CREDITOS
,SUM(COTIZANTES) as COTIZANTES
,SUM(IMPORTE) as IMPORTE
from 
(select distinct
(AC_CP_INSPEC) as INSPECTOR
,substring(AC_RA_PERIODO,4,7) as PERIODO
,AC_RA_REGPATR as PATRONES
,ptn.cotiz as COTIZANTES
,AC_RA_PERIODO as PERIODOS
,AC_RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_RALE inner join [sirecacobros].[dbo].[CO_ACCIONES] as ac on AC_RA_ID=RA_ID
left join sireca.dbo.patrones as ptn on ptn.regpat=AC_RA_REGPATR
where
(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	order by ac2.AC_FECH_DILIGENCIA desc,ac2.AC_FECH_SISTEM desc
)='18'
and
(
	select top 1 max(ac2.AC_FECH_SISTEM) from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	group by ac2.AC_RA_ID
)=ac.AC_FECH_SISTEM
and RA_VIVO='SI'
and RA_INC='31'
and RA_TD in ('02','01')
and RA_SUBDEL=@SUBDEL
AND ('01/'+substring(convert(varchar(10),AC_CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
and AC_CP_INSPEC like @INSPECTOR
) as resultado
GROUP BY INSPECTOR
---------------------------------------P.A.E.
union all
select 
INSPECTOR
,'PAE' as TIPO
,COUNT(DISTINCT(REGPAT)) AS PATRONES
,COUNT(CREDITOS) AS CREDITOS
,SUM(COTIZANTES) AS COTIZANTES
,SUM(IMPORTE) AS IMPORTE
from (
select distinct
(CP_INSPEC) as INSPECTOR
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO='SI'
and RA_INC='31'
and RA_TD in ('02','01')
and RA_SUBDEL=@SUBDEL
and ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
and CP_INSPEC like @INSPECTOR
)as resultado
where inspector is not null

group by inspector
) as resultado2
where (select substring(us.chmod,13,1) from sireca.dbo.usuarios as us where us.id=INSPECTOR)='x'
and (select upper(uf.cargo) from fiscamovil.dbo.usuarios as uf where uf.id=[INSPECTOR]) in (@TIPO_INSPECTOR)
order by inspector
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="tipo" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>    
    </div>
</asp:Content>

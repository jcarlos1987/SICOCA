<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="indicadoresdedesempenio.aspx.vb" Inherits="WebSIRECA.indicadoresdedesempenio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
            AutoPostBack="True" Width="120px" CssClass="btn dropdown-toggle btn-small">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="ASIGNACIONES"></asp:Label>
</span>
    <asp:DropDownList ID="DDLFecInicio" runat="server" 
        DataSourceID="SqlDataSourceFecha" DataTextField="fecha" 
        DataTextFormatString="{0:d}" DataValueField="fecha" Width="120px">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLFechFin" runat="server" 
        DataSourceID="SqlDataSourceFecha" DataTextField="fecha" 
        DataTextFormatString="{0:d}" DataValueField="fecha" Width="120px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="INFORME DE:"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLDia" runat="server" Width="120px">
        <asp:ListItem Value="T">TODOS</asp:ListItem>
        <asp:ListItem Value="S">FORANEOS</asp:ListItem>
        <asp:ListItem Value="SF">CIUDAD</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="PERIODO:"></asp:Label>
</span> 
<asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px" >
                                <asp:ListItem Value="00">--</asp:ListItem>
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
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" data-toggle="dropdown" 
                                AutoPostBack="True" Width="80px">
                            </asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" runat="server" CssClass="btn">Actualizar</asp:LinkButton>
</span> 
</div> 
<asp:SqlDataSource ID="SqlDataSourceFecha" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
SET @SUBDEL=?
select fecha
from (
SELECT
convert(varchar(10),[fechaSeleccion],103) as fecha
FROM [sireca].[dbo].[eco]
WHERE subdel like @SUBDEL
and [fechaSeleccion] is not null
and year(fechaSeleccion) in (dateadd(day,-1,year(getdate())),year(getdate()))
) as resultado
group by fecha
order by convert(datetime,fecha,103) desc
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="9pt" 
        ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                                                                SortExpression="SUBDEL" >
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" ReadOnly="True" 
                                                                                SortExpression="NOMBRE" />
                                                                            <asp:BoundField DataField="ULTIMA_ASIGNACION" HeaderText="ULTIMA ASIGNACION" 
                                                                                ReadOnly="True" SortExpression="ULTIMA_ASIGNACION" >
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="DIAS_ASIGNADOS" HeaderText="DIAS ASIGNADOS" 
                                                                                ReadOnly="True" SortExpression="DIAS_ASIGNADOS" DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="PATRONES_ASIGNADOS" HeaderText="PATRONES ASIGNADOS" 
                                                                                ReadOnly="True" SortExpression="PATRONES_ASIGNADOS" 
                                                                                DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS_ASIGNADOS" HeaderText="CREDITOS ASIGNADOS" 
                                                                                ReadOnly="True" SortExpression="CREDITOS_ASIGNADOS" 
                                                                                DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS_PROMEDIO_AL_DIA" 
                                                                                HeaderText="CREDITOS PROMEDIO AL DIA" ReadOnly="True" 
                                                                                SortExpression="CREDITOS_PROMEDIO_AL_DIA" DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="ULTIMA_CAPTURA" HeaderText="ULTIMA CAPTURA" 
                                                                                ReadOnly="True" SortExpression="ULTIMA_CAPTURA" >
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="DIAS_CAPTURADOS" HeaderText="DIAS CAPTURADOS" 
                                                                                ReadOnly="True" SortExpression="DIAS_CAPTURADOS" 
                                                                                DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="PATRONES_ATENDIDOS" HeaderText="PATRONES ATENDIDOS" 
                                                                                ReadOnly="True" SortExpression="PATRONES_ATENDIDOS" 
                                                                                DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="CREDITOS_ATENDIDOS" HeaderText="CREDITOS ATENDIDOS" 
                                                                                ReadOnly="True" SortExpression="CREDITOS_ATENDIDOS" 
                                                                                DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="PROMEDIO" HeaderText="PROMEDIO" ReadOnly="True" 
                                                                                SortExpression="PROMEDIO" DataFormatString="{0:N0}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="DESEMPENIO" HeaderText="DESEMP." ReadOnly="True" 
                                                                                SortExpression="DESEMPENIO" DataFormatString="{0:P}" >
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle HorizontalAlign="Right" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as varchar(2)
DECLARE @FORANEO as varchar(500)
DECLARE @FEC_INI as datetime
DECLARE @FEC_FIN as datetime
DECLARE @MES as varchar(2)
DECLARE @ANIO as varchar(4)
DECLARE @FECHAECO as varchar(50)
------------------------------------VARIABLES
SET @SUBDEL=?
--S=SI, T=TODOS, SF=SIN FORANEOS
SET @FORANEO = ?
SET @FEC_INI=?
SET @FEC_FIN=?
SET @MES=?
SET @ANIO=?
------------------------------------/VARIABLES
SET @FECHAECO=''
if @MES&lt;&gt;'00'
begin
	SET @FECHAECO=' and fechaeco='+@MES+''+@ANIO
end

if @FORANEO='S'
begin
	SET @FORANEO=' and exists(SELECT [ruta],[claveForaneo] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3))'
end
else
begin 
	if @FORANEO='SF'
	begin
		SET @FORANEO=' and not exists(SELECT [ruta],[claveForaneo] FROM [sireca].[dbo].[foraneo] where [claveForaneo]=substring(REG#PATRONAL,1,3))'
	end
	else
	begin
		SET @FORANEO=''
	end
end
---------------------------
exec('
select us1.subdel as SUBDEL,us1.id as ID
,isnull(rx.NOMBRE,(select upper(uf1.nombre) from fiscamovil.dbo.usuarios as uf1 where uf1.id=us1.id)) as NOMBRE,us1.id as RESPONSABLE
,isnull(rx.ULTIMA_ASIGNACION,NULL) as ULTIMA_ASIGNACION
,isnull(rx.DIAS_ASIGNADOS,0) as DIAS_ASIGNADOS
,isnull(rx.PATRONES_ASIGNADOS,0) as PATRONES_ASIGNADOS
,isnull(rx.CREDITOS_ASIGNADOS,0) as CREDITOS_ASIGNADOS
,isnull(rx.CREDITOS_PROMEDIO_AL_DIA,0) as CREDITOS_PROMEDIO_AL_DIA
,isnull(rx.ULTIMA_CAPTURA,0) as ULTIMA_CAPTURA
,isnull(rx.DIAS_CAPTURADOS,0) as DIAS_CAPTURADOS
,isnull(rx.PATRONES_ATENDIDOS,0) as PATRONES_ATENDIDOS
,isnull(rx.CREDITOS_ATENDIDOS,0) as CREDITOS_ATENDIDOS
,isnull(rx.PROMEDIO,0) as PROMEDIO
,isnull(rx.DESEMPENIO,0) as DESEMPENIO
 from sireca.dbo.usuarios as us1 left join 
(
SELECT NOTIFICADORES.SUBDEL,NOTIFICADORES.ID,upper(NOTIFICADORES.NOMBRE) as NOMBRE,ECO.*
FROM
(SELECT USERSIRECA.id,USERSIRECA.del,USERSIRECA.subdel,USERS.nombre
FROM sireca.dbo.usuarios AS USERSIRECA
LEFT JOIN fiscamovil.dbo.usuarios AS USERS
ON  USERSIRECA.id = USERS.id
WHERE USERSIRECA.user_type=''1''
) AS NOTIFICADORES

LEFT JOIN (
	SELECT	
		MAX(ASIGNACION.RESPONSABLE) AS RESPONSABLE,
	CONVERT(VARCHAR(10),MAX(ASIGNACION.FECHASELECCION),103) AS [ULTIMA_ASIGNACION],
	COUNT( DISTINCT convert(VARCHAR(10),ASIGNACION.FECHASELECCION,103)) AS [DIAS_ASIGNADOS],	
	COUNT(DISTINCT ASIGNACION.REG#PATRONAL) AS [PATRONES_ASIGNADOS],
	COUNT(ASIGNACION.CREDITO) AS [CREDITOS_ASIGNADOS],
	COUNT(ASIGNACION.CREDITO)/COUNT( DISTINCT ASIGNACION.FECHASELECCION) AS [CREDITOS_PROMEDIO_AL_DIA],
	convert(VARCHAR(10),MAX(CAPTURA.FECHACAPTURA),103) AS [ULTIMA_CAPTURA],
	COUNT(DISTINCT CONVERT(VARCHAR(10),CAPTURA.FECHACAPTURA,103)) AS [DIAS_CAPTURADOS],
	COUNT(DISTINCT CAPTURA.REG#PATRONAL) AS [PATRONES_ATENDIDOS],
	COUNT(CAPTURA.CREDITO) AS [CREDITOS_ATENDIDOS],
	ISNULL(ROUND(COUNT(DISTINCT CAPTURA.REG#PATRONAL)/CAST(NULLIF(COUNT(DISTINCT CONVERT(VARCHAR(10),CAPTURA.FECHACAPTURA,103)),0) AS FLOAT)+0.1,0),0) AS PROMEDIO,
	(
	COUNT(DISTINCT CAPTURA.REG#PATRONAL)/convert(float,COUNT(DISTINCT ASIGNACION.REG#PATRONAL))
	) AS DESEMPENIO
	FROM(
		SELECT * FROM sireca.dbo.eco
		WHERE convert(varchar(10),fechaSeleccion,103) BETWEEN convert(datetime,'''+@FEC_INI+''',103) AND convert(datetime,'''+@FEC_FIN+''',103)
		'+@FORANEO+' '+@FECHAECO+'
	)AS ASIGNACION
	LEFT JOIN
	(
	SELECT * FROM sireca.dbo.eco
	WHERE incidencia is not null
	'+@FORANEO+' '+@FECHAECO+'
	) AS CAPTURA
	ON ASIGNACION.CREDITO = CAPTURA.CREDITO
	GROUP BY ASIGNACION.RESPONSABLE
) AS ECO
ON NOTIFICADORES.ID = ECO.RESPONSABLE
WHERE RESPONSABLE IS NOT NULL
and SUBDEL like '''+@SUBDEL+'''
and exists(select us.chmod from sireca.dbo.usuarios as us where us.id=RESPONSABLE and us.user_type=1 and substring(chmod,1,1)=''x'')
) as rx on us1.id=RESPONSABLE
where us1.user_type=1 and substring(us1.chmod,1,1)=''x'' and us1.subdel='''+@SUBDEL+'''
order by SUBDEL, NOMBRE
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLDia" DefaultValue="40" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                Name="?" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

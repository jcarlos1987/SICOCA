<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="entregaretrasonotificado.aspx.vb" Inherits="WebSIRECA.entregaretrasonotificado" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<div>
<center>
<div class="btn-group input-prepend">    
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
        Width="120px"></asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span>
    <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px">
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
                                <asp:ListItem Value="00">TODOS</asp:ListItem>
                            </asp:DropDownList>
<asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="100px"></asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn">DESCARGAR</asp:LinkButton>
    </span>
</div>
</center>
<asp:Panel ID="PanelDatos" runat="server">
<table border="1" cellpadding="0" 
            style="width:100%; font-size: 12px;">
                                        <tr>
                                            <td style="font-weight: bold" class="style1">
                                                </td>
                                            <td align="center" bgcolor="#999999" colspan="12" style="font-weight: bold" 
                                                class="style1">
                                                <asp:Label ID="Label15" runat="server" Text="IMSS"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label2" runat="server" Text="Delegacón / Subdelegación"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label34" runat="server" Text="Descripción"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label3" runat="server" Text="Casos emitidos (1)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label4" runat="server" Text="Notificado Oportunamente"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label13" runat="server" Text="Notificado Posterior (x)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label16" runat="server" 
                                                    Text="Total de créditos Notificados al cierre"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label17" runat="server" Text="Saldado Sin notificar"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label18" runat="server" Text="Notificado / Recuperado"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label19" runat="server" Text="Pendiente de Notificar"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label5" runat="server" Text="Créditos (2)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label6" runat="server" Text="% (3)=(2)/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label12" runat="server" Text="Créditos (4)=(2)+(x)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label11" runat="server" Text="%(5)=(4)/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label10" runat="server" Text="Créditos (6)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label14" runat="server" Text="%(7)=(6)/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label9" runat="server" Text="%(8)=[(6)+(4)]/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label8" runat="server" Text="Créditos(9)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label7" runat="server" Text="%(10)=(9)/(1)*100"></asp:Label>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">          
                                        <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("SUBDEL") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label33" runat="server" Text='<%# Eval("TIPO_ECO") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("EMITIDOS","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:LinkButton ID="LBOportuno" runat="server" Text='<%# Eval("OPORTUNO","{0:N0}") %>' onprerender="LBOportuno_PreRender" CommandArgument ='<%# Eval("vurl") + "OPORTUNO" %>'></asp:LinkButton>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("P_OPORTUNO","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                            <asp:LinkButton ID="LBPosterior" runat="server" Text='<%# Eval("POSTERIOR","{0:N0}") %>' onprerender="LBPosterior_PreRender" CommandArgument ='<%# Eval("vurl") + "POSTERIOR" %>'></asp:LinkButton>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("NOTIFI_ALCIERRE","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label30" runat="server" Text='<%# Eval("P_NOTIFI_ALCIERRE","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                            <asp:LinkButton ID="LBSinNot" runat="server" Text='<%# Eval("SIN_NOTIFICAR","{0:N0}") %>' onprerender="LBSinNot_PreRender" CommandArgument ='<%# Eval("vurl") + "SIN_NOTIFICAR" %>'></asp:LinkButton>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("P_SIN_NOTIFICAR","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("RECUPERADO","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                            <asp:LinkButton ID="LBPendientes" runat="server" Text='<%# Eval("PENDIENTES","{0:N0}") %>' onprerender="LBPendientes_PreRender" CommandArgument ='<%# Eval("vurl") + "PENDIENTES" %>'></asp:LinkButton>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("P_PENDIENTES","{0:P}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        </ItemTemplate>                                      
                                        </asp:Repeater>
                                        <tr align="right">
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:Label ID="LTotal" runat="server" Text="0" Font-Bold="True"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LTOportuno" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LT3" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LTNotPost" runat="server" Text="0"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LT4" runat="server" Text="0"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LT5" runat="server" Text="0"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LTSinNot" runat="server" Text="0"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LT7" runat="server" Text="0"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LNotRecuperado" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LTPenNot" runat="server" Text="0"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="LT10" runat="server" Text="0"></asp:Label></td>
                                        </tr>
                                    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_ECO as VARCHAR(50)
DECLARE @REP_CRED_IMP as VARCHAR(10)
DECLARE @CONSULTA as VARCHAR(7000)
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @REP_CRED_IMP=? --IMPORTE,CREDITO
SET @CONSULTA = '
SELECT 
 [SUBDEL]
,(CASE 
WHEN [TIPO_ECO]=''COP'' THEN ''ECO Estrategico''
WHEN [TIPO_ECO]=''COMP'' THEN ''ECO Complemento''
WHEN [TIPO_ECO]=''RCV'' THEN ''RCV Estrategico''
WHEN [TIPO_ECO]=''RCVCOMP'' THEN ''RCV Complemento''
end) as [TIPO_ECO]
,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)) as EMITIDOS
,(case when [OPORTUNO] is null then 0 else [OPORTUNO] end) as [OPORTUNO]
,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_OPORTUNO]
,(case when [POSTERIOR] is null then 0 else [POSTERIOR] end) as [POSTERIOR]
,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)) as NOTIFI_ALCIERRE
,(((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end))/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_NOTIFI_ALCIERRE]
,(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end) as [SIN_NOTIFICAR]
,((case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_SIN_NOTIFICAR]
,(((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end))/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end))))as RECUPERADO
,(case when [PENDIENTES] is null then 0 else [PENDIENTES] end) as [PENDIENTES]
,((case when [PENDIENTES] is null then 0 else [PENDIENTES] end)/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_PENDIENTES]
,''?anio='+@ANIO+'&amp;mes='+@MES+'&amp;subdel='+@SUBDEL+'&amp;tipoeco=''+TIPO_ECO+''&amp;tiponot='' as vurl
FROM
(
------------------------------------------------------------------------
SELECT 
1 as fila
,'''+(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end)+''' as SUBDEL
,TIPO_ECO
,TIPO_NOT '
IF @REP_CRED_IMP='IMPORTE'
begin
	SET @CONSULTA = @CONSULTA + ' ,sum(IMPORTE) as IMPORTE '
end
else
begin
	SET @CONSULTA = @CONSULTA + ' ,count(*) as NOTIFICACIONES '
end
SET @CONSULTA = @CONSULTA + ' FROM
(
SELECT *
,(
	case 
		when (NOT_OPORTUNA IS NOT NULL AND FECH_NOT IS NOT NULL) then ''OPORTUNO''
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NOT NULL) then ''POSTERIOR''
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NULL AND (INCIDENCIA is null or INCIDENCIA IN (''0'',''1''))) then ''PENDIENTES''
		else ''SIN_NOTIFICAR''
	end
) as TIPO_NOT
FROM 
	(
	SELECT 
	eco.subdel as SUBDEL
	,eco.tipoeco as TIPO_ECO
	,(
		case when (
		SELECT TOP 1 [g_tipoProceso]
		FROM [sireca].[dbo].[E_CONTCIFRA]
		where [g_tipoProceso]=(case when eco.tipoeco in (''COP'',''RCV'') then ''COP'' when eco.tipoeco in (''COMP'',''RCVCOMP'') then ''COMP'' end )
		and ( 
		 
		(convert(varchar(2),
			case 
			when tipoeco in (''COP'',''COMP'') then
				month([g_perioEmiMensual])
			else
				month([g_perioEmiBimestral])*2
			end
		)+convert(varchar(4),
		case 
			when tipoeco in (''COP'',''COMP'') then
				year([g_perioEmiMensual])
			else
				year([g_perioEmiBimestral])
			end
		))
		=convert(varchar(6),eco.fechaeco) 
		
		)
		and (
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by ideco desc) between [g_perNotInicio] and g_perNotTerminoDesf
		) is NULL then NULL else ''SI'' end
	) as NOT_OPORTUNA
	,(
	case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
		(
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by ideco desc
		) end 
	) as FECH_NOT
	,eco.[id] as ID
	,eco.incidencia as INCIDENCIA
	,eco.omision as IMPORTE
	FROM [sireca].[dbo].eco as eco '
	if @TIPO_ECO='%'
	begin
	 SET @CONSULTA = @CONSULTA + ' where eco.tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') '
	end
	else
	begin
	 SET @CONSULTA = @CONSULTA + ' where eco.tipoeco in ('''+@TIPO_ECO+''') '
	end
	if @MES='00'
	begin
		SET @CONSULTA = @CONSULTA + ' and convert(varchar(6),eco.fechaeco) like (''%'+@ANIO+''') '
	end
	else
	begin
		SET @CONSULTA = @CONSULTA + ' and eco.fechaeco in ('''+@MES+@ANIO+''') '
	end
	SET @CONSULTA = @CONSULTA + ' and eco.subdel like '''+@SUBDEL+'''
	) as resultado
) as resultado2
group by TIPO_ECO,TIPO_NOT
---------------------------------------------------------------------------------
) as p
PIVOT
( '
IF @REP_CRED_IMP='IMPORTE'
begin
	SET @CONSULTA = @CONSULTA + ' sum(p.IMPORTE)  '
end
else
begin
	SET @CONSULTA = @CONSULTA + ' sum(p.NOTIFICACIONES)  '
end
SET @CONSULTA = @CONSULTA + ' FOR [TIPO_NOT] in ([OPORTUNO],[POSTERIOR],[SIN_NOTIFICAR],[PENDIENTES])
) as pvt
'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="%" Name="?" />
                <asp:Parameter DefaultValue="CREDITO" Name="?" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
<table border="1" cellpadding="0" 
            style="width:100%; font-size: 12px;">
                                        <tr>
                                            <td style="font-weight: bold">
                                                &nbsp;</td>
                                            <td align="center" bgcolor="#999999" colspan="12" style="font-weight: bold">
                                                <asp:Label ID="Label151" runat="server" Text="IMSS"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label72" runat="server" Text="Delegacón / Subdelegación"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label32" runat="server" Text="Descripción"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label73" runat="server" Text="Emisión (1)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label74" runat="server" Text="Notificado Oportunamente"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" rowspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label173" runat="server" Text="Notificado Posterior (x)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label176" runat="server" 
                                                    Text="Total de créditos Notificados al cierre"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label177" runat="server" Text="Saldado Sin notificar"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label178" runat="server" Text="Notificado / Recuperado"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" colspan="2" style="font-weight: bold">
                                                <asp:Label ID="Label179" runat="server" Text="Pendiente de Notificar"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label35" runat="server" Text="Importe (2)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label36" runat="server" Text="% (3)=(2)/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label172" runat="server" Text="Importe (4)=(2)+(x)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label171" runat="server" Text="%(5)=(4)/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label710" runat="server" Text="Importe (6)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label144" runat="server" Text="%(7)=(6)/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label49" runat="server" Text="%(8)=[(6)+(4)]/(1)*100"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label48" runat="server" Text="Emisión(9)"></asp:Label>
                                            </td>
                                            <td align="center" bgcolor="#999999" style="font-weight: bold">
                                                <asp:Label ID="Label47" runat="server" Text="%(10)=(9)/(1)*100"></asp:Label>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">          
                                        <ItemTemplate>
                                        <tr>                                            
                                            <td>
                                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("SUBDEL") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label33" runat="server" Text='<%# Eval("TIPO_ECO") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("EMITIDOS","{0:N}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("OPORTUNO","{0:N}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("P_OPORTUNO","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("POSTERIOR","{0:N}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("NOTIFI_ALCIERRE","{0:N}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label30" runat="server" Text='<%# Eval("P_NOTIFI_ALCIERRE","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label29" runat="server" Text='<%# Eval("SIN_NOTIFICAR","{0:N}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("P_SIN_NOTIFICAR","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("RECUPERADO","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label26" runat="server" Text='<%# Eval("PENDIENTES","{0:N}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("P_PENDIENTES","{0:P}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        </ItemTemplate> 
                                        </asp:Repeater> 
                                        <tr align="right">
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:Label ID="LIMP1" runat="server" Text="0" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMP2" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMPX3" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMP3" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMPX4" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMPX5" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMP4" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMPX7" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMP6" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMP5" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LIMPX10" runat="server" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_ECO as VARCHAR(50)
DECLARE @REP_CRED_IMP as VARCHAR(10)
DECLARE @CONSULTA as VARCHAR(7000)
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @REP_CRED_IMP=? --IMPORTE,CREDITO
SET @CONSULTA = '
SELECT 
 [SUBDEL]
,(CASE 
WHEN [TIPO_ECO]=''COP'' THEN ''ECO Estrategico''
WHEN [TIPO_ECO]=''COMP'' THEN ''ECO Complemento''
WHEN [TIPO_ECO]=''RCV'' THEN ''RCV Estrategico''
WHEN [TIPO_ECO]=''RCVCOMP'' THEN ''RCV Complemento''
end) as [TIPO_ECO]
,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)) as EMITIDOS
,(case when [OPORTUNO] is null then 0 else [OPORTUNO] end) as [OPORTUNO]
,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_OPORTUNO]
,(case when [POSTERIOR] is null then 0 else [POSTERIOR] end) as [POSTERIOR]
,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)) as NOTIFI_ALCIERRE
,(((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end))/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_NOTIFI_ALCIERRE]
,(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end) as [SIN_NOTIFICAR]
,((case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_SIN_NOTIFICAR]
,(((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end))/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end))))as RECUPERADO
,(case when [PENDIENTES] is null then 0 else [PENDIENTES] end) as [PENDIENTES]
,((case when [PENDIENTES] is null then 0 else [PENDIENTES] end)/convert(float,((case when [OPORTUNO] is null then 0 else [OPORTUNO] end)+(case when [POSTERIOR] is null then 0 else [POSTERIOR] end)+(case when [SIN_NOTIFICAR] is null then 0 else [SIN_NOTIFICAR] end)+(case when [PENDIENTES] is null then 0 else [PENDIENTES] end)))) as [P_PENDIENTES]
,''?anio='+@ANIO+'&amp;mes='+@MES+'&amp;subdel='+@SUBDEL+'&amp;tipoeco=''+TIPO_ECO+''&amp;tiponot='' as vurl
FROM
(
------------------------------------------------------------------------
SELECT 
1 as fila
,'''+(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end)+''' as SUBDEL
,TIPO_ECO
,TIPO_NOT '
IF @REP_CRED_IMP='IMPORTE'
begin
	SET @CONSULTA = @CONSULTA + ' ,sum(IMPORTE) as IMPORTE '
end
else
begin
	SET @CONSULTA = @CONSULTA + ' ,count(*) as NOTIFICACIONES '
end
SET @CONSULTA = @CONSULTA + ' FROM
(
SELECT *
,(
	case 
		when (NOT_OPORTUNA IS NOT NULL AND FECH_NOT IS NOT NULL) then ''OPORTUNO''
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NOT NULL) then ''POSTERIOR''
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NULL AND (INCIDENCIA is null or INCIDENCIA IN (''0'',''1''))) then ''PENDIENTES''
		else ''SIN_NOTIFICAR''
	end
) as TIPO_NOT
FROM 
	(
	SELECT 
	eco.subdel as SUBDEL
	,eco.tipoeco as TIPO_ECO
	,(
		case when (
		SELECT TOP 1 [g_tipoProceso]
		FROM [sireca].[dbo].[E_CONTCIFRA]
		where [g_tipoProceso]=(case when eco.tipoeco in (''COP'',''RCV'') then ''COP'' when eco.tipoeco in (''COMP'',''RCVCOMP'') then ''COMP'' end )
		and ( 
		 
		(convert(varchar(2),
			case 
			when tipoeco in (''COP'',''COMP'') then
				month([g_perioEmiMensual])
			else
				month([g_perioEmiBimestral])*2
			end
		)+convert(varchar(4),
		case 
			when tipoeco in (''COP'',''COMP'') then
				year([g_perioEmiMensual])
			else
				year([g_perioEmiBimestral])
			end
		))
		=convert(varchar(6),eco.fechaeco) 
		
		)
		and (
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by ideco desc) between [g_perNotInicio] and g_perNotTerminoDesf
		) is NULL then NULL else ''SI'' end
	) as NOT_OPORTUNA
	,(
	case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
		(
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by ideco desc
		) end 
	) as FECH_NOT
	,eco.[id] as ID
	,eco.incidencia as INCIDENCIA
	,eco.omision as IMPORTE
	FROM [sireca].[dbo].eco as eco '
	if @TIPO_ECO='%'
	begin
	 SET @CONSULTA = @CONSULTA + ' where eco.tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') '
	end
	else
	begin
	 SET @CONSULTA = @CONSULTA + ' where eco.tipoeco in ('''+@TIPO_ECO+''') '
	end
	if @MES='00'
	begin
		SET @CONSULTA = @CONSULTA + ' and convert(varchar(6),eco.fechaeco) like (''%'+@ANIO+''') '
	end
	else
	begin
		SET @CONSULTA = @CONSULTA + ' and eco.fechaeco in ('''+@MES+@ANIO+''') '
	end
	SET @CONSULTA = @CONSULTA + ' and eco.subdel like '''+@SUBDEL+'''
	) as resultado
) as resultado2
group by TIPO_ECO,TIPO_NOT
---------------------------------------------------------------------------------
) as p
PIVOT
( '
IF @REP_CRED_IMP='IMPORTE'
begin
	SET @CONSULTA = @CONSULTA + ' sum(p.IMPORTE)  '
end
else
begin
	SET @CONSULTA = @CONSULTA + ' sum(p.NOTIFICACIONES)  '
end
SET @CONSULTA = @CONSULTA + ' FOR [TIPO_NOT] in ([OPORTUNO],[POSTERIOR],[SIN_NOTIFICAR],[PENDIENTES])
) as pvt
'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="%" Name="?" />
                <asp:Parameter DefaultValue="IMPORTE" Name="?" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Panel>
    </div>
</asp:Content>

<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="reportenotificacion.aspx.vb" Inherits="WebSIRECA.reportenotificacion" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<div>
<center>
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Width="120px" CssClass="dropdown-toggle">
        </asp:DropDownList>
<span class="add-on">
    FECHA DE EMISION DEL SIVEPA
</span> 
        <asp:DropDownList ID="DDLFechSivepa" runat="server" 
            DataSourceID="SqlDataSourceFecSive" DataTextField="texto" DataValueField="valor" 
            Width="120px" CssClass="dropdown-toggle" AutoPostBack="True">
        </asp:DropDownList>
<span class="add-on">
    AÑO
</span> 
<asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="100px"></asp:DropDownList>
<span class="add-on">
    TIPO
</span> 
        <asp:DropDownList ID="DDLTipo" runat="server" DataTextField="texto" DataValueField="texto" 
            Width="140px" CssClass="dropdown-toggle" AutoPostBack="True">
            <asp:ListItem Value="SIVEPA-IMSS">C.O.P.</asp:ListItem>
            <asp:ListItem Value="SIVEPA-RCV">R.C.V.</asp:ListItem>
            <asp:ListItem Value="%">C.O.P. y R.C.V.</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
    PERIODO
</span>
    <asp:DropDownList ID="DDLPeriodo" runat="server" Width="100px" 
            CssClass="dropdown-toggle" DataSourceID="SqlDataSourcePeriodo" 
            DataTextField="PERIODO" DataValueField="PERIODO" AutoPostBack="True">
    </asp:DropDownList>
    <span class="add-on">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn">DESCARGAR</asp:LinkButton>
    </span>
    </div>
</center>
        <asp:SqlDataSource ID="SqlDataSourceFecSive" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select * from (
SELECT 
CONVERT(NVARCHAR(10),[SV_FECHA],103) AS texto
,CONVERT(NVARCHAR(10),[SV_FECHA],103) AS valor
,[SV_FECHA] as ORDEN
FROM [sirecasivepas].[dbo].[SV_BASE] LEFT JOIN sireca.dbo.patrones on substring([SV_REG_PATRONAL],1,10)=regpat
WHERE [SV_SUBDEL] like ? and year([SV_FECHA])=?
group by [SV_FECHA]
union all
SELECT 'TODO' as texto,'%' as valor,'01/01/1800' as ORDEN
) as x
order by ORDEN desc
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct(substring(convert(nvarchar(10),[SV_PERIODO],103),4,7)) as PERIODO
,[SV_PERIODO]
FROM [sirecasivepas].[dbo].[SV_BASE]
where [SV_SUBDEL] like ?
and convert(nvarchar(10),[SV_FECHA],103) like ?
and [SV_SIVEPA] like ?
order by [SV_PERIODO] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFechSivepa" DefaultValue="01/01/2000" 
                    Name="?" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
<asp:Panel ID="PanelDatos" runat="server">    
<table border="1" cellpadding="0" 
            style="width:100%; font-size: 12px;">
                                        <tr>
                                            <td style="font-weight: bold">
                                                &nbsp;</td>
                                            <td align="center" bgcolor="#999999" colspan="12" style="font-weight: bold">
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
                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("OPORTUNO","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("P_OPORTUNO","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("POSTERIOR","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("NOTIFI_ALCIERRE","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label30" runat="server" Text='<%# Eval("P_NOTIFI_ALCIERRE","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label29" runat="server" Text='<%# Eval("SIN_NOTIFICAR","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("P_SIN_NOTIFICAR","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("RECUPERADO","{0:P}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label26" runat="server" Text='<%# Eval("PENDIENTES","{0:N0}") %>'></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("P_PENDIENTES","{0:P}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        </ItemTemplate>                                      
                                        </asp:Repeater>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_SIVEPA as VARCHAR(10)
DECLARE @PERIODO as VARCHAR(7)
DECLARE @TIPO as VARCHAR(15)
SET @SUBDEL=?
SET @FECH_SIVEPA=?
SET @TIPO=?
SET @PERIODO=?

SET @MES=SUBSTRING(@PERIODO,1,2)
/*if @MES in ('02','04','06','08','10','12') 
begin
	SET @MESRCV=(case when len(@MES/2)=1 then '0'+(@MES/2) else (@MES/2) end)
end
else 
begin
	SET @MESRCV='12'
end*/
SET @ANIO=SUBSTRING(@PERIODO,4,4)
SELECT [SUBDEL]
,(CASE 
WHEN [TIPO_ECO]='SIVEPA_OPORT' and [SV_SIVEPA] in ('SIVEPA-IMSS') THEN 'COP SIVEPA OPORTUNO'
WHEN [TIPO_ECO]='SIVEPA_EXTEM' and [SV_SIVEPA] in ('SIVEPA-IMSS') THEN 'COP SIVEPA EXTEMPORANEO'
WHEN [TIPO_ECO]='SIVEPA_ANUAL' and [SV_SIVEPA] in ('SIVEPA-IMSS') THEN 'COP SIVEPA ANUAL'
WHEN [TIPO_ECO]='SIVEPA_OPORT' and [SV_SIVEPA] in ('SIVEPA-RCV') THEN 'RCV SIVEPA OPORTUNO'
WHEN [TIPO_ECO]='SIVEPA_EXTEM' and [SV_SIVEPA] in ('SIVEPA-RCV') THEN 'RCV SIVEPA EXTEMPORANEO'
WHEN [TIPO_ECO]='SIVEPA_ANUAL' and [SV_SIVEPA] in ('SIVEPA-RCV') THEN 'RCV SIVEPA ANUAL'
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
FROM
(
---------------------------------------------------------------------------------------------
select (case when @SUBDEL in ('%') then '33' else @SUBDEL end) as SUBDEL,TIPO_ECO,[SV_SIVEPA],TIPO_NOT,count(*) as NOTIFICACIONES
FROM (
--------------------------------------------
SELECT
(
	case 
		when (NOT_OPORTUNA IS NOT NULL AND FECH_NOT IS NOT NULL) then 'OPORTUNO'
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NOT NULL) then 'POSTERIOR'
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NULL AND (DILIGENCIA is null or DILIGENCIA IN ('0','1'))) then 'PENDIENTES'
		else 'SIN_NOTIFICAR'
	end
) as TIPO_NOT
,*
FROM (
SELECT [SV_ID]
      ,[SV_TIPO] as TIPO_ECO
      ,[SV_SIVEPA]
      ,[SV_REG_PATRONAL]
      ,[SV_CREDITO]
      ,[SV_COTIZ]
      ,[SV_DIAS]
      ,[SV_C]
      ,[SV_ACT]
      ,[SV_PRIMA]
      ,[SV_EMI_REAL]
      ,[SV_RECAUDACION]
      ,[SV_DIFERENCIA]
,SV_SUBDEL as SUBDEL
,(SELECT TOP 1 convert(nvarchar(10),[SVD_FECH_DILI],103) FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] and [SVD_DILI]='2' order by [SVD_FECH_DILI] desc) as FECH_NOT
,(SELECT TOP 1 SVD_DILI FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] and [SVD_DILI]='2' order by [SVD_FECH_DILI] desc) as DILIGENCIA
,(
	case when (
		SELECT TOP 1 [g_tipoProceso]
		FROM [sireca].[dbo].[E_CONTCIFRA]
		where [g_tipoProceso]=[SV_TIPO]
		and [g_perioEmiMensual]=('01/'+@MES+'/'+@ANIO)
		and (SELECT TOP 1 convert(nvarchar(10),[SVD_FECH_DILI],103) FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] and [SVD_DILI]='2' order by [SVD_FECH_DILI] desc) between [g_perNotInicio] and [g_perNotTermino]
	) is null then NULL else 'SI' end
) as NOT_OPORTUNA
FROM [sirecasivepas].[dbo].[SV_BASE] 
WHERE [SV_PERIODO]=('01/'+@MES+'/'+@ANIO)
and SV_SUBDEL like @SUBDEL
AND CONVERT(VARCHAR(10),SV_FECHA,103) like @FECH_SIVEPA
AND [SV_SIVEPA] like @TIPO
) as resultado
----------------------------------------------------
) as resultado2
group by SUBDEL,TIPO_ECO,[SV_SIVEPA],TIPO_NOT
---------------------------------------------------------------------------------------------
) as p
PIVOT
( 
 sum(p.NOTIFICACIONES)  
 FOR [TIPO_NOT] in ([OPORTUNO],[POSTERIOR],[SIN_NOTIFICAR],[PENDIENTES])
) as pvt
order by SUBDEL,TIPO_ECO
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFechSivepa" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="SIVEPA-IMSS" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="01/2000" Name="?" 
                    PropertyName="SelectedValue" />
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
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_SIVEPA as VARCHAR(10)
DECLARE @PERIODO as VARCHAR(7)
DECLARE @TIPO as VARCHAR(15)
SET @SUBDEL=?
SET @FECH_SIVEPA=?
SET @TIPO=?
SET @PERIODO=?
SET @MES=SUBSTRING(@PERIODO,1,2)
SET @ANIO=SUBSTRING(@PERIODO,4,4)
SELECT [SUBDEL]
,(CASE 
WHEN [TIPO_ECO]='SIVEPA_OPORT' and [SV_SIVEPA] in ('SIVEPA-IMSS') THEN 'COP SIVEPA OPORTUNO'
WHEN [TIPO_ECO]='SIVEPA_EXTEM' and [SV_SIVEPA] in ('SIVEPA-IMSS') THEN 'COP SIVEPA EXTEMPORANEO'
WHEN [TIPO_ECO]='SIVEPA_ANUAL' and [SV_SIVEPA] in ('SIVEPA-IMSS') THEN 'COP SIVEPA ANUAL'
WHEN [TIPO_ECO]='SIVEPA_OPORT' and [SV_SIVEPA] in ('SIVEPA-RCV') THEN 'RCV SIVEPA OPORTUNO'
WHEN [TIPO_ECO]='SIVEPA_EXTEM' and [SV_SIVEPA] in ('SIVEPA-RCV') THEN 'RCV SIVEPA EXTEMPORANEO'
WHEN [TIPO_ECO]='SIVEPA_ANUAL' and [SV_SIVEPA] in ('SIVEPA-RCV') THEN 'RCV SIVEPA ANUAL'
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
FROM
(
---------------------------------------------------------------------------------------------
select (case when @SUBDEL in ('%') then '33' else @SUBDEL end) as SUBDEL,TIPO_ECO,[SV_SIVEPA],TIPO_NOT,sum([SV_DIFERENCIA]) as [SV_DIFERENCIA]
FROM (
--------------------------------------------
SELECT
(
	case 
		when (NOT_OPORTUNA IS NOT NULL AND FECH_NOT IS NOT NULL) then 'OPORTUNO'
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NOT NULL) then 'POSTERIOR'
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NULL AND (DILIGENCIA is null or DILIGENCIA IN ('0','1'))) then 'PENDIENTES'
		else 'SIN_NOTIFICAR'
	end
) as TIPO_NOT
,*
FROM (
SELECT [SV_ID]
      ,[SV_TIPO] as TIPO_ECO
      ,[SV_SIVEPA]
      ,[SV_REG_PATRONAL]
      ,[SV_CREDITO]
      ,[SV_COTIZ]
      ,[SV_DIAS]
      ,[SV_C]
      ,[SV_ACT]
      ,[SV_PRIMA]
      ,[SV_EMI_REAL]
      ,[SV_RECAUDACION]
      ,[SV_DIFERENCIA]
,SV_SUBDEL as SUBDEL
,(SELECT TOP 1 convert(nvarchar(10),[SVD_FECH_DILI],103) FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] and [SVD_DILI]='2' order by [SVD_FECH_DILI] desc) as FECH_NOT
,(SELECT TOP 1 SVD_DILI FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] and [SVD_DILI]='2' order by [SVD_FECH_DILI] desc) as DILIGENCIA
,(
	case when (
		SELECT TOP 1 [g_tipoProceso]
		FROM [sireca].[dbo].[E_CONTCIFRA]
		where [g_tipoProceso]=[SV_TIPO]
		and [g_perioEmiMensual]=('01/'+@MES+'/'+@ANIO)
		and (SELECT TOP 1 convert(nvarchar(10),[SVD_FECH_DILI],103) FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] and [SVD_DILI]='2' order by [SVD_FECH_DILI] desc) between [g_perNotInicio] and [g_perNotTermino]
	) is null then NULL else 'SI' end
) as NOT_OPORTUNA
FROM [sirecasivepas].[dbo].[SV_BASE] 
WHERE [SV_PERIODO]=('01/'+@MES+'/'+@ANIO)
and SV_SUBDEL like @SUBDEL
AND CONVERT(VARCHAR(10),SV_FECHA,103) like @FECH_SIVEPA
AND [SV_SIVEPA] like @TIPO
) as resultado
----------------------------------------------------
) as resultado2
group by SUBDEL,TIPO_ECO,[SV_SIVEPA],TIPO_NOT
---------------------------------------------------------------------------------------------
) as p
PIVOT
( 
 sum(p.[SV_DIFERENCIA])  
 FOR [TIPO_NOT] in ([OPORTUNO],[POSTERIOR],[SIN_NOTIFICAR],[PENDIENTES])
) as pvt
order by SUBDEL,TIPO_ECO
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFechSivepa" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="SIVEPA-IMSS" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="01/2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Panel>
    </div>
</asp:Content>

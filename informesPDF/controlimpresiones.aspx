<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="controlimpresiones.aspx.vb" Inherits="WebSIRECA.controlimpresiones" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center >
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="SUBDELEGACION:"></asp:Label>
</span> 
<asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
</asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="ASIGNACION DEL:"></asp:Label>
</span> 
<asp:TextBox ID="TBFechIni" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
    <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechIni">
    </asp:CalendarExtender>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="AL:"></asp:Label>
</span> 
<asp:TextBox ID="TBFechFin" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
    <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechFin"></asp:CalendarExtender>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" CssClass ="btn" runat="server"><i class="icon-refresh"></i>ACTUALIZAR</asp:LinkButton>
</span> 
</div> 
</center>
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
            <asp:GridView ID="GridViewImpresionesC" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceImpresionesC" 
        HorizontalAlign="Center" EmptyDataText="SIN DOCUMENTOS" 
        AllowSorting="True" Font-Size="10pt" Caption="CITATORIOS" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="TOTAL_GENERADOS" HeaderText="TOTAL" 
                ReadOnly="True" SortExpression="TOTAL_GENERADOS" 
                DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="SIN REPORTAR" SortExpression="SIN_REPORTAR">
                <ItemTemplate>
                    <asp:LinkButton ID="LBSinRep" runat="server" 
                        Text='<%# Eval("SIN_REPORTAR", "{0:N0}") %>' 
                        CommandArgument ='<%# "detallesimpresiones.aspx?id=QW0923LNJN345&subdel=" & Eval("V_SUBDEL") & "&inspector=" & Eval("V_INSPECTOR_R") & "&accion=NO_REPORTADOS&fech_ini=" & Eval("V_FECH_INI") & "&fech_fin=" & Eval("V_FECH_FIN") & "&tipo_doc=Citatorio&key=QW0923LNJN345"%>' 
                        onprerender="LBSinRep_PreRender" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REPORTADOS" SortExpression="REPORTADOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LBSinRep2" runat="server" 
                        Text='<%# Eval("REPORTADOS", "{0:N0}") %>' 
                        CommandArgument ='<%# "detallesimpresiones.aspx?id=QW0923LNJN345&subdel=" & Eval("V_SUBDEL") & "&inspector=" & Eval("V_INSPECTOR_R") & "&accion=SI_REPORTADOS&fech_ini=" & Eval("V_FECH_INI") & "&fech_fin=" & Eval("V_FECH_FIN") & "&tipo_doc=Citatorio&key=QW0923LNJN345"%>' 
                        onprerender="LBSinRep2_PreRender" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
<asp:BoundField DataField="PRODUCTIVIDAD" DataFormatString="{0:P}" 
                HeaderText="PRODUCTIVIDAD" SortExpression="PRODUCTIVIDAD">
<ItemStyle HorizontalAlign="Right"></ItemStyle>
</asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceImpresionesC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INSPECTOR AS VARCHAR(10)
DECLARE @TIPO_DOC AS VARCHAR(10)
DECLARE @ADD_WHERE AS VARCHAR(100)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_INI=?
SET @FECH_FIN=?

SET @TIPO_DOC='Citatorio'
SET @ADD_WHERE=' and IM_INSPECTOR='''+@INSPECTOR+''''
IF @INSPECTOR='%'
BEGIN
	SET @ADD_WHERE=''
END
exec('
SELECT (SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios where id=[IM_INSPECTOR]) AS INSPECTOR
,'''+@SUBDEL+''' AS V_SUBDEL
,'''+@INSPECTOR+''' AS V_INSPECTOR
,convert(varchar(10),'''+@FECH_INI+''',103) AS V_FECH_INI
,convert(varchar(10),'''+@FECH_FIN+''',103) AS V_FECH_FIN
,[IM_INSPECTOR] AS V_INSPECTOR_R
,ISNULL([NO_REPORTADOS]/2,0) AS SIN_REPORTAR
,ISNULL([SI_REPORTADOS]/2,0) AS REPORTADOS
,ISNULL([NO_REPORTADOS]/2,0)+ISNULL([SI_REPORTADOS]/2,0) AS TOTAL_GENERADOS
,ISNULL([SI_REPORTADOS]/2,0)/convert(float,(ISNULL([NO_REPORTADOS]/2,0)+ISNULL([SI_REPORTADOS]/2,0))) as [PRODUCTIVIDAD]
FROM (
SELECT 
IM_SUBDEL AS SUBDELEGACION
,E_ACCIONES AS ACCIONES
,IM_INSPECTOR AS IM_INSPECTOR
,IM_REGPAT+IM_CREDITO+IM_PERIODO  AS DOCUMENTOS
FROM (
		SELECT DISTINCT 
		E_INC_01
		,CASE 
		WHEN E_INC_01 IS NULL THEN ''NO_REPORTADOS''
		ELSE ''SI_REPORTADOS''
		END AS E_ACCIONES
		,[IM_SUBDEL]
		--,CONVERT(NVARCHAR(10),[IM_FECHA_IMPRESION],103) AS IM_IMPRESION
		,[IM_REGPAT],[IM_RAZON_SOCIAL],[IM_CREDITO],[IM_PERIODO],[IM_TIPO_IMPRESION],[IM_INSPECTOR]
		  FROM 
		  [sirecaemisiones].[dbo].[hist_impresion]
		  left join
		  (
		  SELECT substring(reg#patronal,1,10) as E_REGPAT
		,credito as E_CREDITO
		,(case 
		when [tipoECO] in (''COP'',''COMP'') then
		(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
		when [tipoECO] in (''RCV'',''RCVCOMP'') then
		(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
		end
		) as E_PERIODO
		,(case when eco.incidencia in (''1'') then eco.incidencia else 
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''1'' and hinc.ideco=eco.id and hinc.subdel=eco.subdel
			order by hinc.id desc
		) end 
		) as E_INC_01
		,(case when eco.incidencia in (''2'') then eco.incidencia else 
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id and hinc.subdel=eco.subdel
			order by hinc.id desc
		) end 
		) as E_INC_02
		FROM [sireca].[dbo].[eco] as eco
		where tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
		and eco.subdel='''+@SUBDEL+'''
		  ) AS ECO
		   on IM_REGPAT=E_REGPAT 
           --AND IM_CREDITO=E_CREDITO 
           AND IM_PERIODO=E_PERIODO
		WHERE [IM_FECHA_ASIGNACION] BETWEEN convert(datetime,'''+@FECH_INI+' 00:00:00'') AND convert(datetime,'''+@FECH_FIN+' 23:00:00'')
		and substring([IM_TIPO_IMPRESION],1,9) = '''+@TIPO_DOC+'''
		'+@ADD_WHERE+'
) AS R
WHERE IM_SUBDEL='''+@SUBDEL+'''
) AS p
PIVOT
(
count(DOCUMENTOS)
for [ACCIONES] in ([NO_REPORTADOS],[SI_REPORTADOS])
) as pvt
ORDER BY 1
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="%" Name="?" />
            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
            <td align="left">
                <asp:GridView ID="GridViewImpresionesN" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceImpresionesN" 
        HorizontalAlign="Center" EmptyDataText="SIN DOCUMENTOS" 
        AllowSorting="True" Font-Size="10pt" Caption="ACTAS DE NOTIFICACION" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="TOTAL_GENERADOS" HeaderText="TOTAL" 
                ReadOnly="True" SortExpression="TOTAL_GENERADOS" 
                DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="SIN REPORTAR" SortExpression="SIN_REPORTAR">
                <ItemTemplate>
                    <asp:LinkButton ID="LBSinRep3" runat="server" 
                        Text='<%# Eval("SIN_REPORTAR", "{0:N0}") %>' 
                        CommandArgument ='<%# "detallesimpresiones.aspx?id=QW0923LNJN345&subdel=" & Eval("V_SUBDEL") & "&inspector=" & Eval("V_INSPECTOR_R") & "&accion=NO_REPORTADOS&fech_ini=" & Eval("V_FECH_INI") & "&fech_fin=" & Eval("V_FECH_FIN") & "&tipo_doc=Acta de Notificacion&key=QW0923LNJN345"%>' 
                        onprerender="LBSinRep3_PreRender" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REPORTADOS" SortExpression="REPORTADOS">
                <ItemTemplate>                    
                    <asp:LinkButton ID="LBSinRep4" runat="server" 
                        Text='<%# Eval("REPORTADOS", "{0:N0}") %>' 
                        CommandArgument ='<%# "detallesimpresiones.aspx?id=QW0923LNJN345&subdel=" & Eval("V_SUBDEL") & "&inspector=" & Eval("V_INSPECTOR_R") & "&accion=SI_REPORTADOS&fech_ini=" & Eval("V_FECH_INI") & "&fech_fin=" & Eval("V_FECH_FIN") & "&tipo_doc=Acta de Notificacion&key=QW0923LNJN345"%>' 
                        onprerender="LBSinRep4_PreRender" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
<asp:BoundField DataField="PRODUCTIVIDAD" DataFormatString="{0:P}" 
                HeaderText="PRODUCTIVIDAD" SortExpression="PRODUCTIVIDAD">
<ItemStyle HorizontalAlign="Right"></ItemStyle>
</asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceImpresionesN" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INSPECTOR AS VARCHAR(10)
DECLARE @TIPO_DOC AS VARCHAR(50)
DECLARE @ADD_WHERE AS VARCHAR(100)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_INI=?
SET @FECH_FIN=?

SET @TIPO_DOC='Acta de Notificacion'
SET @ADD_WHERE=' and IM_INSPECTOR='''+@INSPECTOR+''''
IF @INSPECTOR='%'
BEGIN
	SET @ADD_WHERE=''
END
exec('
SELECT (SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios where id=[IM_INSPECTOR]) AS INSPECTOR
,'''+@SUBDEL+''' AS V_SUBDEL
,'''+@INSPECTOR+''' AS V_INSPECTOR
,convert(varchar(10),'''+@FECH_INI+''',103) AS V_FECH_INI
,convert(varchar(10),'''+@FECH_FIN+''',103) AS V_FECH_FIN
,[IM_INSPECTOR] AS V_INSPECTOR_R
,ISNULL([NO_REPORTADOS]/2,0) AS SIN_REPORTAR
,ISNULL([SI_REPORTADOS]/2,0) AS REPORTADOS
,ISNULL([NO_REPORTADOS]/2,0)+ISNULL([SI_REPORTADOS]/2,0) AS TOTAL_GENERADOS
,ISNULL([SI_REPORTADOS]/2,0)/convert(float,(ISNULL([NO_REPORTADOS]/2,0)+ISNULL([SI_REPORTADOS]/2,0))) as [PRODUCTIVIDAD]
FROM (
SELECT 
IM_SUBDEL AS SUBDELEGACION
,E_ACCIONES AS ACCIONES
,IM_INSPECTOR AS IM_INSPECTOR
,IM_REGPAT+IM_CREDITO+IM_PERIODO  AS DOCUMENTOS
FROM (
		SELECT DISTINCT 
		E_INC_02
		,CASE 
		WHEN E_INC_02 IS NULL THEN ''NO_REPORTADOS''
		ELSE ''SI_REPORTADOS''
		END AS E_ACCIONES
		,[IM_SUBDEL]
		--,CONVERT(NVARCHAR(10),[IM_FECHA_IMPRESION],103) AS IM_IMPRESION
		,[IM_REGPAT]
		,[IM_RAZON_SOCIAL],[IM_CREDITO],[IM_PERIODO],[IM_TIPO_IMPRESION],[IM_INSPECTOR]
		  FROM 
		  [sirecaemisiones].[dbo].[hist_impresion]
		  left join
		  (
		  SELECT substring(reg#patronal,1,10) as E_REGPAT
		,credito as E_CREDITO
		,(case 
		when [tipoECO] in (''COP'',''COMP'') then
		(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
		when [tipoECO] in (''RCV'',''RCVCOMP'') then
		(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
		end
		) as E_PERIODO
		,(case when eco.incidencia in (''1'') then eco.incidencia else 
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''1'' and hinc.ideco=eco.id and hinc.subdel=eco.subdel
			order by hinc.id desc
		) end 
		) as E_INC_01
		,(case when eco.incidencia in (''2'') then eco.incidencia else 
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id and hinc.subdel=eco.subdel
			order by hinc.id desc
		) end 
		) as E_INC_02
		FROM [sireca].[dbo].[eco] as eco
		where tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
		and eco.subdel='''+@SUBDEL+'''
		  ) AS ECO
		   on IM_REGPAT=E_REGPAT 
           --AND IM_CREDITO=E_CREDITO 
           AND IM_PERIODO=E_PERIODO
		WHERE [IM_FECHA_ASIGNACION] BETWEEN convert(datetime,'''+@FECH_INI+' 00:00:00'') AND convert(datetime,'''+@FECH_FIN+' 23:00:00'')
		and substring([IM_TIPO_IMPRESION],1,20) = '''+@TIPO_DOC+'''
		'+@ADD_WHERE+'
) AS R
WHERE IM_SUBDEL='''+@SUBDEL+'''
) AS p
PIVOT
(
count(DOCUMENTOS)
for [ACCIONES] in ([NO_REPORTADOS],[SI_REPORTADOS])
) as pvt
ORDER BY 1
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="%" Name="?" />
            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" 
        AllowPaging="True" Font-Size="10pt">
        <Columns>
            <asp:BoundField DataField="IMPRIMIO" HeaderText="IMPRIMIO" ReadOnly="True" 
                SortExpression="IMPRIMIO" />
            <asp:BoundField DataField="TIPO_IMPRESION" 
                HeaderText="TIPO_IMPRESION" ReadOnly="True" 
                SortExpression="TIPO_IMPRESION" />
            <asp:BoundField DataField="IMPRESIONES" HeaderText="IMPRESIONES" 
                ReadOnly="True" SortExpression="IMPRESIONES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ULTIMA_IMPRESION" HeaderText="ULTIMA_IMPRESION" 
                ReadOnly="True" SortExpression="ULTIMA_IMPRESION" 
                DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" />
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" />
        </Columns>
        <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INSPECTOR AS VARCHAR(10)
DECLARE @TIPO_DOC AS VARCHAR(10)
DECLARE @FECH_INI AS DATETIME
DECLARE @FECH_FIN AS DATETIME
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_INI=?
SET @FECH_FIN=?
SELECT 
      (select upper(nombre) from fiscamovil.dbo.usuarios where id=[IM_USER_PRINT]) AS IMPRIMIO
      ,[IM_TIPO_IMPRESION] AS TIPO_IMPRESION
      ,count(*) AS IMPRESIONES
      ,max([IM_FECHA_IMPRESION]) AS ULTIMA_IMPRESION
      ,[IM_REGPAT] AS REGPAT
      ,[IM_RAZON_SOCIAL] AS RAZON_SOCIAL
      ,[IM_CREDITO] AS CREDITO
  FROM [sirecaemisiones].[dbo].[hist_impresion]
WHERE IM_SUBDEL=@SUBDEL
AND [IM_FECHA_ASIGNACION] BETWEEN convert(datetime,@FECH_INI +' 00:00:00') AND convert(datetime,@FECH_FIN+' 23:00:00')
and IM_INSPECTOR like @INSPECTOR
  group by [IM_USER_PRINT]
      ,[IM_REGPAT]
      ,[IM_RAZON_SOCIAL]
      ,[IM_CREDITO]
      ,[IM_TIPO_IMPRESION]
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="%" Name="?" />
            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

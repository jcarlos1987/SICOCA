<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="resumendiligencias.aspx.vb" Inherits="WebSIRECA.resumendiligencias" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div class="btn-group input-prepend">
<asp:DropDownList ID="DDLSubdel" runat="server" Width="100px" AutoPostBack="True" CssClass="dropdown-toggle">
</asp:DropDownList>
<span class="add-on">
    ASIGNACI&Oacute;N DEL
</span> 
        <asp:TextBox ID="TBFechIni" runat="server" Width="80px"></asp:TextBox>
        <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechIni"></asp:CalendarExtender>
<span class="add-on">
    AL
</span> 
    <asp:TextBox ID="TBFechFin" runat="server" Width="80px"></asp:TextBox>
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechFin"></asp:CalendarExtender>
<span class="add-on">
        <asp:LinkButton ID="LinkButton2" runat="server" BackColor="#E3A42C" CssClass="btn"><i class="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
        <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#E3A42C" CssClass="btn"><i class="icon-refresh"></i>&nbsp;DESCARGAR</asp:LinkButton>
</span> 
</div> 

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceDili" AllowSorting="True" Font-Size="9pt" 
        HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO" />
            <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" ReadOnly="True" 
                SortExpression="SIVEPA" />
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" />
            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                SortExpression="PATRONES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                DataNavigateUrlFormatString="resumendiligenciadetalles.aspx?{0}" 
                DataTextField="CREDITOS" DataTextFormatString="{0:N0}" HeaderText="CREDITOS" 
                SortExpression="CREDITOS" Target="_blank">
            <ItemStyle HorizontalAlign="Right" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="EMISION" HeaderText="DEBE" ReadOnly="True" 
                SortExpression="EMISION" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="RECAUDACION" HeaderText="PAGO" 
                ReadOnly="True" SortExpression="RECAUDACION" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DIFERENCIA" HeaderText="SALDO" ReadOnly="True" 
                SortExpression="DIFERENCIA" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDili" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_INI AS VARCHAR(10)
DECLARE @FECHA_FIN AS VARCHAR(10)
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
SELECT
 'subdel='+@SUBDEL+'&amp;fechini='+@FECHA_INI+'&amp;fechfin='+@FECHA_FIN+'&amp;diligencia='+(
case 
when (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=DILIGENCIA) is null
then 'SIN DILIGENCIA'
else
 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=DILIGENCIA) 
end
)+'&amp;periodo='+[PERIODO]+'&amp;sivepa='+[SIVEPA]+'&amp;tipo='+[TIPO] as urlv
,@SUBDEL as subdelv
,TIPO
,SIVEPA
,PERIODO
,(
case 
when (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=DILIGENCIA) is null
then 'SIN DILIGENCIA'
else
 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=DILIGENCIA) 
end
) as DILIGENCIA
,COUNT(DISTINCT([REG_PATRONAL])) AS PATRONES
,COUNT([CREDITO]) AS CREDITOS
,SUM([EMI_REAL]) AS EMISION
,SUM([RECAUDACION]) AS RECAUDACION
,SUM([DIFERENCIA]) AS DIFERENCIA
FROM ( 
	SELECT
	[SV_TIPO] AS TIPO
	,[SV_SIVEPA] AS SIVEPA
	,substring(convert(varchar(10),[SV_PERIODO],103),4,7) as PERIODO
	,[SV_PERIODO] AS PERIODO_ORDEN
	,[SV_REG_PATRONAL] AS REG_PATRONAL
	,[SV_RAZON_SOCIAL] AS RAZON
	,[SV_CREDITO] AS CREDITO
	,[SV_COTIZ] AS COTIZ
	,[SV_EMI_REAL] AS EMI_REAL
	,[SV_RECAUDACION] AS RECAUDACION
	,[SV_DIFERENCIA] AS DIFERENCIA
	,[SV_ASIG_FECHA] AS FECH_ASIGNACION
	,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[SV_ASIG_INSPECTOR]) AS INSPECTOR
	,(SELECT MAX([SVD_FECH_DILI]) FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID]) AS FECH_DILIGENCIA
	,(SELECT TOP 1 [SVD_DILI] FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] ORDER BY [SVD_FECH_DILI] DESC) AS DILIGENCIA
	FROM [sirecasivepas].[dbo].[SV_BASE]
	where [SV_SUBDEL] = @SUBDEL
	and [SV_ASIG_FECHA] between @FECHA_INI and @FECHA_FIN
	and [SV_CREDITO] is not null
) AS RESULTADO
group by [TIPO]
,[SIVEPA]
,[PERIODO]
,DILIGENCIA">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" 
                Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

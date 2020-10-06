<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="resumendiligenciadetalles.aspx.vb" Inherits="WebSIRECA.resumendiligenciadetalles" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BorderColor="#35496A" BorderStyle="Solid" 
        CellPadding="1" CellSpacing="1" CssClass="table-bordered" 
        DataSourceID="SqlDataSource1" Font-Size="9pt" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" />
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO" />
            <asp:BoundField DataField="SIVEPAS" HeaderText="SIVEPAS" 
                SortExpression="SIVEPAS" ReadOnly="True">
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO_ORDEN" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" ReadOnly="True" 
                SortExpression="REG_PATRONAL" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                SortExpression="RAZON" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="COTIZ" DataFormatString="{0:N0}" 
                HeaderText="COTIZ" ReadOnly="True" SortExpression="COTIZ">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="EMI_REAL" DataFormatString="{0:C}" HeaderText="EMI_REAL" 
                ReadOnly="True" SortExpression="EMI_REAL">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="RECAUDACION" DataFormatString="{0:C}" HeaderText="RECAUDACION" 
                ReadOnly="True" SortExpression="RECAUDACION">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DIFERENCIA" DataFormatString="{0:C}" HeaderText="DIFERENCIA" 
                ReadOnly="True" SortExpression="DIFERENCIA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="FECH_ASIGNACION" DataFormatString="{0:d}" 
                HeaderText="FECH_ASIGNACION" ReadOnly="True" SortExpression="FECH_ASIGNACION" />
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="FECH_DILIGENCIA" DataFormatString="{0:d}" 
                HeaderText="FECH_DILIGENCIA" ReadOnly="True" SortExpression="FECH_DILIGENCIA" />
            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_INI AS VARCHAR(10)
DECLARE @FECHA_FIN AS VARCHAR(10)
DECLARE @DILIGENCIA AS VARCHAR(50)
DECLARE @PERIODO AS VARCHAR(10)
DECLARE @SIVEPA AS VARCHAR(15)
DECLARE @TIPO AS VARCHAR(15)
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
SET @DILIGENCIA=?
SET @PERIODO=?
SET @SIVEPA=?
SET @TIPO=?


SELECT
SUBDEL,TIPO,SIVEPAS,PERIODO,PERIODO_ORDEN,REG_PATRONAL,RAZON,CREDITO,COTIZ,EMI_REAL,RECAUDACION,DIFERENCIA,FECH_ASIGNACION,INSPECTOR,FECH_DILIGENCIA,DILIGENCIA
FROM ( 
	SELECT
	SV_SUBDEL AS SUBDEL
	,[SV_TIPO] AS TIPO
	,[SV_SIVEPA] AS SIVEPAS
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
WHERE
SUBDEL=@SUBDEL AND TIPO=@TIPO AND SIVEPAS=@SIVEPA AND PERIODO=@PERIODO AND (
case 
when (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=DILIGENCIA) is null
then 'SIN DILIGENCIA'
else
 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=DILIGENCIA) 
end
)=@DILIGENCIA
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="01" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="fechini" />
            <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                QueryStringField="fechfin" />
            <asp:QueryStringParameter DefaultValue="abcdef" Name="?" 
                QueryStringField="diligencia" />
            <asp:QueryStringParameter DefaultValue="01/2000" Name="?" 
                QueryStringField="periodo" />
            <asp:QueryStringParameter DefaultValue="SIVEPA-IMSS" Name="?" 
                QueryStringField="sivepa" />
            <asp:QueryStringParameter DefaultValue="SIVEPA_ANUAL" Name="?" 
                QueryStringField="tipo" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

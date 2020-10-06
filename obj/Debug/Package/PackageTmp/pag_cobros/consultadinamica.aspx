<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="consultadinamica.aspx.vb" Inherits="WebSIRECA.consultadinamica" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 200px;
        }
    </style>
    <script runat="server">
      Sub Check_Clicked(sender as Object, e As EventArgs) 
         Dim i As Integer
         HiddenFieldMOV.Value=""
         For i=0 To (CheckBoxListMV.Items.Count - 1)
            If CheckBoxListMV.Items(i).Selected Then
               HiddenFieldMOV.Value &= "'" & CheckBoxListMV.Items(i).Text & ",'"
            End If            
         Next
         if HiddenFieldMOV.Value.length>0
                HiddenFieldMOV.Value= HiddenFieldMOV.Value.Substring(0,(HiddenFieldMOV.Value.length-2))
         else
                HiddenFieldMOV.Value="TODOS"
         end if
         Message.Text=HiddenFieldMOV.Value
      End Sub
   </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
        <tr>
                <td class="style1">
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
                <td class="style1">
                    <asp:Panel ID="PanelHeaderOpciones" runat="server">OPCIONES</asp:Panel>
        <asp:Panel ID="PanelOpciones" runat="server" Width="200px">
            <asp:DropDownList ID="DDLSubdel" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="DDLTipo" runat="server" 
                DataSourceID="SqlDataSourceTipo" DataTextField="VALOR" 
                DataValueField="VALOR">
            </asp:DropDownList>
            <asp:DropDownList ID="DDLConsulta" runat="server">
                <asp:ListItem Value="GROUP">GRUPO</asp:ListItem>
                <asp:ListItem Value="TODOS">DETALLES</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="BBuscar" runat="server" Text="BUSCAR" />
            <asp:SqlDataSource ID="SqlDataSourceTipo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
DISTINCT([RA_TIPO]) AS VALOR
FROM [sirecacobros].[dbo].[CO_RALE]
WHERE [RA_VIVO]='SI'
AND RA_SUBDEL=?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
                    </td>
                <td rowspan="4">
                    <asp:Panel ID="PanelConsulta" runat="server" Height="450px" ScrollBars="Auto">
                        <asp:GridView ID="GVConsulta" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSourceConsulta" Font-Size="9pt">
                            <Columns>
                                <asp:BoundField DataField="INDEX" HeaderText="INDEX" SortExpression="INDEX" 
                                    ReadOnly="True" />
                                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                    SortExpression="SUBDEL" />
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                    SortExpression="TIPO" />
                                <asp:BoundField DataField="SUPERVISOR" HeaderText="SUPERVISOR" ReadOnly="True" 
                                    SortExpression="SUPERVISOR" />
                                <asp:BoundField DataField="FECH_ASIGNACION" HeaderText="FECH_ASIGNACION" 
                                    ReadOnly="True" SortExpression="FECH_ASIGNACION" />
                                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                    SortExpression="INSPECTOR" />
                                <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                                    ReadOnly="True" SortExpression="REG_PATRONAL" />
                                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                                <asp:BoundField DataField="MOVIMIENTO" HeaderText="MOVIMIENTO" ReadOnly="True" 
                                    SortExpression="MOVIMIENTO" />
                                <asp:BoundField DataField="TIPO_DOC" HeaderText="TIPO_DOC" ReadOnly="True" 
                                    SortExpression="TIPO_DOC" />
                                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                                    SortExpression="INCIDENCIA" />
                                <asp:BoundField DataField="CREDITO(S)" HeaderText="CREDITO(S)" ReadOnly="True" 
                                    SortExpression="CREDITO(S)" />
                                <asp:BoundField DataField="PERIODO(S)" HeaderText="PERIODO(S)" ReadOnly="True" 
                                    SortExpression="PERIODO(S)" />
                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                    SortExpression="IMPORTE" />
                                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                                    SortExpression="COTIZ" />
                                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                                    SortExpression="SECTOR" />
                                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                                    SortExpression="DOMICILIO" />
                                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                                    SortExpression="LOCALIDAD" />
                                <asp:BoundField DataField="CP" HeaderText="CP" ReadOnly="True" 
                                    SortExpression="CP" />
                                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" ReadOnly="True" 
                                    SortExpression="ACTIVIDAD" />
                                <asp:BoundField DataField="vigencia" HeaderText="vigencia" ReadOnly="True" 
                                    SortExpression="vigencia" />
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="Message" runat="server"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceConsulta" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(300)
DECLARE @GROUP_MOV as VARCHAR(300)
DECLARE @GROUP_TD as VARCHAR(300)
DECLARE @GROUP_INC as VARCHAR(300)
DECLARE @CONSULTA as VARCHAR(3000)
DECLARE @NUM_FILAS as VARCHAR(6)
DECLARE @VISTA as VARCHAR(5) 
SET @SUBDEL=?
SET @TIPO=?
SET @GROUP_MOV=?
SET @GROUP_TD=?
SET @GROUP_INC=?
SET @NUM_FILAS=?
--VISTA ESPESIFICA EN GROUP=GRUPO DE PATRONES O TODOS=CREDITOS
SET @VISTA=?

IF @VISTA='GROUP'
BEGIN
IF @NUM_FILAS='TODOS'
	SET @CONSULTA=' SELECT '
ELSE
	SET @CONSULTA=' SELECT TOP '+ @NUM_FILAS

SET @CONSULTA = @CONSULTA + ' 
 ROW_NUMBER() OVER(order by ra.[RA_REGPATR],ra.[RA_IMPORTE] desc) AS ''INDEX''
,[CP_SUBDEL] as SUBDEL
,RA_TIPO as TIPO
,[CP_ID_SUPER] as SUPERVISOR
,[CP_FECH_ASIG] as FECH_ASIGNACION
,[CP_INSPEC] as INSPECTOR
,[CP_REGPAT] as REG_PATRONAL
,ptn.razonSocial as RAZON_SOCIAL
,''...'' as MOVIMIENTO
,''...'' as TIPO_DOC
,''...'' as INCIDENCIA
,RA_CREDITOS as [CREDITO(S)]
,RA_PERIODOS as [PERIODO(S)]
,[RA_IMPORTE] as IMPORTE
,ptn.cotiz as COTIZ
,ptn.sector as SECTOR
,ptn.dom as DOMICILIO
,(CASE WHEN LEN(ptn.loc)&lt;=10 THEN ptn.loc ELSE (substring(ptn.loc,0,len(ptn.loc)-6)) END ) as LOCALIDAD
,(CASE WHEN LEN(ptn.loc)&lt;=10 THEN '''' ELSE (substring(ptn.loc,len(ptn.loc)-6,len(ptn.loc))) END) as CP
,ptn.act as ACTIVIDAD
,ptn.vigencia
  FROM ([sirecacobros].[dbo].[CO_CPATRONAL] inner join 
(select RA_TIPO,[RA_REGPATR],sum([RA_IMPORTE]) as [RA_IMPORTE],COUNT(RA_NUMCRED) as RA_CREDITOS,COUNT(DISTINCT(RA_PERIODO)) as RA_PERIODOS from sirecacobros.dbo.co_rale where [RA_SUBDEL]='''+@SUBDEL+'''
'
IF @GROUP_MOV&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + ' and [RA_MOV] in ('+@GROUP_MOV+') ' 
IF @GROUP_TD&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + ' and [RA_TD] in ('+@GROUP_TD+') '
IF @GROUP_INC&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + ' and [RA_INC] in ('+@GROUP_INC+') '
IF @TIPO&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + ' and [RA_TIPO] in ('''+@TIPO+''') '

SET @CONSULTA = @CONSULTA +' group by RA_TIPO,[RA_REGPATR]) as ra
on ra.[RA_REGPATR]=[CP_REGPAT]) left join sireca.dbo.patrones as ptn on [CP_REGPAT]=REGPAT
WHERE CP_SUBDEL='''+@SUBDEL+''' '
IF @TIPO&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and ra.[RA_TIPO] in ('''+@TIPO+''') '
SET @CONSULTA = @CONSULTA + ' order by ra.[RA_REGPATR],ra.[RA_IMPORTE] desc '
END
ELSE
BEGIN
IF @NUM_FILAS='TODOS'
	SET @CONSULTA='SELECT '
ELSE
	SET @CONSULTA='SELECT TOP '+ @NUM_FILAS

SET @CONSULTA= @CONSULTA + '
ROW_NUMBER() OVER(order by ra.[RA_REGPATR],CONVERT(DATETIME,ra.[RA_PERIODO])) AS ''INDEX''
,[CP_SUBDEL] as SUBDEL
,RA_TIPO as TIPO
,[CP_ID_SUPER] as SUPERVISOR
,[CP_FECH_ASIG] as FECH_ASIGNACION
,[CP_INSPEC] as INSPECTOR
,[CP_REGPAT] as REG_PATRONAL
,ptn.razonSocial as RAZON_SOCIAL
,(SELECT ''(''+[mov_pat]+'')''+[descripcion] FROM [sireca].[dbo].[mov_rale] WHERE [mov_pat]= [RA_MOV]) as MOVIMIENTO
,(SELECT ''(''+[docto]+'')''+[descripcion] FROM [sireca].[dbo].[doc_rale] WHERE [docto]=[RA_TD]) as TIPO_DOC
,(SELECT ''(''+[inc]+'')''+[descripcion] FROM [sireca].[dbo].[inc_rale] WHERE [inc]=[RA_INC]) as INCIDENCIA
,[RA_NUMCRED] as [CREDITO(S)]
,(SUBSTRING([RA_PERIODO],4,7)) as [PERIODO(S)]
,[RA_IMPORTE] as IMPORTE
,ptn.cotiz as COTIZ
,ptn.sector as SECTOR
,ptn.dom as DOMICILIO
,(CASE WHEN LEN(ptn.loc)&lt;=10 THEN ptn.loc ELSE (substring(ptn.loc,0,len(ptn.loc)-6)) END ) as LOCALIDAD
,(CASE WHEN LEN(ptn.loc)&lt;=10 THEN '''' ELSE (substring(ptn.loc,len(ptn.loc)-6,len(ptn.loc))) END) as CP
,ptn.act as ACTIVIDAD
,ptn.vigencia
  FROM ([sirecacobros].[dbo].[CO_CPATRONAL] inner join 
(select RA_TIPO,[RA_REGPATR],[RA_MOV],[RA_TD],[RA_INC],[RA_NUMCRED],[RA_PERIODO],[RA_IMPORTE] from sirecacobros.dbo.co_rale where [RA_SUBDEL]='''+@SUBDEL+''' 
'
IF @GROUP_MOV&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_MOV] in ('+@GROUP_MOV+')' 
IF @GROUP_TD&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_TD] in ('+@GROUP_TD+') '
IF @GROUP_INC&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_INC] in ('+@GROUP_INC+') '
IF @TIPO&lt;&gt;'TODOS'
	SET @CONSULTA = @CONSULTA + 'and [RA_TIPO] in ('''+@TIPO+''') '

SET @CONSULTA = @CONSULTA +
' ) as ra
on ra.[RA_REGPATR]=[CP_REGPAT]) left join sireca.dbo.patrones as ptn on [CP_REGPAT]=REGPAT
WHERE CP_SUBDEL='''+@SUBDEL+'''
order by ra.[RA_REGPATR],CONVERT(DATETIME,ra.[RA_PERIODO]) '
END
EXEC(@CONSULTA)
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="COP" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HiddenFieldMOV" DefaultValue="TODOS" Name="?" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="HiddenFieldTD" DefaultValue="TODOS" Name="?" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="HiddenFieldINC" DefaultValue="TODOS" Name="?" 
                                    PropertyName="Value" />
                                <asp:Parameter DefaultValue="TODOS" Name="?" />
                                <asp:ControlParameter ControlID="DDLConsulta" DefaultValue="TODOS" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Panel ID="PanelHeaderMV" runat="server">MOV</asp:Panel> 
                    <asp:Panel ID="PanelMV" runat="server" Height="120px" ScrollBars="Auto" 
                        Width="200px">
                        <asp:CheckBoxList ID="CheckBoxListMV" runat="server" 
                            DataSourceID="SqlDataSourceMOV" DataTextField="VALOR" 
                            DataValueField="VALOR" AutoPostBack="True" OnSelectedIndexChanged="Check_Clicked">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSourceMOV" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
DISTINCT([RA_MOV]) AS VALOR
FROM [sirecacobros].[dbo].[CO_RALE]
WHERE [RA_VIVO]='SI'
AND RA_SUBDEL=?">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:HiddenField ID="HiddenFieldMOV" runat="server" Value="TODOS" />
                    </asp:Panel>
                    </td>
                <td>
                    &nbsp;
      &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Panel ID="PanelHeaderTD" runat="server">TD</asp:Panel>
        <asp:Panel ID="PanelTD" runat="server" Height="120px" ScrollBars="Auto" Width="200px">
            <asp:CheckBoxList ID="CheckBoxListTD" runat="server" 
                DataSourceID="SqlDataSourceTD" DataTextField="VALOR" DataValueField="VALOR">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSourceTD" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
DISTINCT([RA_TD]) AS VALOR
--,[RA_INC]
FROM [sirecacobros].[dbo].[CO_RALE]
WHERE [RA_VIVO]='SI'
AND RA_SUBDEL=?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenFieldTD" runat="server" Value="TODOS" />
        </asp:Panel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Panel ID="PanelHeaderINC" runat="server">INC</asp:Panel>
        <asp:Panel ID="PanelINC" runat="server" Height="120px" ScrollBars="Auto" Width="200px">
            <asp:CheckBoxList ID="CheckBoxListINC" runat="server" 
                DataSourceID="SqlDataSourceINC" DataTextField="VALOR" DataValueField="VALOR" 
                Width="95px">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSourceINC" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
DISTINCT([RA_INC]) AS VALOR
FROM [sirecacobros].[dbo].[CO_RALE]
WHERE [RA_VIVO]='SI'
AND RA_SUBDEL=?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenFieldINC" runat="server" Value="TODOS" />
        </asp:Panel>
                    </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
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
                <td class="style1">
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
                <td class="style1">
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
                <td class="style1">
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
                <td class="style1">
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
    </div>
    </form>
</body>
</html>

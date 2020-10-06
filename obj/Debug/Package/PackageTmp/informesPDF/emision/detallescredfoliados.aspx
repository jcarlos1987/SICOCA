<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallescredfoliados.aspx.vb" Inherits="WebSIRECA.detallescredfoliados" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DETALLES</title>    
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../css/sireca.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <center><a href="javascript:window.print();"><i class="icon-print"></i></a>
        <asp:Label ID="Label2" runat="server" Text="Impreso:" 
            Font-Bold="True" Font-Names="Arial" Font-Size="10pt"></asp:Label>
        <%: Now.ToLongDateString() %>
        <asp:Label ID="Label4" runat="server" Text=" a las " Font-Bold="True" 
            Font-Names="Arial" Font-Size="10pt"></asp:Label>
        <%:Now.ToLongTimeString() %>
        <br/>
        <asp:Repeater ID="Repeater1" runat="server" 
            DataSourceID="SqlDataSourceFoliados0">
            <ItemTemplate>
                <asp:Label ID="Label10" runat="server" Text="CONFIRMO: " Font-Bold="True" Font-Size="9" Font-Names="Arial"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("V_CONFIRMO")%>' Font-Size="9" Font-Names="Arial"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text=" EL FOLIO: " Font-Bold="True" Font-Size="9" Font-Names="Arial"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text='<%# Eval("V_FOLIO")%>' Font-Size="9" Font-Names="Arial"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text=", " Font-Size="10" Font-Names="Arial"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("V_DESCRIPCION")%>' Font-Size="9" Font-Names="Arial"></asp:Label>
            </ItemTemplate>
        </asp:Repeater>
        </center>
        <asp:GridView ID="GridViewFoliados" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceFoliados" Font-Size="10pt" AllowSorting="True" 
            HorizontalAlign="Center" 
            Caption="&lt;strong&gt;DETALLES DE CREDITOS TURNADOS&lt;/strong&gt;" 
            CellPadding="1" CellSpacing="1" Font-Names="Arial">
            <Columns>
                <asp:BoundField DataField="N" HeaderText="N°" SortExpression="N">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="V_REGPAT">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="V_RAZON_SOCIAL" />
                <asp:BoundField DataField="V_SECTOR" HeaderText="SEC." ReadOnly="True" 
                    SortExpression="V_SECTOR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="V_CREDITO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="V_PERIODO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_TD" HeaderText="TD" SortExpression="V_TD">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_OMISION" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="V_OMISION">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FECHA_CAPTURA" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE DILIGENCIA" SortExpression="V_FECHA_CAPTURA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="V_SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_COTIZ" DataFormatString="{0:N0}" 
                    HeaderText="COTIZ" ReadOnly="True" SortExpression="V_COTIZ">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="DILIGENCIA" 
                    ReadOnly="True" SortExpression="V_INC_CAPTURA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="V_TIPO_ECO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
<asp:Panel ID="Panel1" runat="server" >
<asp:LinkButton ID="LBHF" runat="server" ><i class ="icon-remove"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBHF" PopupControlID="PanelAct" DropShadow="true" CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" Height="200px" Width="400px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label4" runat="server" Text="Confirme la eliminación del Credito de este folio" Font-Size="18" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
	<asp:LinkButton ID="LBguardar" runat="server" CssClass ="btn btn-success" OnClick="LBguardar_Click" CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("V_SUBDEL") & "-" & Eval("V_FOLIO") & "-" & Eval("V_CREDITO")& "-" & Eval("V_ID") %>' Height="50"><i class="icon-ok"></i><br/>ELIMINAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarAct" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" Height="50"><i class="icon-remove"></i><br/>CANCELAR</asp:LinkButton>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
</asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceFoliados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
DECLARE @FOLIO as VARCHAR(7)
DECLARE @TIPO_ECO as VARCHAR(15)
DECLARE @FECHA_INC_CAP as VARCHAR(10)
DECLARE @ADD_WHERE1 as VARCHAR(50)
DECLARE @ADD_WHERE2 as VARCHAR(100)
DECLARE @ADD_WHERE3 as VARCHAR(100)
DECLARE @FOLIO_ANIO as VARCHAR(50)
DECLARE @DBO AS VARCHAR(50)
SET @SUBDEL=?
SET @FOLIO=?
SET @INC_CAP=?
SET @TIPO_ECO=?
SET @FECHA_INC_CAP=?
SET @FOLIO_ANIO=?
SET @FOLIO_ANIO=(CASE WHEN @FOLIO_ANIO='2000' THEN '' ELSE ' and year([V_FECHA_P1_TURNADO])= '''+@FOLIO_ANIO+''' ' END)
SET @DBO=(CASE WHEN charindex('SIVEPA',@TIPO_ECO)=1 THEN 'sivepas' ELSE 'eco' END)

IF @FOLIO='0'
BEGIN
	SET @ADD_WHERE1=' V_FOLIO_P1 is null '	
END
ELSE
BEGIN
	SET @ADD_WHERE1=' V_FOLIO_P1 = '''+@FOLIO+''''
END

IF (@INC_CAP='2' and @FOLIO='0')
BEGIN
	SET @ADD_WHERE2=' and convert(varchar(10),V_FECHA_CAPTURA,103)='''+@FECHA_INC_CAP+''''
END
ELSE
BEGIN
	SET @ADD_WHERE2=''
END

IF (@INC_CAP in ('PAGADO','2') and @FOLIO='0')
BEGIN
	SET @ADD_WHERE3=' and V_TIPO_ECO='''+@TIPO_ECO+''''
END
ELSE
BEGIN
	SET @ADD_WHERE3=''
END


EXEC('select 
ROW_NUMBER() OVER (order by V_REGPAT,convert(datetime,''01/''+V_PERIODO,103)) as N
,V_SUBDEL
,V_FOLIO
,V_TD as V_TD
,convert(datetime,V_CONFIRMADO,103) as V_CONFIRMADO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_CONFIRMO) as V_CONFIRMO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_TURNADO) as V_TURNADO
,convert(datetime,V_TURNO,103) as V_TURNO
,datediff(day,V_TURNO,getdate()) as V_DIAS_TRANSCURRIDOS
,V_DESCRIPCION 
,V_TIPO_ECO
,V_REGPAT
,V_RAZON_SOCIAL
,V_CREDITO
,V_COTIZ
,V_OMISION
,V_PERIODO
,V_INC_CAPTURA
,V_SECTOR
,[V_FECHA_CAPTURA]
,V_ID
from (
SELECT 
V_SUBDEL
,V_TD
,[V_FOLIO_P1] as V_FOLIO
,convert(varchar(10),[V_FECHA_CONFIRMACION_INC_P1],103) as V_CONFIRMADO
,[V_ID_CONFIRMO_P1] as V_CONFIRMO
,[V_FOLIO_P1_TURNADO_A] as V_TURNADO
,convert(varchar(10),[V_FECHA_P1_TURNADO],103) as V_TURNO
,[V_FOLIO_P1_OBSERVACION] as V_DESCRIPCION
,V_TIPO_ECO
,V_REGPAT
,V_RAZON_SOCIAL
,V_CREDITO
,V_COTIZ
,V_OMISION
,V_PERIODO
,V_INC_CAPTURA
,V_SECTOR
,[V_FECHA_CAPTURA]
,V_ID
FROM [sirecaemisiones].[dbo].['+@DBO+']
WHERE '+@ADD_WHERE1+'
'+@FOLIO_ANIO+'
) as resultado
where V_SUBDEL like '''+@SUBDEL+'''
and (case when V_INC_CAPTURA in (''RE'',''POR PROCESAR'',''PAGADO'',''A'') then ''PAGADO'' else V_INC_CAPTURA end)='''+@INC_CAP+'''
'+@ADD_WHERE2+'
'+@ADD_WHERE3+'
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="folio" />
                <asp:QueryStringParameter DefaultValue="x" Name="?" 
                    QueryStringField="inc_captura" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" 
                    QueryStringField="tipo_eco" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fecha_captura" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenFieldSubdel" runat="server" />
        
        <asp:GridView ID="GridViewFoliados0" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceFoliados0" Font-Size="10pt" AllowSorting="True" 
            HorizontalAlign="Center" CellPadding="1" 
            CellSpacing="1" BorderStyle="None" GridLines="None" ShowHeader="False" 
            Font-Names="Arial">
            <Columns>
                <asp:TemplateField HeaderText="TURNADO" SortExpression="V_TURNADO">
                    <ItemTemplate>
                    TURNADO
                    <br /><br />
                    _________________________________________
                    <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("V_TURNADO") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("V_TURNO","{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceFoliados0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FOLIO as VARCHAR(7)
DECLARE @INC_CAP as VARCHAR(7)
DECLARE @FOLIO_ANIO as VARCHAR(40)
DECLARE @TIPO_ECO as VARCHAR(15)
DECLARE @DBO AS VARCHAR(50)
SET @SUBDEL=?
SET @FOLIO=?
SET @INC_CAP=?
SET @FOLIO_ANIO=?
SET @TIPO_ECO=?
SET @DBO=(CASE WHEN charindex('SIVEPA',@TIPO_ECO)=1 THEN 'sivepas' ELSE 'eco' END)
SET @FOLIO_ANIO=(CASE WHEN @FOLIO_ANIO='2000' THEN '' ELSE ' and year([V_FECHA_P1_TURNADO])= '''+@FOLIO_ANIO+''' ' END)
exec('
select top 1 V_SUBDEL
,V_FOLIO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_CONFIRMO) as V_CONFIRMO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_TURNADO) as V_TURNADO
,convert(datetime,V_TURNO,103) as V_TURNO
,V_DESCRIPCION
from (
SELECT 
V_SUBDEL
,[V_FOLIO_P1] as V_FOLIO
,[V_ID_CONFIRMO_P1] as V_CONFIRMO
,[V_FOLIO_P1_TURNADO_A] as V_TURNADO
,convert(varchar(10),[V_FECHA_P1_TURNADO],103) as V_TURNO
,[V_FOLIO_P1_OBSERVACION] as V_DESCRIPCION
,V_INC_CAPTURA
,[V_FECHA_P1_TURNADO]
FROM [sirecaemisiones].[dbo].['+@DBO+']
) as resultado
where V_SUBDEL like '''+@SUBDEL+''' and [V_FOLIO] ='''+@FOLIO+'''
and (case when V_INC_CAPTURA in (''RE'',''POR PROCESAR'',''PAGADO'',''A'') then ''PAGADO'' else V_INC_CAPTURA end)='''+@INC_CAP+'''
'+@FOLIO_ANIO+'
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="00000" Name="?" 
                    QueryStringField="folio" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="inc_captura" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" 
                    QueryStringField="tipo_eco" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

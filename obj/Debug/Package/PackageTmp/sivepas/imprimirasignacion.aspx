<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="imprimirasignacion.aspx.vb" Inherits="WebSIRECA.imprimirasignacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IMPRIMIR</title>
    <style type="text/css">
        .style2
        {
            width: 256px;
        }
        body {
	font-family: "Calibri";
}
        .style3
        {
            width: 262px;
        }
        .style4
        {
            width: 262px;
        }
    </style>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn" BorderColor="#BCC7D8" onclientclick="javascript:window.print();"><i class="icon-print"></i><i title="IMPRIMIR ASIGNACIÓN">ASIGNACIÓN</i></asp:LinkButton>
        <asp:LinkButton ID="LBContNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-print"></i><i title="CONTROL DE TRABAJO DEL DESPACHO DE LA DILIGENCIA DE LA NOTIFICACION">CONT.NOTIFICACION</i></asp:LinkButton>
    </span>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSourceFechas" DataTextField="fechas" 
            DataValueField="fechas" AutoPostBack="True" Width="120px">
        </asp:DropDownList>
        <span class="add-on">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-refresh"></i></asp:LinkButton>
        </span>
        </div> 
        <br />
    <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="CITATORIOS"></asp:Label>
    </span>
        <span class="add-on">
        <asp:LinkButton ID="LBCopFisica" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA FISICA">COP(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBCopMoral" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA MORAL">COP(MORAL)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvFisica" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA FISICA">RCV(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvMoral" runat="server" CssClass="btn" 
            BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA MORAL">RCV(MORAL)</i></asp:LinkButton>
        </span>
    </div> 
        <br />
    <div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="Label2" runat="server" Text="ACT. DE NOTIFICACIÓN"></asp:Label>
        </span>
        <span class="add-on">        
        <asp:LinkButton ID="LBCopFisicaActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA FISICA">COP(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBCopMoralActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA MORAL">COP(MORAL)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvFisicaActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA FISICA">RCV(FISICA)</i></asp:LinkButton>
        <asp:LinkButton ID="LBRcvMoralActNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR ACTA DE NOTIFICACIÓN DE PERSONA MORAL">RCV(MORAL)</i></asp:LinkButton>
        </span> 
    </div> 
        <br />
    <div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="Label3" runat="server" Text="IMPRIMIR DOC. DEL"></asp:Label>
        </span>
        <asp:TextBox ID="TBBuscar" runat="server" MaxLength="10"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="TBBuscar" 
            WatermarkText="REGISTRO PATRONAL"></asp:TextBoxWatermarkExtender> 
        <span class="add-on">
            <asp:LinkButton ID="LBBuscar" runat="server" CssClass ="btn">Buscar</asp:LinkButton>
        </span> 
   </div> 
        <br />
        <asp:SqlDataSource ID="SqlDataSourceFechas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select top 15 fechas as fechas
from 
(
SELECT (convert(nvarchar(11),[SV_ASIG_INSPECTOR_FECHA],103)) as fechas
FROM  [sirecasivepas].[dbo].[SV_BASE]
where [SV_ASIG_INSPECTOR_FECHA] is not null
and [SV_SUBDEL]=? and [SV_ASIG_INSPECTOR]=?
) as resultado
group by fechas
order by convert(datetime,fechas,103) desc
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0000" Name="?" 
                    SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="idinspector" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" 
            ImageAlign="Left" ImageUrl="~/imagenes/imprimir1.jpg" 
            onclientclick="javascript:window.print();" Width="40px" />
    <asp:Label ID="LNombre1" runat="server" Text=""></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="Factura(s)" 
            CellPadding="3" DataSourceID="SqlDataSource2" Font-Size="8pt" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" ReadOnly="True" />
                <asp:BoundField DataField="FECHA_EMISION_SIVEPA" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE EMISION DEL SIVEPA" SortExpression="FECHA_EMISION_SIVEPA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" 
                    SortExpression="TIPO" ReadOnly="True" />
                <asp:BoundField DataField="SIVEPA" HeaderText="SIVEPA" 
                    SortExpression="SIVEPA" ReadOnly="True" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" 
                    SortExpression="REGPAT" ReadOnly="True" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="EMISION" HeaderText="EMISION" ReadOnly="True" 
                    SortExpression="EMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RECAUDACION" HeaderText="RECAUDACION" 
                    ReadOnly="True" SortExpression="RECAUDACION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DIFERENCIA" HeaderText="DIFERENCIA" ReadOnly="True" 
                    SortExpression="DIFERENCIA" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>"             
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INSPECTOR AS VARCHAR(6)
DECLARE @FECH_INICIO AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECH_INICIO=?
SET @FECH_FIN=?

SELECT 
[CPSV_SUBDEL] as SUBDEL
,SV_FECHA as FECHA_EMISION_SIVEPA
,(case when SV_TIPO='SIVEPA_OPORT' then 'OPORTUNO' WHEN SV_TIPO='SIVEPA_ANUAL' THEN 'ANUAL' else 'EXTEMPORANEO' end) as TIPO
,(case when SV_SIVEPA='SIVEPA-IMSS' then 'COP' else 'RCV' end ) as SIVEPA
,[CPSV_REGPAT] as REGPAT
,razonSocial as RAZON_SOCIAL
,substring(convert(nvarchar(10),SV_PERIODO,103),4,7) as PERIODO
,SV_CREDITO as CREDITO
,SV_COTIZ as COTIZANTES
,SV_EMI_REAL as EMISION
,SV_RECAUDACION as RECAUDACION
,SV_DIFERENCIA as DIFERENCIA
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[CPSV_INSPEC]) as INSPECTOR
FROM [sirecasivepas].[dbo].[SV_CPATRONAL] as cptn 
LEFT JOIN [sireca].[dbo].[patrones] as ptn on ptn.regpat=substring(cptn.[CPSV_REGPAT],1,10)
LEFT JOIN [sirecasivepas].[dbo].[SV_BASE] on SV_REG_PATRONAL=cptn.[CPSV_REGPAT]
WHERE convert(varchar(10),[CPSV_FECH_ASIG],103) between CONVERT(DATETIME,@FECH_INICIO,103) and CONVERT(DATETIME,@FECH_FIN,103) and [CPSV_INSPEC]=@INSPECTOR
and [CPSV_REGPAT] like ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="9999" Name="?" 
                    QueryStringField="idinspector" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechaini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechafin" />
                <asp:ControlParameter ControlID="TBBuscar" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <table style="width: 890;">
        <tr>
            <td class="style3">
                <asp:Label ID="LNombre2" runat="server" Font-Size="10pt"></asp:Label>
<hr/>
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
                <hr/>
            </td>
        </tr>
        <tr>
            <td class="style3" align="center">
                <strong>Nombre y Firma del Inspector</strong> </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                <strong>Nombre y Firma del Supervisor</strong> </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
    </center>
</body>
</html>

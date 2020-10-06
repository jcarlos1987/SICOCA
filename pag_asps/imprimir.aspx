<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="imprimir.aspx.vb" Inherits="WebSIRECA.imprimir" %>
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
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn" BorderColor="#BCC7D8" onclientclick="javascript:window.print();"><i class="icon-print"></i><i title="IMPRIMIR ASIGNACIÓN">ASIGNACIÓN</i></asp:LinkButton>
        <asp:LinkButton ID="LBContNot" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-print"></i><i title="CONTROL DE TRABAJO DEL DESPACHO DE LA DILIGENCIA DE LA NOTIFICACION">CONT.NOTIFICACION</i></asp:LinkButton>
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
        <asp:LinkButton ID="LBRcvMoral" runat="server" CssClass="btn" BorderColor="#BCC7D8"><i class="icon-file"></i><i title="IMPRIMIR CITATORIO DE PERSONA MORAL">RCV(MORAL)</i></asp:LinkButton>
        </span> 
    </div> 
    <br />
    <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:Label ID="Label2" runat="server" Text="ACTAS DE NOTIFICACIÓN"></asp:Label>
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
    <asp:Label ID="LNombre1" runat="server" Text=""></asp:Label><br />
    <asp:DropDownList ID="DDLInc" runat="server" AutoPostBack="True">
        <asp:ListItem Value="%">TODAS LAS CAPTURAS</asp:ListItem>
        <asp:ListItem Value="2">CAPTURA DE NOTIFICADOS</asp:ListItem>
        <asp:ListItem Value="9">CAPTURA DE NO LOCALIZADOS</asp:ListItem>
        </asp:DropDownList><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" Caption="Factura(s)" 
            CellPadding="3" DataSourceID="SqlDataSource2" Font-Size="7pt" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="fechaEco" HeaderText="PERIODO" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="tipoEco" HeaderText="TIPO" 
                    SortExpression="tipoEco" />
                <asp:BoundField DataField="emi_sec" HeaderText="SECTOR" 
                    SortExpression="emi_sec" />
                <asp:BoundField DataField="incidencia" HeaderText="DILIGENCIA" 
                    SortExpression="incidencia" />
                <asp:BoundField DataField="horaCitatorio" HeaderText="Hora del Citatorio" 
                    SortExpression="horaCitatorio" DataFormatString="{0:t}" />
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE_O_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="NOMBRE_O_RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton ID="printRectDom" runat="server" CommandArgument ='<%# Eval("id_eco") %>' 
                            ToolTip="9313-009-047 INVITACION PARA RATIFICAR O RECTIFICAR DOM" 
                            onprerender="printRectDom_PreRender"><i class="icon-print"></i></asp:LinkButton>
                    <asp:LinkButton ID="printDomDistinct" runat="server" CommandArgument ='<%# Eval("id_eco") %>' 
                            ToolTip="9313-009-048 INFORME DE NOTIFICACION EN DOMICILIO DISTINTO" 
                            onprerender="printDomDistinct_PreRender"><i class="icon-print"></i></asp:LinkButton>
                    <asp:LinkButton ID="printActCircunsHechos" Visible ='<%# IIF(Eval("incidencia")="9" or Session.Item("SIRECAprintEmisionCitNot").ToString="1","true","false")%>' runat="server" CommandArgument ='<%# Eval("id_eco") %>' 
                            ToolTip="ACTA CIRCUNSTANCIADA DE HECHOS" 
                            onprerender="printActCircunsHechos_PreRender"><i class="icon-print"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(10)
DECLARE @REGPAT as VARCHAR(15)
DECLARE @FECH_ASIG as VARCHAR(10)
DECLARE @INC as VARCHAR(10)

SET @INSPECTOR=?
SET @SUBDEL=?
SET @FECH_ASIG=?
SET @INC=?
SET @REGPAT=?
select *
,isnull((
SELECT top 1 [REG#PATRONAL]
FROM [sireca].[dbo].[eco] AS ECON
WHERE ECON.incidencia='9' and ECON.subdel=@SUBDEL and ECON.[REG#PATRONAL]=RESULTADOT.[REG#PATRONAL] 
and ('01/'+(case
when ECON.[tipoECO] in ('COP','COMP') then
(case 
	when len(ECON.fechaeco)=5 then '0'+substring(convert(varchar,ECON.fechaeco),1,1)+'/'+substring(convert(varchar,ECON.fechaeco),2,4) 
	else substring(convert(varchar,ECON.fechaeco),1,2)+'/'+substring(convert(varchar,ECON.fechaeco),3,4) 
end)

when ECON.[tipoECO] in ('RCV','RCVCOMP') then
(case 
	when len(ECON.fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(nvarchar,ECON.fechaeco),1,1))/2)+'/'+substring(convert(nvarchar,ECON.fechaeco),2,4) 
	else '0'+convert(nvarchar(2),convert(int,substring(convert(nvarchar,ECON.fechaeco),1,2))/2)+'/'+substring(convert(nvarchar,ECON.fechaeco),3,4) 
end)
end)
)=(case 
when RESULTADOT.tipoEco in ('COP','COMP') then dateadd(month,-1,'01/'+RESULTADOT.fechaEco)
when RESULTADOT.tipoEco in ('RCV','RCVCOMP') then dateadd(month,-2,'01/'+RESULTADOT.fechaEco)
end)
),'0') as color 
from (
SELECT
eco.id as id_eco 
,ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL
, ptn.dom AS EMIP_DOM, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#
, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL
,(case
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as fechaEco, eco.sector AS emi_sec
, isnull(eco.incidencia,'') as incidencia, convert(datetime,eco.horaCitatorio,108) as horaCitatorio 
,substring(ptn.loc,1,6) as muni
,substring(ptn.loc,len(ptn.loc)-5,6) as cp
FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) 
WHERE (eco.responsable = @INSPECTOR) AND (eco.subdel = @SUBDEL) AND convert(varchar(11),eco.fechaSeleccion,103)=@FECH_ASIG
and (eco.incidencia like @INC or eco.incidencia is null)
and SUBSTRING(eco.REG#PATRONAL,1,10) like @REGPAT
) as RESULTADOT
ORDER BY emi_sec, muni, cp, EMIP_DOM
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00000" Name="?" SessionField="SIRECAid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="fecha" />
                <asp:ControlParameter ControlID="DDLInc" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBBuscar" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceResumenIncidencias" 
            Font-Size="10pt" GridLines="None">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" NullDisplayText="SIN DILIGENCIAR">
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                    SortExpression="TOTAL">
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="COP" HeaderText="COP" ReadOnly="True" 
                    SortExpression="COP" />
                <asp:BoundField DataField="COMP" HeaderText="COMP" ReadOnly="True" 
                    SortExpression="COMP" />
                <asp:BoundField DataField="RCV" HeaderText="RCV" ReadOnly="True" 
                    SortExpression="RCV" />
                <asp:BoundField DataField="RCVCOMP" HeaderText="RCVCOMP" ReadOnly="True" 
                    SortExpression="RCVCOMP" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceResumenIncidencias" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RESPONSABLE VARCHAR(50)
DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECHABUSQUEDA VARCHAR(50)
SET @RESPONSABLE = ?
SET @SUBDEL = ?
SET @FECHABUSQUEDA = ?
SELECT 
(SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = incidencia) as INCIDENCIA
, COUNT(*) as TOTAL
, (
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='COP'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND (convert(nvarchar(11),eco2.fechaSeleccion,103)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;COP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='COMP'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND (convert(nvarchar(11),eco2.fechaSeleccion,103)=substring( @FECHABUSQUEDA ,1,11))
) as &quot;COMP&quot;
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='RCV'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR') =isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND (convert(nvarchar(11),eco2.fechaSeleccion,103)=substring( @FECHABUSQUEDA ,1,11))
) as RCV
,(
SELECT count(*)
FROM sireca.dbo.eco AS eco2
WHERE (eco2.responsable = @RESPONSABLE) 
AND (eco2.subdel = @SUBDEL) 
AND eco2.tipoECO='RCVCOMP'
and (isnull(eco2.incidencia,'SIN DILIGENCIAR')=isnull(eco.incidencia,'SIN DILIGENCIAR'))
AND (convert(nvarchar(11),eco2.fechaSeleccion,103)=substring( @FECHABUSQUEDA ,1,11))
) as RCVCOMP
FROM sireca.dbo.eco AS eco 
WHERE eco.responsable = @RESPONSABLE
AND eco.subdel = @SUBDEL
AND convert(nvarchar(11),eco.fechaSeleccion,103)=@FECHABUSQUEDA
and (eco.incidencia like ? or eco.incidencia is null)
group by incidencia
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="2012-05-29 07:11:15.000" Name="?" 
                    QueryStringField="fecha" />
                <asp:ControlParameter ControlID="DDLInc" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
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
            <td class="style3" align="center">
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

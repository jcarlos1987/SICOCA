<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="resultadosNotificados.aspx.vb" Inherits="WebSIRECA.resultadosNotificados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body {
	font-family: "Calibri";
	}
 </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceResultadoGeneral" 
            GridLines="None" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="CASOS" HeaderText="CASOS" ReadOnly="True" 
                    SortExpression="CASOS" />
                <asp:BoundField DataField="OMISION" DataFormatString="{0:C}" 
                    HeaderText="OMISION" ReadOnly="True" SortExpression="OMISION" />
                <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                    ReadOnly="True" SortExpression="MULTA" />
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
        <asp:SqlDataSource ID="SqlDataSourceResultadoGeneral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct(SELECT ctl.ACTIVIDAD  FROM sireca .dbo.catalogo as ctl WHERE ctl.[CVE DILIG#] = eco.incidencia) AS INCIDENCIA
,COUNT(*) AS CASOS,SUM(OMISION) AS OMISION,SUM(MULTA) AS MULTA
FROM [sireca].[dbo].[eco] as eco
WHERE subdel = '01'
and fechaEco = '32012'
and tipoEco = 'COP'
and cobrarMulta ='1'
GROUP BY incidencia"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourcePAEs" ShowFooter="True" 
            BackImageUrl="~/imagenes/fondo.png" Font-Bold="False" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="NOTIFICADOR" HeaderText="INSPECTOR" 
                    ReadOnly="True" SortExpression="NOTIFICADOR" />
                <asp:BoundField DataField="TOTAL" HeaderText="CASOS" ReadOnly="True" 
                    SortExpression="TOTAL" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=all" 
                    DataTextField="TOTAL" HeaderText="CASOS" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="TOTAL" 
                    Target="_blank" />
                <asp:BoundField DataField="MUEBLE" HeaderText="MUEBLE" ReadOnly="True" 
                    SortExpression="MUEBLE" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=EM" 
                    DataTextField="MUEBLE" HeaderText="MUEBLE" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="MUEBLE" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_EM" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" ReadOnly="True" 
                    SortExpression="$OMISION_EM" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_EM" DataFormatString="{0:C}" HeaderText="$MULTA" 
                    NullDisplayText="0" ReadOnly="True" SortExpression="$MULTA_EM" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="INMUEBLE" HeaderText="INMUEBLE" ReadOnly="True" 
                    SortExpression="INMUEBLE" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=EI" 
                    DataTextField="INMUEBLE" HeaderText="INMUEBLE" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="INMUEBLE" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_EI" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" ReadOnly="True" 
                    SortExpression="$OMISION_EI" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_EI" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" ReadOnly="True" 
                    SortExpression="$MULTA_EI" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="EMBARGO_CUENTAS" HeaderText="EMBARGO CUENTAS" 
                    ReadOnly="True" SortExpression="EMBARGO_CUENTAS" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=EC" 
                    DataTextField="EMBARGO_CUENTAS" HeaderText="EMBARGO CUENTAS" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" 
                    SortExpression="EMBARGO_CUENTAS" Target="_blank" />
                <asp:BoundField DataField="$OMISION_EC" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" ReadOnly="True" 
                    SortExpression="$OMISION_EC" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_EC" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" ReadOnly="True" 
                    SortExpression="$MULTA_EC" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="RECAUDACION(PAGADO)" 
                    HeaderText="RECAUDACION(PAGADO)" ReadOnly="True" 
                    SortExpression="RECAUDACION(PAGADO)" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=RE" 
                    DataTextField="RECAUDACION(PAGADO)" HeaderText="RECAUDACION(PAGADO)" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" 
                    SortExpression="RECAUDACION(PAGADO)" Target="_blank" />
                <asp:BoundField DataField="$OMISION_RE" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_RE" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_RE" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_RE" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="POR PROCESAR" HeaderText="POR PROCESAR" 
                    SortExpression="POR PROCESAR" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=POR PROCESAR" 
                    DataTextField="POR PROCESAR" HeaderText="POR PROCESAR" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="POR PROCESAR" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_PP" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_PP" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_PP" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_PP" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="NOTIFICADO" HeaderText="PENDIENTES" 
                    SortExpression="NOTIFICADO" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=2" 
                    DataTextField="NOTIFICADO" HeaderText="PENDIENTES" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="NOTIFICADO" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_2" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_2" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_2" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_2" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="CITATORIO" HeaderText="CITATORIO" 
                    SortExpression="CITATORIO" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=1" 
                    DataTextField="CITATORIO" HeaderText="CITATORIO" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="CITATORIO" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_1" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_1" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_1" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_1" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="CONVENIO" HeaderText="CONVENIO" 
                    SortExpression="CONVENIO" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=17" 
                    DataTextField="CONVENIO" HeaderText="CONVENIO" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="CONVENIO" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_17" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_17" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_17" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_17" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="EN ACLARACION" HeaderText="EN ACLARACION" 
                    SortExpression="EN ACLARACION" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=3" 
                    DataTextField="EN ACLARACION" HeaderText="EN ACLARACION" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="EN ACLARACION" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_3" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_3" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_3" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_3" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="NO LOCALIZADO" HeaderText="NO LOCALIZADO" 
                    SortExpression="NO LOCALIZADO" />
                <asp:HyperLinkField DataNavigateUrlFields="idUser,fechaEco" 
                    DataNavigateUrlFormatString="detallesSeleccion.aspx?tipo=PAE&amp;responsable={0}&amp;periodo={1}&amp;tipo2=9" 
                    DataTextField="NO LOCALIZADO" HeaderText="NO LOCALIZADO" 
                    NavigateUrl="~/pag_asps/detallesSeleccion.aspx" SortExpression="NO LOCALIZADO" 
                    Target="_blank" />
                <asp:BoundField DataField="$OMISION_9" DataFormatString="{0:C}" 
                    HeaderText="$OMISION" NullDisplayText="0" SortExpression="$OMISION_9" >
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:BoundField>
                <asp:BoundField DataField="$MULTA_9" DataFormatString="{0:C}" 
                    HeaderText="$MULTA" NullDisplayText="0" SortExpression="$MULTA_9" >
                    <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FF9900" Font-Bold="False" ForeColor="White" />
            <HeaderStyle BackColor="#6699FF" Font-Bold="False" ForeColor="White" />
            <RowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePAEs" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @FECHAINICIO AS DATETIME
DECLARE @FECHAFIN AS DATETIME 
DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @PERIODO AS FLOAT 
DECLARE @TIPOECO AS VARCHAR(50) 
SET @FECHAINICIO  = convert(datetime,'2012/04/19',101)
SET @FECHAFIN = convert(datetime,'2012/05/30',101)
SET @SUBDEL = '01'
SET @PERIODO = '32012'
SET @TIPOECO = 'COP'
SELECT eco.fechaEco AS fechaEco,eco.responsable as iduser
, (SELECT usf.nombre FROM fiscamovil.dbo.Usuarios AS usf 
WHERE (usf.id = eco.responsable)) AS NOTIFICADOR

, (SELECT COUNT(*) AS Expr1 FROM sireca.dbo.eco AS eco2  
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [TOTAL]

, (SELECT COUNT(distinct(eco2.id))  AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EM') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [MUEBLE]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EM') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_EM]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EM') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_EM]

, (SELECT COUNT(*)  AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EI') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [INMUEBLE]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EI') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_EI]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EI') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_EI]

, (SELECT COUNT(distinct eco2.id)  AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EC') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [EMBARGO_CUENTAS]

, (SELECT SUM(eco2.OMISION)  AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EC') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_EC]

, (SELECT SUM(eco2.MULTA)  AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'EC') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_EC]


, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'POR PROCESAR') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [POR PROCESAR]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'POR PROCESAR') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_PP]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'POR PROCESAR') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_PP]

, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '1') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [CITATORIO]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '1') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_1]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '1') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_1]

, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '2') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [NOTIFICADO]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '2') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_2]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '2') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_2]

, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '9') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [NO LOCALIZADO] 

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '9') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_9]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '9') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_9]

, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '17') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [CONVENIO]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '17') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_17]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '17') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_17]


, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '3') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [EN ACLARACION]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '3') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_3]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = '3') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_3]

, (SELECT COUNT(eco2.id) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'RE') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [RECAUDACION(PAGADO)]

, (SELECT SUM(eco2.OMISION) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable)  
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'RE') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$OMISION_RE]

, (SELECT SUM(eco2.MULTA ) AS Expr1 FROM sireca.dbo.eco AS eco2 
WHERE (eco2.responsable = eco.responsable) 
AND (CONVERT(datetime,CONVERT(nvarchar(11),eco2.fechaSeleccion),101) BETWEEN @FECHAINICIO AND @FECHAFIN) AND eco2.fechaEco=@PERIODO AND (eco2.cobrarMulta = '1') AND (eco2.incidencia = 'RE') AND eco2.tipoEco like '%'+@TIPOECO+'%') AS [$MULTA_RE]

FROM sireca.dbo.eco AS eco 
WHERE (eco.responsable IS NOT NULL) AND (eco.subdel = @SUBDEL) AND (eco.fechaEco = @PERIODO) AND eco.cobrarMulta = '1' AND eco.tipoEco like '%'+@TIPOECO+'%'
GROUP BY eco.fechaEco,eco.responsable 
ORDER BY 2
"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

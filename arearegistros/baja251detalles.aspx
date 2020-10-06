<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="baja251detalles.aspx.vb" Inherits="WebSIRECA.baja251detalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DETALLES</title>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewB251Detalle" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceB251Detalle" 
            Font-Size="10pt" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                </asp:BoundField>
                <asp:BoundField DataField="MES_BAJA" HeaderText="MES_BAJA" ReadOnly="True" 
                    SortExpression="ORDEN">
                </asp:BoundField>
                <asp:BoundField DataField="RANGO" 
                    HeaderText="RANGO" ReadOnly="True" SortExpression="RANGO">
                </asp:BoundField>
                <asp:BoundField DataField="FMOV" DataFormatString="{0:d}" HeaderText="BAJA" 
                    SortExpression="FMOV">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" 
                    ReadOnly="True" SortExpression="PATRONES">
                </asp:BoundField>
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" 
                    ReadOnly="True" SortExpression="RAZON" />
                <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE_COP" ReadOnly="True" SortExpression="IMPORTE_COP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_RCV" HeaderText="IMPORTE_RCV" ReadOnly="True" 
                    SortExpression="IMPORTE_RCV" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CRED_COP" HeaderText="CRED_COP" ReadOnly="True" 
                    SortExpression="CRED_COP" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CRED_RCV" DataFormatString="{0:N0}" 
                    HeaderText="CRED_RCV" ReadOnly="True" SortExpression="CRED_RCV">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceB251Detalle" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @BAJA_REST AS VARCHAR(4)
DECLARE @MES AS VARCHAR(15)
DECLARE @RANGO AS VARCHAR(5)
DECLARE @SALARIO as FLOAT
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @RANGO=?
SET @BAJA_REST=?
SET @SALARIO=isnull((select salario from sirecaregistros.dbo.br_salario where anio=@ANIO),'0')
SELECT RX2.*,razonSocial AS RAZON FROM (
--------------------------------------------------------------------
SELECT 
rx.[SUBDEL]
,ORDEN,MES_BAJA
,MAX(FMOV) AS FMOV,PATRONES
,SUM(IMPORTE_COP) AS IMPORTE_COP,SUM(IMPORTE_RCV) AS IMPORTE_RCV
,SUM(CRED_COP) AS CRED_COP,SUM(CRED_RCV) AS CRED_RCV
,(case 
when sum(IMPORTE_COP)&gt;=(25*@SALARIO*365) then 'V'
when sum(IMPORTE_COP)&gt;(4*@SALARIO*365) and sum(IMPORTE_COP)&lt;=(25*@SALARIO*365) then 'IV'
when sum(IMPORTE_COP)&gt;(2*@SALARIO*365) and sum(IMPORTE_COP)&lt;=(4*@SALARIO*365) then 'III'
when sum(IMPORTE_COP)&gt;(@SALARIO*365) and sum(IMPORTE_COP)&lt;=(2*@SALARIO*365) then 'II'
when sum(IMPORTE_COP)&lt;=(@SALARIO*365) then 'I'
end) AS RANGO
FROM (
SELECT 
[SUBDEL]
,month(FMOV) AS ORDEN
,upper(datename(month,FMOV)) AS MES_BAJA
,FMOV AS FMOV
,(REGPATR) AS PATRONES
,(CASE WHEN TIPO='COP' THEN IMPORTE ELSE 0 END) AS IMPORTE_COP
,(CASE WHEN TIPO='RCV' THEN IMPORTE ELSE 0 END) AS IMPORTE_RCV
,(CASE WHEN TIPO='COP' THEN 1 ELSE 0 END) AS CRED_COP
,(CASE WHEN TIPO='RCV' THEN 1 ELSE 0 END) AS CRED_RCV
FROM [sirecaregistros].[dbo].[BR_RALE]
WHERE [SUBDEL] like @SUBDEL AND MOV=@BAJA_REST
AND YEAR(FMOV)=@ANIO
) AS RX 
GROUP BY rx.[SUBDEL],ORDEN,MES_BAJA,PATRONES
) as RX2 left join sireca.dbo.patrones as ptn on regpat=replace(patrones,'-','')
where MES_BAJA=@MES and RANGO like @RANGO
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="ENERO" Name="?" 
                    QueryStringField="mes" />
                <asp:QueryStringParameter DefaultValue="I" Name="?" QueryStringField="rango" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="barest" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

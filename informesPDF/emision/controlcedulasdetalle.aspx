<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="controlcedulasdetalle.aspx.vb" Inherits="WebSIRECA.controlcedulasdetalle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center >
    <div class="btn-group input-prepend">
    <span class="add-on">
        <asp:LinkButton ID="LBImprimir" CssClass="btn" runat="server" onclientclick="javascript:window.print();"><span class="icon-print"></span>&nbsp;IMPRIMIR</asp:LinkButton>
    </span> 
    <span class="add-on">
        <asp:LinkButton ID="LBExport" CssClass="btn" runat="server"><span class="icon-download-alt"></span>&nbsp;DESCARGAR</asp:LinkButton>
    </span> 
    </div> 
    </center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="FOLIO" HeaderText="FOLIO" ReadOnly="True" 
                    SortExpression="FOLIO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_CREADO" DataFormatString="{0:d}" 
                    HeaderText="FOLIO CREADO" ReadOnly="True" SortExpression="FOLIO_CREADO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    ReadOnly="True" SortExpression="OBSERVACION" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @GRUPO_FOLIO AS VARCHAR(15)
DECLARE @FECHA_INI AS DATETIME
DECLARE @FECHA_FIN AS DATETIME
SET @SUBDEL=?
SET @GRUPO_FOLIO=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
SELECT 
[V_FOLIO_P1]  as FOLIO
,COUNT(DISTINCT([V_REGPAT])) AS PATRONES
,COUNT(DISTINCT([V_CREDITO])) AS CREDITOS
,SUM([V_OMISION]) AS IMPORTE
,MAX([V_FECHA_P1_TURNADO]) AS FOLIO_CREADO
,MAX([V_FOLIO_P1_OBSERVACION]) AS OBSERVACION
FROM [sirecaemisiones].[dbo].[eco]
where [V_SUBDEL]=@SUBDEL 
AND [V_FOLIO_P1] IS NOT NULL
AND [V_FECHA_P1_TURNADO] BETWEEN @FECHA_INI AND @FECHA_FIN
and (CASE 
WHEN [V_INC_CAPTURA]='2' THEN '2'
WHEN [V_INC_CAPTURA]='9' THEN '9'
ELSE 'PAGADO'
END)=@GRUPO_FOLIO
GROUP BY [V_FOLIO_P1]

">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" 
                    QueryStringField="tipocedula" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechaini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechafin" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

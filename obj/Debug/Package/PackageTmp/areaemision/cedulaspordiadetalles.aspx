<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cedulaspordiadetalles.aspx.vb" Inherits="WebSIRECA.cedulaspordiadetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
        <asp:GridView ID="GridViewDetalles" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceDetalles" AllowSorting="True" Font-Size="8pt" 
            HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="V_TD" HeaderText="T.D." ReadOnly="True" 
                    SortExpression="V_TD" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_ORI_MUL" HeaderText="ORIGEN/MULTA" ReadOnly="True" 
                    SortExpression="V_ORI_MUL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="E.C.O." ReadOnly="True" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL." ReadOnly="True" 
                    SortExpression="V_SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_REGPAT" HeaderText="REG.PATRONAL" 
                    ReadOnly="True" SortExpression="V_REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" ReadOnly="True" 
                    SortExpression="V_RAZON_SOCIAL" />
                <asp:BoundField DataField="V_CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="V_CREDITO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="V_COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="V_OMISION" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="V_OMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="V_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="V_PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_SECTOR" HeaderText="SECTOR" 
                    ReadOnly="True" SortExpression="V_SECTOR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO_CEDULA" HeaderText="TIPO CEDULA" ReadOnly="True" 
                    SortExpression="TIPO_CEDULA" />
                <asp:BoundField DataField="V_FOLIO_P1" HeaderText="FOLIO" 
                    ReadOnly="True" SortExpression="V_FOLIO_P1" />
                <asp:BoundField DataField="V_FECHA_P1_TURNADO" 
                    HeaderText="FOLIO CREADO" ReadOnly="True" 
                    SortExpression="V_FECHA_P1_TURNADO" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FOLIO_P1_OBSERVACION" HeaderText="OBSERVACION DEL FOLIO" 
                    ReadOnly="True" SortExpression="V_FOLIO_P1_OBSERVACION" />
                <asp:BoundField DataField="V_CIFRA_CONTROL" HeaderText="CIFRA CONTROL" ReadOnly="True" 
                    SortExpression="V_CIFRA_CONTROL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDetalles" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO_ECO AS VARCHAR(5)
DECLARE @TIPO_CEDULA AS VARCHAR(20)
DECLARE @TIPO_CREDITO AS VARCHAR(20)
DECLARE @FECHA AS DATETIME
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @TIPO_CEDULA=? --NO LOCALIZADO, CAMBIO A LA 31, CANCELACION
SET @TIPO_CREDITO=? --ORIGEN,MULTA
SET @FECHA=?

SELECT
*
FROM (
SELECT 
      [V_ORI_MUL]
      ,[V_TIPO_ECO]
      ,[V_SUBDEL]
      ,[V_REGPAT]
      ,[V_RAZON_SOCIAL]
      ,[V_CREDITO]
      ,[V_COTIZ]
      ,[V_OMISION]
      ,[V_PERIODO]
      ,[V_SECTOR]
      ,(CASE 
      WHEN V_INC_CAPTURA='9' THEN 'NO LOCALIZADO' 
      WHEN V_INC_CAPTURA='2' THEN 'CAMBIO A LA 31'
      ELSE 'CANCELACION'
      END) AS TIPO_CEDULA
      ,((CASE 
      WHEN V_INC_CAPTURA='9' THEN 'NO LOCALIZADO: ' 
      WHEN V_INC_CAPTURA='2' THEN 'CAMBIO A LA 31: '
      ELSE 'CANCELACION: '
      END)+[V_FOLIO_P1]) as [V_FOLIO_P1]
      ,[V_FECHA_P1_TURNADO]
      ,[V_FOLIO_P1_OBSERVACION]
      ,[V_CIFRA_CONTROL]
      ,[V_TD]
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103) IN (@FECHA)
  AND [V_SUBDEL] LIKE @SUBDEL AND V_TIPO_ECO LIKE @TIPO_ECO AND [V_ORI_MUL] LIKE @TIPO_CREDITO
  ) AS R1
  WHERE TIPO_CEDULA LIKE @TIPO_CEDULA
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="cop" Name="?" 
                    QueryStringField="tipoeco" />
                <asp:QueryStringParameter DefaultValue="depurado" Name="?" 
                    QueryStringField="tipocedula" />
                <asp:QueryStringParameter DefaultValue="origen" Name="?" 
                    QueryStringField="tipocredito" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="dia" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

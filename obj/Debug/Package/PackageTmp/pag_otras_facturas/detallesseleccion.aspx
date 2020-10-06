<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesseleccion.aspx.vb" Inherits="WebSIRECA.detallesseleccion2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DETALLES</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewDetalles" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceDetalles" 
            Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="RG_CIFRA_CONTROL" HeaderText="CIFRA CONTROL" 
                    ReadOnly="True" SortExpression="RG_CIFRA_CONTROL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="RG_SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_TIPO_FACTURA" HeaderText="FACTURA" 
                    ReadOnly="True" SortExpression="RG_TIPO_FACTURA" />
                <asp:BoundField DataField="RG_REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="RG_REGPAT" />
                <asp:BoundField DataField="RG_RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RG_RAZON" />
                <asp:BoundField DataField="RG_CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="RG_CREDITO" />
                <asp:BoundField DataField="RG_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="RG_PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="RG_COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="RG_IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_IMPORTE_RECAUDADO" HeaderText="IMPORTE RECAUDADO" 
                    ReadOnly="True" SortExpression="RG_IMPORTE_RECAUDADO" 
                    DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_FALTANTE" HeaderText="IMPORTE FALTANTE" 
                    ReadOnly="True" SortExpression="IMPORTE_FALTANTE" 
                    DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_FECH_ASIGNACION" HeaderText="FECHA DE ASIGNACION" 
                    ReadOnly="True" SortExpression="RG_FECH_ASIGNACION" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RG_INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="RG_INSPECTOR" />
                <asp:BoundField DataField="RG_DILIGENCIA" HeaderText="DILIGENCIA" 
                    ReadOnly="True" SortExpression="RG_DILIGENCIA" />
                <asp:BoundField DataField="RG_FECH_DILIGENCIA" HeaderText="FECHA DE DILIGENCIA" 
                    ReadOnly="True" SortExpression="RG_FECH_DILIGENCIA" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_TD" HeaderText="RALE TD" 
                    ReadOnly="True" SortExpression="RALE_TD" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_INC" HeaderText="RALE INC" 
                    ReadOnly="True" SortExpression="RALE_INC" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_FECH_NOTIFICACION" HeaderText="RALE NOTIFICACION" 
                    ReadOnly="True" SortExpression="RALE_FECH_NOTIFICACION" />
                <asp:BoundField DataField="RALE_DIAS" HeaderText="RALE DIAS" 
                    ReadOnly="True" SortExpression="RALE_DIAS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_TIPO" HeaderText="RALE" ReadOnly="True" 
                    SortExpression="RALE_TIPO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TRANS_GRUPO" HeaderText="GRUPO TURNADO" ReadOnly="True" 
                    SortExpression="TRANS_GRUPO" />
                <asp:BoundField DataField="TRANS_FOLIO" HeaderText="FOLIO GRUPO" ReadOnly="True" 
                    SortExpression="TRANS_FOLIO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TRANS_FOLIO_CREADO" 
                    HeaderText="FOLIO CREADO" ReadOnly="True" 
                    SortExpression="TRANS_FOLIO_CREADO" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TRANS_OBSERVACION" HeaderText="FOLIO OBSERVACION" ReadOnly="True" 
                    SortExpression="TRANS_OBSERVACION" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDetalles" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CIFRA_CONTROL as VARCHAR(15)
DECLARE @TIPO_CIFRA as VARCHAR(50)
DECLARE @DILIGENCIA as VARCHAR(100)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
SET @SUBDEL=?
SET @CIFRA_CONTROL=?
SET @TIPO_CIFRA=?
SET @DILIGENCIA=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

EXEC('select * from (
SELECT RG_CIFRA_CONTROL,RG_SUBDEL,RG_TIPO_FACTURA,RG_REGPAT,RG_RAZON,RG_CREDITO,RG_PERIODO,RG_COTIZ,RG_IMPORTE,RG_IMPORTE_RECAUDADO,IMPORTE_FALTANTE,RG_FECH_ASIGNACION
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=RG_INSPECTOR) as RG_INSPECTOR
,(SELECT [ACTIVIDAD]
FROM [sireca].[dbo].[catalogo]
WHERE [CVE DILIG#]=ISNULL(RG_DILIGENCIA,''67'')) as RG_DILIGENCIA
,ISNULL(RG_DILIGENCIA,''67'') as V_RG_DILIGENCIA
,RG_FECH_DILIGENCIA,TRANS_GRUPO,TRANS_FOLIO,TRANS_FOLIO_CREADO,TRANS_OBSERVACION,RALE_TIPO,RALE_REGPAT,RALE_CREDITO,RALE_PERIODO,RALE_TD,RALE_INC,RALE_FECH_NOTIFICACION,RALE_DIAS
FROM (
SELECT RG_CIFRA_CONTROL,RG_SUBDEL,RG_TIPO_FACTURA,RG_REGPAT,RG_RAZON,RG_CREDITO,RG_PERIODO,RG_COTIZ,RG_IMPORTE,RG_IMPORTE_RECAUDADO,IMPORTE_FALTANTE,RG_FECH_ASIGNACION,RG_INSPECTOR,RG_DILIGENCIA,RG_FECH_DILIGENCIA
,TRANS_GRUPO,TRANS_FOLIO,TRANS_FOLIO_CREADO,TRANS_OBSERVACION
FROM (
SELECT [SV_CLAVE] AS RG_CIFRA_CONTROL
	  ,[SV_SUBDEL] AS RG_SUBDEL
      ,(CASE 
      WHEN [SV_TIPO] IN (''SIVEPA_EXTEM'') AND SV_SIVEPA IN (''SIVEPA-IMSS'') THEN ''SIVEPA_COP_EXTEMPORANEO''
      WHEN [SV_TIPO] IN (''SIVEPA_OPORT'') AND SV_SIVEPA IN (''SIVEPA-IMSS'') THEN ''SIVEPA_COP_OPORTUNO''
      WHEN [SV_TIPO] IN (''SIVEPA_ANUAL'') AND SV_SIVEPA IN (''SIVEPA-IMSS'') THEN ''SIVEPA_COP_ANUAL''
      WHEN [SV_TIPO] IN (''SIVEPA_EXTEM'') AND SV_SIVEPA IN (''SIVEPA-RCV'') THEN ''SIVEPA_RCV_EXTEMPORANEO''
      WHEN [SV_TIPO] IN (''SIVEPA_OPORT'') AND SV_SIVEPA IN (''SIVEPA-RCV'') THEN ''SIVEPA_RCV_OPORTUNO''
      WHEN [SV_TIPO] IN (''SIVEPA_ANUAL'') AND SV_SIVEPA IN (''SIVEPA-RCV'') THEN ''SIVEPA_RCV_ANUAL''
      END) AS RG_TIPO_FACTURA
      ,SUBSTRING([SV_REG_PATRONAL],1,10) AS RG_REGPAT
      ,[SV_RAZON_SOCIAL] AS RG_RAZON
      ,[SV_CREDITO] AS RG_CREDITO
      ,SUBSTRING(CONVERT(VARCHAR(10),[SV_PERIODO],103),4,7) AS RG_PERIODO
      ,[SV_COTIZ] AS RG_COTIZ
      ,[SV_EMI_REAL] AS RG_IMPORTE
      ,[SV_RECAUDACION] AS RG_IMPORTE_RECAUDADO
      ,[SV_DIFERENCIA] AS IMPORTE_FALTANTE
      ,[SV_ASIG_INSPECTOR_FECHA] AS RG_FECH_ASIGNACION
      ,[SV_ASIG_INSPECTOR] AS RG_INSPECTOR
      ,(SELECT TOP 1 [SVD_DILI]
		FROM [sirecasivepas].[dbo].[SV_DILI_BASE]
		WHERE [SVD_SV_ID]=SV_ID
		ORDER BY SVD_FECH_SYSTEM DESC,[SVD_ID] DESC) AS RG_DILIGENCIA
      ,(SELECT TOP 1 [SVD_FECH_DILI]
		FROM [sirecasivepas].[dbo].[SV_DILI_BASE]
		WHERE [SVD_SV_ID]=SV_ID
		ORDER BY SVD_FECH_SYSTEM DESC,[SVD_ID] DESC) AS RG_FECH_DILIGENCIA
  FROM [sirecasivepas].[dbo].[SV_BASE]
  where SV_SUBDEL LIKE '''+@SUBDEL+''' AND [SV_CLAVE]='''+@CIFRA_CONTROL+'''
UNION ALL
  SELECT [clave] AS RG_CIFRA_CONTROL
  ,SUBDEL AS RG_SUBDEL
  ,(CASE 
  WHEN TIPOECO IN (''COP'') THEN ''ECO_COP_ESTRATEGICO''
  WHEN TIPOECO IN (''COMP'') THEN ''ECO_COP_COMPLEMENTO''
  WHEN TIPOECO IN (''RCV'') THEN ''ECO_RCV_ESTRATEGICO''
  WHEN TIPOECO IN (''RCVCOMP'') THEN ''ECO_RCV_COMPLEMENTO''
  END) AS RG_TIPO_FACTURA
      ,SUBSTRING([REG#PATRONAL],1,10) AS RG_REGPAT
      ,[NOMBRE O RAZON SOCIAL] AS RG_RAZON
      ,[CREDITO] AS RG_CREDITO
	,(case 
	when [tipoECO] in (''COP'',''COMP'') then
	(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
	when [tipoECO] in (''RCV'',''RCVCOMP'') then
	(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
	end
	) as RG_PERIODO
      ,[COTIZ] AS RG_COTIZ
      ,[OMISION] AS RG_IMPORTE
      ,0.00 AS RG_IMPORTE_RECAUDADO
      ,[OMISION] AS RG_IMPORTE_FALTANTE
      ,[fechaSeleccion] AS RG_FECH_ASIGNACION
      ,[responsable] AS RG_INSPECTOR
      ,incidencia AS RG_DILIGENCIA
      ,fechaCaptura AS RG_FECH_DILIGENCIA
  FROM [sireca].[dbo].[eco]
  where subdel LIKE '''+@SUBDEL+''' AND [clave]='''+@CIFRA_CONTROL+'''
UNION ALL
  SELECT 
  [OFF_CIFRA_CONTROL] AS RG_CIFRA_CONTROL
  ,[OFF_SUBDEL] AS RG_SUBDEL
  ,(SELECT [OFC_DESCRIPCION]
FROM [sirecaemisiones].[dbo].[OF_CATALOGO] WHERE [OFC_ID]=[OFF_TD]) AS RG_TIPO_FACTURA
      ,[OFF_REGPAT] AS RG_REGPAT
      ,[OFF_RAZON] AS RG_RAZON
      ,[OFF_CREDITO] AS RG_CREDITO
      ,[OFF_PERIODO] RG_PERIODO
      ,[OFF_COTIZ] AS RG_COTIZ
      ,[OFF_IMPORTE] AS RG_IMPORTE
      ,0.00 AS RG_IMPORTE_RECAUDADO
      ,[OFF_IMPORTE] AS RG_IMPORTE_FALTANTE
	  ,[OFF_FECH_ASIGNACION] AS RG_FECH_ASIGNACION
      ,[OFF_ID_INSPECTOR] AS RG_INSPECTOR
      ,[OFF_DILIGENCIA] AS RG_DILIGENCIA
      ,[OFF_FECH_DILIGENCIA] AS RG_FECH_DILIGENCIA
  FROM [sirecaemisiones].[dbo].[OF_FACTURAS] 
  WHERE OFF_SUBDEL LIKE '''+@SUBDEL+''' AND [OFF_CIFRA_CONTROL]='''+@CIFRA_CONTROL+'''
  ) AS SUBRESULTADO1
  LEFT JOIN 
  (
  SELECT
      CASE 
      WHEN [V_INC_CAPTURA] IN (''2'') THEN ''2''
      WHEN [V_INC_CAPTURA] IN (''9'') THEN ''9''
      ELSE ''PAGADO''
      END AS TRANS_GRUPO
      ,[V_FOLIO_P1] AS TRANS_FOLIO      
      ,[V_FECHA_P1_TURNADO] AS TRANS_FOLIO_CREADO
      ,[V_FOLIO_P1_OBSERVACION] AS TRANS_OBSERVACION
      
      ,V_SUBDEL AS B_SUBDEL
      ,SUBSTRING(V_REGPAT,1,10) AS B_REGPAT
      ,V_CREDITO AS B_CREDITO
      ,V_PERIODO AS B_PERIODO
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE V_SUBDEL LIKE '''+@SUBDEL+''' AND V_CIFRA_CONTROL='''+@CIFRA_CONTROL+'''
  ) AS FOLIOS ON B_SUBDEL LIKE RG_SUBDEL
  AND B_REGPAT=RG_REGPAT
  AND B_CREDITO=RG_CREDITO
  AND B_PERIODO=RG_PERIODO
) AS FACTURAS
LEFT JOIN
(
SELECT 
''COP'' AS RALE_TIPO
,replace([REGPATR],''-'','''') as RALE_REGPAT
,[NUMCRED] AS RALE_CREDITO
,SUBSTRING([PERIODO],4,7) AS RALE_PERIODO
,[TD] AS RALE_TD
,[INC] AS RALE_INC
,[FNOTIFICACION] AS RALE_FECH_NOTIFICACION
,[DIAS] AS RALE_DIAS
FROM [rale].[dbo].['+@RALECOP+']
UNION ALL
SELECT 
''RCV'' AS RALE_TIPO
,replace([REGPATR],''-'','''') as RALE_REGPAT
,[NUMCRED] AS RALE_CREDITO
,SUBSTRING([PERIODO],4,7) AS R_PERIODO
,[TD] AS RALE_TD
,[INC] AS RALE_INC
,[FNOTIFICACION] AS RALE_FECH_NOTIFICACION
,[DIAS] AS RALE_DIAS
FROM [rale].[dbo].['+@RALERCV+']
) AS RALE
ON RG_REGPAT=RALE_REGPAT AND RG_CREDITO=RALE_CREDITO AND RG_PERIODO=RALE_PERIODO
) as sd
WHERE RG_TIPO_FACTURA like '''+@TIPO_CIFRA+'''
and V_RG_DILIGENCIA='''+@DILIGENCIA+'''
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="cifracontrol" />
                <asp:QueryStringParameter DefaultValue="abcd" Name="?" 
                    QueryStringField="tipocifra" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" 
                    QueryStringField="diligencia" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

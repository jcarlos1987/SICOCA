<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="canceladasimpresasdetalles.aspx.vb" Inherits="WebSIRECA.canceladasimpresasdetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Font-Size="10pt" HorizontalAlign="Center" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO_FACTURA" HeaderText="FACTURA" ReadOnly="True" 
                    SortExpression="TIPO_FACTURA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO_BIMESTRE" HeaderText="PERIODO / BIMESTRE" 
                    ReadOnly="True" SortExpression="PERIODO_BIMESTRE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO_DOC" HeaderText="DOCUMENTO" ReadOnly="True" 
                    SortExpression="TIPO_DOC" />
                <asp:BoundField DataField="ACCION" HeaderText="ACCION" ReadOnly="True" 
                    SortExpression="ACCION" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PAGO_POR" HeaderText="PAGO POR" ReadOnly="True" 
                    SortExpression="PAGO_POR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INCIDENCIA_SIRECA" HeaderText="INCIDENCIA SIRECA" 
                    ReadOnly="True" SortExpression="INCIDENCIA_SIRECA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INCIDENCIA_RALE" HeaderText="INCIDENCIA RALE" 
                    ReadOnly="True" SortExpression="INCIDENCIA_RALE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ASIGNADO" DataFormatString="{0:d}" 
                    HeaderText="ASIGNADO" ReadOnly="True" SortExpression="ASIGNADO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @MES AS VARCHAR(2)
DECLARE @MES2 AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @TIPO_DOC AS VARCHAR(4)
DECLARE @TIPO_FACTURA AS VARCHAR(50)
DECLARE @ACCION AS VARCHAR(50)

SET @SUBDEL=?
SET @MES=?
SET @ANIO=?
SET @TIPO_DOC=?
SET @TIPO_FACTURA =?
SET @ACCION =?
SET @MES2=CASE WHEN LEN(@MES/CAST(2 AS FLOAT))=1 THEN '0'+CAST((@MES/2) AS VARCHAR(2)) ELSE '0' END
SELECT 
RESULT.SUBDEL
,TIPO_FACTURA
,PERIODO_BIMESTRE
,TIPO_DOC,ACCION
,RESULT.REGPAT
,[NOMBRE O RAZON SOCIAL] AS RAZON
,RESULT.CREDITO
,OMISION AS IMPORTE
,VALIDACION AS PAGO_POR
,INCIDENCIA AS INCIDENCIA_SIRECA
,INCIDENCIARALE AS INCIDENCIA_RALE
,ASIGNADO
,INSPECTOR
FROM (
SELECT IM_SUBDEL AS SUBDEL
,IM_TIPO_COP_RCV AS TIPO_FACTURA
,IM_PERIODO as PERIODO_BIMESTRE
,IM_CREDITO AS CREDITO
,(CASE 
WHEN IM_TIPO_DOC='1' THEN 'CITATORIO'
WHEN IM_TIPO_DOC='2' THEN 'ACTA DE NOTIFICACION'
WHEN IM_TIPO_DOC IS NULL THEN 'PENDIENTE'
ELSE IM_TIPO_DOC
END) AS TIPO_DOC
,(CASE 
WHEN EC_TIPO_DOC='1' THEN 'CITATORIO'
WHEN EC_TIPO_DOC='2' THEN 'NOTIFICADO'
WHEN EC_TIPO_DOC IS NULL THEN 'PENDIENTE'
ELSE EC_TIPO_DOC
END) AS ACCION
,IM_REGPAT AS REGPAT
,EC_IMPORTE AS IMPORTE
,IM_FECHA_ASIGNACION AS ASIGNADO
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=IM_INSPECTOR) AS INSPECTOR
FROM (
-----RESULTADO
SELECT IM_SUBDEL,IM_TIPO_COP_RCV,IM_REGPAT,IM_PERIODO,IM_CREDITO,IM_TIPO_DOC,IM_FECHA_ASIGNACION,IM_INSPECTOR,EC_TIPO_DOC
,EC_IMPORTE
FROM (
-----IMPRESIONES
SELECT * FROM (
SELECT 
[IM_SUBDEL]
,(CASE WHEN CHARINDEX('COP-',[IM_TIPO_IMPRESION]) NOT IN (0) THEN 'COP'
      WHEN CHARINDEX('RCV-',[IM_TIPO_IMPRESION]) NOT IN (0) THEN 'RCV'
      ELSE 'X' END) AS IM_TIPO_COP_RCV
,[IM_REGPAT]
,[IM_PERIODO]
,[IM_CREDITO]
,CASE WHEN SUBSTRING([IM_TIPO_IMPRESION],1,10)='Acta de No' THEN '2'
ELSE '1'
END
AS IM_TIPO_DOC
,[IM_FECHA_ASIGNACION]
,[IM_INSPECTOR]
FROM [sirecaemisiones].[dbo].[hist_impresion]
WHERE [IM_SUBDEL]=@SUBDEL and (IM_CREDITO like '__2______' or IM_CREDITO like '__7______')
) AS RESULT
WHERE ((IM_TIPO_COP_RCV='COP' AND IM_PERIODO=@MES+'/'+@ANIO) OR 
(IM_TIPO_COP_RCV='RCV' AND IM_PERIODO=@MES2+'/'+@ANIO))
GROUP BY [IM_SUBDEL]
,IM_TIPO_COP_RCV
,[IM_REGPAT]
,[IM_PERIODO]
,[IM_CREDITO]
,IM_TIPO_DOC
,[IM_FECHA_ASIGNACION]
,[IM_INSPECTOR]
) AS CAP
LEFT JOIN
(
----FECTURAS
SELECT * FROM (
SELECT subdel AS EC_SUBDEL
,(CASE 
WHEN tipoeco in ('COP','COMP') THEN 'COP'
WHEN tipoeco in ('RCV','RCVCOMP') THEN 'RCV'
END
) AS EC_TIPO_COP_RCV
,substring(reg#patronal,1,10) AS EC_REGPAT
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as EC_PERIODO
,(
	case 
	when eco.incidencia in ('1') then eco.incidencia 
	when  
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia='1' and hinc.ideco=eco.id
			order by ideco desc
		) in ('1') then '1'
	else null
	end 
	) as EC_TIPO_DOC
,FECHASELECCION AS EC_FECHA_ASIGNACION
,eco.responsable as EC_INSPECTOR
,OMISION as EC_IMPORTE
FROM sireca.dbo.eco as eco
WHERE SUBDEL=@SUBDEL
UNION ALL
SELECT subdel AS EC_SUBDEL
,(CASE 
WHEN tipoeco in ('COP','COMP') THEN 'COP'
WHEN tipoeco in ('RCV','RCVCOMP') THEN 'RCV'
END
) AS EC_TIPO_COP_RCV
,substring(reg#patronal,1,10) AS EC_REGPAT
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as EC_PERIODO
,(
	case 
	when eco.incidencia in ('2') then eco.incidencia 
	when  
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia='2' and hinc.ideco=eco.id
			order by ideco desc
		) in ('2') then '2'
	else null
	end 
	) as EC_TIPO_DOC
,FECHASELECCION AS EC_FECHA_ASIGNACION
,eco.responsable as EC_INSPECTOR
,OMISION as EC_IMPORTE
FROM sireca.dbo.eco as eco
WHERE SUBDEL=@SUBDEL
) AS R_ECO
WHERE ((EC_TIPO_COP_RCV='COP' AND EC_PERIODO=@MES+'/'+@ANIO) OR 
(EC_TIPO_COP_RCV='RCV' AND EC_PERIODO=@MES2+'/'+@ANIO))
AND EC_TIPO_DOC=@TIPO_DOC

) AS IMP ON IM_SUBDEL=EC_SUBDEL
AND EC_TIPO_COP_RCV=IM_TIPO_COP_RCV
AND EC_REGPAT=IM_REGPAT 
AND EC_PERIODO=IM_PERIODO
--AND EC_TIPO_DOC=IM_TIPO_DOC
) AS REPORTE
WHERE IM_TIPO_DOC=@TIPO_DOC
) AS RESULT left join sireca.dbo.eco as ptn 
on SUBSTRING(ptn.REG#PATRONAL,1,10)=RESULT.REGPAT AND ptn.CREDITO=RESULT.CREDITO
WHERE TIPO_FACTURA=@TIPO_FACTURA
AND ACCION=@ACCION
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="1" Name="?" 
                    QueryStringField="tipodoc" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" 
                    QueryStringField="tipofactura" />
                <asp:QueryStringParameter DefaultValue="CANCELADA" Name="?" 
                    QueryStringField="accion" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reportecodebarnotificadosdetalles.aspx.vb" Inherits="WebSIRECA.reportecodebarnotificadosdetalles" %>

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
    
        <asp:GridView ID="GridView1" runat="server" 
            Caption="&lt;strong&gt;DETALLES DE LA DIFERENCIA&lt;/strong&gt;" 
            HorizontalAlign="Center" AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="DIAS_TRANCURRIDOS" HeaderText="DIAS TRANS." 
                    ReadOnly="True" SortExpression="DIAS_TRANCURRIDOS" 
                    DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_SALIDA" DataFormatString="{0:d}" 
                    HeaderText="SALIDA" ReadOnly="True" SortExpression="FECHA_SALIDA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CODE_BAR" HeaderText="CODIGO" ReadOnly="True" 
                    SortExpression="CODE_BAR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                    SortExpression="TD" />
                <asp:BoundField DataField="R_REGPAT" HeaderText="REG.PAT." ReadOnly="True" 
                    SortExpression="R_REGPAT">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_SIRECA" HeaderText="INC. SIRECA" ReadOnly="True" 
                    SortExpression="INC_SIRECA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" DataFormatString="{0:N0}" 
                    HeaderText="CREDITO" ReadOnly="True" SortExpression="CREDITO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @FECHA_INI as VARCHAR(10)
DECLARE @FECHA_FIN as VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
exec('
-------------------
SELECT DIAS_TRANCURRIDOS,FECHA_SALIDA,CODE_BAR,INSPECTOR,TD,R_REGPAT,INCIDENCIA AS INC_SIRECA,CREDITO,IMPORTE
--,FECH_ASIG,FECHA_ENTRADA,FECHA_ENTRADA2,FECHA_ENTRADA3
FROM (
SELECT
(CASE WHEN FECHA_SALIDA IS NULL THEN 0 ELSE 1 END) AS FS
,(CASE WHEN FECHA_ENTRADA IS NULL THEN 0 ELSE 1 END) AS FE
,(CASE WHEN FECHA_ENTRADA IS NOT NULL AND RR_ND_CODE IN (''02'') THEN 1 ELSE 0 END) AS NOTIFICADO
,(CASE WHEN FECHA_ENTRADA2 IS NULL THEN 0 ELSE 1 END) AS FE2
,(CASE WHEN FECHA_ENTRADA3 IS NULL THEN 0 ELSE 1 END) AS FE3
,* FROM (
SELECT 
case when RR_FECHA_ACCION is null then sirecacobros.dbo.diasInabiles(R_FECHA_ACCION,getdate())
else 0
end as DIAS_TRANCURRIDOS
,R_CODE_BAR AS CODE_BAR
,R_INSPECTOR AS INSPECTOR
,R_ID_INSPECTOR AS ID_INSPECTOR
,R_TD AS TD
,R_FECHA_ACCION AS FECHA_SALIDA
,RR_FECHA_ACCION AS FECHA_ENTRADA
,RRR_FECHA_ACCION AS FECHA_ENTRADA2
,RRRR_FECHA_ACCION AS FECHA_ENTRADA3
,RR_ND_CODE
,R_REGPAT
FROM
(SELECT 
R_CODE_BAR
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=R_ID_NOTIFICADOR) AS R_INSPECTOR
,R_ID_NOTIFICADOR AS R_ID_INSPECTOR
,R_TD,R_FECHA_ACCION
,R_REGPAT
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_ID_NOTIFICADOR
,(SELECT replace([CQ_DATO1],''REG. PATRONAL:$'','''')
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_REGPAT
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_TD
,[HA_ID_CODEBAR] AS R_CODE_BAR
,[HA_FECH_REGISTRO] as R_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as R_ACCION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''1''
) AS RESULT
) AS RS
LEFT JOIN
(
SELECT 
RR_FECHA_ACCION
,RR_CODE_BAR
,RR_ND_CODE
FROM (
SELECT 
[HA_ID_CODEBAR] AS RR_CODE_BAR
,(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RR_ID_NOTIFICADOR
,[HA_FECH_REGISTRO] as RR_FECHA_ACCION
,[HA_ND_CODE] as RR_ND_CODE
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''2''
) AS RESULT2
) AS RE
on RR_CODE_BAR=R_CODE_BAR
LEFT JOIN
(
SELECT 
RRR_FECHA_ACCION
,RRR_CODE_BAR
,RRR_ND_CODE
FROM (
SELECT 
[HA_ID_CODEBAR] AS RRR_CODE_BAR
,(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RRR_ID_NOTIFICADOR
,[HA_FECH_REGISTRO] as RRR_FECHA_ACCION
,[HA_ND_CODE] as RRR_ND_CODE
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''3''
) AS RESULT2
) as RE2
on RRR_CODE_BAR=R_CODE_BAR
LEFT JOIN
(
SELECT 
RRRR_FECHA_ACCION
,RRRR_CODE_BAR
,RRRR_ND_CODE
FROM (
SELECT 
[HA_ID_CODEBAR] AS RRRR_CODE_BAR
,(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RRRR_ID_NOTIFICADOR
,[HA_FECH_REGISTRO] as RRRR_FECHA_ACCION
,[HA_ND_CODE] as RRRR_ND_CODE
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''4''
) AS RESULT2
) as RE3
on RRRR_CODE_BAR=R_CODE_BAR
) AS RESULTADO
WHERE TD in (''Acta de Notificacion (COP-FISICA)'',''Acta de Notificacion (COP-MORAL)'',''Acta de Notificacion (RCV-FISICA)'',''Acta de Notificacion (RCV-MORAL)'')
) AS qr LEFT JOIN
(
select
incidencia AS INCIDENCIA
 ,reg#patronal,credito,omision as importe,fechaSeleccion as fech_asig from sireca.dbo.eco where subdel='''+@SUBDEL+''') as eco
on substring(eco.reg#patronal,1,10)=qr.r_regpat and eco.CREDITO=substring(qr.code_bar,charindex(''!'',qr.code_bar)+1,9)
WHERE fech_asig between '''+@FECHA_INI+''' and '''+@FECHA_FIN+''' --AND INCIDENCIA IS NOT NULL
and EXISTS(SELECT us.id FROM sireca.dbo.usuarios as us where us.id=ID_INSPECTOR and user_type=''1'')
and FE in (0) and ID_INSPECTOR IN ('''+@INSPECTOR+''')
----------------------------------------------
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_ini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_fin" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

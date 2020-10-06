<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="facturaCredImp2tipo.aspx.vb" Inherits="WebSIRECA.facturaCredImp2tipo" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Facturas Creditos</title>
    <style type="text/css">
table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0}*{color:#000!important;text-shadow:none!important;background:transparent!important;box-shadow:none!important}</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportSource ID="CrystalReportSourceResivo" runat="server">
        <report filename="facturaCredImp.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="SqlDataSourceResivoHead" 
                    TableName="FACTURA_HEAD" />
                <CR:DataSourceRef DataSourceID="SqlDataSourceResivo" 
                    TableName="FACTURA_CRED_IMP" />
            </DataSources>
        </report>
        </CR:CrystalReportSource>
        <asp:SqlDataSource ID="SqlDataSourceResivoHead" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            
            
            
            
            
        
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @SUPERVISOR as VARCHAR(15)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @ENT_SAL as INT
DECLARE @FECH_CREADA AS DATETIME
SET @SUBDEL=?
SET @SUPERVISOR=?
SET @INSPECTOR=?
SET @ENT_SAL=?
SET @FECH_CREADA=?
exec('
if exists(select * from tempdb.dbo.sysobjects where name = ''regcodbar'+@SUPERVISOR+''') 
begin
drop table tempdb.dbo.regcodbar'+@SUPERVISOR+'
end

SELECT FH_CREDITOS,FH_IMPORTE
into tempdb.dbo.regcodbar'+@SUPERVISOR+'
FROM (
SELECT COUNT(*) as FH_CREDITOS
,isnull(SUM(R_IMPORTE),0.00) AS FH_IMPORTE
FROM (
-----------
SELECT
substring(R_CODE_BAR,charindex(''!'',R_CODE_BAR)+1,9) AS R_CODE_BAR
,R_IMPORTE,R_SUBDELEGACION
FROM (
SELECT 
(select top 1 omision from sireca.dbo.eco
where substring(reg#patronal,1,10)=(SELECT replace([CQ_DATO1],''REG. PATRONAL:$'','''')
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(R_CODE_BAR,1,charindex(''!'',R_CODE_BAR)-1))
and credito=substring(R_CODE_BAR,charindex(''!'',R_CODE_BAR)+1,len(R_CODE_BAR))
) as R_IMPORTE
,(case 
when '''+@SUBDEL+'''=''01'' then ''NORTE'' 
when '''+@SUBDEL+'''=''33'' then ''SUR'' 
else
''''
end) as R_SUBDELEGACION
,R_CODE_BAR,R_ID_NOTIFICADOR
FROM (
SELECT 
replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') as R_ID_NOTIFICADOR
,[HA_ID_CODEBAR] AS R_CODE_BAR
,[HA_FECH_REGISTRO] as R_FECHA_ACCION
FROM [controlQR].[dbo].[HIST_ACCIONES] LEFT JOIN [controlQR].[dbo].[CONTROL_QR] 
ON [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]='''+@ENT_SAL+'''
) AS RESULT
WHERE (year(R_FECHA_ACCION)=year('''+@FECH_CREADA+''')
and month(R_FECHA_ACCION)=month('''+@FECH_CREADA+''')
and day(R_FECHA_ACCION)=day('''+@FECH_CREADA+'''))
and R_ID_NOTIFICADOR='''+@INSPECTOR+'''
) AS REPORT
GROUP BY substring(R_CODE_BAR,charindex(''!'',R_CODE_BAR)+1,9),R_IMPORTE,R_SUBDELEGACION
-----------
) AS REPORTX
) AS XX

SELECT TOP 1 [FH_CREDITOS]
      ,[FH_IMPORTE]
      ,sirecacobros.dbo.CantidadEnLetra([FH_IMPORTE]) AS FH_IMPOTE_LETRA 
  FROM [tempdb].[dbo].[regcodbar'+@SUPERVISOR+']
')
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="?" SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                <asp:QueryStringParameter DefaultValue="9999999" Name="?" 
                    QueryStringField="msg1" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="msg2" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fecha2" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceResivo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            
            
            
            
            
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @SUPERVISOR as VARCHAR(15)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @INSPECTOR_NOM as VARCHAR(500)
DECLARE @SUPERVISOR_NOM as VARCHAR(500)
DECLARE @ENT_SAL as INT
DECLARE @FECH_CREADA AS DATETIME
SET @SUBDEL=?
SET @SUPERVISOR=?
SET @INSPECTOR=?
SET @ENT_SAL=?
SET @FECH_CREADA=?
SET @FECH_CREADA=(CASE WHEN @FECH_CREADA='01/01/2000' THEN GETDATE() ELSE @FECH_CREADA END)
SET @INSPECTOR_NOM=(select upper(nombre) from fiscamovil.dbo.usuarios where id=@INSPECTOR)
SET @SUPERVISOR_NOM=(select upper(nombre) from fiscamovil.dbo.usuarios where id=@SUPERVISOR)


SELECT 
ROW_NUMBER() OVER (ORDER BY R_REGPAT) AS R_N
,R_REGPAT,R_RAZON,substring(R_CODE_BAR,charindex('!',R_CODE_BAR)+1,9) AS R_CODE_BAR,R_IMPORTE,R_DELEGACION,R_SUBDELEGACION,R_SUPERVISOR,R_INSPECTOR,R_ID_NOTIFICADOR
FROM (
SELECT 
(SELECT replace([CQ_DATO1],'REG. PATRONAL:$','')
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(R_CODE_BAR,1,charindex('!',R_CODE_BAR)-1)) as R_REGPAT
,(SELECT replace([CQ_DATO2],'RAZÓN SOCIAL:$','')
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(R_CODE_BAR,1,charindex('!',R_CODE_BAR)-1)) as R_RAZON
,(select top 1 omision from sireca.dbo.eco
where substring(reg#patronal,1,10)=(SELECT replace([CQ_DATO1],'REG. PATRONAL:$','')
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(R_CODE_BAR,1,charindex('!',R_CODE_BAR)-1))
and credito=substring(R_CODE_BAR,charindex('!',R_CODE_BAR)+1,len(R_CODE_BAR))
) as R_IMPORTE
,'YUCATAN' as R_DELEGACION
,(case 
when @SUBDEL='01' then 'NORTE' 
when @SUBDEL='33' then 'SUR' 
else
''
end) as R_SUBDELEGACION
,@SUPERVISOR_NOM AS R_SUPERVISOR
,@INSPECTOR_NOM AS R_INSPECTOR
,* 
FROM (
SELECT 
replace([CQ_DATO3],'PROMOTOR:$VISIT_CVE:','') as R_ID_NOTIFICADOR
,[HA_ID_CODEBAR] AS R_CODE_BAR
,[HA_FECH_REGISTRO] as R_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as R_ACCION
,ISNULL(HA_OBSERVACION,'') AS R_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES] LEFT JOIN [controlQR].[dbo].[CONTROL_QR] ON [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex('!',[HA_ID_CODEBAR])))
WHERE [HA_SUBDEL]=@SUBDEL and [HA_AC_ID]=@ENT_SAL
) AS RESULT
WHERE (year(R_FECHA_ACCION)=year(@FECH_CREADA)
and month(R_FECHA_ACCION)=month(@FECH_CREADA)
and day(R_FECHA_ACCION)=day(@FECH_CREADA))
and R_ID_NOTIFICADOR=@INSPECTOR
) AS REPORT
GROUP BY R_REGPAT,R_RAZON,R_IMPORTE,R_DELEGACION,R_SUBDELEGACION,R_SUPERVISOR,R_INSPECTOR,R_ID_NOTIFICADOR,substring(R_CODE_BAR,charindex('!',R_CODE_BAR)+1,9)
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="?" SessionField="SIRECAsubdel" />
                <asp:SessionParameter DefaultValue="9999999" Name="?" SessionField="SIRECAid" />
                <asp:QueryStringParameter DefaultValue="9999999" Name="?"
                    QueryStringField="msg1" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="msg2" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?"
                    QueryStringField="fecha2" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

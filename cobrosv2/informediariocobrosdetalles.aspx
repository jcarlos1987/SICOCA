<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="informediariocobrosdetalles.aspx.vb" Inherits="WebSIRECA.informediariocobrosdetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>detelles</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" >EXPORTAR A EXCEL</asp:LinkButton>
    </center>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" HorizontalAlign="Center" AllowSorting="True" 
            Caption="&lt;strong&gt;DILIGENCIA POR EJECUTOR&lt;/strong&gt;" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" ReadOnly="True" 
                    SortExpression="EJECUTOR" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle CssClass="btn-warning" />
            <HeaderStyle CssClass="btn-info" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_INSPECTOR AS VARCHAR(50)
DECLARE @FECHA_ASIG_INI AS DATETIME
DECLARE @FECHA_ASIG_FIN AS DATETIME
DECLARE @INC AS VARCHAR(50)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)

SET @SUBDEL=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG_INI=?
SET @FECHA_ASIG_FIN=?
SET @INC=?

SET @INC=(CASE WHEN @INC='1' THEN '%' ELSE @INC END)
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
IF @INC='SIN_CITATORIO'
BEGIN
EXEC('
SELECT EJECUTOR,COUNT(DISTINCT R_REGPATR) AS PATRONES,COUNT(R_NUMCRED) AS CREDITOS,SUM(R_IMPORTE) AS IMPORTE FROM (
SELECT 
R_TIPO,R_REGPATR,RAZON,R_NUMCRED,SUBSTRING(R_PERIODO,4,7) AS R_PERIODO,R_IMPORTE
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=ID_INS) as EJECUTOR
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE FEC_DILIGENCIA END) AS FECHA_ACCION
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE replace((SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] where id_diligencia=ID_DILI),''(foto)'','''') END) AS ACCION
,INC_RALE,FEINC_RALE,COTIZ,ULTIMA_EMISION
,R_ID,PC_R_ID,PD_R_ID,SECTOR,FNOTIFICACION,DIAS
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO,ID_INS
,ISNULL((SELECT TOP 1 [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1),''PENDIENTE'') AS INC_INDEX
,(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS ID_DILI
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT [R_ID],ID_INS,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN '''+@FECHA_ASIG_INI+''' AND '''+@FECHA_ASIG_FIN+'''
AND R_TD NOT IN (''08'',''80'',''81'',''82'') AND R_SUBDEL LIKE '''+@SUBDEL+''' AND ID_INS LIKE '''+@ID_INSPECTOR+'''
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NULL
) AS DETALLES
LEFT JOIN
(SELECT ''COP'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALECOP+']
union all
SELECT ''RCV'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALERCV+']
) AS RALE ON REPLACE(REGPATR,''-'','''')=R_REGPATR AND NUMCRED=R_NUMCRED AND PERIODO=R_PERIODO
LEFT JOIN (SELECT regpat,razonSocial AS RAZON,cotiz AS COTIZ,vigencia AS ULTIMA_EMISION FROM sireca.dbo.patrones) as ptn on regpat=R_REGPATR
) AS X GROUP BY EJECUTOR
')
END 
ELSE
BEGIN
EXEC('
SELECT EJECUTOR,COUNT(DISTINCT R_REGPATR) AS PATRONES,COUNT(R_NUMCRED) AS CREDITOS,SUM(R_IMPORTE) AS IMPORTE FROM (
SELECT 
R_TIPO,R_REGPATR,RAZON,R_NUMCRED,SUBSTRING(R_PERIODO,4,7) AS R_PERIODO,R_IMPORTE
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=ID_INS) as EJECUTOR
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE FEC_DILIGENCIA END) AS FECHA_ACCION
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE replace((SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] where id_diligencia=ID_DILI),''(foto)'','''') END) AS ACCION
,INC_RALE,FEINC_RALE,COTIZ,ULTIMA_EMISION
,R_ID,PC_R_ID,PD_R_ID,SECTOR,FNOTIFICACION,DIAS
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO,ID_INS
,ISNULL((SELECT TOP 1 [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1),''PENDIENTE'') AS INC_INDEX
,(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS ID_DILI
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT [R_ID],ID_INS,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN '''+@FECHA_ASIG_INI+''' AND '''+@FECHA_ASIG_FIN+'''
AND R_TD NOT IN (''08'',''80'',''81'',''82'') AND R_SUBDEL LIKE '''+@SUBDEL+''' AND ID_INS LIKE '''+@ID_INSPECTOR+'''
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NOT NULL
) AS DETALLES
LEFT JOIN
(SELECT ''COP'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALECOP+']
union all
SELECT ''RCV'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALERCV+']
) AS RALE ON REPLACE(REGPATR,''-'','''')=R_REGPATR AND NUMCRED=R_NUMCRED AND PERIODO=R_PERIODO
LEFT JOIN (SELECT regpat,razonSocial AS RAZON,cotiz AS COTIZ,vigencia AS ULTIMA_EMISION FROM sireca.dbo.patrones) as ptn on regpat=R_REGPATR
WHERE INC_INDEX LIKE '''+@INC+''' 
) AS X GROUP BY EJECUTOR
')
END
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" 
                    QueryStringField="subdel" />
                <asp:Parameter DefaultValue="%" Name="?" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="ffin" />
                <asp:QueryStringParameter DefaultValue="9999" Name="?" QueryStringField="inc" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="9pt" 
            HorizontalAlign="Center" CssClass="table-condensed">
            <Columns>
                <asp:BoundField DataField="R_TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="R_TIPO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="REGPATR" SortExpression="R_REGPATR">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("R_REGPATR") %>' NavigateUrl='<%# "~/observacionPatronal/Default.aspx?razon=razon&regpat=" & Eval("R_REGPATR") %>' Target="_blank"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="R_NUMCRED" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="R_NUMCRED">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="R_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="R_PERIODO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="R_IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="R_IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" ReadOnly="True" 
                    SortExpression="EJECUTOR" />
                <asp:BoundField DataField="FECHA_ACCION" DataFormatString="{0:d}" 
                    HeaderText="FECHA ACCION" ReadOnly="True" SortExpression="FECHA_ACCION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ACCION" HeaderText="ACCION" ReadOnly="True" 
                    SortExpression="ACCION" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC. RALE" ReadOnly="True" 
                    SortExpression="INC_RALE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FEINC_RALE" DataFormatString="{0:d}" 
                    HeaderText="FE. INC. RALE" ReadOnly="True" SortExpression="FEINC_RALE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ" DataFormatString="{0:N0}" HeaderText="COTIZ" 
                    ReadOnly="True" SortExpression="COTIZ">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ULTIMA_EMISION" DataFormatString="{0:Y}" 
                    HeaderText="ULTIMA EMISION" ReadOnly="True" SortExpression="ULTIMA_EMISION" />
            </Columns>
            <HeaderStyle CssClass="btn-info" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_INSPECTOR AS VARCHAR(50)
DECLARE @FECHA_ASIG_INI AS DATETIME
DECLARE @FECHA_ASIG_FIN AS DATETIME
DECLARE @INC AS VARCHAR(50)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)

SET @SUBDEL=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG_INI=?
SET @FECHA_ASIG_FIN=?
SET @INC=?

SET @INC=(CASE WHEN @INC='1' THEN '%' ELSE @INC END)
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
IF @INC='SIN_CITATORIO'
BEGIN
EXEC('
SELECT 
R_TIPO,R_REGPATR,RAZON,R_NUMCRED,SUBSTRING(R_PERIODO,4,7) AS R_PERIODO,R_IMPORTE
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=ID_INS) as EJECUTOR
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE FEC_DILIGENCIA END) AS FECHA_ACCION
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE replace((SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] where id_diligencia=ID_DILI),''(foto)'','''') END) AS ACCION
,INC_RALE,FEINC_RALE,COTIZ,ULTIMA_EMISION
,R_ID,PC_R_ID,PD_R_ID,SECTOR,FNOTIFICACION,DIAS
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO,ID_INS
,ISNULL((SELECT TOP 1 [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1),''PENDIENTE'') AS INC_INDEX
,(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS ID_DILI
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT [R_ID],ID_INS,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN '''+@FECHA_ASIG_INI+''' AND '''+@FECHA_ASIG_FIN+'''
AND R_TD NOT IN (''08'',''80'',''81'',''82'') AND R_SUBDEL LIKE '''+@SUBDEL+''' AND ID_INS LIKE '''+@ID_INSPECTOR+'''
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NULL
) AS DETALLES
LEFT JOIN
(SELECT ''COP'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALECOP+']
union all
SELECT ''RCV'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALERCV+']
) AS RALE ON REPLACE(REGPATR,''-'','''')=R_REGPATR AND NUMCRED=R_NUMCRED AND PERIODO=R_PERIODO
LEFT JOIN (SELECT regpat,razonSocial AS RAZON,cotiz AS COTIZ,vigencia AS ULTIMA_EMISION FROM sireca.dbo.patrones) as ptn on regpat=R_REGPATR
')
END
ELSE
BEGIN
EXEC('
SELECT 
R_TIPO,R_REGPATR,RAZON,R_NUMCRED,SUBSTRING(R_PERIODO,4,7) AS R_PERIODO,R_IMPORTE
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=ID_INS) as EJECUTOR
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE FEC_DILIGENCIA END) AS FECHA_ACCION
,(CASE WHEN '''+@INC+''' IN (''PENDIENTE'') THEN NULL ELSE replace((SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] where id_diligencia=ID_DILI),''(foto)'','''') END) AS ACCION
,INC_RALE,FEINC_RALE,COTIZ,ULTIMA_EMISION
,R_ID,PC_R_ID,PD_R_ID,SECTOR,FNOTIFICACION,DIAS
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO,ID_INS
,ISNULL((SELECT TOP 1 [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1),''PENDIENTE'') AS INC_INDEX
,(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS ID_DILI
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT [R_ID],ID_INS,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN '''+@FECHA_ASIG_INI+''' AND '''+@FECHA_ASIG_FIN+'''
AND R_TD NOT IN (''08'',''80'',''81'',''82'') AND R_SUBDEL LIKE '''+@SUBDEL+''' AND ID_INS LIKE '''+@ID_INSPECTOR+'''
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
WHERE PC_R_ID IS NOT NULL
) AS DETALLES
LEFT JOIN
(SELECT ''COP'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALECOP+']
union all
SELECT ''RCV'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.['+@RALERCV+']
) AS RALE ON REPLACE(REGPATR,''-'','''')=R_REGPATR AND NUMCRED=R_NUMCRED AND PERIODO=R_PERIODO
LEFT JOIN (SELECT regpat,razonSocial AS RAZON,cotiz AS COTIZ,vigencia AS ULTIMA_EMISION FROM sireca.dbo.patrones) as ptn on regpat=R_REGPATR
WHERE INC_INDEX LIKE '''+@INC+''' 
')
END
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" 
                    QueryStringField="subdel" />
                <asp:Parameter DefaultValue="%" Name="?" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="ffin" />
                <asp:QueryStringParameter DefaultValue="9999" Name="?" QueryStringField="inc" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

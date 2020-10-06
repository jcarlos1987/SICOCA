<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="reportecodebarnotificados.aspx.vb" Inherits="WebSIRECA.reportecodebarnotificados" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            ToolTip="SUBDELEGACION" Width="100px">
    </asp:DropDownList>
    <span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="ASIGNACIÓN DEL "></asp:Label>
    </span> 
    <asp:TextBox ID="TBFIni" runat="server" Width="90px"></asp:TextBox>
    <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFIni">
    </asp:CalendarExtender>
    <span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="AL "></asp:Label>
    </span>
    <asp:TextBox ID="TBFFin" runat="server" Width="90px"></asp:TextBox>
    <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFFin">
    </asp:CalendarExtender>
    <span class="add-on">
    <asp:LinkButton CssClass ="btn" ID="LBActualizar" runat="server" BackColor="#9CAAC1">Actualizar</asp:LinkButton>
    </span> 
    </div>
</center>
    <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" 
    AllowSorting="True" AutoGenerateColumns="False" 
    Caption="&lt;strong&gt;INFORME DE NOTIFICADOS PRODUCTIVIDAD&lt;/strong&gt;" DataSourceID="SqlDataSource1" 
    Font-Size="10pt" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PAT." ReadOnly="True" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITO" DataFormatString="{0:N0}" 
                HeaderText="CRED." ReadOnly="True" SortExpression="CREDITO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                ReadOnly="True" SortExpression="MULTA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SALIDA_EMISION" DataFormatString="{0:N0}" 
                HeaderText="SAL. EMI." ReadOnly="True" SortExpression="SALIDA_EMISION">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="ENTRADA_EMISION" DataFormatString="{0:N0}" 
                HeaderText="ENT. EMI." ReadOnly="True" SortExpression="ENTRADA_EMISION">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="PEND./CAP." SortExpression="DIFERENCIA">
                <ItemTemplate>
                    <asp:LinkButton ID="LBDif1" runat="server" OnClick='<%# "javascript:window.open(""" + Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/reportecodebarnotificados.aspx", "areaemision/reportecodebarnotificadosdetalles.aspx?subdel=") +Eval("v_subdel")+ "&inspector=" +Eval("ID_INSPECTOR")+ "&fech_ini=" +Eval("v_fech_ini")+ "&fech_fin=" +Eval("v_fech_fin")+ """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>'
                        Text='<%# Eval("DIFERENCIA", "{0:N0}") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="NOTIFICADO" DataFormatString="{0:N0}" 
                HeaderText="NOTIF." ReadOnly="True" SortExpression="NOTIFICADO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PROMEDIO_NOTIFICADO" DataFormatString="{0:P}" 
                HeaderText="PROM. NOTIF." ReadOnly="True" 
                SortExpression="PROMEDIO_NOTIFICADO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle HorizontalAlign="Right" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
    
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECHA_INI as VARCHAR(10)
DECLARE @FECHA_FIN as VARCHAR(10)
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
exec('
SELECT 
'''+@SUBDEL+''' as v_subdel
,'''+@FECHA_INI+''' as v_fech_ini
,'''+@FECHA_FIN+''' as v_fech_fin
,max(ID_INSPECTOR) as ID_INSPECTOR,INSPECTOR as INSPECTOR,count(distinct reg#patronal) as PATRONES,count(credito) AS CREDITO
,ISNULL(SUM(importe),0) AS IMPORTE
,ISNULL((SUM(importe)*0.40),0) AS MULTA
,ISNULL(sum(FS),0) as SALIDA_EMISION
,ISNULL(sum(FE),0) as ENTRADA_EMISION
,(ISNULL(sum(FS),0)-ISNULL(sum(FE),0)) AS DIFERENCIA
,ISNULL(sum(NOTIFICADO),0) as NOTIFICADO
,ISNULL(sum(NOTIFICADO),0)/(cast (count(distinct fech_asig) as float)) as PROMEDIO_DIA
,(ISNULL(sum(NOTIFICADO),0)/cast(count(credito) as float)) as PROMEDIO_NOTIFICADO
FROM (
SELECT
(CASE WHEN FECHA_SALIDA IS NULL THEN 0 ELSE 1 END) AS FS
,(CASE WHEN FECHA_ENTRADA IS NULL THEN 0 ELSE 1 END) AS FE
,(CASE WHEN FECHA_ENTRADA IS NOT NULL AND RR_ND_CODE IN (''02'') THEN 1 ELSE 0 END) AS NOTIFICADO
,(CASE WHEN FECHA_ENTRADA2 IS NULL THEN 0 ELSE 1 END) AS FE2
,(CASE WHEN FECHA_ENTRADA3 IS NULL THEN 0 ELSE 1 END) AS FE3
,r_regpat,code_bar,ID_INSPECTOR,INSPECTOR FROM (
SELECT 
R_CODE_BAR AS CODE_BAR
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
select (
CASE 
WHEN incidencia IS NULL THEN ''0''
WHEN incidencia IN (''POR PROCESAR'',''SIPARE'') THEN ''DEPURADO''
WHEN incidencia IN (''2'',''9'',''A'',''PAGADO'') THEN incidencia
ELSE ''X''
END
) AS INCIDENCIA
 ,reg#patronal,credito,omision as importe,fechaSeleccion as fech_asig from sireca.dbo.eco where subdel='''+@SUBDEL+''') as eco
on substring(eco.reg#patronal,1,10)=qr.r_regpat and eco.CREDITO=substring(qr.code_bar,charindex(''!'',qr.code_bar)+1,9)
WHERE fech_asig between '''+@FECHA_INI+''' and '''+@FECHA_FIN+'''
and EXISTS(SELECT us.id FROM sireca.dbo.usuarios as us where us.id=ID_INSPECTOR and user_type=''1'')
GROUP BY INSPECTOR
----------------------------------------------
')
">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="TBFIni" DefaultValue="01/01/2000" Name="?" 
            PropertyName="Text" />
        <asp:ControlParameter ControlID="TBFFin" DefaultValue="01/01/2000" Name="?" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" Caption="&lt;strong&gt;INFORME DEL SEGUIMIENTO DE DOCUMENTOS&lt;/strong&gt;" 
        DataSourceID="SqlDataSource2" Font-Size="10pt" 
    HorizontalAlign="Center" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PAT." ReadOnly="True" SortExpression="PATRONES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITO" DataFormatString="{0:N0}" 
                HeaderText="CRED." ReadOnly="True" SortExpression="CREDITO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="MULTA" DataFormatString="{0:C}" HeaderText="MULTA" 
                ReadOnly="True" SortExpression="MULTA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SALIDA_EMISION" DataFormatString="{0:N0}" 
                HeaderText="SAL. EMI." ReadOnly="True" SortExpression="SALIDA_EMISION">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="ENTRADA_EMISION" DataFormatString="{0:N0}" 
                HeaderText="ENT. EMI." ReadOnly="True" SortExpression="ENTRADA_EMISION">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DIFERENCIA" DataFormatString="{0:N0}" 
                HeaderText="DIF." SortExpression="DIFERENCIA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="ENTRADA_CAPTURA" DataFormatString="{0:N0}" 
                HeaderText="ENT. CAP." ReadOnly="True" SortExpression="ENTRADA_CAPTURA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="ENTRADA_CARTERA" DataFormatString="{0:N0}" 
                HeaderText="ENT. CAR." ReadOnly="True" SortExpression="ENTRADA_CARTERA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle HorizontalAlign="Right" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
    
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECHA_INI as VARCHAR(10)
DECLARE @FECHA_FIN as VARCHAR(10)
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?
exec('
-------------------
SELECT 
INSPECTOR as INSPECTOR,count(distinct reg#patronal) as PATRONES,count(credito) AS CREDITO
,ISNULL(SUM(importe),0) AS IMPORTE
,ISNULL((SUM(importe)*0.40),0) AS MULTA
,ISNULL(sum(FS),0) as SALIDA_EMISION
,ISNULL(sum(FE),0) as ENTRADA_EMISION
,(ISNULL(sum(FS),0)-ISNULL(sum(FE),0)) AS DIFERENCIA
,ISNULL(sum(NOTIFICADO),0) as NOTIFICADO
,ISNULL(sum(FE2),0) as ENTRADA_CAPTURA
,ISNULL(sum(FE3),0) as ENTRADA_CARTERA
FROM (
SELECT
(CASE WHEN FECHA_SALIDA IS NULL THEN 0 ELSE 1 END) AS FS
,(CASE WHEN FECHA_ENTRADA IS NULL THEN 0 ELSE 1 END) AS FE
,(CASE WHEN FECHA_ENTRADA IS NOT NULL AND RR_ND_CODE IN (''02'') THEN 1 ELSE 0 END) AS NOTIFICADO
,(CASE WHEN FECHA_ENTRADA2 IS NULL THEN 0 ELSE 1 END) AS FE2
,(CASE WHEN FECHA_ENTRADA3 IS NULL THEN 0 ELSE 1 END) AS FE3
,r_regpat,code_bar,ID_INSPECTOR,INSPECTOR FROM (
SELECT 
R_CODE_BAR AS CODE_BAR
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
select (
CASE 
WHEN incidencia IS NULL THEN ''0''
WHEN incidencia IN (''POR PROCESAR'',''SIPARE'') THEN ''DEPURADO''
WHEN incidencia IN (''2'',''9'',''A'',''PAGADO'') THEN incidencia
ELSE ''X''
END
) AS INCIDENCIA
 ,reg#patronal,credito,omision as importe,fechaSeleccion as fech_asig from sireca.dbo.eco where subdel='''+@SUBDEL+''') as eco
on substring(eco.reg#patronal,1,10)=qr.r_regpat and eco.CREDITO=substring(qr.code_bar,charindex(''!'',qr.code_bar)+1,9)
WHERE fech_asig between '''+@FECHA_INI+''' and '''+@FECHA_FIN+''' --AND INCIDENCIA IS NOT NULL
and EXISTS(SELECT us.id FROM sireca.dbo.usuarios as us where us.id=ID_INSPECTOR and user_type=''1'')
GROUP BY INSPECTOR
----------------------------------------------
')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

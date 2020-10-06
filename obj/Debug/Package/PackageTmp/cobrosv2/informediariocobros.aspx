<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="informediariocobros.aspx.vb" Inherits="WebSIRECA.informediariocobros" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            ToolTip="SUBDELEGACION" Width="120px">
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
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CssClass="table-condensed" DataSourceID="SqlDataSource2" Font-Size="8pt" 
        HorizontalAlign="Center" 
        Caption="&lt;strong&gt;INFORME DIARIO DE LA COBRANZA COACTIVA&lt;/strong&gt;">
        <Columns>
            <asp:BoundField DataField="UNI" />
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
            <asp:BoundField DataField="CREDITOS_MULTA" DataFormatString="{0:N0}" 
                HeaderText="CRED. MULTA" ReadOnly="True" SortExpression="CREDITOS_MULTA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE_MULTA" DataFormatString="{0:C}" 
                HeaderText="IMP. MULTA" ReadOnly="True" SortExpression="IMPORTE_MULTA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CRED_TOTAL" DataFormatString="{0:N0}" 
                HeaderText="CRED. TOTAL" SortExpression="CRED_TOTAL">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMP_TOTAL" DataFormatString="{0:C}" 
                HeaderText="IMP. TOTAL" SortExpression="IMP_TOTAL">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        InsertCommand="SELECT '' as PATRONES,'' as CREDITOS,'' as IMPORTE,'' as CREDITOS_MULTA,'' as IMPORTE_MULTA" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_INSPECTOR AS VARCHAR(50)
DECLARE @FECHA_ASIG_INI AS DATETIME
DECLARE @FECHA_ASIG_FIN AS DATETIME
SET @SUBDEL=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG_INI=?
SET @FECHA_ASIG_FIN=?
SELECT 'TOTAL ASIGNADO' AS UNI,ISNULL(PATRONES,0) as PATRONES,ISNULL(CREDITOS,0) as CREDITOS,ISNULL(IMPORTE,0.0) as IMPORTE
,ISNULL(CREDITOS_MULTA,0) as CREDITOS_MULTA,ISNULL(IMPORTE_MULTA,0.0) as IMPORTE_MULTA
,ISNULL(CREDITOS,0)+ISNULL(CREDITOS_MULTA,0) AS CRED_TOTAL
,ISNULL(IMPORTE,0.0)+ISNULL(IMPORTE_MULTA,0.0) AS IMP_TOTAL
FROM (
SELECT '1' AS UNI,COUNT(DISTINCT [R_REGPATR]) AS PATRONES
,COUNT([R_NUMCRED]) AS CREDITOS
,SUM([R_IMPORTE]) AS IMPORTE
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS D1
LEFT JOIN
(
SELECT '1' AS UNI,COUNT([R_NUMCRED]) AS CREDITOS_MULTA
,SUM([R_IMPORTE]) AS IMPORTE_MULTA
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR 
) AS D2 ON D1.UNI=D2.UNI
---------------------------------------------------------------------------------------------------------------
UNION ALL
SELECT 
'COBRADO' AS INC
,ISNULL(SUM(PATRONES),0) AS PATRONES
,ISNULL(SUM(CREDITOS),0) AS CREDITOS
,ISNULL(SUM(IMPORTE),0.00) AS IMPORTE
,ISNULL(SUM(CREDITOS_MULTA),0) AS CREDITOS_MULTA
,ISNULL(SUM(IMPORTE_MULTA),0.00) AS IMPORTE_MULTA
,(ISNULL(SUM(CREDITOS),0)+ISNULL(SUM(CREDITOS_MULTA),0)) AS CREDITO_TOTAL
,(ISNULL(SUM(IMPORTE),0.00)+ISNULL(SUM(IMPORTE_MULTA),0.00)) AS IMPORTE_TOTAL
FROM (
SELECT '1' AS INC_INDEX,'*CITATORIO' AS INC
UNION ALL
SELECT 'RB' AS INC_INDEX,'................RECAUDACION BANCARA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'................RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'................DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '03' AS INC_INDEX,'................(03) ACLARACION ADMINISTRATIVA' AS INC
UNION ALL
SELECT '05' AS INC_INDEX,'................(05) SOLICITUD DE CONVENIO' AS INC
UNION ALL
SELECT '06' AS INC_INDEX,'................(06) INCONFORMIDAD' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'................(09) NO LOCALIZADO' AS INC
UNION ALL
SELECT '14' AS INC_INDEX,'................(14) JUICIO' AS INC
UNION ALL
SELECT '23' AS INC_INDEX,'................(23) EN TRAMITE DE CONDONACION' AS INC
UNION ALL
SELECT '32' AS INC_INDEX,'................(32) EMBARGO DE BIENES MUEBLES EN DEPOS. AJENA AL IMSS' AS INC
UNION ALL
SELECT '33' AS INC_INDEX,'................(33) EMBARGO DE BIENES MUEBLES EN DEPOS. IMSS' AS INC
UNION ALL
SELECT '34' AS INC_INDEX,'................(34) EMBARGO DE BIENES INMUEBLES' AS INC
UNION ALL
SELECT '35' AS INC_INDEX,'................(35) EMBARGO DE NEGOCIACION' AS INC
UNION ALL
SELECT '43' AS INC_INDEX,'................(43) EMBARGO DE DEPOS. BANCARIOS' AS INC
UNION ALL
SELECT 'PENDIENTE' AS INC_INDEX,'................PENDIENTES' AS INC
) AS head
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
) AS DAOTOS
LEFT JOIN
(SELECT DISTINCT [PC_R_ID],PC_INSPECTOR FROM [sirecacobros].[dbo].[PAE_CITATORIO]) AS CIT 
ON [PC_R_ID]=R_ID AND PC_INSPECTOR=ID_INS
LEFT JOIN
(
SELECT DISTINCT [PD_R_ID],PD_INSPECTOR FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS DILI
ON [PD_R_ID]=[PC_R_ID] AND PD_INSPECTOR=PC_INSPECTOR
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX
WHERE INC_INDEX IN ('RB','RE','DEPURADO')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="%" Name="?" />
            <asp:ControlParameter ControlID="TBFIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" HorizontalAlign="Center" 
        CssClass="table-condensed" Font-Size="8pt">
        <Columns>
            <asp:BoundField DataField="INC" HeaderText="INCIDENCIA" ReadOnly="True" 
                SortExpression="INC" />
            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField SortExpression="PATRONES_P">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" CssClass="label label-info" Text='<%# Eval("PATRONES_P", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("CREDITOS", "{0:N0}") %>' OnClick='<%# "javascript:window.open(""informediariocobrosdetalles.aspx" & Eval("vurl") & """,""detalles"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField SortExpression="CREDITOS_P">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" CssClass="label label-info" Text='<%# Eval("CREDITOS_P", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            </asp:BoundField>
            <asp:TemplateField SortExpression="IMPORTE_P">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" CssClass="label label-info" Text='<%# Eval("IMPORTE_P", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="CREDITOS_MULTA" DataFormatString="{0:N0}" 
                HeaderText="CRED. MULTA" ReadOnly="True" SortExpression="CREDITOS_MULTA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField SortExpression="CREDITOS_PM">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" CssClass="label label-info" Text='<%# Eval("CREDITOS_PM", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE_MULTA" DataFormatString="{0:C}" 
                HeaderText="IMP. MULTA" ReadOnly="True" SortExpression="IMPORTE_MULTA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField SortExpression="IMPORTE_PM">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" CssClass="label label-info" Text='<%# Eval("IMPORTE_PM", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="CREDITO_TOTAL" DataFormatString="{0:N0}" 
                HeaderText="CRED. TOTAL" ReadOnly="True" SortExpression="CREDITO_TOTAL">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField SortExpression="CREDITO_TP">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" CssClass="label label-warning" Text='<%# Eval("CREDITO_TP", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE_TOTAL" DataFormatString="{0:C}" 
                HeaderText="IMP. TOTAL" ReadOnly="True" SortExpression="IMPORTE_TOTAL">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField SortExpression="IMPORTE_TP">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" CssClass="label label-warning" Text='<%# Eval("IMPORTE_TP", "{0:P}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_INSPECTOR AS VARCHAR(50)
DECLARE @FECHA_ASIG_INI AS DATETIME
DECLARE @FECHA_ASIG_FIN AS DATETIME
DECLARE @PATRONES_T AS FLOAT
DECLARE @CREDITOS_T AS FLOAT
DECLARE @CREDITOS_TM AS FLOAT
DECLARE @IMPORTE_T AS FLOAT
DECLARE @IMPORTE_TM AS FLOAT

SET @SUBDEL=?
SET @ID_INSPECTOR=?
SET @FECHA_ASIG_INI=?
SET @FECHA_ASIG_FIN=?
---------------------------------------TOTALES
SET @PATRONES_T=(SELECT COUNT(DISTINCT [R_REGPATR]) AS PATRONES
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

SET @CREDITOS_T=(SELECT COUNT([R_NUMCRED]) AS CREDITOS
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

SET @IMPORTE_T=(SELECT ISNULL(SUM([R_IMPORTE]),0) AS IMPORTE
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

SET @CREDITOS_TM=(SELECT COUNT([R_NUMCRED]) AS CREDITOS_MULTA
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)

SET @IMPORTE_TM=(SELECT ISNULL(SUM([R_IMPORTE]),0) AS IMPORTE_MULTA
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR)
------------------------------------------------------------------------------------------------------RESULTADOS
SELECT 
vurl,INC_INDEX,INC
,PATRONES,(PATRONES/(CASE WHEN @PATRONES_T=0 THEN 1.0 ELSE @PATRONES_T END)) AS PATRONES_P
,CREDITOS,(CREDITOS/(CASE WHEN @CREDITOS_T=0 THEN 1.0 ELSE @CREDITOS_T END)) AS CREDITOS_P
,IMPORTE,(IMPORTE/(CASE WHEN @IMPORTE_T=0 THEN 1.0 ELSE @IMPORTE_T END)) AS IMPORTE_P
,CREDITOS_MULTA,(CREDITOS_MULTA/(CASE WHEN @CREDITOS_TM=0 THEN 1.0 ELSE @CREDITOS_TM END)) AS CREDITOS_PM
,IMPORTE_MULTA,(IMPORTE_MULTA/(CASE WHEN @IMPORTE_TM=0 THEN 1.0 ELSE @IMPORTE_TM END)) AS IMPORTE_PM
,CREDITO_TOTAL,(CREDITO_TOTAL/(CASE WHEN (@CREDITOS_T+@CREDITOS_TM)=0 THEN 1.0 ELSE (@CREDITOS_T+@CREDITOS_TM) END)) AS CREDITO_TP
,IMPORTE_TOTAL,(IMPORTE_TOTAL/(CASE WHEN (@IMPORTE_T+@IMPORTE_TM)=0 THEN 1.0 ELSE (@IMPORTE_T+@IMPORTE_TM) END)) AS IMPORTE_TP
FROM (
------------------------------------------------------------------------------------SIN SITATORIO
SELECT
('?subdel='+@SUBDEL+'&amp;fini='+convert(nvarchar,@FECHA_ASIG_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_ASIG_FIN,103)+'&amp;inc=SIN_CITATORIO') as vurl
,'1' AS INC_INDEX
,'*SIN CITATORIOS' AS INC
,ISNULL(SUM(PATRONES),0) AS PATRONES
,ISNULL(SUM(CREDITOS),0) AS CREDITOS
,ISNULL(SUM(IMPORTE),0.00) AS IMPORTE
,ISNULL(SUM(CREDITOS_MULTA),0) AS CREDITOS_MULTA
,ISNULL(SUM(IMPORTE_MULTA),0.00) AS IMPORTE_MULTA
,(ISNULL(SUM(CREDITOS),0)+ISNULL(SUM(CREDITOS_MULTA),0)) AS CREDITO_TOTAL
,(ISNULL(SUM(IMPORTE),0.00)+ISNULL(SUM(IMPORTE_MULTA),0.00)) AS IMPORTE_TOTAL
FROM (
SELECT '1' AS INC_INDEX,'*CITATORIO' AS INC
UNION ALL
SELECT 'RB' AS INC_INDEX,'................RECAUDACION BANCARA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'................RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'................DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '03' AS INC_INDEX,'................(03) ACLARACION ADMINISTRATIVA' AS INC
UNION ALL
SELECT '05' AS INC_INDEX,'................(05) SOLICITUD DE CONVENIO' AS INC
UNION ALL
SELECT '06' AS INC_INDEX,'................(06) INCONFORMIDAD' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'................(09) NO LOCALIZADO' AS INC
UNION ALL
SELECT '14' AS INC_INDEX,'................(14) JUICIO' AS INC
UNION ALL
SELECT '23' AS INC_INDEX,'................(23) EN TRAMITE DE CONDONACION' AS INC
UNION ALL
SELECT '32' AS INC_INDEX,'................(32) EMBARGO DE BIENES MUEBLES EN DEPOS. AJENA AL IMSS' AS INC
UNION ALL
SELECT '33' AS INC_INDEX,'................(33) EMBARGO DE BIENES MUEBLES EN DEPOS. IMSS' AS INC
UNION ALL
SELECT '34' AS INC_INDEX,'................(34) EMBARGO DE BIENES INMUEBLES' AS INC
UNION ALL
SELECT '35' AS INC_INDEX,'................(35) EMBARGO DE NEGOCIACION' AS INC
UNION ALL
SELECT '43' AS INC_INDEX,'................(43) EMBARGO DE DEPOS. BANCARIOS' AS INC
UNION ALL
SELECT 'PENDIENTE' AS INC_INDEX,'................PENDIENTES' AS INC
) AS head
-----------------------------------------------ORIGEN
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
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
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
-----------------------------------------------MULTA
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
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
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX
UNION ALL
------------------------------------------------------------------------------------CON SITATORIO
SELECT
('?subdel='+@SUBDEL+'&amp;fini='+convert(nvarchar,@FECHA_ASIG_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_ASIG_FIN,103)+'&amp;inc=1') as vurl
,'1' AS INC_INDEX
,'*CITATORIOS' AS INC
,ISNULL(SUM(PATRONES),0) AS PATRONES
,ISNULL(SUM(CREDITOS),0) AS CREDITOS
,ISNULL(SUM(IMPORTE),0.00) AS IMPORTE
,ISNULL(SUM(CREDITOS_MULTA),0) AS CREDITOS_MULTA
,ISNULL(SUM(IMPORTE_MULTA),0.00) AS IMPORTE_MULTA
,(ISNULL(SUM(CREDITOS),0)+ISNULL(SUM(CREDITOS_MULTA),0)) AS CREDITO_TOTAL
,(ISNULL(SUM(IMPORTE),0.00)+ISNULL(SUM(IMPORTE_MULTA),0.00)) AS IMPORTE_TOTAL
FROM (
SELECT '1' AS INC_INDEX,'*CITATORIO' AS INC
UNION ALL
SELECT 'RB' AS INC_INDEX,'................RECAUDACION BANCARA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'................RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'................DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '03' AS INC_INDEX,'................(03) ACLARACION ADMINISTRATIVA' AS INC
UNION ALL
SELECT '05' AS INC_INDEX,'................(05) SOLICITUD DE CONVENIO' AS INC
UNION ALL
SELECT '06' AS INC_INDEX,'................(06) INCONFORMIDAD' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'................(09) NO LOCALIZADO' AS INC
UNION ALL
SELECT '14' AS INC_INDEX,'................(14) JUICIO' AS INC
UNION ALL
SELECT '23' AS INC_INDEX,'................(23) EN TRAMITE DE CONDONACION' AS INC
UNION ALL
SELECT '32' AS INC_INDEX,'................(32) EMBARGO DE BIENES MUEBLES EN DEPOS. AJENA AL IMSS' AS INC
UNION ALL
SELECT '33' AS INC_INDEX,'................(33) EMBARGO DE BIENES MUEBLES EN DEPOS. IMSS' AS INC
UNION ALL
SELECT '34' AS INC_INDEX,'................(34) EMBARGO DE BIENES INMUEBLES' AS INC
UNION ALL
SELECT '35' AS INC_INDEX,'................(35) EMBARGO DE NEGOCIACION' AS INC
UNION ALL
SELECT '43' AS INC_INDEX,'................(43) EMBARGO DE DEPOS. BANCARIOS' AS INC
UNION ALL
SELECT 'PENDIENTE' AS INC_INDEX,'................PENDIENTES' AS INC
) AS head
-----------------------------------------------ORIGEN
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
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
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
-----------------------------------------------MULTA
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
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
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX

------------------------------------------------------------------CITATORIOS DILIGENCIADOS
UNION ALL
SELECT 
('?subdel='+@SUBDEL+'&amp;fini='+convert(nvarchar,@FECHA_ASIG_INI,103)+'&amp;ffin='+convert(nvarchar,@FECHA_ASIG_FIN,103)+'&amp;inc='+INC_INDEX) as vurl
,INC_INDEX,INC
,ISNULL(PATRONES,0) AS PATRONES
,ISNULL(CREDITOS,0) AS CREDITOS
,ISNULL(IMPORTE,0.00) AS IMPORTE
,ISNULL(CREDITOS_MULTA,0) AS CREDITOS_MULTA
,ISNULL(IMPORTE_MULTA,0.00) AS IMPORTE_MULTA
,(ISNULL(CREDITOS,0)+ISNULL(CREDITOS_MULTA,0)) AS CREDITO_TOTAL
,(ISNULL(IMPORTE,0.00)+ISNULL(IMPORTE_MULTA,0.00)) AS IMPORTE_TOTAL
FROM (
SELECT 'RB' AS INC_INDEX,'................RECAUDACION BANCARA' AS INC
UNION ALL
SELECT 'RE' AS INC_INDEX,'................RECAUDACION EXACTORA' AS INC
UNION ALL
SELECT 'DEPURADO' AS INC_INDEX,'................DEPURADO PROCESAR/SIPARE' AS INC
UNION ALL
SELECT '03' AS INC_INDEX,'................(03) ACLARACION ADMINISTRATIVA' AS INC
UNION ALL
SELECT '05' AS INC_INDEX,'................(05) SOLICITUD DE CONVENIO' AS INC
UNION ALL
SELECT '06' AS INC_INDEX,'................(06) INCONFORMIDAD' AS INC
UNION ALL
SELECT '9' AS INC_INDEX,'................(09) NO LOCALIZADO' AS INC
UNION ALL
SELECT '14' AS INC_INDEX,'................(14) JUICIO' AS INC
UNION ALL
SELECT '23' AS INC_INDEX,'................(23) EN TRAMITE DE CONDONACION' AS INC
UNION ALL
SELECT '32' AS INC_INDEX,'................(32) EMBARGO DE BIENES MUEBLES EN DEPOS. AJENA AL IMSS' AS INC
UNION ALL
SELECT '33' AS INC_INDEX,'................(33) EMBARGO DE BIENES MUEBLES EN DEPOS. IMSS' AS INC
UNION ALL
SELECT '34' AS INC_INDEX,'................(34) EMBARGO DE BIENES INMUEBLES' AS INC
UNION ALL
SELECT '35' AS INC_INDEX,'................(35) EMBARGO DE NEGOCIACION' AS INC
UNION ALL
SELECT '43' AS INC_INDEX,'................(43) EMBARGO DE DEPOS. BANCARIOS' AS INC
UNION ALL
SELECT 'PENDIENTE' AS INC_INDEX,'................PENDIENTES' AS INC
) AS head
left join
(SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_O
,COUNT(DISTINCT R_REGPATR) AS PATRONES
,COUNT(R_NUMCRED) AS CREDITOS
,SUM(R_IMPORTE) AS IMPORTE
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD NOT IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
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
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO1 ON INC_INDEX_O=INC_INDEX
LEFT JOIN 
(
SELECT ISNULL(INC_INDEX,'PENDIENTE') AS INC_INDEX_M
,COUNT(R_NUMCRED) AS CREDITOS_MULTA
,SUM(R_IMPORTE) AS IMPORTE_MULTA
FROM (
SELECT R_ID,PC_R_ID,[PD_R_ID]
,R_REGPATR,R_NUMCRED,R_IMPORTE,R_PERIODO
,(SELECT [id_inf_diario] FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(SELECT TOP 1 [PD_DILIGENCIA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) and visibleinspectorb=1) AS INC_INDEX
,(SELECT TOP 1 [PD_FECHA]
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] WHERE [PD_INSPECTOR]=ID_INS AND [PD_R_ID]=R_ID
ORDER BY [PD_ID] DESC) AS FEC_DILIGENCIA
FROM (
SELECT *
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [FECH_INS] BETWEEN @FECHA_ASIG_INI AND @FECHA_ASIG_FIN
AND R_TD IN ('08','80','81','82') AND R_SUBDEL LIKE @SUBDEL AND ID_INS LIKE @ID_INSPECTOR
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
) AS ORIGEN GROUP BY INC_INDEX
) AS DATO2 ON INC_INDEX_M=INC_INDEX
) AS RESULTADO
">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
            PropertyName="SelectedValue" />
        <asp:Parameter DefaultValue="%" Name="?" />
        <asp:ControlParameter ControlID="TBFIni" DefaultValue="01/01/2000" Name="?" 
            PropertyName="Text" />
        <asp:ControlParameter ControlID="TBFFin" DefaultValue="01/01/2000" Name="?" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

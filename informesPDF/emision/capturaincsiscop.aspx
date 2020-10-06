<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="capturaincsiscop.aspx.vb" Inherits="WebSIRECA.capturaincsiscop" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
        AutoPostBack="True" Width="120px">
    </asp:DropDownList>
<span class="add-on">
AÑO
</span> 
<asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" data-toggle="dropdown" AutoPostBack="True" Width="80px">
</asp:DropDownList>
<span class="add-on">
INCIDENCIA
</span> 
    <asp:DropDownList ID="DDLInc" runat="server" Width="138px">
        <asp:ListItem Value="2">Notificado</asp:ListItem>
        <asp:ListItem Value="9">No Localizado</asp:ListItem>
    </asp:DropDownList>
<asp:DropDownList ID="DDLTipo" runat="server" Width="100px">
        <asp:ListItem Value="eco">ECO</asp:ListItem>
        <asp:ListItem Value="sivepas">SIVEPA</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="TBFolio" runat="server" placeholder="FOLIO 5 DIGITOS" MaxLength="5" 
        Width="140px"></asp:TextBox>
<span class="add-on">
FECHA DE AFECTACION
</span>
<asp:TextBox runat="server" MaxLength="10" Width="80px" ID="TBFechIni"></asp:TextBox>
<asp:CalendarExtender runat="server" Format="dd/MM/yyyy" Enabled="True" TargetControlID="TBFechIni" ID="caext1"></asp:CalendarExtender>
<span class="add-on">
<asp:LinkButton ID="LBBuscar" runat="server" CssClass="btn">Buscar</asp:LinkButton>
</span> 
</div>
<br/>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:LinkButton ID="LBCedCaptura" runat="server" CssClass="btn" BackColor="Red">CREAR CEDULA DE CAPTURA</asp:LinkButton>
</span>
</div>
</center>
    <asp:GridView ID="GridViewDatos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceDatos" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="V_N" HeaderText="N" ReadOnly="True" 
                SortExpression="V_N" />
            <asp:BoundField DataField="V_REGPAT" HeaderText="REG.PAT." ReadOnly="True" 
                SortExpression="V_REGPAT" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="V_CREDITO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="V_PERIODO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="V_IMPORTE" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="V_ORI_MUL" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="V_ORI_MUL" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_TIPO_ECO" HeaderText="CUOTA" ReadOnly="True" 
                SortExpression="V_TIPO_ECO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_DILI" HeaderText="DILIGENCIADO" 
                ReadOnly="True" SortExpression="FECHA_DILI" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC_RALE" HeaderText="INC. R.A.L.E." ReadOnly="True" 
                SortExpression="INC_RALE" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="INC." SortExpression="V_INCIDENCIA">
                <ItemTemplate>
                    <asp:TextBox ID="TBInc" runat="server" Text='<%# Eval("V_INCIDENCIA") %>' MaxLength="2" Width="20" ></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="HFId" runat="server" Value='<%# Eval("V_ID") %>' />
                    <asp:CheckBox ID="CBAgregar" runat="server" Checked="True" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDatos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL VARCHAR(2)
DECLARE @FOLIO VARCHAR(6)
DECLARE @VINC VARCHAR(6)
DECLARE @WHERE_INC VARCHAR(100)
DECLARE @ROWS_MAX INT
DECLARE @ANIO VARCHAR(4)
DECLARE @NUM_CREDITOS INT
DECLARE @JOF_EMI as VARCHAR(200)
DECLARE @ELABORO as VARCHAR(200)
DECLARE @OBSERVACION as VARCHAR(3000)
DECLARE @FECHA_CAP_SISCOP as VARCHAR(10)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @DBO AS VARCHAR(50)
SET @SUBDEL=?
SET @FOLIO=?
SET @VINC=?
SET @ANIO=?
SET @FECHA_CAP_SISCOP=?
SET @DBO=?

SET @WHERE_INC=' and V_INC_CAPTURA='''+@VINC+''''
-- RALE --------------------------
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
----------------------------------
SET @ROWS_MAX=32
IF @DBO='eco'
BEGIN
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @OBSERVACION=(SELECT MAX([V_FOLIO_P1_OBSERVACION])
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @NUM_CREDITOS=(SELECT COUNT([V_CREDITO])
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--FILAS FALTANTES- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @ROWS_MAX=(select case when @NUM_CREDITOS&gt;@ROWS_MAX then @ROWS_MAX-(@NUM_CREDITOS-((@NUM_CREDITOS/@ROWS_MAX)*@ROWS_MAX))
else @ROWS_MAX-@NUM_CREDITOS end)
--ELABORA
SET @ELABORO=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_SEC_REG' and subdel=[V_SUBDEL])
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
--JEFE OFICI EMISION
SET @JOF_EMI=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_OFI_REGI' and subdel=@SUBDEL)
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
END
ELSE
BEGIN
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @OBSERVACION=(SELECT MAX([V_FOLIO_P1_OBSERVACION])
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--TOTAL CREDITOS- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @NUM_CREDITOS=(SELECT COUNT([V_CREDITO])
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO and V_INC_CAPTURA=@VINC and year(V_FECHA_P1_TURNADO)=@ANIO)
--FILAS FALTANTES- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - ---
SET @ROWS_MAX=(select case when @NUM_CREDITOS&gt;@ROWS_MAX then @ROWS_MAX-(@NUM_CREDITOS-((@NUM_CREDITOS/@ROWS_MAX)*@ROWS_MAX))
else @ROWS_MAX-@NUM_CREDITOS end)
--ELABORA
SET @ELABORO=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_SEC_REG' and subdel=[V_SUBDEL])
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
--JEFE OFICI EMISION
SET @JOF_EMI=(SELECT top 1
(SELECT 'C. '+upper(nombre)
FROM [sirecaemisiones].[dbo].[catalogo] inner join fiscamovil.dbo.usuarios on [C_ID]=id
WHERE [C_CARGO]='JFE_OFI_REGI' and subdel=@SUBDEL)
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE V_SUBDEL=@SUBDEL
and V_FOLIO_P1=@FOLIO)
END
--REPORTE- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - -
exec('
SELECT V_N,V_ID,FECHA_DILI,V_ORI_MUL,V_REGPAT,V_CREDITO,V_PERIODO,V_IMPORTE,V_ELABORO,FOLIO_ELABORO,V_RECIBE,V_TIPO_ECO,V_DELEGACION,V_SUBDELEGACION,V_JEFE_OFI_EMISION,V_CEDULA_CAP3,V_CEDULA_CAP4,V_CLAVE_AJUSTE,V_INCIDENCIA,V_FOLIO_SICOFI,V_OBSERVACION,TIPO_COP_RCV,INC as INC_RALE FROM (
SELECT
ROW_NUMBER() OVER(order by V_REGPAT,convert(datetime,''01/''+V_PERIODO,103)) as V_N
,V_ID
,convert(varchar,[V_FECHA_CAPTURA],103) as FECHA_DILI
,(
CASE WHEN [V_TIPO_ECO] IN (''COP'',''SIVEPA-IMSS'') THEN '''' ELSE (CASE WHEN V_ORI_MUL IN (''ORIGEN'') THEN '''' ELSE V_ORI_MUL END) END
)
as V_ORI_MUL
,(SELECT SUM([V_OMISION])
FROM [sirecaemisiones].[dbo].['+@DBO+']
WHERE V_SUBDEL='''+@SUBDEL+'''
and V_FOLIO_P1='''+@FOLIO+''' and year(V_FECHA_P1_TURNADO)='+@ANIO+' 
'+ @WHERE_INC +'
) AS V_IMPORTE_TOT
,'+@NUM_CREDITOS+' AS V_NUM_CREDITOS
,[V_REGPAT]
,[V_CREDITO]
,[V_PERIODO]
,[V_OMISION] as V_IMPORTE
,'''+@ELABORO+''' as V_ELABORO
,[V_FOLIO_P1] as FOLIO_ELABORO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=[V_FOLIO_P1_TURNADO_A]) as V_RECIBE
,[V_TIPO_ECO]
,(SELECT [CT_NOM_DEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=[V_SUBDEL]) as V_DELEGACION
,(SELECT [CT_NOM_SUBDEL]
FROM [sireca].[dbo].[catalogodelegacional]
WHERE [CT_SUBDEL]=[V_SUBDEL]) as V_SUBDELEGACION
,'''+@JOF_EMI+''' as V_JEFE_OFI_EMISION
,V_FECHA_P1_TURNADO as V_FECHA_TURNO
,(CASE WHEN V_INC_CAPTURA in (''2'',''9'') THEN '''' ELSE ''X'' END) as V_CEDULA_CAP3
,(CASE WHEN V_INC_CAPTURA in (''2'',''9'') THEN ''X'' ELSE '''' END) as V_CEDULA_CAP4
,(CASE 
WHEN V_INC_CAPTURA in (''2'') THEN '''' 
WHEN V_INC_CAPTURA in (''9'') THEN '''' 
ELSE ''12'' END) as V_CLAVE_AJUSTE
,(CASE 
WHEN V_INC_CAPTURA in (''2'') THEN 
(case when datediff(day,[V_FECHA_CAPTURA],'''+@FECHA_CAP_SISCOP+''')&lt;=17 then ''02'' else ''31'' end)
WHEN V_INC_CAPTURA in (''9'') THEN ''09'' 
ELSE '''' END) as V_INCIDENCIA
,'''' as V_FOLIO_SICOFI
,V_FOLIO_P1_OBSERVACION as V_OBSERVACION
FROM [sirecaemisiones].[dbo].['+@DBO+']
WHERE V_SUBDEL='''+@SUBDEL+'''
and V_FOLIO_P1='''+@FOLIO+''' and year(V_FECHA_P1_TURNADO)='+@ANIO+'
'+ @WHERE_INC +' 
union all
SELECT top '+ @ROWS_MAX +' 0 as V_N
,0 as V_ID
,''- - - - -'' as FECHA_DILI
,''- - - - -'' as V_ORI_MUL,0 as V_IMPORTE_TOT,0 as V_NUM_CREDITOS,''- - - - -'' as V_REGPAT,''- - - - -'' as V_CREDITO,''- - - - -'' as V_PERIODO,0 as V_IMPORTE
,'''+@ELABORO+''' as V_ELABORO,''- - - - -'' as FOLIO_ELABORO,''- - - - -'' as V_RECIBE,''- - - - -'' as V_TIPO_ECO,''- - - - -'' as V_DELEGACION,''- - - - -'' as V_SUBDELEGACION
,'''+@JOF_EMI+''' as V_JEFE_OFI_EMISION,NULL as V_FECHA_TURNO,''- - - - -'' as V_CEDULA_CAP3,''- - - - -'' as V_CEDULA_CAP4,''- - - - -'' as V_CLAVE_AJUSTE,''- - - - -'' as V_INCIDENCIA
,''- - - - -'' as V_FOLIO_SICOFI
,'''+@OBSERVACION+''' as V_OBSERVACION
FROM [sirecaemisiones].[dbo].[F_FILL]
) AS CEDULA
LEFT JOIN 
(SELECT ''COP'' AS TIPO_COP_RCV,REGPATR,NUMCRED,PERIODO,INC FROM rale.dbo.['+@RALECOP+']
UNION All
SELECT ''RCV'' AS TIPO_COP_RCV,REGPATR,NUMCRED,PERIODO,INC FROM rale.dbo.['+@RALERCV+']) as RALE
ON REPLACE(RALE.REGPATR,''-'','''')=SUBSTRING(V_REGPAT,1,10) AND V_CREDITO=NUMCRED AND V_PERIODO=SUBSTRING(RALE.PERIODO,4,7)
WHERE V_INCIDENCIA not in (''- - - - -'')
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFolio" DefaultValue="999999" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLInc" DefaultValue="99" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLTipo" DefaultValue="eco" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

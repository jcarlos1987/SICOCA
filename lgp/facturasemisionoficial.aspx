<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="facturasemisionoficial.aspx.vb" Inherits="WebSIRECA.facturasemisionoficial" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>CARGANDO...</ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>    
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" Width="150px">
        </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span> 
                            <asp:DropDownList ID="DDLMes" runat="server" Width="150px">
                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDLAnio" runat="server" Width="100px"></asp:DropDownList>
        <asp:LinkButton ID="LinkButton1" runat="server" BorderColor="#BCC7D8" 
        BorderStyle="Solid" BorderWidth="1px" CssClass="btn"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
</div> 
            <br />
        <asp:Panel ID="Panel1" runat="server" BackColor="White" HorizontalAlign="Center">
<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="1000px" 
            Height="500px">
        <Series>
            <asp:Series BorderWidth="3" ChartArea="ChartArea1" Color="Pink" 
                CustomProperties="DrawingStyle=Cylinder" Font="Microsoft Sans Serif, 7pt" 
                Legend="Legend1" Name="DIF. FAC. VS. COBRO" 
                ToolTip="#AXISLABEL\nDIFERENCIA VS FACTURAS: #VAL{N}" XValueMember="MES" 
                YValueMembers="DIFERENCIA_VS_FAC" ChartType="StackedColumn" 
                YAxisType="Secondary">
            </asp:Series>
            <asp:Series ChartType="Line" Name="INGRESOS 10,13,17" XValueMember="MES" 
                YValueMembers="INGRESO101317" Legend="Legend1" BorderWidth="3" 
                Font="Microsoft Sans Serif, 7pt" 
                ToolTip="#AXISLABEL\nINGRESOS 10,13,17: #VAL{N}" Color="Red" 
                ShadowColor="" CustomProperties="IsXAxisQuantitative=False" 
                MarkerBorderColor="DimGray" MarkerSize="8" MarkerStyle="Square" 
                YValuesPerPoint="6">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Color="CornflowerBlue" 
                CustomProperties="DrawingStyle=Cylinder" Legend="Legend1" Name="FAC.EMISION" 
                ToolTip="#AXISLABEL\nFACTURA EMISION: #VAL{N}" XValueMember="MES" 
                YValueMembers="FAC_EMISION">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Legend="Legend1" 
                Name="SALDO 2° MES" XValueMember="MES" 
                YValueMembers="SALDO_2MES" 
                ToolTip="#AXISLABEL\nSALDO 2° MES: #VAL{N}" 
                CustomProperties="DrawingStyle=Cylinder" ChartType="StackedColumn" 
                Color="Indigo">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Crossing="Min" IntervalAutoMode="VariableCount">
                    <MajorGrid LineColor="Gray" LineDashStyle="Dash" />
                    <LabelStyle Format="{0:N0}" />
                </AxisY>
                <AxisX IsLabelAutoFit="False" Maximum="13" 
                    Minimum="0" 
                    LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, WordWrap" 
                    IntervalAutoMode="VariableCount">
                    <MajorGrid LineColor="Gray" LineDashStyle="Dash" />
                    <LabelStyle Angle="-90" />
                </AxisX>
                <AxisX2 IsLabelAutoFit="False" Maximum="13" Minimum="0">
                    <MajorGrid LineColor="255, 128, 0" LineDashStyle="Dot" />
                </AxisX2>
                <AxisY2 Crossing="Min" Maximum="30000000">
                    <MajorGrid LineColor="255, 128, 0" LineDashStyle="Dot" />
                    <LabelStyle Format="{0:N0}" />
                </AxisY2>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" Alignment="Center" Docking="Top">
                <CellColumns>
                    <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                    <asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                </CellColumns>
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Name="Title1" 
                Text="REPORTE DE COBRO FACTURA DE EMISION Vs. INGRESOS 10,13,17 OBSERVADO">
            </asp:Title>
        </Titles>
    </asp:Chart>
        </asp:Panel>
    <br />
    <table style="width: 100%; font-size: 11px;" border="0" cellpadding="0" 
        cellspacing="0">
            <tr>
                <td align="center">
                    &nbsp;</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center" class="style1">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
                <td align="center">
                    OFICIAL</td>
            </tr>                   
            <tr>
            <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #000000;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr><td ><asp:Label ID="Label3" runat="server" Text="&nbsp;"></asp:Label></td></tr>
                <tr><td ><asp:Label ID="Label4" runat="server" Text="&nbsp;<br/>&nbsp;"></asp:Label></td></tr>
                <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="left"><asp:Label ID="Label5" runat="server" Text="FACTURAS_DE_EMISION"></asp:Label></td></tr>
                <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="left"><asp:Label ID="Label6" runat="server" Text="SALDO_EMISION_2°_MES"></asp:Label></td></tr>
                <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="left"><asp:Label ID="Label7" runat="server" Text="Ingresos_10,13,17_Observ."></asp:Label></td></tr>
                <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="left"><asp:Label ID="Label8" runat="server" Text="DIFERENCIA_VS._FACTURA"></asp:Label></td></tr>
                <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="left"><asp:Label ID="Label9" runat="server" Text="%Cobro_de_Factura"></asp:Label></td></tr>
            </table>
            </td>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>   
    <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #000000;">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="center"><asp:Label ID="Label3" runat="server" Text='<%# Eval("MES") %>'></asp:Label></td></tr>
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000" align="center"><asp:Label ID="Label4" runat="server" Text='<%# "Emision<br/>" & Eval("EMISION") %>'></asp:Label></td></tr>
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="right"><asp:Label ID="Label5" runat="server" Text='<%# Eval("FAC_EMISION","{0:N}") %>'></asp:Label></td></tr>
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="right"><asp:Label ID="Label6" runat="server" Text='<%# Eval("SALDO_2MES","{0:N}") %>'></asp:Label></td></tr>
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="right"><asp:Label ID="Label7" runat="server" Text='<%# Eval("INGRESO101317","{0:N}") %>'></asp:Label></td></tr>
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="right"><asp:Label ID="Label8" runat="server" Text='<%# Eval("DIFERENCIA_VS_FAC","{0:N}") %>'></asp:Label></td></tr>
        <tr><td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000; font-weight: bold;" align="right"><asp:Label ID="Label9" runat="server" Text='<%# Eval("%COBRO","{0:P}") %>'></asp:Label></td></tr>
    </table>
    </td>
    </ItemTemplate>
    </asp:Repeater>
        </tr>
        </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @CONSULTA01 AS VARCHAR(4000)
DECLARE @CONSULTA02 AS VARCHAR(4000)
DECLARE @CONSULTA03 AS VARCHAR(4000)
DECLARE @CONSULTA04 AS VARCHAR(4000)
DECLARE @CONSULTA05 AS VARCHAR(4000)
DECLARE @CONSULTA06 AS VARCHAR(4000)
DECLARE @CONSULTA07 AS VARCHAR(4000)
DECLARE @CONSULTA08 AS VARCHAR(4000)
DECLARE @CONSULTA09 AS VARCHAR(4000)
DECLARE @CONSULTA10 AS VARCHAR(4000)
DECLARE @CONSULTA11 AS VARCHAR(4000)
DECLARE @CONSULTA12 AS VARCHAR(4000)
DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @SUBDEL1 AS VARCHAR(2)
DECLARE @SUBDEL2 AS VARCHAR(2)
DECLARE @FECHA_TEM as NVARCHAR(10)
SET @SUBDEL=?
if @SUBDEL='%'
begin
set @SUBDEL1='01'
set @SUBDEL2='33'
end
else
begin
set @SUBDEL1=@SUBDEL
end

SET @MES=?
SET @ANIO=?
SET @CONSULTA01=''
SET @CONSULTA02=''
SET @CONSULTA03=''
SET @CONSULTA04=''
SET @CONSULTA05=''
SET @CONSULTA06=''
SET @CONSULTA07=''
SET @CONSULTA08=''
SET @CONSULTA09=''
SET @CONSULTA10=''
SET @CONSULTA11=''
SET @CONSULTA12=''
--01-----------------------------------------------------------------------------------------
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA01 = @CONSULTA01+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA01 = @CONSULTA01+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA01 = @CONSULTA01+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA01 = @CONSULTA01+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA01 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--02-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA02 = @CONSULTA02+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA02 = @CONSULTA02+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA02 = @CONSULTA02+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA02 = @CONSULTA02+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA02 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--03-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA03 = @CONSULTA03+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA03 = @CONSULTA03+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA03 = @CONSULTA03+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA03 = @CONSULTA03+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA03 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--04-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA04 = @CONSULTA04+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA04 = @CONSULTA04+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA04 = @CONSULTA04+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA04 = @CONSULTA04+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA04 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--05-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA05 = @CONSULTA05+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA05 = @CONSULTA05+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA05 = @CONSULTA05+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA05 = @CONSULTA05+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA05 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--06-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA06 = @CONSULTA06+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA06 = @CONSULTA06+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA06 = @CONSULTA06+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA06 = @CONSULTA06+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA06 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--07-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA07 = @CONSULTA07+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA07 = @CONSULTA07+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA07 = @CONSULTA07+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA07 = @CONSULTA07+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA07 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END

--08-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA08 = @CONSULTA08+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA08 = @CONSULTA08+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA08 = @CONSULTA08+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA08 = @CONSULTA08+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA08 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--09-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA09 = @CONSULTA09+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA09 = @CONSULTA09+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA09 = @CONSULTA09+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA09 = @CONSULTA09+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA09 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--10-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA10 = @CONSULTA10+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA10 = @CONSULTA10+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA10 = @CONSULTA10+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA10 = @CONSULTA10+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA10 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--11-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA11 = @CONSULTA11+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA11 = @CONSULTA11+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA11 = @CONSULTA11+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA11 = @CONSULTA11+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA11 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END
--12-----------------------------------------------------------------------------------------
SET @FECHA_TEM='01/'+@MES+'/'+@ANIO
SET @MES=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),4,2)
SET @ANIO=SUBSTRING(CONVERT(NVARCHAR(10),DATEADD(MONTH,1,@FECHA_TEM),103),7,4)
IF  EXISTS (select * from sireca.dbo.sysobjects where name = 'EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2)))
BEGIN
SET @CONSULTA12 = @CONSULTA12+'
SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES
,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION
,SUM([emision]) AS FAC_EMISION
,(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''') AS SALDO_2MES
,(
SELECT sum([RCI_IMPORTE]) FROM [sirecacobros].[dbo].[RF_INGRESOS101317] WHERE [RCI_SUBDEL] like '''+@SUBDEL+''' 
and [RCI_PERIODO]='''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),7,4))+'/'+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2))+'''
) AS INGRESO101317
,
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+''')
-(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)
) AS DIFERENCIA_VS_FAC
,(
(
SELECT sum(RC_IMP_TOT) as LGP
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD &lt; 18
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
and RC_PER between '''+(SELECT case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)+''' and '''+(SELECT @ANIO+'/'+@MES)+'''
and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
and RC_CAJA &lt; 300
)/
(SUM([emision])+(SELECT ([RC_IMP_MORA_2M_RESUL]*1000) as [RC_IMP_MORA_2M_RESUL] FROM [sirecacobros].[dbo].[RF_INGRESOS] WHERE [RC_SUBDEL]='''+@SUBDEL+''' AND [RC_PERIODO]='''+@ANIO+'/'+@MES+'''))
) AS [%COBRO]
FROM 
('
	if @SUBDEL='%'
	begin
	SET @CONSULTA12 = @CONSULTA12+ 'select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']
	union all
	select * from
	[sireca].[dbo].[EMMA33'+@SUBDEL2+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+'] '
	end
	else
	begin
	SET @CONSULTA12 = @CONSULTA12+ ' select * from [sireca].[dbo].[EMMA33'+@SUBDEL1+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,2)+SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),9,2))+']'
	end
	SET @CONSULTA12 = @CONSULTA12+') as emisiones '
END
ELSE
BEGIN
 SET @CONSULTA12 = 'SELECT '''+(SELECT UPPER(DATENAME(MONTH,(DATEADD(MONTH,0,'01/'+@MES+'/'+@ANIO)))) )+''' AS MES,'''+(SELECT SUBSTRING(CONVERT(VARCHAR(10),(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO)),103),4,7))+''' AS EMISION,'''' AS FAC_EMISION,'''' AS SALDO_2MES,'''' AS INGRESO101317,'''' AS DIFERENCIA_VS_FAC,'''' AS [%COBRO]'
END

EXEC(@CONSULTA01+' UNION ALL '+@CONSULTA02+' UNION ALL '+@CONSULTA03+' UNION ALL '+@CONSULTA04+' UNION ALL '+@CONSULTA05+' UNION ALL '+@CONSULTA06+' UNION ALL '+@CONSULTA07+' UNION ALL '+@CONSULTA08+' UNION ALL '+@CONSULTA09+' UNION ALL '+@CONSULTA10+' UNION ALL '+@CONSULTA11+' UNION ALL '+@CONSULTA12)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 88px;
        }
    </style>
</asp:Content>


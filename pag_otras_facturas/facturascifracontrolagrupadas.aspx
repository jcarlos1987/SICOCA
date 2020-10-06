<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="facturascifracontrolagrupadas.aspx.vb" Inherits="WebSIRECA.facturascifracontrolagrupadas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="SUBDEL.:"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" Width="100px">
        </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="AÑO:"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLAnio" runat="server" Width="80px">
        </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="CIFRA CONTROL:"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLCControl" runat="server" Width="100px" 
            DataSourceID="SqlDataSourceCControl" DataTextField="cifraControl" 
            DataValueField="cifraControl">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceCControl" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select '201510' as cifraControl
union all select '201507' as cifraControl
union all select '201509' as cifraControl
union all select '201512' as cifraControl
union all select '201513' as cifraControl
union all SELECT distinct (g_cifraControl) as cifraControl
FROM [sireca].[dbo].[E_CONTCIFRA]
where year([g_pagoOportuno])=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" CssClass ="btn" runat="server"><i class="icon-refresh"></i>ACTUALIZAR</asp:LinkButton>
    <asp:LinkButton ID="LBDescargar" CssClass ="btn" runat="server"><i class="icon-download"></i>DESCARGAR</asp:LinkButton>
</span> 
</div> 
</center>
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            <asp:GridView ID="GridViewRCControl" runat="server" 
        DataSourceID="SqlDataSourceRCControl" HorizontalAlign="Center" 
        AllowSorting="True" AutoGenerateColumns="False" ShowFooter="True">
    <Columns>
        <asp:BoundField DataField="RG_CIFRA_CONTROL" HeaderText="CIFRA CONTROL" 
            ReadOnly="True" SortExpression="RG_CIFRA_CONTROL">
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="RG_TIPO_FACTURA" HeaderText="TIPO FACTURA" 
            ReadOnly="True" SortExpression="RG_TIPO_FACTURA" />
        <asp:BoundField DataField="RG_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
            SortExpression="RG_PERIODO">
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="RG_REGPAT" DataFormatString="{0:N0}" 
            HeaderText="PATRONES" ReadOnly="True" SortExpression="RG_REGPAT">
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="RG_COTIZ" DataFormatString="{0:N0}" 
            HeaderText="COTIZANTES" SortExpression="RG_COTIZ">
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="RG_CREDITOS" DataFormatString="{0:N0}" 
            HeaderText="CREDITOS" SortExpression="RG_CREDITOS">
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="RG_IMPORTE" DataFormatString="{0:C}" 
            HeaderText="IMPORTE" SortExpression="RG_IMPORTE">
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
    </Columns>
                <FooterStyle Font-Bold="True" />
                <HeaderStyle CssClass="btn-info" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRCControl" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CIFRA_CONTROL as VARCHAR(15)
SET @SUBDEL=?
SET @CIFRA_CONTROL=?
--INICIO_REPORTE POR CIFRA CONTROL
SELECT RG_CIFRA_CONTROL,RG_TIPO_FACTURA,RG_PERIODO
,COUNT(DISTINCT(RG_REGPAT)) AS RG_REGPAT
,SUM(RG_COTIZ) AS RG_COTIZ
,COUNT(*) AS RG_CREDITOS
,SUM(RG_IMPORTE) AS RG_IMPORTE
FROM (
--INICIO_UNION DE TODOAS LAS CIFRAS CONTROL
SELECT RG_CIFRA_CONTROL,RG_SUBDEL,RG_TIPO_FACTURA,RG_REGPAT,RG_RAZON,RG_CREDITO,RG_PERIODO,RG_COTIZ,RG_IMPORTE,RG_IMPORTE_RECAUDADO,IMPORTE_FALTANTE,RG_FECH_ASIGNACION,RG_INSPECTOR,RG_DILIGENCIA,RG_FECH_DILIGENCIA
,TRANS_GRUPO,TRANS_FOLIO,TRANS_FOLIO_CREADO,TRANS_OBSERVACION
FROM (
SELECT [SV_CLAVE] AS RG_CIFRA_CONTROL
	  ,[SV_SUBDEL] AS RG_SUBDEL
      ,(CASE 
      WHEN [SV_TIPO] IN ('SIVEPA_EXTEM') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_EXTEMPORANEO'
      WHEN [SV_TIPO] IN ('SIVEPA_OPORT') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_OPORTUNO'
      WHEN [SV_TIPO] IN ('SIVEPA_ANUAL') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_ANUAL'
      WHEN [SV_TIPO] IN ('SIVEPA_EXTEM') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_EXTEMPORANEO'
      WHEN [SV_TIPO] IN ('SIVEPA_OPORT') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_OPORTUNO'
      WHEN [SV_TIPO] IN ('SIVEPA_ANUAL') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_ANUAL'
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
  where SV_SUBDEL LIKE @SUBDEL AND [SV_CLAVE]=@CIFRA_CONTROL
UNION ALL
  SELECT [clave] AS RG_CIFRA_CONTROL
  ,SUBDEL AS RG_SUBDEL
  ,(CASE 
  WHEN TIPOECO IN ('COP') THEN 'ECO_COP_ESTRATEGICO'
  WHEN TIPOECO IN ('COMP') THEN 'ECO_COP_COMPLEMENTO'
  WHEN TIPOECO IN ('RCV') THEN 'ECO_RCV_ESTRATEGICO'
  WHEN TIPOECO IN ('RCVCOMP') THEN 'ECO_RCV_COMPLEMENTO'
  END) AS RG_TIPO_FACTURA
      ,SUBSTRING([REG#PATRONAL],1,10) AS RG_REGPAT
      ,[NOMBRE O RAZON SOCIAL] AS RG_RAZON
      ,[CREDITO] AS RG_CREDITO
	,(case 
	when [tipoECO] in ('COP','COMP') then
	(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
	when [tipoECO] in ('RCV','RCVCOMP') then
	(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
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
  where subdel LIKE @SUBDEL AND [clave]=@CIFRA_CONTROL
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
  WHERE OFF_SUBDEL LIKE @SUBDEL AND [OFF_CIFRA_CONTROL]=@CIFRA_CONTROL
  ) AS SUBRESULTADO1
  LEFT JOIN 
  (
  SELECT
      CASE 
      WHEN [V_INC_CAPTURA] IN ('2') THEN '2'
      WHEN [V_INC_CAPTURA] IN ('9') THEN '9'
      ELSE 'PAGADO'
      END AS TRANS_GRUPO
      ,[V_FOLIO_P1] AS TRANS_FOLIO      
      ,[V_FECHA_P1_TURNADO] AS TRANS_FOLIO_CREADO
      ,[V_FOLIO_P1_OBSERVACION] AS TRANS_OBSERVACION
      
      ,V_SUBDEL AS B_SUBDEL
      ,SUBSTRING(V_REGPAT,1,10) AS B_REGPAT
      ,V_CREDITO AS B_CREDITO
      ,V_PERIODO AS B_PERIODO
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE V_SUBDEL LIKE @SUBDEL AND V_CIFRA_CONTROL=@CIFRA_CONTROL
  ) AS FOLIOS ON B_SUBDEL LIKE RG_SUBDEL
  AND B_REGPAT=RG_REGPAT
  AND B_CREDITO=RG_CREDITO
  AND B_PERIODO=RG_PERIODO
--FIN_UNION DE TODOAS LAS CIFRAS CONTROL
) AS FACTURAS
GROUP BY RG_CIFRA_CONTROL,RG_TIPO_FACTURA,RG_PERIODO
ORDER BY RG_CIFRA_CONTROL,RG_TIPO_FACTURA,RG_PERIODO
--FIN_REPORTE POR CIFRA CONTROL
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLCControl" DefaultValue="999999" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            <asp:Chart runat="server" BackColor="Transparent" Width="600px" 
        DataSourceID="SqlDataSourceRCControl" ID="Chart7">
                                                                            <Series>
                                                                                <asp:Series Name="Series1" XValueMember="RG_TIPO_FACTURA" YValueMembers="RG_CREDITOS" 
                                                                                    Legend="Legend1" ChartType="Pie" ChartArea="ChartArea1" Label="#PERCENT" 
                                                                                    CustomProperties="PieDrawingStyle=SoftEdge">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea BackColor="Transparent" Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Legends>
                                                                                <asp:Legend Name="Legend1" Alignment="Center" TextWrapThreshold="50">
                                                                                    <CellColumns>
                                                                                        <asp:LegendCellColumn Name="Column2" ColumnType="SeriesSymbol">
                                                                                            <Margins Left="15" Right="15">
                                                                                            </Margins>
                                                                                        </asp:LegendCellColumn>
                                                                                        <asp:LegendCellColumn Name="Column1" 
                                                                                            Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX" Alignment="MiddleLeft">
                                                                                            <Margins Left="15" Right="15">
                                                                                            </Margins>
                                                                                        </asp:LegendCellColumn>
                                                                                    </CellColumns>
                                                                                </asp:Legend>
                                                                            </Legends>
                                                                            <Titles>
                                                                                <asp:Title Name="Title1">
                                                                                </asp:Title>
                                                                            </Titles>
                                                                            <BorderSkin BackColor="Transparent">
                                                                            </BorderSkin>
                                                                        </asp:Chart>
            </td>
        </tr>
        <tr>
            <td>
                <center>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="FACTURA:"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLTipoFactura" runat="server" 
            DataSourceID="SqlDataSourceTipoFactura" DataTextField="factura" 
            DataValueField="factura" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceTipoFactura" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CIFRA_CONTROL as VARCHAR(15)
SET @SUBDEL=?
SET @CIFRA_CONTROL=?
--INICIO_REPORTE POR CIFRA CONTROL
SELECT RG_TIPO_FACTURA as factura
FROM (
--INICIO_UNION DE TODOAS LAS CIFRAS CONTROL
SELECT RG_CIFRA_CONTROL,RG_SUBDEL,RG_TIPO_FACTURA,RG_REGPAT,RG_RAZON,RG_CREDITO,RG_PERIODO,RG_COTIZ,RG_IMPORTE,RG_IMPORTE_RECAUDADO,IMPORTE_FALTANTE,RG_FECH_ASIGNACION
,RG_INSPECTOR
,RG_DILIGENCIA
,RG_FECH_DILIGENCIA
,TRANS_GRUPO,TRANS_FOLIO,TRANS_FOLIO_CREADO,TRANS_OBSERVACION
FROM (
SELECT [SV_CLAVE] AS RG_CIFRA_CONTROL
	  ,[SV_SUBDEL] AS RG_SUBDEL
      ,(CASE 
      WHEN [SV_TIPO] IN ('SIVEPA_EXTEM') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_EXTEMPORANEO'
      WHEN [SV_TIPO] IN ('SIVEPA_OPORT') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_OPORTUNO'
      WHEN [SV_TIPO] IN ('SIVEPA_ANUAL') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_ANUAL'
      WHEN [SV_TIPO] IN ('SIVEPA_EXTEM') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_EXTEMPORANEO'
      WHEN [SV_TIPO] IN ('SIVEPA_OPORT') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_OPORTUNO'
      WHEN [SV_TIPO] IN ('SIVEPA_ANUAL') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_ANUAL'
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
  where SV_SUBDEL LIKE @SUBDEL AND [SV_CLAVE]=@CIFRA_CONTROL
UNION ALL
  SELECT [clave] AS RG_CIFRA_CONTROL
  ,SUBDEL AS RG_SUBDEL
  ,(CASE 
  WHEN TIPOECO IN ('COP') THEN 'ECO_COP_ESTRATEGICO'
  WHEN TIPOECO IN ('COMP') THEN 'ECO_COP_COMPLEMENTO'
  WHEN TIPOECO IN ('RCV') THEN 'ECO_RCV_ESTRATEGICO'
  WHEN TIPOECO IN ('RCVCOMP') THEN 'ECO_RCV_COMPLEMENTO'
  END) AS RG_TIPO_FACTURA
      ,SUBSTRING([REG#PATRONAL],1,10) AS RG_REGPAT
      ,[NOMBRE O RAZON SOCIAL] AS RG_RAZON
      ,[CREDITO] AS RG_CREDITO
	,(case 
	when [tipoECO] in ('COP','COMP') then
	(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
	when [tipoECO] in ('RCV','RCVCOMP') then
	(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
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
  where subdel LIKE @SUBDEL AND [clave]=@CIFRA_CONTROL
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
  WHERE OFF_SUBDEL LIKE @SUBDEL AND [OFF_CIFRA_CONTROL]=@CIFRA_CONTROL
  ) AS SUBRESULTADO1
  LEFT JOIN 
  (
  SELECT
      CASE 
      WHEN [V_INC_CAPTURA] IN ('2') THEN '2'
      WHEN [V_INC_CAPTURA] IN ('9') THEN '9'
      ELSE 'PAGADO'
      END AS TRANS_GRUPO
      ,[V_FOLIO_P1] AS TRANS_FOLIO      
      ,[V_FECHA_P1_TURNADO] AS TRANS_FOLIO_CREADO
      ,[V_FOLIO_P1_OBSERVACION] AS TRANS_OBSERVACION
      
      ,V_SUBDEL AS B_SUBDEL
      ,SUBSTRING(V_REGPAT,1,10) AS B_REGPAT
      ,V_CREDITO AS B_CREDITO
      ,V_PERIODO AS B_PERIODO
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE V_SUBDEL LIKE @SUBDEL AND V_CIFRA_CONTROL=@CIFRA_CONTROL
  ) AS FOLIOS ON B_SUBDEL LIKE RG_SUBDEL
  AND B_REGPAT=RG_REGPAT
  AND B_CREDITO=RG_CREDITO
  AND B_PERIODO=RG_PERIODO
--FIN_UNION DE TODOAS LAS CIFRAS CONTROL
) AS FACTURAS
GROUP BY RG_TIPO_FACTURA
ORDER BY RG_TIPO_FACTURA
--FIN_REPORTE POR CIFRA CONTROL
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLCControl" DefaultValue="99999" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
<span class="add-on">
    <asp:LinkButton ID="LBActInc" CssClass ="btn" runat="server"><i class="icon-refresh"></i>ACTUALIZAR</asp:LinkButton>
</span> 
</div> 
</center>
 <asp:GridView ID="GridViewCCInc" runat="server" HorizontalAlign="Center" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceCCInc" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="RG_CIFRA_CONTROL" HeaderText="CIFRA CONTROL" 
                ReadOnly="True" SortExpression="RG_CIFRA_CONTROL" />
            <asp:BoundField DataField="RG_DILIGENCIA" HeaderText="DILIGENCIA" 
                ReadOnly="True" SortExpression="RG_DILIGENCIA" />
            <asp:BoundField DataField="RG_REGPAT" DataFormatString="{0:N0}" 
                HeaderText="PATRONES" SortExpression="RG_REGPAT">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="RG_COTIZ" DataFormatString="{0:N0}" 
                HeaderText="COTIZANTES" SortExpression="RG_COTIZ">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="RG_CREDITOS">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("RG_CREDITOS", "{0:N0}") %>' NavigateUrl='<%# "~/pag_otras_facturas/detallesseleccion.aspx?subdel=" & Eval("RG_SUBDEL") & "&cifracontrol=" & Eval("RG_CIFRA_CONTROL") & "&tipocifra=" & Eval("RG_TIPO_CIFRA") & "&diligencia=" & Eval("RG_DILIGENCIA_CVL") & ""%>' Target="_blank"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="RG_IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" SortExpression="RG_IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle Font-Bold="True" />
        <HeaderStyle CssClass="btn-info" ForeColor="White" />
    </asp:GridView>
 <asp:SqlDataSource ID="SqlDataSourceCCInc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CIFRA_CONTROL as VARCHAR(15)
DECLARE @TIPO_CIFRA as VARCHAR(50)
SET @SUBDEL=?
SET @CIFRA_CONTROL=?
SET @TIPO_CIFRA=?

--INICIO_REPORTE POR CIFRA CONTROL
SELECT 
@SUBDEL as RG_SUBDEL
,RG_CIFRA_CONTROL
,@TIPO_CIFRA as RG_TIPO_CIFRA
,ISNULL(RG_DILIGENCIA,'67') AS RG_DILIGENCIA_CVL
,(SELECT [ACTIVIDAD]
FROM [sireca].[dbo].[catalogo]
WHERE [CVE DILIG#]=ISNULL(RG_DILIGENCIA,'67')) AS RG_DILIGENCIA
,COUNT(DISTINCT(RG_REGPAT)) AS RG_REGPAT
,SUM(RG_COTIZ) AS RG_COTIZ
,COUNT(*) AS RG_CREDITOS
,SUM(RG_IMPORTE) AS RG_IMPORTE
FROM (
--INICIO_UNION DE TODOAS LAS CIFRAS CONTROL
SELECT RG_CIFRA_CONTROL,RG_SUBDEL,RG_TIPO_FACTURA,RG_REGPAT,RG_RAZON,RG_CREDITO,RG_PERIODO,RG_COTIZ,RG_IMPORTE,RG_IMPORTE_RECAUDADO,IMPORTE_FALTANTE,RG_FECH_ASIGNACION,RG_INSPECTOR,RG_DILIGENCIA,RG_FECH_DILIGENCIA
,TRANS_GRUPO,TRANS_FOLIO,TRANS_FOLIO_CREADO,TRANS_OBSERVACION
FROM (
SELECT [SV_CLAVE] AS RG_CIFRA_CONTROL
	  ,[SV_SUBDEL] AS RG_SUBDEL
      ,(CASE 
      WHEN [SV_TIPO] IN ('SIVEPA_EXTEM') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_EXTEMPORANEO'
      WHEN [SV_TIPO] IN ('SIVEPA_OPORT') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_OPORTUNO'
      WHEN [SV_TIPO] IN ('SIVEPA_ANUAL') AND SV_SIVEPA IN ('SIVEPA-IMSS') THEN 'SIVEPA_COP_ANUAL'
      WHEN [SV_TIPO] IN ('SIVEPA_EXTEM') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_EXTEMPORANEO'
      WHEN [SV_TIPO] IN ('SIVEPA_OPORT') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_OPORTUNO'
      WHEN [SV_TIPO] IN ('SIVEPA_ANUAL') AND SV_SIVEPA IN ('SIVEPA-RCV') THEN 'SIVEPA_RCV_ANUAL'
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
  where SV_SUBDEL LIKE @SUBDEL AND [SV_CLAVE]=@CIFRA_CONTROL
UNION ALL
  SELECT [clave] AS RG_CIFRA_CONTROL
  ,SUBDEL AS RG_SUBDEL
  ,(CASE 
  WHEN TIPOECO IN ('COP') THEN 'ECO_COP_ESTRATEGICO'
  WHEN TIPOECO IN ('COMP') THEN 'ECO_COP_COMPLEMENTO'
  WHEN TIPOECO IN ('RCV') THEN 'ECO_RCV_ESTRATEGICO'
  WHEN TIPOECO IN ('RCVCOMP') THEN 'ECO_RCV_COMPLEMENTO'
  END) AS RG_TIPO_FACTURA
      ,SUBSTRING([REG#PATRONAL],1,10) AS RG_REGPAT
      ,[NOMBRE O RAZON SOCIAL] AS RG_RAZON
      ,[CREDITO] AS RG_CREDITO
	,(case 
	when [tipoECO] in ('COP','COMP') then
	(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
	when [tipoECO] in ('RCV','RCVCOMP') then
	(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
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
  where subdel LIKE @SUBDEL AND [clave]=@CIFRA_CONTROL
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
  WHERE OFF_SUBDEL LIKE @SUBDEL AND [OFF_CIFRA_CONTROL]=@CIFRA_CONTROL
  ) AS SUBRESULTADO1
  LEFT JOIN 
  (
  SELECT
      CASE 
      WHEN [V_INC_CAPTURA] IN ('2') THEN '2'
      WHEN [V_INC_CAPTURA] IN ('9') THEN '9'
      ELSE 'PAGADO'
      END AS TRANS_GRUPO
      ,[V_FOLIO_P1] AS TRANS_FOLIO      
      ,[V_FECHA_P1_TURNADO] AS TRANS_FOLIO_CREADO
      ,[V_FOLIO_P1_OBSERVACION] AS TRANS_OBSERVACION
      
      ,V_SUBDEL AS B_SUBDEL
      ,SUBSTRING(V_REGPAT,1,10) AS B_REGPAT
      ,V_CREDITO AS B_CREDITO
      ,V_PERIODO AS B_PERIODO
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE V_SUBDEL LIKE @SUBDEL AND V_CIFRA_CONTROL=@CIFRA_CONTROL
  ) AS FOLIOS ON B_SUBDEL LIKE RG_SUBDEL
  AND B_REGPAT=RG_REGPAT
  AND B_CREDITO=RG_CREDITO
  AND B_PERIODO=RG_PERIODO
--FIN_UNION DE TODOAS LAS CIFRAS CONTROL
) AS FACTURAS
WHERE RG_TIPO_FACTURA like @TIPO_CIFRA
GROUP BY RG_CIFRA_CONTROL,RG_DILIGENCIA
ORDER BY RG_CIFRA_CONTROL,RG_DILIGENCIA
--FIN_REPORTE POR CIFRA CONTROL
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLCControl" DefaultValue="999999" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLTipoFactura" DefaultValue="%" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            <asp:Chart runat="server" BackColor="Transparent" Width="600px" 
        DataSourceID="SqlDataSourceCCInc" ID="Chart8">
                                                                            <Series>
                                                                                <asp:Series Name="Series1" XValueMember="RG_DILIGENCIA" YValueMembers="RG_CREDITOS" 
                                                                                    Legend="Legend1" ChartType="Pie" ChartArea="ChartArea1" Label="#PERCENT" 
                                                                                    CustomProperties="PieDrawingStyle=SoftEdge">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea BackColor="Transparent" Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Legends>
                                                                                <asp:Legend Name="Legend1" Alignment="Center" TextWrapThreshold="50">
                                                                                    <CellColumns>
                                                                                        <asp:LegendCellColumn Name="Column2" ColumnType="SeriesSymbol">
                                                                                            <Margins Left="15" Right="15">
                                                                                            </Margins>
                                                                                        </asp:LegendCellColumn>
                                                                                        <asp:LegendCellColumn Name="Column1" 
                                                                                            Text="#LEGENDTEXT,  #VAL de #TOTAL PATRONES #VALX" Alignment="MiddleLeft">
                                                                                            <Margins Left="15" Right="15">
                                                                                            </Margins>
                                                                                        </asp:LegendCellColumn>
                                                                                    </CellColumns>
                                                                                </asp:Legend>
                                                                            </Legends>
                                                                            <Titles>
                                                                                <asp:Title Name="Title1">
                                                                                </asp:Title>
                                                                            </Titles>
                                                                            <BorderSkin BackColor="Transparent">
                                                                            </BorderSkin>
                                                                        </asp:Chart>
            </td>
        </tr>
    </table>

</asp:Content>

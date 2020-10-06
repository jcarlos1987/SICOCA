<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="canceladasimpresas.aspx.vb" Inherits="WebSIRECA.canceladasimpresas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="120px" >
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="PERIODO:"></asp:Label>
</span>
<asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px" >
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
    <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="80px">
    </asp:DropDownList>
</div>
</center>
    <table style="width: 100%;">
        <tr>
            <td colspan="3" align="center">
                <strong>REPORTE DE CANCELACIONES DE CITATORIOS Y ACTAS DE NOTIFICACION</strong>
            </td>
        </tr>
        <tr>
            <td align="right">
            <asp:GridView ID="GridViewCit" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSourceCit" ShowFooter="True" 
                    Caption="&lt;strong&gt;CITATORIOS&lt;/strong&gt;">
                <Columns>
                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                        SortExpression="SUBDEL" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TIPO_FACTURA" HeaderText="FACTURA" ReadOnly="True" 
                        SortExpression="TIPO_FACTURA" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PERIODO_BIMESTRE" HeaderText="PERIODO/BIMESTRE" 
                        ReadOnly="True" SortExpression="PERIODO_BIMESTRE" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TIPO_DOC" HeaderText="DOCUMENTO" ReadOnly="True" 
                        SortExpression="TIPO_DOC" />
                    <asp:BoundField DataField="ACCION" HeaderText="ACCION" ReadOnly="True" 
                        SortExpression="ACCION" />
                    <asp:TemplateField HeaderText="CASOS" SortExpression="CASOS">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("CASOS", "{0:N0}") %>' 
                            NavigateUrl='<%# "~/informesPDF/canceladasimpresasdetalles.aspx?subdel=" & Eval("SUBDEL") & "&mes=" & Eval("V_MES") & "&anio=" & Eval("V_ANIO") & "&tipodoc=" & Eval("V_TIPO") & "&tipofactura=" & Eval("TIPO_FACTURA") & "&accion=" & Eval("ACCION") %>' Target="_blank"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                </Columns>
    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceCit" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                    SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @MES AS VARCHAR(2)
DECLARE @MES2 AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @TIPO_DOC AS VARCHAR(4)
SET @SUBDEL=?
SET @MES=?
SET @ANIO=?
SET @TIPO_DOC='1'
SET @MES2=CASE WHEN LEN(@MES/CAST(2 AS FLOAT))=1 THEN '0'+CAST((@MES/2) AS VARCHAR(2)) ELSE '0' END

SELECT @MES as V_MES
,@ANIO as V_ANIO
,@TIPO_DOC as V_TIPO
,IM_SUBDEL AS SUBDEL
,IM_TIPO_COP_RCV AS TIPO_FACTURA
,IM_PERIODO as PERIODO_BIMESTRE
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
,COUNT(*) AS CASOS

FROM (
-----RESULTADO
SELECT IM_SUBDEL,IM_TIPO_COP_RCV,IM_REGPAT,IM_PERIODO,IM_TIPO_DOC,IM_FECHA_ASIGNACION,IM_INSPECTOR,EC_TIPO_DOC
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
,CASE WHEN SUBSTRING([IM_TIPO_IMPRESION],1,10)='Acta de No' THEN '2'
ELSE '1'
END
AS IM_TIPO_DOC
,[IM_FECHA_ASIGNACION]
,[IM_INSPECTOR]
FROM [sirecaemisiones].[dbo].[hist_impresion]
WHERE [IM_SUBDEL]=@SUBDEL
) AS RESULT
WHERE ((IM_TIPO_COP_RCV='COP' AND IM_PERIODO=@MES+'/'+@ANIO) OR 
(IM_TIPO_COP_RCV='RCV' AND IM_PERIODO=@MES2+'/'+@ANIO))
GROUP BY [IM_SUBDEL]
,IM_TIPO_COP_RCV
,[IM_REGPAT]
,[IM_PERIODO]
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
	else eco.incidencia
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
	else eco.incidencia
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
where IM_TIPO_DOC=@TIPO_DOC
GROUP BY IM_SUBDEL,IM_TIPO_COP_RCV,IM_PERIODO,IM_TIPO_DOC,EC_TIPO_DOC
ORDER BY 2,5
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
            <td align="left">
            <asp:GridView ID="GridViewNot" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSourceNot" ShowFooter="True" 
                    Caption="&lt;strong&gt;ACTAS DE NOTIFICACION&lt;/strong&gt;">
                <Columns>
                    <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                        SortExpression="SUBDEL" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TIPO_FACTURA" HeaderText="FACTURA" ReadOnly="True" 
                        SortExpression="TIPO_FACTURA" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PERIODO_BIMESTRE" HeaderText="PERIODO/BIMESTRE" 
                        ReadOnly="True" SortExpression="PERIODO_BIMESTRE" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TIPO_DOC" HeaderText="DOCUMENTO" ReadOnly="True" 
                        SortExpression="TIPO_DOC" />
                    <asp:BoundField DataField="ACCION" HeaderText="ACCION" ReadOnly="True" 
                        SortExpression="ACCION" />
                    <asp:TemplateField HeaderText="CASOS" SortExpression="CASOS">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("CASOS", "{0:N0}") %>' 
                            NavigateUrl='<%# "~/informesPDF/canceladasimpresasdetalles.aspx?subdel=" & Eval("SUBDEL") & "&mes=" & Eval("V_MES") & "&anio=" & Eval("V_ANIO") & "&tipodoc=" & Eval("V_TIPO")  & "&tipofactura=" & Eval("TIPO_FACTURA") & "&accion=" & Eval("ACCION") %>' Target="_blank"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                </Columns>
    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceNot" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @MES AS VARCHAR(2)
DECLARE @MES2 AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @TIPO_DOC AS VARCHAR(4)
SET @SUBDEL=?
SET @MES=?
SET @ANIO=?
SET @TIPO_DOC='2'
SET @MES2=CASE WHEN LEN(@MES/CAST(2 AS FLOAT))=1 THEN '0'+CAST((@MES/2) AS VARCHAR(2)) ELSE '0' END

SELECT @MES as V_MES
,@ANIO as V_ANIO
,@TIPO_DOC as V_TIPO
,IM_SUBDEL AS SUBDEL
,IM_TIPO_COP_RCV AS TIPO_FACTURA
,IM_PERIODO as PERIODO_BIMESTRE
,(CASE 
WHEN IM_TIPO_DOC='1' THEN 'CITATORIO'
WHEN IM_TIPO_DOC='2' THEN 'ACTA DE NOTIFICACION'
WHEN IM_TIPO_DOC IS NULL THEN 'PENDIENTES'
ELSE IM_TIPO_DOC
END) AS TIPO_DOC
,(CASE 
WHEN EC_TIPO_DOC='1' THEN 'CITATORIO'
WHEN EC_TIPO_DOC='2' THEN 'NOTIFICADO'
WHEN EC_TIPO_DOC IS NULL THEN 'PENDIENTE'
ELSE EC_TIPO_DOC
END) AS ACCION
,COUNT(*) AS CASOS

FROM (
-----RESULTADO
SELECT IM_SUBDEL,IM_TIPO_COP_RCV,IM_REGPAT,IM_PERIODO,IM_TIPO_DOC,IM_FECHA_ASIGNACION,IM_INSPECTOR,EC_TIPO_DOC
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
,CASE WHEN SUBSTRING([IM_TIPO_IMPRESION],1,10)='Acta de No' THEN '2'
ELSE '1'
END
AS IM_TIPO_DOC
,[IM_FECHA_ASIGNACION]
,[IM_INSPECTOR]
FROM [sirecaemisiones].[dbo].[hist_impresion]
WHERE [IM_SUBDEL]=@SUBDEL
) AS RESULT
WHERE ((IM_TIPO_COP_RCV='COP' AND IM_PERIODO=@MES+'/'+@ANIO) OR 
(IM_TIPO_COP_RCV='RCV' AND IM_PERIODO=@MES2+'/'+@ANIO))
GROUP BY [IM_SUBDEL]
,IM_TIPO_COP_RCV
,[IM_REGPAT]
,[IM_PERIODO]
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
	else eco.incidencia
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
	else eco.incidencia
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
where IM_TIPO_DOC=@TIPO_DOC
GROUP BY IM_SUBDEL,IM_TIPO_COP_RCV,IM_PERIODO,IM_TIPO_DOC,EC_TIPO_DOC
ORDER BY 2,5
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Content>

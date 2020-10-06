<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesimpresiones.aspx.vb" Inherits="WebSIRECA.detallesimpresiones" %>

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
                <asp:BoundField DataField="SUBDELEGACION" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDELEGACION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="FECH_ASIGNO" DataFormatString="{0:d}" 
                    HeaderText="FECHA ASIGNACION" ReadOnly="True" SortExpression="FECH_ASIGNO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_FECH_NOTI" DataFormatString="{0:d}" 
                    HeaderText="RALE FECHA DE NOT." ReadOnly="True" SortExpression="RALE_FECH_NOTI">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_INC" HeaderText="RALE INC." ReadOnly="True" 
                    SortExpression="RALE_INC">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="RALE IMPORTE" ReadOnly="True" SortExpression="RALE_IMPORTE">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_DIAS" DataFormatString="{0:N0}" 
                    HeaderText="RALE DIAS" ReadOnly="True" SortExpression="RALE_DIAS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_SECTOR" HeaderText="RALE SECTOR" 
                    ReadOnly="True" SortExpression="RALE_SECTOR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @INSPECTOR AS VARCHAR(10)
DECLARE @TIPO_DOC AS VARCHAR(50)
DECLARE @ADD_WHERE AS VARCHAR(100)
DECLARE @ACCION AS VARCHAR(100)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @FECH_INI AS DATETIME
DECLARE @FECH_FIN AS DATETIME
SET @SUBDEL=?
SET @INSPECTOR=?
SET @ACCION=?
SET @FECH_INI=convert(datetime,?+' 00:00:00')
SET @FECH_FIN=convert(datetime,?+' 23:00:00')
SET @TIPO_DOC=substring(?,1,10)

SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @ADD_WHERE=' and IM_INSPECTOR='''+@INSPECTOR+''''
IF @INSPECTOR='%'
BEGIN
	SET @ADD_WHERE=''
END
exec('
SELECT
SUBDELEGACION,ACCIONES,GENERADOS,REGPAT,RAZON_SOCIAL,CREDITO,PERIODO,INSPECTOR,FECH_ASIGNO
,FNOTIFICACION AS RALE_FECH_NOTI
,INC AS RALE_INC
,IMPORTE AS RALE_IMPORTE
,DIAS AS RALE_DIAS
,SECTOR as RALE_SECTOR
FROM (
SELECT 
IM_SUBDEL AS SUBDELEGACION
,E_ACCIONES AS ACCIONES
,IM_TIPO_IMPRESION AS GENERADOS
,IM_REGPAT AS REGPAT
,IM_RAZON_SOCIAL AS RAZON_SOCIAL
,IM_CREDITO AS CREDITO
,IM_PERIODO AS PERIODO
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=IM_INSPECTOR) AS INSPECTOR
,[IM_FECHA_ASIGNACION] AS FECH_ASIGNO
FROM (
		SELECT DISTINCT 
		E_INC_01
		,[IM_FECHA_ASIGNACION]
		,CASE 
		WHEN E_INC_01 IS NULL THEN ''NO_REPORTADOS''
		ELSE ''SI_REPORTADOS''
		END AS E_ACCIONES
		,[IM_SUBDEL]
		,[IM_REGPAT],[IM_RAZON_SOCIAL],[IM_CREDITO],[IM_PERIODO],[IM_TIPO_IMPRESION],[IM_INSPECTOR]
		  FROM 
		  [sirecaemisiones].[dbo].[hist_impresion]
		  left join
		  (
		  SELECT substring(reg#patronal,1,10) as E_REGPAT
		,credito as E_CREDITO
		,(case 
		when [tipoECO] in (''COP'',''COMP'') then
		(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
		when [tipoECO] in (''RCV'',''RCVCOMP'') then
		(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
		end
		) as E_PERIODO
		,(case when eco.incidencia in (''1'') then eco.incidencia else 
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''1'' and hinc.ideco=eco.id and hinc.subdel=eco.subdel
			order by hinc.id desc
		) end 
		) as E_INC_01
		,(case when eco.incidencia in (''2'') then eco.incidencia else 
		(
			SELECT top 1 hinc.incidencia
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id and hinc.subdel=eco.subdel
			order by hinc.id desc
		) end 
		) as E_INC_02
		FROM [sireca].[dbo].[eco] as eco
		where tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
		and eco.subdel='''+@SUBDEL+'''
		  ) AS ECO
		   on IM_REGPAT=E_REGPAT 
		   --AND IM_CREDITO=E_CREDITO
		   AND IM_PERIODO=E_PERIODO
		WHERE [IM_FECHA_ASIGNACION] BETWEEN '''+@FECH_INI+''' AND '''+@FECH_FIN+'''
		and substring([IM_TIPO_IMPRESION],1,10) = '''+@TIPO_DOC+'''
		'+@ADD_WHERE+'
) AS R
WHERE IM_SUBDEL='''+@SUBDEL+'''
AND E_ACCIONES='''+@ACCION+'''
) AS imp
LEFT JOIN 
(
select ''COP'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT
,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO,SECTOR,FNOTIFICACION,INC,DIAS,IMPORTE from rale.dbo.['+@RALECOP+']
union all
select ''RCV'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT
,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO,SECTOR,FNOTIFICACION,INC,DIAS,IMPORTE from rale.dbo.['+@RALERCV+']
) as rale 
ON RALE_REGPAT=imp.REGPAT AND RALE_CREDITO=imp.CREDITO AND RALE_PERIODO=imp.PERIODO
order by generados,regpat,periodo,credito
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="99999" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="abcd" Name="?" 
                    QueryStringField="accion" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_ini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="abcd" Name="?" 
                    QueryStringField="tipo_doc" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

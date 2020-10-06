<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="entregaretrasonotificadodetalles.aspx.vb" Inherits="WebSIRECA.entregaretrasonotificadodetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="9pt" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="FECH_NOT" HeaderText="FECH_NOT" ReadOnly="True" 
                    SortExpression="FECH_NOT" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="EMISION" HeaderText="EMISION" ReadOnly="True" 
                    SortExpression="EMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PAGO" HeaderText="PAGO" ReadOnly="True" 
                    SortExpression="PAGO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_PAGO" HeaderText="FECHA_PAGO" ReadOnly="True" 
                    SortExpression="FECHA_PAGO" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" ReadOnly="True" 
                    SortExpression="INC_RALE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TD_RALE" HeaderText="TD_RALE" ReadOnly="True"
                    SortExpression="TD_RALE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_ECO as VARCHAR(50)
DECLARE @TIPO_NOT as VARCHAR(20)
DECLARE @CONSULTA as VARCHAR(6000)
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @TIPO_NOT=?
SET @CONSULTA = '
SELECT 
'''+(case when @SUBDEL='%' then 'YUCATAN' else @SUBDEL end)+''' as SUBDEL
,TIPO_NOT,TIPO_ECO,NOT_OPORTUNA,FECH_NOT,REGPAT,RAZON,CREDITO,PERIODO,EMISION,PAGO,FECHA_PAGO,INCIDENCIA,INC_RALE,TD_RALE,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf WHERE uf.id=INSPECTOR) as INSPECTOR '

SET @CONSULTA = @CONSULTA + ' FROM
(
SELECT 
(
	case 
		when (NOT_OPORTUNA IS NOT NULL AND FECH_NOT IS NOT NULL) then ''OPORTUNO''
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NOT NULL) then ''POSTERIOR''
		when (NOT_OPORTUNA IS NULL AND FECH_NOT IS NULL AND (INCIDENCIA is null or INCIDENCIA IN (''0'',''1''))) then ''PENDIENTES''
		else ''SIN_NOTIFICAR''
	end
) as TIPO_NOT
,*
FROM 
	(
	SELECT 
	eco.subdel as SUBDEL
	,eco.tipoeco as TIPO_ECO
	,(
		case when (
		SELECT TOP 1 [g_tipoProceso]
		FROM [sireca].[dbo].[E_CONTCIFRA]
		where [g_tipoProceso]=(case when eco.tipoeco in (''COP'',''RCV'') then ''COP'' when eco.tipoeco in (''COMP'',''RCVCOMP'') then ''COMP'' end )
		and ( 
		 
		(convert(varchar(2),
			case 
			when tipoeco in (''COP'',''COMP'') then
				month([g_perioEmiMensual])
			else
				month([g_perioEmiBimestral])*2
			end
		)+convert(varchar(4),
		case 
			when tipoeco in (''COP'',''COMP'') then
				year([g_perioEmiMensual])
			else
				year([g_perioEmiBimestral])
			end
		))
		=convert(varchar(6),eco.fechaeco) 
		)
		and (
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by ideco desc) between [g_perNotInicio] and g_perNotTerminoDesf
		) is NULL then NULL else ''SI'' end
	) as NOT_OPORTUNA
	,(
	case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
		(
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by ideco desc
		) end 
	) as FECH_NOT
	,eco.reg#patronal as REGPAT
	,eco.[NOMBRE O RAZON SOCIAL] as RAZON
	,eco.credito as CREDITO
	,(case 
when [tipoECO] in (''COP'',''COMP'') then
(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in (''RCV'',''RCVCOMP'') then
(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
	,eco.responsable as INSPECTOR
	,eco.pago as PAGO
	,eco.fech_pago as FECHA_PAGO
	,eco.incidencia as INCIDENCIA
	,eco.omision as EMISION
	,eco.incidenciarale as INC_RALE
	,eco.tdrale as TD_RALE
	FROM [sireca].[dbo].eco as eco '
	if @TIPO_ECO='%'
	begin
	 SET @CONSULTA = @CONSULTA + ' where eco.tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') '
	end
	else
	begin
	 SET @CONSULTA = @CONSULTA + ' where eco.tipoeco in ('''+@TIPO_ECO+''') '
	end
	if @MES='00'
	begin
		SET @CONSULTA = @CONSULTA + ' and convert(varchar(6),eco.fechaeco) like (''%'+@ANIO+''') '
	end
	else
	begin
		SET @CONSULTA = @CONSULTA + ' and eco.fechaeco in ('''+@MES+@ANIO+''') '
	end
	SET @CONSULTA = @CONSULTA + ' and eco.subdel like '''+@SUBDEL+'''
	) as resultado
) as resultado2
WHERE TIPO_NOT='''+@TIPO_NOT+'''
'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="cop" Name="?" 
                    QueryStringField="tipoeco" />
                <asp:QueryStringParameter DefaultValue="OPORTUNO" Name="?" 
                    QueryStringField="tiponot" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

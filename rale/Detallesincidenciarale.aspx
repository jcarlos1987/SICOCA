<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Detallesincidenciarale.aspx.vb" Inherits="WebSIRECA.Detallesincidenciarale" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
<asp:LinkButton ID="LinkButton2" runat="server" BackColor="#F2B63B" 
            Font-Bold="True" Font-Underline="False">&nbsp;&nbsp;Exportar a EXCEL&nbsp;&nbsp;</asp:LinkButton>
        </asp:Panel>
        <asp:GridView ID="GridViewDetalles" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceDetalles" HorizontalAlign="Center" 
            AllowSorting="True" Font-Size="10pt">
            <Columns>
                <asp:TemplateField HeaderText="REGPAT" SortExpression="REGPAT">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("REGPAT", "../observacionPatronal/Default.aspx?regpat={0}&razon=razon") %>' 
                            Text='<%# Eval("REGPAT") %>' Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MOVIMIENTO" HeaderText="MOVIMIENTO" ReadOnly="True" 
                    SortExpression="MOVIMIENTO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FMOV" HeaderText="FEC_MOV" ReadOnly="True" 
                    SortExpression="FMOV" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="SECTOR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="TIPO_DOC" HeaderText="TIPO_DOC" ReadOnly="True" 
                    SortExpression="TIPO_DOC" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FEC_ALTA" HeaderText="FEC_ALTA" ReadOnly="True" 
                    SortExpression="FEC_ALTA" />
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FEC_INC" HeaderText="FEC_INC" ReadOnly="True" 
                    SortExpression="FEC_INC" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
                    SortExpression="DIAS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("REGPAT", "../pag_asps/asignardeudameses.aspx?regpat={0}") %>' 
                            Text="Asignar" Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_SIRECA" HeaderText="INC_SIRECA" 
                    SortExpression="INC_SIRECA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_NOTIFICACION" DataFormatString="{0:d}" 
                    HeaderText="FECHA_NOTIFICACION" SortExpression="FECHA_NOTIFICACION" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CEDULA_INC" HeaderText="CEDULA_INC" 
                    SortExpression="CEDULA_INC" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CEDULA_FOLIO" HeaderText="CEDULA_FOLIO" 
                    SortExpression="CEDULA_FOLIO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_FOLIO" DataFormatString="{0:d}" 
                    HeaderText="FECHA_FOLIO" SortExpression="FECHA_FOLIO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_TRANSCURRIDOS" DataFormatString="{0:N0}" 
                    HeaderText="DIAS TRANS." SortExpression="DIAS_TRANSCURRIDOS">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDetalles" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA as VARCHAR(5000)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALERCV01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @RALERCV33 as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(3)
DECLARE @ANIO as VARCHAR(4)
DECLARE @ANIO2 as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @INCIDENCIA as VARCHAR(3)
DECLARE @LOS20MAYORES as VARCHAR(10)
DECLARE @EXISTE_MDB as INT
DECLARE @FILE_MDB as VARCHAR(50)
SET @ANIO=convert(varchar(4),year(dateadd(month,-1,getdate())))
SET @MES=(case when len(month(dateadd(month,-1,getdate())))=1 then '0'+convert(varchar(2),month(dateadd(month,-1,getdate()))) else convert(varchar(2),month(dateadd(month,-1,getdate()))) end)
SET @ANIO2=substring(@ANIO,3,2)

/*SET @FILE_MDB = 'D:\CDDATA\'+@MES+@ANIO2+'\EMIS3301.mdb'
exec master.dbo.xp_fileexist @FILE_MDB,@EXISTE_MDB out
if @EXISTE_MDB='0'
begin
SET @ANIO=convert(varchar(4),year(dateadd(month,-2,getdate())))
SET @MES=(case when len(month(dateadd(month,-2,getdate())))=1 then '0'+convert(varchar(2),month(dateadd(month,-2,getdate()))) else convert(varchar(2),month(dateadd(month,-2,getdate()))) end)
SET @ANIO2=substring(@ANIO,3,2)
end*/
if not exists(select * from tempdb.dbo.sysobjects where name = ('sireca.dbo.EMMA3301'+@MES+@ANIO2))
begin
SET @ANIO=convert(varchar(4),year(dateadd(month,-2,getdate())))
SET @MES=(case when len(month(dateadd(month,-2,getdate())))=1 then '0'+convert(varchar(2),month(dateadd(month,-2,getdate()))) else convert(varchar(2),month(dateadd(month,-2,getdate()))) end)
SET @ANIO2=substring(@ANIO,3,2)
end 

SET @SUBDEL=?
SET @TIPO=?
SET @INCIDENCIA=?
SET @LOS20MAYORES=?

SET @INCIDENCIA = (case when len(@INCIDENCIA)=1 then '0'+@INCIDENCIA else @INCIDENCIA end)
SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALERCV01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='RCV' order by fecha desc)

SET @CONSULTA = '
DECLARE @IMPORTE_RALE as FLOAT 
DECLARE @PERIODO_PROPUESTA_EMITIDA as VARCHAR(15)
SELECT i.*
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=e.responsable and uf.subdel=i.SUBDEL) as INSPECTOR
,(e.incidencia) as INC_SIRECA
,e.validacion as VALIDACION
,(case 
when FNOTIFICACION is not null then FNOTIFICACION
when V_INC_CAPTURA=''2'' then V_FECHA_CAPTURA
when e.incidencia=''2'' then fechaCaptura
end) as FECHA_NOTIFICACION
,(case when V_SUBDEL=i.SUBDEL then (case 
when [V_INC_CAPTURA]=''2'' then ''2'' 
when [V_INC_CAPTURA]=''9'' then ''9'' 
when [V_INC_CAPTURA] is null then NULL
else ''PAGADO''
end) end) CEDULA_INC
,case when V_SUBDEL=i.SUBDEL then [V_FOLIO_P1] end as CEDULA_FOLIO 
,case when V_SUBDEL=i.SUBDEL then V_FECHA_P1_TURNADO end as FECHA_FOLIO
,case when V_SUBDEL=i.SUBDEL then sirecacobros.dbo.diasInabiles(V_FECHA_P1_TURNADO,getdate()) end as DIAS_TRANSCURRIDOS
FROM (
SELECT 
		[REGPATR] as [REGPAT]
		,[MOV] as [MOVIMIENTO]
		,[FMOV] as [FMOV]
		,FNOTIFICACION as FNOTIFICACION
		,[SECTOR] as [SECTOR]
		,[NUMCRED] as [CREDITO]
		,[TD] as [TIPO_DOC]
		,[FALTA] as [FEC_ALTA]
		,[INC] as [INCIDENCIA]
		,[FEINC] as [FEC_INC]
		,[DIAS] as [DIAS]
		,[IMPORTE] as [IMPORTE]
		,substring([PERIODO],4,7) as [PERIODO]
		,SUBDELR as SUBDEL
		,TIPOR as TIPO
  FROM ('
if @SUBDEL='01' and @TIPO='COP' 
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP01+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='01' and @TIPO='RCV' 
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV01+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='01' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP01+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all '
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV01+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='33' and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP33+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='33'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV33+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='33' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP33+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV33+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='%'  and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP01+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP33+'] where INC = '''+@INCIDENCIA+''' '	
end
if @SUBDEL='%'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV01+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV33+'] where INC = '''+@INCIDENCIA+''' '
end
if @SUBDEL='%'  and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP01+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''COP'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALECOP33+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''01'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV01+'] where INC = '''+@INCIDENCIA+''' '
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select [REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],''33'' as SUBDELR,''RCV'' as TIPOR,FNOTIFICACION FROM [rale].[dbo].['+@RALERCV33+'] where INC = '''+@INCIDENCIA+''' '
end
 SET @CONSULTA = @CONSULTA+' ) as rale left join ('
 if @SUBDEL='01' 
begin
	SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from sireca.dbo.EMMA3301'+@MES+@ANIO2+' '
end
if @SUBDEL='33' 
begin
	SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from  sireca.dbo.EMMA3333'+@MES+@ANIO2+''
end
if @SUBDEL='%'
begin
SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from sireca.dbo.EMMA3301'+@MES+@ANIO2+' '
SET @CONSULTA = @CONSULTA+' union all '
SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from sireca.dbo.EMMA3333'+@MES+@ANIO2+' '
end
SET @CONSULTA = @CONSULTA+' ) as ema
on REPLACE(rale.REGPATR ,''-'','''') = substring(ema.emip_patron,2,10)
where not exists(
SELECT [regpatr]
  FROM [sirecacobros].[dbo].[patronesAlianza]
  where [idAlias]=''2'' and [regpatr]=replace(rale.regpatr,''-'','''')
) '
if @LOS20MAYORES='SI'
begin
	SET @CONSULTA = @CONSULTA+' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=REPLACE(rale.regpatr,''-'','''') and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @CONSULTA = @CONSULTA+' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=REPLACE(rale.regpatr,''-'','''') and om_subdel like '''+@SUBDEL+''') '
	end
end
exec(@CONSULTA +') as i 
left join (
select responsable,REG#PATRONAL,CREDITO,fechaEco,validacion,incidencia,tipoEco,fechaCaptura from sireca.dbo.eco
--where tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
union all
select responsable,REG#PATRONAL
,(case 
when tipoEco in (''COP'',''COMP'') then (substring(CREDITO,1,2)+''8''+substring(CREDITO,4,6))
when tipoEco in (''RCV'',''RCVCOMP'') then (substring(CREDITO,1,2)+''6''+substring(CREDITO,4,6))
end
) as CREDITO
,fechaEco,validacion,incidencia,tipoEco,fechaCaptura from sireca.dbo.eco
--where tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
) as e 
on substring(e.reg#patronal,1,10)=replace(i.regpat,''-'','''') and e.credito=i.credito and e.fechaeco=convert(float,(convert(varchar(2),(case when e.tipoeco in (''COP'',''COMP'') then month(''01/''+i.periodo) else (month(''01/''+i.periodo)*2) end))+convert(varchar(4),year(''01/''+i.periodo))))
left join sirecaemisiones.dbo.eco
on substring(v_regpat,1,10)=replace(i.regpat,''-'','''') and [V_CREDITO]=i.credito and v_periodo=i.periodo')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" QueryStringField="tipo" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="incidencia" />
                <asp:QueryStringParameter DefaultValue="TODOS" Name="?" 
                    QueryStringField="mayoresn" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

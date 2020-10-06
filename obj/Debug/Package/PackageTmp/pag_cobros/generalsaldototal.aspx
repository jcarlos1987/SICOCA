<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="generalsaldototal.aspx.vb" Inherits="WebSIRECA.generalsaldototal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RESULTADOS</title>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
    <script type ="text/javascript" >
        $(document).ready(
            function () {
                $('.tooltip1').tooltip();
                $('.dropdown-toggle').dropdown();
            }
        );
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceSaldoTotal" BorderStyle="Solid" 
                        BorderWidth="1px" CellPadding="1" CellSpacing="1" Font-Size="10pt" 
                        HorizontalAlign="Center" AllowSorting="True">
                            <AlternatingRowStyle BackColor="Silver" />
                            <Columns>
                                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                    SortExpression="INSPECTOR" />
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                    SortExpression="TIPO" />
                                <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                    DataNavigateUrlFormatString="../observacionPatronal/DefaultClear.aspx?regpat={0}&amp;razon=razonsinheader" 
                    DataTextField="PATRONES" HeaderText="REG.PATRONAL" 
                    NavigateUrl="~/observacionPatronal/DefaultClear.aspx" SortExpression="PATRONES" >
                                <ControlStyle Font-Underline="False" />
                    <ItemStyle Font-Underline="False" />
                    </asp:HyperLinkField>
                                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS(PERIODO)" ReadOnly="True" 
                                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="CREDITOS CON INC 31">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenFieldRegpat" runat="server" Value='<%# EVAL("PATRONES") %>' />
                                        <asp:GridView ID="GridViewTPC" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="SqlDataSourceTPC" ShowHeader="False" Font-Size="9pt" 
                                            Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                    SortExpression="TIPO" />
                                                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                    SortExpression="PERIODO" />
                                                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                                                    SortExpression="CREDITO" />
                                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="INC">
                                                <ItemStyle Font-Bold="True" />
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSourceTPC" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                            
                                            
                                            
                                            
                                            
                                            
                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @TIPO as VARCHAR(10)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(5)
DECLARE @REGPAT as VARCHAR(10)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALERCV01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @RALERCV33 as VARCHAR(15)

SET @SUBDEL=?
SET @INSPECTOR=?
SET @REGPAT=?

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALERCV01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='RCV' order by fecha desc)

----------------------------------------------------------------------------
exec('
SELECT RESULTADO2.TIPO,RESULTADO2.PERIODO,RESULTADO2.CREDITO,RESULTADO2.IMPORTE,RALE.INC FROM (
select
case when tipoeco in (''COP'',''COMP'') then ''COP'' when tipoeco in (''RCV'',''RCVCOMP'') then ''RCV'' else tipoeco end as TIPO
,
case when tipoeco in (''RCV'',''RCVCOMP'')  then 
(case when len(fechaEco)=5 then ''0''+convert(varchar,convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(varchar,convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end) 
else
(case when len(fechaEco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end) 
end
as PERIODO
,CREDITO as CREDITO
,OMISION as IMPORTE
from sireca.dbo.eco
where incidencia in (''2'',''1'')
and datediff(day,fechacaptura,getdate())&gt;19
and incidenciarale in (''01'',''02'',''00'')
and subdel='''+@SUBDEL+'''
and responsable like '''+@INSPECTOR+'''
and substring(reg#patronal,1,10)=substring('''+@REGPAT+''',1,10)
and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and validacion=''SIN PAGO''
union all
select 
TIPO as TIPO
,PERIODO
,CREDITO
,IMPORTE
from 
(select distinct
AC_CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=AC_CP_INSPEC) as INSPECTOR
,RA_TIPO as TIPO
,substring(AC_RA_PERIODO,4,7) as PERIODO
,AC_RA_REGPATR as PATRONES
,ptn.cotiz as COTIZANTES
,AC_RA_PERIODO as PERIODOS
,AC_RA_NUMCRED as CREDITO
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_RALE inner join [sirecacobros].[dbo].[CO_ACCIONES] as ac on AC_RA_ID=RA_ID
left join sireca.dbo.patrones as ptn on ptn.regpat=AC_RA_REGPATR
where
(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	order by ac2.AC_FECH_DILIGENCIA desc,ac2.AC_FECH_SISTEM desc
)=''18''
and
(
	select top 1 max(ac2.AC_FECH_SISTEM) from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	group by ac2.AC_RA_ID
)=ac.AC_FECH_SISTEM
and RA_VIVO=''SI''
and RA_INC=''31''
and RA_TD in (''01'',''02'')
and RA_SUBDEL='''+@SUBDEL+'''
and AC_CP_INSPEC like '''+@INSPECTOR+'''
and AC_RA_REGPATR=substring('''+@REGPAT+''',1,10)
) as resultado
union all
select
RA_TIPO as TIPO
,PERIODO
,CREDITO
,IMPORTE
from (
select distinct
CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,RA_TIPO
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITO
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO=''SI''
and RA_INC=''31''
and RA_TD in (''01'',''02'')
and RA_SUBDEL='''+@SUBDEL+'''
and CP_INSPEC like '''+@INSPECTOR+'''
and CP_REGPAT=substring('''+@REGPAT+''',1,10)
)as resultado
where inspector is not null
) AS RESULTADO2 LEFT JOIN
(
SELECT * FROM RALE.DBO.['+@RALECOP01+']
UNION ALL
SELECT * FROM RALE.DBO.['+@RALECOP33+']
UNION ALL
SELECT * FROM RALE.DBO.['+@RALERCV01+']
UNION ALL
SELECT * FROM RALE.DBO.['+@RALERCV33+']
) AS RALE ON REPLACE(RALE.REGPATR,''-'','''')=SUBSTRING('''+@REGPAT+''',1,10)
AND RALE.NUMCRED=RESULTADO2.CREDITO 
')
">
                                            <SelectParameters>
                                                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                                                    QueryStringField="subdel" />
                                                <asp:QueryStringParameter DefaultValue="9999" Name="?" 
                                                    QueryStringField="inspector" />
                                                <asp:ControlParameter ControlID="HiddenFieldRegpat" DefaultValue="00000000" Name="?" 
                                                    PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE(PERIODO)" ReadOnly="True" 
                                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#D2D2D4" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceSaldoTotal" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @TIPO as VARCHAR(10)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(5)
DECLARE @PERIODO as datetime
DECLARE @PERIODO_FIN as datetime

SET @SUBDEL=?
SET @INSPECTOR=?
SET @PERIODO=?
SET @PERIODO_FIN=?
-----------------------------------------------------------------------------------------------------------------
select
(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=responsable) as INSPECTOR
,'ECO' as TIPO
,reg#patronal as PATRONES
,max(cotiz) as COTIZANTES
,count(*) as CREDITOS
,sum(omision) as IMPORTE
from sireca.dbo.eco
where (incidencia in ('2','1') or incidencia is null)
and datediff(day,fechacaptura,getdate())&lt;=19
and incidenciarale in ('00','01','02')
and subdel=@SUBDEL
and responsable like @INSPECTOR
and (
case 
when len(fechaeco)=5
then '01/0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) 
else '01/'+substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end
) between @PERIODO and @PERIODO_FIN
and validacion='SIN PAGO'
group by subdel,responsable,reg#patronal
union all
----------------------------------------------------------------------------
select 
INSPECTOR
,'CITATORIOS' as TIPO
,PATRONES as PATRONES
,SUM(COTIZANTES) as COTIZANTES
,COUNT(*) as CREDITOS
,SUM(IMPORTE) as IMPORTE
from 
(select distinct
AC_CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=AC_CP_INSPEC) as INSPECTOR
,substring(AC_RA_PERIODO,4,7) as PERIODO
,AC_RA_REGPATR as PATRONES
,ptn.cotiz as COTIZANTES
,AC_RA_PERIODO as PERIODOS
,AC_RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_RALE inner join [sirecacobros].[dbo].[CO_ACCIONES] as ac on AC_RA_ID=RA_ID
left join sireca.dbo.patrones as ptn on ptn.regpat=AC_RA_REGPATR
where
(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
	order by ac2.AC_FECH_DILIGENCIA desc,ac2.AC_FECH_SISTEM desc
)='18'
and RA_VIVO='SI'
and RA_SUBDEL=@SUBDEL
and RA_TD in ('02','01')
AND ('01/'+substring(convert(varchar(10),AC_CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
and AC_CP_INSPEC like @INSPECTOR
) as resultado
GROUP BY INSPECTOR,PATRONES
union all
-------------------------------------------------------------------------------
select
INSPECTOR
,'PAE' as TIPO
,REGPAT AS PATRONES
,SUM(COTIZANTES) AS COTIZANTES
,COUNT(CREDITOS) AS CREDITOS
,SUM(IMPORTE) AS IMPORTE
from (
select distinct
CP_INSPEC as ID_INSPECTOR
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=CP_INSPEC) as INSPECTOR
,RA_REGPATR as REGPAT
,ptn.cotiz as COTIZANTES
,substring(RA_PERIODO,4,7) as PERIODO
,convert(datetime,RA_PERIODO,103) as orden
,RA_NUMCRED as CREDITOS
,RA_IMPORTE as IMPORTE
from sirecacobros.dbo.CO_CPATRONAL inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.patrones as ptn on ptn.regpat=CP_REGPAT
where
not exists(
	select top 1 ac2.AC_DOC_ENTRGADO from [sirecacobros].[dbo].[CO_ACCIONES] as ac2
	where ac2.AC_RA_ID=RA_ID
)
and RA_VIVO='SI'
and RA_INC='31'
and RA_TD in ('02','01')
and RA_SUBDEL=@SUBDEL
and ('01/'+substring(convert(varchar(10),CP_FECH_ASIG,103),4,7)) between @PERIODO and @PERIODO_FIN
and CP_INSPEC like @INSPECTOR
)as resultado
where inspector is not null
group by ID_INSPECTOR,inspector,REGPAT
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="9999" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="periodofin" />
            </SelectParameters>
                    </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

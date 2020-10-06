<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="dilipendientes.aspx.vb" Inherits="WebSIRECA.dilipendientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLCopRcv" runat="server" Width="140px">
        <asp:ListItem Value="%">C.O.P. y R.C.V.</asp:ListItem>
        <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
        <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DDLMes" runat="server" Width="100px">
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
    <asp:DropDownList ID="DDLAnio" runat="server" Width="100px">
    </asp:DropDownList>
    <asp:LinkButton ID="LBActualizar" runat="server">Actualizar</asp:LinkButton>
    <asp:GridView ID="GridViewDiligenciados" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceDiligenciados" 
        Caption="DILIGENCIADOS" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                SortExpression="CREDITOS" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDiligenciados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(10)
DECLARE @FECHA_INI AS VARCHAR(10)
DECLARE @USER_ID AS VARCHAR(15)
DECLARE @TIPO_COP_RCV AS VARCHAR(15)
SET @SUBDEL=?
SET @FECHA_INI='01/'+?+'/'+?
SET @USER_ID=?
SET @TIPO_COP_RCV=?

EXEC('
if exists(select * from tempdb.dbo.sysobjects where name = (''cobros'+@USER_ID+'''))
begin
drop table tempdb.dbo.cobros'+@USER_ID+'
end
SELECT
[AC_SUBDEL]
,[RA_TIPO]
,[RA_TD]
,[RA_INC]
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[AC_CP_INSPEC]) as INSPECTOR
,[AC_RA_REGPATR] as REGPAT
,razonSocial as RAZONSOCIAL
,[AC_RA_NUMCRED] as CREDITO
,substring([AC_RA_PERIODO],4,7) as PERIODO
,(SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) as DOCUMENTO
,((case when [AC_DILIGENCIA]=0 then (SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) + '' ('' + [AC_HORA_CITATORIO]+ '')'' else '''' end)+
      (SELECT case when [desc_diligencia]=''&gt; seleccione'' then '''' else replace([desc_diligencia],''(foto)'','''') end FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA])
      +
      case when(
			case when RA_FOLIO_PAG is null then '''' else ''(REC.PRO.:''+(
			SELECT [PA_RECIBO_PROVI]
			FROM [sirecacobros].[dbo].[CO_PAGOS]
			WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG
			and convert(varchar(10),[PA_FECH_RECIBO_PROVI],103)=convert(varchar(10),[AC_FECH_DILIGENCIA],103)
			)+ '')'' end
		)
		 is null then ''''
		 else
		 (
			case when RA_FOLIO_PAG is null then '''' else ''(REC.PRO.:''+(
			SELECT [PA_RECIBO_PROVI]
			FROM [sirecacobros].[dbo].[CO_PAGOS]
			WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG
			and convert(varchar(10),[PA_FECH_RECIBO_PROVI],103)=convert(varchar(10),[AC_FECH_DILIGENCIA],103)
			)+ '')'' end
		)
		 end
       ) as DILIGENCIA
,convert(varchar(10),[AC_FECH_DILIGENCIA],103) as FEC_DILIGENCIA
,RA_IMPORTE as IMPORTE
,(SELECT (case when [desc_observacion] = ''&gt; seleccione'' then '''' else ISNULL([desc_observacion],'''') end) FROM [sirecacobros].[dbo].[cae_observacion] WHERE [id_observacion]=[AC_OBSERVACION]) as OBSERVACION
,(CASE WHEN LEN(EMBARGOS)&gt;1 THEN ID_EMBARGO ELSE '''' END) as ID_EMBARGO
INTO tempdb.dbo.[cobros'+@USER_ID+']
FROM [sirecacobros].[dbo].[CO_ACCIONES] left join sireca.dbo.patrones on [AC_RA_REGPATR]=regpat
left join [sirecacobros].[dbo].[CO_RALE] on AC_RA_ID=RA_ID
where year([AC_FECH_DILIGENCIA])=year('''+@FECHA_INI+''') and month([AC_FECH_DILIGENCIA])=month('''+@FECHA_INI+''')
and  [AC_SUBDEL]='''+@SUBDEL+'''
')
EXEC('
select [INSPECTOR],count(distinct regpat) as REGPAT,count(credito) as CREDITOS,SUM([IMPORTE]) as [IMPORTE]
from (
SELECT [AC_SUBDEL],[RA_TIPO],[INSPECTOR],[REGPAT],[CREDITO],[PERIODO],[DOCUMENTO],[DILIGENCIA],[FEC_DILIGENCIA],[IMPORTE]
FROM [tempdb].[dbo].[cobros'+@USER_ID+'] where [DOCUMENTO] not in (''CITATORIO'')
AND RA_TIPO LIKE '''+@TIPO_COP_RCV+'''
) as r1
group by [INSPECTOR]
order by [INSPECTOR]
')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="COP" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridViewFaltantes" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceFaltantes" Caption="FALTANTES" 
        AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="FEC_DILIGENCIA" HeaderText="DILIGENCIADO" 
                ReadOnly="True" SortExpression="FEC_DILIGENCIA" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                SortExpression="CREDITOS" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceFaltantes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @TIPO_COP_RCV AS VARCHAR(15)
DECLARE @USER_ID AS VARCHAR(15)
SET @TIPO_COP_RCV=?
SET @USER_ID=?

exec('
select [INSPECTOR],FEC_DILIGENCIA,count(distinct regpat) as REGPAT,count(credito) as CREDITOS,SUM([IMPORTE]) as [IMPORTE]
from (
select ct.AC_SUBDEL,ct.RA_TIPO,ct.INSPECTOR,ct.REGPAT,ct.CREDITO,ct.PERIODO,ct.DOCUMENTO,ct.DILIGENCIA,ct.FEC_DILIGENCIA,ct.IMPORTE 
,dil.REGPAT as REGPATV
from (
SELECT [AC_SUBDEL]
      ,[RA_TIPO]
      ,[INSPECTOR]
      ,[REGPAT]
      ,[CREDITO]
      ,[PERIODO]
      ,[DOCUMENTO]
      ,[DILIGENCIA]
      ,[FEC_DILIGENCIA]
      ,[IMPORTE]
  FROM [tempdb].[dbo].[cobros'+@USER_ID+'] where [DOCUMENTO]=''CITATORIO''
  ) as ct left join (SELECT [AC_SUBDEL],[RA_TIPO],[INSPECTOR],[REGPAT],[CREDITO],[PERIODO],[DOCUMENTO],[DILIGENCIA],[FEC_DILIGENCIA],[IMPORTE]
FROM [tempdb].[dbo].[cobros'+@USER_ID+'] where [DOCUMENTO] not in (''CITATORIO'')) as dil
on ct.[REGPAT]=dil.[REGPAT] and ct.[CREDITO]=dil.[CREDITO] and ct.[PERIODO]=dil.[PERIODO]
where dil.regpat is null and ct.RA_TIPO like '''+@TIPO_COP_RCV+'''
) as r1
group by [INSPECTOR],FEC_DILIGENCIA
order by [INSPECTOR]
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="COP" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
        </SelectParameters>
    </asp:SqlDataSource>

</center>
</asp:Content>

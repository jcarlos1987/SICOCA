<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master"   AutoEventWireup="false" CodeBehind="paeemisioncobros.aspx.vb" Inherits="WebSIRECA.paeemisioncobros" %>

<asp:Content ID ="Contend1" runat ="server" ContentPlaceHolderID ="head" >
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="Panel2" runat="server">        
                    <asp:DropDownList ID="DDLSubdel" runat="server" Width="210px" 
                        AutoPostBack="True">
                        </asp:DropDownList>
                    <asp:DropDownList ID="DDLInspector" runat="server" Width="210px" 
                        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
                        DataValueField="valor">
                        </asp:DropDownList>
                        AREA DE<asp:DropDownList ID="DDLArea" runat="server">
                            <asp:ListItem>EMISION</asp:ListItem>
                            <asp:ListItem>COBROS</asp:ListItem>
        </asp:DropDownList>
                        LAS PRIMERAS<asp:DropDownList ID="DDLPaginas" runat="server">
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>40</asp:ListItem>
                            <asp:ListItem>60</asp:ListItem>
                            <asp:ListItem>80</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                            <asp:ListItem>150</asp:ListItem>
                            <asp:ListItem>200</asp:ListItem>
                            <asp:ListItem>300</asp:ListItem>
                            <asp:ListItem>400</asp:ListItem>
                            <asp:ListItem>500</asp:ListItem>
                    </asp:DropDownList>
                        FILAS        
        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False">&nbsp;ACTUALIZAR&nbsp;</asp:LinkButton>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="AbsBottom" 
                        onclientclick="javascript:window.print();" Height="32px" 
                        ImageUrl="~/imagenes/imprimir1.jpg" Width="32px" 
                        ToolTip="Imprimir datos del Patron" />
                        <asp:ImageButton ID="IBExportar" runat="server" style="width: 14px" />
                        <asp:ImageButton ID="ImageButton5" runat="server" Visible="False" />
                        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USUARIO_TIPO as VARCHAR(3)
DECLARE @USUARIO_ID as VARCHAR(5)
DECLARE @SUBDEL as VARCHAR(2)
SET @USUARIO_TIPO=?
SET @USUARIO_ID=?
SET @SUBDEL=?

IF @USUARIO_TIPO='0'
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1')
	order by texto
end
else 
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1')
	and sire.id=@USUARIO_ID
	order by texto
end">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="99999" Name="?" 
                                    SessionField="SIRECAuser_type" />
                                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceExport" runat="server" SelectCommand="DECLARE @CONSULTA AS VARCHAR(3000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @AREA AS VARCHAR(7)
DECLARE @INSPECTOR AS VARCHAR(15)
DECLARE @FECH_CUTRIMESTRE1 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE2 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE3 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE4 AS VARCHAR(10)

SET @SUBDEL=?
-- @AREA = [ EMISION | COBROS ]
SET @AREA=?
SET @FECH_CUTRIMESTRE1='01/04/2013'
SET @FECH_CUTRIMESTRE2='01/'+
(
case 
when len(month(DATEADD(MONTH,1,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,1,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,1,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,1,@FECH_CUTRIMESTRE1)) as varchar(4))

SET @FECH_CUTRIMESTRE3='01/'+
(
case 
when len(month(DATEADD(MONTH,2,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,2,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,2,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,2,@FECH_CUTRIMESTRE1)) as varchar(4))
SET @FECH_CUTRIMESTRE4='01/'+
(
case 
when len(month(DATEADD(MONTH,3,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,3,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,3,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,3,@FECH_CUTRIMESTRE1)) as varchar(4))

SET @CONSULTA='	
select ''N°'',''SUBDEL'',''ID_INSPECTOR'',''INSPECTOR'',''SECTOR'',''REGPAT'',''RAZON_SOCIAL'',''ACTIVIDAD'',''RFC'',''LOCALIDAD'',''CP'',''DOMICILIO'',''REP_LEGAL'',''CORREO'',''TELEFONO'',''PERIODO'',''CREDITOS'',''COTIZANTES'',''IMPORTE''
union all
SELECT
cast(ROW_NUMBER() OVER(ORDER BY [RA_REGPATR],ptn.LOC,ptn.DOM) as varchar) as [N°]
	,'''+@SUBDEL+''' AS SUBDEL
	,cast(CP_INSPEC as varchar) as ID_INSPECTOR	
	,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.ID=CP_INSPEC) AS INSPECTOR
	,cast(ptn.sector as varchar) as SECTOR
	,[RA_REGPATR] AS REGPAT
	,(''&quot;''+rtrim(ptn.RAZONSOCIAL)+''&quot;'') AS RAZON_SOCIAL	
	,(''&quot;''+rtrim(ptn.act)+''&quot;'') AS ACTIVIDAD
	,(''&quot;''+rtrim(ptn.rfc)+''&quot;'') AS RFC
	,(''&quot;''+rtrim((case when len(ptn.loc)&gt;0 then substring(ptn.loc,1,(len(ptn.loc)-5)) else '''' end))+''&quot;'') as LOCALIDAD
	,(case when len(ptn.loc)&gt;0 then substring(ptn.loc,len(ptn.loc)-5,6) else '''' end) as CP
	,(''&quot;''+rtrim(ptn.DOM)+''&quot;'') AS DOMICILIO
	,(SELECT top 1 (''&quot;''+fd.[info]+''&quot;'') FROM [firmaDigital].[dbo].[info] as fd where fd.[tipo]=''1'' and fd.[regpat]=ptn.REGPAT) as REP_LEGAL
	,(SELECT top 1 (''&quot;''+fd.[info]+''&quot;'') FROM [firmaDigital].[dbo].[info] as fd where fd.[tipo]=''2'' and fd.[regpat]=ptn.REGPAT) as CORREO
	,(SELECT top 1 fd.[info] FROM [firmaDigital].[dbo].[info] as fd where fd.[tipo]=''3'' and fd.[regpat]=ptn.REGPAT) as TELEFONO
	,substring(RA_PERIODO,4,7) as PERIODO
	,RALE.[RA_NUMCRED] AS CREDITOS
	,cast(ptn.COTIZ as varchar) AS COTIZANTES
	,cast([RA_IMPORTE] as varchar) AS IMPORTE
	FROM [sirecacobros].[dbo].[CO_RALE] AS rale 
	LEFT JOIN [sireca].[dbo].[patrones] AS ptn ON ptn.REGPAT=rale.[RA_REGPATR]
	LEFT JOIN [sirecacobros].[dbo].[CO_CPATRONAL] ON CP_REGPAT=ptn.REGPAT
	WHERE 
	rale.[RA_VIVO]=''SI''
	AND RA_SUBDEL='''+@SUBDEL+'''
	AND CP_SUBDEL='''+@SUBDEL+''''
	SET @CONSULTA=@CONSULTA+' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''
		AND CORA.[RA_REGPATR]=RALE.[RA_REGPATR]
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.[RA_INC] in (''31'')
	)
	AND RALE.[RA_INC] in (''31'')
	'
select @CONSULTA
" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLArea" DefaultValue="EMISION" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </asp:Panel> 
                    <hr />
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                        AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate >
                            <asp:Panel ID="Panel1" runat="server" BackColor="#FFDA7A" HorizontalAlign="Center">
                            CARGANDO...
                            </asp:Panel>
                        </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate >        
                        <asp:GridView ID="GridViewEC" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceEC" AllowPaging="True" 
                        AllowSorting="True" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" 
                        CellSpacing="1" Font-Size="8pt" HorizontalAlign="Center" PageSize="5" 
                        EmptyDataText="SIN RESULTADOS DE P.A.E." ShowFooter="True">
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                <asp:BoundField DataField="N°" HeaderText="N°" SortExpression="N°">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                    SortExpression="SUBDEL" />
                                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                    SortExpression="INSPECTOR" />
                                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                                DataNavigateUrlFormatString="../observacionPatronal/DefaultClear.aspx?regpat={0}&amp;razon=razonsinheader" 
                                DataTextField="REGPAT" HeaderText="REGPAT" 
                                NavigateUrl="~/observacionPatronal/DefaultClear.aspx" SortExpression="REGPAT" >
                                <ItemStyle Font-Underline="False" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                                    SortExpression="LOCALIDAD" />
                                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                                    SortExpression="DOMICILIO" />
                                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS(31)" ReadOnly="True" 
                                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:TemplateField> 
                                    <ItemTemplate>                                        
                                        <asp:HiddenField ID="HiddenFieldRegPat" runat="server" Value ='<%# EVAL("REGPAT") %>'/>
                                        <asp:GridView ID="GridViewCreditos" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="SqlDataSourceCreditos" Font-Size="8pt" AllowSorting="True" 
                                            onrowdatabound="GridViewCreditos_RowDataBound">
                                            <AlternatingRowStyle BackColor="#ECF8EA" />
                                            <Columns>
                                                <asp:BoundField DataField="N°" HeaderText="N" SortExpression="N°" />
                                                <asp:BoundField DataField="RA_TIPO" HeaderText="TIPO" 
                                                    SortExpression="RA_TIPO" />
                                                <asp:BoundField DataField="RA_SUBDEL" HeaderText="SUBDEL" 
                                                    SortExpression="RA_SUBDEL" />
                                                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                    SortExpression="PERIODO" />
                                                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                                                    SortExpression="CREDITO" />
                                                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                                                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                                                    SortExpression="INC_RALE" />
                                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" HeaderText="IMPORTE" 
                                                    SortExpression="IMPORTE">
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" 
                                                    HeaderText="PAGO" SortExpression="PAGO">
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="FECH_PAGO" DataFormatString="{0:d}" 
                                                    HeaderText="FECH_PAGO" SortExpression="FECH_PAGO" />
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="HiddenFieldIdCred" runat="server" 
                                                            Value='<%# Bind("CLAVE") %>' />
                                                        <asp:GridView ID="GridViewHDeli" runat="server" AllowPaging="True" 
                                                            AutoGenerateColumns="False" DataSourceID="SqlDataSourceHDili" Font-Size="8pt" 
                                                            PageSize="2" ShowHeader="False">
                                                            <Columns>
                                                                <asp:BoundField DataField="DOC" HeaderText="TIPO_DOC." SortExpression="DOC" />
                                                                <asp:BoundField DataField="HORAS" DataFormatString="hace {0} hr." 
                                                                    HeaderText="HORAS" SortExpression="HORAS" />
                                                                <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                                                    SortExpression="DILIGENCIA" />
                                                                <asp:BoundField DataField="AC_FECH_DILIGENCIA" DataFormatString="{0:d}" 
                                                                    HeaderText="AC_FECH_DILIGENCIA" SortExpression="AC_FECH_DILIGENCIA" />
                                                                <asp:BoundField DataField="AC_OBSERVACION" HeaderText="AC_OBSERVACION" 
                                                                    SortExpression="AC_OBSERVACION" />
                                                            </Columns>
                                                            <PagerSettings Position="Top" />
                                                            <PagerStyle HorizontalAlign="Left" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSourceHDili" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(case when [AC_DOC_ENTRGADO]=0 then '' else (SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) end) as DOC
,
(
(case when AC_HORA_CITATORIO='--:-- -.-.' then NULL else
datediff(hour,replace(cast(day(AC_FECH_DILIGENCIA) as varchar(2))+'/'+ cast(month(AC_FECH_DILIGENCIA) as varchar(2))+'/'+cast(year(AC_FECH_DILIGENCIA) as varchar(4)) + ' ' + AC_HORA_CITATORIO,'H.r.',''),getdate()) 
end)-((SELECT [sirecacobros].[dbo].[diasInabiles](AC_FECH_DILIGENCIA,getdate()))*24)
) as HORAS
,(case when [AC_DILIGENCIA]=0 then '' else (SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA]) end) as DILIGENCIA
      ,[AC_FECH_DILIGENCIA]
      ,(case when [AC_OBSERVACION]=0 then '' else (SELECT [desc_observacion] FROM [sirecacobros].[dbo].[cae_observacion] where [id_observacion]=[AC_OBSERVACION]) end ) as [AC_OBSERVACION]
  FROM [sirecacobros].[dbo].[CO_ACCIONES]
where ac_ra_id=?
order by [AC_FECH_DILIGENCIA] desc,[AC_FECH_SISTEM] desc">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="HiddenFieldIdCred" DefaultValue="000" Name="?" 
                                                                    PropertyName="Value" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSourceCreditos" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                            
                                            
                                            
                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(50)
DECLARE @RALERCV as VARCHAR(50)
DECLARE @DEL as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(11)
SET @DEL=?
SET @SUBDEL=?
SET @REGPAT=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
exec('
SELECT
ROW_NUMBER() OVER (order by [RA_INC],convert(datetime,[RA_PERIODO],103) desc) as [N°]
 ,[RA_TIPO]
      ,[RA_SUBDEL]
      ,substring([RA_PERIODO],4,7) as PERIODO
      ,[RA_NUMCRED] as CREDITO
      ,[RA_INC] as INC
      ,rale.INC as INC_RALE
      ,[RA_IMPORTE] as IMPORTE
      ,[RA_PAGO_REAL] as PAGO
      ,[RA_FECH_PAGO_REAL] as FECH_PAGO
      ,RA_ID as CLAVE
  FROM [sirecacobros].[dbo].[CO_RALE] left join (select REGPATR,NUMCRED,PERIODO,INC from rale.dbo.['+@RALECOP+'] union all select REGPATR,NUMCRED,PERIODO,INC from rale.dbo.['+@RALERCV+']) as rale on replace(rale.REGPATR,''-'','''')=[RA_REGPATR] and rale.NUMCRED=[RA_NUMCRED] and rale.PERIODO=RA_PERIODO
  WHERE [RA_VIVO]=''SI''
  and [RA_REGPATR]='''+@REGPAT+'''
  and [RA_INC] in (''31'',''32'',''43'')
  ')
">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAdel" />
                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="HiddenFieldRegPat" DefaultValue="0000000000" 
                                                    Name="?" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>
                                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE(31)" ReadOnly="True" 
                                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#D8D8D8" />
                            <PagerSettings Position="TopAndBottom" PageButtonCount="50" />
                            <PagerStyle HorizontalAlign="Left" BackColor="#D6D6D6" Font-Size="11pt" 
                                Font-Underline="False" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEC" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(2000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @AREA AS VARCHAR(7)
DECLARE @INSPECTOR AS VARCHAR(15)
DECLARE @FECH_CUTRIMESTRE1 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE2 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE3 AS VARCHAR(10)
DECLARE @FECH_CUTRIMESTRE4 AS VARCHAR(10)

SET @SUBDEL=?
-- @AREA = [ EMISION | COBROS ]
SET @AREA=?
-- @INSPECTOR es DISPONIBLES,TODOS,NUMERO es la instruccion is null
SET @INSPECTOR=?
SET @FECH_CUTRIMESTRE1=(
select top 1
(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end)
as fechaecox
from sireca.dbo.eco
where tipoeco in ('COP','RCV','COMP','RCVCOMP')
order by convert(datetime,(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end),103) desc
)
SET @FECH_CUTRIMESTRE2='01/'+
(
case 
when len(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-1,@FECH_CUTRIMESTRE1)) as varchar(4))

SET @FECH_CUTRIMESTRE3='01/'+
(
case 
when len(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-2,@FECH_CUTRIMESTRE1)) as varchar(4))
SET @FECH_CUTRIMESTRE4='01/'+
(
case 
when len(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)))=1 
then '0'+cast(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(2))
else cast(month(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(2))
end 
)+'/'+ cast(year(DATEADD(MONTH,-3,@FECH_CUTRIMESTRE1)) as varchar(4))
EXEC('
update sirecacobros.dbo.co_rale
set ra_inc=''31''
from sireca.dbo.eco INNER JOIN sirecacobros.dbo.co_rale on RA_REGPATR=substring(REG#PATRONAL,1,10)
where
subdel='''+@SUBDEL+'''
and RA_NUMCRED like (''''+substring(CREDITO,1,2)+''_''+substring(CREDITO,4,6)+'''')
and RA_PERIODO=(''01/''+(case when len(fechaEco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end))
and ra_inc in (''01'',''02'')
and datediff(day,fechacaptura,getdate())&gt;19
and incidencia in (''2'',''1'') 
and incidenciarale in (''01'',''02'')
and validacion=''SIN PAGO''
')

SET @CONSULTA='	SELECT
ROW_NUMBER() OVER(ORDER BY MAX(ptn.LOC),MAX(ptn.DOM)) as [N°]
	,'''+@SUBDEL+''' AS SUBDEL
	,CP_INSPEC as ID_INSPECTOR
	,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.ID=CP_INSPEC) AS INSPECTOR
	,[RA_REGPATR] AS REGPAT
	,MAX(ptn.RAZONSOCIAL) AS RAZON_SOCIAL
	,MAX(ptn.LOC) AS LOCALIDAD
	,MAX(ptn.DOM) AS DOMICILIO
	,COUNT(RALE.[RA_NUMCRED]) AS CREDITOS
	,MAX(ptn.COTIZ) AS COTIZANTES
	,SUM([RA_IMPORTE]) AS IMPORTE
	FROM [sirecacobros].[dbo].[CO_RALE] AS rale 
	LEFT JOIN [sireca].[dbo].[patrones] AS ptn ON ptn.REGPAT=rale.[RA_REGPATR]
	LEFT JOIN [sirecacobros].[dbo].[CO_CPATRONAL] ON CP_REGPAT=ptn.REGPAT
	WHERE 
	rale.[RA_VIVO]=''SI''
	AND RA_SUBDEL='''+@SUBDEL+'''
	AND CP_SUBDEL='''+@SUBDEL+''''
	if @INSPECTOR='DISPONIBLES'
	begin 
		SET @CONSULTA=@CONSULTA+' AND CP_INSPEC is null '
	end
	else
	begin
		if isnumeric(@INSPECTOR)&gt;0
		begin 
			SET @CONSULTA=@CONSULTA+' AND CP_INSPEC = '''+@INSPECTOR+''''
		end
	end
	SET @CONSULTA=@CONSULTA+' AND '
	if @AREA='COBROS'
	begin
		SET @CONSULTA=@CONSULTA+' NOT '
	end
	SET @CONSULTA=@CONSULTA + ' EXISTS(
		SELECT TOP 1 CORA.[RA_PERIODO]
		FROM [sirecacobros].[dbo].[CO_RALE] AS CORA
		WHERE CORA.[RA_PERIODO] IN (''' + @FECH_CUTRIMESTRE1 + ''',''' + @FECH_CUTRIMESTRE2 + ''',''' + @FECH_CUTRIMESTRE3 + ''',''' + @FECH_CUTRIMESTRE4 + ''')
		AND CORA.[RA_VIVO]=''SI''
		AND CORA.[RA_REGPATR]=RALE.[RA_REGPATR]
		AND CORA.RA_SUBDEL='''+@SUBDEL+'''
		AND CORA.[RA_INC] in (''31'')
	)
	AND RALE.[RA_INC] in (''31'')
	GROUP BY RALE.[RA_REGPATR],CP_INSPEC
	'
	exec(@CONSULTA)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLArea" DefaultValue="0000000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLInspector" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
                    </asp:SqlDataSource>
    </ContentTemplate> 
    </asp:UpdatePanel> 
    </div>
</asp:Content>

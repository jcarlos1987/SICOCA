<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="reportedetalles.aspx.vb" Inherits="WebSIRECA.reportedetalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        HorizontalAlign="Center" BorderColor="#293955" CssClass="table-bordered" 
        Font-Size="9pt">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" />
            <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                ReadOnly="True" SortExpression="REG_PATRONAL" />
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" />
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" />
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                SortExpression="SECTOR" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                SortExpression="INC" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
            <asp:BoundField DataField="FECH_DILIGENCIA" HeaderText="FECH_DILIGENCIA" 
                ReadOnly="True" SortExpression="FECH_DILIGENCIA" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TBASE AS VARCHAR(300)
DECLARE @DILI AS VARCHAR(50)
DECLARE @RALECOP01 AS VARCHAR(15)
DECLARE @RALECOP33 AS VARCHAR(15)
DECLARE @EMAPERIODO AS VARCHAR(4)
SET @SUBDEL =?
SET @TBASE='select * from [sireca].[dbo].['+?+']'
SET @DILI = ?
SET @EMAPERIODO=substring(@TBASE,37,2)+substring(@TBASE,41,2)

if @DILI='SIN ACTUALIZACION'
begin
	set @DILI= ' WHERE DILIGENCIA is null '
end
else
begin
	set @DILI= ' WHERE DILIGENCIA='''+@DILI+''' '
end
if @SUBDEL='%'
begin
SET @TBASE = replace(@TBASE,'C_BC00','C_BC01')
	+' union all '
	+replace(@TBASE,'C_BC00','C_BC33')	
end
SET @RALECOP01 = (select top 1 name from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (select top 1 name from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
exec('
select *
FROM (
SELECT 
rsubdel as SUBDEL
,base.[REG_PATRONAL]
,rale.[TD]
,rale.[INC]
,rale.NUMCRED as [CREDITO]
,base.[PERIODO]
,base.[IMPORTE]
,base.[RAZON_SOCIAL]
,base.[COTIZANTES]
,base.[SECTOR]
,(
case 
when rale.inc is null 
then ''DEPURADO RALE''
when exists(
	SELECT [EMIP_PATRON]
	FROM [sireca].[dbo].[EMMA3301'+@EMAPERIODO+']
	where substring([EMIP_PATRON],2,11)=REG_PATRONAL
	and pagos is not null
) then ''PAGADO''
/*when EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO]
WHERE [RCP_IMP_COP]&gt;0 --and RCP_SUB like '''+@SUBDEL+'''
AND [RCP_REGPAT]=base.REG_PATRONAL and (''01/''+substring([RCP_PER],6,2)+''/''+substring([RCP_PER],1,4))=base.PERIODO
) then ''PAGADO''*/
when base.inc=rale.inc 
then 
(
	SELECT TOP 1 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[SP_DILI])
	FROM [sireca].[dbo].[C_SIN_PAGO]
	WHERE substring([SP_REGPAT],1,10)=substring(base.REG_PATRONAL,1,10)
	AND [SP_CREDITO]= base.CREDITO
	AND [SP_PERIODO]=base.PERIODO
	ORDER BY [SP_FECH_DILI] DESC
)
when rale.inc=''25''
then ''SIPARE''
else 
	(SELECT inr.[descripcion] FROM [sireca].[dbo].[inc_rale] as inr WHERE inr.[inc]=rale.[INC])
end
) as [DILIGENCIA]
,(
case when base.inc=rale.inc 
then 
(
	SELECT TOP 1 SP_FECH_DILI
	FROM [sireca].[dbo].[C_SIN_PAGO]
	WHERE substring([SP_REGPAT],1,10)=substring(base.REG_PATRONAL,1,10)
	AND [SP_CREDITO]= base.CREDITO
	AND [SP_PERIODO]=base.PERIODO
	ORDER BY [SP_FECH_DILI] DESC
)
end
) as [FECH_DILIGENCIA]
FROM ('+@TBASE+') as base
left join
(
select ''01'' as rsubdel, * from rale.dbo.['+@RALECOP01+'] as rx
where rx.td in (''02'',''01'')
union all 
select ''33'' as rsubdel, * from rale.dbo.['+@RALECOP33+'] as rx
where rx.td in (''02'',''01'')
) as rale
on 
replace([REGPATR],''-'','''')=substring(REG_PATRONAL,1,10) 
where 
rale.[PERIODO]=base.PERIODO 
--and rsubdel like '''+@SUBDEL+'''
) AS RESULT 
'+@DILI+'
')
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="%" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="abcdef" Name="?" 
                QueryStringField="base" />
            <asp:QueryStringParameter DefaultValue="abcdef" Name="?" 
                QueryStringField="dili" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

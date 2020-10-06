<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._default43" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>    
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Width="110px">
        </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span> 
                            <asp:DropDownList ID="DDLMes" runat="server" Width="120px">
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
<span class="add-on">
        <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server" BackColor="#F2B63B"><i class ="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
</span> 
<span class="add-on">
        <asp:LinkButton ID="LinkButton2" CssClass="btn" runat="server" BackColor="#F2B63B">&nbsp;Exportar a EXCEL&nbsp;</asp:LinkButton>
</span> 
<span class="add-on">
        <asp:Label ID="LabelMsg" runat="server" ForeColor="#CC0000"></asp:Label>
</span> 
</div> 
        <asp:Panel ID="PanelExport" runat="server">
    <table style="width:100%; font-size: 12px;" 
            border="1" bgcolor="#F0F0F0" cellpadding="0" cellspacing="0">
                                    <tr>
                                            <td class="style1" colspan="5">
                                                <asp:Label ID="Label11" runat="server" 
                                                    Text="Estimación de los ingresos obrero patronales flujo de efectivo." 
                                                    Font-Bold="True"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label12" runat="server" Text="No incluye IMSS como patrón" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="Label34" runat="server" Text="DIFERENCIA VS META" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="LabelDifMet" runat="server" Font-Bold="True" ></asp:Label>                                                
                                            </td>
                                            <td bgcolor="#999999" align="center">
                                                &nbsp;</td>
                                            <td bgcolor="#999999" align="center">
                                                &nbsp;</td>
                                            <td bgcolor="#999999" align="center">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="Label2" runat="server" Text="CONCEPTO" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" ></asp:Label>                                                
                                            </td>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="Label4" runat="server" Text="PROCESAR/SIPARE" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="Label5" runat="server" Text="DIF" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td bgcolor="#999999" align="center">
                                                <asp:Label ID="Label6" runat="server" Text="%" Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                                        <ItemTemplate>                                        
                                        <tr>
                                            <td>
                                                &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("CONCEPTO") %>'></asp:Label></td>
                                            <td align="right">
                                                &nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Eval("META","{0:C}") %>'></asp:Label></td>
                                            <td align="right">
                                                &nbsp;<asp:Label ID="Label9" runat="server" Text='<%# Eval("PROCESAR","{0:C}") %>'></asp:Label></td>
                                            <td align="right">
                                                &nbsp;<asp:Label ID="Label10" runat="server" Text='<%# Eval("DIFERENCIA","{0:C}") %>'></asp:Label></td>
                                            <td align="right">
                                                &nbsp;<asp:Label ID="LabelP" runat="server" ></asp:Label></td>
                                        </tr>
                                        </ItemTemplate>
                                        </asp:Repeater>                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @MES_ANT as VARCHAR(2)
DECLARE @ANIO_ANT as VARCHAR(4)
DECLARE @EMISION as VARCHAR(15)
DECLARE @PERIODO as VARCHAR(7)
DECLARE @PERIODO_LIM as VARCHAR(7)
DECLARE @PERIODO_ANT2 as VARCHAR(10)
DECLARE @PERIODO_ANT3 as VARCHAR(7)
DECLARE @NOM_MES3 as VARCHAR(3)
DECLARE @PERIODO_ANT_MES as VARCHAR(2)
DECLARE @PERIODO_ANT_ANIO as VARCHAR(4)
DECLARE @EMISION_TABLAS AS VARCHAR(1000)
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @NOM_MES3=substring(upper(datename(month,'01/'+@MES+'/'+@ANIO)),1,3)
SET @PERIODO=(@ANIO+'/'+@MES)
SET @PERIODO_LIM=(convert(nvarchar(4),year(DATEADD(year,-1,'01/'+@MES+'/'+@ANIO)))+'/12')
SET @PERIODO_ANT2=(case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)
SET @PERIODO_ANT3=(case when len(month((DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))) end)
IF @MES='01'
BEGIN
	SET @PERIODO_LIM=(convert(nvarchar(4),year(DATEADD(year,-2,'01/'+@MES+'/'+@ANIO)))+'/12')
	SET @PERIODO_ANT2=(case when len(month((DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))) end)
	SET @PERIODO_ANT3=(case when len(month((DATEADD(month,-4,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-4,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-4,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-4,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-4,'01/'+@MES+'/'+@ANIO))) end)
END
SET @MES_ANT = (CASE 
WHEN LEN(MONTH(DATEADD(month,-1,'01/'+@MES+'/'+@ANIO)))=1 
THEN '0'+CONVERT(VARCHAR(2),MONTH(DATEADD(month,-1,'01/'+@MES+'/'+@ANIO)))
ELSE CONVERT(VARCHAR(2),MONTH(DATEADD(month,-1,'01/'+@MES+'/'+@ANIO))) 
END)
SET @ANIO_ANT = YEAR(DATEADD(MONTH,-1,'01/'+@MES+'/'+@ANIO))
SET @EMISION = UPPER(DATENAME(MONTH,'01/'+@MES_ANT+'/'+@ANIO_ANT))

if @SUBDEL='%'
begin 
SET @EMISION_TABLAS='
select sum([emision]) from (
SELECT [emision] FROM [sireca].[dbo].[EMMA'+'33'+'01'+@MES_ANT+SUBSTRING(@ANIO_ANT,3,2)+'] 
union all
SELECT [emision] FROM [sireca].[dbo].[EMMA'+'33'+'33'+@MES_ANT+SUBSTRING(@ANIO_ANT,3,2)+']
) as resultado
'
end
else
begin
SET @EMISION_TABLAS='
SELECT sum([emision]) FROM [sireca].[dbo].[EMMA'+'33'+@SUBDEL+@MES_ANT+SUBSTRING(@ANIO_ANT,3,2)+'] 
'
end
exec('
DECLARE @VREC_MOD101317 as FLOAT
DECLARE @VMESES_ANT as FLOAT
DECLARE @VANIOS_ANT as FLOAT

SET @VREC_MOD101317=(
(SELECT sum([RCP_IMP_COP]) as VREC_MOD101317
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='''+@ANIO+''' and month([RCP_FEC_MOV])='''+@MES+'''
and [RCP_PER] between '''+@PERIODO_ANT2+''' and '''+@PERIODO+'''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17''))
+
(SELECT sum([ImporteIMSS]) as VREC_MOD101317
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and (substring(convert(varchar(6),[PeriodoPago]),1,4)+''/''+substring(convert(varchar(6),[PeriodoPago]),5,2))
  between '''+@PERIODO_ANT2+''' 
  and '''+@PERIODO+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
)
)
SET @VREC_MOD101317=(case when @VREC_MOD101317 is null then 0 else @VREC_MOD101317 end)
SET @VMESES_ANT=(
SELECT sum([RCP_IMP_COP]) as MESES_ANT
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='''+@ANIO+''' and month([RCP_FEC_MOV])='''+@MES+'''
and [RCP_PER] between '''+@PERIODO_LIM+''' and '''+@PERIODO_ANT3+'''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
)
SET @VMESES_ANT=(case when @VMESES_ANT is null then 0 else @VMESES_ANT end)
SET @VANIOS_ANT=(
SELECT sum([RCP_IMP_COP]) as ANIOS_ANT
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='''+@ANIO+''' and month([RCP_FEC_MOV])='''+@MES+'''
and [RCP_PER] &lt; '''+@PERIODO_LIM+''' 
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')

)
SET @VANIOS_ANT=(case when @VANIOS_ANT is null then 0 else @VANIOS_ANT end)

SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=1) as CONCEPTO
,((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')) as META
,@VREC_MOD101317 as PROCESAR
,(@VREC_MOD101317-((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')))as DIFERENCIA
union all
SELECT ''EMISION('+@EMISION+')'' as CONCEPTO
,('+@EMISION_TABLAS+') as META
,NULL as PROCESAR
,NULL as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=16) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VMESES_ANT as PROCESAR
,(@VMESES_ANT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=17) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VANIOS_ANT as PROCESAR
,(@VANIOS_ANT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
')
">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                    </asp:SqlDataSource>
                                        <tr align="right">
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:Repeater ID="RepeaterMetaT" runat="server" 
                                                    DataSourceID="SqlDataSourceMetaT" >
                                                <ItemTemplate >
                                                    <asp:Label ID="LabelMetaT" runat="server" Font-Bold="True" Font-Size="11pt" Text ='<%# Eval("meta","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                                </asp:Repeater>
                                                
                                                <asp:SqlDataSource ID="SqlDataSourceMetaT" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @META as VARCHAR(3)
SET @SUBDEL=?
SET @MES=?
SET @ANIO=?
SET @META=upper(datename(month,'01/'+@MES+'/'+@ANIO))
exec('
SELECT sum([MET_'+@META+']) as meta
FROM [sirecacobros].[dbo].[MET_METAS]
where [MET_ID_CONSEPTO]=''32'' and [MET_ANIO]='''+@ANIO+'''
and [MET_SUBDEL] like '''+@SUBDEL+'''
')">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelLGP" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelDIF" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelP" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label>
                                            </td>
                                        </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content> 

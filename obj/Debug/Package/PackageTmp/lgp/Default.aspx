<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master"  AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default42" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Width="150px">
        </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLMes" runat="server" Width="130px">
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

        <asp:Label ID="Label33" runat="server" Text="Reversión de Cuotas" Visible="False" ></asp:Label>
        <asp:TextBox ID="TBRevCuotas" runat="server" MaxLength="15" Visible="False">0</asp:TextBox>
        <span class="add-on">
        <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server" BackColor="#F2B63B">Actualizar</asp:LinkButton>
        </span>
        <span class="add-on">
        <asp:LinkButton ID="LinkButton2" CssClass="btn" runat="server" BackColor="#F2B63B">Exportar a EXCEL</asp:LinkButton>
        </span>
    <asp:DropDownList ID="DDLVista" runat="server" AutoPostBack="True" Width="150px">
        <asp:ListItem Value="0">Vista Tabla</asp:ListItem>
        <asp:ListItem Value="1">Vista Grafica</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
        <asp:Label ID="LabelMsg" runat="server" ForeColor="#CC0000"></asp:Label>
</span> 
</div> 
</div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
    <asp:View ID="ViewTabla" runat="server">
    
        <table align="center" bgcolor="#F0F0F0" border="1" cellpadding="0" 
            cellspacing="0" style="font-size: 12px;">
            <tr>
                <td class="style1" colspan="5">
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                        Text="Estimación de los ingresos obrero patronales flujo de efectivo."></asp:Label>
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" 
                        Text="No incluye IMSS como patrón"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#999999">
                    <asp:Label ID="Label34" runat="server" Font-Bold="True" 
                        Text="DIFERENCIA VS META"></asp:Label>
                </td>
                <td align="center" bgcolor="#999999">
                    <asp:Label ID="LabelDifMet" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td align="center" bgcolor="#999999">
                    &nbsp;</td>
                <td align="center" bgcolor="#999999">
                    &nbsp;</td>
                <td align="center" bgcolor="#999999">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" bgcolor="#999999" class="style1">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="CONCEPTO"></asp:Label>
                </td>
                <td align="center" bgcolor="#999999" class="style1">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td align="center" bgcolor="#999999" class="style1">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="LGP"></asp:Label>
                </td>
                <td align="center" bgcolor="#999999" class="style1">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="DIF"></asp:Label>
                </td>
                <td align="center" bgcolor="#999999" class="style1">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="%"></asp:Label>
                </td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <tr>
                        <td>
                            &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("CONCEPTO") %>' Font-Size="9"></asp:Label>
                        </td>
                        <td align="right">
                            &nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Eval("META","{0:C}") %>' Font-Size="9"></asp:Label>
                        </td>
                        <td align="right">
                            &nbsp;<asp:Label ID="Label9" runat="server" Text='<%# Eval("LGP","{0:C}") %>' Font-Size="9"></asp:Label>
                        </td>
                        <td align="right">
                            &nbsp;<asp:Label ID="Label10" runat="server" 
                                Text='<%# Eval("DIFERENCIA","{0:C}") %>' Font-Size="9"></asp:Label>
                        </td>
                        <td align="right">
                            &nbsp;<asp:Label ID="LabelP" runat="server"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr align="right">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="LabelLGP" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelDIF" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </asp:View>
    <asp:View ID="ViewGrafica" runat="server">
    <div align="center">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" 
            Height="400px" Width="900px" BackImageTransparentColor="Transparent">
            <Series>
                <asp:Series ChartArea="ChartArea1" Color="LightSalmon" 
                    CustomProperties="DrawingStyle=Cylinder" Legend="Legend1" Name="META" 
                    ToolTip="#VAL{C}" XValueMember="CONCEPTO1" YValueMembers="META1">
                </asp:Series>
                <asp:Series Color="LightGreen" CustomProperties="DrawingStyle=Cylinder" 
                    Legend="Legend1" Name="LGP" ToolTip="#VAL{C}" XValueMember="CONCEPTO1" 
                    YValueMembers="LGP1">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Color="LightSalmon" 
                    CustomProperties="DrawingStyle=Emboss" Legend="Legend1" Name="META." 
                    ToolTip="#VAL{C}" XValueMember="CONCEPTO2" YAxisType="Secondary" 
                    YValueMembers="META2">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Color="LightGreen" 
                    CustomProperties="DrawingStyle=Emboss" Legend="Legend1" Name="L.G.P." 
                    ToolTip="#VAL{C}" XValueMember="CONCEPTO2" YAxisType="Secondary" 
                    YValueMembers="LGP2">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BackColor="Transparent" 
                    BackImageTransparentColor="Transparent">
                    <AxisY>
                        <MajorGrid LineColor="DarkGray" />
                        <LabelStyle Format="{0:C0}" />
                    </AxisY>
                    <AxisX>
                        <MajorGrid LineColor="DarkGray" />
                    </AxisX>
                    <AxisY2>
                        <LabelStyle Format="{0:C}" />
                    </AxisY2>
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Alignment="Center" Docking="Top" Name="Legend1">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Font="Microsoft Sans Serif, 11pt" Name="Title1" 
                    Text="Análisis Recaudación Ingresos Financieros L.G.P.">
                </asp:Title>
            </Titles>
            <BorderSkin BackImageTransparentColor="Transparent" PageColor="Transparent" 
                SkinStyle="Emboss" />
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @MES_ANT as VARCHAR(2)
DECLARE @ANIO_ANT as VARCHAR(4)
DECLARE @EMISION as VARCHAR(15)
DECLARE @PERIODO as VARCHAR(7)
DECLARE @PERIODO_LIM as VARCHAR(7)
DECLARE @PERIODO_ANT2 as VARCHAR(7)
DECLARE @PERIODO_ANT3 as VARCHAR(7)
DECLARE @NOM_MES3 as VARCHAR(3)
DECLARE @PERIODO_ANT_MES as VARCHAR(2)
DECLARE @PERIODO_ANT_ANIO as VARCHAR(4)
DECLARE @REVER_CUOTAS as FLOAT
DECLARE @EMISION_TABLAS AS VARCHAR(1000)
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @REVER_CUOTAS='0'
/*
SET @NOM_MES3=substring(upper(datename(month,'01/'+@MES+'/'+@ANIO)),1,3)
SET @PERIODO=(@ANIO+'/'+@MES)
SET @PERIODO_LIM=(convert(nvarchar(4),year(DATEADD(year,-1,'01/'+@MES+'/'+@ANIO)))+'/12')

SET @PERIODO_ANT2=(case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)
SET @PERIODO_ANT3=(case when len(month((DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))) end)
*/
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
DECLARE @VOTRAS_MOD as FLOAT
DECLARE @VREC_CARTE as FLOAT
DECLARE @VMESES_ANT as FLOAT
DECLARE @VANIOS_ANT as FLOAT
DECLARE @VING_FIS as FLOAT
DECLARE @VING_AUD as FLOAT
DECLARE @VING_COR as FLOAT
DECLARE @VING_DIC as FLOAT
DECLARE @VCUO_OBR_PATRO as FLOAT
DECLARE @VCAP_CONST as FLOAT
DECLARE @VMULTA as FLOAT
DECLARE @VREC_MONA as FLOAT
DECLARE @VACT as FLOAT
DECLARE @VGAS_EJE as FLOAT
DECLARE @OTROS_CONSEP as FLOAT
DECLARE @VAUDITO_QUI as FLOAT
SET @VAUDITO_QUI=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC between ''50'' and ''60''	
	and RC_MOD=''38''
	and RC_CAJA &lt; 300)
SET @VAUDITO_QUI=(case when @VAUDITO_QUI is null then 0 else @VAUDITO_QUI end)

SET @VREC_MOD101317=(
	SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD &lt; 18
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_PER between '''+@PERIODO_ANT2+''' and '''+@PERIODO+'''
	and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
	and RC_CAJA &lt; 300)
SET @VREC_MOD101317=(case when @VREC_MOD101317 is null then 0 else @VREC_MOD101317 end)

SET @VOTRAS_MOD =(
	SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD in (''14'',''30'',''32'',''33'',''34'',''35'',''36'',''38'',''40'',''42'',''43'',''44'')
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON))
SET @VOTRAS_MOD=((case when @VOTRAS_MOD is null then 0 else @VOTRAS_MOD end)-@VAUDITO_QUI)

SET @VMESES_ANT=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD &lt; 20
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_PER between '''+@PERIODO_LIM+''' and '''+@PERIODO_ANT3+'''
	and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
	and RC_CAJA &lt; 300)
SET @VMESES_ANT=(case when @VMESES_ANT is null then 0 else @VMESES_ANT end)

SET @VANIOS_ANT=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD &lt; 20
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_PER &lt; '''+@PERIODO_LIM+'''
	and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
	and RC_CAJA &lt; 300)	
SET @VANIOS_ANT=(case when @VANIOS_ANT is null then 0 else @VANIOS_ANT end)

SET @VREC_CARTE=@VMESES_ANT+@VANIOS_ANT

SET @VING_AUD=(SELECT sum(RC_IMP_TOT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC in (''50'',''59'',''60'')
	and RC_CAJA &lt; 300)
SET @VING_AUD=(case when @VING_AUD is null then 0 else @VING_AUD end)

SET @VING_COR=(SELECT sum(RC_IMP_TOT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC in (''51'',''58'')
	and RC_CAJA &lt; 300)
SET @VING_COR=(case when @VING_COR is null then 0 else @VING_COR end)

SET @VING_DIC=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC between ''52'' and ''56''
	and RC_CAJA &lt; 300)
SET @VING_DIC=(case when @VING_DIC is null then 0 else @VING_DIC end)

SET @VING_FIS=@VING_AUD+@VING_COR+@VING_DIC

SET @VCUO_OBR_PATRO=(@VREC_MOD101317+@VOTRAS_MOD+@VREC_CARTE+@VING_FIS)

SET @VCAP_CONST=(
	SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC=''00''
	and RC_CAJA &lt; 300)
SET @VCAP_CONST=(case when @VCAP_CONST is null then 0 else @VCAP_CONST end)

SET @VMULTA = (
	SELECT sum(RC_IMP_TOT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and (RC_DOC=''08'' or RC_DOC between ''80'' and ''89'')
	and RC_CAJA &lt; 300)
SET @VMULTA=(case when @VMULTA is null then 0 else @VMULTA end)

SET @VREC_MONA=(
	SELECT sum(RC_IMP_INT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON))
SET @VREC_MONA=(case when @VREC_MONA is null then 0 else @VREC_MONA end)

SET @VACT=(
	SELECT sum(RC_IMP_ACT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON))
SET @VACT=(case when @VACT is null then 0 else @VACT end)

SET @VGAS_EJE=(
	SELECT sum(RC_IMP_EJE) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC not in (''10'')
	and RC_CAJA &lt; 300)
SET @VGAS_EJE=(case when @VGAS_EJE is null then 0 else @VGAS_EJE end)

SET @OTROS_CONSEP=(@VCAP_CONST+@VMULTA+@VREC_MONA+@VACT+@VGAS_EJE)
-----------------------------------------------------------------------------
select * from (
SELECT ''1'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=1) as CONCEPTO1
,((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')+'+'(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=5 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')'+') as META1
,@VREC_MOD101317 as LGP1
union all
SELECT ''3'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=15) as CONCEPTO2
,NULL as META2
,NULL as LGP2
union all
SELECT 
''4'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=18) as CONCEPTO2
,NULL as META2
,NULL as LGP2
union all
SELECT 
''2'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=32) as CONCEPTO1
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=32 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META1
,(@VCUO_OBR_PATRO+@OTROS_CONSEP) as LGP1
) as dato1
left join
(
SELECT ''1'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=1) as CONCEPTO2
,NULL as META2
,NULL as LGP2
union all
SELECT 
''2'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=32) as CONCEPTO2
,NULL as META2
,NULL as LGP2
union all
SELECT ''3'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=15) as CONCEPTO2
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=15 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META2
,(@VREC_CARTE) as LGP2
union all
SELECT 
''4'' fila
,(SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=18) as CONCEPTO2
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=18 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META2
,@VING_FIS as LGP2
) as dato2 
on dato1.fila=dato2.fila
ORDER BY dato1.fila
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </asp:View>
    </asp:MultiView>
        
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
DECLARE @PERIODO_ANT2 as VARCHAR(7)
DECLARE @PERIODO_ANT3 as VARCHAR(7)
DECLARE @NOM_MES3 as VARCHAR(3)
DECLARE @PERIODO_ANT_MES as VARCHAR(2)
DECLARE @PERIODO_ANT_ANIO as VARCHAR(4)
DECLARE @REVER_CUOTAS as FLOAT
DECLARE @EMISION_TABLAS AS VARCHAR(1000)
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @REVER_CUOTAS=?
/*
SET @NOM_MES3=substring(upper(datename(month,'01/'+@MES+'/'+@ANIO)),1,3)
SET @PERIODO=(@ANIO+'/'+@MES)
SET @PERIODO_LIM=(convert(nvarchar(4),year(DATEADD(year,-1,'01/'+@MES+'/'+@ANIO)))+'/12')

SET @PERIODO_ANT2=(case when len(month((DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-2,'01/'+@MES+'/'+@ANIO))) end)
SET @PERIODO_ANT3=(case when len(month((DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))))=1 then (convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/0'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))) else convert(nvarchar(4),year(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO)))+'/'+convert(nvarchar(2),month(DATEADD(month,-3,'01/'+@MES+'/'+@ANIO))) end)
*/
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
DECLARE @VOTRAS_MOD as FLOAT
DECLARE @VREC_CARTE as FLOAT
DECLARE @VMESES_ANT as FLOAT
DECLARE @VANIOS_ANT as FLOAT
DECLARE @VING_FIS as FLOAT
DECLARE @VING_AUD as FLOAT
DECLARE @VING_COR as FLOAT
DECLARE @VING_DIC as FLOAT
DECLARE @VCUO_OBR_PATRO as FLOAT
DECLARE @VCAP_CONST as FLOAT
DECLARE @VMULTA as FLOAT
DECLARE @VREC_MONA as FLOAT
DECLARE @VACT as FLOAT
DECLARE @VGAS_EJE as FLOAT
DECLARE @OTROS_CONSEP as FLOAT
DECLARE @VAUDITO_QUI as FLOAT
SET @VAUDITO_QUI=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC between ''50'' and ''60''	
	and RC_MOD=''38''
	and RC_CAJA &lt; 300)
SET @VAUDITO_QUI=(case when @VAUDITO_QUI is null then 0 else @VAUDITO_QUI end)

SET @VREC_MOD101317=(
	SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD &lt; 18
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_PER between '''+@PERIODO_ANT2+''' and '''+@PERIODO+'''
	and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
	and RC_CAJA &lt; 300)
SET @VREC_MOD101317=(case when @VREC_MOD101317 is null then 0 else @VREC_MOD101317 end)

SET @VOTRAS_MOD =(
	SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD in (''14'',''30'',''32'',''33'',''34'',''35'',''36'',''38'',''40'',''42'',''43'',''44'')
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON))
SET @VOTRAS_MOD=((case when @VOTRAS_MOD is null then 0 else @VOTRAS_MOD end)-@VAUDITO_QUI)

SET @VMESES_ANT=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD &lt; 20
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_PER between '''+@PERIODO_LIM+''' and '''+@PERIODO_ANT3+'''
	and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
	and RC_CAJA &lt; 300)
SET @VMESES_ANT=(case when @VMESES_ANT is null then 0 else @VMESES_ANT end)

SET @VANIOS_ANT=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and RC_MOD &lt; 20
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_PER &lt; '''+@PERIODO_LIM+'''
	and RC_DOC in (''01'',''02'',''03'',''04'',''05'',''06'',''07'')
	and RC_CAJA &lt; 300)	
SET @VANIOS_ANT=(case when @VANIOS_ANT is null then 0 else @VANIOS_ANT end)

SET @VREC_CARTE=@VMESES_ANT+@VANIOS_ANT

SET @VING_AUD=(SELECT sum(RC_IMP_TOT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC in (''50'',''59'',''60'')
	and RC_CAJA &lt; 300)
SET @VING_AUD=(case when @VING_AUD is null then 0 else @VING_AUD end)

SET @VING_COR=(SELECT sum(RC_IMP_TOT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC in (''51'',''58'')
	and RC_CAJA &lt; 300)
SET @VING_COR=(case when @VING_COR is null then 0 else @VING_COR end)

SET @VING_DIC=(SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC between ''52'' and ''56''
	and RC_CAJA &lt; 300)
SET @VING_DIC=(case when @VING_DIC is null then 0 else @VING_DIC end)

SET @VING_FIS=@VING_AUD+@VING_COR+@VING_DIC

SET @VCUO_OBR_PATRO=(@VREC_MOD101317+@VOTRAS_MOD+@VREC_CARTE+@VING_FIS)

SET @VCAP_CONST=(
	SELECT sum(RC_IMP_TOT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC=''00''
	and RC_CAJA &lt; 300)
SET @VCAP_CONST=(case when @VCAP_CONST is null then 0 else @VCAP_CONST end)

SET @VMULTA = (
	SELECT sum(RC_IMP_TOT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and (RC_DOC=''08'' or RC_DOC between ''80'' and ''89'')
	and RC_CAJA &lt; 300)
SET @VMULTA=(case when @VMULTA is null then 0 else @VMULTA end)

SET @VREC_MONA=(
	SELECT sum(RC_IMP_INT) as LGP	
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON))
SET @VREC_MONA=(case when @VREC_MONA is null then 0 else @VREC_MONA end)

SET @VACT=(
	SELECT sum(RC_IMP_ACT) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON))
SET @VACT=(case when @VACT is null then 0 else @VACT end)

SET @VGAS_EJE=(
	SELECT sum(RC_IMP_EJE) as LGP
	FROM [lgp].[dbo].[RC]
	WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
	and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
	and RC_DOC not in (''10'')
	and RC_CAJA &lt; 300)
SET @VGAS_EJE=(case when @VGAS_EJE is null then 0 else @VGAS_EJE end)

SET @OTROS_CONSEP=(@VCAP_CONST+@VMULTA+@VREC_MONA+@VACT+@VGAS_EJE)
-----------------------------------------------------------------------------
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=1) as CONCEPTO
,((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')+'+@REVER_CUOTAS+') as META
,@VREC_MOD101317 as LGP
,(@VREC_MOD101317-((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')+'+@REVER_CUOTAS+'))as DIFERENCIA
union all
SELECT ''EMISION('+@EMISION+')'' as CONCEPTO
,('+@EMISION_TABLAS+') as META
,NULL as LGP
,NULL as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=2) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=2 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VOTRAS_MOD as LGP
,(@VOTRAS_MOD-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=2 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=3) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=3 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=3 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''14''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=4) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=4 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=4 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''30''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=5) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=5 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=5 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''32''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=6) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=6 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=6 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''33''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=7) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=7 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=7 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''34''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=8) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=8 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=8 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''35''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=9) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=9 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=9 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''36''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=10) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=10 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(sum(RC_IMP_TOT)-@VAUDITO_QUI) as LGP
,((sum(RC_IMP_TOT)-@VAUDITO_QUI)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=10 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''38''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=11) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=11 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=11 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''40''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=12) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=12 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=12 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''42''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=13) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=13 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=13 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''43''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=14) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=14 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,sum(RC_IMP_TOT) as LGP
,(sum(RC_IMP_TOT)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=14 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
FROM [lgp].[dbo].[RC]
WHERE RC_SUB like '''+@SUBDEL+''' and YEAR(RC_FEC_MOV)='+@ANIO+' and MONTH(RC_FEC_MOV)='''+@MES+'''
and RC_MOD = ''44''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where ''A''+SUBSTRING([MET_REGPAT],1,8)=RC_PATRON)
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=15) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=15 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(@VREC_CARTE) as LGP
,((@VREC_CARTE)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=15 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=16) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VMESES_ANT as LGP
,(@VMESES_ANT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=17) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VANIOS_ANT as LGP
,(@VANIOS_ANT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=18) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=18 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VING_FIS as LGP
,(@VING_FIS-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=18 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=19) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=19 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VING_AUD as LGP
,(@VING_AUD-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=19 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=20) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=20 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VING_COR as LGP
,(@VING_COR-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=20 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=21) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=21 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VING_DIC as LGP
,(@VING_DIC-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=21 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=22) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=22 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(@VCUO_OBR_PATRO) as LGP
,(@VCUO_OBR_PATRO-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=22 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT ''Cuotas Obrero Patronales IMSS'' as CONCEPTO
,0 as META
,0 as LGP
,0 as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=23) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=23 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')  as META
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=23 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as LGP
,((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=23 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=23 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=24) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=24 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VCUO_OBR_PATRO as LGP
,(@VCUO_OBR_PATRO-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=24 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=25) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=25 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(@OTROS_CONSEP) as LGP
,(@OTROS_CONSEP-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=25 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=26) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=26 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VCAP_CONST as LGP
,(@VCAP_CONST-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=26 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=27) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=27 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(@VMULTA+@VREC_MONA+@VACT+@VGAS_EJE) as LGP
,((@VMULTA+@VREC_MONA+@VACT+@VGAS_EJE)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=27 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=28) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=28 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VMULTA as LGP
,(@VMULTA-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=28 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=29) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=29 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VREC_MONA as LGP
,(@VREC_MONA-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=29 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=30) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=30 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VACT as LGP
,(@VACT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=30 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=31) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=31 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,@VGAS_EJE as LGP
,(@VGAS_EJE-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=31 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=32) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=32 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(@VCUO_OBR_PATRO+@OTROS_CONSEP) as LGP
,((@VCUO_OBR_PATRO+@OTROS_CONSEP)-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=32 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
')
">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:Parameter DefaultValue="0" Name="?" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAnual" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @SUBDELV as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @TAB_ING1 as VARCHAR(160)
DECLARE @TAB_ING2 as VARCHAR(160)
DECLARE @TAB_ING3 as VARCHAR(160)
DECLARE @TAB_ING4 as VARCHAR(160)
DECLARE @TAB_ING5 as VARCHAR(160)
DECLARE @TAB_ING6 as VARCHAR(160)
DECLARE @TAB_ING7 as VARCHAR(160)
DECLARE @TAB_ING8 as VARCHAR(160)
DECLARE @TAB_ING9 as VARCHAR(160)
DECLARE @TAB_ING10 as VARCHAR(160)
DECLARE @TAB_ING11 as VARCHAR(160)
DECLARE @TAB_ING12 as VARCHAR(160)
SET @SUBDEL =?
SET @ANIO =?

if @SUBDEL='%'
begin
	SET @SUBDELV ='01'
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'01'+@ANIO)) 
	begin
		SET @TAB_ING1='SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0101'+@ANIO+']'
		SET @TAB_ING1= @TAB_ING1+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3301'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'02'+@ANIO)) 
	begin
		SET @TAB_ING2=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0102'+@ANIO+']'
		SET @TAB_ING2=@TAB_ING2+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3302'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'03'+@ANIO)) 
	begin
		SET @TAB_ING3=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0103'+@ANIO+']'
		SET @TAB_ING3=@TAB_ING3+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3303'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'04'+@ANIO)) 
	begin
		SET @TAB_ING4=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0104'+@ANIO+']'
		SET @TAB_ING4=@TAB_ING4+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3304'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'05'+@ANIO)) 
	begin
		SET @TAB_ING5=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0105'+@ANIO+']'
		SET @TAB_ING5=@TAB_ING5+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3305'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'06'+@ANIO)) 
	begin
		SET @TAB_ING6=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0106'+@ANIO+']'
		SET @TAB_ING6=@TAB_ING6+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3306'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'07'+@ANIO)) 
	begin
		SET @TAB_ING7=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0107'+@ANIO+']'
		SET @TAB_ING7=@TAB_ING7+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3307'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'08'+@ANIO)) 
	begin
		SET @TAB_ING8=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0108'+@ANIO+']'
		SET @TAB_ING8=@TAB_ING8+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3308'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'09'+@ANIO)) 
	begin
		SET @TAB_ING9=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0109'+@ANIO+']'
		SET @TAB_ING9=@TAB_ING9+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3309'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'10'+@ANIO)) 
	begin
		SET @TAB_ING10=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0110'+@ANIO+']'
		SET @TAB_ING10=@TAB_ING10+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3310'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'11'+@ANIO)) 
	begin
		SET @TAB_ING11=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0111'+@ANIO+']'
		SET @TAB_ING11=@TAB_ING11+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3311'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDELV+'12'+@ANIO)) 
	begin
		SET @TAB_ING12=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio0112'+@ANIO+']'
		SET @TAB_ING12=@TAB_ING12+' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio3312'+@ANIO+']'
	end
end
else
begin
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'01'+@ANIO)) 
	begin
		SET @TAB_ING1='SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'01'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'02'+@ANIO)) 
	begin
		SET @TAB_ING2=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'02'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'03'+@ANIO)) 
	begin
		SET @TAB_ING3=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'03'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'04'+@ANIO)) 
	begin
		SET @TAB_ING4=' union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'04'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'05'+@ANIO)) 
	begin
		SET @TAB_ING5='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'05'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'06'+@ANIO)) 
	begin
		SET @TAB_ING6='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'06'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'07'+@ANIO)) 
	begin
		SET @TAB_ING7='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'07'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'08'+@ANIO)) 
	begin
		SET @TAB_ING8='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'08'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'09'+@ANIO)) 
	begin
		SET @TAB_ING9='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'09'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'10'+@ANIO)) 
	begin
		SET @TAB_ING10='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'10'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'11'+@ANIO)) 
	begin
		SET @TAB_ING11='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'11'+@ANIO+']'
	end
	if exists(select name from sirecaingresoslgp.dbo.sysobjects where name = ('ingresoslgpprevio'+@SUBDEL+'12'+@ANIO)) 
	begin
		SET @TAB_ING12='union all SELECT * FROM [sirecaingresoslgp].[dbo].[ingresoslgpprevio'+@SUBDEL+'12'+@ANIO+']'
	end
end
exec('
select 
filax
,(case when [CONCEPTO] like ''EMISION%'' then ''EMISION'' else [CONCEPTO] end) as [CONCEPTO]
,sum([META]) as [META]
,sum([LGP]) as [LGP]
,sum([DIFERENCIA]) as [DIFERENCIA]
from
('
+@TAB_ING1+@TAB_ING2+@TAB_ING3+@TAB_ING4+@TAB_ING5+@TAB_ING6+@TAB_ING7+@TAB_ING8+@TAB_ING9+@TAB_ING10+@TAB_ING11+@TAB_ING12+
') as resultado
group by filax,(case when [CONCEPTO] like ''EMISION%'' then ''EMISION'' else [CONCEPTO] end)
order by filax
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
    </style>
</asp:Content>


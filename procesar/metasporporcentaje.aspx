<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="metasporporcentaje.aspx.vb" Inherits="WebSIRECA.metasporporcentaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
        Width="140px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLMes" runat="server" Width="140px">
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
        <asp:Label ID="Label13" runat="server" Text="CORTE DEL DIA"></asp:Label>
    </span>
    <asp:DropDownList ID="DDLDia" runat="server" Width="100px">
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem Value="%">CIERRE</asp:ListItem>
    </asp:DropDownList>
    <span class="add-on">
        <asp:LinkButton CssClass ="btn" ID="LinkButton1" runat="server" BackColor="#F2B63B" >Actualizar</asp:LinkButton>
    </span> 
</div> 
        <table "font-size: 12px;" 
            border="1" bgcolor="#F0F0F0" cellpadding="3" cellspacing="0" 
        align="center">
                                    <tr>
                                            <td class="style1" colspan="6">
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
                                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
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
                                                &nbsp;<asp:Label ID="Label15" runat="server" Text='<%# Eval("ESTIMADO","{0:C}") %>'></asp:Label></td>
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
DECLARE @DIA AS VARCHAR(2)
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
DECLARE @FECHA_PAGO1 AS DATETIME
DECLARE @FECHA_PAGO2 AS DATETIME
DECLARE @FECHA_PAGO3 AS DATETIME
DECLARE @FECHA_PAGO4 AS DATETIME
DECLARE @FECHA_PAGO5 AS DATETIME
DECLARE @PAGO1 AS FLOAT
DECLARE @PAGO2 AS FLOAT
DECLARE @PAGO3 AS FLOAT
DECLARE @PAGO4 AS FLOAT
DECLARE @PAGO5 AS FLOAT
DECLARE @PAGO_T1 AS FLOAT
DECLARE @PAGO_T2 AS FLOAT
DECLARE @PAGO_T3 AS FLOAT
DECLARE @PAGO_T4 AS FLOAT
DECLARE @PAGO_T5 AS FLOAT
DECLARE @PORCENTAJE AS FLOAT
SET @DIA=?
SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
--CALCULANDO PROMEDIO DEL COMPORTAMIENTO DE PAGO
IF @DIA='%'
BEGIN
	SET @FECHA_PAGO1='01/'+@MES+'/'+@ANIO
	SET @FECHA_PAGO2=DATEADD(DAY,-1,DATEADD(MONTH,-3,@FECHA_PAGO1))
	SET @FECHA_PAGO3=DATEADD(DAY,-1,DATEADD(MONTH,-2,@FECHA_PAGO1))
	SET @FECHA_PAGO4=DATEADD(DAY,-1,DATEADD(MONTH,-1,@FECHA_PAGO1))
	SET @FECHA_PAGO5=DATEADD(DAY,-1,DATEADD(MONTH,0,@FECHA_PAGO1))
	SET @FECHA_PAGO1=DATEADD(DAY,-1,DATEADD(MONTH,-4,@FECHA_PAGO1))
END
ELSE
BEGIN
	SET @FECHA_PAGO1=@DIA+'/'+@MES+'/'+@ANIO
	SET @FECHA_PAGO2=DATEADD(MONTH,-4,@FECHA_PAGO1)
	SET @FECHA_PAGO3=DATEADD(MONTH,-3,@FECHA_PAGO1)
	SET @FECHA_PAGO4=DATEADD(MONTH,-2,@FECHA_PAGO1)
	SET @FECHA_PAGO5=DATEADD(MONTH,-1,@FECHA_PAGO1)
	SET @FECHA_PAGO1=DATEADD(MONTH,-5,@FECHA_PAGO1)
END
--DATOS DE PAGO CASO1
	SET @PAGO1=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO1)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO1)
	AND DAY([RC_FEC_MOV])&lt;=DAY(@FECHA_PAGO1)
)
SET @PAGO_T1=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO1)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO1)
)
--DATOS DE PAGO CASO2
SET @PAGO2=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO2)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO2)
	AND DAY([RC_FEC_MOV])&lt;=DAY(@FECHA_PAGO2)
)
SET @PAGO_T2=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO2)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO2)
)
--DATOS DE PAGO CASO3
SET @PAGO3=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO3)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO3)
	AND DAY([RC_FEC_MOV])&lt;=DAY(@FECHA_PAGO3)
)
SET @PAGO_T3=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO3)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO3)
)
--DATOS DE PAGO CASO4
SET @PAGO4=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO4)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO4)
	AND DAY([RC_FEC_MOV])&lt;=DAY(@FECHA_PAGO4)
)
SET @PAGO_T4=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO4)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO4)
)
--DATOS DE PAGO CASO5
SET @PAGO5=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO5)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO5)
	AND DAY([RC_FEC_MOV])&lt;=DAY(@FECHA_PAGO5)
)
SET @PAGO_T5=(SELECT SUM([RC_IMP_TOT])
	FROM [lgp].[dbo].[RC]
	WHERE [RC_MOD] IN ('10','13','17')
	and RC_DOC in ('01','02','03','04','05','06','07')
	and RC_CAJA &lt; 300 AND RC_SUB LIKE @SUBDEL
	AND YEAR([RC_FEC_MOV])=YEAR(@FECHA_PAGO5)
	AND MONTH([RC_FEC_MOV])=MONTH(@FECHA_PAGO5)
)
SET @PORCENTAJE = ((@PAGO1/@PAGO_T1)+(@PAGO2/@PAGO_T2)+(@PAGO3/@PAGO_T3)+(@PAGO4/@PAGO_T4)+(@PAGO5/@PAGO_T5))/5
--FIN DEL CALCULO DEL PROMEDIO
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
select sum(VREC_MOD101317) from (
SELECT sum([RCP_IMP_COP]) as VREC_MOD101317
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='''+@ANIO+''' and month([RCP_FEC_MOV])='''+@MES+'''
and [RCP_PER] between '''+@PERIODO_ANT2+''' and '''+@PERIODO+'''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as VREC_MOD101317
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
) as resultado
)
SET @VREC_MOD101317=(case when @VREC_MOD101317 is null then 0 else @VREC_MOD101317 end)
SET @VMESES_ANT=(
select sum(MESES_ANT) from (
SELECT sum([RCP_IMP_COP]) as MESES_ANT
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='''+@ANIO+''' and month([RCP_FEC_MOV])='''+@MES+'''
and [RCP_PER] between '''+@PERIODO_LIM+''' and '''+@PERIODO_ANT3+'''
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as MESES_ANT
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and (substring(convert(varchar(6),[PeriodoPago]),1,4)+''/''+substring(convert(varchar(6),[PeriodoPago]),5,2))
  between '''+@PERIODO_LIM+''' and '''+@PERIODO_ANT3+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
) as resultado

)
SET @VMESES_ANT=(case when @VMESES_ANT is null then 0 else @VMESES_ANT end)
SET @VANIOS_ANT=(
select sum(ANIOS_ANT) from (
SELECT sum([RCP_IMP_COP]) as ANIOS_ANT
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='''+@ANIO+''' and month([RCP_FEC_MOV])='''+@MES+'''
and [RCP_PER] &lt; '''+@PERIODO_LIM+''' 
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as ANIOS_ANT
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and (substring(convert(varchar(6),[PeriodoPago]),1,4)+''/''+substring(convert(varchar(6),[PeriodoPago]),5,2)) &lt; '''+@PERIODO_LIM+''' 
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
) as resultado
)
SET @VANIOS_ANT=(case when @VANIOS_ANT is null then 0 else @VANIOS_ANT end)

SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=1) as CONCEPTO
,((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')) as META
,((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))*'+@PORCENTAJE+' as ESTIMADO
,@VREC_MOD101317 as PROCESAR
,(@VREC_MOD101317-((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=1 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')))as DIFERENCIA
union all
SELECT ''EMISION('+@EMISION+')'' as CONCEPTO
,('+@EMISION_TABLAS+') as META
,('+@EMISION_TABLAS+')*'+@PORCENTAJE+' as ESTIMADO
,NULL as PROCESAR
,NULL as DIFERENCIA
union all
SELECT ''CARTERA EN MORA'' as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=15 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=15 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')*'+@PORCENTAJE+' as ESTIMADO
,@VANIOS_ANT+@VMESES_ANT as PROCESAR
,((@VMESES_ANT+@VANIOS_ANT)-((select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=15 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''')))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=16) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') *'+@PORCENTAJE+' as ESTIMADO 
,@VMESES_ANT as PROCESAR
,(@VMESES_ANT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=16 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
union all
SELECT (SELECT [MET_CONSEPTO] FROM [sirecacobros].[dbo].[MET_CONSEPTO] WHERE [MET_ID]=17) as CONCEPTO
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') as META
,(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+''') *'+@PORCENTAJE+' as ESTIMADO 
,@VANIOS_ANT as PROCESAR
,(@VANIOS_ANT-(select sum(MET_'+@NOM_MES3+') from sirecacobros.dbo.MET_METAS where MET_ID_CONSEPTO=17 and MET_ANIO='+@ANIO+' and MET_SUBDEL like '''+@SUBDEL+'''))as DIFERENCIA
')
">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDLDia" DefaultValue="5" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2012" Name="?" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                    </asp:SqlDataSource>
                                        <tr align="right">
                                            <td>
                                                <asp:Label ID="Label35" runat="server" Text="TOTALES:" Font-Bold="True"></asp:Label>
                                            </td>
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
                                                
                                                <asp:SqlDataSource ID="SqlDataSourceMetaT0" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"                                                     
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @DIA AS VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
SET @SUBDEL=?
SET @DIA=?
SET @MES=?
SET @ANIO=?
SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,@DIA,@MES,@ANIO) as meta
">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLDia" DefaultValue="01" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                
                                                <asp:Repeater ID="RepeaterMetaT0" runat="server" 
                                                    DataSourceID="SqlDataSourceMetaT0" >
                                                <ItemTemplate >
                                                    <asp:Label ID="LabelMetaT0" runat="server" Font-Bold="True" Font-Size="11pt" 
                                                        Text ='<%# Eval("meta","{0:C}") %>'></asp:Label>
                                                </ItemTemplate>
                                                </asp:Repeater>
                                                
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelLGP" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelDIF" runat="server" Font-Bold="True" Font-Size="11pt"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelP" runat="server" Font-Bold="True" Font-Size="11pt" 
                                                    Text="Label"></asp:Label>
                                            </td>
                                        </tr>
        </table>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
    <div align="center">
        CARGARNDO...
        </div>
    </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" BackColor="White">    
    <div align="center">
    </div>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceCom" 
        Width="900px">
        <Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Name="META" 
                XValueMember="CORTES" YValueMembers="META" 
                CustomProperties="IsXAxisQuantitative=True, DrawingStyle=Cylinder, PointWidth=1, LabelStyle=Top" 
                Label="#VAL{C}" Legend="Legend1" Font="Microsoft Sans Serif, 9pt" 
                MarkerBorderColor="Red" MarkerSize="7" MarkerStyle="Triangle" 
                ToolTip="#VAL{C}" Color="Red">
            </asp:Series>
            <asp:Series Name="RECAUDADO" ChartType="Line" XValueMember="CORTES" 
                YValueMembers="PAGO" CustomProperties="IsXAxisQuantitative=True, DrawingStyle=Cylinder, PointWidth=1, LabelStyle=Bottom" 
                Label="#VAL{C}" Legend="Legend1" Font="Microsoft Sans Serif, 9pt" 
                MarkerBorderColor="Green" MarkerSize="7" MarkerStyle="Diamond" 
                ToolTip="#VAL{C}" Color="Green">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY IsStartedFromZero="False">
                    <MajorGrid LineColor="DarkGray" />
                    <LabelStyle Format="{0:C}" />
                    <ScaleBreakStyle StartFromZero="No" />
                </AxisY>
                <AxisX Maximum="31" Minimum="0" Title="Días" 
                    TitleFont="Microsoft Sans Serif, 8pt, style=Bold">
                    <MajorGrid LineColor="DarkGray" />
                    <LabelStyle Format="{0:d}" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" Alignment="Center" Docking="Top">
                <CellColumns>
                    <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                    <asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                </CellColumns>
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Font="Microsoft Sans Serif, 11pt" Name="Title1" 
                Text="Análisis Recaudación Ingresos Financieros PROCESAR (mdp)">
            </asp:Title>
        </Titles>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceCom" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @NOM_MES as VARCHAR(3)
DECLARE @PAGO_MET1 as FLOAT
DECLARE @PAGO_MET2 as FLOAT
DECLARE @PAGO_MET3 as FLOAT
DECLARE @PAGO_MET4 as FLOAT
DECLARE @PAGO_MET5 as FLOAT
DECLARE @PAGO_MET6 as FLOAT
DECLARE @ESCALA as FLOAT

SET @MES=?
SET @ANIO=?
SET @SUBDEL=?
SET @ESCALA=?
SET @NOM_MES= DATENAME(MONTH,'01/'+@MES+'/'+@ANIO)
SET @PAGO_MET1 = (SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,'5',@MES,@ANIO))
SET @PAGO_MET2 = (SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,'10',@MES,@ANIO))
SET @PAGO_MET3 = (SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,'15',@MES,@ANIO))
SET @PAGO_MET4 = (SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,'20',@MES,@ANIO))
SET @PAGO_MET5 = (SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,'25',@MES,@ANIO))
SET @PAGO_MET6 = (SELECT [sirecacobros].[dbo].[promediopagosdian](@SUBDEL,'%',@MES,@ANIO))

EXEC('
SELECT 
''5'' as CORTES
,'+@PAGO_MET1+'/'+@ESCALA+' AS META
,(
SELECT (CASE WHEN sum([RCP_IMP_COP]) IS NULL THEN 0 ELSE sum([RCP_IMP_COP]) END ) as VREC_MOD101317
from (
select sum(RCP_IMP_COP) as RCP_IMP_COP
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='+@ANIO+' and month([RCP_FEC_MOV])='+@MES+'
and DAY([RCP_FEC_MOV]) &lt;= 5
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as RCP_IMP_COP
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
  and day(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))&lt;=5
) as resultado
)/'+@ESCALA+' AS PAGO
union all
SELECT 
''10'' as CORTES
,'+@PAGO_MET2+'/'+@ESCALA+' AS META
,(
SELECT (CASE WHEN sum([RCP_IMP_COP]) IS NULL THEN 0 ELSE sum([RCP_IMP_COP]) END ) as VREC_MOD101317
FROM (
select sum(RCP_IMP_COP) as RCP_IMP_COP
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='+@ANIO+' and month([RCP_FEC_MOV])='+@MES+'
and DAY([RCP_FEC_MOV]) &lt;= 10
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as RCP_IMP_COP
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
  and day(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))&lt;=10
) as resultado
)/'+@ESCALA+' AS PAGO
union all
SELECT 
''15'' as CORTES
,'+@PAGO_MET3+'/'+@ESCALA+' AS META
,(
SELECT (CASE WHEN sum([RCP_IMP_COP]) IS NULL THEN 0 ELSE sum([RCP_IMP_COP]) END ) as VREC_MOD101317
FROM (
select sum(RCP_IMP_COP) as RCP_IMP_COP
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='+@ANIO+' and month([RCP_FEC_MOV])='+@MES+'
and DAY([RCP_FEC_MOV]) &lt;= 15
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as RCP_IMP_COP
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
  and day(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))&lt;=15
) as resultado
)/'+@ESCALA+' AS PAGO
union all
SELECT 
''20'' as CORTES
,'+@PAGO_MET4+'/'+@ESCALA+' AS META
,(
SELECT (CASE WHEN sum([RCP_IMP_COP]) IS NULL THEN 0 ELSE sum([RCP_IMP_COP]) END ) as VREC_MOD101317
FROM (
select sum(RCP_IMP_COP) as RCP_IMP_COP
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='+@ANIO+' and month([RCP_FEC_MOV])='+@MES+'
and DAY([RCP_FEC_MOV]) &lt;= 20
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as RCP_IMP_COP
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
  and day(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))&lt;=20
) as resultado
)/'+@ESCALA+' AS PAGO
union all
SELECT 
''25'' as CORTES
,'+@PAGO_MET5+'/'+@ESCALA+' AS META
,(
SELECT (CASE WHEN sum([RCP_IMP_COP]) IS NULL THEN 0 ELSE sum([RCP_IMP_COP]) END ) as VREC_MOD101317
FROM (
select sum(RCP_IMP_COP) as RCP_IMP_COP
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='+@ANIO+' and month([RCP_FEC_MOV])='+@MES+'
and DAY([RCP_FEC_MOV]) &lt;= 25
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as RCP_IMP_COP
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
  and day(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))&lt;=25
) as resultado
)/'+@ESCALA+' AS PAGO
UNION ALL
SELECT 
DAY(DATEADD(DAY,-1,DATEADD(MONTH,1,''01/'+@MES+'/'+@ANIO+'''))) as CORTES
,'+@PAGO_MET6+'/'+@ESCALA+' AS META
,(
SELECT (CASE WHEN sum([RCP_IMP_COP]) IS NULL THEN 0 ELSE sum([RCP_IMP_COP]) END ) as VREC_MOD101317
FROM (
select sum(RCP_IMP_COP) as RCP_IMP_COP
FROM [procesar].[dbo].[RCPRO]
where rcp_sub like '''+@SUBDEL+'''
and year([RCP_FEC_MOV])='+@ANIO+' and month([RCP_FEC_MOV])='+@MES+'
and not exists(SELECT [MET_REGPAT] FROM [sirecacobros].[dbo].[MET_PAT_IMSS] where [MET_REGPAT]=substring([RCP_REGPAT],1,10))
and substring([RCP_REGPAT],9,2) in (''10'',''13'',''17'')
union all
SELECT sum([ImporteIMSS]) as RCP_IMP_COP
  FROM [sirecaemisiones].[dbo].[sipare]
  where (
  case 
  when [SubDelegacion]=''MERIDA NORTE'' then ''01''
  when [SubDelegacion]=''MERIDA SUR'' then ''33''
  end
  ) like '''+@SUBDEL+'''
  and year(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@ANIO+'''
  and month(convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+''/''+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103))='''+@MES+'''
) as resultado
)/'+@ESCALA+' AS PAGO
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="1000000" Name="?" />
            </SelectParameters>
    </asp:SqlDataSource>
    </asp:Panel>
    
    </ContentTemplate>
    </asp:UpdatePanel>

    </asp:Content>

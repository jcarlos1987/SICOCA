<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteMaster.Master" CodeBehind="cargaemaebaydepuracion.aspx.vb" Inherits="WebSIRECA.cargaemaebaydepuracion" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >

    <table style="width:100%;">
    <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="CARGA/DEPURACIÓN EMA/EBAPARA PARA EL CONTROL DE PAGO" Font-Bold="True" 
                    Font-Size="Large" ForeColor="#293955"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" Text="PASO 1)" Font-Bold="True" 
                    Font-Size="Large" ForeColor="#293955"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:DropDownList ID="DDLSubdel" runat="server">
                </asp:DropDownList>
                <asp:Label ID="Label4" runat="server" Text="PERIODO:"></asp:Label>
                            <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True">
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
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" 
                                AutoPostBack="True">
                            </asp:DropDownList>
            </td>
            <td>
                <asp:GridView ID="GVMaster" runat="server" ShowHeader="False" Font-Bold="True" 
                    Font-Italic="True" Font-Size="XX-Large" ForeColor="#CC0000">
                </asp:GridView>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" Text="PASO 2)" Font-Bold="True" 
                    Font-Size="Large" ForeColor="#293955"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="BCargaEmaEba" runat="server" Text="Cargar EMA y/o EBA" 
                    Font-Size="Large" Height="81px" Width="289px" BackColor="#BCC7D8" 
                    BorderColor="#293955" BorderStyle="Solid" BorderWidth="1px" 
                    ForeColor="#293955" />
                <asp:SqlDataSource ID="SqlDataSourceCargaEmaEba" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MES as VARCHAR(2)
DECLARE @MES_EBA as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @ANIO2 as VARCHAR(4)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @DEL as VARCHAR(2)
SET @DEL=?
SET @SUBDEL=?
SET @MES=?
SET @ANIO=?
SET @MES_EBA=(case len((@MES/2)) when 1 then ('0'+convert(varchar,(@MES/2))) else convert(varchar,(@MES/2)) end)
SET @ANIO2=(@MES+substring(@ANIO,3,2))

--------------datos COP=EMA
exec(
'INSERT INTO [sireca].[dbo].[eco]
           (
           [REG#PATRONAL]
           ,[TP]
           ,[NOMBRE O RAZON SOCIAL]
           ,[CREDITO]
           ,[COTIZ]
           ,[DIAS]
           ,[CL]
           ,[ACT#]
           ,[PRIMA]
           ,[OMISION]
           ,[COP/ACT]
           ,[RECARGOS]
           ,[MULTA]
           ,[TOTAL]
           ,[fechaEco]
           ,[responsable]
           ,[fechaSeleccion]
           ,[cambiarIncidencia]
           ,[tipoECO]
           ,[diasDisponibles]
           ,[clave]
           ,[incidencia]
           ,[nomResponsable]
           ,[horaCitatorio]
           ,[fechaCaptura]
           ,[ecoOriginal]
           ,[cobrarMulta]
           ,[subdel]
           ,[sector]
           ,[grado1]
           ,[grado2]
           ,[grado3]
           ,[responsablePae]
           ,[cambiarIncidenciaPae]
           ,[fechaSeleccionPae]
           ,[validacion]
           ,[pago]
           ,[fech_pago]
           ,[incidenciarale]
           ,[tdrale])
select substring(EMIP_patron,2,11) as [REG#PATRONAL],EMIP_DOC as TD,EMIP_nom_patron as [NOMBRE O RAZON SOCIAL]
,substring(EMIP_num_cred,2,9) as CREDITO,EMIP_num_trab_cot as COTIZ,EMIP_dias as DIAS
,null as CL,null as [ACT#], EMIP_PRIMA_RT as PRIMA
,(
EMIP_IMP_EYM_FIJA+EMIP_IMP_EYM_EXCE+
EMIP_IMP_EYM_PRED+EMIP_IMP_EYM_PREE+EMIP_IMP_INV_VIDA+EMIP_IMP_RIES_TRA+
EMIP_IMP_GUAR+ EMIP_IMP_INV_VIDA_O+EMIP_IMP_EYM_EXCE_O+EMIP_IMP_EYM_PRED_O+
EMIP_IMP_EYM_PREE_O
) as OMISION,null as [COM/ACT],null as RECARGOS,null as MULTA, NULL AS TOTAL,(CONVERT(FLOAT,convert(varchar,emip_bim_emisi)+convert(varchar,emip_anu_emisi))) AS fechaeco
,NULL AS responsable,NULL AS fechaSeleccion,''9'' AS cambiarincidencia,''EMA'' AS tipoEco,''0'' AS diasDisponibles
,NULL AS clave,NULL AS incidencia,NULL AS nomResponsable,NULL AS horaCitatorio
,NULL AS fechaCaptura,NULL AS ecoOriginal,''0'' AS cobrarMulta
,'''+@SUBDEL+''' AS subdel
,EMIP_SEC AS sector,''0000'' AS grado1
,NULL AS grado2,NULL AS grado3,NULL AS responsablePae,NULL AS cambiarIncidenciaPae,NULL AS fechaSeleccionPae
,NULL AS validacion,NULL AS pago,NULL AS fech_pago,NULL AS incidenciarale,NULL AS tdrale
FROM OPENROWSET( ''Microsoft.Jet.OLEDB.4.0'', ''D:\CDDATA\'+@ANIO2+'\EMIS'+@DEL+@SUBDEL+'.mdb'';''Admin'';'''', ''SELECT * FROM cdempa'+@MES+@ANIO+''') 
where not exists(select ecoac.[REG#PATRONAL] from [sireca].[dbo].[eco] as ecoac where ecoac.fechaeco='+@MES+@ANIO+' and tipoeco in (''COP'',''COMP'',''EMA'') and ecoac.[REG#PATRONAL]=substring(EMIP_patron,2,11))
')
--------------datos RCV=EBA
if (@MES%2)=0
begin
exec(
'INSERT INTO [sireca].[dbo].[eco]
           (
           [REG#PATRONAL]
           ,[TP]
           ,[NOMBRE O RAZON SOCIAL]
           ,[CREDITO]
           ,[COTIZ]
           ,[DIAS]
           ,[CL]
           ,[ACT#]
           ,[PRIMA]
           ,[OMISION]
           ,[COP/ACT]
           ,[RECARGOS]
           ,[MULTA]
           ,[TOTAL]
           ,[fechaEco]
           ,[responsable]
           ,[fechaSeleccion]
           ,[cambiarIncidencia]
           ,[tipoECO]
           ,[diasDisponibles]
           ,[clave]
           ,[incidencia]
           ,[nomResponsable]
           ,[horaCitatorio]
           ,[fechaCaptura]
           ,[ecoOriginal]
           ,[cobrarMulta]
           ,[subdel]
           ,[sector]
           ,[grado1]
           ,[grado2]
           ,[grado3]
           ,[responsablePae]
           ,[cambiarIncidenciaPae]
           ,[fechaSeleccionPae]
           ,[validacion]
           ,[pago]
           ,[fech_pago]
           ,[incidenciarale]
           ,[tdrale])
select substring(ebip_patron,2,11) as [REG#PATRONAL],EBIP_DOC as TD,ebip_nom_patron as [NOMBRE O RAZON SOCIAL]
,substring(ebip_num_cred,2,9) as CREDITO,ebip_num_trab_cot as COTIZ,ebip_dias as DIAS
,null as CL,null as [ACT#], null as PRIMA
,EBIP_SUMA as OMISION,null as [COM/ACT],null as RECARGOS,null as MULTA, NULL AS TOTAL,(CONVERT(FLOAT,convert(varchar,(ebip_bim_emisi*2))+convert(varchar,ebip_anu_emisi))) AS fechaeco
,NULL AS responsable,NULL AS fechaSeleccion,''9'' AS cambiarincidencia,''EBA'' AS tipoEco,''0'' AS diasDisponibles
,NULL AS clave,NULL AS incidencia,NULL AS nomResponsable,NULL AS horaCitatorio
,NULL AS fechaCaptura,NULL AS ecoOriginal,''0'' AS cobrarMulta
,'''+@SUBDEL+''' AS subdel
,EBIP_SEC AS sector,''0000'' AS grado1
,NULL AS grado2,NULL AS grado3,NULL AS responsablePae,NULL AS cambiarIncidenciaPae,NULL AS fechaSeleccionPae
,NULL AS validacion,NULL AS pago,NULL AS fech_pago,NULL AS incidenciarale,NULL AS tdrale
FROM OPENROWSET( ''Microsoft.Jet.OLEDB.4.0'', ''D:\CDDATA\'+@ANIO2+'\EMIS'+@DEL+@SUBDEL+'.mdb'';''Admin'';'''', ''SELECT * FROM cdebpa'+@MES_EBA+@ANIO+''') 
where not exists(select ecoac.[REG#PATRONAL] from [sireca].[dbo].[eco] as ecoac where ecoac.fechaeco='+@MES+@ANIO+' and tipoeco in (''RCV'',''RCVCOMP'',''EBA'') and ecoac.[REG#PATRONAL]=substring(EBIP_patron,2,11))
')
end
--------------------remplazo # por Ñ
update [sireca].[dbo].[eco]
set [NOMBRE O RAZON SOCIAL]=replace([NOMBRE O RAZON SOCIAL],'#','Ñ')
FROM [sireca].[dbo].[eco]
where fechaeco=(@MES+@ANIO)
and [NOMBRE O RAZON SOCIAL] like '%#%'

select 'Carga Completa' as resultado">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAdel" />
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" Text="PASO 3)" Font-Bold="True" Font-Size="Large" ForeColor="#293955"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="BDepuracion" runat="server" Text="Depurar" Font-Size="Large" 
                    Height="81px" Width="289px" BackColor="#BCC7D8" BorderColor="#293955" 
                    BorderStyle="Solid" BorderWidth="1px" ForeColor="#293955" />
                <asp:SqlDataSource ID="SqlDataSourceDepuracion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(50)
DECLARE @RALERCV as VARCHAR(50)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @EMISION_CARGADA as VARCHAR(10)
SET @SUBDEL=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @EMISION_CARGADA=(
select top 1
(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end)
as fechaecox
from sireca.dbo.eco
where tipoeco in ('COP','RCV','COMP','RCVCOMP')
order by convert(datetime,(case when len(fechaeco)=5 then '01/0'+substring(convert(nvarchar(5),fechaeco),1,1)+'/'+substring(convert(nvarchar(5),fechaeco),2,4) else '01/'+substring(convert(nvarchar(6),fechaeco),1,2)+'/'+substring(convert(nvarchar(6),fechaeco),3,4) end),103) desc
)
-------------------------------RESETEO
update [sireca].[dbo].[eco]
set [validacion]='SIN PAGO'
where subdel=@SUBDEL
--and (validacion is null or validacion in ('LGP PARCIAL','PROCESAR PARCIAL')
-------------------------------DEPURACION LGP
update [sireca].[dbo].[eco]
set [validacion]=(
case 
when lgp.total is null then 'SIN PAGO'
when lgp.total&gt;=omision then 'LGP COMPLETO'
when lgp.total&lt;omision then 'LGP PARCIAL' 
end)
,PAGO=LGP.TOTAL
,fech_pago=LGP.FECH_PAGO
FROM [sireca].[dbo].[eco] 
left join
(
select (substring([RC_PATRON],2,8)+[RC_MOD]) as patronal,RC_PER,sum(RC_IMP_TOT) as total,max(RC_FEC_MOV) as FECH_PAGO
from [lgp].[dbo].[RC]
group by (substring([RC_PATRON],2,8)+[RC_MOD]),RC_PER
) as lgp on 
substring([REG#PATRONAL],1,10)=lgp.patronal
and fechaeco=(substring([RC_PER],6,2)+substring([RC_PER],1,4))
where subdel=@SUBDEL
and tipoeco in ('COP','COMP','EMA')
and validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL','PROCESAR COMPLETO')
-------------------------------DEPURACION PROCESAR COP
update [sireca].[dbo].[eco]
set [validacion]=(
case 
when PRO.total is null then 'SIN PAGO'
when PRO.total = '0' then 'SIN PAGO'
when PRO.total&gt;=omision then 'PROCESAR COMPLETO' 
when PRO.total&lt;omision then 'PROCESAR PARCIAL' 
end)
,PAGO=PRO.TOTAL
,fech_pago=PRO.FECH_PAGO
FROM [sireca].[dbo].[eco] 
left join 
(
select [RCP_REGPAT],[RCP_PER],sum(RCP_IMP_COP) as TOTAL,max(RCP_FEC_MOV) as FECH_PAGO 
from [procesar].[dbo].[RCPRO]
group by  [RCP_REGPAT],[RCP_PER]
) as PRO
on [REG#PATRONAL]=PRO.[RCP_REGPAT]
and fechaeco=(substring([RCP_PER],6,2)+substring([RCP_PER],1,4))
where subdel=@SUBDEL 
and tipoeco in ('COP','COMP','EMA')
and validacion in ('SIN PAGO','PROCESAR PARCIAL')
-------------------------------DEPURACION PROCESAR RCV
update [sireca].[dbo].[eco]
set [validacion]=(
case 
when PRO.total is null then 'SIN PAGO'
when PRO.total = '0' then 'SIN PAGO'
when PRO.total&gt;=omision then 'PROCESAR COMPLETO' 
when PRO.total&lt;omision then 'PROCESAR PARCIAL' 
end)
,PAGO=PRO.TOTAL
,fech_pago=PRO.FECH_PAGO
FROM [sireca].[dbo].[eco]
left join 
(
select [RCP_REGPAT],[RCP_PER],sum(RCP_IMP_RCV) as TOTAL,max(RCP_FEC_MOV) as FECH_PAGO
from [procesar].[dbo].[RCPRO] 
group by [RCP_REGPAT],[RCP_PER]
) as PRO
on [REG#PATRONAL]=PRO.[RCP_REGPAT] 
and fechaeco=(substring([RCP_PER],6,2)+substring([RCP_PER],1,4))
where subdel=@SUBDEL and tipoeco in ('RCV','RCVCOMP','EBA')
and validacion in ('SIN PAGO','PROCESAR PARCIAL')
-------------------------------DEPURACION RALE COP y RCV
exec(
'update [sireca].[dbo].[eco] 
set incidenciarale=rale.inc
,tdrale=rale.td
FROM [sireca].[dbo].[eco] left join (select [REGPATR],[NUMCRED],PERIODO,[INC],[TD] from rale.dbo.['+@RALECOP+'] WHERE INC not in (''00'') union all select [REGPATR],[NUMCRED],PERIODO,[INC],[TD] from rale.dbo.['+@RALERCV+'] WHERE INC not in (''00'') ) as rale
on substring([REG#PATRONAL],1,10)=replace(rale.[REGPATR],''-'','''') and credito=rale.[NUMCRED]
where subdel='''+@SUBDEL+'''
')
exec(
'update [sireca].[dbo].[eco] 
set validacion=(case when incidenciarale is null then ''DEPURADO RALE'' else (validacion) end)
FROM [sireca].[dbo].[eco]
where validacion in (''LGP COMPLETO'',''SIN PAGO'',''PROCESAR COMPLETO'')
and subdel='''+@SUBDEL+'''
and fechaeco not in (convert(nvarchar(2),month('''+@EMISION_CARGADA+'''))+convert(nvarchar(4),year('''+@EMISION_CARGADA+''')))
')

select 'Depuracion Completa' as resultado
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="BDepuracionPro" runat="server" Text="Depurar POR PROCESAR" Font-Size="Large" 
                    Height="81px" Width="289px" BackColor="#BCC7D8" BorderColor="#293955" 
                    BorderStyle="Solid" BorderWidth="1px" ForeColor="#293955" 
                    Visible="False" />
                <asp:SqlDataSource ID="SqlDataSourceDepuracionPRO" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
-------------------------------DEPURACION PROCESAR COP
update [sireca].[dbo].[eco]
set [validacion]=(
case 
when PRO.total is null then 'SIN PAGO'
when PRO.total = '0' then 'SIN PAGO'
when PRO.total&gt;=omision then 'PROCESAR COMPLETO' 
when PRO.total&lt;omision then 'PROCESAR PARCIAL' 
end)
,PAGO=PRO.TOTAL
,fech_pago=PRO.FECH_PAGO
FROM [sireca].[dbo].[eco]
left join 
(select [RCP_REGPAT],[RCP_PER],sum(RCP_IMP_COP) as TOTAL, max(RCP_FEC_MOV) as FECH_PAGO from [procesar].[dbo].[RCPRO] group by  [RCP_REGPAT],[RCP_PER]) as PRO
on [REG#PATRONAL]=PRO.[RCP_REGPAT] and (substring([RCP_PER],6,2)+substring([RCP_PER],1,4))=fechaeco
where subdel=@SUBDEL and tipoeco in ('COP','COMP','EMA')
and validacion in ('SIN PAGO','PROCESAR PARCIAL')
-------------------------------DEPURACION PROCESAR RCV
update [sireca].[dbo].[eco]
set [validacion]=(
case 
when PRO.total is null then 'SIN PAGO'
when PRO.total = '0' then 'SIN PAGO'
when PRO.total&gt;=omision then 'PROCESAR COMPLETO' 
when PRO.total&lt;omision then 'PROCESAR PARCIAL' 
end)
,PAGO=PRO.TOTAL
,fech_pago=PRO.FECH_PAGO
FROM [sireca].[dbo].[eco]
left join 
(select [RCP_REGPAT],[RCP_PER],sum(RCP_IMP_RCV) as TOTAL,max(RCP_FEC_MOV) as FECH_PAGO from [procesar].[dbo].[RCPRO] group by  [RCP_REGPAT],[RCP_PER]) as PRO
on [REG#PATRONAL]=PRO.[RCP_REGPAT] and (substring([RCP_PER],6,2)+substring([RCP_PER],1,4))=fechaeco
where subdel=@SUBDEL and tipoeco in ('RCV','RCVCOMP','EBA')
and validacion in ('SIN PAGO','PROCESAR PARCIAL')

select 'Depuracion por PROCESAR Completa' as resultado
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style3
        {
            width: 61px;
        }
        .style4
        {
            width: 7px;
        }
    </style>
</asp:Content>


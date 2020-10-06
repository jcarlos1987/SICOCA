<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master"  AutoEventWireup="false" CodeBehind="cargarProcesar.aspx.vb" Inherits="WebSIRECA.cargarProcesar" %>
<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="conten1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
        <div>
            <asp:Label ID="Label3" runat="server" Text="CARGA DEL PROCESAR"></asp:Label><asp:Label
        ID="Label4" runat="server" Text="(Archivo Nativo.)" 
                Font-Italic="True" ForeColor="#FF3300"></asp:Label><hr />
        <asp:DropDownList ID="DDLDel" runat="server">
            <asp:ListItem Value="16">ESTADO DE MEXICO PONIENTE</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>
     <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Cargar" />
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
FROM [sireca].[dbo].[eco]
left join 
(select [RCP_REGPAT],[RCP_PER],sum(RCP_IMP_COP) as TOTAL from [procesar].[dbo].[RCPRO] group by  [RCP_REGPAT],[RCP_PER]) as PRO
on [REG#PATRONAL]=PRO.[RCP_REGPAT] and convert(float,(substring([RCP_PER],6,2)+substring([RCP_PER],1,4)))=fechaeco
where subdel=@SUBDEL and tipoeco in ('COP','COMP')
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
FROM [sireca].[dbo].[eco]
left join 
(select [RCP_REGPAT],[RCP_PER],sum(RCP_IMP_RCV) as TOTAL from [procesar].[dbo].[RCPRO] group by  [RCP_REGPAT],[RCP_PER]) as PRO
on [REG#PATRONAL]=PRO.[RCP_REGPAT] and convert(float,(substring([RCP_PER],6,2)+substring([RCP_PER],1,4)))=fechaeco
where subdel=@SUBDEL and tipoeco in ('RCV','RCVCOMP')
and validacion in ('SIN PAGO','PROCESAR PARCIAL')

--------------------------------------------------------------------------------------
--DEPURACION COP
update [sireca].[dbo].[eco]
set cambiarIncidencia = '1'
,horaCitatorio = null
,diasDisponibles = '0'
,incidencia = 'POR PROCESAR'
FROM [sireca].[dbo].[eco] as eco 
inner join 
(
select p.RCP_REGPAT as RCP_REGPAT,substring(p.[RCP_PER],6,2)+substring(p.[RCP_PER],1,4) as RCP_PER, sum(p.RCP_IMP_COP) as importe 
from [procesar].[dbo].[RCPRO] as p 
group by p.RCP_REGPAT,p.RCP_PER
) as pro on eco.REG#PATRONAL = pro.RCP_REGPAT and eco.fechaeco=pro.[RCP_PER]
WHERE
eco.subdel=@SUBDEL
AND eco.tipoeco in ('COP','COMP')
AND (eco.incidencia not in ('POR PROCESAR','PAGADO','RE','BD') or eco.incidencia is null)
AND pro.importe&gt;=(eco.omision*0.5)
--DEPURACION RCV
update [sireca].[dbo].[eco]
set cambiarIncidencia = '1'
,horaCitatorio = null
,diasDisponibles = '0'
,incidencia = 'POR PROCESAR'
FROM [sireca].[dbo].[eco] as eco 
inner join 
(
select p.RCP_REGPAT as RCP_REGPAT,substring(p.[RCP_PER],6,2)+substring(p.[RCP_PER],1,4) as RCP_PER, sum(p.RCP_IMP_RCV) as importe 
from [procesar].[dbo].[RCPRO] as p 
group by p.RCP_REGPAT,p.RCP_PER
) as pro on eco.REG#PATRONAL = pro.RCP_REGPAT and eco.fechaeco=pro.[RCP_PER]
WHERE
eco.subdel=@SUBDEL
AND eco.tipoeco in ('RCV','RCVCOMP')
AND (eco.incidencia not in ('POR PROCESAR','PAGADO','RE','BD','SIPARE') or eco.incidencia is null)
AND pro.importe&gt;=(eco.omision*0.5)

select 'Depuracion por PROCESAR Completa' as resultado
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#009900"></asp:Label><br />
        <asp:Label ID="Label2" runat="server" 
            Text="" 
            Font-Bold="True" ForeColor="#003300"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" Font-Bold="True" Font-Italic="True" 
                Font-Size="Large" ForeColor="#CC0000" ShowHeader="False">
            </asp:GridView>
    </div>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteMaster.Master"  AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default37" %>

<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
    
                    <asp:DropDownList ID="DDLSubdel" runat="server" Width="210px" 
                           AutoPostBack="True">
                        </asp:DropDownList>
                        TIPO DE E.C.O.:<asp:DropDownList ID="DropDownListTIPO" runat="server" 
                        AutoPostBack="True">
                        <asp:ListItem Value="%">TODOS</asp:ListItem>
                        <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
                        <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
                    </asp:DropDownList>
                    PERIODO:
                        <asp:DropDownList ID="DDLMes" runat="server">
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
                    <asp:DropDownList ID="DDLAnio" runat="server">
                    </asp:DropDownList>
                        &nbsp;al
                        <asp:DropDownList ID="DDLMes0" runat="server">
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
                    <asp:DropDownList ID="DDLAnio0" runat="server">
                    </asp:DropDownList>
                        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Height="19px">&nbsp;ACTUALIZAR&nbsp;</asp:LinkButton>
                        <asp:LinkButton ID="LBDepurar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Height="19px">&nbsp;DEPURAR&nbsp;</asp:LinkButton>
    <hr />
        <asp:GridView ID="GridViewRInc" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceRInc" HorizontalAlign="Center" ShowFooter="True" 
                        BorderStyle="Solid" CellPadding="1" CellSpacing="1" AllowSorting="True" 
                        Caption="POR INCIDENCIA" EmptyDataText="SIN RESULTADO(S)">
            <Columns>
                <asp:BoundField DataField="periodo" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="periodo" />
                <asp:BoundField DataField="inc" HeaderText="INC" ReadOnly="True" 
                    SortExpression="inc" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES">
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
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceRInc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PER_INI as DATETIME
DECLARE @PER_FIN as DATETIME
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_FILE as VARCHAR(3)
SET @PER_INI='01/'+?+'/'+?
SET @PER_FIN='01/'+?+'/'+?
SET @SUBDEL=?
SET @TIPO_FILE=?
--------------------------------------------------------------
INSERT sireca.dbo.ecocontrol
SELECT [REG#PATRONAL] as REGPAT     
,replace([NOMBRE O RAZON SOCIAL],'#','Ñ') as RAZON
,[CREDITO]
,[COTIZ]
,[OMISION]
,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) as PERIODO
,[responsable] AS INSPECTOR
,[tipoECO] AS TIPO
,[incidencia] AS INC
,[fechaCaptura] AS FECH_CAP
,[subdel] AS SUBDEL
,[sector] AS SECTOR
,[validacion] AS VALIDACION
,[pago] AS PAGO
,[incidenciarale] AS INC_RALE
,[tdrale] AS TD_RALE
,[fech_pago] AS FECH_PAGO
,'1' as CICLO_CAP
FROM [sireca].[dbo].[eco] as eco
WHERE TIPOECO IN ('COP','COMP','RCV','RCVCOMP')
AND NOT EXISTS(
SELECT REGPAT 
FROM sireca.dbo.ecocontrol as ecocont 
WHERE ecocont.REGPAT=eco.[REG#PATRONAL]
and ecocont.[CREDITO]=eco.[CREDITO]
and ecocont.PERIODO=(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
)
-------------------------------------------------------
select
'...' as periodo
,'...' as COTIZANTES
,inc
,count(distinct(regpat)) as PATRONES
,count(*) as CREDITOS
,sum(omision) as IMPORTE 
from 
(
select '...' as periodo
,'...' as COTIZANTES
,(
case ciclo_cap
when 1 then case when (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=inc) is null then 'SIN ACCIONES' else (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=inc) end
when 2 then case when (SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=inc) is null then 'SIN ACCIONES' else (SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=inc) end
when 4 then  (SELECT incr.[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.[inc]=econt.inc)
else inc end
) as inc
,regpat
,omision
from [sireca].[dbo].[ecocontrol] as econt
where convert(datetime,'01/'+PERIODO,103) between @PER_INI and @PER_FIN
and subdel like @SUBDEL
and (case when eco in ('COP','COMP') then 'COP' else 'RCV' end) like @TIPO_FILE
) as result
group by inc
order by inc
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownListTIPO" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
                    </asp:SqlDataSource>
    
                    <asp:GridView ID="GridViewRPeriodoInc" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="SqlDataSourceRPeriodoInc" 
                        HorizontalAlign="Center" ShowFooter="True" BorderStyle="Solid" 
                        CellPadding="1" CellSpacing="1" AllowSorting="True" 
                        Caption="POR PERIODO Y INCIDENCIA" EmptyDataText="SIN RESULTADO(S)">
                        <Columns>
                            <asp:BoundField DataField="periodo" HeaderText="PERIODO" ReadOnly="True" 
                                SortExpression="periodo" />
                            <asp:BoundField DataField="inc" HeaderText="INC" ReadOnly="True" 
                                SortExpression="inc" />
                            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" DataFormatString="{0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                HeaderText="COTIZANTES" SortExpression="COTIZANTES">
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
                        <HeaderStyle BackColor="#BCC7D8" />
                    </asp:GridView>
    
                    <asp:SqlDataSource ID="SqlDataSourceRPeriodoInc" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PER_INI as DATETIME
DECLARE @PER_FIN as DATETIME
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_FILE as VARCHAR(3)
SET @PER_INI='01/'+?+'/'+?
SET @PER_FIN='01/'+?+'/'+?
SET @SUBDEL=?
SET @TIPO_FILE=?
select
periodo
,sum(cotiz) as COTIZANTES
,inc
,count(distinct(regpat)) as PATRONES
,count(*) as CREDITOS
,sum(omision) as IMPORTE 
from 
(
select periodo
,cotiz
,(
case ciclo_cap
when 1 then case when (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=inc) is null then 'SIN ACCIONES' else (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=inc) end
when 2 then case when (SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=inc) is null then 'SIN ACCIONES' else (SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=inc) end
when 4 then  (SELECT incr.[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.[inc]=econt.inc)
else inc end
) as inc
,regpat
,omision
from [sireca].[dbo].[ecocontrol] as econt
where convert(datetime,'01/'+PERIODO,103) between @PER_INI and @PER_FIN
and subdel like @SUBDEL
and (case when eco in ('COP','COMP') then 'COP' else 'RCV' end) like @TIPO_FILE
) as result
group by periodo,inc
order by inc
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownListTIPO" DefaultValue="%" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    
    </div>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteGeneral.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default28" %>
<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="SUBDEL:"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>
                            <asp:DropDownList ID="DDLMes" runat="server" 
            AutoPostBack="True">
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
                            <asp:Button ID="BExportar" runat="server" Text="EXPORTAR" />
                            <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" Font-Size="8pt">
                                <Columns>
                                    <asp:BoundField DataField="pagos" DataFormatString="{0:C}" HeaderText="pagos" 
                                        SortExpression="pagos" />
                                    <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                                        ReadOnly="True" SortExpression="REG#PATRONAL" />
                                    <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                                        SortExpression="TD" />
                                    <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                                        HeaderText="NOMBRE O RAZON SOCIAL" ReadOnly="True" 
                                        SortExpression="NOMBRE O RAZON SOCIAL" />
                                    <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                                        SortExpression="CREDITO" />
                                    <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                                        SortExpression="COTIZ" />
                                    <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
                                        SortExpression="DIAS" />
                                    <asp:BoundField DataField="CL" HeaderText="CL" ReadOnly="True" 
                                        SortExpression="CL" />
                                    <asp:BoundField DataField="ACT#" HeaderText="ACT#" ReadOnly="True" 
                                        SortExpression="ACT#" />
                                    <asp:BoundField DataField="PRIMA" HeaderText="PRIMA" ReadOnly="True" 
                                        SortExpression="PRIMA" />
                                    <asp:BoundField DataField="OMISION" HeaderText="OMISION" ReadOnly="True" 
                                        SortExpression="OMISION" />
                                    <asp:BoundField DataField="COP/ACT" HeaderText="COP/ACT" ReadOnly="True" 
                                        SortExpression="COP/ACT" />
                                    <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" ReadOnly="True" 
                                        SortExpression="RECARGOS" />
                                    <asp:BoundField DataField="MULTA" HeaderText="MULTA" ReadOnly="True" 
                                        SortExpression="MULTA" />
                                    <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                                        SortExpression="TOTAL" />
                                    <asp:BoundField DataField="fechaEco" HeaderText="fechaEco" ReadOnly="True" 
                                        SortExpression="fechaEco" />
                                    <asp:BoundField DataField="responsable" HeaderText="responsable" 
                                        ReadOnly="True" SortExpression="responsable" />
                                    <asp:BoundField DataField="fechaSeleccion" HeaderText="fechaSeleccion" 
                                        ReadOnly="True" SortExpression="fechaSeleccion" />
                                    <asp:BoundField DataField="cambiarIncidencia" HeaderText="cambiarIncidencia" 
                                        ReadOnly="True" SortExpression="cambiarIncidencia" />
                                    <asp:BoundField DataField="tipoECO" HeaderText="tipoECO" ReadOnly="True" 
                                        SortExpression="tipoECO" />
                                    <asp:BoundField DataField="diasDisponibles" HeaderText="diasDisponibles" 
                                        ReadOnly="True" SortExpression="diasDisponibles" />
                                    <asp:BoundField DataField="clave" HeaderText="clave" ReadOnly="True" 
                                        SortExpression="clave" />
                                    <asp:BoundField DataField="incidencia" HeaderText="incidencia" ReadOnly="True" 
                                        SortExpression="incidencia" />
                                    <asp:BoundField DataField="nomResponsable" HeaderText="nomResponsable" 
                                        ReadOnly="True" SortExpression="nomResponsable" />
                                    <asp:BoundField DataField="horaCitatorio" HeaderText="horaCitatorio" 
                                        ReadOnly="True" SortExpression="horaCitatorio" />
                                    <asp:BoundField DataField="fechaCaptura" HeaderText="fechaCaptura" 
                                        ReadOnly="True" SortExpression="fechaCaptura" />
                                    <asp:BoundField DataField="ecoOriginal" HeaderText="ecoOriginal" 
                                        ReadOnly="True" SortExpression="ecoOriginal" />
                                    <asp:BoundField DataField="cobrarMulta" HeaderText="cobrarMulta" 
                                        ReadOnly="True" SortExpression="cobrarMulta" />
                                    <asp:BoundField DataField="subdel" HeaderText="subdel" ReadOnly="True" 
                                        SortExpression="subdel" />
                                    <asp:BoundField DataField="sector" HeaderText="sector" ReadOnly="True" 
                                        SortExpression="sector" />
                                    <asp:BoundField DataField="grado1" HeaderText="grado1" ReadOnly="True" 
                                        SortExpression="grado1" />
                                    <asp:BoundField DataField="grado2" HeaderText="grado2" ReadOnly="True" 
                                        SortExpression="grado2" />
                                    <asp:BoundField DataField="grado3" HeaderText="grado3" ReadOnly="True" 
                                        SortExpression="grado3" />
                                    <asp:BoundField DataField="responsablePae" HeaderText="responsablePae" 
                                        ReadOnly="True" SortExpression="responsablePae" />
                                    <asp:BoundField DataField="cambiarIncidenciaPae" 
                                        HeaderText="cambiarIncidenciaPae" ReadOnly="True" 
                                        SortExpression="cambiarIncidenciaPae" />
                                    <asp:BoundField DataField="fechaSeleccionPae" HeaderText="fechaSeleccionPae" 
                                        ReadOnly="True" SortExpression="fechaSeleccionPae" />
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO as VARCHAR(4)
DECLARE @ANIO2 as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
SET @ANIO=?
SET @MES=?
SET @SUBDEL=?
SET @ANIO2=substring(@ANIO,3,2)
exec(
'SELECT  
pagos.pagos as pagos
,substring(EMA.emip_patron,2,11) as [REG#PATRONAL]
,EMA.emip_doc as TD
,EMA.emip_nom_patron as [NOMBRE O RAZON SOCIAL]
,substring(EMA.emip_num_cred,2,9) as [CREDITO]
,EMA.emip_num_trab_cot as COTIZ
,EMA.emip_dias as DIAS
,'''' as [CL]
,'''' as [ACT#]
,EMA.emip_prima_rt as [PRIMA]
,(EMA.EMIP_IMP_EYM_FIJA+EMA.EMIP_IMP_EYM_EXCE+EMA.EMIP_IMP_EYM_PRED +
EMA.EMIP_IMP_EYM_PREE +EMA.EMIP_IMP_INV_VIDA+EMA.EMIP_IMP_RIES_TRA+EMA.EMIP_IMP_GUAR +
EMA.EMIP_IMP_INV_VIDA_O+EMA.EMIP_IMP_EYM_EXCE_O+EMA.EMIP_IMP_EYM_PRED_O + EMA.EMIP_IMP_EYM_PREE_O) as [OMISION]
,''0'' as [COP/ACT]
,''0'' as [RECARGOS]
,''0'' as [MULTA]
,''0'' as [TOTAL]
,('+@MES+@ANIO+') as [fechaEco]
,null as [responsable]
,null as [fechaSeleccion]
,''9'' as [cambiarIncidencia]
,''COP'' as [tipoECO]
,''0'' as [diasDisponibles]
,null as [clave]
,null as [incidencia]
,null as [nomResponsable]
,null as [horaCitatorio]
,null as [fechaCaptura]
,null as [ecoOriginal]
,null as [cobrarMulta]
,(case len(EMA.emip_sub) when ''1'' then (''0''+convert(varchar,EMA.emip_sub)) else EMA.emip_sub end) as [subdel]
,emip_sec as [sector]
,''0000'' as [grado1]
,null as [grado2]
,null as [grado3]
,null as [responsablePae]
,''9'' as [cambiarIncidenciaPae]
,null as [fechaSeleccionPae]
FROM  
OPENROWSET( ''Microsoft.Jet.OLEDB.4.0'', ''D:\CDDATA\' + @MES + @ANIO2 + '\EMIS33'+@SUBDEL+'.mdb'';''Admin'';'''', ''SELECT * FROM cdempa'+@MES+@ANIO+''') as EMA  
LEFT JOIN (select left(rcp_regpat,10) as regpat, sum(rcp_imp_cop) as pagos  
from procesar.dbo.rcpro  
where rcp_per = '''+@ANIO+'/'+@MES+'''  
and rcp_imp_cop &gt;0  
group by rcp_regpat) as pagos  
ON Substring(EMA.emip_patron,2,10) = pagos.regpat  
left join (select * from firmaDigital.dbo.info where tipo = 2) as correos  
ON Substring(EMA.emip_patron,2,10) = correos.regpat  
left join (select * from firmaDigital.dbo.info where tipo = 3) as tels  
ON Substring(EMA.emip_patron,2,10) = tels.regpat  
WHERE 
(pagos.pagos&lt;(
EMA.EMIP_IMP_EYM_FIJA+EMA.EMIP_IMP_EYM_EXCE+EMA.EMIP_IMP_EYM_PRED +
EMA.EMIP_IMP_EYM_PREE +
EMA.EMIP_IMP_INV_VIDA+EMA.EMIP_IMP_RIES_TRA+EMA.EMIP_IMP_GUAR +
EMA.EMIP_IMP_INV_VIDA_O+EMA.EMIP_IMP_EYM_EXCE_O+EMA.EMIP_IMP_EYM_PRED_O +
EMA.EMIP_IMP_EYM_PREE_O
) or pagos.regpat Is Null )
')">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

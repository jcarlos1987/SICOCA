<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master"  AutoEventWireup="false" CodeBehind="proyectodeconvenio.aspx.vb" Inherits="WebSIRECA.proyectodeconvenio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="contedtHead" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="CONTEND1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>    
        <center >
        <asp:Label ID="Label1" runat="server" Text="PROYECTO DE CONVENIO" Font-Bold="True" Font-Size="14"></asp:Label>
        <br />
        <br />
        <div class="btn-group input-prepend">
        <span class="add-on">BONO EXEDENTE</span>
        <span class="add-on">EMISION</span><asp:TextBox ID="TBAExcEmi" placeholder="0.0" runat="server" 
                MaxLength="15" Width="120px" CssClass="text-center"></asp:TextBox>
        <span class="add-on">ACT.</span><asp:TextBox ID="TBAExcAct" placeholder="0.0" runat="server" 
                MaxLength="15" Width="120px" CssClass="text-center"></asp:TextBox>
        <span class="add-on">REC.</span><asp:TextBox ID="TBAExcRec" placeholder="0.0" runat="server" 
                MaxLength="15" Width="120px" CssClass="text-center"></asp:TextBox>
        </div> 
        <br/>
        <div class="btn-group input-prepend">
        <span class="add-on">MESES DE PAGO</span>
        <span class="add-on">C.O.P.</span><asp:TextBox ID="TBMesesPagoCop" runat="server" 
                MaxLength="10" Width="50" CssClass="text-center">12</asp:TextBox>
        <span class="add-on">GASTOS DE EJECUCIÓN C.O.P.</span><asp:TextBox 
                ID="TBGEjecicion" runat="server" Width="70px" placeholder="AUTOMATICO" CssClass="text-center"></asp:TextBox>
        <span class="add-on">R.C.V.</span><asp:TextBox ID="TBMesesPagoRcv" runat="server" 
                MaxLength="10" Width="50px" CssClass="text-center">6</asp:TextBox>
        </div> 
        <br/>
        <div class="btn-group input-prepend">
        <span class="add-on">FECHA DEL PRIMER PAGO</span><asp:TextBox ID="TBFechPrimerPago" 
                runat="server" MaxLength="10" Width="90px" CssClass="text-center">02/08/2013</asp:TextBox>
        <asp:CalendarExtender id="CalendarExtender2" runat="server" TargetControlID="TBFechPrimerPago" Format="dd/MM/yyyy"></asp:CalendarExtender>
        <span class="add-on">GASTOS ADMINISTRATIVOS C.O.P. 2%</span><asp:TextBox ID="TBGAdmin" placeholder="AUTOMATICO" runat="server" Width="70px" CssClass="text-center"></asp:TextBox>
        </div>
        <br/>
        <div class="btn-group input-prepend">
            <span class="add-on">
                <asp:LinkButton ID="LBCalcularConvenio" runat="server" CssClass="btn"><span class="icon-refresh" ></span>&nbsp;CALCULAR</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn"><span class="icon-download-alt" ></span>&nbsp;DESCARGAR</asp:LinkButton>
                <asp:LinkButton ID="LBProyecto" runat="server" CssClass="btn" 
                Visible="False"><span class="icon-download-alt" ></span>&nbsp;PROYECTO</asp:LinkButton>
                <asp:LinkButton ID="LBAmorCop" runat="server" CssClass="btn" 
                Visible="False"><span class="icon-download-alt" ></span>&nbsp;TABLA DE AMORTIZACIÓN</asp:LinkButton>
            </span>
        </div>
        </center>
<asp:Repeater ID="RepeaterDatos" runat="server" DataSourceID="SqlDataSourceDatos">
    <ItemTemplate>
        <table style="width: 100%;" border="1">
            <tr>
                <td>
                    REG.PATRONAL: <asp:Label ID="Label2" runat="server" Text='<%# Eval("REGPAT") %>' Font-Underline="True"></asp:Label>
                </td>
                <td>
                    RAZON SOCIAL:<asp:Label ID="Label3" runat="server" Text='<%# Eval("RAZON_SOCIAL") %>' Font-Underline="True"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    ACTIVIDAD: <asp:Label ID="Label7" runat="server" Text='<%# Eval("ACTIVIDAD") %>' Font-Underline="True"></asp:Label>
                </td>
                <td>
                    R.F.C.:<asp:Label ID="Label10" runat="server" Text='<%# Eval("RFC") %>'></asp:Label>                    
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    LOCALIDAD:<asp:Label ID="Label6" runat="server" Text='<%# Eval("LOCALIDAD") %>' Font-Underline="True"></asp:Label>
                </td>
                <td>
                    DOMICILIO:<asp:Label ID="Label5" runat="server" Text='<%# Eval("DOMICILIO") %>' Font-Underline="True"></asp:Label>
                </td>
                <td>
                    SECTOR:<asp:Label ID="Label9" runat="server" Text='<%# Eval("SECTOR") %>' Font-Underline="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    REPR.LEGAL:<asp:Label ID="Label8" runat="server" Text='<%# Eval("REP_LEGA") %>'></asp:Label>
                </td>
                <td>
                    CORREO:<asp:HyperLink ID="HLCorreo" runat="server" Text='<%# Eval("CORREO") %>' NavigateUrl='<%# "mailto:" & Eval("CORREO") & "?subject=AVISO DE PAGO&body=Buenas, le informo:" %>'></asp:HyperLink>
                </td>
                <td>
                    TELEFONO:<asp:Label ID="Label19" runat="server" Text='<%# Eval("TELEFONO") %>'></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:Repeater>    
  <asp:SqlDataSource ID="SqlDataSourceDatos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ID_USUARIO as VARCHAR(6)
SET @ID_USUARIO=?

exec('
DECLARE @REGPAT as VARCHAR(15)
SET @REGPAT=(select TOP 1 REPLACE(REGPAT,''-'','''') FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'])

SELECT
SECTOR,REGPAT,RFC,DOMICILIO,LOCALIDAD,ACTIVIDAD,RAZON_SOCIAL,COTIZANTES,ULTIMA_EMI,REP_LEGA,CORREO,TELEFONO
FROM (
SELECT sector AS SECTOR
,regpat AS REGPAT
,rfc AS RFC
,dom AS DOMICILIO
,loc AS LOCALIDAD
,act AS ACTIVIDAD
,razonSocial AS RAZON_SOCIAL
,cotiz AS COTIZANTES
,vigencia AS ULTIMA_EMI
,(SELECT TOP 1 inf.[info] FROM [firmaDigital].[dbo].[info] as inf where [tipo]=''1'' and inf.[regpat]=ptn.regpat) as REP_LEGA
,(SELECT TOP 1 inf.[info] FROM [firmaDigital].[dbo].[info] as inf where [tipo]=''2'' and inf.[regpat]=ptn.regpat) as CORREO
,(SELECT TOP 1 inf.[info] FROM [firmaDigital].[dbo].[info] as inf where [tipo]=''3'' and inf.[regpat]=ptn.regpat) as TELEFONO
from sireca.dbo.patrones as ptn WHERE regpat=@REGPAT
) as ptn
')
">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
        &nbsp;<asp:GridView ID="GridViewGCOP" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceGCOP" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" 
            Font-Size="9pt" Caption="RESUMEN DE CUOTAS" CssClass="table-bordered">
            <Columns>
                <asp:BoundField DataField="REG_PAT" HeaderText="REG.PATRONAL" ReadOnly="True" 
                    SortExpression="REG_PAT" />
                <asp:TemplateField SortExpression="GRUPO">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("GRUPO") & " " & Eval("TIPO") & "&nbsp;" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EMISION" HeaderText="EMISION" ReadOnly="True" 
                    SortExpression="EMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ACT" HeaderText="ACTUALIZACION" ReadOnly="True" 
                    SortExpression="ACT" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="REC" HeaderText="RECARGA" ReadOnly="True" 
                    SortExpression="REC" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" ReadOnly="True" 
                    SortExpression="TOTAL" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#9DADC6" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGCOP" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MESES_PAGO as INT
DECLARE @MESES_PAGO_RCV as INT
DECLARE @GASTOS_EJECUCION as FLOAT
DECLARE @ABONO_EXE_EMI as FLOAT
DECLARE @ABONO_EXE_ACT as FLOAT
DECLARE @ABONO_EXE_REC as FLOAT
DECLARE @ID_USUARIO as VARCHAR(6)
DECLARE @FACTOR_ACT as FLOAT
DECLARE @FACTOR_REC as FLOAT

SET @ABONO_EXE_EMI=?
SET @ABONO_EXE_ACT=?
SET @ABONO_EXE_REC=?
SET @MESES_PAGO=?
SET @MESES_PAGO_RCV=?
SET @ID_USUARIO=?
-------------------------------------------------------------------------------------------------------------
SET @FACTOR_ACT=(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc)
SET @FACTOR_REC=(SELECT TOP 1 [REC] FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc)
------------------------------------------------------------------------------------------------------------
exec('
DECLARE @PAGO_GAST_EJECUCION as FLOAT
DECLARE @PAGO_MULTAS10 as FLOAT
DECLARE @PAGO_INIX_COP as FLOAT

SET @PAGO_GAST_EJECUCION=(SELECT
(case 
when (sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))&lt;=19000 then 380
else 
	case 
	when ((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02)&gt;45000 then 45000
	else
		(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02
	end
end) as GASTO_EJECUCION
FROM
(
SELECT 
[REGPAT] as REGPAT
,''CUOTAS RCV'' as GRUPO
,''TOTAL DE CUOTAS'' as TIPO
,([EMISION_OBR]+[EMISION_PAT]) as [EMISION]
,(ACT_OBR+ACT_PAT) as ACT_CALCULADA
,(REC_OBR+REC_PAT) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''RCV'')
and TD in (''06'',''03'')
) as result
where 
GRUPO=''CUOTAS RCV''
group by regpat,grupo
)
------------------------------------------------------------------------------------------------------------
SET @PAGO_MULTAS10=(
SELECT SUM(multas.REC_CALCULADA)
FROM (SELECT 
(([EMISION_OBR]/10)+([EMISION_PAT]/10))
+([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/10
+([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/10
+(((([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/100)/10)
+((([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/100)/10))
*0
as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD in (''08'',''80'',''81'',''82'')
) as multas
)
-------------------------------------------------------------------------------------------------------------
SET @PAGO_INIX_COP=(
SELECT
(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as TOTAL
FROM
(
SELECT top 1
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''ABONO EXEDENTE'' as TIPO
,'+@ABONO_EXE_EMI+' as [EMISION]
,'+@ABONO_EXE_ACT+' as ACT_CALCULADA
,'+@ABONO_EXE_REC+' as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''CUOTAS OBRERA'' as TIPO
,([EMISION_OBR]) as [EMISION]
,(ACT_OBR) as ACT_CALCULADA
,(REC_OBR) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''20 % INICIAL'' as TIPO
,([EMISION_PAT]*20/100) as [EMISION]
,(ACT_PAT*20/100) as ACT_CALCULADA
,(REC_PAT*20/100) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')

) as resultasdp
WHERE GRUPO=''CUOTAS IMSS''
)
--CARATULA GENERAL-----------------------------------------------------------------------------------------------------------
SELECT
regpat as REG_PAT
,grupo as GRUPO
,tipo as TIPO
,sum(EMISION) as EMISION
,sum(ACT_CALCULADA) as ACT
,sum(REC_CALCULADA) as REC
,(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as TOTAL
FROM
(
SELECT top 1
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''ABONO EXEDENTE'' as TIPO
,'+@ABONO_EXE_EMI+' as [EMISION]
,'+@ABONO_EXE_ACT+' as ACT_CALCULADA
,'+@ABONO_EXE_REC+' as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS RCV'' as GRUPO
,''TOTAL DE CUOTAS'' as TIPO
,([EMISION_OBR]+[EMISION_PAT]) as [EMISION]
,(ACT_OBR+ACT_PAT) as ACT_CALCULADA
,(REC_OBR+REC_PAT) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''RCV'')
and TD in (''06'',''03'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''SALDO ADEUDO'' as TIPO
,[EMISION_PAT]-([EMISION_PAT]*20/100)-'+@ABONO_EXE_EMI+' as [EMISION]
,ACT_PAT-(ACT_PAT*20/100)-'+@ABONO_EXE_ACT+' as ACT_CALCULADA
,REC_PAT-(REC_PAT*20/100)-'+@ABONO_EXE_REC+' as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''20 % INICIAL'' as TIPO
,([EMISION_PAT]*20/100) as [EMISION]
,(ACT_PAT*20/100) as ACT_CALCULADA
,(REC_PAT*20/100) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''TOTAL DE CUOTAS'' as TIPO
,([EMISION_OBR]+[EMISION_PAT]) as [EMISION]
,(ACT_OBR+ACT_PAT) as ACT_CALCULADA
,(REC_OBR+REC_PAT) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''CUOTAS OBRERA'' as TIPO
,([EMISION_OBR]) as [EMISION]
,(ACT_OBR) as ACT_CALCULADA
,(REC_OBR) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
) as resultasdp
group by regpat,grupo,tipo
')
exec('select * FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+']')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBAExcEmi" DefaultValue="0" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBAExcAct" DefaultValue="0" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBAExcRec" DefaultValue="0" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBMesesPagoCop" DefaultValue="1" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBMesesPagoRcv" DefaultValue="1" Name="?" 
                    PropertyName="Text" />
                <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:DetailsView ID="DetailsViewCOP" runat="server" AutoGenerateRows="False" Caption="&lt;strong&gt;CUOTAS IMSS TD NO INCLUIDOS 08,80,81,82,89 &lt;/strong&gt;" 
                        CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceCOP" Height="50px" 
                        HorizontalAlign="Center" 
                        EmptyDataText="SIN CUOTAS IMSS" Font-Size="9pt" CssClass="table-bordered">
                        <Fields>
                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                SortExpression="CREDITOS">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IMPORTE_A_CONVENIR" HeaderText="IMPORTE A CONVENIR" DataFormatString="{0:C}"
                                ReadOnly="True" SortExpression="IMPORTE_A_CONVENIR">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PLAZO_DEL_CONVENIO_EN_MESES" 
                                HeaderText="PLAZO DEL CONVENIO EN MESES" ReadOnly="True" 
                                SortExpression="PLAZO_DEL_CONVENIO_EN_MESES">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TASA_DE_RECARGOS_MENSUAL" 
                                HeaderText="TASA DE RECARGOS MENSUAL" ReadOnly="True" 
                                SortExpression="TASA_DE_RECARGOS_MENSUAL">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PAGO_MENSUAL_PROGRAMADO" DataFormatString="{0:C}" 
                                HeaderText="*PAGO MENSUAL PROGRAMADO" ReadOnly="True" 
                                SortExpression="PAGO_MENSUAL_PROGRAMADO">
                            <HeaderStyle CssClass="btn btn-success" />
                            <ItemStyle HorizontalAlign="Right" CssClass="btn btn-success" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GASTOS_ADMINISTRATIVOS_2" DataFormatString="{0:C}" 
                                HeaderText="GASTOS ADMINISTRATIVOS 2%" ReadOnly="True" 
                                SortExpression="GASTOS_ADMINISTRATIVOS_2">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GASTO_EJECUCION" HeaderText="GASTO EJECUCION" DataFormatString="{0:C}"
                                ReadOnly="True" SortExpression="GASTO_EJECUCION">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PAGO_INICIAL" HeaderText="**PAGO INICIAL" DataFormatString="{0:C}"
                                ReadOnly="True" SortExpression="PAGO_INICIAL">
                            <HeaderStyle CssClass="btn btn-info" />
                            <ItemStyle HorizontalAlign="Right" CssClass="btn btn-info" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FACT_ACT" HeaderText="FACTOR DE ACTUALIZACION" ReadOnly="True" 
                                SortExpression="FACT_ACT">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FACT_REC" HeaderText="FACTOR DE RECARGA" ReadOnly="True" 
                                SortExpression="FACT_REC">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="x1" HeaderText="x1" ReadOnly="True" 
                                SortExpression="x1" Visible="False" />
                            <asp:BoundField DataField="x2" HeaderText="x2" ReadOnly="True" 
                                SortExpression="x2" Visible="False" />
                            <asp:BoundField DataField="x3" HeaderText="x3" ReadOnly="True" 
                                SortExpression="x3" Visible="False" />
                            <asp:BoundField DataField="x4" HeaderText="x4" ReadOnly="True" 
                                SortExpression="x4" Visible="False" />
                            <asp:BoundField DataField="GARANTIZAR_POLIZA" DataFormatString="{0:C}" 
                                HeaderText="GARANTIZAR POLIZA" ReadOnly="True" 
                                SortExpression="GARANTIZAR_POLIZA">
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle BackColor="#F0AD4E" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GARANTIZAR_POLIZA_2" DataFormatString="{0:C}" 
                                HeaderText="GARANTIZAR POLIZA 2%" ReadOnly="True" 
                                SortExpression="GARANTIZAR_POLIZA_2">
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle BackColor="#F0AD4E" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GARANTIZAR_VIA_ADMINISTRATIVA" 
                                DataFormatString="{0:C}" HeaderText="GARANTIZAR VIA ADMINISTRATIVA" 
                                ReadOnly="True" SortExpression="GARANTIZAR_VIA_ADMINISTRATIVA">
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle BackColor="#F0AD4E" HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceCOP" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MESES_PAGO as INT
DECLARE @MESES_PAGO_RCV as INT
DECLARE @ABONO_EXE_EMI as FLOAT
DECLARE @ABONO_EXE_ACT as FLOAT
DECLARE @ABONO_EXE_REC as FLOAT
DECLARE @ID_USUARIO as VARCHAR(6)
DECLARE @FACTOR_ACT as FLOAT
DECLARE @FACTOR_REC as FLOAT
DECLARE @GASTOS_EJECUCION as VARCHAR(15)
DECLARE @GASTOS_ADMI_COP as VARCHAR(15)

SET @ABONO_EXE_EMI=?
SET @ABONO_EXE_ACT=?
SET @ABONO_EXE_REC=?
SET @MESES_PAGO=?
SET @MESES_PAGO_RCV=?
SET @ID_USUARIO=?
SET @GASTOS_ADMI_COP=?
SET @GASTOS_EJECUCION=?

IF @GASTOS_ADMI_COP=''
BEGIN
	SET @GASTOS_ADMI_COP='-1'
END
IF @GASTOS_EJECUCION=''
BEGIN
	SET @GASTOS_EJECUCION='-1'
END
-------------------------------------------------------------------------------------------------------------
SET @FACTOR_ACT=(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] 
where [PERIODO] not in (SELECT top 1 [PERIODO] FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc)
order by [FEC_VIGENCIA] desc)
SET @FACTOR_REC=(SELECT TOP 1 [REC] FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc)
------------------------------------------------------------------------------------------------------------
exec('
DECLARE @PAGO_GAST_EJECUCION as FLOAT
DECLARE @PAGO_MULTAS10 as FLOAT
DECLARE @PAGO_INIX_COP as FLOAT

SET @PAGO_GAST_EJECUCION=(SELECT
(case 
when (sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))&lt;=19000 then 380
else 
	(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02
end) as GASTO_EJECUCION
FROM
(
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''TOTAL DE CUOTAS'' as TIPO
,([EMISION_OBR]+[EMISION_PAT]) as [EMISION]
,(ACT_OBR+ACT_PAT) as ACT_CALCULADA
,(REC_OBR+REC_PAT) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
) as result
where 
GRUPO=''CUOTAS IMSS''
group by regpat,grupo
)
SET @PAGO_GAST_EJECUCION = (case 
when '+@GASTOS_EJECUCION+' = 0 then 0
when '+@GASTOS_EJECUCION+' = -1 then @PAGO_GAST_EJECUCION
else '+@GASTOS_EJECUCION+'
end)
------------------------------------------------------------------------------------------------------------
SET @PAGO_MULTAS10=(
SELECT SUM(multas.REC_CALCULADA)
FROM (SELECT 
(([EMISION_OBR]/convert(float,10))+([EMISION_PAT]/convert(float,10)))
+([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,10)
+([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,10)
+(((([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,100))/convert(float,10))
+((([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,100))/convert(float,10)))
*0
as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD in (''08'',''80'',''81'',''82'')
) as multas
)
-------------------------------------------------------------------------------------------------------------
SET @PAGO_INIX_COP=(
SELECT
(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as TOTAL
FROM
(
SELECT top 1
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''ABONO EXEDENTE'' as TIPO
,'+@ABONO_EXE_EMI+' as [EMISION]
,'+@ABONO_EXE_ACT+' as ACT_CALCULADA
,'+@ABONO_EXE_REC+' as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''CUOTAS OBRERA'' as TIPO
,([EMISION_OBR]) as [EMISION]
,(ACT_OBR) as ACT_CALCULADA
,(REC_OBR) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''20 % INICIAL'' as TIPO
,([EMISION_PAT]*20/convert(float,100)) as [EMISION]
,(ACT_PAT*20/convert(float,100)) as ACT_CALCULADA
,(REC_PAT*20/convert(float,100)) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')

) as resultasdp
WHERE GRUPO=''CUOTAS IMSS''
)
--CARATULA COP----------------------------------------------------------------------------------------------------------------------------------------
SELECT
REGPAT
,count(*) as CREDITOS
,GRUPO
,(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as IMPORTE_A_CONVENIR
,'+@MESES_PAGO+' as PLAZO_DEL_CONVENIO_EN_MESES
,(
case when '+@MESES_PAGO+'&lt;=12 then 1 else (case when '+@MESES_PAGO+'&lt;=24 then 1.25 else 1.5 end) end
) as TASA_DE_RECARGOS_MENSUAL
,(
(SUM(EMISION)+SUM(ACT_CALCULADA)+SUM(REC_CALCULADA))
/
(
(1-(POWER(cast(1+((case when '+@MESES_PAGO+'&lt;=12 then 1 else (case when '+@MESES_PAGO+'&lt;=24 then 1.25 else 1.5 end) end)/convert(float,100)) as float),-'+@MESES_PAGO+')))/((case when '+@MESES_PAGO+'&lt;=12 then 1 else (case when '+@MESES_PAGO+'&lt;=24 then 1.25 else 1.5 end) end)/convert(float,100))
)
) as PAGO_MENSUAL_PROGRAMADO
,(CASE 
WHEN '+@GASTOS_ADMI_COP+'=0 THEN 0
WHEN '+@GASTOS_ADMI_COP+'=-1 THEN ((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02)
ELSE '+@GASTOS_ADMI_COP+'
END
) as GASTOS_ADMINISTRATIVOS_2
,@PAGO_GAST_EJECUCION as GASTO_EJECUCION
,(@PAGO_INIX_COP+@PAGO_GAST_EJECUCION+
(CASE 
WHEN '+@GASTOS_ADMI_COP+'=0 THEN 0
WHEN '+@GASTOS_ADMI_COP+'=-1 THEN ((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02)
ELSE '+@GASTOS_ADMI_COP+'
END
)
) as PAGO_INICIAL
,'+@FACTOR_ACT+' as FACT_ACT
,'+@FACTOR_REC+' as FACT_REC
,'+@FACTOR_ACT+'*'+@MESES_PAGO+' as x1
,'+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as x2
,'+@FACTOR_REC+'*'+@MESES_PAGO+' as x3
,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO+'/100) as x4
,(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+(((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO+')/100)+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))) as GARANTIZAR_POLIZA

,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02) as GARANTIZAR_POLIZA_2
--+(((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO+'/100))+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*(0.02) as GARANTIZAR_POLIZA_2

,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+(((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO+'/100))+('+@FACTOR_ACT+'*'+@MESES_PAGO+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))/0.75 as GARANTIZAR_VIA_ADMINISTRATIVA
FROM
(
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''SALDO ADEUDO'' as TIPO
,[EMISION_PAT]-([EMISION_PAT]*20/convert(float,100)) as [EMISION]
,ACT_PAT-(ACT_PAT*20/convert(float,100)) as ACT_CALCULADA
,REC_PAT-(REC_PAT*20/convert(float,100)) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
) as resultasdp
where 
GRUPO=''CUOTAS IMSS''
group by regpat,grupo
')
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TBAExcEmi" DefaultValue="0" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBAExcAct" DefaultValue="0" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBAExcRec" DefaultValue="0" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBMesesPagoCop" DefaultValue="1" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBMesesPagoRcv" DefaultValue="1" Name="?" 
                                PropertyName="Text" />
                            <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
                            <asp:ControlParameter ControlID="TBGAdmin" DefaultValue="-1" 
                                Name="?" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBGEjecicion" DefaultValue="-1" Name="?" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:DetailsView ID="DetailsViewMultas" runat="server" AutoGenerateRows="False" Caption="&lt;strong&gt;MULTAS 10% TD = 08,80,81,82 &lt;/strong&gt;" 
                        CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceMultas" Height="50px" 
                        HorizontalAlign="Center" EmptyDataText="SIN MULTAS" 
                        Font-Size="9pt" CssClass="table-bordered">
                        <Fields>
                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                HeaderText="CREDITOS" SortExpression="CREDITOS">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMISION" 
                                HeaderText="EMISION" ReadOnly="True" 
                                SortExpression="EMISION" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ACT" 
                                HeaderText="ACTUALIZACION" ReadOnly="True" 
                                SortExpression="ACT" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="REC" 
                                HeaderText="RECARGA" ReadOnly="True" 
                                SortExpression="REC" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TOTAL" 
                                HeaderText="**TOTAL" ReadOnly="True" 
                                SortExpression="TOTAL" DataFormatString="{0:C}">
                            <HeaderStyle CssClass="btn btn-info" />
                            <ItemStyle HorizontalAlign="Right" CssClass="btn btn-info" />
                            </asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceMultas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                        SelectCommand="DECLARE @ID_USUARIO as VARCHAR(6)
SET @ID_USUARIO=?
exec('
--CARATULA GENERAL-----------------------------------------------------------------------------------------------------------
SELECT
regpat as REG_PAT
,grupo as GRUPO
,tipo as TIPO
,COUNT(*) AS CREDITOS
,sum(EMISION) as EMISION
,sum(ACT_CALCULADA) as ACT
,sum(REC_CALCULADA) as REC
,(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as TOTAL
FROM
(
SELECT 
[REGPAT] as REGPAT
,''MULTAS'' as GRUPO
,''MULTAS 10%'' as TIPO
,(([EMISION_OBR]/10)+([EMISION_PAT]/10)) as [EMISION]
,([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,10)
+([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,10)
as ACT_CALCULADA
,(((([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,100))/convert(float,10))
+((([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,100))/convert(float,10)))
*0
as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD in (''08'',''80'',''81'',''82'')
) as resultasdp
group by regpat,grupo,tipo
')
">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:DetailsView ID="DetailsViewRCV" runat="server" AutoGenerateRows="False" Caption="&lt;strong&gt;CUOTAS R.C.V. TD = 03,08 &lt;/strong&gt;" 
                        CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceRCV" Height="50px" 
                        HorizontalAlign="Center" 
                        EmptyDataText="SIN CUOATAS R.C.V." Font-Size="9pt" 
                        CssClass="table-bordered">
                        <Fields>
                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TOTAL" HeaderText="**TOTAL" ReadOnly="True" 
                                SortExpression="TOTAL" DataFormatString="{0:C}" >
                            <HeaderStyle CssClass="btn btn-info" />
                            <ItemStyle HorizontalAlign="Right" CssClass="btn btn-info" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PLAZO_DEL_CONVENIO_EN_MESES" 
                                HeaderText="PLAZO DEL CONVENIO EN MESES" ReadOnly="True" 
                                SortExpression="PLAZO_DEL_CONVENIO_EN_MESES" DataFormatString="{0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TASA_DE_RECARGOS_MENSUAL" 
                                HeaderText="TASA DE RECARGOS MENSUAL" ReadOnly="True" 
                                SortExpression="TASA_DE_RECARGOS_MENSUAL" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PAGO_MENSUAL_PROGRAMADO" 
                                HeaderText="PAGO MENSUAL PROGRAMADO" ReadOnly="True" 
                                SortExpression="PAGO_MENSUAL_PROGRAMADO" DataFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GASTOS_ADMINISTRATIVOS_2" 
                                HeaderText="GASTOS ADMINISTRATIVOS 2%" ReadOnly="True" 
                                SortExpression="GASTOS_ADMINISTRATIVOS_2" DataFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GASTO_EJECUCION" 
                                HeaderText="GASTO DE EJECUCION" ReadOnly="True" 
                                SortExpression="GASTO_EJECUCION" DataFormatString="{0:C}" Visible="False" >
                            <HeaderStyle BackColor="#FF3300" />
                            <ItemStyle HorizontalAlign="Right" BackColor="#FF3300" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FACT_ACT" 
                                HeaderText="FACTOR DE ACTUALIZACION" ReadOnly="True" 
                                SortExpression="FACT_ACT" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FACT_REC" HeaderText="FACTOR DE RECARGA" 
                                ReadOnly="True" SortExpression="FACT_REC" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="x1" HeaderText="x1" ReadOnly="True" 
                                SortExpression="x1" Visible="False" />
                            <asp:BoundField DataField="x2" HeaderText="x2" ReadOnly="True" 
                                SortExpression="x2" Visible="False" />
                            <asp:BoundField DataField="x3" HeaderText="x3" ReadOnly="True" 
                                SortExpression="x3" Visible="False" />
                            <asp:BoundField DataField="x4" HeaderText="x4" ReadOnly="True" 
                                SortExpression="x4" Visible="False" />
                            <asp:BoundField DataField="GARANTIZAR_POLIZA" HeaderText="***GARANTIZAR POLIZA" 
                                ReadOnly="True" SortExpression="GARANTIZAR_POLIZA" 
                                DataFormatString="{0:C}" >
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle HorizontalAlign="Right" BackColor="#F0AD4E" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GARANTIZAR_POLIZA_2" 
                                HeaderText="***GARANTIZAR POLIZA 2%" ReadOnly="True" 
                                SortExpression="GARANTIZAR_POLIZA_2" DataFormatString="{0:C}" >
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle HorizontalAlign="Right" BackColor="#F0AD4E" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GARANTIZAR_VIA_ADMINISTRATIVA" 
                                HeaderText="***GARANTIZAR VIA ADMINISTRATIVA" ReadOnly="True" 
                                SortExpression="GARANTIZAR_VIA_ADMINISTRATIVA" DataFormatString="{0:C}" >
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle HorizontalAlign="Right" BackColor="#F0AD4E" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GARANTIA_RCV" HeaderText="***GARANTIA RCV" 
                                ReadOnly="True" SortExpression="GARANTIA_RCV" DataFormatString="{0:C}" >
                            <HeaderStyle BackColor="#F0AD4E" />
                            <ItemStyle HorizontalAlign="Right" BackColor="#F0AD4E" />
                            </asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceRCV" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MESES_PAGO as INT
DECLARE @MESES_PAGO_RCV as INT
DECLARE @GASTOS_EJECUCION as FLOAT
DECLARE @ABONO_EXE_EMI as FLOAT
DECLARE @ABONO_EXE_ACT as FLOAT
DECLARE @ABONO_EXE_REC as FLOAT
DECLARE @ID_USUARIO as VARCHAR(6)
DECLARE @FACTOR_ACT as FLOAT
DECLARE @FACTOR_REC as FLOAT
SET @ABONO_EXE_EMI=?
SET @ABONO_EXE_ACT=?
SET @ABONO_EXE_REC=?
SET @MESES_PAGO=?
SET @MESES_PAGO_RCV=?
SET @ID_USUARIO=?
-------------------------------------------------------------------------------------------------------------
SET @FACTOR_ACT=(SELECT TOP 1 [ACT] FROM [sirecacobros].[dbo].[tabActRec] 
where [PERIODO] not in (SELECT top 1 [PERIODO] FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc)
order by [FEC_VIGENCIA] desc)
SET @FACTOR_REC=(SELECT TOP 1 [REC] FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc)
------------------------------------------------------------------------------------------------------------
exec('
DECLARE @PAGO_GAST_EJECUCION as FLOAT
DECLARE @PAGO_MULTAS10 as FLOAT
DECLARE @PAGO_INIX_COP as FLOAT

SET @PAGO_GAST_EJECUCION=(SELECT
(case 
when (sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))&lt;20000 then 380
else (sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02
end) as GASTO_EJECUCION
FROM
(
SELECT 
[REGPAT] as REGPAT
,''CUOTAS RCV'' as GRUPO
,''TOTAL DE CUOTAS'' as TIPO
,([EMISION_OBR]+[EMISION_PAT]) as [EMISION]
,(ACT_OBR+ACT_PAT) as ACT_CALCULADA
,(REC_OBR+REC_PAT) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''RCV'')
and TD in (''06'',''03'')
) as result
where 
GRUPO=''CUOTAS RCV''
group by regpat,grupo
)
------------------------------------------------------------------------------------------------------------
SET @PAGO_MULTAS10=(
SELECT SUM(multas.REC_CALCULADA)
FROM (SELECT 
(([EMISION_OBR]/convert(float,10))+([EMISION_PAT]/convert(float,10)))
+([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,10)
+([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,10)
+(((([EMISION_OBR]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,100))/convert(float,10))
+((([EMISION_PAT]*(SELECT tar.[ACT] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO])*(SELECT tar.[REC] FROM [sirecacobros].[dbo].[tabActRec] as tar WHERE tar.[PERIODO]=ad.[PERIODO]))/convert(float,100))/convert(float,10)))
*0
as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD in (''08'',''80'',''81'',''82'')
) as multas
)
-------------------------------------------------------------------------------------------------------------
SET @PAGO_INIX_COP=(
SELECT
(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as TOTAL
FROM
(
SELECT top 1
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''ABONO EXEDENTE'' as TIPO
,'+@ABONO_EXE_EMI+' as [EMISION]
,'+@ABONO_EXE_ACT+' as ACT_CALCULADA
,'+@ABONO_EXE_REC+' as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''CUOTAS OBRERA'' as TIPO
,([EMISION_OBR]) as [EMISION]
,(ACT_OBR) as ACT_CALCULADA
,(REC_OBR) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS IMSS'' as GRUPO
,''20 % INICIAL'' as TIPO
,([EMISION_PAT]*20/convert(float,100)) as [EMISION]
,(ACT_PAT*20/convert(float,100)) as ACT_CALCULADA
,(REC_PAT*20/convert(float,100)) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''COP'')
and TD not in (''08'',''80'',''81'',''82'',''89'')

) as resultasdp
WHERE GRUPO=''CUOTAS IMSS''
)
--CARATULA MULTAS----------------------------------------------------------------------------------------------------------------------------------------
SELECT
REGPAT
,count(*) as CREDITOS
,GRUPO
,TIPO
,(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as TOTAL
,'+@MESES_PAGO_RCV+' as PLAZO_DEL_CONVENIO_EN_MESES
,(
case when '+@MESES_PAGO_RCV+'&lt;=12 then 1 else (case when '+@MESES_PAGO_RCV+'&lt;=24 then 1.25 else 1.5 end) end
) as TASA_DE_RECARGOS_MENSUAL
,(
(SUM(EMISION)+SUM(ACT_CALCULADA)+SUM(REC_CALCULADA))
/
(
(1-(POWER(cast(1+((case when '+@MESES_PAGO_RCV+'&lt;=12 then 1 else (case when '+@MESES_PAGO_RCV+'&lt;=24 then 1.25 else 1.5 end) end)/convert(float,100)) as float),-'+@MESES_PAGO_RCV+')))/((case when '+@MESES_PAGO_RCV+'&lt;=12 then 1 else (case when '+@MESES_PAGO_RCV+'&lt;=24 then 1.25 else 1.5 end) end)/convert(float,100))
)
) as PAGO_MENSUAL_PROGRAMADO
,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02) as GASTOS_ADMINISTRATIVOS_2
,(case 
when (sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))&lt;20000 then 380
else (sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*0.02
end) as GASTO_EJECUCION
,'+@FACTOR_ACT+' as FACT_ACT
,'+@FACTOR_REC+' as FACT_REC
,'+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+' as x1
,'+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA)) as x2
,'+@FACTOR_REC+'*'+@MESES_PAGO_RCV+' as x3
,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO_RCV+'/convert(float,100)) as x4
,(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+(((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO_RCV+'/convert(float,100)))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))) as GARANTIZAR_POLIZA
,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+(((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO_RCV+'/convert(float,100)))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*(0.02) as GARANTIZAR_POLIZA_2
,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+(((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))*('+@FACTOR_REC+'*'+@MESES_PAGO_RCV+'/convert(float,100)))+('+@FACTOR_ACT+'*'+@MESES_PAGO_RCV+'*(sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))))/0.75 as GARANTIZAR_VIA_ADMINISTRATIVA
,((sum(EMISION)+sum(ACT_CALCULADA)+sum(REC_CALCULADA))*3) as GARANTIA_RCV
FROM
(
SELECT 
[REGPAT] as REGPAT
,''CUOTAS RCV'' as GRUPO
,''TOTAL DE CUOTAS'' as TIPO
,([EMISION_OBR]+[EMISION_PAT]) as [EMISION]
,(ACT_OBR+ACT_PAT) as ACT_CALCULADA
,(REC_OBR+REC_PAT) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''RCV'')
and TD in (''06'',''03'')
union all
SELECT 
[REGPAT] as REGPAT
,''CUOTAS RCV'' as GRUPO
,''CUOTAS OBRERA'' as TIPO
,([EMISION_OBR]) as [EMISION]
,(ACT_OBR) as ACT_CALCULADA
,(REC_OBR) as REC_CALCULADA
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USUARIO+'] as ad
where [TOPO_ADEUDO] in (''RCV'')
and TD in (''06'',''03'')
) as resultasdp
where 
GRUPO=''CUOTAS RCV'' and TIPO=''TOTAL DE CUOTAS''
group by regpat,grupo,tipo
')
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TBAExcEmi" DefaultValue="0" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBAExcAct" DefaultValue="0" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBAExcRec" DefaultValue="0" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBMesesPagoCop" DefaultValue="1" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TBMesesPagoRcv" DefaultValue="1" Name="?" 
                                PropertyName="Text" />
                            <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Table ID="TableImssConvenios" runat="server" BackColor="#FFFFCC" 
                        Caption="&lt;strong&gt;IMSS CONVENIOS&lt;/strong&gt;" CellPadding="1" 
                        CellSpacing="1" GridLines="Both" Font-Size="10pt" HorizontalAlign="Center">
                        <asp:TableRow ID="TableRow1" runat="server">
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server" HorizontalAlign="Center">
                            <asp:TableCell ID="TableCell1" runat="server" Font-Bold="True">No.</asp:TableCell>
                            <asp:TableCell ID="TableCell2" runat="server" Font-Bold="True">Fecha Programada</asp:TableCell>
                            <asp:TableCell ID="TableCell3" runat="server" Font-Bold="True">Saldo Insoluto Inicial</asp:TableCell>
                            <asp:TableCell ID="TableCell4" runat="server" Font-Bold="True">Mensualidad</asp:TableCell>
                            <asp:TableCell ID="TableCell5" runat="server" Font-Bold="True">Monto de Pago a Realizar</asp:TableCell>
                            <asp:TableCell ID="TableCell6" runat="server" Font-Bold="True">Monto de Amortización a Capital</asp:TableCell>
                            <asp:TableCell ID="TableCell7" runat="server" Font-Bold="True">Monto de Recargos por Prorroga</asp:TableCell>
                            <asp:TableCell ID="TableCell8" runat="server" Font-Bold="True">Saldo Insoluto Final</asp:TableCell>
                            <asp:TableCell ID="TableCell9" runat="server" Font-Bold="True">Fecha Real de Pago</asp:TableCell>
                            <asp:TableCell ID="TableCell10" runat="server" Font-Bold="True">Actualización por Pago Extemporaneo</asp:TableCell>
                            <asp:TableCell ID="TableCell11" runat="server" Font-Bold="True">Monto de Recargos por Mora</asp:TableCell>
                            <asp:TableCell ID="TableCell12" runat="server" Font-Bold="True">Monto Total del Pago a Realizar</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
        <asp:GridView ID="GridViewContFile" runat="server" AutoGenerateColumns="False" 
                        CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSourceContFile" HorizontalAlign="Center" 
                        CssClass="table-bordered" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TOPO_ADEUDO" HeaderText="ADEUDO" 
                    ReadOnly="True" SortExpression="TOPO_ADEUDO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                    SortExpression="TD" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                    SortExpression="INC" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DEL" HeaderText="DEL" ReadOnly="True" 
                    SortExpression="DEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SUB" HeaderText="SUB" ReadOnly="True" 
                    SortExpression="SUB" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DEL1" HeaderText="DEL1" ReadOnly="True" 
                    SortExpression="DEL1" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SUB1" HeaderText="SUB1" ReadOnly="True" 
                    SortExpression="SUB1" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="EMISION_OBR" DataFormatString="{0:C}" 
                    HeaderText="EMISION_OBR" ReadOnly="True" SortExpression="EMISION_OBR">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ACT_OBR" DataFormatString="{0:C}" 
                    HeaderText="ACT_OBR" ReadOnly="True" SortExpression="ACT_OBR">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="REC_OBR" DataFormatString="{0:C}" 
                    HeaderText="REC_OBR" ReadOnly="True" SortExpression="REC_OBR">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL_OBR" DataFormatString="{0:C}" 
                    HeaderText="TOTAL_OBR" ReadOnly="True" SortExpression="TOTAL_OBR">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="EMISION_PAT" DataFormatString="{0:C}" 
                    HeaderText="EMISION_PAT" ReadOnly="True" SortExpression="EMISION_PAT">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ACT_PAT" DataFormatString="{0:C}" 
                    HeaderText="ACT_PAT" ReadOnly="True" SortExpression="ACT_PAT">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="REC_PAT" DataFormatString="{0:C}" 
                    HeaderText="REC_PAT" ReadOnly="True" SortExpression="REC_PAT">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL_PAT" DataFormatString="{0:C}" 
                    HeaderText="TOTAL_PAT" ReadOnly="True" SortExpression="TOTAL_PAT">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#9DADC6" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceContFile" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ID_USER as VARCHAR(6)
SET @ID_USER=?
exec('
SELECT [REGPAT]
,[TOPO_ADEUDO]
,[CREDITO]
,[PERIODO]
,[TD]
,[INC]
,[DEL]
,[SUB]
,[DEL1]
,[SUB1]
,[EMISION_OBR]
,[ACT_OBR]
,[REC_OBR]
,[TOTAL_OBR]
,[EMISION_PAT]
,[ACT_PAT]
,[REC_PAT]
,[TOTAL_PAT]
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USER+']
order by convert(datetime,''01/''+periodo,103)
')">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </asp:Content>

<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default29" %>
<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <table style="width: 100%;">
        <tr>            
            <td class="style1">

                    <asp:Button runat="server" Text="SIN PAGO/DESCARGAR" BackColor="#FFF3CD" 
                    BorderColor="#CC0000" BorderWidth="1px" BorderStyle="Solid" ID="BDesSinPago"></asp:Button>

                </td>
            <td>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
    <ProgressTemplate >CARGANDO...</ProgressTemplate>
    </asp:UpdateProgress>
            </td>
        </tr>
        </table>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate >
    <div>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
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
        <asp:DropDownList ID="DDLAnio" runat="server" AutoPostBack="True" 
            ToolTip="PERIODO">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" BackColor="#BCC7D8" 
            BorderColor="#293955" BorderStyle="Solid" BorderWidth="1px" Text="Actualizar" />
        <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#F7F6F3" 
            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="0.8em" Width="100%">
            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                ForeColor="#284775" />
            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
            <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
                VerticalAlign="Top" Width="160px" />
            <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
            <WizardSteps>
                <asp:WizardStep runat="server" title="ECO">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSource1" Font-Size="10pt" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                SortExpression="SUBDEL" />
                            <asp:BoundField DataField="VALIDACION" HeaderText="VALIDACION" ReadOnly="True" 
                                SortExpression="VALIDACION" />
                            <asp:BoundField DataField="TOTAL" DataFormatString="{0:N0}" HeaderText="TOTAL" 
                                ReadOnly="True" SortExpression="TOTAL">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                                ReadOnly="True" SortExpression="PAGO">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DIFERENCIA" DataFormatString="{0:C}" 
                                HeaderText="DIFERENCIA" ReadOnly="True" SortExpression="DIFERENCIA">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#8FB78E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT SUBDEL,VALIDACION,count(*)as TOTAL,sum(omision) as IMPORTE, SUM(PAGO) as PAGO,(SUM(PAGO)-sum(omision)) as DIFERENCIA
  FROM [sireca].[dbo].[eco]
  where subdel=?
  and fechaEco=(?+?)
  and tipoeco in ('COP','COMP','RCV','RCVCOMP')
  group by subdel,validacion
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="1900" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="Label2" runat="server" Text="VALIDACION:"></asp:Label>
                    <asp:DropDownList ID="DDLTipo" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource4" DataTextField="validacion" 
                        DataValueField="validacion">
                    </asp:DropDownList>
                    <asp:Label ID="Label3" runat="server" Text="TIPO CUOTA:"></asp:Label>
                    <asp:DropDownList ID="DDLTipoCop" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="RCV">RCV</asp:ListItem>
                        <asp:ListItem Value="CO">COP</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select validacion
from sireca.dbo.eco
where subdel=?
and fechaeco=(?+?)
group by validacion">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="Label4" runat="server" Text="INCIDENCIA:"></asp:Label>
                    <asp:DropDownList ID="DDLInc" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceIncRale" DataTextField="INCIDENCIA" 
                        DataValueField="INCIDENCIA">
                        <asp:ListItem Value="%">TODOS</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" Text="ACTUALIZAR" BackColor="#FFF3CD" 
                        BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px" />
                    <asp:SqlDataSource ID="SqlDataSourceIncRale" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [incidenciarale] as INCIDENCIA
FROM [sireca].[dbo].[eco]
where subdel=?
and validacion=?
and fechaeco=(?+?)
and tdrale in ('01','02','06','07')
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by [incidenciarale]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLTipo" DefaultValue="vacion" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSource2" Font-Size="8pt" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                SortExpression="SUBDEL" />
                            <asp:BoundField DataField="TIPO_ECO" HeaderText="TIPO_ECO" 
                                SortExpression="TIPO_ECO" />
                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                SortExpression="PERIODO" />
                            <asp:HyperLinkField DataNavigateUrlFields="REG.PATRONAL" 
                                DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                                DataTextField="REG.PATRONAL" HeaderText="REG.PATRONAL" 
                                NavigateUrl="~/observacionPatronal/Default.aspx" 
                                SortExpression="REG.PATRONAL" Target="_blank" />
                            <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" HeaderText="NOMBRE O RAZON SOCIAL" 
                                ReadOnly="True" SortExpression="NOMBRE O RAZON SOCIAL" />
                            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                                SortExpression="CREDITO" />
                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VALIDACION" HeaderText="VALIDACION" ReadOnly="True" 
                                SortExpression="VALIDACION" />
                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                                ReadOnly="True" SortExpression="PAGO">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DIFERENCIA" DataFormatString="{0:C}" 
                                HeaderText="DIFERENCIA" ReadOnly="True" SortExpression="DIFERENCIA">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TD_RALE" HeaderText="TD_RALE" 
                                SortExpression="TD_RALE" />
                            <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                                SortExpression="INC_RALE" />
                        </Columns>
                        <HeaderStyle BackColor="#8FB78E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(50)
DECLARE @RALERCV as VARCHAR(50)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
----------------------------
select subdel as SUBDEL,tipoeco as [TIPO_ECO],(
CASE LEN(fechaeco)
WHEN 5 THEN SUBSTRING(CONVERT(VARCHAR,FECHAECO),1,1)+'/'+SUBSTRING(CONVERT(VARCHAR,FECHAECO),2,4)
ELSE SUBSTRING(CONVERT(VARCHAR,FECHAECO),1,2)+'/'+SUBSTRING(CONVERT(VARCHAR,FECHAECO),3,4)
END
) as PERIODO,SUBSTRING([reg#patronal],1,10) as [REG.PATRONAL],[NOMBRE O RAZON SOCIAL],CREDITO,COTIZ AS COTIZANTES,validacion as VALIDACION
,omision as IMPORTE,PAGO,(PAGO-omision) AS DIFERENCIA
,(SELECT '('+ incr.[inc]+')'+[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.[inc]=incidenciarale) as INC_RALE
,(SELECT '('+[docto]+')'+[descripcion] FROM [sireca].[dbo].[doc_rale] where [docto]=tdrale) as TD_RALE
FROM [sireca].[dbo].[eco]
WHERE subdel=@SUBDEL
and fechaEco=(@MES+@ANIO)
and validacion=?
and incidenciarale like ?
and tipoeco like ?+'%'
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="1900" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLTipo" DefaultValue="ninguno" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLInc" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLTipoCop" DefaultValue="vacio" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="PENDIENTES">
                    <asp:GridView ID="GV0102" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSource0102">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                SortExpression="SUBDEL" />
                            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                SortExpression="INSPECTOR" />
                            <asp:BoundField DataField="VALIDACION" HeaderText="VALIDACION" ReadOnly="True" 
                                SortExpression="VALIDACION" />
                            <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                                SortExpression="PERIODOS" />
                            <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                DataNavigateUrlFormatString="detallesinspector.aspx{0}" 
                                DataTextField="PATRONES" HeaderText="PATRONES" 
                                NavigateUrl="~/cruceslgpprocesarrale/detallesinspector.aspx" 
                                SortExpression="PATRONES" Target="_blank" />
                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                SortExpression="CREDITOS" />
                            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                SortExpression="COTIZANTES" />
                            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" />
                        </Columns>
                        <HeaderStyle BackColor="#8FB78E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource0102" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SELECT 
('?subdel='+@SUBDEL+'&amp;inspector='+responsable+'&amp;validacion='+validacion) as urlv
,subdel as SUBDEL
,upper((select nombre from fiscamovil.dbo.usuarios where id=responsable)) as INSPECTOR
,validacion as VALIDACION
,count(distinct(fechaeco)) as PERIODOS
,count(distinct(REG#PATRONAL)) as PATRONES
,count(credito) as CREDITOS
,sum(cotiz) as COTIZANTES
,sum(omision) as IMPORTE
FROM [sireca].[dbo].[eco]
where tdrale in ('01','02')
and subdel=@SUBDEL
and responsable is not null
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
group by subdel,responsable,validacion
order by 2">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GV0102Periodo" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSource0102Periodo">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                SortExpression="SUBDEL" />
                            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                SortExpression="INSPECTOR" />
                            <asp:BoundField DataField="VALIDACION" HeaderText="VALIDACION" ReadOnly="True" 
                                SortExpression="VALIDACION" />
                            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                SortExpression="PERIODO" />
                            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" />
                            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                SortExpression="CREDITOS" />
                            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                SortExpression="COTIZANTES" />
                            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" />
                        </Columns>
                        <HeaderStyle BackColor="#8FB78E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource0102Periodo" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SELECT subdel as SUBDEL
,upper((select nombre from fiscamovil.dbo.usuarios where id=responsable)) as INSPECTOR
,fechaeco as PERIODO
,validacion as VALIDACION
,count(distinct(REG#PATRONAL)) as PATRONES
,count(credito) as CREDITOS
,sum(cotiz) as COTIZANTES
,sum(omision) as IMPORTE
FROM [sireca].[dbo].[eco]
where tdrale in ('01','02')
and responsable is not null
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
and subdel=@SUBDEL
group by subdel,responsable,fechaeco,validacion
order by 2,3
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:WizardStep>
                <asp:WizardStep runat="server" title="EN RALE (NO TIENEN ECO)">
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSource3" Font-Size="8pt" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                SortExpression="SUBDEL" />
                            <asp:HyperLinkField DataNavigateUrlFields="REG.PATRONAL" 
                                DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                                DataTextField="REG.PATRONAL" HeaderText="REG.PATRONAL" 
                                NavigateUrl="~/observacionPatronal/Default.aspx" SortExpression="REG.PATRONAL" 
                                Target="_blank" />
                            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                                ReadOnly="True" SortExpression="CREDITO" />
                            <asp:BoundField DataField="PERIODO" 
                                HeaderText="PERIODO" ReadOnly="True" 
                                SortExpression="PERIODO" />
                            <asp:BoundField DataField="VALIDACION" HeaderText="VALIDACION" ReadOnly="True" 
                                SortExpression="VALIDACION" />
                            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" DataFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                SortExpression="INC" />
                            <asp:BoundField DataField="TD" 
                                HeaderText="TD" ReadOnly="True" SortExpression="TD">
                            </asp:BoundField>
                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                SortExpression="TIPO" />
                            <asp:BoundField DataField="FALTA" DataFormatString="{0:d}" HeaderText="FALTA" 
                                ReadOnly="True" SortExpression="FALTA" />
                        </Columns>
                        <HeaderStyle BackColor="#8FB78E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(50)
DECLARE @RALERCV as VARCHAR(50)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

exec(
'
select '''+@SUBDEL+''' as SUBDEL,replace([REGPATR],''-'','''') as [REG.PATRONAL],[NUMCRED] as CREDITO,(CONVERT(VARCHAR,MONTH(rale.PERIODO))+''/''+CONVERT(VARCHAR,YEAR(rale.PERIODO))) as PERIODO,''RALE SIN ECO'' as VALIDACION,IMPORTE as IMPORTE,(SELECT ''(''+ incr.[inc]+'')''+[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.[inc]=rale.INC) as INC,(SELECT ''(''+[docto]+'')''+[descripcion] FROM [sireca].[dbo].[doc_rale] where [docto]=TD) as TD,''COP'' as TIPO,FALTA 
from rale.dbo.['+@RALECOP+'] as rale
where TD in (''02'',''01'') and year(periodo)='''+@ANIO+''' and month(periodo)='''+@MES+'''
and not exists(select eco.[REG#PATRONAL] from sireca.dbo.eco where substring(eco.[REG#PATRONAL],1,10)=replace(rale.[REGPATR],''-'','''') and tipoeco in (''COP'',''COMP'') and eco.credito=rale.[NUMCRED])
union all 
select '''+@SUBDEL+''' as SUBDEL,replace([REGPATR],''-'','''') as [REG.PATRONAL],[NUMCRED] as CREDITO,(CONVERT(VARCHAR,MONTH(rale.PERIODO))+''/''+CONVERT(VARCHAR,YEAR(rale.PERIODO))) as PERIODO,''RALE SIN ECO'' as VALIDACION,IMPORTE as IMPORTE,(SELECT ''(''+ incr.[inc]+'')''+[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.[inc]=rale.INC) as INC,(SELECT ''(''+[docto]+'')''+[descripcion] FROM [sireca].[dbo].[doc_rale] where [docto]=TD) as TD,''COP'' as TIPO,FALTA 
from rale.dbo.['+@RALERCV+'] as rale
where TD in (''06'',''07'') and year(periodo)='''+@ANIO+''' and month(periodo)='''+@MES+'''
and not exists(select eco.[REG#PATRONAL] from sireca.dbo.eco where substring(eco.[REG#PATRONAL],1,10)=replace(rale.[REGPATR],''-'','''') and tipoeco in (''RCV'',''RCVCOMP'') and eco.credito=rale.[NUMCRED])
')
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="1900" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
        <br />
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 223px;
        }
    </style>
</asp:Content>


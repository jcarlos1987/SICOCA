<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="clasificaciondepagos.aspx.vb" Inherits="WebSIRECA.clasificaciondepagos" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="style1" height="40">
<div class="btn-group input-prepend">
                        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                            ToolTip="SUBDELEGACION" 
                            CssClass="btn dropdown-toggle btn-small btn-success" Width="100px">
                        </asp:DropDownList>
<span class="add-on">
                        <asp:Label ID="Label1" runat="server" Text="EMISION:"></asp:Label>
</span>
                        <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" 
                            CssClass="btn dropdown-toggle btn-small btn-success" Width="150px">
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
                            ToolTip="PERIODO" CssClass="btn dropdown-toggle btn-small btn-success" 
                            Width="100px">
                        </asp:DropDownList>
    <asp:LinkButton ID="BActualizar" runat="server" BorderColor="#7991C9" BorderStyle="Solid" BorderWidth="1px" CssClass="btn"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>

</div>
                    </td>
                    <td class="style1" height="40">
                        </td>
                    <td class="style1" height="40">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
<div class="progress progress-success progress-striped active">
  <div class="bar" style="width: 70%">CARGANDO...</div>
</div>
                        </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Wizard ID="Wizard1" runat="server" BackColor="#F7F6F3" 
                            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            FinishCompleteButtonText="" Font-Names="Verdana" Font-Size="0.8em" 
                            Height="100%" Width="100%" ActiveStepIndex="0">
                            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                                Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                ForeColor="#284775" />
                            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                            <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
                                VerticalAlign="Top" Width="190px" />
                            <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                            <WizardSteps>
                                <asp:WizardStep runat="server" Title="CLASIFICACIÓN DE PAGOS">
                                    <asp:HiddenField ID="HFsubdel" runat="server" Value="%" />
<div class="btn-group input-prepend">
<span class="add-on">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Rale:"></asp:Label>
</span>
                                    <asp:DropDownList ID="DDLRale" runat="server" 
                                        DataSourceID="SqlDataSourceRaleList" DataTextField="name" 
                                        DataValueField="name" CssClass="btn">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceRaleList" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 6 [name]
      ,[del]
      ,[subdel]
      ,[origen]
      ,[tipo]
      ,[fecha]
  FROM [rale].[dbo].[tablas]
WHERE [subdel]=? and [name] like '%COP%'
order by [fecha] desc">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceCrarT" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                                        SelectCommand="SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where actividad = 'abc'">
                                    </asp:SqlDataSource>
                                    
    <asp:LinkButton ID="Button1" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px" CssClass="btn"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
                                    <asp:Button ID="BActualizar0" runat="server" Text="Crear EMA vs LGP" BackColor="#FFFBFF" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px" CssClass="btn" />

</div>
                                    <asp:Label ID="LMsg" runat="server" Font-Size="12pt" ForeColor="#CC0000" ></asp:Label>
                                    <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSourceCrarT">
                                    </asp:GridView>
                                    <asp:GridView ID="GVTotal" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                        Caption="TOTAL" CellPadding="3" DataSourceID="SqlDataSourceTotal" 
                                        HorizontalAlign="Center">
                                        <Columns>
                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                        NavigateUrl='<%# "../pag_supervisores/detallesSeleccionReporteGeneral.aspx?busqueda=TODO&ema=" & Eval("nomema") %>' 
                                                        rel="gb_page_fs[]" Text='<%# Eval("PATRONES", "{0:N0}") %>' title="Detalles"></asp:HyperLink>
                                                </ItemTemplate>
                                                <ControlStyle Font-Bold="False" />
                                                <ItemStyle Font-Bold="False" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES" />
                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
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
                                    <asp:SqlDataSource ID="SqlDataSourceTotal" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 0 count([PAGADO POR]) as [PATRONES]
,'0' as [COTIZANTES]
,'0' as [IMPORTE]
,'0' as [nomema]
FROM [sireca].[dbo].[EMMA33010612]"></asp:SqlDataSource>
                                    <asp:GridView ID="GVDTotal" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                        Caption="DETALLES DEL TOTAL" CellPadding="3" DataSourceID="SqlDataSourceDTotal" 
                                        HorizontalAlign="Center">
                                        <Columns>
                                            <asp:BoundField DataField="tipodepago" HeaderText="PERIODO DE PAGO" 
                                                NullDisplayText="SIN PAGO" SortExpression="tipodepago" />
                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink2" runat="server" 
                                                        NavigateUrl='<%# "../pag_supervisores/detallesSeleccionReporteGeneral.aspx?busqueda=DETALLE&ema=" & Eval("nomema") & "&tipodepago=" & Eval("tipodepago")%>' 
                                                        rel="gb_page_fs[]" Text='<%# Eval("PATRONES", "{0:N0}") %>' title="Detalles"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES" />
                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
                                            <asp:BoundField />
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
                                    <asp:SqlDataSource ID="SqlDataSourceDTotal" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 0 'x' as [tipodepago]
,'0' as [PATRONES]
,'0' as [COTIZANTES]
,'0' as [IMPORTE]
,'0' as [nomema]
  FROM [sireca].[dbo].[EMMA33010312]
group by [tipodepago]"></asp:SqlDataSource>
                                    <asp:GridView ID="GVDeben" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                        Caption="SALDOS EN RALE" CellPadding="4" DataSourceID="SqlDataSourceDeben" 
                                        HorizontalAlign="Center">
                                        <Columns>
                                            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" 
                                                SortExpression="ESTADO" />
                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink3" runat="server" 
                                                        NavigateUrl='<%# "../pag_supervisores/detallesSeleccionDeven.aspx?tipo=DEBEN&estado=" & Eval("ESTADO") & "&subdel=" & Eval("subdel") & "&anio=" & Eval("anio") & "&mes=" & Eval("mes") %>' 
                                                        rel="gb_page_fs[]" Text='<%# Eval("PATRONES", "{0:N0}") %>' title="Detalles"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES" />
                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
                                            <asp:BoundField />
                                        </Columns>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                        <SortedDescendingHeaderStyle BackColor="#002876" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceDeben" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ESTADO]
	  ,'0' as PATRONES      
      ,'0' as COTIZANTES 
	  ,'0' as [IMPORTE]   
  FROM [sireca].[dbo].[TEMP]
where estado='expirado'
group by [ESTADO]"></asp:SqlDataSource>
                                    <asp:GridView ID="GVDDeben" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                        Caption="DETALLES DE LOS SALDOS EN RALE" CellPadding="4" 
                                        DataSourceID="SqlDataSourceDDeben" HorizontalAlign="Center">
                                        <Columns>
                                            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                                                NullDisplayText="SIN ATENDER" SortExpression="INCIDENCIA" />
                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink4"  runat="server" 
                                                        NavigateUrl='<%# "../pag_supervisores/detallesSeleccionDeven.aspx?tipo=DDEBEN&incidencia=" & Eval("INCIDENCIA") & "&subdel=" & Eval("subdel") & "&anio=" & Eval("anio") & "&mes=" & Eval("mes") %>' 
                                                        rel="gb_page_fs[]" Text='<%# Eval("PATRONES", "{0:N0}") %>' title="Detalles"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES" />
                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
                                        </Columns>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                        <SortedDescendingHeaderStyle BackColor="#002876" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceDDeben" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 0 [INCIDENCIA]
	  ,'0' as [PATRONES]
	  ,'0' as [COTIZANTES]
      ,'0' as [IMPORTE]
  FROM [sireca].[dbo].[TEMPDEBEN127_0_0_1]
group by [INCIDENCIA]"></asp:SqlDataSource>
                                </asp:WizardStep>
                                <asp:WizardStep runat="server" title="GRAF. PAGOS POR DÍA">
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
                                                <asp:SqlDataSource ID="SqlDataSourceDiasPagos" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                    
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PERIODO_ANIO as VARCHAR(4)
DECLARE @PERIODO_MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @IMP_COP as FLOAT
DECLARE @PATRONES_COP as INT
DECLARE @IMP_RCV as FLOAT
DECLARE @IMP_DISPONIBLE_COP as FLOAT
DECLARE @PATRONES_DISPONIBLE_COP as INT
DECLARE @IMP_DISPONIBLE_RCV as FLOAT
SET @PERIODO_ANIO=?
SET @PERIODO_MES=?
SET @SUBDEL=?

select 
(@PERIODO_MES+'/'+@PERIODO_ANIO) as PERIODO
,RCP_FEC_MOV as FECH_MOV
,count(distinct([REG#PATRONAL])) as PATRONES
,count([REG#PATRONAL]) as PAGOS_EFECTUADOS
,sum(pro.[RCP_IMP_COP]) as PRO_IMP_COP
,sum(pro.[RCP_IMP_RCV]) as PRO_IMP_RCV
FROM [procesar].[dbo].[RCPRO] as pro inner join sireca.dbo.eco as eco 
on eco.fechaeco=(substring(RCP_PER,6,2)+substring(RCP_PER,1,4)) and [REG#PATRONAL]=[RCP_REGPAT]
where 
year(RCP_FEC_MOV)=@PERIODO_ANIO 
and month(RCP_FEC_MOV)=(@PERIODO_MES+1)
and RCP_SUB like @SUBDEL and RCP_PER=(@PERIODO_ANIO+'/'+@PERIODO_MES)
and (pro.[RCP_IMP_COP] not in ('0') or pro.[RCP_IMP_RCV] not in ('0'))
group by RCP_FEC_MOV
order by RCP_FEC_MOV
">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceDiasPagos" 
                                                    Height="500px" Width="800px">
                                                    <Series>
                                                        <asp:Series ChartArea="ChartArea1" ChartType="Line" Label="#VAL" Name="Series1" 
                                                            XValueMember="FECH_MOV" YValueMembers="PATRONES">
                                                        </asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1">
                                                            <AxisY>
                                                                <MajorGrid LineColor="Gray" LineDashStyle="Dot" />
                                                                <ScaleBreakStyle StartFromZero="Yes" />
                                                            </AxisY>
                                                            <AxisX IsLabelAutoFit="False" 
                                                                
                                                                LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, LabelsAngleStep90, WordWrap" 
                                                                IsStartedFromZero="False">
                                                                <MajorGrid LineColor="DarkGray" LineDashStyle="Dot" />
                                                                <LabelStyle Angle="-90" />
                                                                <ScaleBreakStyle StartFromZero="Yes" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                    <Titles>
                                                        <asp:Title Name="Title1" Text="PATRONES, Nº DE PAGOS POR DÍA">
                                                        </asp:Title>
                                                    </Titles>
                                                </asp:Chart>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:WizardStep>
                                <asp:WizardStep runat="server" title="TABLA PAGOS POR DÍA">
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
                                                <asp:GridView ID="GVRecaudacion0" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                    Caption="FECHAS DE RECAUDACION C.O.P. Y R.C.V." CaptionAlign="Left" 
                                                    CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceDiasPagos">
                                                    <Columns>
                                                        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                            SortExpression="PERIODO">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="FECH_MOV" DataFormatString="{0:d}" 
                                                            HeaderText="FECH. MOV." ReadOnly="True" SortExpression="FECH_MOV">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                            HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PAGOS_EFECTUADOS" DataFormatString="{0:N0}" 
                                                            HeaderText="Nº DE PAGOS" ReadOnly="True" SortExpression="PAGOS_EFECTUADOS">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PRO_IMP_COP" DataFormatString="{0:C}" 
                                                            HeaderText="RECAUDACIÓN C.O.P." ReadOnly="True" SortExpression="PRO_IMP_COP">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PRO_IMP_RCV" DataFormatString="{0:C}" 
                                                            HeaderText="RECAUDACIÓN R.C.V." ReadOnly="True" SortExpression="PRO_IMP_RCV">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle Font-Bold="True" />
                                                    <HeaderStyle BackColor="#99CB99" />
                                                </asp:GridView>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:WizardStep>
                                <asp:WizardStep runat="server" Title="GRAF. PAGOS POR SECTOR">
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
                                                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSourcePorSector" 
                                                    Height="500px" Width="800px">
                                                    <Series>
                                                        <asp:Series ChartArea="ChartArea1" ChartType="Line" Label="#VAL" Name="Series1" 
                                                            XValueMember="SECTOR" YValueMembers="PATRONES">
                                                        </asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1">
                                                            <AxisY Minimum="0">
                                                                <MajorGrid LineColor="Gray" LineDashStyle="Dot" />
                                                            </AxisY>
                                                            <AxisX IntervalAutoMode="VariableCount" IsLabelAutoFit="False" 
                                                                
                                                                LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, LabelsAngleStep90, WordWrap" 
                                                                Minimum="0">
                                                                <MajorGrid LineColor="DarkGray" LineDashStyle="Dot" />
                                                                <LabelStyle Angle="-90" />
                                                                <ScaleBreakStyle StartFromZero="Yes" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                    <Titles>
                                                        <asp:Title Name="Title1" Text="PATRONES, Nº DE PAGOS POR DÍA">
                                                        </asp:Title>
                                                    </Titles>
                                                </asp:Chart>
                                                <asp:SqlDataSource ID="SqlDataSourcePorSector" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                    
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @PERIODO_ANIO as VARCHAR(4)
DECLARE @PERIODO_MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @META_MES as FLOAT
DECLARE @IMP_COP as FLOAT
DECLARE @PATRONES_COP as INT
DECLARE @IMP_RCV as FLOAT
DECLARE @IMP_DISPONIBLE_COP as FLOAT
DECLARE @PATRONES_DISPONIBLE_COP as INT
DECLARE @IMP_DISPONIBLE_RCV as FLOAT
DECLARE @RESPONSABLE AS VARCHAR(6)
SET @PERIODO_ANIO=?
SET @PERIODO_MES=?
SET @SUBDEL=?
SET @RESPONSABLE='370'
SET @META_MES='200000'
select 
(@PERIODO_MES+'/'+@PERIODO_ANIO) as PERIODO
,convert(int,eco.sector) as SECTOR
,count(distinct([REG#PATRONAL])) as PATRONES
,count([REG#PATRONAL]) as PAGOS_EFECTUADOS
,sum(pro.[RCP_IMP_COP]) as PRO_IMP_COP
,sum(pro.[RCP_IMP_RCV]) as PRO_IMP_RCV
FROM [procesar].[dbo].[RCPRO] as pro inner join sireca.dbo.eco as eco 
on eco.fechaeco=(substring(RCP_PER,6,2)+substring(RCP_PER,1,4)) and [REG#PATRONAL]=[RCP_REGPAT] --and eco.tipoEco in ('COP','COMP')
where 
year(RCP_FEC_MOV)=@PERIODO_ANIO 
and month(RCP_FEC_MOV)=(@PERIODO_MES+1)
and RCP_SUB like @SUBDEL and RCP_PER=(@PERIODO_ANIO+'/'+@PERIODO_MES)
and (pro.[RCP_IMP_COP] not in ('0') or pro.[RCP_IMP_RCV] not in ('0'))
--and eco.responsable=@RESPONSABLE
group by eco.sector
order by convert(int,eco.sector)
">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:WizardStep>
                                <asp:WizardStep runat="server" Title="TABLA PAGOS POR SECTOR">
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
                                                <asp:GridView ID="GVRecaudacion1" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
                                                    Caption="RECAUDACION C.O.P. Y R.C.V. POR SECTOR" CaptionAlign="Left" 
                                                    CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourcePorSector">
                                                    <Columns>
                                                        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                            SortExpression="PERIODO">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                                                            SortExpression="SECTOR" DataFormatString="{0:D2}">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                                            SortExpression="PATRONES" DataFormatString="{0:N0}">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PAGOS_EFECTUADOS" HeaderText="Nº DE PAGOS" 
                                                            ReadOnly="True" SortExpression="PAGOS_EFECTUADOS" 
                                                            DataFormatString="{0:N0}">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PRO_IMP_COP" HeaderText="RECAU. C.O.P." 
                                                            ReadOnly="True" SortExpression="PRO_IMP_COP" DataFormatString="{0:C}">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="PRO_IMP_RCV" HeaderText="RECAU. R.C.V." 
                                                            ReadOnly="True" SortExpression="PRO_IMP_RCV" DataFormatString="{0:C}">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle Font-Bold="True" />
                                                    <HeaderStyle BackColor="#99CB99" />
                                                </asp:GridView>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:WizardStep>
                            </WizardSteps>
                        </asp:Wizard>
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
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .style1
    {
        height: 32px;
    }
</style>
</asp:Content>


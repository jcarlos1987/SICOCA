<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="desarrollodelacobranza.aspx.vb" Inherits="WebSIRECA.desarrollodelacobranza" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>CARGANDO...</ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
        Width="100px" CssClass="btn dropdown-toggle btn-small">
        </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLMes" runat="server" 
        Width="100px" CssClass="btn dropdown-toggle btn-small">
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
                            <asp:DropDownList ID="DDLAnio" runat="server" 
        Width="100px" CssClass="btn dropdown-toggle btn-small"></asp:DropDownList>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px">&nbsp;&nbsp;Actualizar&nbsp;&nbsp;</asp:LinkButton>
</div>
            <br />
        <asp:Panel ID="Panel1" runat="server" BackColor="White" HorizontalAlign="Center">
<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="1000px" 
            Height="550px">
        <Series>
            <asp:Series ChartType="Line" Name="PAG. OPORT" XValueMember="PERIODO" 
                YValueMembers="PAG_OPORT" Legend="Legend1" BorderWidth="3" 
                Font="Microsoft Sans Serif, 6.75pt" 
                ToolTip="#AXISLABEL\nPAGO OPORTUNO: #VAL{N} %" ChartArea="ChartArea1" 
                CustomProperties="DrawingStyle=Cylinder, LabelStyle=Bottom" 
                Label="#VAL{N} %">
            </asp:Series>
            <asp:Series ChartType="Line" Name="PAG. 1 MES" XValueMember="PERIODO" 
                YValueMembers="PAG_1M" Legend="Legend1" BorderWidth="3" 
                Font="Microsoft Sans Serif, 7pt" 
                ToolTip="#AXISLABEL\nPAGO AL 1° MES: #VAL{N} %" Label="#VAL{N} %" 
                CustomProperties="LabelStyle=Bottom">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" 
                Name="PAG. 2 MES" ToolTip="#AXISLABEL\nPAGO AL 2° MES: #VAL{N} %" 
                XValueMember="PERIODO" YValueMembers="PAG_2M" BorderWidth="3" 
                Font="Microsoft Sans Serif, 6.75pt" Label="#VAL{N} %" 
                CustomProperties="LabelStyle=Bottom">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Legend="Legend1" 
                Name="MORA 2 MES" XValueMember="PERIODO" YAxisType="Secondary" 
                YValueMembers="MORA_2M" 
                ToolTip="#AXISLABEL\nMORA AL 2° MES: #VAL{N}" 
                CustomProperties="DrawingStyle=Cylinder" Label="#VAL{N}" Color="Pink">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" ShadowColor="Silver">
                <AxisY Maximum="105" Minimum="75">
                    <MajorGrid LineColor="LightGray" LineDashStyle="Dash" />
                    <MajorGrid LineColor="Gray" LineDashStyle="Dash" />
                    <LabelStyle Format="{0:N0}" />
                </AxisY>
                <AxisX IsLabelAutoFit="False" Maximum="13" 
                    Minimum="0" 
                    LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, WordWrap" 
                    IntervalAutoMode="VariableCount">
                    <MajorGrid LineColor="Gainsboro" LineDashStyle="Dash" />
                    <MajorGrid LineColor="Gray" LineDashStyle="Dash" />
                    <LabelStyle Angle="-90" />
                </AxisX>
                <AxisX2 IsLabelAutoFit="False">
                    <MajorGrid LineColor="255, 128, 0" LineDashStyle="Dot" />
                    <MajorGrid LineColor="255, 128, 0" LineDashStyle="Dot" />
                </AxisX2>
                <AxisY2 Crossing="Min" Maximum="9000000">
                    <MajorGrid LineColor="255, 128, 0" LineDashStyle="Dot" />
                    <MajorGrid LineColor="255, 128, 0" LineDashStyle="Dot" />
                    <LabelStyle Format="{0:N0}" />
                </AxisY2>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" Alignment="Center" Docking="Top">
                <CellColumns>
                    <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column1">
                        <Margins Left="15" Right="15" />
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                    <asp:LegendCellColumn Alignment="MiddleLeft" Name="Column2">
                        <Margins Left="15" Right="15" />
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                </CellColumns>
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Name="Title1" 
                Text="2. DESARROLLO DE LA COBRANZA DE LA EMISION MENSUAL ANTICIPADA">
            </asp:Title>
            <asp:Title Name="Title2" Text="2.2 MODALIDADES 10, 13, Y 17">
            </asp:Title>
        </Titles>
    </asp:Chart>
        </asp:Panel>
    
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @PERIODO1 as VARCHAR(7)
DECLARE @PERIODO2 as VARCHAR(7)
DECLARE @AUMENTO AS INT
SET @AUMENTO=12
SET @SUBDEL=?
SET @PERIODO1=?+'/'+?
SET @PERIODO2=CONVERT(NVARCHAR(4),YEAR(DATEADD(MONTH,@AUMENTO,SUBSTRING(@PERIODO1,1,4))))+'/'+(CASE WHEN LEN(MONTH(DATEADD(MONTH,@AUMENTO,SUBSTRING(@PERIODO1,1,4))))=1 THEN '0'+CONVERT(NVARCHAR(2),MONTH(DATEADD(MONTH,@AUMENTO,SUBSTRING(@PERIODO1,1,4)))) ELSE CONVERT(NVARCHAR(2),MONTH(DATEADD(MONTH,@AUMENTO,SUBSTRING(@PERIODO1,1,4)))) END)
SELECT  [RC_PERIODO] as PERIODO
,[RC_POR_PAG_OPOR_RESUL] as PAG_OPORT
,[RC_POR_PAG_1M_RESUL] as PAG_1M
,[RC_POR_PAG_2M_RESUL] as PAG_2M
,([RC_IMP_MORA_2M_RESUL]*1000) as MORA_2M
FROM [sirecacobros].[dbo].[RF_INGRESOS]
WHERE [RC_SUBDEL]=@SUBDEL
and [RC_PERIODO] between @PERIODO1 and @PERIODO2
order by 1
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

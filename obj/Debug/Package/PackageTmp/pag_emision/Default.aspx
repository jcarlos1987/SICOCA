<%@ Page Language="vb" MasterPageFile ="~/SiteCobros.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default20" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    
</asp:Content>
<asp:Content ID ="contend2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>    
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
    <asp:Label ID="Lfecha" runat="server" Text="PERIODO:" ></asp:Label>
    <asp:DropDownList ID="DDLPeriodo" runat="server" 
        DataSourceID="SqlDataSourcePeriodo" DataTextField="fechas" 
        DataValueField="fechas" AutoPostBack="True">
    </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="INSPECTOR:"></asp:Label>
        <asp:DropDownList ID="DDLInspector" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="SqlDataSourceInspector" 
            DataTextField="nombre" DataValueField="valor">
            <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
sire.[id] as valor
,upper((SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id])) as nombre
FROM [sireca].[dbo].[usuarios] as sire
where 
user_type='1' and subdel=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePeriodo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct (eco.fechaEco) as fechas
FROM [sireca].[dbo].[eco] eco
group by eco.fechaEco
order by fechas desc">
    </asp:SqlDataSource>
   
    
    <hr />
    <asp:Panel ID="PInformacion" runat="server" HorizontalAlign="Center" 
            Visible="False">
        <center >
            <table style="width:100%;" border="0" cellpadding="0" cellspacing="0" 
                frame="below">
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:ImageButton ID="IBInspector" runat="server" Height="188px" 
                            ImageUrl="~/imagenes/usuarios/avatar/default.jpg" Width="186px" 
                            BorderColor="Black" BorderStyle="Double" />
                    </td>
                    <td class="style1">
                        <table style="width:100%;">
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Nombre:</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LNombre" runat="server"></asp:Label>
                                </td>
                                <td align="left" rowspan="8">
                                    <asp:Chart ID="ChartCOP" runat="server" BackColor="Transparent" 
                                        DataSourceID="SqlDataSourceCOP" Height="150px">
                                        <Series>
                                            <asp:Series ChartType="Pie" Name="Series1" XValueMember="ESTADO" 
                                                YValueMembers="PATRONES" Legend="Legend1">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea BackColor="Transparent" Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                        <Legends>
                                            <asp:Legend Alignment="Center" Name="Legend1">
                                            </asp:Legend>
                                        </Legends>
                                        <Titles>
                                            <asp:Title Name="Title1" Text="COP">
                                            </asp:Title>
                                        </Titles>
                                    </asp:Chart>
                                    <br />
                                    <asp:Chart ID="ChartRCV" runat="server" BackColor="Transparent" 
                                        DataSourceID="SqlDataSourceRCV" Height="150px">
                                        <Series>
                                            <asp:Series ChartType="Pie" Legend="Legend1" Name="Series1" 
                                                XValueMember="ESTADO" YValueMembers="PATRONES">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea BackColor="Transparent" Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                        <Legends>
                                            <asp:Legend Alignment="Center" Name="Legend1">
                                            </asp:Legend>
                                        </Legends>
                                        <Titles>
                                            <asp:Title Name="Title1" Text="RCV">
                                            </asp:Title>
                                        </Titles>
                                    </asp:Chart>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    &nbsp;</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LAntiguedad" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#D4D0C8">
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Cargo:</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LCargo" runat="server"></asp:Label>
                                    (INSPECTOR A)</td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    &nbsp;</td>
                                <td align="left" style="font-size: 24px" >
                                    <asp:Label ID="LCredencial" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;" 
                                    bgcolor="#D4D0C8">
                                    Subdelegacion:</td>
                                <td align="left"  bgcolor="#D4D0C8" style="font-size: 24px">
                                    <asp:Label ID="LSubdel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    &nbsp;</td>
                                <td align="left" style="font-size: 24px" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Recaudacion:</td>
                                <td align="left" style="font-size: 24px" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3" align="left" style="font-weight: bold; font-size: 24px;">
                                    Meta:</td>
                                <td align="left" style="font-size: 24px" >
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            </center>
        </asp:Panel>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            Caption="&lt;strong&gt;COP&lt;/strong&gt;" CaptionAlign="Left" CellPadding="3" 
            CellSpacing="1" DataSourceID="SqlDataSourceCOP" GridLines="None">
            <Columns>
                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" ReadOnly="True" 
                    SortExpression="ESTADO" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="IMPCOP" HeaderText="IMPCOP" ReadOnly="True" 
                    SortExpression="IMPCOP" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCOP" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @FECH_ECO VARCHAR(50)
SET @SUBDEL=?
SET @ID_EJECUTOR=?
SET @FECH_ECO=?
SELECT 
(CASE WHEN ([RCP_IMP_COP] IS NULL OR [RCP_IMP_COP] IN ('0')) THEN 'SALDO' ELSE 'RECAUDADO' END) AS ESTADO
,COUNT(DISTINCT([REG#PATRONAL])) AS PATRONES
,COUNT(eco.CREDITO) AS CREDITOS
,sum(cotiz) as COTIZANTES
,sum(eco.[OMISION]) as IMPORTE
,sum(pro.[RCP_IMP_COP]) as IMPCOP
FROM [sireca].[dbo].[eco] as eco left join 
(
select pro1.[RCP_REGPAT],pro1.[RCP_PER],sum(pro1.[RCP_IMP_COP]) as [RCP_IMP_COP] from procesar.dbo.RCPRO as pro1
where RCP_SUB=@SUBDEL
group by pro1.[RCP_REGPAT],pro1.[RCP_PER]
)as pro
on eco.[REG#PATRONAL]=pro.[RCP_REGPAT] and eco.fechaeco=convert(int,substring([RCP_PER],6,2)+substring([RCP_PER],1,4))
where eco.responsable = @ID_EJECUTOR
and tipoEco in ('COP','COMP')
AND eco.fechaEco=@FECH_ECO and eco.subdel=@SUBDEL
GROUP BY (CASE WHEN ([RCP_IMP_COP] IS NULL OR [RCP_IMP_COP] IN ('0')) THEN 'SALDO' ELSE 'RECAUDADO' END)
order by 2,1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLInspector" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="00000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            Caption="&lt;strong&gt;RCV&lt;/strong&gt;" CaptionAlign="Left" CellPadding="3" 
            CellSpacing="1" DataSourceID="SqlDataSourceRCV" GridLines="None">
            <Columns>
                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" ReadOnly="True" 
                    SortExpression="ESTADO" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="IMPRCV" HeaderText="IMPRCV" ReadOnly="True" 
                    SortExpression="IMPRCV" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceRCV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @FECH_ECO VARCHAR(50)
SET @SUBDEL=?
SET @ID_EJECUTOR=?
SET @FECH_ECO=?
SELECT 
(CASE WHEN ([RCP_IMP_RCV] IS NULL OR [RCP_IMP_RCV] IN ('0')) THEN 'SALDO' ELSE 'RECAUDADO' END) AS ESTADO
,COUNT(DISTINCT([REG#PATRONAL])) AS PATRONES
,COUNT(eco.CREDITO) AS CREDITOS
,sum(cotiz) as COTIZANTES
,sum(eco.[OMISION]) as IMPORTE
,sum(pro.[RCP_IMP_RCV]) as IMPRCV
FROM [sireca].[dbo].[eco] as eco left join 
(
select pro1.[RCP_REGPAT],pro1.[RCP_PER],sum(pro1.[RCP_IMP_RCV]) as [RCP_IMP_RCV] from procesar.dbo.RCPRO as pro1
where RCP_SUB=@SUBDEL
group by pro1.[RCP_REGPAT],pro1.[RCP_PER]
)as pro
on eco.[REG#PATRONAL]=pro.[RCP_REGPAT] and eco.fechaeco=convert(int,substring([RCP_PER],6,2)+substring([RCP_PER],1,4))
where eco.responsable= @ID_EJECUTOR
and tipoEco in ('RCV','RCVCOMP')
AND eco.fechaEco=@FECH_ECO and eco.subdel=@SUBDEL
GROUP BY (CASE WHEN ([RCP_IMP_RCV] IS NULL OR [RCP_IMP_RCV] IN ('0')) THEN 'SALDO' ELSE 'RECAUDADO' END)
order by 2,1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLInspector" DefaultValue="00000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLPeriodo" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

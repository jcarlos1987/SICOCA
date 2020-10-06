<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallePAtronalAll.aspx.vb" Inherits="WebSIRECA.detallePAtronalAll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Detalles</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <asp:HiddenField ID="HiddenField1" runat="server" Value="G622269610" />
        <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" 
            DataSourceID="SqlDataSourceDatePatron" ForeColor="Black" GridLines="None" 
            Width="100%" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="REG. PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG. PATRONAL" />
                <asp:BoundField DataField="RAZON SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="RAZON SOCIAL" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" 
                    SortExpression="LOCALIDAD" />
                <asp:BoundField DataField="lat" SortExpression="lat">
                <ItemStyle Font-Size="1pt" ForeColor="#FFFBD6" />
                </asp:BoundField>
                <asp:BoundField DataField="lng" SortExpression="lng">
                <ItemStyle Font-Size="1pt" ForeColor="#FFFBD6" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <p>&nbsp;</p>
        <fieldset><legend>COP</legend>
        <asp:SqlDataSource ID="SqlDataSourceDatePatron" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select top 1 REG#PATRONAL as [REG. PATRONAL],[NOMBRE O RAZON SOCIAL] AS [RAZON SOCIAL],COTIZ AS [COTIZANTES],dom AS [DOMICILIO], loc AS [LOCALIDAD]
,lat,lng
FROM sireca .dbo.eco left join (select dom,loc,regpat,lat,lng from sireca.dbo.patrones) as ptn on ptn.regpat =?
where substring(REG#PATRONAL,1,10)=ptn.regpat
order by id desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="0000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewCuotas" runat="server" AutoGenerateColumns="False" 
            Caption="CUOTAS COP" DataSourceID="SqlDataSourceCuotas" 
            HorizontalAlign="Left" Width="173px" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:GridView ID="GridViewMultas" runat="server" AutoGenerateColumns="False" 
            Caption="MULTAS COP" DataSourceID="SqlDataSourceCuotasMultas" 
            HorizontalAlign="Left" Width="173px" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:GridView ID="GridViewCuotasSivepas" runat="server" 
            AutoGenerateColumns="False" Caption="SIVEPAS COP" DataSourceID="SqlDataSourceSivep" 
            HorizontalAlign="Left" Width="173px" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:GridView ID="GWMulSive" runat="server" AutoGenerateColumns="False" 
            Caption="MULTAS SIV. COP y RCV" DataSourceID="SqlDataSourceMultSiv" 
            Width="215px" HorizontalAlign="Left" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView></fieldset>
        <asp:SqlDataSource ID="SqlDataSourceCuotas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ACOP101012]
  where replace(REGPATR,'-','')=? and TD ='02'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCuotasMultas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ACOP101012]
  where replace(REGPATR,'-','')=? and TD ='80'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSivep" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ACOP101012]
  where replace(REGPATR,'-','')=? and TD ='03'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceMultSiv" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ACOP101012]
  where replace(REGPATR,'-','')=? and TD ='82'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>&nbsp;</p>
    <fieldset><legend>RCV</legend>
        <asp:GridView ID="GridViewCuotas0" runat="server" AutoGenerateColumns="False" 
            Caption="CUOTAS RCV" DataSourceID="SqlDataSourceCuotasRCV" 
        HorizontalAlign="Left" Width="173px" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:GridView ID="GridViewCuotas1" runat="server" AutoGenerateColumns="False" 
            Caption="MULTAS RCV" DataSourceID="SqlDataSourceMultRCV" 
        HorizontalAlign="Left" Width="173px" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:GridView ID="GridViewCuotas2" runat="server" AutoGenerateColumns="False" 
            Caption="SIVEPAS RCV" DataSourceID="SqlDataSourceSIVRCV" 
        HorizontalAlign="Left" Width="173px" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" NullDisplayText="$0" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView></fieldset><p>&nbsp;</p>
        <asp:SqlDataSource ID="SqlDataSourceCuotasRCV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
        
        SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ARCV101012]
  where replace(REGPATR,'-','')=? and TD ='06'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceMultRCV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
        
        SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ACOP101012]
  where replace(REGPATR,'-','')=? and TD ='81'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSIVRCV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
        
        SelectCommand="SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ARCV101012]
  where replace(REGPATR,'-','')=? and TD ='03'
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GWMulSive0" runat="server" AutoGenerateColumns="False" 
            Caption="TOTAL" DataSourceID="SqlDataSourceCOPTOTAL" 
            Width="215px" CellPadding="4" ForeColor="#333333" GridLines="None" 
        BorderStyle="Solid">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="periodos" HeaderText="periodos" ReadOnly="True" 
                    SortExpression="periodos" />
                <asp:BoundField DataField="importe" HeaderText="importe" ReadOnly="True" 
                    SortExpression="importe" DataFormatString="{0:C}" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCOPTOTAL" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="declare @regpat as varchar(50)
set @regpat=?
if exists(select * from sireca.dbo.sysobjects where name = 'importet')
begin
drop table sireca.dbo.importet
end
SELECT 
count(REGPATR) as periodos
,SUM(IMPORTE) as importe
into sireca.dbo.importet
  FROM [rale].[dbo].[3301ACOP101012]
  where replace(REGPATR,'-','')=@regpat and TD in ('02','80','03','82','81')
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
  union 
  SELECT 
	count(REGPATR) as periodos
,SUM(IMPORTE) as importe
  FROM [rale].[dbo].[3301ARCV101012]
  where replace(REGPATR,'-','')=@regpat and TD in ('03','06')
and len(PERIODO) not in ('7')
  and convert(datetime,PERIODO,103) between CONVERT(datetime,'01/11/2011',103) and CONVERT(datetime,'30/11/2012',103)
  
  select sum(periodos) as periodos
,SUM(importe) as importe
from sireca.dbo.importet
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="000" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        </center>
    </div>
            </div>
    </form>
</body>
</html>

<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master"  AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default9" %>
<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID ="head" >
    
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Subdel"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="Tipo"></asp:Label>
        <asp:DropDownList ID="DDLTipo" runat="server" AutoPostBack="True">
            <asp:ListItem Value="1">PAE PERIODO</asp:ListItem>
            <asp:ListItem Value="2">PAE PERIODO CON MORA</asp:ListItem>
            <asp:ListItem Value="3">PAE SIN EMA - MORA</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="Tipo"></asp:Label>
        <asp:DropDownList ID="DDL" runat="server" AutoPostBack="True">
            <asp:ListItem Value="%">TODOS</asp:ListItem>
            <asp:ListItem>COP</asp:ListItem>
            <asp:ListItem>RCV</asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Exportar a Excel" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourcePaes" AllowSorting="True" Font-Size="10pt" 
            HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="TIPO" SortExpression="TIPO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"
                            NavigateUrl='<%# "CreditosPae.aspx?regpat=" & Eval("REGPATR") & "&razon=" & Eval("RAZON_SOCIAL") & "&t=general&tipoECO=" & Eval("TIPO") %>' 
                            Text='<%# Eval("TIPO") %>' ToolTip="Detalles del Adeudo"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ordenAsignacion" HeaderText="ordenAsignacion" 
                    SortExpression="ordenAsignacion" Visible="False" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="responsable" HeaderText="EJECUTOR" 
                    ReadOnly="True" SortExpression="responsable" />
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CASOS" HeaderText="CASOS" SortExpression="CASOS" 
                    DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO" NullDisplayText="$ 0" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTE" HeaderText="COTIZANTE" 
                    SortExpression="COTIZANTE" Visible="False" />
                <asp:BoundField DataField="EMISION" HeaderText="EMISION" 
                    SortExpression="EMISION" Visible="False" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" />
                <asp:BoundField DataField="TIPO_ADEUDO" HeaderText="TIPO_ADEUDO" 
                    SortExpression="TIPO_ADEUDO" Visible="False" />
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
        <asp:SqlDataSource ID="SqlDataSourcePaes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @TIPO AS VARCHAR(50)
SET @TIPO=?
SELECT 
ptn.ordenAsignacion
,ecot.sector
,'' as responsable
	  ,[REGPATR]
      ,ecot.RAZON_SOCIAL as [RAZON_SOCIAL]
      ,[CASOS]
      ,[ADEUDO]
      ,[COTIZANTE]
      ,[EMISION]
      ,[DIAS]
      ,[TIPO_ADEUDO]
,ecot.tipofile as TIPO
  FROM [sirecacobros].[dbo].[paeTemp] as ecot left join sireca.dbo.patrones as ptn on replace(regpatr,'-','') = regpat
  where tipofile like @TIPO+'%' and
  exists(
  select ecotip.regpatr
  from [sirecacobros].[dbo].[ecoTipos] as ecotip 
  where
  ecotip.REGPATR=ecot.regpatr
  and ecotip.CLASIFICACION=?
  and ecotip.subdel=?
 and grupo='PAE'
and tipofile like @TIPO+'%'
  )
--where ecot.subdel='01'
--order by 1,[ADEUDO] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDL" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

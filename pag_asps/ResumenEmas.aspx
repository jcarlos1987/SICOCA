<%@ Page Language="vb" MasterPageFile ="~/Site.Master" AutoEventWireup="false" CodeBehind="ResumenEmas.aspx.vb" Inherits="WebSIRECA.ResumenEmas" %>

<asp:Content ID="conten1" runat ="server" ContentPlaceHolderID ="head" >
    <title>Resultados</title>
    <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>

    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="Panel3" runat="server" BackColor="#BDCBD6"><br />
        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Subdelegacion:" 
                Font-Bold="True"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSourceSubdelList" DataTextField="subdel" 
                DataValueField="subdel">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceSubdelList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [subdel]      
FROM [rale].[dbo].[tablas]
group by subdel"></asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Rale:" Font-Bold="True"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLRale" runat="server" 
                DataSourceID="SqlDataSourceRaleList" DataTextField="name" DataValueField="name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceRaleList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 1000 [name]
      ,[del]
      ,[subdel]
      ,[origen]
      ,[tipo]
      ,[fecha]
  FROM [rale].[dbo].[tablas]
WHERE [subdel]=?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;            
            <asp:Label ID="Label2" runat="server" Text="Periodo:" Font-Bold="True"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLPeriodo" runat="server" 
                DataSourceID="SqlDataSourcePeriodoList" DataTextField="fechaEco" 
                DataValueField="fechaEco">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcePeriodoList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT fechaEco
FROM sireca.[dbo].eco
group by fechaEco"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCrarT" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="drop table [sireca].[dbo].[patrones3301]

SELECT * INTO [sireca].[dbo].[patrones3301]
FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0312\EMIS3301.mdb';'Admin';'', 'SELECT * FROM cdempa032012')
AS EMA3333"></asp:SqlDataSource>
            <asp:Button ID="BActualizar" runat="server" Text="Actualizar" />
            <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSourceCrarT">
            </asp:GridView>
            &nbsp;&nbsp;</asp:Panel>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Caption="TOTAL" DataSourceID="SqlDataSourceResumenEma" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "Emma.aspx?emma=" & Eval("emmax") %>' 
                            Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="MONTO" HeaderText="MONTO" ReadOnly="True" 
                    SortExpression="MONTO" DataFormatString="{0:C}" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceResumenEma" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
count([EMIP_PATRON]) as [PATRONES]
,sum([EMIP_NUM_TRAB_COT]) as [COTIZANTES]
,sum([EMIP_IMP_EYM_FIJA] + EMIP_IMP_EYM_EXCE + EMIP_IMP_EYM_PRED + EMIP_IMP_EYM_PREE + EMIP_IMP_INV_VIDA + EMIP_IMP_RIES_TRA + EMIP_IMP_GUAR + EMIP_IMP_INV_VIDA_O + EMIP_IMP_EYM_EXCE_O + EMIP_IMP_EYM_PRED_O + EMIP_IMP_EYM_PREE_O)  as [MONTO]
,'patrones3301' as emmax
FROM [sireca].[dbo].[patrones3301]
where [EMIP_SUB]='00'
group by [EMIP_SUB]"></asp:SqlDataSource><hr />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            Caption="DEBEN" DataSourceID="SqlDataSourceDeben" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" NavigateUrl='<%# "detallesResumenEmas.aspx?rale=" & Eval("[rale]") & "&subdel=" & Eval("[subdel]") & "&periodo=" & Eval("[periodo]") & "&anio=" & Eval("[anio]") & "&mes=" & Eval("[mes]") & "&busqueda=TODOS" %>' 
                            Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="MONTO" HeaderText="MONTO" ReadOnly="True" 
                    SortExpression="MONTO" DataFormatString="{0:C}" />
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
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            Caption="DETALLES QUE DEBEN" DataSourceID="SqlDataSourceDetallesDeben" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" NullDisplayText="SIN ATENDER" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detallesResumenEmas.aspx?incidenciakey=" & Eval("[incidenciakey]") & "&rale=" & Eval("[rale]") & "&subdel=" & Eval("[subdel]") & "&periodo=" & Eval("[periodo]") & "&anio=" & Eval("[anio]") & "&mes=" & Eval("[mes]") & "&busqueda=DETALLES" %>' 
                            Text='<%# Eval("PATRONES") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="MONTO" HeaderText="MONTO" ReadOnly="True" 
                    SortExpression="MONTO" DataFormatString="{0:C}" />
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
        <asp:SqlDataSource ID="SqlDataSourceDetallesDeben" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]
,eco.incidencia as [incidenciakey]
,count(*) as [PATRONES]
,sum(eco.COTIZ) as [COTIZANTES]
,sum(rale.IMPORTE) as [MONTO]
,'3301ACOP240712' as [rale]
,'000' as [subdel]
,'22012' as [periodo]
,'2012' as [anio]
,'2' as [mes]
FROM 
 [sireca].[dbo].[eco] as eco, [rale].[dbo].[3301ACOP240712] AS rale inner join [sireca].[dbo].[patrones3301] AS emma
on (
substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) 
WHERE
eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'
and eco.fechaEco='32012' and tipoEco in ('COP','COMP')
and rale.[TD] in ('9999')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='3'
group by eco.incidencia"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDeben" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
count(rale.REGPATR) as [PATRONES]
,sum(emma.EMIP_NUM_TRAB_COT) as [COTIZANTES]
,sum(rale.IMPORTE) as [MONTO]
,'3301ACOP240712' as [rale]
,'000' as [subdel]
,'22012' as [periodo]
,'2012' as [anio]
,'2' as [mes]
FROM 
[sireca].[dbo].[eco] as eco, [rale].[dbo].[3301ACOP240712] AS rale inner join [sireca].[dbo].[patrones3301] AS emma
on (
substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) 
WHERE
eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'
and eco.fechaEco='62012' and tipoEco in ('COP','COMP')
and rale.[TD] in ('9999')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='3'
group by rale.[PERIODO]
"></asp:SqlDataSource><hr />

    
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            Caption="Estan en el RALE y ECO (en la EMA NO)" CaptionAlign="Left" 
            CellPadding="3" DataSourceID="SqlDataSourceEstanEcoRaleEmaNo" 
            GridLines="Vertical" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:TemplateField HeaderText="REG_PATRONAL" SortExpression="REG_PATRONAL">
                    <ItemTemplate>
                        <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" NavigateUrl='<%# "detallesResumenEmas.aspx?rale=" & Eval("[rale]") & "&subdel=" & Eval("[subdel]") & "&periodo=" & Eval("[periodo]") & "&anio=" & Eval("[anio]") & "&mes=" & Eval("[mes]") & "&busqueda=EMMANO" %>' 
                            Text='<%# Eval("REG_PATRONAL") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="MONTO" HeaderText="MONTO" ReadOnly="True" 
                    SortExpression="MONTO" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEstanEcoRaleEmaNo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT count(*) AS [REG_PATRONAL],sum(eco.COTIZ) as [COTIZANTES],sum([OMISION]) AS [MONTO]
,'3301ACOP240712' as [rale]
,'000' as [subdel]
,'22012' as [periodo]
,'2012' as [anio]
,'2' as [mes]
FROM 
 [sireca].[dbo].[eco] as eco,[rale].[dbo].[3301ACOP240712] AS rale
WHERE
(
select substring(emma2.[EMIP_PATRON],2,10) 
from [sireca].[dbo].[patrones3301] AS emma2 
where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))
) is null
and eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'
and eco.fechaEco='52012' and tipoEco in ('COP','COMP')
and rale.[TD] in ('9999')
and year(rale.[PERIODO])='2012'
and month(rale.[PERIODO])='5'
group by rale.[PERIODO]"></asp:SqlDataSource>    
    </div>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default4" %>
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
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<div>
        <asp:Label ID="Label2" runat="server" Text="Subd.:" Font-Bold="True" 
            Font-Size="11pt"></asp:Label>&nbsp;
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Font-Size="10pt">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="RALE base: " Font-Bold="True" 
            Font-Size="11pt"></asp:Label>&nbsp;
        <asp:DropDownList ID="DDLAnalizar" runat="server" 
            DataSourceID="SqlDataSourceTablaAnalisis" DataTextField="fechaCreacion" 
            DataValueField="tabla" DataTextFormatString="{0:D}" Font-Size="10pt">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="RALE a Com.:" Font-Bold="True" 
            Font-Size="11pt"></asp:Label>&nbsp;
        <asp:DropDownList ID="DDLRale" runat="server" DataSourceID="SqlDataSourceRales" 
            DataTextField="name" DataValueField="name" Font-Size="10pt">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceRales" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 6 [name]
FROM [rale].[dbo].[tablas]
where tipo='COP' and subdel=?
order by fecha desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceTablaAnalisis" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT [fechaCreacion],[tabla] FROM [sireca].[dbo].[tablaAnalisis] where subdel=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Inc. SIRECA:" Font-Bold="True" 
            Font-Size="11pt"></asp:Label>&nbsp;
        <asp:DropDownList ID="DDLInc" runat="server" DataSourceID="SqlDataSourceInc" 
            DataTextField="incidencias" DataValueField="incidencias" 
            AppendDataBoundItems="True" Font-Size="10pt">
            <asp:ListItem>TODOS</asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Actualizar" Font-Size="10pt" />&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" ToolTip="Exportar a Excel" />
        <asp:SqlDataSource ID="SqlDataSourceInc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT distinct([SR_INC.]) as incidencias FROM [sireca].[dbo].[DS3301FR061112FC271112]">
        </asp:SqlDataSource>
        <hr /><fieldset >
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourceRRB" Caption="RALE BASE" 
            HorizontalAlign="Left" Font-Size="9pt" ShowFooter="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="RALE_INC" HeaderText="RALE_INC" 
                    SortExpression="RALE_INC" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" FooterText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "DetallesAnalisis.aspx?incRaleBase=" & Eval("RALE_INC") & "&incRale=rale_inc&incRaleAct=T&patrones=" & Eval("PATRONES") & "&cot=" & Eval("COTIZANTES") & "&imp=" & Eval("IMPORTE") %>' 
                            Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" FooterText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourceRRA" 
            Caption="RALE COMPARACION" Font-Size="9pt" ShowFooter="True" 
                AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="INC_ACTUAL" HeaderText="INC_ACTUAL" 
                    SortExpression="INC_ACTUAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" FooterText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "DetallesAnalisis.aspx?incRaleBase=" & Eval("INC_ACTUAL") & "&incRale=rale_actual&incRaleAct=T&patrones=" & Eval("PATRONES") & "&cot=" & Eval("COTIZANTES") & "&imp=" & Eval("IMPORTE") %>' 
                            Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" FooterText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceRRA" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
  case when INC_ACTUAL is null then ('NO SE ENCUENTRA(RALE COMPARATIVO)')
else RTRIM(INC_ACTUAL) end as INC_ACTUAL
	  ,count(distinct([SR_REGPAT])) as PATRONES
	  ,count([SR_CREDITO]) as CREDITOS
      ,sum([SR_COTIZ]) as [COTIZANTES]
      ,sum([SR_OMISION]) as IMPORTE
  FROM [sireca].[dbo].[ANALISIS_INCIDENCIAS]
--WHERE RALE_PERIODO not in ('01/2012','02/2012')
  group by [INC_ACTUAL]
order by 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRRB" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [RALE_INC]
	  ,count(distinct([SR_REGPAT])) as PATRONES
	  ,count([SR_CREDITO]) as CREDITOS
      ,sum([SR_COTIZ]) as COTIZANTES
      ,sum([SR_OMISION]) as IMPORTE
  FROM [sireca].[dbo].[ANALISIS_INCIDENCIAS]
--WHERE RALE_PERIODO not in ('01/2012','02/2012')
  group by [RALE_INC]"></asp:SqlDataSource>
  </fieldset>
    <hr />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceAnalisis" 
            HorizontalAlign="Center" AllowSorting="True" Font-Size="9pt" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" FooterText="0" 
                    NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_INC" HeaderText="RALE BASE" 
                    SortExpression="RALE_INC">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO(S)_ANTERIOR(ES)" 
                    HeaderText="CREDITO(S) BASE" SortExpression="CREDITO(S)_ANTERIOR(ES)" 
                    DataFormatString="{0:N0}" FooterText="0" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_ACTUAL" HeaderText="RALE ACTUAL" 
                    SortExpression="INC_ACTUAL">
                <ItemStyle BackColor="#CCFFFF" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITO(S) ACTUAL(ES)" 
                    SortExpression="CREDITO(S)_ACTUAL(ES)">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "DetallesAnalisis.aspx?rale_inc=" & Eval("RALE_INC") & "&inc_actual=" & Eval("INC_ACTUAL") & "&incRale=ambas_inc&incRaleAct=T&patrones=" & Eval("PATRONES") & "&imp=" & Eval("IMPORTE") & "&cot=" & Eval("COTIZANTES") %>' 
                            Text='<%# Eval("[CREDITOACTUAL]") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle BackColor="#CCFFFF" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" FooterText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#000066" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceAnalisis" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sireca.dbo.sysobjects where name = 'ANALISIS_INCIDENCIAS') 
 begin
 drop table sireca.dbo.ANALISIS_INCIDENCIAS
 end
SELECT anl.[SR_REGPAT]
      ,anl.[SR_RAZON_SOCIAL]
      ,anl.[SR_COTIZ]
      ,anl.[SR_OMISION]
      ,anl.[RALE_PERIODO]
      ,anl.[SR_CREDITO]      
      ,anl.[SR_INC.]
      ,anl.[RALE_INC]
      ,anl.[RALE_FEC.INC.]
      ,'('+rale.INC+')'+(SELECT rinc.[descripcion] FROM [sireca].[dbo].[inc_rale] as rinc where rinc.[inc]=rale.[INC]) as [INC_ACTUAL]
      ,rale.[FEINC] as [FEC.INC.ACTUAL]      
  INTO [sireca].[dbo].ANALISIS_INCIDENCIAS
  FROM [sireca].[dbo].[DS3301FR061112FC271112] as anl left join 
  (
  SELECT rac.* FROM [rale].[dbo].[3301ACOP201112] as rac
  where rac.td='02'
  ) as rale on substring(anl.[SR_REGPAT],1,10) = replace(rale.REGPATR,'-','')
  --and anl.[RALE_PERIODO] = substring(rale.PERIODO,4,7)
  and anl.[SR_CREDITO] = rale.NUMCRED 
  where anl.[SR_INC.]=?

SELECT RALE_INC
,case when INC_ACTUAL is null then ('NO SE ENCUENTRA(RALE COMPARATIVO)')
else RTRIM(INC_ACTUAL) end as INC_ACTUAL
,COUNT(distinct([SR_REGPAT])) AS [PATRONES]
,COUNT([SR_CREDITO]) AS [CREDITO(S)_ANTERIOR(ES)]
,COUNT([INC_ACTUAL]) AS [CREDITOACTUAL] 
,SUM([SR_OMISION]) AS [IMPORTE]
,SUM(SR_COTIZ) as COTIZANTES
FROM [sireca].[dbo].[ANALISIS_INCIDENCIAS]
WHERE RALE_PERIODO not in ('00/2012','00/2012')
and [SR_OMISION]='0'
group by RALE_INC,INC_ACTUAL
--order by 1,2">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLInc" DefaultValue="000000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
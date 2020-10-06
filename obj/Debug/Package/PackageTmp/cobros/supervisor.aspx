<%@ Page Language="vb" MasterPageFile="~/Site2.Master" AutoEventWireup="false" CodeBehind="supervisor.aspx.vb" Inherits="WebSIRECA.supervisor1" %>
<asp:Content ID="contendhead" runat ="server" ContentPlaceHolderID="head">
    <style type="text/css"> @import url("../css/body.css"); </style>
    <script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID ="conten1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
            <asp:ImageButton ID="ImageButton5" runat="server" 
            ImageUrl="~/imagenes/guardar.png" ToolTip="guardar cambios" />
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceEjecutor" AllowSorting="True" Font-Size="9pt" 
                AutoGenerateColumns="False" DataKeyNames="REGPATR" 
            HorizontalAlign="Center" Caption="TITULO">
            <Columns>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="NOMBRE O RAZON SOCIAL" 
                    SortExpression="RAZON_SOCIAL">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CASOS" DataFormatString="{0:N0}" HeaderText="CASOS" 
                    SortExpression="CASOS" />
                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTE" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTE" NullDisplayText="0" SortExpression="COTIZANTE" />
                <asp:BoundField DataField="EMISION" DataFormatString="{0:C}" 
                    HeaderText="EMISION" NullDisplayText="0" SortExpression="EMISION">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                    <asp:TemplateField HeaderText="INCIDENCIA">
                        <ItemTemplate>
                            <asp:HiddenField ID="HFIncidencia" runat="server" Value='31' />
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSourceIncidencias" DataTextField="nombre" 
                                DataValueField="incidencia" Font-Size="8pt">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceIncidencias" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                
                                
                                
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @INCIDENCIA VARCHAR(50)
SET @INCIDENCIA=?
SELECT [incidencia]
      ,[nombre]
  FROM [sirecacobros].[dbo].[incidenciassicofi]
WHERE [clave31]=@INCIDENCIA or [clave32]=@INCIDENCIA or [clave43]=@INCIDENCIA or [clave01]=@INCIDENCIA">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HFIncidencia" DefaultValue="000" Name="?" 
                                        PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="ASIGNACION MANUAL">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="" Text="" ImageUrl="~/imagenes/editar.png" BorderStyle="None">
                            <asp:Image ID="Image6" runat="server" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MANDAMIENTO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" 
                            NavigateUrl='<%# "mandamiento.aspx?regpat=" & Eval("REGPATR") & "&inc=" & Eval("EMISION") %>' 
                            Text="">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir MANDAMIENTO COP" /></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink7" runat="server" 
                            NavigateUrl='<%# "mandamiento.aspx?regpat=" & Eval("REGPATR") & "&inc=" & Eval("EMISION") %>' 
                            Text="">
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir MANDAMIENTO RCV" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>                
                <asp:TemplateField HeaderText="AMPLIACION">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="" Text="">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir AMPLIACION COP" /></asp:HyperLink>
                        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="" Text="">
                            <asp:Image ID="Image8" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir AMPLIACION RCV" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ACUERDO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="" Text="">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir ACUERDO COP" /></asp:HyperLink>
                        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="" Text="">
                            <asp:Image ID="Image9" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir ACUERDO RCV" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CERRAJERO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="" Text="">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir CERRAJERO COP" /></asp:HyperLink>
                        <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="" Text="">
                            <asp:Image ID="Image10" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" BorderStyle="None" ToolTip="imprimir CERRAJERO RCV" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1"  title="Detalles creditos COP" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "creditosPatron.aspx?regpat=" & Eval("REGPATR") & "&razonsocial=" & Eval("RAZON_SOCIAL") & "&tipoeco=COP" %>' Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/lista_casos.png" BorderStyle="None" /></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink11"  title="Detalles creditos RCV" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "creditosPatron.aspx?regpat=" & Eval("REGPATR") & "&razonsocial=" & Eval("RAZON_SOCIAL") & "&tipoeco=RCV" %>' Text="">
                            <asp:Image ID="Image11" runat="server" ImageUrl="~/imagenes/lista_casos.png" BorderStyle="None" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSourceEjecutor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sirecacobros.dbo.sysobjects where name = 'Busqueda_PAE_TIPO') 
begin
SELECT 
      distinct([REGPATR])
	  --,[TIPOECO]
      ,[RAZON_SOCIAL]
      ,sum([CASOS]) as [CASOS]
      ,sum([ADEUDO]) as [ADEUDO]
      ,[COTIZANTE]
      ,[EMISION]
      ,[TIPO_ADEUDO]
      ,[ASIGNADO]
      ,[INCIDENCIA_CAPTURADA]
      ,[EJECUTOR]
      ,[FECHA_CAPTURA]
      ,[SUPERVISOR]
      ,[FECHA_ASIGNACION]
      ,[IP_CAPTURA]
      ,[IP_ASIGNACION]
      ,[lat]
      ,[lng]
FROM sirecacobros.dbo.Busqueda_PAE_TIPO
WHERE TIPO_ADEUDO=?
group by 
	[REGPATR]
	--  ,[TIPOECO]
      ,[RAZON_SOCIAL]
      --,[CASOS]
      --,[ADEUDO]
      ,[COTIZANTE]
      ,[EMISION]
      ,[TIPO_ADEUDO]
      ,[ASIGNADO]
      ,[INCIDENCIA_CAPTURADA]
      ,[EJECUTOR]
      ,[FECHA_CAPTURA]
      ,[SUPERVISOR]
      ,[FECHA_ASIGNACION]
      ,[IP_CAPTURA]
      ,[IP_ASIGNACION]
      ,[lat]
      ,[lng]
order by REGPATR
end">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="tipoadeudo" />
            </SelectParameters>
        </asp:SqlDataSource>
     </asp:Panel> 
    </div>
</asp:Content>
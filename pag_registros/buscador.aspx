<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo3.Master"  AutoEventWireup="false" CodeBehind="buscador.aspx.vb" Inherits="WebSIRECA.buscador" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>    
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:TextBox ID="TBRegpat" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>&nbsp;&nbsp;
        <asp:LinkButton ID="LBBuscar" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" Font-Bold="True" Font-Underline="False">Buscar</asp:LinkButton>
        </asp:Panel>
        
    <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" AllowSorting="True" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                    ReadOnly="True" SortExpression="REG_PATRONAL" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                    SortExpression="RANGO" />
                <asp:BoundField DataField="CREDITO_COP" HeaderText="CREDITO_COP" 
                    ReadOnly="True" SortExpression="CREDITO_COP" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_COP" HeaderText="IMPORTE_COP" 
                    ReadOnly="True" SortExpression="IMPORTE_COP" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" ReadOnly="True" 
                    SortExpression="ESTADO" />
                <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" ReadOnly="True" 
                    SortExpression="INTEGRADOR" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "detallesdelcontroldebusqueda.aspx?regpat=" & Eval("REG_PATRONAL") & "&rango=" & Eval("RANGO") %>' 
                            Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/sitios/buscar.png" BorderStyle="None" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#D8D8D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [SUBDEL] as SUBDEL
      ,[REG_PAT] as REG_PATRONAL
      ,[NOMBRE_PATRON] as RAZON
      ,[RANGO] as RANGO
      ,[IMPORTE_COP] as IMPORTE_COP
      ,[CRED_COP] as CREDITO_COP
      ,R_ESTADO_INTEGRACION as ESTADO
      ,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf  WHERE uf.id=C_INTEGRADOR) as INTEGRADOR
  FROM [sirecaregistros].[dbo].[nodiligenciados] as nd
  left join [sirecaregistros].[dbo].[registrorangos] as rr
  on REG_PAT=R_REGPAT
  left join [sirecaregistros].[dbo].[controlrangos] as cr
  on nd.ID_ND=cr.ID_ND
  WHERE (REG_PAT like '%'+?+'%' or [NOMBRE_PATRON] like '%'+?+'%')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="0000000000" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="0000000000000" 
                    Name="?" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="selecciondecreditosparaproyecto.aspx.vb" Inherits="WebSIRECA.selecciondecreditosparaproyecto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<div class="btn-group input-prepend">
    <span class="add-on">
    <asp:LinkButton ID="LBECS" runat="server" CssClass="btn"><span class="icon-remove" ></span>&nbsp;Eliminar Seleccion</asp:LinkButton>
    <asp:LinkButton ID="LBPPC" runat="server" PostBackUrl="~/areacobros/convenios/proyectodeconvenio.aspx" CssClass="btn"><span class="icon-share" ></span>&nbsp;Crear Proyecto</asp:LinkButton>
    </span>
</div>
</center>
    <table style="width: 100%;">
        <tr>
            <td >
                &nbsp;
            </td>
            <td >
                &nbsp;
            </td>
            <td >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top" align="center">
                &nbsp;
            <asp:GridView ID="GridViewCOP" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceCOP" AllowSorting="True" 
        Caption="&lt;strong&gt;CREDITO(S) C.O.P.&lt;/strong&gt;">
        <Columns>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="QUITAR">
                <ItemTemplate>
                    <asp:CheckBox ID="CBEliminar" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO_ORDEN">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                SortExpression="INC">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCOP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ID_USER AS VARCHAR(6)
DECLARE @TIPO AS VARCHAR(3)
SET @ID_USER=?
SET @TIPO=?
exec('
SELECT [REGPAT],[TOPO_ADEUDO] as TIPO,[CREDITO],[PERIODO],[TD],[INC]
,convert(datetime,''01/''+PERIODO,103) as PERIODO_ORDEN
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USER+']
WHERE TOPO_ADEUDO='''+@TIPO+'''
order by PERIODO_ORDEN desc
')">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="354" Name="?" SessionField="SIRECAid" />
            <asp:Parameter DefaultValue="COP" Name="?" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
            <td style="vertical-align: top">
                &nbsp;
            <asp:GridView ID="GridViewRCV" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceRCV" AllowSorting="True" 
        Caption="&lt;strong&gt;CREDITO(S) R.C.V.&lt;/strong&gt;">
        <Columns>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="QUITAR">
                <ItemTemplate>
                    <asp:CheckBox ID="CBEliminar0" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO_ORDEN">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                SortExpression="INC">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRCV" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ID_USER AS VARCHAR(6)
DECLARE @TIPO AS VARCHAR(3)
SET @ID_USER=?
SET @TIPO=?
exec('
SELECT [REGPAT],[TOPO_ADEUDO] as TIPO,[CREDITO],[PERIODO],[TD],[INC]
,convert(datetime,''01/''+PERIODO,103) as PERIODO_ORDEN
FROM [sirecacobros].[dbo].[adeudocoprcvconvenio'+@ID_USER+']
WHERE TOPO_ADEUDO='''+@TIPO+'''
order by PERIODO_ORDEN desc
')">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="354" Name="?" SessionField="SIRECAid" />
            <asp:Parameter DefaultValue="RCV" Name="?" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Content>

<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="consultarpago.aspx.vb" Inherits="WebSIRECA.consultarpago" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head" >
    <link href="../cs/body.css" rel="stylesheet" type="text/css" />
    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="contendt" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="REG.PATRONAL"></asp:Label>
    <asp:TextBox ID="TBRegpat" runat="server" MaxLength="10" BackColor="#FFE8A6" 
        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
    ErrorMessage="Ingrese un REGISTRO PATRONAL VALIDO<hr/>De 10 caracteres" 
    ControlToValidate="TBRegpat" ValidationExpression="\w{10}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RegularExpressionValidator2"></asp:ValidatorCalloutExtender>
    <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True">
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
    ToolTip="PERIODO">
</asp:DropDownList>
<asp:DropDownList ID="DDLMes0" runat="server" AutoPostBack="True">
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
<asp:DropDownList ID="DDLAnio0" runat="server" AutoPostBack="True" 
    ToolTip="PERIODO">
</asp:DropDownList>
    <asp:LinkButton ID="LBBuscar" runat="server" BackColor="#FFE8A6" 
        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False">&nbsp;&nbsp;BUSCAR&nbsp;&nbsp;</asp:LinkButton><hr />
    <asp:Label ID="LError" runat="server" Text="" Font-Bold="True" 
        ForeColor="Red"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        Caption="&lt;strong&gt;PAGO TOTAL&lt;/strong&gt;" CellPadding="3" 
        CellSpacing="1" DataSourceID="SqlDataSourcePagosT" 
        EmptyDataText="------------------SIN PAGOS------------------" 
    GridLines="None" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="TOTAL_GUARDERIA" DataFormatString="{0:C}" 
                HeaderText="TOTAL_GUARDERIA" NullDisplayText="$ 0.00" ReadOnly="True" 
                SortExpression="TOTAL_GUARDERIA" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TOTAL_IMPOTE" DataFormatString="{0:C}" 
                HeaderText="TOTAL_IMPOTE" NullDisplayText="$ 0.00" ReadOnly="True" 
                SortExpression="TOTAL_IMPOTE" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
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
    <asp:SqlDataSource ID="SqlDataSourcePagosT" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
      SUM([RC_IMP_GUAR]) as [TOTAL_GUARDERIA]
      ,SUM([RC_IMP_TOT]) as [TOTAL_IMPOTE]
  FROM [lgp].[dbo].[RC]
where (substring([RC_PATRON],2,8)+[RC_MOD]) in (?)
--and rc_doc in ('50','51','52','53','54','55','56','57','58','59','60')
and [RC_PER] between (?+'/'+?) and (?+'/'+?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBRegpat" DefaultValue="0000000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GVPagos" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSourcePagos" 
        Caption="&lt;strong&gt;DETALLES DEL PAGO&lt;/strong&gt;" 
        EmptyDataText="------------------SIN PAGOS------------------" 
    HorizontalAlign="Center" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD" />
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                SortExpression="PERIODO" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                SortExpression="CREDITO" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="GUARDERIA" DataFormatString="{0:C}" 
                HeaderText="GUARDERIA" SortExpression="GUARDERIA" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TOTAL" DataFormatString="{0:C}" HeaderText="TOTAL" 
                SortExpression="TOTAL" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="FECH_MOV" DataFormatString="{0:d}" 
                HeaderText="FECH_MOV" SortExpression="FECH_MOV" />
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
    <asp:SqlDataSource ID="SqlDataSourcePagos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
      --sum([RC_IMP_GUAR]) as GUARDERIAS
      --,sum([RC_IMP_TOT]) as CUOTAS
(SELECT '('+[docto]+') '+[descripcion] FROM [sireca].[dbo].[doc_rale] where [docto]=[RC_DOC]) AS TD
,RC_PER as PERIODO
,RC_CRED as CREDITO
,[RC_IMP_GUAR] as GUARDERIA
,[RC_IMP_TOT] as TOTAL
,RC_FEC_MOV as FECH_MOV
  FROM [lgp].[dbo].[RC]
where (substring([RC_PATRON],2,8)+[RC_MOD]) in (?)
--and rc_doc in ('50','51','52','53','54','55','56','57','58','59','60')
and [RC_PER] between (?+'/'+?) and (?+'/'+?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBRegpat" DefaultValue="0000000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio0" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes0" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

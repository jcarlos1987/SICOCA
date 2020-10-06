<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesinspector.aspx.vb" Inherits="WebSIRECA.detallesinspector" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Font-Size="10pt" AllowSorting="True" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:HyperLinkField DataNavigateUrlFields="REG.PATRONAL" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REG.PATRONAL" HeaderText="REG.PATRONAL" 
                    NavigateUrl="~/observacionPatronal/Default.aspx" SortExpression="REG.PATRONAL" 
                    Target="_blank" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="TIPO_ECO" HeaderText="TIPO_ECO" ReadOnly="True" 
                    SortExpression="TIPO_ECO" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="SECTOR" />
                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                    SortExpression="INC" />
                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                    SortExpression="TD" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RESPONSABLE as VARCHAR(5)
DECLARE @VALIDACION as VARCHAR(20)
SET @SUBDEL=?
SET @RESPONSABLE=?
SET @VALIDACION=?
SELECT 
subdel as SUBDEL
,upper((select nombre from fiscamovil.dbo.usuarios where id=responsable)) as INSPECTOR
,REG#PATRONAL AS [REG.PATRONAL]
,[NOMBRE O RAZON SOCIAL] AS RAZON
,CREDITO
,COTIZ AS COTIZANTES
,OMISION AS IMPORTE
,(
case len(fechaeco)
when 5 then (substring(convert(varchar,fechaeco),2,4)+'/0'+substring(convert(varchar,fechaeco),1,1))
else (substring(convert(varchar,fechaeco),3,4)+'/'+substring(convert(varchar,fechaeco),1,2))
end
) AS PERIODO
,TIPOECO AS [TIPO_ECO]
,SECTOR
,(SELECT '('+ incr.[inc]+')'+[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.[inc]=incidenciarale) as INC
,(SELECT '('+[docto]+')'+[descripcion] FROM [sireca].[dbo].[doc_rale] where [docto]=tdrale) as TD
FROM [sireca].[dbo].[eco] AS ECO
where tdrale in ('01','02')
and subdel=@SUBDEL
and responsable is not null
and responsable=@RESPONSABLE
and validacion=@VALIDACION
order by 2
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="9999999" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="ninguna" Name="?" 
                    QueryStringField="validacion" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

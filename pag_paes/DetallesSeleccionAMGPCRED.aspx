<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesSeleccionAMGPCRED.aspx.vb" Inherits="WebSIRECA.DetallesSeleccionAMGPCRED" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceDSAMG" HorizontalAlign="Center" 
            Font-Size="10pt" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                <asp:BoundField DataField="PATRON" HeaderText="PATRON" 
                    SortExpression="PATRON" />
                <asp:BoundField DataField="INC.CAP." HeaderText="INC.CAP." 
                    SortExpression="INC.CAP." />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ" DataFormatString="{0:N0}" HeaderText="COTIZ" 
                    SortExpression="COTIZ">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    SortExpression="OBSERVACION" />
                <asp:BoundField DataField="RESPONSABLE" HeaderText="RESPONSABLE" 
                    SortExpression="RESPONSABLE">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSourceDSAMG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
tipoFile as TIPO
,[REGPATR] as PATRON
,(select ('('+CVE_DILIG_PAE+')'+ACTIVIDAD) from sireca.dbo.catalogo where CVE_DILIG_PAE=INC_CAP) as [INC.CAP.]
,NUMCRED as [CREDITO]
,substring(PERIODO,4,7) as [PERIODO]
,ADEUDO as [ADEUDO]
,COTIZ
,OBSERVACION
,upper((select nombre from fiscamovil.dbo.usuarios where id=id_responsable)) as RESPONSABLE
  FROM [sirecacobros].[dbo].[ecoTiposReporte]
  where tipo=?
  and subdel=?
  --tipofile">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="tipo" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" 
                    QueryStringField="subdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

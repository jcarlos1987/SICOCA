<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesReporteEjecutor.aspx.vb" Inherits="WebSIRECA.DetallesReporteEjecutor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceDSE" Font-Size="10pt" 
            HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="REGPATR" HeaderText="REG.PATR." 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="NUMCRED" HeaderText="CREDITO" 
                    SortExpression="NUMCRED" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO" />
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                <asp:BoundField DataField="COTIZ" DataFormatString="{0:N0}" HeaderText="COTIZ" 
                    SortExpression="COTIZ" />
                <asp:BoundField DataField="INC_CAP" HeaderText="INC_CAP" 
                    SortExpression="INC_CAP" />
                <asp:BoundField DataField="FECH_CAP" DataFormatString="{0:d}" 
                    HeaderText="FECH_CAP" SortExpression="FECH_CAP" />
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    SortExpression="OBSERVACION" />
                <asp:BoundField DataField="tipoFile" HeaderText="TIPO" 
                    SortExpression="tipoFile" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                    SortExpression="SECTOR" />
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
        <asp:SqlDataSource ID="SqlDataSourceDSE" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
      ,[NUMCRED]
      ,[PERIODO]
      ,[RAZON_SOCIAL]
      ,[CASOS]
      ,[ADEUDO]
      ,[INC]
      ,[GRUPO]
      ,[COTIZ]
,(SELECT CASE WHEN CVE_DILIG_PAE IN ('x') THEN 'sin capturar' ELSE ACTIVIDAD END  FROM sireca.dbo.catalogo WHERE CVE_DILIG_PAE=[INC_CAP]) AS [INC_CAP]
      ,[FECH_CAP]
      ,[TD]
      ,[OBSERVACION]
      ,[tipoFile]
      ,[SECTOR]
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where [ID_RESPONSABLE]=? and clasificacion=? and [FECH_ASIG]=? and inc_cap=?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="idejecutor" />
                <asp:QueryStringParameter DefaultValue="9" Name="?" 
                    QueryStringField="clasificacion" />
                <asp:QueryStringParameter DefaultValue="29-01-2010" Name="?" 
                    QueryStringField="fechaasignacion" />
                <asp:QueryStringParameter DefaultValue="E" Name="?" QueryStringField="inccap" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

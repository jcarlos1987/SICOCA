<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SeleccionPatronesEjecutorCreditos.aspx.vb" Inherits="WebSIRECA.SeleccionPatronesEjecutorCreditos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center >
        <asp:HyperLink ID="HyperLink25" runat="server" 
            NavigateUrl="javascript:window.history.go(-1)">&lt;Atras</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink26" runat="server" 
            NavigateUrl="javascript:window.history.go(1)">Adelante&gt;</asp:HyperLink><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="Label5" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="Label6" runat="server" Text=""></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceCreditos" AllowSorting="True" 
            Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="numcred" HeaderText="CREDITO" 
                    SortExpression="numcred" />
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_CAP" HeaderText="INC_CAP" 
                    SortExpression="INC_CAP" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                    SortExpression="INC_RALE" />
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    SortExpression="OBSERVACION" />
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
        <asp:SqlDataSource ID="SqlDataSourceCreditos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
convert(datetime,periodo,102) as porden
,substring(periodo,4,7) as PERIODO
,numcred
,adeudo as ADEUDO
,(SELECT case when [CVE_DILIG_PAE]='x' then 'SIN CAPTURA' else ('('+[CVE_DILIG_PAE]+')'+[ACTIVIDAD]) end FROM [sireca].[dbo].[catalogo] where [CVE_DILIG_PAE]=inc_cap) as [INC_CAP]
,inc as INC_RALE
,observacion as OBSERVACION
  FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where id_responsable=? and regpatr=?
order by 1">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000000" Name="?" 
                    QueryStringField="idejecutor" />
                <asp:QueryStringParameter DefaultValue="000000000" Name="?" 
                    QueryStringField="regpat" />
            </SelectParameters>
        </asp:SqlDataSource>
        </center>

    </div>
    </form>
</body>
</html>

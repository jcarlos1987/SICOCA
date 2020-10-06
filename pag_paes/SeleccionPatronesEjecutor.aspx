
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SeleccionPatronesEjecutor.aspx.vb" Inherits="WebSIRECA.SeleccionPatronesEjecutor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div><center >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink26" runat="server" 
            NavigateUrl="javascript:window.history.go(1)">Adelante&gt;</asp:HyperLink></center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourcePatrones" 
            HorizontalAlign="Center" AllowSorting="True" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="FEC_ASIG" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE ASIGNACION" SortExpression="FEC_ASIG" />
                <asp:HyperLinkField DataTextField="REGPATR" HeaderText="REG.PATRONAL" 
                    SortExpression="REGPATR" 
                    DataNavigateUrlFields="REGPATR,RAZON_SOCIAL,DOMICILIO,CREDITO,COTIZANTES,ADEUDO,ejecutor" 
                    DataNavigateUrlFormatString="SeleccionPatronesEjecutorCreditos.aspx?regpat={0}&amp;razon={1}&amp;dom={2}&amp;credito={3}&amp;cotiz={4}&amp;adeudo={5}&amp;idejecutor={6}" 
                    NavigateUrl="~/pag_paes/SeleccionPatronesEjecutorCreditos.aspx" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                    SortExpression="ADEUDO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO_E" DataFormatString="{0:N0}" 
                    HeaderText="CREDITO_E" SortExpression="CREDITO_E">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO_F" DataFormatString="{0:N0}" 
                    HeaderText="CREDITO_F" SortExpression="CREDITO_F">
                <ItemStyle HorizontalAlign="Right" />
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
        <asp:SqlDataSource ID="SqlDataSourcePatrones" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
,convert(datetime,max(FECH_ASIG),103) as FEC_ASIG
      ,replace(RAZON_SOCIAL,'#','') as RAZON_SOCIAL
,(select dom from sireca.dbo.patrones where regpat=substring(replace([REGPATR],'-',''),1,10)) as DOMICILIO
,count(numcred) as CREDITO
,(select cotiz from sireca.dbo.patrones where regpat=substring(replace([REGPATR],'-',''),1,10)) as COTIZANTES
,sum(adeudo) as ADEUDO
,id_responsable as ejecutor
,(select count(*) from [sirecacobros].[dbo].[ecoTiposHistorial] as eth where eth.id_responsable=et.id_responsable
and eth.regpatr=et.regpatr and eth.inc_cap not in ('x')
) as CREDITO_E
,(select count(*) from [sirecacobros].[dbo].[ecoTiposHistorial] as eth where eth.id_responsable=et.id_responsable
and eth.regpatr=et.regpatr and eth.inc_cap in ('x')
) as CREDITO_F
  FROM [sirecacobros].[dbo].[ecoTiposHistorial] as et
where id_responsable=?
group by regpatr,RAZON_SOCIAL,id_responsable">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00000000" Name="?" 
                    QueryStringField="idejecutor" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="listado.aspx.vb" Inherits="WebSIRECA.listado" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="RegPatronal" HeaderText="RegPatronal" 
                    ReadOnly="True" SortExpression="RegPatronal" />
                <asp:BoundField DataField="Credito" HeaderText="Credito" ReadOnly="True" 
                    SortExpression="Credito" />
                <asp:BoundField DataField="Periodo" HeaderText="Periodo" ReadOnly="True" 
                    SortExpression="Periodo" />
                <asp:BoundField DataField="FECH_NOTIF_RALE" 
                    ReadOnly="True" SortExpression="FECH_NOTIF_RALE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECH_NOTIF_SICOCA" HeaderText="NOTIF" 
                    ReadOnly="True" SortExpression="FECH_NOTIF_SICOCA" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_SICOCA" HeaderText="FOLIO" 
                    ReadOnly="True" SortExpression="FOLIO_SICOCA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_FOLIO_SICOCA" HeaderText="FECHA FOLIO" 
                    ReadOnly="True" SortExpression="FECHA_FOLIO_SICOCA" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="FECH_NOT" SortExpression="INC_31">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("INC_31") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT [RegPatronal]
      ,[Credito]
      ,substring(convert(varchar,[Periodo],103),4,7) as [Periodo]
      ,[Fec Notificacion]
      ,[FECH_NOTIF_RALE]
      ,[fech_noti_s] as [FECH_NOTIF_SICOCA]
      ,[V_FOLIO_P1] AS FOLIO_SICOCA
      ,[V_FECHA_P1_TURNADO] AS FECHA_FOLIO_SICOCA
      ,('http://11.200.24.211/WebQR/barra.aspx?key='+[RegPatronal]
      +substring(convert(varchar,[Periodo],103),4,2)
      +substring(convert(varchar,[Periodo],103),9,2)
      +convert(nvarchar,[Credito])
      +substring(convert(varchar,[fech_noti_s],103),1,2)
      +substring(convert(varchar,[fech_noti_s],103),4,2)
      +substring(convert(varchar,[fech_noti_s],103),9,2)) as [INC_31]
  FROM [tempdb].[dbo].[Hoja2]
">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

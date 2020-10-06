<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesPatron.aspx.vb" Inherits="WebSIRECA.DetallesPatron1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles Patron</title>
    <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <asp:ImageButton ID="IBImpAc187" runat="server" 
            ToolTip="Imprimir Acuerdo 187" ImageUrl="~/imagenes/imprimir1.jpg" /></center>
        <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceDetallesPatron" 
            AllowSorting="True" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="bandera" HeaderText="&lt;&gt;" 
                    SortExpression="bandera" >
                <ItemStyle Font-Size="1pt" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" 
                    DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" >
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITO A TRAB.">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" 
                    SortExpression="NUMCRED" />
                <asp:BoundField DataField="MOV" HeaderText="MOV" SortExpression="MOV" />
                <asp:BoundField DataField="FMOV" HeaderText="FMOV" SortExpression="FMOV" />
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="ACTUALIZADO" HeaderText="ACTUALIZADO" 
                    SortExpression="ACTUALIZADO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RECARGO" HeaderText="RECARGO" 
                    SortExpression="RECARGO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL_ACTUALIZADO" HeaderText="TOTAL_ACT." 
                    SortExpression="TOTAL_ACTUALIZADO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PORCIENTO2" HeaderText="PORCIENTO2" 
                    SortExpression="PORCIENTO2" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="GASTO" HeaderText="GASTO" SortExpression="GASTO" 
                    DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="Black" Font-Size="11pt" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDetallesPatron" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
      ,[MOV]
      ,[FMOV]
      ,[NUMCRED]
      ,[TD]
      ,[INC]
      ,[DIAS]
      ,[bandera]
      ,[IMPORTE]
      ,[PERIODO]
      ,[ACTUALIZADO]
      ,[RECARGO]
      ,[TOTAL_ACTUALIZADO]
      ,[PORCIENTO2]
      ,[GASTO]
      ,[TIPO_PERSONA]
  FROM [sirecacobros].[dbo].[cop187]
  WHERE [REGPATR]=? ">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0000000000" Name="?" 
                    QueryStringField="regpat" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" MasterPageFile="~/Site2.Master" AutoEventWireup="false" CodeBehind="Webrcv.aspx.vb" Inherits="WebSIRECA.Webrcv" %>

<asp:Content ID="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceRCV" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
            GridLines="None">
            <Columns>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="CASOS" HeaderText="CASOS" ReadOnly="True" 
                    SortExpression="CASOS" />
                <asp:BoundField DataField="RAZONSOCIAL" HeaderText="RAZONSOCIAL" 
                    SortExpression="RAZONSOCIAL" />
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C2}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
                <asp:BoundField DataField="ACTUALIZADO" DataFormatString="{0:C2}" 
                    HeaderText="ACTUALIZADO" ReadOnly="True" SortExpression="ACTUALIZADO" />
                <asp:BoundField DataField="RECARGO" DataFormatString="{0:C2}" 
                    HeaderText="RECARGO" ReadOnly="True" SortExpression="RECARGO" />
                <asp:BoundField DataField="TOTAL_ACTUALIZADO" DataFormatString="{0:C2}" 
                    HeaderText="TOTAL_ACTUALIZADO" ReadOnly="True" 
                    SortExpression="TOTAL_ACTUALIZADO" />
                <asp:HyperLinkField DataNavigateUrlFields="TIPO_PERSONA,REGPATR" 
                    DataNavigateUrlFormatString="documento.aspx?tipodoc=DIFERIDO_{0}&amp;REGPATR={1}" 
                    NavigateUrl="~/cobros/documento.aspx" Text="imprimir" />
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
        <asp:SqlDataSource ID="SqlDataSourceRCV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
,COUNT([REGPATR]) AS CASOS
      ,[RAZONSOCIAL]
      --,[DOMICILIO]
      --,[FMOV]
      --,[NUMCRED]
      --,[TD]
      --,[INC]
      --,[DIAS]
      ,SUM([IMPORTE]) AS IMPORTE
      --,[PERIODO]
      ,SUM([ACTUALIZADO]) AS ACTUALIZADO
      ,SUM([RECARGO]) AS RECARGO
      ,SUM([TOTAL_ACTUALIZADO]) AS TOTAL_ACTUALIZADO
      --,[PORCIENTO2]
      --,[GASTO]
,TIPO_PERSONA
  FROM [sirecacobros].[dbo].[rcv]
group by [REGPATR],[RAZONSOCIAL],TIPO_PERSONA
order by 1"></asp:SqlDataSource>
    
    </div>
</asp:Content>
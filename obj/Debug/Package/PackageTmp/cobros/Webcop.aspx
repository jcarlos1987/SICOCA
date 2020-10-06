<%@ Page Language="vb" MasterPageFile ="~/Site2.Master" AutoEventWireup="false" CodeBehind="Webcop.aspx.vb" Inherits="WebSIRECA.Webcop" %>

<asp:Content ID="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSourceCOP" Font-Size="9pt" 
            GridLines="None" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" 
                    SortExpression="REGPATR" />
                <asp:BoundField DataField="importe" DataFormatString="{0:C2}" 
                    HeaderText="importe" ReadOnly="True" SortExpression="importe" />
                <asp:BoundField DataField="act" DataFormatString="{0:C2}" HeaderText="act" 
                    ReadOnly="True" SortExpression="act" />
                <asp:BoundField DataField="rec" DataFormatString="{0:C2}" HeaderText="rec" 
                    ReadOnly="True" SortExpression="rec" />
                <asp:BoundField DataField="total = importe + act + rec" 
                    DataFormatString="{0:C2}" HeaderText="total = importe + act + rec" 
                    ReadOnly="True" SortExpression="total = importe + act + rec" />
                <asp:BoundField DataField="pago_inicial" DataFormatString="{0:C2}" 
                    HeaderText="pago_inicial" ReadOnly="True" SortExpression="pago_inicial" />
                <asp:BoundField DataField="gasto_ejecusion" DataFormatString="{0:C2}" 
                    HeaderText="gasto_ejecusion" ReadOnly="True" SortExpression="gasto_ejecusion" />
                <asp:BoundField DataField="total = pago_inicial + gasto_ejecusion" 
                    DataFormatString="{0:C2}" HeaderText="total = pago_inicial + gasto_ejecusion" 
                    ReadOnly="True" SortExpression="total = pago_inicial + gasto_ejecusion" />
                <asp:BoundField DataField="saldo" DataFormatString="{0:C2}" HeaderText="saldo" 
                    ReadOnly="True" SortExpression="saldo" />
                <asp:BoundField DataField="mes" DataFormatString="{0:C2}" HeaderText="mes" 
                    ReadOnly="True" SortExpression="mes" />
                <asp:BoundField DataField="mensualidad" DataFormatString="{0:C2}" 
                    HeaderText="mensualidad" ReadOnly="True" SortExpression="mensualidad" />
                <asp:HyperLinkField DataNavigateUrlFields="TIPO_PERSONA,REGPATR" 
                    DataNavigateUrlFormatString="documento.aspx?tipodoc=PARCIALIDAD_{0}&amp;REGPATR={1}" 
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
        <asp:SqlDataSource ID="SqlDataSourceCOP" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @MESES FLOAT
DECLARE @PRCENTAJE1 FLOAT  --es el porcentaje de calculo de los gastos de ejecusion
DECLARE @PRCENTAJE2 FLOAT  --es el porcentaje de calculo de pago inicial
SET @MESES = 48
SET @PRCENTAJE1 = 0.02
SET @PRCENTAJE2 = 0.25
SELECT [REGPATR]
      ,sum([IMPORTE]) as importe
      ,sum([ACTUALIZADO]) as act
      ,sum([RECARGO]) as rec
      ,sum([TOTAL_ACTUALIZADO]) as [total = importe + act + rec]
,(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2) as pago_inicial
,case 
when (sum([TOTAL_ACTUALIZADO])&lt;20000) then 340
else (sum([TOTAL_ACTUALIZADO])*@PRCENTAJE1)
end as gasto_ejecusion
,case 
when (sum([TOTAL_ACTUALIZADO])&lt;20000) then (340+(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2))
else ((sum([TOTAL_ACTUALIZADO])*@PRCENTAJE1)+(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2))
end as [total = pago_inicial + gasto_ejecusion]
,(sum([TOTAL_ACTUALIZADO])-(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2)) as saldo
,@MESES as mes
,((sum([TOTAL_ACTUALIZADO])-(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2))/@MESES) as mensualidad
,TIPO_PERSONA
  FROM [sirecacobros].[dbo].[cop]
--where [PERIODO] between '01/01/1888' and '01/12/2011'
group by [REGPATR],TIPO_PERSONA
order by 2 desc
--having sum([ACTUALIZADO])&gt;0"></asp:SqlDataSource>
    
    </div>
</asp:Content>
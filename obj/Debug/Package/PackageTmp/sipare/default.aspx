<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default48" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="ARCHIVO .CSV EN .ZIP A CARGAR DEL SIPARE "></asp:Label>
    <asp:FileUpload ID="FUSipare" runat="server" />
    <asp:LinkButton ID="LBCargar" runat="server" CssClass="btn" BackColor="#BCC7D8">Cargar</asp:LinkButton>
</span> 
</div> 
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="LMsg" runat="server" Text="SELECCIONE EL ARCHIVO A CARGAR"></asp:Label>
</span> 
</div> 
</center>
    <asp:GridView ID="GridViewCargadosSipare" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceCargadosSipare" 
        HorizontalAlign="Center" Caption="ULTIMAS 10 CARGAS DEL SIPARE">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_CARGADA" DataFormatString="{0:d}" 
                HeaderText="FECHA_CARGADA" ReadOnly="True" SortExpression="FECHA_CARGADA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PAGOS" DataFormatString="{0:N0}" HeaderText="PAGOS" 
                ReadOnly="True" SortExpression="PAGOS" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                HeaderText="IMPORTE C.O.P." SortExpression="IMPORTE_COP">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE_RCV" DataFormatString="{0:C}" 
                HeaderText="IMPORTE R.C.V." SortExpression="IMPORTE_RCV">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCargadosSipare" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 10 SUBDEL,FECHA_CARGADA,COUNT(*) AS PAGOS
,SUM(IMPORTE_COP) AS IMPORTE_COP
,SUM(IMPORTE_RCV) AS IMPORTE_RCV
FROM (SELECT
SubDelegacion as SUBDEL
,CONVERT(DATETIME,CONVERT(VARCHAR(10),[fecha_cargada],103),103) AS FECHA_CARGADA
,[ImporteIMSS] AS IMPORTE_COP
,[ImporteRCV] AS IMPORTE_RCV
FROM [sirecaemisiones].[dbo].[sipare]
) AS RESULT
GROUP BY SUBDEL,FECHA_CARGADA
ORDER BY FECHA_CARGADA DESC,SUBDEL
"></asp:SqlDataSource>
</asp:Content>

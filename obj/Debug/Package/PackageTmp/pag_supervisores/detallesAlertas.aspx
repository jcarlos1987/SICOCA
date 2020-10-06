<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="detallesAlertas.aspx.vb" Inherits="WebSIRECA.detallesAlertas" %>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="Patrones" CellPadding="3" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" SortExpression="COTIZ" />
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" 
                    SortExpression="OMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RECARGOS" HeaderText="RECARGOS" 
                    SortExpression="RECARGOS" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="MULTA" HeaderText="MULTA" SortExpression="MULTA" 
                    DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" 
                    DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="incidencia" HeaderText="incidencia" 
                    SortExpression="incidencia" />
                <asp:BoundField DataField="nomResponsable" HeaderText="nomResponsable" 
                    SortExpression="nomResponsable" />
                <asp:BoundField DataField="fechaCaptura" HeaderText="fechaCaptura" 
                    SortExpression="fechaCaptura" DataFormatString="{0:d}" />
                <asp:BoundField DataField="diasTranscuridos" HeaderText="diasTranscuridos" 
                    ReadOnly="True" SortExpression="diasTranscuridos" />
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
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REG#PATRONAL]
      ,[NOMBRE O RAZON SOCIAL]
      ,[CREDITO]
      ,[COTIZ]
      ,[OMISION]      
      ,[RECARGOS]
      ,[MULTA]
      ,[TOTAL]
      ,[incidencia]
      ,[nomResponsable]
      ,[fechaCaptura]
,DATEDIFF(DAY,[fechaCaptura],GETDATE()) as diasTranscuridos
  FROM [sireca].[dbo].[eco]
where incidencia in ('2') and subdel=?
and tipoeco in ('COP','COMP')
and fechaeco=?
AND (DATEDIFF(DAY,[fechaCaptura],GETDATE()) &gt;= 21)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="111111" Name="?" 
                    QueryStringField="fechaeco" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="Patrones" CellPadding="3" 
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="REG#PATRONAL" HeaderText="REG#PATRONAL" 
                    SortExpression="REG#PATRONAL" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" 
                    ReadOnly="True" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="OMISION" HeaderText="OMISION TOTAL" 
                    SortExpression="OMISION" DataFormatString="{0:C}" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="MANDAMIENTO">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "../cobros/MANDAMIENTO.aspx?REGPATR=" & Eval("[REG#PATRONAL]") %>' 
                            Text="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/imprimir1.jpg" ImageAlign="Middle" BorderStyle="None" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField HeaderText="AMPLIACION" />
                <asp:HyperLinkField HeaderText="ACUERDO" />
                <asp:HyperLinkField HeaderText="CERRAJERO" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
REG#PATRONAL
,(select ptn.razonSocial from sireca.dbo.patrones as ptn where ptn.regpat=substring(eco1.REG#PATRONAL,1,10)) AS [NOMBRE O RAZON SOCIAL]
, SUM(OMISION) AS OMISION
FROM sireca.dbo.eco AS eco1
WHERE 
(incidencia IN ('2')) 
AND (subdel = ?) 
AND (tipoeco IN ('COP', 'COMP')) 
AND ((SELECT ecod.meses FROM sirecacobros.dbo.ecodeudasmeses AS ecod WHERE (ecod.REG#PATRONAL = eco1.REG#PATRONAL)) = ?) 
AND (DATEDIFF(DAY, fechaCaptura, GETDATE()) &gt;= 21) 
GROUP BY REG#PATRONAL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="meses" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/Site2.Master" AutoEventWireup="false" CodeBehind="creditosPatron.aspx.vb" Inherits="WebSIRECA.creditosPatron" %>
<asp:Content ID="contend1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                DataSourceID="SqlDataSourceDetallesRale" Font-Size="9pt" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="REGPATR" HeaderText="REG.PATRONAL" 
                        SortExpression="REGPATR" />
                    <asp:BoundField DataField="MOV" HeaderText="MOV" SortExpression="MOV" />
                    <asp:BoundField DataField="FMOV" HeaderText="FMOV" SortExpression="FMOV" />
                    <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                        SortExpression="SECTOR" />
                    <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" 
                        SortExpression="NUMCRED" />
                    <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                    <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                    <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                        SortExpression="IMPORTE" DataFormatString="{0:C}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                        SortExpression="PERIODO" />
                    
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceDetallesRale" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
      ,[MOV]
      ,[FMOV]
      ,[SECTOR]
      ,[NUMCRED]
      ,[CE]
      ,[TD]
      ,[FALTA]
      ,[INC]
      ,[FEINC]
      ,[DIAS]
      ,[IMPORTE]
      ,[OBSERVA]
,substring([PERIODO],4,7) as PERIODO
  FROM [rale].[dbo].[3301ACOP280812]
where REGPATR=?
AND PERIODO BETWEEN '01/01/1800' AND '30/04/2012'
AND  INC IN ('31','32','43','01')
AND TD NOT IN ('80','81','82','89','08')">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="000" Name="?" 
                        QueryStringField="regpat" />
                </SelectParameters>
            </asp:SqlDataSource>
    </div>
</asp:Content>

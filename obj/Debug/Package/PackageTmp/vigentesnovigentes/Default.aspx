<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default15" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Label ID="Label2" runat="server" Text="VIGENTES DEL " Font-Bold="True"></asp:Label>
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="ACTUALIZAR" BorderColor="#678FB7" 
            BorderStyle="Solid" BorderWidth="1px" />
        <hr />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="10pt" 
            PageSize="1000">
            <Columns>
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                    SortExpression="RANGO" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="vigencia" HeaderText="vigencia" 
                    SortExpression="vigencia" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
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
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
	  case 
      when sum([IMPORTE])&lt;=23637.40 then 'RANGO I' 
      when sum([IMPORTE])&gt;23637.40 and sum([IMPORTE])&lt;=47274.80 then 'RANGO II'
      when sum([IMPORTE])&gt;47274.80 and sum([IMPORTE])&lt;=94549.60 then 'RANGO III'
      when sum([IMPORTE])&gt;94549.60 and sum([IMPORTE])&lt;=590935.00 then 'RANGO IV'
      when sum([IMPORTE])&gt;590935.00 then 'RANGO V'
      end as RANGO
      ,[REGPATR] as REGPAT
      ,ptn.razonSocial as RAZON
      ,count([NUMCRED]) as CREDITO
      ,ptn.cotiz as COTIZANTES
      ,sum([IMPORTE]) as IMPORTE
      ,ptn.vigencia      
  FROM sirecacobros.dbo.ralecoprcv33 as rale 
  left join sireca.dbo.patrones as ptn on ptn.REGPAT=replace(rale.regpatr,'-','') and ptn.subdel=?
  where mov in ('1','3','4','5','6','7') and mov in ('9999')
  group by [REGPATR],ptn.razonSocial,ptn.vigencia,ptn.cotiz">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

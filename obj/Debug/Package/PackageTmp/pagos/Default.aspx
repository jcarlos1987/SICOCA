<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default16" %>

<asp:Content ID ="conted1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>
        <table style="width: 100%;" border="1">
            <tr>
                <td colspan="6">
                    <label >Búsqueda Listado General de Pago (LGP)</label>
                    <asp:DropDownList ID="DDLSubdel" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="ButtonBuscar" runat="server" Text="BUSCAR" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="CBRegPat" runat="server" Text="REGISTRO PATRONAL" />
                </td>
                <td>
                    <asp:CheckBox ID="CBRazonSocial" runat="server" Text="RAZON SOCIAL" />
                </td>
                <td>
                    <asp:CheckBox ID="CBCredito" runat="server" Text="CREDITO" />
                </td>
                <td>
                    <asp:CheckBox ID="CBPeriodo" runat="server" Text="PERIODO" />
                    (AAAA/MM)</td>
                <td>
                    <asp:CheckBox ID="CBMonto" runat="server" Text="MONTO" />
                    <asp:DropDownList ID="DDLMonto" runat="server">
                        <asp:ListItem>=</asp:ListItem>
                        <asp:ListItem>&gt;</asp:ListItem>
                        <asp:ListItem>&lt;</asp:ListItem>
                        <asp:ListItem>&gt;=</asp:ListItem>
                        <asp:ListItem>&lt;=</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox ID="CBTD" runat="server" Text="TIPO DE DOCUMENTO" />
                    (td1,td2,...,tdN)</td>
            </tr>
            <tr>
            <td>
                    <asp:TextBox ID="TBRegPat" runat="server" MaxLength="10">REGISTRO PATRONAL</asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TBRazonSocial" runat="server" MaxLength="200"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TBCredito" runat="server" MaxLength="9"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TBPeriodo" runat="server" MaxLength="200"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TBMonto" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TBTD" runat="server" MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceLGP" ForeColor="Black" GridLines="Vertical" 
            Caption="Resultado(s) del Listado General de Pago (LGP)" 
            EmptyDataText="0 RESULTADOS" HorizontalAlign="Left">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="FECH_MOV" HeaderText="FECH_MOV" 
                    SortExpression="FECH_MOV" DataFormatString="{0:d}" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="IMP_GUARDERIA" HeaderText="IMP_GUARDERIA" 
                    SortExpression="IMP_GUARDERIA" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMP_TOTAL" HeaderText="IMP_TOTAL" 
                    SortExpression="IMP_TOTAL" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourcePROCESAR" ForeColor="Black" 
            GridLines="Vertical" Caption="Resultado(s) de PAGO POR PROCESAR" 
            EmptyDataText="0 RESULTADOS">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="FECH_MOV" DataFormatString="{0:d}" 
                    HeaderText="FECH_MOV" SortExpression="FECH_MOV" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="PERIODO" 
                    HeaderText="PERIODO" SortExpression="PERIODO" />
                <asp:BoundField DataField="IMP_COP" DataFormatString="{0:C}" 
                    HeaderText="IMP_COP" SortExpression="IMP_COP">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMP_RCV" DataFormatString="{0:C}" 
                    HeaderText="IMP_RCV" SortExpression="IMP_RCV">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePROCESAR" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
      [RCP_REGPAT] as REGPAT
      ,[RCP_FEC_MOV] as FECH_MOV
      ,RCP_PER as PERIODO
      ,[RCP_IMP_COP] as IMP_COP
      ,[RCP_IMP_RCV] as IMP_RCV
  FROM [procesar].[dbo].[RCPRO]
where [RCP_SUB]=?
and substring([RCP_REGPAT],1,10)=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBRegPat" DefaultValue="REGISTROPAT" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceLGP" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
	   [RC_DEL] as DEL
      ,[RC_SUB] as SUBDEL      
	  ,[RC_FEC_MOV] as FECH_MOV
      ,(substring(rc_patron,2,8)+rc_mod) as REGPAT
      ,[RC_PA_NOM] as RAZON_SOCIAL
      ,[RC_CRED] as CREDITO 
      ,[RC_PER] as PERIODO           
      ,[RC_DOC] as TD      
      ,[RC_IMP_GUAR] as IMP_GUARDERIA
      ,[RC_IMP_TOT]  as IMP_TOTAL
  FROM [lgp].[dbo].[RC]
where rc_per = ''"></asp:SqlDataSource>
    </div>
</asp:Content>

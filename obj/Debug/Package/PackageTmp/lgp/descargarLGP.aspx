<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master"  AutoEventWireup="false" CodeBehind="descargarLGP.aspx.vb" Inherits="WebSIRECA.descargarLGP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="contenido2" runat ="server" ContentPlaceHolderID ="head" >

</asp:Content>
<asp:Content ID="content" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <center >
    <div>
        <asp:Label ID="Label4" runat="server" Text="DESCARGA DEL LGP"></asp:Label>
<asp:Panel ID="Panel1" runat="server" CssClass="well" Width="500px" >
        <asp:DropDownList ID="DropDownSubdel" runat="server" AutoPostBack="True" 
            Width="120px">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="PAGO DE"></asp:Label>
        <asp:TextBox ID="TextBoxFI" runat="server" ClientIDMode="Static" 
            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" 
            Width="120px" CssClass="text-center"></asp:TextBox>
        <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBoxFI"></asp:CalendarExtender>
        <asp:Label ID="Label3" runat="server" Text=" al "></asp:Label>
        <asp:TextBox ID="TextBoxFF" runat="server" ClientIDMode="Static" 
            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" 
            Width="120px" CssClass="text-center"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBoxFF"></asp:CalendarExtender>        
        <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" 
            ImageUrl="~/imagenes/exportarexcel.png" /><br />
        <asp:Label ID="LabelError" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#CC0000"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Caption="ULTIMO LGP" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="LGP" HeaderText="LGP DE" ReadOnly="True" 
                    SortExpression="LGP" />
            </Columns>
            <HeaderStyle CssClass="btn-info" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
[RC_SUB] AS SUBDEL
,DATENAME(MONTH,MAX([RC_FEC_MOV])) + ' ' + DATENAME(YEAR,MAX([RC_FEC_MOV])) AS LGP
FROM [lgp].[dbo].[RC]
where [RC_SUB]=?
GROUP BY [RC_SUB]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Panel>
    </div>
</center>
</asp:Content>
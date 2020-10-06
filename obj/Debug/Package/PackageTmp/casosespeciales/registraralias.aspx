<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="registraralias.aspx.vb" Inherits="WebSIRECA.registraralias" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    
    <asp:DropDownList ID="DDLSubdel" runat="server" 
                           AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:TextBox ID="TBAlias" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" MaxLength="199"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un ALIAS" ControlToValidate="TBAlias" ValidationExpression="\w{3,200}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RegularExpressionValidator1"></asp:ValidatorCalloutExtender>

                        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Height="19px">&nbsp;AGREGAR ALIAS&nbsp;</asp:LinkButton>
    
        <asp:Label ID="LMsg" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
    <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource1" AllowSorting="True" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="ALIAS" HeaderText="ALIAS" SortExpression="ALIAS" />
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT paa_subdel as SUBDEL,paa_alias as ALIAS
FROM [sirecacobros].[dbo].[patronesAlianzaAlias]
where paa_subdel=? and [paa_alias] not in ('') ">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

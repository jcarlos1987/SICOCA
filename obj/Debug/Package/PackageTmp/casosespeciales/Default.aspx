<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default39" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    
    <asp:DropDownList ID="DDLSubdel" runat="server" 
                           AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:TextBox ID="TBRegpat" runat="server" BorderStyle="Solid" 
            BorderWidth="1px" MaxLength="10"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un REGISTRO PATRONAL (10 caracteres)" ControlToValidate="TBRegpat" ValidationExpression="\w{10}" Display="None"></asp:RegularExpressionValidator>
<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RegularExpressionValidator1"></asp:ValidatorCalloutExtender>
                        &nbsp;ALIAS:
                        <asp:DropDownList ID="DDLAlias" runat="server" 
            DataSourceID="SqlDataSourceAlias" DataTextField="texto" DataValueField="valor">
        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceAlias" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [paa_id] as valor
,[paa_alias] as texto
FROM [sirecacobros].[dbo].[patronesAlianzaAlias]
where [paa_subdel]=? and [paa_alias] not in ('')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
        </asp:SqlDataSource>
                        APLICAR A:<asp:DropDownList ID="DDLAplicarA" runat="server">
            <asp:ListItem Value="DES">DESABILITADO</asp:ListItem>
            <asp:ListItem Value="NOT_PAE">NOTIFICACION/P.A.E.</asp:ListItem>
            <asp:ListItem Value="NOT">NOTIFICACION</asp:ListItem>
            <asp:ListItem Value="PAE">P.A.E.</asp:ListItem>
        </asp:DropDownList>
                        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" Height="19px">&nbsp;AGREGAR PATRON&nbsp;</asp:LinkButton>
    
        <asp:Label ID="LMsg" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
    <hr />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">  
    <ProgressTemplate >
    <asp:Panel ID="Panel1" runat="server" BackColor="#FFE8A6" 
                HorizontalAlign="Center">
                <asp:Label ID="Label1" runat="server" Text="CARGANDO..."></asp:Label>
            </asp:Panel>
    </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>                    
                        ALIAS:<asp:DropDownList ID="DDLAlias0" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceAlias" DataTextField="texto" DataValueField="valor">
                        </asp:DropDownList>
                        ESTADO DEL ALIAS:<asp:DropDownList ID="DDLAplicarA0" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="DES">DESABILITADO</asp:ListItem>
                            <asp:ListItem Value="NOT_PAE">NOTIFICACION/P.A.E.</asp:ListItem>
                            <asp:ListItem Value="NOT">NOTIFICACION</asp:ListItem>
                            <asp:ListItem Value="PAE">P.A.E.</asp:ListItem>
                        </asp:DropDownList>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" 
                            EmptyDataText="SIN PATRONES REGISTRADOS EN LOS FILTROS SELECCIONADOS">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="REG_PATRONAL" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                    SortExpression="REG_PATRONAL" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" ReadOnly="True" 
                    SortExpression="ACTIVIDAD" />
                <asp:BoundField DataField="RFC" HeaderText="RFC" ReadOnly="True" 
                    SortExpression="RFC" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="ULTIMA_EMISION" HeaderText="ULTIMA_EMISION" 
                    ReadOnly="True" SortExpression="ULTIMA_EMISION" />
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [regpatr] as REG_PATRONAL,razonSocial as RAZON,act as ACTIVIDAD,rfc as RFC,cotiz as COTIZANTES,(datename(month,vigencia)+'/'+cast(year(vigencia) as varchar(4))) as ULTIMA_EMISION
FROM [sirecacobros].[dbo].[patronesAlianza] as pa left join sireca.dbo.patrones 
on regpat=pa.regpatr
where pa.subdel=? and pa.idAlias=? and pa.aplica=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAlias0" DefaultValue="abc" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAplicarA0" DefaultValue="eco" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </ContentTemplate>
        </asp:UpdatePanel>        
    </div>
</asp:Content>

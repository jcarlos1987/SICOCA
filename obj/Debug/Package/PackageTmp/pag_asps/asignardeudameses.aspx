<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="asignardeudameses.aspx.vb" Inherits="WebSIRECA.asignardeudameses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asignacion de P.A.E.</title>
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:Label ID="Label2" runat="server" Text=" ASIGNAR EL PATRON"></asp:Label>
        &nbsp;<asp:Label ID="LabelRegpat" runat="server" Font-Bold="True"></asp:Label>&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="AL INSPECTOR:"></asp:Label>
                            <asp:DropDownList ID="DDLInspTipo" runat="server" AutoPostBack="True">
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                            </asp:DropDownList>
                    <asp:DropDownList ID="DDLInspector" runat="server" Width="210px" 
                        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
                        DataValueField="valor">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USUARIO_TIPO as VARCHAR(3)
DECLARE @USUARIO_ID as VARCHAR(5)
DECLARE @TIPO_INSPEC as VARCHAR(5)
DECLARE @SUBDEL as VARCHAR(2)
SET @USUARIO_TIPO=?
SET @USUARIO_ID=?
SET @SUBDEL=?
SET @TIPO_INSPEC=?

IF @USUARIO_TIPO='0'
begin
	if @TIPO_INSPEC='A'
	begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1'))
	order by texto
	end
	else
	begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (userPae2='1')
	order by texto
	end
	
end
else 
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1') or userPae2='1')
	and sire.id=@USUARIO_ID
	order by texto
end
">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="99999" Name="?" 
                                    SessionField="SIRECAuser_type" />
                                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLInspTipo" DefaultValue="B" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" >
                            </asp:ScriptManager>
                            CON FECHA:&nbsp;
                <asp:TextBox ID="TBFechAsig" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
                    <asp:CalendarExtender ID="caext1" runat="server" TargetControlID="TBFechAsig" Format="dd/MM/yyyy"></asp:CalendarExtender>
    
                            <asp:LinkButton ID="LinkButton1" runat="server" BorderStyle="Solid" 
                                BorderWidth="1px" BackColor="#ECB23D" Font-Underline="False">&nbsp;&nbsp;Asignar&nbsp;&nbsp;</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>

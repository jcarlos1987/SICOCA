<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="facturaCredImp2.aspx.vb" Inherits="WebSIRECA.facturaCredImp2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>INFORME</title>
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" >
    </asp:ScriptManager>
    <asp:Panel ID="PanelRead" runat="server" HorizontalAlign="Center">
        <div class="btn-group input-prepend">
        <span class="add-on">
        <asp:Label ID="Label2" runat="server" 
            Text="Factura de:" ForeColor="#CC0000"></asp:Label>
        </span>
        <asp:TextBox ID="TBFecha" runat="server" CssClass="text-center" Width="100px" ></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFecha" ></asp:CalendarExtender>
        <asp:DropDownList ID="DDLRegCodeBar" runat="server" 
                DataSourceID="SqlDataSourceRegCodeBar" DataTextField="texto" 
                DataValueField="valor" ForeColor="Red" Width="280px" 
                Font-Size="9pt">
        </asp:DropDownList>
        <asp:DropDownList ID="DDLInspector" runat="server" 
                DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
                DataValueField="valor" Font-Size="9pt">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SELECT us.id as valor
,(select upper(uf.nombre) 
from fiscamovil.dbo.usuarios as uf 
where uf.id=us.id) as texto
from sireca.dbo.usuarios as us
where us.user_type='1' and us.subdel=@SUBDEL">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRegCodeBar" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CARGO AS VARCHAR(50)
DECLARE @DOC_OFIC AS VARCHAR(50)
SET @CARGO=?
SET @DOC_OFIC=?
SELECT [AC_ID] as valor,[AC_DESCRIPCION] as texto
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_OFICINA] like @CARGO and [AC_CARGO] like @DOC_OFIC
and [AC_ID]  in ('1')">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="X" Name="?" 
                        SessionField="SIRECAreg_codebar" />
                    <asp:SessionParameter DefaultValue="X" Name="?" SessionField="SIRECAreg_tipo" />
                </SelectParameters>
            </asp:SqlDataSource>
        <span class="add-on">
            <asp:LinkButton ID="LBActualizar" CssClass="btn" runat="server">Actualizar</asp:LinkButton>
            <asp:HyperLink ID="HLPrint" runat="server" CssClass="btn" 
                NavigateUrl="~/informesPDF/emision/facturaCredImp2tipo.aspx?msg1=99999&msg2=999999&fecha2=01/01/2000" Target="_blank"><i class="icon-print"></i></asp:HyperLink>
        </span> 
        </div> 
    </asp:Panel>
    &nbsp;</form>
</body>
</html>

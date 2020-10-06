<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reporte.aspx.vb" Inherits="WebSIRECA.reporte1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>REPORTES</title>
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <asp:Label ID="Label1" runat="server" Text="CONFIRMA QUE VA GENERAR UN FOLIO DE LA " Font-Bold="True" ForeColor="#293955"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="SUBDELEGACION: " Font-Bold="True" 
            ForeColor="#CC0000"></asp:Label>
        <asp:Label ID="LSubdel" runat="server" ForeColor="#616161"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="PARA LA DILIGENCIA: " 
            Font-Bold="True" ForeColor="#CC0000"></asp:Label>
        <asp:Label ID="LInc" runat="server" ForeColor="#616161"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="CON LA SIGUIENTE INFORMACION" 
            Font-Bold="True" ForeColor="#293955"></asp:Label>
        <hr />
        <br />        
        <br />
<div class="btn-group input-prepend">
<span class="add-on">
        <asp:Label ID="Label7" runat="server" Text="Turnar A: " ForeColor="Red"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLTurnarA" runat="server" ForeColor="#CC0000" 
            DataSourceID="SqlDataSourceP2" DataTextField="texto" 
        DataValueField="valor" Width="300px"></asp:DropDownList>
</div>
        <asp:SqlDataSource ID="SqlDataSourceP2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id] as valor
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=us.id) as texto
FROM [sireca].[dbo].[usuarios] as us
WHERE subdel like ? and [emision_p2] like ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="vinc" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
<div class="btn-group input-prepend">
<span class="add-on">
        <asp:Label ID="Label9" runat="server" Text="Folio: " ForeColor="Red"></asp:Label>
</span>
        <asp:TextBox ID="TBFolio" runat="server" 
            ToolTip="El folio a ingresar es un numero" MaxLength="11">AUTOMATICO</asp:TextBox>
<span class="add-on">
        <asp:Label ID="Label10" runat="server" Text=" del año " ForeColor="Red"></asp:Label>
</span>
        <asp:DropDownList ID="DDLAnio" runat="server" Width="100px">
        </asp:DropDownList>
</div>
        <asp:HiddenField ID="HiddenFieldSubdel" runat="server" />
        <br />
        <asp:Label ID="LMError" runat="server" Font-Bold="True" Font-Size="16pt" 
            ForeColor="Red" ></asp:Label>
        <br />
        <asp:Label ID="Label8" runat="server" Text="Observación de los casos a Asignar: " ForeColor="Red"></asp:Label>
        <br />
        <asp:TextBox ID="TBObservacion" runat="server" MaxLength="3000" 
            TextMode="MultiLine" Height="120px" Width="400px"></asp:TextBox>
        <br />
        <asp:Button ID="BConfirmacion" runat="server" CssClass="btn" Text="Confirmar" 
            BorderColor="#BCC7D8" BorderStyle="Solid" />
    </div>
    </form>
</body>
</html>

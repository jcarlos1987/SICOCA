<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reporte2.aspx.vb" Inherits="WebSIRECA.reporte2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <asp:Label ID="Label1" runat="server" 
            Text="CONFIRMA QUE VA GENERAR UNA VISTA PREVIA DEL REPORTE" 
            Font-Bold="True" ForeColor="#293955"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="CON LA SIGUIENTE INFORMACION" 
            Font-Bold="True" ForeColor="#293955"></asp:Label>
        <hr />
        <asp:Label ID="Label3" runat="server" Text="SUBDELEGACION: " Font-Bold="True" 
            ForeColor="#454545"></asp:Label><asp:Label ID="LSubdel" runat="server" 
            ForeColor="#616161"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="DILIGENCIADOS POR: " 
            Font-Bold="True" ForeColor="#454545"></asp:Label><asp:Label ID="LInspector" 
            runat="server" ForeColor="#616161"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" Text="DILIGENCIADOS EN LA FECHA: " 
            Font-Bold="True" ForeColor="#454545"></asp:Label><asp:Label ID="Lfecha" 
            runat="server" ForeColor="#616161"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="DILIGENCIA: " Font-Bold="True" 
            ForeColor="#454545"></asp:Label><asp:Label ID="LInc" runat="server" 
            ForeColor="#616161"></asp:Label>    
        <br />
        <asp:Label ID="Label7" runat="server" Text="Turnar A: " ForeColor="Red"></asp:Label>
        <asp:DropDownList ID="DDLTurnarA" runat="server" ForeColor="#CC0000" 
            DataSourceID="SqlDataSourceP2" DataTextField="texto" DataValueField="valor"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceP2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id] as valor
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=us.id) as texto
FROM [sireca].[dbo].[usuarios] as us
WHERE subdel like ? and [emision_p2]=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="vinc" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenFieldSubdel" runat="server" />
        <br />
        <asp:Label ID="LMError" runat="server" Font-Bold="True" Font-Size="16pt" 
            ForeColor="Red" ></asp:Label>
        <br />
        <asp:Label ID="Label8" runat="server" Text="Observación de los casos a Asignar: " ForeColor="Red"></asp:Label>
        <br />
        <asp:TextBox ID="TBObservacion" runat="server" MaxLength="3000" 
            TextMode="MultiLine" Height="80px" Width="280px"></asp:TextBox>
        <br />
        <asp:Button ID="BConfirmacion" runat="server" Text="Confirmar" />
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BuscarPatron.aspx.vb" Inherits="WebSIRECA.BuscarPatron" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="REGISTRO PATRONAL:"></asp:Label>&nbsp;
        <asp:TextBox ID="TBRegpat" runat="server" MaxLength="11"></asp:TextBox>&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="RAZON SOCIAL:"></asp:Label>&nbsp;
        <asp:TextBox ID="TBRasonzocial" runat="server" MaxLength="50" Width="303px"></asp:TextBox>
    
    </div>
    <div id="contenedor_map">

    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Error.aspx.vb" Inherits="WebSIRECA._Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Dashed" BorderWidth="2px" 
            Font-Bold="True" Font-Size="Large" ForeColor="#0066CC" 
            HorizontalAlign="Center" BorderColor="#000099">
            <asp:Label ID="Label1" runat="server" 
    Text="Hay problemas en la transferencia de la Información"></asp:Label>
    <br />
        <asp:Label ID="Label2" runat="server" Text="Comuníquese con el administrador del Sistema"></asp:Label>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

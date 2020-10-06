<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="prueba2.aspx.vb" Inherits="WebSIRECA.prueba2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField ID="HiddenField1" runat="server" Value="contenudoDefault" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMasterSql %>" 
            SelectCommand="jko"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

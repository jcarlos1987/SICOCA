<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="prueba.aspx.vb" Inherits="WebSIRECA.prueba" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type ="text/javascript" language ="javascript">
        function accion() {
            alert("ok");
        }
</script>
</head>
<body>
    <form id="form1" runat="server" method="get">
    <asp:TextBox ID="TextBox2" onkey="" onchange="javascript:accion();" runat="server"></asp:TextBox>
    </form>
</body>
</html>

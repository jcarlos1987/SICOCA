<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="setIncidencia.aspx.vb" Inherits="WebSIRECA.setIncidencia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Label ID="Label1" runat="server" Text="Incidencia Actual:"></asp:Label>
    <asp:Label ID="LIncidencia" runat="server"></asp:Label><br />
    <asp:DropDownList ID="DDLIncidencia" runat="server" 
        DataSourceID="SqlDataSourceIncidencias" DataTextField="actividad" 
        DataValueField="clave">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceIncidencias" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as clave
      ,[ACTIVIDAD] as actividad
  FROM [sireca].[dbo].[catalogo]
WHERE grupoSupervisor='1'
ORDER BY actividad"></asp:SqlDataSource>
    <asp:Button ID="BIncidencia" runat="server" Text="Guardar" />
    </form>
</body>
</html>

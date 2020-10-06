<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Comentario.aspx.vb" Inherits="WebSIRECA.Comentario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Comentarios</title>
    
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <center >
        <h1>Comentar</h1><hr />
        <asp:Label ID="LEstadoRegistro" runat="server" ForeColor="#006600"></asp:Label><br />
        <asp:TextBox ID="TBComentario" runat="server" Height="92px" 
            TextMode="MultiLine" Width="343px" BorderColor="#BCC7D8" 
            BorderStyle="Solid" BorderWidth="1px" MaxLength="200"></asp:TextBox><br />
        <asp:DropDownList ID="DDLObservacion" runat="server" 
            DataSourceID="SqlDataSourceObservacion" DataTextField="texto" 
            DataValueField="clave">
        </asp:DropDownList>
        <asp:Button ID="BComentario"
            runat="server" Text="Comentar" BorderColor="#BCC7D8" BorderStyle="Solid" 
            BorderWidth="1px" />
        <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [clave]
      ,[texto]
,orden
  FROM [sirecaObservaciones].[dbo].[catalogoObservaciones]
order by orden"></asp:SqlDataSource>
            </center>
    </div>
    </form>
</body>
</html>

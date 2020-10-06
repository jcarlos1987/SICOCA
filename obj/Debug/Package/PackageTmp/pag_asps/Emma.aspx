<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Emma.aspx.vb" Inherits="WebSIRECA.Emma" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/imagenes/exportarexcel.png" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="Patrones" CaptionAlign="Left" CellPadding="3" 
            DataSourceID="SqlDataSourceEMMA" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL." 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="SEC" HeaderText="SEC." SortExpression="SEC" />
                <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG. PATRONAL" 
                    ReadOnly="True" SortExpression="REG_PATRONAL" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" 
                    SortExpression="LOCALIDAD" />
                <asp:BoundField DataField="MONTO" DataFormatString="{0:C}" HeaderText="MONTO" 
                    ReadOnly="True" SortExpression="MONTO" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEMMA" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
       [EMIP_SUB] as [SUBDEL]
	  ,[EMIP_SEC] as [SEC]
      ,substring([EMIP_PATRON],2,10) as [REG_PATRONAL]
      ,[EMIP_NOM_PATRON] as [RAZON_SOCIAL]
      ,substring([EMIP_NUM_CRED],2,20) as [CREDITO]
      ,[EMIP_DOM] as [DOMICILIO]
      ,[EMIP_LOC] as [LOCALIDAD]
	  ,([EMIP_IMP_EYM_FIJA] + EMIP_IMP_EYM_EXCE + EMIP_IMP_EYM_PRED + EMIP_IMP_EYM_PREE + EMIP_IMP_INV_VIDA + EMIP_IMP_RIES_TRA + EMIP_IMP_GUAR + EMIP_IMP_INV_VIDA_O + EMIP_IMP_EYM_EXCE_O + EMIP_IMP_EYM_PRED_O + EMIP_IMP_EYM_PREE_O)  as [MONTO]
FROM [sireca].[dbo].[patrones3301]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

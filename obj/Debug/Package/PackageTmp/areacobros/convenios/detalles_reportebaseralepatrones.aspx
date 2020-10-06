<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detalles_reportebaseralepatrones.aspx.vb" Inherits="WebSIRECA.detalles_reportebaseralepatrones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>detalles</title>
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
    <div class="btn-group input-prepend">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn"><span class="icon-download-alt"></span>&nbsp;DESCARGAR</asp:LinkButton>
    </div>
    </center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" 
            Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" ReadOnly="True" 
                    SortExpression="REGPATR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="COTIZ" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                    SortExpression="LOCALIDAD" />
                <asp:BoundField DataField="NUMCRED" HeaderText="CREDITOS(S)" ReadOnly="True" 
                    SortExpression="NUMCRED" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                    SortExpression="INC" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @MES AS VARCHAR(2)
DECLARE @INC AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(3)
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @INC=?
SET @TIPO=?

SELECT distinct TIPO,cr.SUBDEL,REGPATR
,razonSocial as RAZON
,cotiz as COTIZ
,dom as DOMICILIO,loc AS LOCALIDAD
,count(NUMCRED) as NUMCRED
,INC
,sum(IMPORTE) as IMPORTE
,count(distinct PERIODO) as PERIODO
FROM [sirecacobros].[dbo].[CR_RALE] as cr left join sireca.dbo.patrones
on replace(regpatr,'-','')=regpat
WHERE cr.SUBDEL LIKE @SUBDEL AND MONTH(FEINC) LIKE @MES AND YEAR(FEINC)=@ANIO
AND INC=@INC AND TIPO LIKE @TIPO
group by TIPO,cr.SUBDEL,REGPATR,razonSocial,cotiz,dom,loc,INC
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" QueryStringField="tipo" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

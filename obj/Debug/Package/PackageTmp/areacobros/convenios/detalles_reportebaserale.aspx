<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detalles_reportebaserale.aspx.vb" Inherits="WebSIRECA.detalles_reportebaserale" %>

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
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            HorizontalAlign="Center" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" ReadOnly="True" 
                    SortExpression="REGPATR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                    SortExpression="MOV">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FMOV" HeaderText="FMOV" ReadOnly="True" 
                    SortExpression="FMOV">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="SECTOR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCRED" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="NUMCRED">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                    SortExpression="TD">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FALTA" HeaderText="ALTA" ReadOnly="True" 
                    SortExpression="FALTA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FNOTIFICACION" HeaderText="NOTIFICADO" 
                    ReadOnly="True" SortExpression="FNOTIFICACION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                    SortExpression="INC">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FEINC" HeaderText="FECHA INC." ReadOnly="True" 
                    SortExpression="FEINC">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS" DataFormatString="{0:N0}" HeaderText="DIAS" 
                    ReadOnly="True" SortExpression="DIAS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DC" HeaderText="DC" ReadOnly="True" 
                    SortExpression="DC">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SC" HeaderText="SC" ReadOnly="True" 
                    SortExpression="SC">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO">
                <ItemStyle HorizontalAlign="Center" />
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

SELECT TIPO,SUBDEL,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,DC,SC
,substring(PERIODO,4,7) as PERIODO
FROM [sirecacobros].[dbo].[CR_RALE]
WHERE SUBDEL LIKE @SUBDEL AND MONTH(FEINC) LIKE @MES AND YEAR(FEINC)=@ANIO
AND INC=@INC AND TIPO LIKE @TIPO
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                    QueryStringField="anio" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
                <asp:QueryStringParameter DefaultValue="05" Name="?" QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="COP" Name="?" QueryStringField="tipo" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

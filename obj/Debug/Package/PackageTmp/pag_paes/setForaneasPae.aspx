<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="setForaneasPae.aspx.vb" Inherits="WebSIRECA.setForaneasPae" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" 
            BorderWidth="1px" Caption="Patrones Disponibles" 
            CellPadding="3" DataSourceID="SqlDataSourceForaneoPAE" EmptyDataText="0 CASOS" 
            Font-Size="9pt" BackColor="White" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="RUTA" HeaderText="RUTA" SortExpression="RUTA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/DefaultClear.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REGPAT" HeaderText="REG.PATRONAL" SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                    SortExpression="DOMICILIO" />
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                    SortExpression="LOCALIDAD" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                    SortExpression="SECTOR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="FALTA" HeaderText="FALTA" SortExpression="FALTA" />
                <asp:BoundField DataField="FECH_NOTIF" HeaderText="FECH_NOTIF" 
                    SortExpression="FECH_NOTIF" />
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECH_INC" HeaderText="FECH_INC" 
                    SortExpression="FECH_INC" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" 
                    DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DC" HeaderText="DC" SortExpression="DC" />
                <asp:BoundField DataField="SC" HeaderText="SC" SortExpression="SC" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../cobrosv2/default.aspx?r={0}" 
                    Text="Asignar" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BorderColor="Black" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle BorderColor="Black" BorderStyle="None" ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceForaneoPAE" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RUTA AS VARCHAR(50)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
SET @SUBDEL=?
SET @RUTA=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
exec('
select * from
(
SELECT distinct 
'''+@SUBDEL+''' as SUBDEL
,fora.[alias] AS RUTA
,replace(REGPATR,''-'','''') AS REGPAT
,razonSocial AS RAZON
,dom AS DOMICILIO
,loc AS LOCALIDAD
,ptn.sector AS SECTOR
,cotiz as COTIZANTES
,NUMCRED as CREDITO
,FALTA AS FALTA
,FNOTIFICACION AS FECH_NOTIF
,INC AS INC
,FEINC AS FECH_INC
,DIAS AS DIAS
,(IMPORTE) AS IMPORTE
,DC AS DC
,SC AS SC
,PERIODO AS PERIODO
,tipo_cop_rcv as TIPO
FROM [sirecacobros].[dbo].[foraneo] AS fora 
INNER JOIN 
(
SELECT ''COP'' as tipo_cop_rcv,*
FROM [rale].[dbo].['+@RALECOP+']
where td in (''02'') and inc in (''31'',''32'',''43'')
union all
SELECT ''RCV'' as tipo_cop_rcv,*
FROM [rale].[dbo].['+@RALERCV+']
where td in (''02'') and inc in (''31'',''32'',''43'')
 ) AS pae 
ON substring(pae.REGPATR,1,3) = fora.claveForaneo
left join sireca.dbo.patrones as ptn on regpat=replace(pae.REGPATR,''-'','''')
) as resultado
where ruta='''+@RUTA+'''
order by localidad,sector,regpat
')
" 
            
            
            
            UpdateCommand="UPDATE [sireca].[dbo].[eco] SET [cambiarIncidencia]= ? WHERE [id] = ?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="foraneo" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cambiarIncidencia" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallespendientes.aspx.vb" Inherits="WebSIRECA.detallespendientes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewPendientes" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourcePendientes" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            Font-Size="10pt" HorizontalAlign="Center" ShowFooter="True" 
            BackColor="White">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                    SortExpression="SECTOR" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REGPAT" HeaderText="REGPAT" 
                    NavigateUrl="~/observacionPatronal/Default.aspx" SortExpression="REGPAT" />
                <asp:BoundField DataField="NOMBRE O RAZON SOCIAL" 
                    HeaderText="NOMBRE O RAZON SOCIAL" SortExpression="NOMBRE O RAZON SOCIAL" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
                    SortExpression="DIAS" />
            </Columns>
            <FooterStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#E8AA35" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePendientes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            
            SelectCommand="select 
subdel as SUBDEL
,(SELECT upper(nombre) FROM fiscamovil.dbo.usuarios WHERE id=responsable) as INSPECTOR
,tipoeco as TIPO
,(case when len(fechaEco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) as PERIODO
,sector as SECTOR
,REG#PATRONAL as REGPAT
,[NOMBRE O RAZON SOCIAL]
,COTIZ as COTIZANTES
,OMISION as IMPORTE
,(select '('+[CVE DILIG#]+')'+ACTIVIDAD from sireca.dbo.catalogo where [CVE DILIG#]=incidencia) as INCIDENCIA
,(datediff(day,fechacaptura,getdate())) as DIAS
from sireca.dbo.eco
where 
subdel=?
and tipoeco like ?
and incidencia like ?
 
and datediff(day,fechacaptura,getdate())&gt;=19
and incidenciarale in ('01','02')
and validacion='SIN PAGO'
order by subdel,(case when len(fechaEco)=5 then substring(convert(varchar,fechaeco),2,4)+'/'+'0'+substring(convert(varchar,fechaeco),1,1) else substring(convert(varchar,fechaeco),3,4)+'/'+substring(convert(varchar,fechaeco),1,2) end),DIAS">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="000" Name="?" QueryStringField="tipo" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="inc" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

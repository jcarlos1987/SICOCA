<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="informediariocobranzaoportunadetalle.aspx.vb" Inherits="WebSIRECA.informediariocobranzaoportunadetalle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            HorizontalAlign="Center" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPATX" HeaderText="REGPATX" ReadOnly="True" 
                    SortExpression="REGPATX">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                    ReadOnly="True" SortExpression="PAGO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FECH_PAGO" DataFormatString="{0:d}" 
                    HeaderText="FECHA PAGO" ReadOnly="True" SortExpression="FECH_PAGO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="incidenciax" HeaderText="INC." ReadOnly="True" 
                    SortExpression="incidenciax" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECHA_INI as DATETIME
DECLARE @FECHA_FIN as DATETIME
DECLARE @INC as VARCHAR(15)
SET @SUBDEL=?
SET @INC=?
SET @FECHA_INI=?
SET @FECHA_FIN=?

select * from (
SELECT 
[subdel] AS SUBDEL
,[tipoECO] AS TIPO
,REG#PATRONAL AS REGPATX
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,CREDITO	
,[OMISION] AS IMPORTE
,(SELECT upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) AS INSPECTOR
--,[incidencia] AS INCIDENCIA
,pago AS PAGO
,fech_pago as FECH_PAGO
--,[incidenciarale]
,case
when pago&gt;=omision and fech_pago&lt;=dateadd(day,-0,fechacaptura) then 'DEPURADO'
when pago&gt;=omision then 'PAGADO'
when pago&lt;omision then 'PAGADO'
when [incidencia] IS NULL then '1'
else [incidencia]
end as [incidenciax]
  FROM [sireca].[dbo].[eco]
  where convert(varchar,fechaseleccion,103) between @FECHA_INI and @FECHA_FIN
  and subdel like @SUBDEL 
  ) as reslt where [incidenciax]=@INC
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="sub" />
                <asp:QueryStringParameter DefaultValue="1" Name="?" QueryStringField="in" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="ffin" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

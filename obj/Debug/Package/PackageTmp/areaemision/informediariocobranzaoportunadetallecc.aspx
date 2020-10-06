<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="informediariocobranzaoportunadetallecc.aspx.vb" Inherits="WebSIRECA.informediariocobranzaoportunadetallecc" %>

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
                    SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REG.PAT." ReadOnly="True" 
                    SortExpression="REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="OMISION" HeaderText="OMISION" ReadOnly="True" 
                    SortExpression="OMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CIFRA_CONTROL" HeaderText="CIFRA CONTROL" 
                    ReadOnly="True" SortExpression="CIFRA_CONTROL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_INI AS DATETIME
DECLARE @FECHA_FIN AS DATETIME
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?

select datos.SUBDEL,ptn.regpat as REGPAT
,ptn.razonSocial as RAZON_SOCIAL
,TIPO,PERIODO
,CREDITO
,OMISION
,datos.COTIZ
,CIFRA_CONTROL
,credito_r
from (
SELECT
HA_SUBDEL as SUBDEL,regpat_r as REGPAT
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
,tipoECO AS TIPO
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO
,CREDITO
,OMISION
,COTIZ
,clave AS CIFRA_CONTROL
,credito_r
FROM (
SELECT
      distinct [HA_SUBDEL]
      ,SUBSTRING(replace([CQ_DATO1],'REG. PATRONAL:$',''),1,10) as regpat_r
      ,substring([HA_ID_CODEBAR],charindex('!',[HA_ID_CODEBAR])+1,len([HA_ID_CODEBAR])) as credito_r
      --,[HA_FECH_REGISTRO]
  FROM [controlQR].[dbo].[HIST_ACCIONES]
  left join [controlQR].[dbo].[CONTROL_QR]
  ON CQ_ID=substring([HA_ID_CODEBAR],1,charindex('!',[HA_ID_CODEBAR])-1)
  WHERE [HA_AC_ID]='4' and [HA_SUBDEL] LIKE @SUBDEL
  and [HA_FECH_REGISTRO] between @FECHA_INI and @FECHA_FIN
  ) AS RR
  LEFT JOIN 
  sireca.dbo.eco 
  on substring(reg#patronal,1,10)=regpat_r and credito=credito_r
  ) as datos left join 
  sireca.dbo.patrones as ptn on ptn.regpat=datos.regpat
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="s" />
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

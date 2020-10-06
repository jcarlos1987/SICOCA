<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="documento.aspx.vb" Inherits="WebSIRECA.documento" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: #D6D3CE">
    <form id="form1" runat="server">
    <div>
    
    <center>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Calibri" 
            Font-Size="8pt" InteractiveDeviceInfos="(Colección)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="800px" 
            InternalBorderColor="Aquamarine" Height="600px">
            <LocalReport ReportPath="cobros\cartaConvenioDiferidoFisicaRCV.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSourceRCV" Name="DataSetRCV" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSourceRCV" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
,[RAZONSOCIAL]
,[DOMICILIO]
      ,[FMOV]
      ,[NUMCRED]
      ,[TD]
      ,[INC]
      ,[DIAS]
      ,[IMPORTE]
      ,substring([PERIODO],4,7) as [PERIODO]
      ,[ACTUALIZADO]
      ,[RECARGO]
      ,[TOTAL_ACTUALIZADO]
      ,[PORCIENTO2]
      ,[GASTO]
  FROM [sirecacobros].[dbo].[rcv]
where regpatr=?
order by CONVERT(DATETIME,[PERIODO])">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="REGPATR" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCOP" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [REGPATR]
,(select ptn.[razonSocial] from sireca.dbo.patrones as ptn where [regpat]=replace([REGPATR],'-','')) as [RAZONSOCIAL]
,(select ptn.[dom] from sireca.dbo.patrones as ptn where [regpat]=replace([REGPATR],'-','')) as [DOMICILIO]
      ,[FMOV]
      ,[NUMCRED]
      ,[TD]
      ,[INC]
      ,[DIAS]
      ,[IMPORTE]
      ,substring([PERIODO],4,7) as [PERIODO]
      ,[ACTUALIZADO]
      ,[RECARGO]
      ,[TOTAL_ACTUALIZADO]
      ,[PORCIENTO2]
      ,[GASTO]
  FROM [sirecacobros].[dbo].[cop]
where regpatr=?
order by CONVERT(DATETIME,[PERIODO])">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="REGPATR" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </center>
    </div>
    </form>
</body>
</html>

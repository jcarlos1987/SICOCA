<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReporteDelEjecutorPDF.aspx.vb" Inherits="WebSIRECA.ReporteDelEjecutorPDF" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 125px;
        }
        .style2
        {
            height: 135px;
        }
        .style3
        {
            width: 126px;
        }
    </style>
</head>
<body style ="font-family: 'Calibri';" >
    <form id="form1" runat="server">
    <div>
        <table border="0" width ="100%">
        <tr>
        <td class="style2" colspan="3">
        <table>
        <tr>
        <td class="style1"><img alt="imss" class="style3" src="../imagenes/logoImss.png" /></td>
        <td style="font-weight: bold">
        INSTITUTO MEXICANO DEL SEGURO SOCIAL<br />
        SEGURIDAD Y SOLIDARIDAD SOCIAL<br />
            DELEGACIÓN: ESTATAL YUCATÁN<br />
            <%  If Request.QueryString("subdel").ToString.Equals("01") Then
                    Response.Write("SUBDELEGACIÓN: MÉRIDA NORTE<br />")
                    Response.Write("OFICINA PARA COBROS: MÉRIDA NORTE<br />")
                    Response.Write("DOMICILIO: CALLE 7 No. 131 POR 38 COL. PENSIONES")
                ElseIf Request.QueryString("subdel").ToString.Equals("33") Then
                    Response.Write("SUBDELEGACIÓN: MÉRIDA SUR<br />")
                    Response.Write("OFICINA PARA COBROS: MÉRIDA SUR<br />")
                    Response.Write("DOMICILIO: CALLE 131 S/N POR 42 SUR COL. SERAPIO RENDON")
                End If
                %>
        </td>
        </tr>
        </table>
            </td>
        </tr>
        <tr>
        <td></td>
        <td colspan="2"></td>
        </tr>
        <tr>
        <td colspan="3" style="border: thin solid #000000;">&nbsp;C. Jefe de Ejecución Fiscal.<br />
            &nbsp;Presente<br />
            <br />
            &nbsp;Acontinuación informo a usted el trabajo efectuado por el suscrito el 
            <strong style="text-decoration: underline">&nbsp;&nbsp;<%:Request.QueryString ("fechaCap") %>&nbsp;&nbsp;</strong>, cuyas constancias se anexan.
         </td>
        </tr>
        <tr>
        <td colspan="3" class="style1">
        <asp:SqlDataSource ID="SqlDataSourceReporte" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
ROW_NUMBER() OVER(ORDER BY [REGPATR],convert(datetime,[PERIODO],102)) as fila
	,replace([REGPATR],'-','') as [REG. PATRONAL]
      ,max([RAZON_SOCIAL]) as PATRON
      ,[NUMCRED]
      ,substring([PERIODO],4,7) as PERIODO
      ,max([ADEUDO]) as IMPORTE
      ,((SELECT ('('+(case when [INC_CAP]='09' then '09-68' else [INC_CAP] end )+')' + dcat.[ACTIVIDAD]) FROM [sireca].[dbo].[catalogo] as dcat where dcat.[CVE_DILIG_PAE]=[INC_CAP]) + ', ' + case when max(OBSERVACION) is null then '' else max(OBSERVACION) end) as [RESULT.DELIGENCIA]
  FROM [sirecacobros].[dbo].[ecoTiposHistorialCap]
  where [ID_RESPONSABLE]=? and [INC_CAP] not in ('x')
and convert(datetime,convert(varchar(11),fech_cap),102)=convert(datetime,?,102)
group by [REGPATR],[PERIODO],[NUMCRED],[INC_CAP]">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="idejecutor" />
                <asp:QueryStringParameter DefaultValue="11/01/2012" Name="?" 
                    QueryStringField="fechaCap" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Caption="&lt;strong&gt;DILIGENCIAS CUOTA OBRERO PATRONALES&lt;/strong&gt;" 
                HorizontalAlign="Center" BackColor="White" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                DataSourceID="SqlDataSourceReporte" Font-Size="11pt" ForeColor="Black" 
                GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#EAEAEA" />
            <Columns>
                <asp:BoundField DataField="REG. PATRONAL" HeaderText="REG. PATRONAL" 
                    SortExpression="REG. PATRONAL" />
                <asp:BoundField DataField="PATRON" HeaderText="PATRON" 
                    SortExpression="PATRON" />
                <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" 
                    SortExpression="NUMCRED" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="RESULT.DELIGENCIA" HeaderText="RESULT.DELIGENCIA" 
                    ReadOnly="True" SortExpression="RESULT.DELIGENCIA" >
                <ItemStyle Font-Size="10pt" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </td>
        </tr>
        <tr>
        <td style="text-align: center; border: thin solid #000000">Recibi<br />
            <br />
            ___________________________________<br />
            <%  If Request.QueryString("subdel").ToString.Equals("01") Then
                    Response.Write("C. SILVIA GUADALUPE HUCHIM PACHECO<br />")
                    Response.Write("JEFE SECCION COBRANZA COACTIVA<br />")
                ElseIf Request.QueryString("subdel").ToString.Equals("33") Then
                    Response.Write("C.<br />")
                    Response.Write("JEFE SECCION COBRANZA COACTIVA<br />")
                End If
                %>
            <strong>Nombre, Firma y Fecha</strong></td>
        <td></td>
        <td style="text-align: center; border: thin solid #000000">Ejecutor<br />
            <br />
            ___________________________________<br />
            <asp:Label ID="LEjecutor" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="LCredencial" runat="server" Text=""></asp:Label>
            <br />
            <strong>Nombre, Firma y Clave</strong></td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>

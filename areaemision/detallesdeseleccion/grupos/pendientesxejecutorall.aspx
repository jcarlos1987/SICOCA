<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="pendientesxejecutorall.aspx.vb" Inherits="WebSIRECA.pendientesxejecutorall" %>

<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Button ID="Button1" runat="server" Text="Exportar" />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="subdel" HeaderText="subdel" ReadOnly="True" 
                SortExpression="subdel" />
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" />
            <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                DataNavigateUrlFormatString="../../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                DataTextField="PATRONES" HeaderText="REG.PATRONAL" SortExpression="PATRONES" 
                Target="_blank" />
            <asp:BoundField DataField="razonSocial" HeaderText="razonSocial" 
                ReadOnly="True" SortExpression="razonSocial" />
            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                SortExpression="CREDITOS" />
            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                SortExpression="INCIDENCIA" />
            <asp:BoundField DataField="tipoeco" HeaderText="TIPO" 
                SortExpression="tipoeco" />
            <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                SortExpression="INC_RALE" />
        </Columns>
        <HeaderStyle BackColor="#8FB78E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
SET @SUBDEL=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)
exec(
' SELECT 
[subdel]
,UPPER((SELECT USF.NOMBRE FROM FISCAMOVIL.DBO.USUARIOS AS USF WHERE USF.ID = [responsable])) AS INSPECTOR
,(
case len(FECHAECO) 
when 5 then ''0''+substring(convert(varchar,FECHAECO),1,1)+''/''+substring(convert(varchar,FECHAECO),2,4)
else substring(convert(varchar,FECHAECO),1,2)+''/''+substring(convert(varchar,FECHAECO),3,4)
end
)
as PERIODO
,(REG#PATRONAL) AS PATRONES
,[NOMBRE O RAZON SOCIAL] as razonSocial
,([CREDITO]) AS CREDITOS
,([COTIZ]) AS COTIZANTES
,([OMISION]) AS IMPORTE
,incidencia as INCIDENCIA
,tipoeco
,rale.inc as INC_RALE
  FROM [sireca].[dbo].[eco] as eco left join (select * from [rale].[dbo].['+@RALECOP+'] union all select * from [rale].[dbo].['+@RALERCV+']) as rale 
on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
WHERE [responsable] IS NOT NULL
AND SUBDEL='''+@SUBDEL+'''
and tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and fechaeco in (''72013'',''82013'',''92013'',''102013'')
and (incidencia in (''0'',''1'',''2'',''A'',''SIN ATENDER'') or incidencia is null)
and validacion = ''SIN PAGO'' and incidenciarale in (''00'',''01'',''02'')
and responsable=''' + ? + '''
ORDER BY incidencia,cotizantes desc
')
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                QueryStringField="inspector" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="pendientessininspectorvigente.aspx.vb" Inherits="WebSIRECA.pendientessininspectorvigente" %>

<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >

    <asp:Button ID="Button1" runat="server" Text="Exportar" />

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" />
            <asp:BoundField DataField="ASIGNADO" DataFormatString="{0:d}" 
                HeaderText="ASIGNADO" ReadOnly="True" SortExpression="ASIGNADO" />
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                DataNavigateUrlFormatString="../../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                DataTextField="PATRONES" HeaderText="REG.PATRONAL" SortExpression="PATRONES" 
                Target="_blank" />
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL" />
            <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                SortExpression="CREDITOS" DataFormatString="{0:N0}">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
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
            <asp:BoundField DataField="INC_RALE_COP" HeaderText="INC_RALE" 
                SortExpression="INC_RALE_COP" />
        </Columns>
        <HeaderStyle BackColor="#8FB78E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
SET @SUBDEL=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)

exec(
'SELECT 
[subdel]
,fechaSeleccion as ASIGNADO
,upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=responsable)) as INSPECTOR
,(case len([fechaeco]) when 5 then ''0''+substring(convert(varchar,fechaeco),0,2)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),0,3)+''/''+ substring(convert(varchar,fechaeco),3,4) end) as PERIODO
,reg#patronal as PATRONES
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
,credito as CREDITOS
,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=incidencia) as INCIDENCIA
,cotiz as COTIZANTES
,omision as IMPORTE
,tipoeco
,rale.inc as INC_RALE_COP
FROM [sireca].[dbo].[eco] as eco left join (select * from [rale].[dbo].['+@RALECOP+'] union all select * from [rale].[dbo].['+@RALERCV+']) as rale 
on  replace(rale.regpatr,''-'','''')=substring(eco.REG#PATRONAL,1,10) and rale.NUMCRED=eco.credito
WHERE SUBDEL='''+@SUBDEL+'''
and tipoEco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and fechaeco in (''82013'',''92013'',''102013'')
and (incidencia in (''0'',''1'',''2'',''A'',''SIN ATENDER'') or incidencia is null)
and validacion = ''SIN PAGO'' and incidenciarale in (''00'',''01'',''02'')
and not exists(select usx.id from sireca.dbo.usuarios as usx where usx.id=responsable and user_type=''1'')
')">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

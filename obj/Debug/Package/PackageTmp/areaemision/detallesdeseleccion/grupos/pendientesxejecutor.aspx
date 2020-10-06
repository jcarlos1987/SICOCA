<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteGeneral.Master" AutoEventWireup="false" CodeBehind="pendientesxejecutor.aspx.vb" Inherits="WebSIRECA.pendientesxejecutor" %>

<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="10pt">
        <Columns>
            <asp:BoundField DataField="tipoeco" HeaderText="TIPO" 
                SortExpression="tipoeco" />
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
            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                SortExpression="INCIDENCIA" />
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
        </Columns>
        <HeaderStyle BackColor="#8FB78E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @SUBDEL as VARCHAR(2)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL=?
SELECT 
fechaSeleccion as ASIGNADO
,upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=responsable)) as INSPECTOR
,(case len([fechaeco]) when 5 then '0'+substring(convert(varchar,fechaeco),0,2)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),0,3)+'/'+ substring(convert(varchar,fechaeco),3,4) end) as PERIODO
,reg#patronal as PATRONES
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
,credito as CREDITOS
,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=incidencia) as INCIDENCIA
,cotiz as COTIZANTES
,omision as IMPORTE
,tipoEco as tipoeco
FROM [sireca].[dbo].[eco]
where 
tipoEco in ('COP','COMP','RCV','RCVCOMP')
and fechaeco in ('42013','52013','62013','72013','82013','92013','102013')
and (incidencia in ('0','1','2','A','SIN ATENDER') or incidencia is null)
and validacion = 'SIN PAGO' and incidenciarale in ('00','01','02')
and responsable is not null
and responsable=?
and fechaEco=?
order by 1,2
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="2000" Name="?" 
                QueryStringField="anio" />
            <asp:QueryStringParameter DefaultValue="01" Name="?" QueryStringField="mes" />
            <asp:QueryStringParameter DefaultValue="00" Name="?" 
                QueryStringField="subdel" />
            <asp:QueryStringParameter DefaultValue="066" Name="?" 
                QueryStringField="responsable" />
            <asp:QueryStringParameter DefaultValue="012000" Name="?" 
                QueryStringField="fechaEco" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

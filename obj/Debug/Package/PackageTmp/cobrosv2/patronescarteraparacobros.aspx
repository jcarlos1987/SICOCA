<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="patronescarteraparacobros.aspx.vb" Inherits="WebSIRECA.patronescarteraparacobros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
</center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="9pt" 
        AllowPaging="True" AllowSorting="True" PageSize="15">
        <Columns>
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" />
            <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                SortExpression="RAZON" />
            <asp:TemplateField HeaderText="CODEBAR" SortExpression="CODEBAR">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "http://11.200.24.211/Webqr/barra.aspx?key=" & Eval("CODEBAR") %>' PostBackUrl='<%# "~/cobrosv2/default.aspx?r=" & Eval("REGPAT") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FECHA_CAPTURA" DataFormatString="{0:d}" 
                HeaderText="FECHA CAPTURA" ReadOnly="True" SortExpression="FECHA_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="pago" DataFormatString="{0:C}" HeaderText="PAGO" 
                ReadOnly="True" SortExpression="pago">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="fech_pago" DataFormatString="{0:d}" 
                HeaderText="FECHA PAGO" ReadOnly="True" SortExpression="fech_pago">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="incidenciarale" HeaderText="INCIDENCIA R.A.L.E." 
                ReadOnly="True" SortExpression="incidenciarale" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="tdrale" HeaderText="TD R.A.L.E." ReadOnly="True" 
                SortExpression="tdrale" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <PagerSettings PageButtonCount="30" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(10)
SET @SUBDEL = ?
select REGPAT,RAZON,max(CODEBAR) as CODEBAR,FECHA_CAPTURA,IMPORTE,pago,fech_pago,incidenciarale,tdrale 
,max(SECTOR) as SECTOR
from (
SELECT TAB3.REGPAT AS REGPAT,[NOMBRE O RAZON SOCIAL] AS RAZON
,TAB3.HA_ID_CODEBAR AS CODEBAR
--,TAB3.CREDITO AS CREDITO
,convert(datetime,convert(varchar,HA_FECH_REGISTRO,103)) as FECHA_CAPTURA
,OMISION AS IMPORTE
,pago,fech_pago,incidenciarale,tdrale,TAB4.SECTOR
FROM (
SELECT [HA_SUBDEL]
,SUBSTRING(REGPAT,1,10) AS REGPAT
,[HA_ID_CODEBAR]
,SUBSTRING([HA_ID_CODEBAR],CHARINDEX('!',[HA_ID_CODEBAR])+1,LEN([HA_ID_CODEBAR])) AS CREDITO
,[HA_FECH_REGISTRO]
FROM [controlQR].[dbo].[HIST_ACCIONES] LEFT JOIN (
SELECT [CQ_ID],REPLACE([CQ_DATO1],'REG. PATRONAL:$','') AS REGPAT
FROM [controlQR].[dbo].[CONTROL_QR] WHERE [CQ_AREA]='co') AS QR
ON [CQ_ID]=SUBSTRING([HA_ID_CODEBAR],1,CHARINDEX('!',[HA_ID_CODEBAR])-1)
WHERE [HA_AC_ID]='4' AND [HA_SUBDEL]=@SUBDEL
) AS TAB3 LEFT JOIN SIRECA.DBO.ECO AS TAB4
ON TAB3.REGPAT=SUBSTRING(TAB4.REG#PATRONAL,1,10) AND TAB3.CREDITO=TAB4.CREDITO
where (pago&lt;=0 or pago is null) and incidenciarale is not null and incidenciarale in ('31')
) as x
group by REGPAT,RAZON,FECHA_CAPTURA,IMPORTE,pago,fech_pago,incidenciarale,tdrale
order by fecha_captura desc, importe desc
--HA_FECH_REGISTRO
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

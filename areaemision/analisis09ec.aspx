<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="analisis09ec.aspx.vb" Inherits="WebSIRECA.analisis09ec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center >
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="SUBDEL."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text=" VER EN GRUPO DE "></asp:Label>
</span> 
    <asp:DropDownList ID="DDLGrupo" runat="server" Width="60px">
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>60</asp:ListItem>
        <asp:ListItem>70</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text=" NO LOCALIZADOS DE: "></asp:Label>
</span> 
    <asp:DropDownList ID="DDLArea" runat="server" Width="120px">
        <asp:ListItem>EMISIONES</asp:ListItem>
        <asp:ListItem>COBROS</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LBAct" CssClass ="btn" runat="server" BackColor="#9CAAC1">ACTUALIZAR</asp:LinkButton>
</span> 
</div> 
</center>
    <asp:GridView ID="GridViewEmision" runat="server" AutoGenerateColumns="False" 
        Caption="&lt;strong&gt;EMISION REPORTA 09 Y COBROS NO&lt;/strong&gt;" 
        DataSourceID="SqlDataSourceEmision" AllowPaging="True" AllowSorting="True" 
        Font-Size="9pt" HorizontalAlign="Center" PageSize="15">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="NOTIFICADOR" HeaderText="NOTIFICADOR" 
                ReadOnly="True" SortExpression="NOTIFICADOR" />
            <asp:BoundField DataField="V_FECHA_CAPTURA" 
                HeaderText="FECHA CAPTURA" ReadOnly="True" 
                SortExpression="V_FECHA_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="DILIGENCIA_INSPECTOR" 
                HeaderText="DILIGENCIA INSPECTOR" ReadOnly="True" 
                SortExpression="DILIGENCIA_INSPECTOR" />
            <asp:BoundField DataField="AC_FECH_DILIGENCIA" HeaderText="FECHA DILIGENCIA" 
                ReadOnly="True" SortExpression="AC_FECH_DILIGENCIA" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <PagerSettings PageButtonCount="40" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceEmision" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
SET @SUBDEL=?
SELECT * FROM (
SELECT V_SUBDEL AS SUBDEL,V_REGPAT AS REGPAT
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=V_ID_CAPTURO) AS NOTIFICADOR
,[V_INC_CAPTURA] AS DILIGENCIA_NOTIFICADOR
,V_FECHA_CAPTURA
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=AC_ID_CAPTURO) AS INSPECTOR
,(SELECT [desc_diligencia]
FROM [sirecacobros].[dbo].[cae_diligencia]
WHERE [id_diligencia]=AC_DILIGENCIA) AS DILIGENCIA_INSPECTOR
,AC_FECH_DILIGENCIA
FROM (
SELECT [V_SUBDEL],substring([V_REGPAT],1,10) as V_REGPAT,[V_ID_CAPTURO]
,[V_INC_CAPTURA]
,CONVERT(VARCHAR(10),V_FECHA_CAPTURA,103) AS V_FECHA_CAPTURA
FROM [sirecaemisiones].[dbo].[eco]
where [V_SUBDEL]=@SUBDEL AND YEAR(V_FECHA_CAPTURA)=2014
group by [V_SUBDEL],[V_REGPAT],[V_ID_CAPTURO],[V_INC_CAPTURA],CONVERT(VARCHAR(10),V_FECHA_CAPTURA,103)) AS SE
left join
(SELECT [AC_SUBDEL],[AC_RA_REGPATR] as AC_REGPAT,AC_CP_INSPEC as AC_ID_CAPTURO,AC_DILIGENCIA
,CONVERT(VARCHAR(10),AC_FECH_DILIGENCIA,103) AS AC_FECH_DILIGENCIA
FROM [sirecacobros].[dbo].[CO_ACCIONES]
where ac_subdel=@SUBDEL AND AC_DILIGENCIA NOT IN ('0')
and YEAR(AC_FECH_DILIGENCIA)=2014
group by [AC_SUBDEL],[AC_RA_REGPATR],AC_CP_INSPEC,AC_DILIGENCIA,CONVERT(VARCHAR(10),AC_FECH_DILIGENCIA,103)) AS SC
ON SE.V_REGPAT=SC.AC_REGPAT
) as res
where DILIGENCIA_NOTIFICADOR='9' and V_FECHA_CAPTURA&lt;AC_FECH_DILIGENCIA
AND DILIGENCIA_INSPECTOR NOT IN ('NO LOCALIZADO (foto)')
AND INSPECTOR IS NOT NULL AND NOTIFICADOR IS NOT NULL
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewCobros" runat="server" AutoGenerateColumns="False" 
        Caption="&lt;strong&gt;COBROS REPORTA 09 Y EMISION NO&lt;/strong&gt;" 
        DataSourceID="SqlDataSourceCobros" AllowPaging="True" AllowSorting="True" 
        Font-Size="9pt" HorizontalAlign="Center" PageSize="15" Visible="False">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                SortExpression="REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="AC_FECH_DILIGENCIA" 
                HeaderText="FECHA DILIGENCIA" ReadOnly="True" 
                SortExpression="AC_FECH_DILIGENCIA" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="NOTIFICADOR" HeaderText="NOTIFICADOR" 
                ReadOnly="True" SortExpression="NOTIFICADOR" />
            <asp:BoundField DataField="DILIGENCIA_NOTIFICADOR" 
                HeaderText="DILIGENCIA NOTIFICADOR" ReadOnly="True" 
                SortExpression="DILIGENCIA_NOTIFICADOR" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA CAPTURA" 
                ReadOnly="True" SortExpression="V_FECHA_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <PagerSettings PageButtonCount="40" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCobros" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
SET @SUBDEL=?
SELECT * FROM (
SELECT V_SUBDEL AS SUBDEL,V_REGPAT AS REGPAT
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=AC_ID_CAPTURO) AS INSPECTOR
,(SELECT [desc_diligencia]
FROM [sirecacobros].[dbo].[cae_diligencia]
WHERE [id_diligencia]=AC_DILIGENCIA) AS DILIGENCIA_INSPECTOR
,AC_FECH_DILIGENCIA
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=V_ID_CAPTURO) AS NOTIFICADOR
,[V_INC_CAPTURA] AS DILIGENCIA_NOTIFICADOR
,V_FECHA_CAPTURA
FROM (
SELECT [V_SUBDEL],substring([V_REGPAT],1,10) as V_REGPAT,[V_ID_CAPTURO]
,[V_INC_CAPTURA]
,CONVERT(VARCHAR(10),V_FECHA_CAPTURA,103) AS V_FECHA_CAPTURA
FROM [sirecaemisiones].[dbo].[eco]
where [V_SUBDEL]=@SUBDEL AND YEAR(V_FECHA_CAPTURA)=2014
group by [V_SUBDEL],[V_REGPAT],[V_ID_CAPTURO],[V_INC_CAPTURA],CONVERT(VARCHAR(10),V_FECHA_CAPTURA,103)) AS SE
left join
(SELECT [AC_SUBDEL],[AC_RA_REGPATR] as AC_REGPAT,AC_CP_INSPEC as AC_ID_CAPTURO,AC_DILIGENCIA
,CONVERT(VARCHAR(10),AC_FECH_DILIGENCIA,103) AS AC_FECH_DILIGENCIA
FROM [sirecacobros].[dbo].[CO_ACCIONES]
where ac_subdel=@SUBDEL AND AC_DILIGENCIA NOT IN ('0')
and YEAR(AC_FECH_DILIGENCIA)=2014
group by [AC_SUBDEL],[AC_RA_REGPATR],AC_CP_INSPEC,AC_DILIGENCIA,CONVERT(VARCHAR(10),AC_FECH_DILIGENCIA,103)) AS SC
ON SE.V_REGPAT=SC.AC_REGPAT
) as res
where DILIGENCIA_INSPECTOR IN ('NO LOCALIZADO (foto)') and V_FECHA_CAPTURA&gt;AC_FECH_DILIGENCIA
AND DILIGENCIA_NOTIFICADOR not in ('9','POR PROCESAR','PAGADO')
AND INSPECTOR IS NOT NULL AND NOTIFICADOR IS NOT NULL
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/Site2.Master" AutoEventWireup="false" CodeBehind="WebPAE.aspx.vb" Inherits="WebSIRECA.WebPAE" %>
<asp:Content ID="conten1" runat ="server" ContentPlaceHolderID ="head" >
        <title>Resultados</title>
    <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Label ID="Label1" runat="server" Text="Para el PAE"></asp:Label><hr />
    <asp:Label ID="Label4" runat="server" Text="Subdelegacion:"></asp:Label>
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
    </asp:DropDownList>
    <asp:Label ID="Label3" runat="server" Text="RALE:"></asp:Label>
    <asp:DropDownList ID="DDLRale" runat="server" DataSourceID="SqlDataSourceRALE" 
        DataTextField="name" DataValueField="name">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRALE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [name]
  FROM [rale].[dbo].[tablas]
  where subdel =? and tipo='COP'
  order by fecha desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Actualizar" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSourcePae" HorizontalAlign="Center" 
        AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="REGPATR" SortExpression="REGPATR">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                        NavigateUrl='<%# Eval("REGPATR", "WebPAEDetalles.aspx?regpat={0}") %>' 
                        Text='<%# Eval("REGPATR") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                SortExpression="RAZON_SOCIAL" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="CASOS" DataFormatString="{0:N0}" HeaderText="CASOS" 
                SortExpression="CASOS" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ASIGNADO A:">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text ='<%# Eval("RESPONSABLE") %>'></asp:Label><br />
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceInspectores" DataTextField="nombreu" 
                        DataValueField="idu" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">PENDIENTE</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceInspectores" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT uss.[id] as idu
,usf.nombre as nombreu
FROM [sireca].[dbo].[usuarios] as uss inner join fiscamovil .dbo.Usuarios as usf on uss.[id]=usf.[id]
where uss.user_type ='1' and uss.subdel =?">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                SortExpression="ADEUDO" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="COTIZANTE" DataFormatString="{0:N0}" 
                HeaderText="COTIZANTE" SortExpression="COTIZANTE" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="EMISION" DataFormatString="{0:C}" 
                HeaderText="EMISION" SortExpression="EMISION" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TIPO_ADEUDO" HeaderText="TIPO_ADEUDO" 
                SortExpression="TIPO_ADEUDO" />
            <asp:BoundField DataField="DIAS" DataFormatString="{0:N0}" HeaderText="DIAS" 
                SortExpression="DIAS" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourcePae" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="if exists(select * from sirecacobros.dbo.sysobjects where name = 'ecoTipos') 
begin
drop table sirecacobros.dbo.ecoTipos
end
SELECT [REGPATR]
,NUMCRED
,PERIODO
,EMA.EMIP_NOM_PATRON as RAZON_SOCIAL
,COUNT(NUMCRED) AS CASOS
,[IMPORTE] AS ADEUDO
,INC
,CASE
WHEN INC IN ('31','32','43','01') THEN 'PAE'
WHEN INC IN ('33','34','35','37','38','39') THEN 'REMATE'
WHEN INC IN ('52','54','23') THEN 'CONVENIO'
END AS GRUPO
,EMA.EMIP_NUM_TRAB_COT as COTIZ
,EMA.EMIP_IMP_EYM_FIJA+EMA.EMIP_IMP_EYM_EXCE+EMA.EMIP_IMP_EYM_PRED+
           EMA.EMIP_IMP_EYM_PREE+ EMA.EMIP_IMP_INV_VIDA+EMA.EMIP_IMP_RIES_TRA+
           EMA.EMIP_IMP_GUAR+ EMA.EMIP_IMP_INV_VIDA_O+EMA.EMIP_IMP_EYM_EXCE_O+
           EMA.EMIP_IMP_EYM_PRED_O+ EMA.EMIP_IMP_EYM_PREE_O as emision
--,'NO' as ASIGNADO
--,INC as INCIDENCIA_INICIAL
--,'SIN CAPTURA' as INCIDENCIA_CAPTURADA
--,'NO ASIGNADO' as EJECUTOR
--,NULL as FECHA_CAPTURA
,DIAS as DIAS
INTO sirecacobros.dbo.ecoTipos 
  FROM [rale].[dbo].[3301ACOP201112] 
left join 
OPENROWSET( 'Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\1012\EMIS3301.mdb';'Admin';'','SELECT * FROM cdempa102012') as EMA on replace([REGPATR],'-','') = substring(EMA.EMIP_PATRON,2,10)
WHERE PERIODO BETWEEN '01/01/1800' AND '30/04/2012'
AND INC IN ('31','32','43','01','33','34','35','37','38','39','52','54','23')
--TD NOT IN ('80','81','82','89','08','88')
AND (TD NOT IN ('80','81','82','89','08','88') AND EXISTS(SELECT TD FROM [rale].[dbo].[3301ACOP201112] as r2 WHERE r2.TD IN ('00','02','03','04','05','50','51','55','56','57','58','59','60','70')) )
GROUP BY REGPATR,NUMCRED,PERIODO,[IMPORTE],DIAS,EMA.EMIP_NOM_PATRON,INC,EMA.EMIP_NUM_TRAB_COT,EMA.EMIP_IMP_EYM_FIJA+EMA.EMIP_IMP_EYM_EXCE+EMA.EMIP_IMP_EYM_PRED+
           EMA.EMIP_IMP_EYM_PREE+ EMA.EMIP_IMP_INV_VIDA+EMA.EMIP_IMP_RIES_TRA+
           EMA.EMIP_IMP_GUAR+ EMA.EMIP_IMP_INV_VIDA_O+EMA.EMIP_IMP_EYM_EXCE_O+
           EMA.EMIP_IMP_EYM_PRED_O+ EMA.EMIP_IMP_EYM_PREE_O
ORDER BY 1 DESC
------------------------------------------------------
if exists(select * from sirecacobros.dbo.sysobjects where name = 'paeTemp') 
begin
drop table sirecacobros.dbo.paeTemp
end
SELECT
[REGPATR]
,MAX(RAZON_SOCIAL) as RAZON_SOCIAL
,SUM(casos) AS CASOS
,SUM([ADEUDO]) AS ADEUDO
,MAX(COTIZ) AS COTIZANTE
,MAX(EMISION) as EMISION
,MAX(DIAS) as DIAS
,CASE 
WHEN SUM(COTIZ) IS NULL THEN '4INVESTIGACION'
WHEN SUM([ADEUDO])&gt;=100000 THEN '1MAYOR'
WHEN SUM([ADEUDO])&gt;=50000 AND SUM([ADEUDO])&lt;100000 THEN '2MEDIANO'
WHEN SUM([ADEUDO])&lt;50000 AND SUM([ADEUDO]) &lt;&gt; 0 THEN '3MENOR'
END AS TIPO_ADEUDO

INTO sirecacobros.dbo.paeTemp
FROM sirecacobros.dbo.ecoTipos
WHERE GRUPO='PAE'
GROUP BY [REGPATR]
SELECT [REGPATR]
,(SELECT us.nombre FROM fiscamovil.dbo.usuarios  as us where convert(varchar,us.id)=
(SELECT ec.[EJECUTOR] FROM [sirecacobros].[dbo].[ecoTipocaptura] as ec where ec.[REGPATR]=pte.REGPATR)) as RESPONSABLE
      ,[RAZON_SOCIAL]
      ,[CASOS]
      ,[ADEUDO]
      ,[COTIZANTE]
      ,[EMISION]
      ,[DIAS]
      ,[TIPO_ADEUDO]
FROM sirecacobros.dbo.paeTemp as pte
where [REGPATR]='000-000-000'
order by tipo_adeudo
"></asp:SqlDataSource>
</asp:Content>

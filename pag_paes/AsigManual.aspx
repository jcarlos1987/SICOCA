<%@ Page Language="vb" MasterPageFile ="~/Site.Master" AutoEventWireup="false" CodeBehind="AsigManual.aspx.vb" Inherits="WebSIRECA.AsigManual" %>
<asp:Content ID="contend2" runat ="server" ContentPlaceHolderID ="head" >
<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    <center>
        <asp:HyperLink ID="HyperLink25" runat="server" 
            NavigateUrl="javascript:window.history.go(-1)">&lt;Atras</asp:HyperLink>&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Subdelegacion" Font-Bold="True"></asp:Label>&nbsp;
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Actualizar" />&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink26" runat="server" 
            NavigateUrl="javascript:window.history.go(1)">Adelante&gt;</asp:HyperLink>
        </center><hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceFaltantes" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="PRIORIDAD" HeaderText="PRIORIDAD" ReadOnly="True" 
                    SortExpression="PRIORIDAD" />
                <asp:BoundField DataField="sector" HeaderText="SECTOR" 
                    SortExpression="sector" />
                <asp:BoundField DataField="pagoTotalSector" HeaderText="$TotalSectorPrioridad" 
                    ReadOnly="True" SortExpression="pagoTotalSector" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG.PATRONAL" 
                    SortExpression="REG_PATRONAL" />
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="DEUDA" HeaderText="DEUDA" ReadOnly="True" 
                    SortExpression="DEUDA" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                    SortExpression="DOMICILIO" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1"  title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "AsignacionPae2.aspx?regpat=" & Eval("REG_PATRONAL") & "&grupo=PAE&CLASIFICACION=" & Eval("clasificacion") & "&razon=" & Eval("RAZON_SOCIAL") %>' 
                            Text="Asignar"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceFaltantes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
SET @SUBDEL=?
SELECT 
[REGPATR] as [REG_PATRONAL]  
,case   
when (select ordenAsignacion from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')) is null then '1'  
else (select ordenAsignacion from sireca.dbo.patrones where regpat=replace([REGPATR],'-','')) end  
as PRIORIDAD  
,SUM(ADEUDO) as DEUDA  
,sector 
,(select sum(adeudo) from [sirecacobros].[dbo].[ecoTipos] as et2  
where et2.sector=et.sector and et2.grupo='PAE' and et2.clasificacion='2' and et2.subdel=@SUBDEL 
and et2.[ID_RESPONSABLE]='x'  
and (select ordenAsignacion from sireca.dbo.patrones where regpat=replace(et2.[REGPATR],'-',''))= 
(select ordenAsignacion from sireca.dbo.patrones where regpat=replace(et.[REGPATR],'-',''))) as pagoTotalSector
,(select ptn.dom from sireca.dbo.patrones as ptn where ptn.regpat=replace([REGPATR],'-','')) as DOMICILIO
,replace((select ptn.razonSocial from sireca.dbo.patrones as ptn where ptn.regpat=replace([REGPATR],'-','')),'#','') as RAZON_SOCIAL
,clasificacion
FROM [sirecacobros].[dbo].[ecoTipos] as et 
where clasificacion='2' and subdel=@SUBDEL and [ID_RESPONSABLE]='x' 
and grupo='PAE' and sector in ('') 
group by [REGPATR],sector,clasificacion
order by 2,5 desc, 4 desc ,3 desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
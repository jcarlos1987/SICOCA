<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default12" %>

<asp:Content ID ="contenido1" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server" >
    <div>
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            CssClass="btn" Width="140px">
        </asp:DropDownList>
        <asp:DropDownList ID="DDLTipo" runat="server" CssClass="btn" Width="100px" 
            AutoPostBack="True">
            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
            <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        MOV.
</span> 
        <asp:DropDownList ID="DDLMov" runat="server" CssClass="btn" Width="150px" 
            AutoPostBack="True">
            <asp:ListItem Value="%">TODOS</asp:ListItem>
            <asp:ListItem Value="2">IGUAL A 2 (baja)</asp:ListItem>
            <asp:ListItem Value="3">DIFERENTE A 2</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
        PATRONES:
</span> 
                    <asp:DropDownList ID="DDLMayores" runat="server" CssClass="btn" 
            Width="190px" AutoPostBack="True">
                        <asp:ListItem>TODOS</asp:ListItem>
                        <asp:ListItem Value="SI">LOS 20 MAYORES</asp:ListItem>
                        <asp:ListItem Value="NO">SIN LOS 20 MAYORES</asp:ListItem>
                    </asp:DropDownList>
        <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#FFE8A6" 
            BorderStyle="Solid" BorderWidth="1px" CssClass="btn" BorderColor="#BCC7D8"><i class ="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/casosMontanio/detalleCambioInc.aspx?inc=COP" BackColor="#FFE8A6" CssClass="btn" BorderColor="#BCC7D8" BorderStyle="Solid" 
            BorderWidth="1px">Detalle cambios de INCIDENCIA</asp:HyperLink>
</div> 
            <table border="0" cellpadding="0" cellspacing="0"><tr><td>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="RALE C.O.P."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRCop" runat="server" Width="140px" 
        DataSourceID="SqlDataSourceRaleCop" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRaleCop" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 30 [name] as valor
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='COP' 
order by [fecha] desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="RALE R.C.V."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRRcv" runat="server" Width="140px" 
        DataSourceID="SqlDataSourceRaleRcv" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>

        <asp:LinkButton ID="LinkButton2" runat="server" BackColor="#FDD46C" 
                BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" 
                CssClass="btn">DEPURAR</asp:LinkButton>

        <asp:SqlDataSource ID="SqlDataSourceRaleRcv" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 30 [name] as valor
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='RCV' 
order by [fecha] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>

</div> 
        </td>
        <td> 
            <asp:SqlDataSource ID="SqlDataSourceDepuracion" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?

SET @RALECOP=?
SET @RALERCV=?
--SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
--SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)


-------------------PASO 1
exec('
if exists(select * from sirecacobros.dbo.sysobjects where name = ''ralecoprcv'+@SUBDEL+''') 
begin
drop table sirecacobros.dbo.ralecoprcv'+@SUBDEL+'
end
SELECT *,''COP'' as TIPO
INTO sirecacobros.dbo.ralecoprcv'+@SUBDEL+'
FROM [rale].[dbo].['+@RALECOP+']
INSERT INTO sirecacobros.dbo.ralecoprcv'+@SUBDEL+'
SELECT *,''RCV'' as TIPO FROM [rale].[dbo].['+@RALERCV+']
')
-----------------PASO 2
exec('
update [sirecacobros].[dbo].[casosMontanio]
set INC_RALE=rale.inc
FROM [sirecacobros].[dbo].[casosMontanio] as cm LEFT JOIN sirecacobros.dbo.ralecoprcv'+@SUBDEL+' as rale 
on ([reg_pat]+[mod])=replace(regpatr,''-'','''') and cm.[CREDITOS]=rale.NUMCRED
and cm.PERIODO=(convert(varchar,year(rale.PERIODO)) + case when len(month(rale.PERIODO))=1 then ''0''+convert(varchar,month(rale.PERIODO)) else convert(varchar,month(rale.PERIODO)) end)
where sub_cont='''+@SUBDEL+'''
')
---------------PASO 3
exec('
update [sirecacobros].[dbo].[casosMontanio]
set clasificacion=case 
when td in (''00'',''01'',''02'',''03'',''04'',''70'',''71'') then ''CUOTA''
when td in (''05'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'') then ''AUDITORIA''
when td in (''08'',''80'',''81'',''82'',''83'',''84'',''85'',''86'',''87'',''88'',''89'') then ''MULTA'' 
end
FROM [sirecacobros].[dbo].[casosMontanio]
')
    select 3 as resultado
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLRCop" DefaultValue="xxxxxxxxxxxxx" Name="?" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLRRcv" DefaultValue="xxxxxxxxxxxxx" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="LabelMsg" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                </td></tr></table>
                        <asp:HiddenField ID="HFCierre" runat="server" 
            Value="NOVIEMBRE" />
                        <asp:SqlDataSource ID="SqlDataSourceRaleUtilizado" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as DATETIME
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @RALECOP=(select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SELECT @RALECOP as RALE">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;GENERAL CIERRE DE ABRIL&lt;/strong&gt;" CellPadding="3" 
            Font-Size="10pt" CellSpacing="2" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDLEGACION" HeaderText="SUBDLEGACION" 
                    ReadOnly="True" SortExpression="SUBDLEGACION" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL_DIAS" HeaderText="TOTAL_DIAS" ReadOnly="True" 
                    SortExpression="TOTAL_DIAS" DataFormatString="{0:N0}" Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_PROMEDIO" HeaderText="DIAS_PROMEDIO" 
                    ReadOnly="True" SortExpression="DIAS_PROMEDIO" DataFormatString="{0:N}" 
                    Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="%CREDITOS">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server">100 %</asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="%IMPORTE">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server">100 %</asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------+
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
EXEC ('
SELECT case when '''+@SUBDEL+'''=''33'' then ''MÉRIDA SUR'' when '''+@SUBDEL+'''=''01'' then ''MÉRIDA NORTE'' else ''YUCATAN'' end SUBDLEGACION
,COUNT(DISTINCT(REG_PAT)) as PATRONES
,COUNT(CREDITOS) AS CREDITOS
,SUM(IMPORTE) AS IMPORTE
,SUM(DIAS_INC) AS TOTAL_DIAS
,SUM(DIAS_INC)/COUNT(CREDITOS) AS DIAS_PROMEDIO
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_cont like '''+@SUBDEL+'''
and [TIPO_COP_RCV] like '''+@TIPO+'''
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
GROUP BY DEL_CONT
order by SUBDLEGACION
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource7" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;AVANCE&lt;/strong&gt;" CellPadding="3" 
            Font-Size="10pt" CellSpacing="2" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDLEGACION" HeaderText="SUBDLEGACION" 
                    ReadOnly="True" SortExpression="SUBDLEGACION" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL_DIAS" HeaderText="TOTAL_DIAS" ReadOnly="True" 
                    SortExpression="TOTAL_DIAS" DataFormatString="{0:N0}" Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_PROMEDIO" HeaderText="DIAS_PROMEDIO" 
                    ReadOnly="True" SortExpression="DIAS_PROMEDIO" DataFormatString="{0:N}" 
                    Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" DataFormatString="{0:P}" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" DataFormatString="{0:P}" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
DECLARE @CREDITOS as FLOAT
DECLARE @IMPORTE as FLOAT
SET @CREDITOS=(SELECT 
COUNT(CREDITOS) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_CONT like '''+@SUBDEL+''' and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR+'
)
SET @IMPORTE=(SELECT 
SUM(IMPORTE) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_CONT like '''+@SUBDEL+''' and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR+'
)

SELECT case when '''+@SUBDEL+'''=''33'' then ''MÉRIDA SUR'' when '''+@SUBDEL+'''=''01'' then ''MÉRIDA NORTE'' else ''YUCATAN'' end SUBDLEGACION
,COUNT(DISTINCT(REG_PAT)) as PATRONES
,COUNT(CREDITOS) AS CREDITOS
,SUM(IMPORTE) AS IMPORTE
,SUM(DIAS_INC) AS TOTAL_DIAS
,SUM(DIAS_INC)/COUNT(CREDITOS) AS DIAS_PROMEDIO
,(COUNT(CREDITOS)/@CREDITOS) as POR_CRE
,(SUM(IMPORTE)/@IMPORTE) as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_CONT like '''+@SUBDEL+''' and (INC_RALE is null or INC&lt;&gt;INC_RALE)
and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
GROUP BY DEL_CONT
order by SUBDLEGACION
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource8" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;CIERRE AL RALE SIN CAMBIO&lt;/strong&gt;" CellPadding="3" 
            Font-Size="10pt" CellSpacing="2" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDLEGACION" HeaderText="SUBDLEGACION" 
                    ReadOnly="True" SortExpression="SUBDLEGACION" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TOTAL_DIAS" HeaderText="TOTAL_DIAS" ReadOnly="True" 
                    SortExpression="TOTAL_DIAS" DataFormatString="{0:N0}" Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_PROMEDIO" HeaderText="DIAS_PROMEDIO" 
                    ReadOnly="True" SortExpression="DIAS_PROMEDIO" DataFormatString="{0:N}" 
                    Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" DataFormatString="{0:P}" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" DataFormatString="{0:P}" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
DECLARE @CREDITOS as FLOAT
DECLARE @IMPORTE as FLOAT
SET @CREDITOS=(SELECT 
COUNT(CREDITOS) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_CONT like '''+@SUBDEL+''' and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR+'
)
SET @IMPORTE=(SELECT 
SUM(IMPORTE) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_CONT like '''+@SUBDEL+''' and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR+'
)

SELECT case when '''+@SUBDEL+'''=''33'' then ''MÉRIDA SUR'' when '''+@SUBDEL+'''=''01'' then ''MÉRIDA NORTE'' else ''YUCATAN'' end SUBDLEGACION
,COUNT(DISTINCT(REG_PAT)) as PATRONES
,COUNT(CREDITOS) AS CREDITOS
,SUM(IMPORTE) AS IMPORTE
,SUM(DIAS_INC) AS TOTAL_DIAS
,SUM(DIAS_INC)/COUNT(CREDITOS) AS DIAS_PROMEDIO
,(COUNT(CREDITOS)/@CREDITOS) as POR_CRE
,(SUM(IMPORTE)/@IMPORTE) as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio]
where sub_CONT like '''+@SUBDEL+''' and INC=INC_RALE
and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR+'
GROUP BY DEL_CONT
order by SUBDLEGACION
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;GENERAL AL CIERRE POR INCIDENCIA&lt;/strong&gt;" CellPadding="3" DataSourceID="SqlDataSource9" 
            Font-Size="10pt" AllowSorting="True" HorizontalAlign="Center" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detalles.aspx?subdel=" & Eval("subdel") & "&inc=" & Eval("inc") & "&tipo=todos&patrones=" & Eval("PATRONES") & "&importe=" & Eval("IMPORTE") & "&tipocoprcv=" & Eval("tipo") & "&tipomov=" & Eval("mov") & "&mayores=" & Eval("mayores") %>' 
                            Target="_blank" Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
SELECT (select ''(''+rl.inc+'')''+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc) as INCIDENCIA,count(DISTINCT(REG_PAT)) as [PATRONES],count(CREDITOS) as [CREDITOS],sum(IMPORTE) as IMPORTE
,cm.inc as inc
,'''+@SUBDEL+''' as subdel
,'''+@TIPO+''' as tipo
,'''+@MOV+''' as mov
,'''+@LOS20MAYORES+''' as mayores
,''100 %'' as POR_CRE
,''100 %'' as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio] as cm
where sub_cont like '''+@SUBDEL+'''
and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR+'
group by inc
order by INCIDENCIA
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;DEPURADOS&lt;/strong&gt;" CellPadding="3" DataSourceID="SqlDataSource5" 
            Font-Size="10pt" AllowSorting="True" HorizontalAlign="Center" 
            ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detalles.aspx?subdel=" & Eval("subdel") & "&inc=" & Eval("inc") & "&tipo=depurados&patrones=" & Eval("PATRONES") & "&importe=" & Eval("IMPORTE") & "&tipocoprcv=" & Eval("tipo") & "&tipomov=" & Eval("mov") & "&mayores=" & Eval("mayores")%>' 
                            Target="_blank" Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" DataFormatString="{0:P}" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" DataFormatString="{0:P}" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
SELECT (select ''(''+rl.inc+'')''+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc) as INCIDENCIA,count(DISTINCT(REG_PAT)) as [PATRONES],count(CREDITOS) as [CREDITOS],sum(IMPORTE) as IMPORTE
,cm.inc as inc
,'''+@SUBDEL+''' as subdel
,'''+@TIPO+''' as tipo
,'''+@MOV+''' as mov
,'''+@LOS20MAYORES+''' as mayores
,(COUNT(CREDITOS)/convert(float,(SELECT 
COUNT(CREDITOS) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_CRE
,(SUM(IMPORTE)/convert(float,(SELECT 
SUM(IMPORTE) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio] as cm
where inc_rale is null
and sub_cont like '''+@SUBDEL+'''
and [TIPO_COP_RCV] like '''+@TIPO+''' and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
group by inc
order by INCIDENCIA
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView2" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;CAMBIO DE INCIDENCIA&lt;/strong&gt;" 
            CellPadding="3" DataSourceID="SqlDataSource2" 
            Font-Size="10pt" AllowSorting="True" AutoGenerateColumns="False" 
            HorizontalAlign="Center" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                    SortExpression="INCIDENCIA" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detalles.aspx?subdel=" & Eval("subdel") & "&inc=" & Eval("inc") & "&tipo=concambio&patrones=" & Eval("PATRONES") & "&importe=" & Eval("IMPORTE") & "&tipocoprcv=" & Eval("tipo") & "&tipomov=" & Eval("mov") & "&mayores=" & Eval("mayores")%>' 
                            Target="_blank" Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" DataFormatString="{0:P}" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" DataFormatString="{0:P}" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
SELECT (select ''(''+rl.inc+'')''+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc) as INCIDENCIA
,count(DISTINCT(REG_PAT)) as [PATRONES]
,count(CREDITOS) as [CREDITOS]
,sum(IMPORTE) as IMPORTE
,cm.inc as inc
,'''+@SUBDEL+''' as subdel
,'''+@TIPO+''' as tipo
,'''+@MOV+''' as mov
,'''+@LOS20MAYORES+''' as mayores
,(COUNT(CREDITOS)/convert(float,(SELECT 
COUNT(CREDITOS) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_CRE
,(SUM(IMPORTE)/convert(float,(SELECT 
SUM(IMPORTE) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio] as cm
where inc &lt;&gt; inc_rale
and sub_cont like '''+@SUBDEL+'''
and [TIPO_COP_RCV] like '''+@TIPO+'''
and INC_RALE not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
group by inc
order by INCIDENCIA
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView11" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;CAMBIO DE INCIDENCIA CON IMPEDIMENTO DE COBRO&lt;/strong&gt;" 
            CellPadding="3" DataSourceID="SqlDataSource11" 
            Font-Size="10pt" AllowSorting="True" AutoGenerateColumns="False" 
            HorizontalAlign="Center" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                    SortExpression="INCIDENCIA" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detalles.aspx?subdel=" & Eval("subdel") & "&inc=" & Eval("inc") & "&tipo=concambioimpedimento&patrones=" & Eval("PATRONES") & "&importe=" & Eval("IMPORTE") & "&tipocoprcv=" & Eval("tipo") & "&tipomov=" & Eval("mov") & "&mayores=" & Eval("mayores")%>' 
                            Target="_blank" Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" DataFormatString="{0:P}" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" DataFormatString="{0:P}" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
SELECT (select ''(''+rl.inc+'')''+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc) as INCIDENCIA
,count(DISTINCT(REG_PAT)) as [PATRONES]
,count(CREDITOS) as [CREDITOS]
,sum(IMPORTE) as IMPORTE
,cm.inc as inc
,'''+@SUBDEL+''' as subdel
,'''+@TIPO+''' as tipo
,'''+@MOV+''' as mov
,'''+@LOS20MAYORES+''' as mayores
,(COUNT(CREDITOS)/convert(float,(SELECT 
COUNT(CREDITOS) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_CRE
,(SUM(IMPORTE)/convert(float,(SELECT 
SUM(IMPORTE) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio] as cm
where inc &lt;&gt; inc_rale
and sub_cont like '''+@SUBDEL+'''
and [TIPO_COP_RCV] like '''+@TIPO+'''
and INC_RALE in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
group by inc
order by INCIDENCIA
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="&lt;strong&gt;SIN CAMBIOS DE INCIDENCIA&lt;/strong&gt;" CellPadding="3" 
            DataSourceID="SqlDataSource4" Font-Size="10pt" AllowSorting="True" 
            HorizontalAlign="Center" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "detalles.aspx?subdel=" & Eval("subdel") & "&inc=" & Eval("inc") & "&tipo=sincambio&patrones=" & Eval("PATRONES") & "&importe=" & Eval("IMPORTE") & "&tipocoprcv=" & Eval("tipo") & "&tipomov=" & Eval("mov") & "&mayores=" & Eval("mayores")%>' 
                            Target="_blank" Text='<%# Eval("CREDITOS", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <HeaderStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="POR_CRE" DataFormatString="{0:P}" 
                    HeaderText="%CREDITOS" SortExpression="POR_CRE" />
                <asp:BoundField DataField="POR_IMP" DataFormatString="{0:P}" 
                    HeaderText="%IMPORTE" SortExpression="POR_IMP" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
DECLARE @MOV as VARCHAR(2)
SET @SUBDEL=?
SET @TIPO=?
SET @MOV=?
SET @LOS20MAYORES=?
-------------------------------------------------------------
if @MOV='3'
begin
	SET @TIPO_MOV='MOV_PAT not in (''2'') '
end
else
begin
	SET @TIPO_MOV='MOV_PAT like '''+@MOV+''' '
end
-------------------------------------------------------------
SET @PAT_OMITIR=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(cm2.REG_PAT+cm2.MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-----------
SET @PAT_OMITIR2=''
if @LOS20MAYORES='SI'
begin
	SET @PAT_OMITIR2 = ' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
end
else
begin
	if @LOS20MAYORES='NO'
	begin
		SET @PAT_OMITIR2 = ' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=(REG_PAT+MOD) and om_subdel like '''+@SUBDEL+''') '
	end
end
-------------------------------------------------------------
exec('
SELECT (select ''(''+rl.inc+'')''+rl.descripcion from sireca.dbo.inc_rale as rl where rl.inc=cm.inc) as INCIDENCIA,count(DISTINCT(REG_PAT)) as [PATRONES],count(CREDITOS) as [CREDITOS],sum(IMPORTE) as IMPORTE
,cm.inc as inc
,'''+@SUBDEL+''' as subdel
,'''+@TIPO+''' as tipo
,'''+@MOV+''' as mov
,'''+@LOS20MAYORES+''' as mayores
,(COUNT(CREDITOS)/convert(float,(SELECT 
COUNT(CREDITOS) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_CRE
,(SUM(IMPORTE)/convert(float,(SELECT 
SUM(IMPORTE) AS CREDITOS
FROM [sirecacobros].[dbo].[casosMontanio] as cm2
where cm2.sub_CONT like '''+@SUBDEL+''' and cm2.[TIPO_COP_RCV] like '''+@TIPO+''' and cm2.inc=cm.inc and cm2.'+@TIPO_MOV+' '+@PAT_OMITIR+'
))) as POR_IMP
FROM [sirecacobros].[dbo].[casosMontanio] as cm
where inc = inc_rale
and sub_cont like '''+@SUBDEL+'''
and [TIPO_COP_RCV] like '''+@TIPO+'''
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
group by inc
order by INCIDENCIA
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTipo" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMov" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

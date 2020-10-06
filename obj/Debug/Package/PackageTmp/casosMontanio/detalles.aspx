<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="detalles.aspx.vb" Inherits="WebSIRECA.detalles" %>

<asp:Content ID ="contenido1" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server" >
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/imagenes/exportarexcel.png"
                        ToolTip="EXPORTAR A EXCEL" ImageAlign="Top" />
        </asp:Panel>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSourceCambioInc" Font-Size="10pt" 
            HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="TIPO_COP_RCV" HeaderText="TIPO" 
                    SortExpression="TIPO_COP_RCV" />
                <asp:BoundField DataField="DEL" HeaderText="DEL" SortExpression="DEL" />
                <asp:BoundField DataField="SUB" HeaderText="SUB" SortExpression="SUB" />
                <asp:BoundField DataField="DEL_CONT" HeaderText="DEL_CONT" 
                    SortExpression="DEL_CONT" />
                <asp:BoundField DataField="SUB_CONT" HeaderText="SUB_CONT" 
                    SortExpression="SUB_CONT" />
                <asp:BoundField DataField="REG_PAT" HeaderText="REG_PAT" 
                    SortExpression="REG_PAT" />
                <asp:BoundField DataField="MOD" HeaderText="MOD" SortExpression="MOD" />
                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                    SortExpression="NOMBRE" />
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" 
                    SortExpression="CREDITOS" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="FEC_INC" HeaderText="FEC_INC" 
                    SortExpression="FEC_INC" Visible="False" />
                <asp:BoundField DataField="FEC_MOV" HeaderText="FEC_MOV" 
                    SortExpression="FEC_MOV" Visible="False" />
                <asp:BoundField DataField="DIAS_INC" HeaderText="DIAS_INC" 
                    SortExpression="DIAS_INC" Visible="False" />
                <asp:BoundField DataField="FA" HeaderText="FECHA DE ALTA" SortExpression="FA" />
                <asp:BoundField DataField="FC" HeaderText="FC" SortExpression="FC" 
                    Visible="False" />
                <asp:BoundField DataField="MOV_PAT" HeaderText="MOV_PAT" 
                    SortExpression="MOV_PAT" Visible="False" />
                <asp:BoundField DataField="FEC_MOV_PAT" HeaderText="FEC_MOV_PAT" 
                    SortExpression="FEC_MOV_PAT" Visible="False" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                    SortExpression="INC_RALE" >
                <ItemStyle Font-Bold="True" ForeColor="#993300" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSourceCambioInc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @INC as VARCHAR(15)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @MOV as VARCHAR(2)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
SET @SUBDEL=?
SET @TIPO=?
SET @INC=?
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
SELECT [DEL_CONT] as DEL
      ,[SUB_CONT] as SUB
      ,[TIPO_COP_RCV]
      ,[REG_PAT]
      ,[MOD]
      ,[NOMBRE]
      ,[CREDITOS]
      ,[PERIODO]
      ,[TD]
      ,[IMPORTE]
      ,[INC]
      ,[FEC_INC]
      ,[FEC_MOV]
      ,[DIAS_INC]
      ,[FA]
      ,[FC]
      ,[DEL_CONT]
      ,[SUB_CONT]
      ,[MOV_PAT]
      ,[FEC_MOV_PAT]
      ,[INC_RALE]
FROM [sirecacobros].[dbo].[casosMontanio]
where inc&lt;&gt;inc_rale
and [TIPO_COP_RCV] like '''+@TIPO+'''
and sub_cont like '''+@SUBDEL+''' and inc='''+@INC+'''
and INC_RALE not in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
order by nombre,periodo
')

">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipocoprcv" />
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipomov" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="mayores" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCambioIncImpedimento" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @INC as VARCHAR(15)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @MOV as VARCHAR(2)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
SET @SUBDEL=?
SET @TIPO=?
SET @INC=?
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
SELECT [DEL_CONT] as DEL
      ,[SUB_CONT] as SUB
      ,[TIPO_COP_RCV]
      ,[REG_PAT]
      ,[MOD]
      ,[NOMBRE]
      ,[CREDITOS]
      ,[PERIODO]
      ,[TD]
      ,[IMPORTE]
      ,[INC]
      ,[FEC_INC]
      ,[FEC_MOV]
      ,[DIAS_INC]
      ,[FA]
      ,[FC]
      ,[DEL_CONT]
      ,[SUB_CONT]
      ,[MOV_PAT]
      ,[FEC_MOV_PAT]
      ,[INC_RALE]
FROM [sirecacobros].[dbo].[casosMontanio]
where inc&lt;&gt;inc_rale
and [TIPO_COP_RCV] like '''+@TIPO+'''
and sub_cont like '''+@SUBDEL+''' and inc='''+@INC+'''
and INC_RALE in (''09'',''05'',''51'',''52'',''53'',''06'',''12'',''14'',''15'',''16'',''19'',''25'',''23'',''21'')
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
order by nombre,periodo
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipocoprcv" />
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipomov" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="mayores" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSinCambioInc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @INC as VARCHAR(15)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @MOV as VARCHAR(2)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
SET @SUBDEL=?
SET @TIPO=?
SET @INC=?
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
SELECT [DEL_CONT] as DEL
      ,[SUB_CONT] as SUB
      ,[TIPO_COP_RCV]
      ,[REG_PAT]
      ,[MOD]
      ,[NOMBRE]
      ,[CREDITOS]
      ,[PERIODO]
      ,[TD]
      ,[IMPORTE]
      ,[INC]
      ,[FEC_INC]
      ,[FEC_MOV]
      ,[DIAS_INC]
      ,[FA]
      ,[FC]
      ,[DEL_CONT]
      ,[SUB_CONT]
      ,[MOV_PAT]
      ,[FEC_MOV_PAT]
      ,[INC_RALE]
FROM [sirecacobros].[dbo].[casosMontanio]
where inc=inc_rale
and [TIPO_COP_RCV] like '''+@TIPO+'''
and sub_cont like '''+@SUBDEL+''' and inc='''+@INC+'''
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
order by nombre,periodo
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipocoprcv" />
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipomov" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="mayores" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDepurados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @INC as VARCHAR(15)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @MOV as VARCHAR(2)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
SET @SUBDEL=?
SET @TIPO=?
SET @INC=?
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
SELECT [DEL_CONT] as DEL
      ,[SUB_CONT] as SUB
      ,[TIPO_COP_RCV]
      ,[REG_PAT]
      ,[MOD]
      ,[NOMBRE]
      ,[CREDITOS]
      ,[PERIODO]
      ,[TD]
      ,[IMPORTE]
      ,[INC]
      ,[FEC_INC]
      ,[FEC_MOV]
      ,[DIAS_INC]
      ,[FA]
      ,[FC]
      ,[DEL_CONT]
      ,[SUB_CONT]
      ,[MOV_PAT]
      ,[FEC_MOV_PAT]
      ,[INC_RALE]
FROM [sirecacobros].[dbo].[casosMontanio]
where inc_rale is null
and [TIPO_COP_RCV] like '''+@TIPO+'''
and sub_cont like '''+@SUBDEL+''' and inc='''+@INC+'''
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
order by nombre,periodo
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipocoprcv" />
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipomov" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="mayores" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceTodos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(5)
DECLARE @INC as VARCHAR(15)
DECLARE @TIPO_MOV as VARCHAR(50)
DECLARE @MOV as VARCHAR(2)
DECLARE @LOS20MAYORES AS VARCHAR(2)
DECLARE @PAT_OMITIR as VARCHAR(150)
DECLARE @PAT_OMITIR2 as VARCHAR(150)
SET @SUBDEL=?
SET @TIPO=?
SET @INC=?
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
SELECT [DEL_CONT] as DEL
      ,[SUB_CONT] as SUB
      ,[TIPO_COP_RCV]
      ,[REG_PAT]
      ,[MOD]
      ,[NOMBRE]
      ,[CREDITOS]
      ,[PERIODO]
      ,[TD]
      ,[IMPORTE]
      ,[INC]
      ,[FEC_INC]
      ,[FEC_MOV]
      ,[DIAS_INC]
      ,[FA]
      ,[FC]
      ,[DEL_CONT]
      ,[SUB_CONT]
      ,[MOV_PAT]
      ,[FEC_MOV_PAT]
      ,[INC_RALE]
FROM [sirecacobros].[dbo].[casosMontanio]
where [TIPO_COP_RCV] like '''+@TIPO+'''
and sub_cont like '''+@SUBDEL+''' and inc='''+@INC+'''
and '+@TIPO_MOV+' '+@PAT_OMITIR2+'
order by nombre,periodo
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipocoprcv" />
                <asp:QueryStringParameter DefaultValue="999999" Name="?" 
                    QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipomov" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="mayores" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

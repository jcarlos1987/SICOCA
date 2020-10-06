<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default36" %>

<asp:Content ID ="contendt1" runat ="server" ContentPlaceHolderID ="head" >
    <link href="../css/body.css" rel="stylesheet" type="text/css" />
    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="content2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <center>

<div class="btn-group input-prepend">
        <asp:DropDownList ID="DropDownSubdel" runat="server" AutoPostBack="True" 
            Width="130px" CssClass="dropdown-toggle">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownTipo" runat="server" AutoPostBack="True" 
            Width="140px" CssClass="dropdown-toggle">
            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
            <asp:ListItem Value="%">C.O.P. y R.C.V.</asp:ListItem>
        </asp:DropDownList>
<span class="add-on">
                    FILTRO:
</span>
                    <asp:DropDownList ID="DDLMayores" runat="server" 
            CssClass="dropdown-toggle">
                        <asp:ListItem>TODOS</asp:ListItem>
                        <asp:ListItem Value="SI">LOS 20 MAYORES</asp:ListItem>
                        <asp:ListItem Value="NO">SIN LOS 20 MAYORES</asp:ListItem>
                    </asp:DropDownList>
        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
            BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" 
            CssClass="btn" BorderColor="#BCC7D8" 
            ToolTip="ACTUALIZA LA TABLA DE ABAJO CON LOS FILTROS SELECCIONADOS">ACTUALIZAR</asp:LinkButton>
       <asp:ImageButton ID="IBExportar" runat="server" 
            ImageUrl="~/imagenes/exportarexcel.png" ImageAlign="Right" 
            ToolTip="DESCARGAR EN EXCEL" /> 
</div>
        </center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Caption="Resumen Incidencia" DataSourceID="SqlDataSourceInc" 
            ForeColor="#333333" HorizontalAlign="Center" 
            AllowSorting="True" BorderStyle="Solid" BorderWidth="1px" 
            ShowFooter="True" Font-Size="8pt">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="incidencia" HeaderText="Incidencia" ReadOnly="True" SortExpression="incidencia" />
                <asp:TemplateField HeaderText="Patrones" SortExpression="patrones">
                    <ItemTemplate>
                        <asp:LinkButton OnClick ='<%# "javascript:window.open(""detallesincporpatron.aspx?inc=" & Eval("incidencia") & "&pat=" & Eval("patrones") & "&cot=" & Eval("cotizantes") & "&cre=" & Eval("creditos") & "&imp=" & Eval("importe") & "&pro=" & Eval("promedio dias") & "&por=" & Eval("porcentaje total") & "&ind=" & Eval("indice") & "&subdel=" & Eval("subdel") & "&tipo=" & Eval("tipo") & "&incidencia=" & Eval("indice") & "&mayoresn=" & Eval("MAYORESN") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>' ID="LinkButton1" runat="server" title="Detalles" Text='<%# Eval("patrones", "{0:N0}") %>' >
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>                
                <asp:BoundField DataField="cotizantes" HeaderText="Cotizantes" ReadOnly="True" SortExpression="cotizantes" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Creditos" SortExpression="creditos">
                    <ItemTemplate>
                        <asp:LinkButton OnClick ='<%# "javascript:window.open(""Detallesincidenciarale.aspx?inc=" & Eval("incidencia") & "&pat=" & Eval("patrones") & "&cot=" & Eval("cotizantes") & "&cre=" & Eval("creditos") & "&imp=" & Eval("importe") & "&pro=" & Eval("promedio dias") & "&por=" & Eval("porcentaje total") & "&ind=" & Eval("indice") & "&subdel=" & Eval("subdel") & "&tipo=" & Eval("tipo") & "&incidencia=" & Eval("indice") & "&mayoresn=" & Eval("MAYORESN") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>' ID="LinkButton2" title="Detalles" runat="server" Text='<%# Eval("creditos", "{0:N0}") %>'>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="importe" HeaderText="Importe" ReadOnly="True" SortExpression="importe" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="promedio dias" HeaderText="Promedio Días" 
                    ReadOnly="True" SortExpression="promedio dias" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="porcentaje total" HeaderText="Porcentaje Total" 
                    ReadOnly="True" SortExpression="porcentaje total" 
                    DataFormatString="{0:P}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceInc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="DECLARE @CONSULTA as VARCHAR(4000)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALERCV01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @RALERCV33 as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO as VARCHAR(3)
DECLARE @ANIO as VARCHAR(4)
DECLARE @ANIO2 as VARCHAR(2)
DECLARE @MES as VARCHAR(2)
DECLARE @LOS20MAYORES as VARCHAR(10)
DECLARE @EXISTE_MDB as INT
DECLARE @FILE_MDB as VARCHAR(50)
SET @ANIO=convert(varchar(4),year(dateadd(month,-1,getdate())))
SET @MES=(case when len(month(dateadd(month,-1,getdate())))=1 then '0'+convert(varchar(2),month(dateadd(month,-1,getdate()))) else convert(varchar(2),month(dateadd(month,-1,getdate()))) end)
SET @ANIO2=substring(@ANIO,3,2)

/*SET @FILE_MDB = 'D:\CDDATA\'+@MES+@ANIO2+'\EMIS3301.mdb'
exec master.dbo.xp_fileexist @FILE_MDB,@EXISTE_MDB out
if @EXISTE_MDB='0'
begin
SET @ANIO=convert(varchar(4),year(dateadd(month,-2,getdate())))
SET @MES=(case when len(month(dateadd(month,-2,getdate())))=1 then '0'+convert(varchar(2),month(dateadd(month,-2,getdate()))) else convert(varchar(2),month(dateadd(month,-2,getdate()))) end)
SET @ANIO2=substring(@ANIO,3,2)
end*/
if not exists(select * from tempdb.dbo.sysobjects where name = ('sireca.dbo.EMMA3301'+@MES+@ANIO2))
begin
SET @ANIO=convert(varchar(4),year(dateadd(month,-2,getdate())))
SET @MES=(case when len(month(dateadd(month,-2,getdate())))=1 then '0'+convert(varchar(2),month(dateadd(month,-2,getdate()))) else convert(varchar(2),month(dateadd(month,-2,getdate()))) end)
SET @ANIO2=substring(@ANIO,3,2)
end 

SET @SUBDEL=?
SET @TIPO=? /*COP, RCV*/
SET @LOS20MAYORES=? /*SI, NO*/
SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc)
SET @RALERCV01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='RCV' order by fecha desc)
SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc)
SET @RALERCV33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='RCV' order by fecha desc)


SET @CONSULTA = '
DECLARE @IMPORTE_RALE as FLOAT 
SET @IMPORTE_RALE=( select sum(raleSumT.importe) from ('
if @SUBDEL='01' and @TIPO='COP' 
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP01+']'
end
if @SUBDEL='01' and @TIPO='RCV' 
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV01+']'
end
if @SUBDEL='01' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all '
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV01+']'
end
if @SUBDEL='33' and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP33+']'
end
if @SUBDEL='33'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='33' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP33+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='%'  and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP33+']'	
end
if @SUBDEL='%'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='%'  and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALECOP33+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select importe,periodo,inc FROM [rale].[dbo].['+@RALERCV33+']'
end
SET @CONSULTA = @CONSULTA+') as raleSumT where inc not in (''00'') )
SELECT 
		convert(int,rale.INC) as indice
      ,(''(''+rale.INC+'')  ''+(SELECT rl.[descripcion] FROM [sireca].[dbo].[inc_rale] as rl where rl.[inc]=rale.INC )) as incidencia
      ,count(distinct(REGPATR)) as patrones
      ,(case when sum(ema.emip_num_trab_cot) is null then 0 else sum(ema.emip_num_trab_cot) end) as cotizantes
      ,COUNT(NUMCRED) as creditos
      ,SUM (IMPORTE) as importe
      ,((SUM(DIAS)/COUNT(NUMCRED))) as [promedio dias]
      ,(SUM (IMPORTE)/@IMPORTE_RALE) as [porcentaje total]
      ,'''+@SUBDEL+''' as SUBDEL
      ,'''+@TIPO+''' as TIPO
      ,'''+@LOS20MAYORES+''' as MAYORESN
  FROM ('
  if @SUBDEL='01' and @TIPO='COP' 
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP01+']'
end
if @SUBDEL='01' and @TIPO='RCV' 
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV01+']'
end
if @SUBDEL='01' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all '
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV01+']'
end
if @SUBDEL='33' and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP33+']'
end
if @SUBDEL='33'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='33' and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP33+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='%'  and @TIPO='COP'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP33+']'	
end
if @SUBDEL='%'  and @TIPO='RCV'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV33+']'
end
if @SUBDEL='%'  and @TIPO='%'
begin
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALECOP33+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV01+']'
	SET @CONSULTA = @CONSULTA+' union all'
	SET @CONSULTA = @CONSULTA+' select inc,numcred,importe,dias,regpatr,periodo FROM [rale].[dbo].['+@RALERCV33+']'
end
 SET @CONSULTA = @CONSULTA+' ) as rale 
 left join ('
 if @SUBDEL='01' 
begin
	SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from sireca.dbo.EMMA3301'+@MES+@ANIO2+' '
end
if @SUBDEL='33' 
begin
	SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from  sireca.dbo.EMMA3333'+@MES+@ANIO2+''
end
if @SUBDEL='%'
begin
SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from sireca.dbo.EMMA3301'+@MES+@ANIO2+' '
SET @CONSULTA = @CONSULTA+' union all '
SET @CONSULTA = @CONSULTA+' select emip_patron,emip_num_trab_cot from sireca.dbo.EMMA3333'+@MES+@ANIO2+' '
end
 SET @CONSULTA = @CONSULTA+' ) as ema
  on REPLACE(rale.REGPATR ,''-'','''') = substring(ema.emip_patron,2,10)
where inc not in (''00'') 
and not exists(
SELECT [regpatr]
  FROM [sirecacobros].[dbo].[patronesAlianza]
  where [idAlias]=''2'' and [regpatr]=replace(rale.regpatr,''-'','''')
) '
if @LOS20MAYORES='SI'
begin
SET @CONSULTA = @CONSULTA+' and exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=REPLACE(rale.regpatr,''-'','''') and om_subdel like '''+@SUBDEL+''') '
end
else
begin
if @LOS20MAYORES='NO'
begin
SET @CONSULTA = @CONSULTA+' and not exists(select top 1 om_regpat from sirecacobros.dbo.patronesomitirresumeninc where om_regpat=REPLACE(rale.regpatr,''-'','''') and om_subdel like '''+@SUBDEL+''') '
end
end
SET @CONSULTA = @CONSULTA+' group by inc
  order by 1 '
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownTipo" DefaultValue="COP" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMayores" DefaultValue="TODOS" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

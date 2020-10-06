<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo3.Master" CodeBehind="Ciclo3.aspx.vb" Inherits="WebSIRECA.Ciclo3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">    
    <link href="../css/body.css" rel="stylesheet" type="text/css" />
    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
    </asp:Content>
<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
                            <table style="width:100%;">
                                <tr>
                                    <td>
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True" Width="180px">
                            </asp:DropDownList>
                                            </td>
                                    <td>

                                            <asp:FormView ID="FormView3" runat="server" 
                                DataSourceID="SqlDataSourceRaleUtilizado">
                                <ItemTemplate >
                                    <asp:Label ID="Label8" runat="server" Text="R.A.L.E. C.O.P.:" Font-Bold="True"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("RALE","{0:d}") %>' Font-Bold="False">'></asp:Label>
                                </ItemTemplate>
                            </asp:FormView>
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
    
                                            </td>
                                </tr>
                            </table>
                                            <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
                                BackColor="#F7F6F3" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                Font-Names="Verdana" Font-Size="0.8em" Height="100%" Width="100%" 
                                FinishCompleteButtonText="">
                                                <FinishNavigationTemplate>
                                                    <asp:Button ID="FinishPreviousButton" Visible="false" runat="server" BackColor="#FFFBFF" 
                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                        CausesValidation="False" CommandName="MovePrevious" Font-Names="Verdana" 
                                                        Font-Size="0.8em" ForeColor="#284775" Text="Previous" />
                                                    <asp:Button ID="FinishButton" Visible="false" runat="server" BackColor="#FFFBFF" 
                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                        CommandName="MoveComplete" Font-Names="Verdana" Font-Size="0.8em" 
                                                        ForeColor="#284775" />
                                                </FinishNavigationTemplate>
                                                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                                                    Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                                                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                                                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                                    ForeColor="#284775" />
                                                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                                                <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
                                                    VerticalAlign="Top" Width="180px" />
                                                <StartNavigationTemplate>
                                                    <asp:Button ID="StartNextButton" Visible="false" runat="server" BackColor="#FFFBFF" 
                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                        CommandName="MoveNext" Font-Names="Verdana" Font-Size="0.8em" 
                                                        ForeColor="#284775" Text="Next" />
                                                </StartNavigationTemplate>
                                                <StepNavigationTemplate>
                                                    <asp:Button ID="StepPreviousButton" Visible="false" runat="server" BackColor="#FFFBFF" 
                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                        CausesValidation="False" CommandName="MovePrevious" Font-Names="Verdana" 
                                                        Font-Size="0.8em" ForeColor="#284775" Text="Previous" />
                                                    <asp:Button ID="StepNextButton" Visible="false" runat="server" BackColor="#FFFBFF" 
                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                        CommandName="MoveNext" Font-Names="Verdana" Font-Size="0.8em" 
                                                        ForeColor="#284775" Text="Next" />
                                                </StepNavigationTemplate>
                                                <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                                                <WizardSteps>
                                                    <asp:WizardStep ID="WizardStep11" runat="server" Title="GENERAL">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="FECHA DE LA BAJA DE "></asp:Label>
</span>
    <asp:TextBox ID="TBFechIni" runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
    <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechIni">
    </asp:CalendarExtender>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text=" AL "></asp:Label>
</span> 
    <asp:TextBox ID="TBFechFin" runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
    <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechFin"></asp:CalendarExtender>
    <asp:DropDownList ID="DDLMov" runat="server" AutoPostBack="True" Width="100px">
        <asp:ListItem Value="2">MOV 2</asp:ListItem>
        <asp:ListItem Value="%">TODOS</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DDLInc" runat="server" AutoPostBack="True" Width="100px">
        <asp:ListItem Value="09">INC 09</asp:ListItem>
        <asp:ListItem Value="%">TODOS</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" BackColor="#BCC7D8">ACTUALIZAR</asp:LinkButton>
</span> 
</div>
                                                                </td>
                                                                <td>
                                                                    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSourceFMOVINI">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label5" runat="server" 
                                                                                Text='<%# "PRIMERA BAJA: " & EVAL("FMOV") %>'>&#39;&gt;</asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:FormView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceFMOVINI" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
SET @RALECOP01=''
SET @RALECOP33=''
SET @SUBDEL=?

if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT [FMOV] FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'''
SET @RALECOP33 = ' union all SELECT [FMOV] FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'''
end
else 
begin
SET @RALECOP01 = ' SELECT [FMOV] FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] where [MOV] =''2'''
end

exec(' SELECT top 1 FMOV FROM ('
+@RALECOP01+@RALECOP33+
') as resultado 
group by FMOV 
order by convert(datetime,FMOV,103) '
)
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:HiddenField ID="HiddenFieldSalario" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceFMOVFIN">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label4" runat="server" 
                                                                                Text='<%# "ULTIMA BAJA: " & EVAL("FMOV") %>'>&#39;&gt;</asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:FormView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceFMOVFIN" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
SET @RALECOP01=''
SET @RALECOP33=''
SET @SUBDEL=?

if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT [FMOV] FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'''
SET @RALECOP33 = ' union all SELECT [FMOV] FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'''
end
else 
begin
SET @RALECOP01 = ' SELECT [FMOV] FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] where [MOV] =''2'''
end

exec(' SELECT top 1 FMOV FROM ('
+@RALECOP01+@RALECOP33+
') as resultado 
group by FMOV 
order by convert(datetime,FMOV,103) desc '
)
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridViewGeneral" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" Caption="INVENTARIO" 
                                                                        DataSourceID="SqlDataSourceGeneral" ShowFooter="True" CellPadding="3" 
                                                                        CellSpacing="1">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                                                                                SortExpression="RANGO">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="LBInventario" runat="server" Text='<%# Eval("PATRONES", "{0:N0}") %>' OnClick ='<%# "javascript:window.open(""../pag_registros/detallesseleccionporrango.aspx"+ Eval("urlv") +""",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
                                                                        <HeaderStyle BackColor="#E5C365" CssClass="btn-warning" ForeColor="White" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGeneral" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @MOV AS VARCHAR(2)
DECLARE @INC AS VARCHAR(2)
SET @SUBDEL=?
SET @SALARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @MOV=?
SET @INC=?

SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] '
SET @RALECOP33 = ' union all SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] '
end
else 
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] '
end

SET @CONSULTA = ' 
select 
''?subdel='+@SUBDEL+'&amp;rango=''+RANGO+''&amp;fechaini='+@FECH_INI+'&amp;visualizar=all&amp;fechafin='+@FECH_FIN+'&amp;mov='+@MOV+'&amp;inc='+@INC+''' as urlv
,RANGO,count(distinct(REGPATR)) as PATRONES,sum(CREDITOS) as CREDITOS,sum(COTIZANTES) as COTIZANTES,sum(IMPORTE) as IMPORTE
from
( '
SET @CONSULTA = @CONSULTA + '
select 
(case 
when sum(IMPORTE)&gt;=(25*'+@SALARIO+'*365) then ''V''
when sum(IMPORTE)&gt;(4*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(25*'+@SALARIO+'*365) then ''IV''
when sum(IMPORTE)&gt;(2*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(4*'+@SALARIO+'*365) then ''III''
when sum(IMPORTE)&gt;('+@SALARIO+'*365) and sum(IMPORTE)&lt;=(2*'+@SALARIO+'*365) then ''II''
when sum(IMPORTE)&lt;=('+@SALARIO+'*365) then ''I''
end) as RANGO
,REGPATR
,count(NUMCRED) as CREDITOS
,max(cotiz) as COTIZANTES
,sum(IMPORTE) as IMPORTE
from ('+@RALECOP01+@RALECOP33+') as rale left join sireca.dbo.patrones as ptn on replace(rale.REGPATR,''-'','''')=ptn.regpat
where mov like '''+@MOV+''' and convert(datetime,FMOV,103) between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
and inc like '''+@INC+'''
group by REGPATR '
SET @CONSULTA = @CONSULTA + ' ) as resultado
group by RANGO
order by RANGO
'
exec(@CONSULTA)
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="HiddenFieldSalario" DefaultValue="0" Name="?" 
                                                                                PropertyName="Value" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLMov" DefaultValue="2" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInc" DefaultValue="%" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridViewGeneral1" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" Caption="ASIGNADO" 
                                                                        DataSourceID="SqlDataSourceGeneralAsig" ShowFooter="True" CellPadding="3" 
                                                                        CellSpacing="1">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                                                                                SortExpression="RANGO">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="LBAsignado" runat="server" Text='<%# Eval("PATRONES", "{0:N0}") %>' OnClick ='<%# "javascript:window.open(""../pag_registros/detallesseleccionporrango.aspx"+ Eval("urlv") +""",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
                                                                        <HeaderStyle BackColor="#E5C365" CssClass="btn-warning" ForeColor="White" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGeneralAsig" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @MOV AS VARCHAR(2)
DECLARE @INC AS VARCHAR(2)
SET @SUBDEL=?
SET @SALARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @MOV=?
SET @INC=?

SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] '
SET @RALECOP33 = ' union all SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] '
end
else 
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] '
end

SET @CONSULTA = ' 
select 
''?subdel='+@SUBDEL+'&amp;rango=''+RANGO+''&amp;fechaini='+@FECH_INI+'&amp;visualizar=asig&amp;fechafin='+@FECH_FIN+'&amp;mov='+@MOV+'&amp;inc='+@INC+''' as urlv
,RANGO,count(distinct(REGPATR)) as PATRONES,sum(CREDITOS) as CREDITOS,sum(COTIZANTES) as COTIZANTES,sum(IMPORTE) as IMPORTE
from
( '
SET @CONSULTA = @CONSULTA + '
select 
(case 
when sum(IMPORTE)&gt;=(25*'+@SALARIO+'*365) then ''V''
when sum(IMPORTE)&gt;(4*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(25*'+@SALARIO+'*365) then ''IV''
when sum(IMPORTE)&gt;(2*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(4*'+@SALARIO+'*365) then ''III''
when sum(IMPORTE)&gt;('+@SALARIO+'*365) and sum(IMPORTE)&lt;=(2*'+@SALARIO+'*365) then ''II''
when sum(IMPORTE)&lt;=('+@SALARIO+'*365) then ''I''
end) as RANGO
,REGPATR
,count(NUMCRED) as CREDITOS
,max(cotiz) as COTIZANTES
,sum(IMPORTE) as IMPORTE
from ('+@RALECOP01+@RALECOP33+') as rale left join sireca.dbo.patrones as ptn on replace(rale.REGPATR,''-'','''')=ptn.regpat
left join (
select [G_RegPat] as R_REGPAT FROM [sirecaregistros].[dbo].[NL_General]
WHERE [G_Subdel] like '''+@SUBDEL+'''
) as resultado on replace(rale.regpatr,''-'','''')=resultado.[R_REGPAT]
where mov like '''+@MOV+''' and convert(datetime,FMOV,103) between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
and inc like '''+@INC+'''
and resultado.[R_REGPAT] is not null
group by REGPATR '
SET @CONSULTA = @CONSULTA + ' ) as resultado
group by RANGO
order by RANGO
'
exec(@CONSULTA)
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="HiddenFieldSalario" DefaultValue="0" Name="?" 
                                                                                PropertyName="Value" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLMov" DefaultValue="2" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInc" DefaultValue="%" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridViewGeneral2" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" Caption="PENDIENTES POR ASIGNAR" 
                                                                        DataSourceID="SqlDataSourceGeneralNoAsig" ShowFooter="True" 
                                                                        CellPadding="3" CellSpacing="1">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                                                                                SortExpression="RANGO">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="LBPenAsig" runat="server" Text='<%# Eval("PATRONES", "{0:N0}") %>' OnClick ='<%# "javascript:window.open(""../pag_registros/detallesseleccionporrango.aspx"+ Eval("urlv") +""",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
                                                                        <HeaderStyle BackColor="#E5C365" CssClass="btn-warning" ForeColor="White" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGeneralNoAsig" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @MOV AS VARCHAR(2)
DECLARE @INC AS VARCHAR(2)
SET @SUBDEL=?
SET @SALARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @MOV=?
SET @INC=?

SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] '
SET @RALECOP33 = ' union all SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] '
end
else 
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] '
end

SET @CONSULTA = ' 
select 
''?subdel='+@SUBDEL+'&amp;rango=''+RANGO+''&amp;visualizar=nasig&amp;fechaini='+@FECH_INI+'&amp;fechafin='+@FECH_FIN+'&amp;mov='+@MOV+'&amp;inc='+@INC+''' as urlv
,RANGO,count(distinct(REGPATR)) as PATRONES,sum(CREDITOS) as CREDITOS,sum(COTIZANTES) as COTIZANTES,sum(IMPORTE) as IMPORTE
from
( '
SET @CONSULTA = @CONSULTA + '
select 
(case 
when sum(IMPORTE)&gt;=(25*'+@SALARIO+'*365) then ''V''
when sum(IMPORTE)&gt;(4*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(25*'+@SALARIO+'*365) then ''IV''
when sum(IMPORTE)&gt;(2*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(4*'+@SALARIO+'*365) then ''III''
when sum(IMPORTE)&gt;('+@SALARIO+'*365) and sum(IMPORTE)&lt;=(2*'+@SALARIO+'*365) then ''II''
when sum(IMPORTE)&lt;=('+@SALARIO+'*365) then ''I''
end) as RANGO
,REGPATR
,count(NUMCRED) as CREDITOS
,max(cotiz) as COTIZANTES
,sum(IMPORTE) as IMPORTE
from ('+@RALECOP01+@RALECOP33+') as rale left join sireca.dbo.patrones as ptn on replace(rale.REGPATR,''-'','''')=ptn.regpat
left join (
select [G_RegPat] as R_REGPAT FROM [sirecaregistros].[dbo].[NL_General]
WHERE [G_Subdel] like '''+@SUBDEL+'''
) as resultado on replace(rale.regpatr,''-'','''')=resultado.[R_REGPAT]
where mov like '''+@MOV+''' and convert(datetime,FMOV,103) between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
and inc like '''+@INC+'''
and resultado.[R_REGPAT] is null
group by REGPATR '
SET @CONSULTA = @CONSULTA + ' ) as resultado
group by RANGO
order by RANGO
'
exec(@CONSULTA)
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="HiddenFieldSalario" DefaultValue="0" Name="?" 
                                                                                PropertyName="Value" />
                                                                            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="DDLMov" DefaultValue="2" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="DDLInc" DefaultValue="%" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep22" runat="server" Title="DILIGENCIA">
    <table style="width:100%;">
        <tr>
            <td colspan="3">
<div class="btn-group input-prepend">
<span class="add-on">
                ASIGNADOS DE
</span>
                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8" CssClass="btn"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox1">
                </asp:CalendarExtender>
<span class="add-on">
                &nbsp;A LA
</span>
                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8" CssClass="btn"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox2">
                </asp:CalendarExtender>
<span class="add-on">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn"><i class="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
</span>
</div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewDiliRangos" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceDiliRangos" 
                    ShowHeader="False" BorderStyle="None" BorderWidth="0px" 
                    Caption="DILIGENCIAS POR RANGO" CellPadding="0">
                    <Columns>
                        <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                            SortExpression="RANGO" DataFormatString="RANGO {0}" >
                        <ItemStyle Font-Bold="True" Font-Size="12pt" HorizontalAlign="Center" 
                            ForeColor="#302A23" />
                        </asp:BoundField>
                        <asp:TemplateField SortExpression="RANGO">                            
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenFieldRango" runat="server" Value='<%# Bind("RANGO") %>' />
                                <asp:GridView ID="GridViewSubDiliRangos" runat="server" AllowSorting="True" 
                                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceSubDiliRangos" 
                                    onprerender="GridViewSubDiliRangos_PreRender" ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# Eval("urlv", "../pag_registros/detallesseleccionporestatus.aspx{0}") %>' 
                                                    Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                            <ControlStyle ForeColor="#302A23" Font-Underline="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                                            HeaderText="IMPORTE_COP" NullDisplayText="0" ReadOnly="True" 
                                            SortExpression="IMPORTE_COP">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ESTATUS" HeaderText="ESTATUS" ReadOnly="True" 
                                            SortExpression="ESTATUS" />
                                    </Columns>
                                    <FooterStyle Font-Bold="True" Font-Size="11pt" ForeColor="#302A23" />
                                    <HeaderStyle BackColor="#C7C7CB" ForeColor="#302A23" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceSubDiliRangos" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    
                                    
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @RANGO AS VARCHAR(5)
SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @RANGO=?

SELECT
('?estatus='+ESTATUS+'&amp;avance=all&amp;rango='+RANGO+'&amp;fechaini='+@FECH_INI+'&amp;fechafin='+@FECH_FIN+'&amp;subdel='+@SUBDEL) as urlv
,RANGO
,ESTATUS
,COUNT(*) AS PATRONES
,SUM(IMPORTE_COP) AS IMPORTE_COP
from (
SELECT 
      [G_Estatus] as ESTATUS
      ,[G_Rango] as RANGO
      ,[G_ImporteCOP] as IMPORTE_COP
      ,[G_ImporteRCV] as IMPORTE_RCV
  FROM [sirecaregistros].[dbo].[NL_General]
where G_Subdel like @SUBDEL
and G_FechaAsignacion between @FECH_INI and @FECH_FIN
and G_Rango=@RANGO
) as resultado
group by RANGO,ESTATUS
ORDER BY RANGO,ESTATUS
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="01/01/2000" Name="?" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TextBox2" DefaultValue="01/01/2000" Name="?" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="HiddenFieldRango" DefaultValue="IIIIIII" 
                                            Name="?" PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDiliRangos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN=?

SELECT
('?estatus=all&amp;avance=all&amp;rango='+RANGO+'&amp;fechaini='+@FECH_INI+'&amp;fechafin='+@FECH_FIN+'&amp;subdel='+@SUBDEL) as urlv
,RANGO
,COUNT(*) AS CASOS
,SUM(COTIZANTES) AS COTIZANTES
,SUM(CREDITOS_COP) AS CREDITOS_COP
,SUM(IMPORTE_COP) AS IMPORTE_COP
from (
SELECT 
G_Subdel as [SUBDEL]
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=G_ID_Integrador) as INTEGRADOR
,G_Rango as [RANGO]
,G_Estatus as ESTATUS
,G_RegPat as REGPAT
,G_RazonSocial as RAZON_SOCIAL
,NULL as DOMICILIO
,NULL as RFC
,0 as COTIZANTES
,G_ImporteCOP AS IMPORTE_COP
,0 as CREDITOS_COP
,G_FechaBaja AS [FECHA_BAJA]
,NULL as AVANCE
FROM [sirecaregistros].[dbo].[NL_General]
where G_Subdel like @SUBDEL
and G_FechaAsignacion between @FECH_INI and @FECH_FIN
) as resultado
group by RANGO
ORDER BY RANGO
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="01/01/2000" Name="?" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" DefaultValue="01/01/2000" Name="?" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td></td>
            <td></td>
             </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            </table> 
                                                    </asp:WizardStep>
                                                    <asp:WizardStep runat="server" Title="PRODUCTIVIDAD">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td colspan="3">
<div class="btn-group input-prepend">
<span class="add-on">
                                                                    ASIGNADOS DE:
</span>
                                                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="btn" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox5">
                                                                    </asp:CalendarExtender>
<span class="add-on">
                                                                    &nbsp;A LA
</span>
                                                                    <asp:TextBox ID="TextBox6" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="btn" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox6">
                                                                    </asp:CalendarExtender>
<span class="add-on">
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn"><i class="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
</span>
</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                                                                        Caption="DILIGENCIAS POR INTEGRADOR" CellPadding="2" CellSpacing="1" 
                                                                        DataSourceID="SqlDataSource1" EmptyDataText="SIN ASIGNACIÓN" 
                                                                        HorizontalAlign="Left" ShowFooter="True">
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" ReadOnly="True" 
                                                                                SortExpression="INTEGRADOR" />
                                                                            <asp:TemplateField HeaderText="ASIGNADO" SortExpression="TOTAL">
                                                                                <ItemTemplate>
                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                                                        NavigateUrl='<%# Eval("urlv", "../pag_registros/detallesseleccionporestatusintegrador.aspx{0}%") %>' 
                                                                                        Target="_blank" Text='<%# Eval("TOTAL", "{0:N0}") %>'></asp:HyperLink>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PENDIENTE" SortExpression="PENDIENTE">
                                                                                <ItemTemplate>
                                                                                    <asp:HyperLink ID="HyperLink2" runat="server" 
                                                                                        NavigateUrl='<%# Eval("urlv", "../pag_registros/detallesseleccionporestatusintegrador.aspx{0}PENDIENTE") %>' 
                                                                                        Target="_blank" Text='<%# Eval("PENDIENTE", "{0:N0}") %>'></asp:HyperLink>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="CANCELADO" SortExpression="CANCELADO">
                                                                                <ItemTemplate>
                                                                                    <asp:HyperLink ID="HyperLink3" runat="server" 
                                                                                        NavigateUrl='<%# Eval("urlv", "../pag_registros/detallesseleccionporestatusintegrador.aspx{0}CANCELADO") %>' 
                                                                                        Target="_blank" Text='<%# Eval("CANCELADO", "{0:N0}") %>'></asp:HyperLink>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="PRODUCTIVIDAD" DataFormatString="{0:P}" 
                                                                                HeaderText="PRODUCTIVIDAD" ReadOnly="True" SortExpression="PRODUCTIVIDAD">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>                                                                                    
                                                                                    <asp:HiddenField ID="HiddenFieldIdIntegra" runat="server" Value='<%# Eval("INTEGRADORV") %>' />
                                                                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                                                                        DataSourceID="SqlDataSource1" Font-Size="8pt" onprerender="GridView3_PreRender" 
                                                                                        ShowFooter="True" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                                                                                                SortExpression="RANGO">
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                            </asp:BoundField>
                                                                                            <asp:BoundField DataField="ESTATUS" HeaderText="ESTATUS" ReadOnly="True" 
                                                                                                SortExpression="ESTATUS" />
                                                                                            <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                                                                                                HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:BoundField>
                                                                                            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                                                                                                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:BoundField>
                                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:BoundField>
                                                                                            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                                                                                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:BoundField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @INTEGRADOR AS VARCHAR(50)
DECLARE @CONSULTA AS VARCHAR(2000)
SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @INTEGRADOR=?


SET @CONSULTA='
SELECT
RANGO
,ESTATUS
,count(distinct(regpat)) as PATRONES
,sum(cotiz_ema) as COTIZANTES
,sum(creditos_cop) as CREDITOS
,sum(importe_cop) as IMPORTE
from (
SELECT 
G_Subdel as SUBDEL
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[G_ID_Integrador]) as INTEGRADOR
,G_Rango as [RANGO]
,[G_Estatus] as ESTATUS
,[G_RegPat] as REGPAT
,[G_RazonSocial] as RAZON_SOCIAL
,[dom] as DOMICILIO
,[rfc] as RFC
,[cotiz] as COTIZANTES
,vigencia as ULTIMA_EMI_ORDER
,substring(convert(varchar,vigencia,103),4,7) as ULTIMA_EMI
,cotiz as [COTIZ_EMA]
,G_ImporteCOP as IMPORTE_COP
,0 as CREDITOS_COP
,G_FechaBaja as [FECHA_BAJA]
,0 as AVANCE
FROM [sirecaregistros].[dbo].[NL_General]
left join sireca.dbo.patrones as ptn
on ptn.regpat=[G_RegPat]
where G_Subdel like '''+@SUBDEL+'''
and [G_FechaAsignacion] between '''+@FECH_INI+''' and '''+@FECH_FIN+''' and [G_ID_Integrador]='''+@INTEGRADOR+''' 
and [G_Estatus] in (''CANCELADO'',''PENDIENTE'') '
SET @CONSULTA = @CONSULTA + ' ) as resultado
GROUP BY RANGO,ESTATUS
ORDER BY RANGO,ESTATUS
 '
exec(@CONSULTA)
">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                                                                                PropertyName="SelectedValue" />
                                                                                            <asp:ControlParameter ControlID="TextBox5" DefaultValue="01/01/2000" Name="?" 
                                                                                                PropertyName="Text" />
                                                                                            <asp:ControlParameter ControlID="TextBox6" DefaultValue="01/01/2000" Name="?" 
                                                                                                PropertyName="Text" />
                                                                                            <asp:ControlParameter ControlID="HiddenFieldIdIntegra" DefaultValue="9999" 
                                                                                                Name="?" PropertyName="Value" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <EditRowStyle BackColor="#999999" />
                                                                        <FooterStyle Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#293955" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        
                                                                        
                                                                        
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL = ?
SET @FECH_INI =?
SET @FECH_FIN = ?
select 
('?integrador='+[INTEGRADOR]+'&amp;subdel='+@SUBDEL+'&amp;fechaini='+@FECH_INI+'&amp;fechafin='+@FECH_FIN+'&amp;estatus=') as urlv
,[INTEGRADOR] AS [INTEGRADORV]
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[INTEGRADOR]) as [INTEGRADOR]
,[PENDIENTE]
,[CANCELADO]
,[RESTABLECIMIENTO]
,([PENDIENTE]+[CANCELADO]) as TOTAL
,([CANCELADO]/convert(float,([PENDIENTE]+[CANCELADO])))  as PRODUCTIVIDAD
FROM
(SELECT 
'1' as CONTROLM
,G_ID_Integrador AS [INTEGRADOR]
,G_Estatus as RESULTADO
FROM [sirecaregistros].[dbo].[NL_General]
where G_Subdel like @SUBDEL
and G_FechaAsignacion between @FECH_INI and @FECH_FIN
) AS p
PIVOT
(
COUNT(p.CONTROLM)
FOR RESULTADO IN ([PENDIENTE],[CANCELADO],[RESTABLECIMIENTO])
) as pvt
order by [INTEGRADOR]
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="TextBox5" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TextBox6" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep1" runat="server" Title="INCIDENCIAS">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td colspan="3">
<div class="btn-group input-prepend">
<span class="add-on">
                                                                    <asp:Label ID="Label6" runat="server" Text="FECHA DE LA BAJA DE "></asp:Label>
</span>
                                                                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Width="80px" CssClass="btn btn-small"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox3" CssClass="btn btn-small">
                                                                    </asp:CalendarExtender>
<span class="add-on">
                                                                    <asp:Label ID="Label7" runat="server" Text=" AL "></asp:Label>
</span>
                                                                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="10" Width="80px" CssClass="btn btn-small"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                                                                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="TextBox4">
                                                                    </asp:CalendarExtender>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn" 
        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
</div><br /><br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridViewGeneral0" runat="server" AllowSorting="True" 
                                                                        AutoGenerateColumns="False" Caption="MOVIMIENTO=2, POR INCIDENCIA" 
                                                                        DataSourceID="SqlDataSourceGeneral0" ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="INC_NOM" HeaderText="INC" SortExpression="INC">
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                                                                                <ItemTemplate>
                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                                                        NavigateUrl='<%# Eval("urlv", "../pag_registros/detallesseleccionporinc.aspx{0}") %>' 
                                                                                        Target="_blank" Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                                                                                </ItemTemplate>
                                                                                <ControlStyle Font-Underline="False" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                                HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
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
                                                                        <HeaderStyle BackColor="#E5C365" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSourceGeneral0" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL=?
SET @SALARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
SET @RALECOP33 = ' union all SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
end
else 
begin
SET @RALECOP01 = ' SELECT * FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
end

SET @CONSULTA = ' 
select
''?subdel='+@SUBDEL+'&amp;fechaini='+@FECH_INI+'&amp;fechafin='+@FECH_FIN+'&amp;incidencia=''+INC+'''' as urlv
,INC
,(SELECT ''(''+incr.[inc]+'')''+incr.[descripcion] FROM [sireca].[dbo].[inc_rale] as incr where incr.inc=resultado.INC) as INC_NOM
,count(regpat) as PATRONES
,sum(CREDITOS) as CREDITOS
,sum(COTIZANTES) as COTIZANTES
,sum(IMPORTE) as IMPORTE
from
( '
SET @CONSULTA = @CONSULTA + '
select 
(case 
when sum(IMPORTE)&gt;=(25*'+@SALARIO+'*365) then ''V''
when sum(IMPORTE)&gt;(4*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(25*'+@SALARIO+'*365) then ''IV''
when sum(IMPORTE)&gt;(2*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(4*'+@SALARIO+'*365) then ''III''
when sum(IMPORTE)&gt;('+@SALARIO+'*365) and sum(IMPORTE)&lt;=(2*'+@SALARIO+'*365) then ''II''
when sum(IMPORTE)&lt;=('+@SALARIO+'*365) then ''I''
end) as RANGO
,INC
,regpatr as regpat
,count(NUMCRED) as CREDITOS
,max(cotiz) as COTIZANTES
,sum(IMPORTE) as IMPORTE
from ('+@RALECOP01+@RALECOP33+') as rale left join sireca.dbo.patrones as ptn on replace(rale.REGPATR,''-'','''')=ptn.regpat
where mov=''2'' and cast(FMOV as datetime) between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
group by INC,rale.regpatr '
SET @CONSULTA = @CONSULTA + ' ) as resultado
group by INC
order by inc
'
exec(@CONSULTA)
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="HiddenFieldSalario" DefaultValue="0" Name="?" 
                                                                                PropertyName="Value" />
                                                                            <asp:ControlParameter ControlID="TextBox3" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                            <asp:ControlParameter ControlID="TextBox4" DefaultValue="01/01/2000" Name="?" 
                                                                                PropertyName="Text" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </asp:WizardStep>
                                                </WizardSteps>
                                            </asp:Wizard>
    
    </div>
</asp:Content>



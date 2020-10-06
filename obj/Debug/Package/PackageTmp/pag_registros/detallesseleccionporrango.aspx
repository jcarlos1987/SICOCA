<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo3.Master" CodeBehind="detallesseleccionporrango.aspx.vb" Inherits="WebSIRECA.detallesseleccionporrango" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
        <ProgressTemplate>
            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" 
                BackColor="#E5A024">
                <asp:Label ID="Label1" runat="server" Text="CARGANDO..." Font-Bold="True"></asp:Label>
            </asp:Panel>
        </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            HorizontalAlign="Center" AllowPaging="True" PageSize="20" CellPadding="0" 
                Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                    SortExpression="RANGO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REGPAT" HeaderText="REGPAT" SortExpression="REGPAT" >
                <ControlStyle Font-Underline="False" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}&nbsp;&nbsp;" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}&nbsp;&nbsp;" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}&nbsp;&nbsp;" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PRIMERA_FECH_MOV" DataFormatString="{0:d}" 
                    HeaderText="PRIMERA FECHA MOV." SortExpression="PRIMERA_FECH_MOV">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>                    
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenFieldRegpat" runat="server" Value ='<%# Eval("REGPAT") %>' />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" Font-Size="8pt" AllowPaging="True" 
                            AllowSorting="True" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" 
                                    SortExpression="TIPO" >
                                </asp:BoundField>
                                <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                                    SortExpression="MOV" >
                                </asp:BoundField>
                                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                    SortExpression="INC" >
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                    SortExpression="CREDITOS" />
                                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                                    SortExpression="PERIODOS" />
                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="btn-info" ForeColor="White" />
                            <PagerSettings Position="TopAndBottom" PageButtonCount="20" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @REGPAT AS VARCHAR(15)
SET @SUBDEL=?
SET @REGPAT=?

SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

SET @CONSULTA = ' 
select TIPO,MOV,INC,CREDITOS
,substring(PERIODOS,4,7) as PERIODOS
,IMPORTE
from
( '
SET @CONSULTA = @CONSULTA + '
select 
''COP'' as TIPO
,replace(REGPATR,''-'','''') as REGPAT
,MOV
,INC
,(NUMCRED) as CREDITOS
,periodo as PERIODOS
,(IMPORTE) as IMPORTE
from [rale].[dbo].['+@RALECOP+'] as rale '
SET @CONSULTA = @CONSULTA + ' union all select 
''RCV'' as TIPO
,replace(REGPATR,''-'','''') as REGPAT
,MOV
,INC
,(NUMCRED) as CREDITOS
,periodo as PERIODOS
,(IMPORTE) as IMPORTE
from [rale].[dbo].['+@RALERCV+'] as rale '

SET @CONSULTA = @CONSULTA + ' ) as resultado
where regpat='''+@REGPAT+'''
'
exec(@CONSULTA)
">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="01" Name="?" 
                                    QueryStringField="subdel" />
                                <asp:ControlParameter ControlID="HiddenFieldRegpat" DefaultValue="000000000" 
                                    Name="?" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" 
                    SortExpression="INTEGRADOR" />
                <asp:BoundField DataField="FECHA_ASIGNACION" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE PROGRAMACION" SortExpression="FECHA_ASIGNACION" />
                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" 
                    SortExpression="ESTADO" />
                <asp:BoundField DataField="AVANCE" DataFormatString="{0:P}" HeaderText="AVANCE" 
                    SortExpression="AVANCE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#E5C365" CssClass="btn-warning" Font-Size="9pt" 
                ForeColor="White" />
            <PagerSettings Position="TopAndBottom" PageButtonCount="50" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @RANGO AS VARCHAR(3)
DECLARE @ESTADO_ASIG AS VARCHAR(10) 
DECLARE @MOV AS VARCHAR(2)
DECLARE @INC AS VARCHAR(2)
-- @ESTADO_ASIG=[all = todos, asig = asignados, nasig = no asignados
SET @SUBDEL=?
SET @SALARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @RANGO=?
SET @ESTADO_ASIG=?
SET @MOV=?
SET @INC=?
--------------------------------------------------------------
SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT ''01'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] '
SET @RALECOP33 = ' union all SELECT ''33'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] '
end
else 
begin
SET @RALECOP01 = ' SELECT '''+@SUBDEL+''' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] '
end

SET @CONSULTA = ' 
select *
from
( '
SET @CONSULTA = @CONSULTA + '
select 
rale.SUBDEL as SUBDEL
,(case 
when sum(IMPORTE)&gt;=(25*'+@SALARIO+'*365) then ''V''
when sum(IMPORTE)&gt;(4*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(25*'+@SALARIO+'*365) then ''IV''
when sum(IMPORTE)&gt;(2*'+@SALARIO+'*365) and sum(IMPORTE)&lt;=(4*'+@SALARIO+'*365) then ''III''
when sum(IMPORTE)&gt;('+@SALARIO+'*365) and sum(IMPORTE)&lt;=(2*'+@SALARIO+'*365) then ''II''
when sum(IMPORTE)&lt;=('+@SALARIO+'*365) then ''I''
end) as RANGO
,replace(REGPATR,''-'','''') as REGPAT
,razonSocial as RAZON
,count(NUMCRED) as CREDITOS
,max(cotiz) as COTIZANTES
,sum(IMPORTE) as IMPORTE
,min(convert(datetime,FMOV,103)) as PRIMERA_FECH_MOV
,(
select nombre from fiscamovil.dbo.usuarios as uf where uf.id=[C_INTEGRADOR]
and (select us.subdel from sireca.dbo.usuarios as us where us.id=[C_INTEGRADOR])='''+@SUBDEL+'''
) as INTEGRADOR
,C_FEC_ASIGNAC_EXP as FECHA_ASIGNACION
,R_ESTADO_INTEGRACION as ESTADO
,R_AVANCE as AVANCE
from ('+@RALECOP01+@RALECOP33+') as rale left join sireca.dbo.patrones as ptn on replace(rale.REGPATR,''-'','''')=ptn.regpat
left join (
select [G_RegPat] as R_REGPAT 
,G_ID_Integrador as C_INTEGRADOR
,G_FechaAsignacion as C_FEC_ASIGNAC_EXP
,NULL as R_ESTADO_INTEGRACION
,NULL as R_AVANCE
FROM [sirecaregistros].[dbo].[NL_General]
WHERE [G_Subdel] like '''+@SUBDEL+'''
) as resultado on replace(rale.regpatr,''-'','''')=resultado.[R_REGPAT]
where mov like '''+@MOV+''' and inc like '''+@INC+''' and convert(datetime,FMOV,103) between '''+@FECH_INI+''' and '''+@FECH_FIN+''' '
IF @ESTADO_ASIG='asig'
begin
SET @CONSULTA = @CONSULTA + ' and resultado.[R_REGPAT] is not null '
end
else
begin
	IF @ESTADO_ASIG='nasig'
	begin
	SET @CONSULTA = @CONSULTA + ' and resultado.[R_REGPAT] is null '
	end
end
SET @CONSULTA = @CONSULTA + 'group by rale.SUBDEL,REGPATR,razonSocial,[C_INTEGRADOR],C_FEC_ASIGNAC_EXP,R_ESTADO_INTEGRACION,R_AVANCE '
SET @CONSULTA = @CONSULTA + ' ) as resultado
where rango='''+@RANGO+'''
order by RANGO,subdel,regpat
'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="%" Name="?" QueryStringField="subdel" />
                <asp:ControlParameter ControlID="HiddenFieldSalario" DefaultValue="0" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechaini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechafin" />
                <asp:QueryStringParameter DefaultValue="I" Name="?" QueryStringField="rango" />
                <asp:QueryStringParameter DefaultValue="I" Name="?" 
                    QueryStringField="visualizar" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="mov" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" QueryStringField="inc" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField runat="server" ID="HiddenFieldSalario"></asp:HiddenField>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

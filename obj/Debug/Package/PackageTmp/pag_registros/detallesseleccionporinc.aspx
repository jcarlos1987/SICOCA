<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="detallesseleccionporinc.aspx.vb" Inherits="WebSIRECA.detallesseleccionporinc" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >

    <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel2" DisplayAfter="50">
        <ProgressTemplate>
            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" 
                BackColor="#E5A024">
                <asp:Label ID="Label2" runat="server" Text="CARGANDO..."></asp:Label>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>  
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
            HorizontalAlign="Center" AllowPaging="True" PageSize="20">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                SortExpression="SUBDEL" />
            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                    SortExpression="INCIDENCIA" >
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
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}&nbsp;&nbsp;" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PRIMERA_FECH_MOV" DataFormatString="{0:d}" 
                HeaderText="PRIMERA_FECH_MOV" SortExpression="PRIMERA_FECH_MOV">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenFieldRegpat" runat="server" 
                            Value ='<%# Eval("REGPAT") %>' />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" Font-Size="9pt" AllowPaging="True" 
                            AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                SortExpression="SUBDEL" />
                            <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                            <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                                    SortExpression="MOV" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                    SortExpression="INC" >
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
                        <PagerSettings Position="TopAndBottom" PageButtonCount="20" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @RALERCV01 AS VARCHAR(100)
DECLARE @RALERCV33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @REGPAT AS VARCHAR(15)
SET @SUBDEL=?
SET @REGPAT=?
------------------------------------------------------
SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT ''01'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
SET @RALECOP33 = ' union all SELECT ''33'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
end
else 
begin
SET @RALECOP01 = ' SELECT '''+@SUBDEL+''' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
end
------------------------------------------------------
SET @RALERCV01=''
SET @RALERCV33=''
if @SUBDEL='%'
begin
SET @RALERCV01 = ' SELECT ''01'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='RCV' order by fecha desc)+'] where [MOV] =''2'' '
SET @RALERCV33 = ' union all SELECT ''33'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='RCV' order by fecha desc)+'] where [MOV] =''2'' '
end
else 
begin
SET @RALERCV01 = ' SELECT '''+@SUBDEL+''' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)+'] where [MOV] =''2'' '
end

SET @CONSULTA = ' 
select SUBDEL,TIPO,MOV,INC,CREDITOS
,substring(PERIODOS,4,7) as PERIODOS
,IMPORTE
from
( '
SET @CONSULTA = @CONSULTA + '
select 
SUBDEL as SUBDEL
,''COP'' as TIPO
,replace(REGPATR,''-'','''') as REGPAT
,MOV
,INC
,(NUMCRED) as CREDITOS
,periodo as PERIODOS
,(IMPORTE) as IMPORTE
from ('+@RALECOP01+@RALECOP33+') as rale '
SET @CONSULTA = @CONSULTA + ' union all select 
SUBDEL as SUBDEL
,''RCV'' as TIPO
,replace(REGPATR,''-'','''') as REGPAT
,MOV
,INC
,(NUMCRED) as CREDITOS
,periodo as PERIODOS
,(IMPORTE) as IMPORTE
from ('+@RALERCV01+@RALERCV33+') as rale '

SET @CONSULTA = @CONSULTA + ' ) as resultado
where regpat='''+@REGPAT+'''
'
exec(@CONSULTA)
">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="%" Name="?" />
                            <asp:ControlParameter ControlID="HiddenFieldRegpat" DefaultValue="000000000" 
                                    Name="?" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#E5C365" />
        <PagerSettings Position="TopAndBottom" PageButtonCount="50" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(4000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP01 AS VARCHAR(100)
DECLARE @RALECOP33 AS VARCHAR(100)
DECLARE @SALARIO as VARCHAR(10)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @INCIDENCIA AS VARCHAR(4)

SET @SALARIO=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @INCIDENCIA=?
SET @SUBDEL=?

SET @RALECOP01=''
SET @RALECOP33=''
if @SUBDEL='%'
begin
SET @RALECOP01 = ' SELECT ''01'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
SET @RALECOP33 = ' union all SELECT ''33'' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
end
else 
begin
SET @RALECOP01 = ' SELECT '''+@SUBDEL+''' as subdel,* FROM [rale].[dbo].['+(SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)+'] where [MOV] =''2'' '
end

SET @CONSULTA = ' 
select SUBDEL,INCIDENCIA,REGPAT,RAZON,count(creditos) as CREDITOS,sum(importe) as IMPORTE,min(convert(datetime,FMOV,103)) as PRIMERA_FECH_MOV
from
( '
SET @CONSULTA = @CONSULTA + '
select 
rale.subdel as SUBDEL
,INC as INCIDENCIA
,replace(REGPATR,''-'','''') as REGPAT
,razonSocial as RAZON
,(NUMCRED) as CREDITOS
,(cotiz) as COTIZANTES
,(IMPORTE) as IMPORTE
,FMOV
from ('+@RALECOP01+@RALECOP33+') as rale left join sireca.dbo.patrones as ptn on replace(rale.REGPATR,''-'','''')=ptn.regpat
where mov=''2'' and cast(FMOV as datetime) between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
'
SET @CONSULTA = @CONSULTA + ' ) as resultado
where INCIDENCIA='''+@INCIDENCIA+'''
group by subdel,incidencia,regpat,razon
order by subdel,incidencia,regpat
'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSalario" DefaultValue="1" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechaini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechafin" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="incidencia" />
                <asp:QueryStringParameter DefaultValue="01" Name="?" 
                    QueryStringField="subdel" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField runat="server" ID="HiddenFieldSalario"></asp:HiddenField>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

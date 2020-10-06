<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo3.Master" CodeBehind="detallesseleccionporestatus.aspx.vb" Inherits="WebSIRECA.detallesseleccionporestatus" %>

<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
            <ProgressTemplate>
                <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" 
                    BackColor="#E5A024">
                    <asp:Label ID="Label2" runat="server" Text="CARGANDO..." Font-Bold="True"></asp:Label>
                </asp:Panel>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" EmptyDataText="SIN RESULTADOS" 
            Font-Size="10pt" CellPadding="3" HorizontalAlign="Center" AllowSorting="True" 
                AllowPaging="True" PageSize="30">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" ReadOnly="True" 
                    SortExpression="INTEGRADOR" />
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                    SortExpression="RANGO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ESTATUS" HeaderText="ESTATUS" ReadOnly="True" 
                    SortExpression="ESTATUS" />
                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REGPAT" HeaderText="REGPAT" SortExpression="REGPAT" >
                <ControlStyle Font-Underline="False" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="ULTIMA_EMI" HeaderText="ULTIMA EMI." 
                    SortExpression="ULTIMA_EMI_ORDER" DataFormatString="{0:d}">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ_EMA" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" SortExpression="COTIZ_EMA">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE COP" ReadOnly="True" SortExpression="IMPORTE_COP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_BAJA" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE LA BAJA" ReadOnly="True" SortExpression="FECHA_BAJA">
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS EN R.A.L.E.">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenFieldRegpat" runat="server" 
                            Value='<%# Eval("REGPAT") %>' />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                            Font-Size="9pt" EmptyDataText="SIN CREDITOS" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                                <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                                    SortExpression="MOV">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                    SortExpression="INC">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                    SortExpression="CREDITOS" />
                                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                                    SortExpression="PERIODOS" />
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <PagerSettings Position="TopAndBottom" />
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
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("REGPAT") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E5C365" />
            <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CONSULTA AS VARCHAR(2000)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @ESTATUS AS VARCHAR(50)
DECLARE @AVANCE AS VARCHAR(50)
DECLARE @RANGO AS VARCHAR(5)
SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @ESTATUS=?
SET @AVANCE=?
SET @RANGO=?

SET @CONSULTA = '
SELECT
*
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
,ptn.vigencia as ULTIMA_EMI
,cotiz as COTIZ_EMA
FROM [sirecaregistros].[dbo].[NL_General] left join sireca.dbo.patrones as ptn on regpat=G_RegPat
where G_Subdel like '''+@SUBDEL+'''
and G_FechaAsignacion between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
) as resultado WHERE [SUBDEL] like '''+@SUBDEL+''''
IF @ESTATUS&lt;&gt;'all'
begin
SET @CONSULTA= @CONSULTA +' and ESTATUS='''+@ESTATUS+''' '
end
IF @AVANCE&lt;&gt;'all'
begin
SET @CONSULTA= @CONSULTA +' and AVANCE='''+@AVANCE+''' '
end
IF @RANGO&lt;&gt;'all'
begin
SET @CONSULTA= @CONSULTA +' and RANGO='''+@RANGO+''' '
end

SET @CONSULTA= @CONSULTA +' ORDER BY AVANCE,ESTATUS'
exec(@CONSULTA)
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechaini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechafin" />
                <asp:QueryStringParameter DefaultValue="0000000" Name="?" 
                    QueryStringField="estatus" />
                <asp:Parameter DefaultValue="ALL" Name="?" />
                <asp:QueryStringParameter DefaultValue="IIIIIII" Name="?" 
                    QueryStringField="rango" />
            </SelectParameters>
        </asp:SqlDataSource>
</ContentTemplate>
        </asp:UpdatePanel>    
    </div>
</asp:Content>

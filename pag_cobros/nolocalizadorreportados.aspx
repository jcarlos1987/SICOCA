<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="nolocalizadorreportados.aspx.vb" Inherits="WebSIRECA.nolocalizadorreportados" %>
<asp:Content ID="contenido1" runat="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    <center> 
    <div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Width="120px">
        </asp:DropDownList>
        <span class="add-on">
            <asp:Label ID="Label1" runat="server" Text="de"></asp:Label>
        </span>
        <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px" >
            <asp:ListItem Value="1">Enero</asp:ListItem>
            <asp:ListItem Value="2">Febrero</asp:ListItem>
            <asp:ListItem Value="3">Marzo</asp:ListItem>
            <asp:ListItem Value="4">Abril</asp:ListItem>
            <asp:ListItem Value="5">Mayo</asp:ListItem>
            <asp:ListItem Value="6">Junio</asp:ListItem>
            <asp:ListItem Value="7">Julio</asp:ListItem>
            <asp:ListItem Value="8">Agosto</asp:ListItem>
            <asp:ListItem Value="9">Septiembre</asp:ListItem>
            <asp:ListItem Value="10">Octubre</asp:ListItem>
            <asp:ListItem Value="11">Noviembre</asp:ListItem>
            <asp:ListItem Value="12">Diciembre</asp:ListItem>
        </asp:DropDownList>
        <span class="add-on">
            <asp:Label ID="Label2" runat="server" Text="del"></asp:Label>
        </span>
        <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="80px" >
        </asp:DropDownList>
        <span class="add-on">
        <asp:LinkButton ID="LBExportar" CssClass="btn" runat="server">Exportar</asp:LinkButton>
        </span>
    </div> 
    </center>
                    <asp:GridView ID="GridView2" runat="server" 
            AutoGenerateColumns="False" BorderColor="White" BorderStyle="None" 
            BorderWidth="0px" DataSourceID="SqlDataSource2" ForeColor="White" 
            ShowHeader="False">
                        <Columns>
                            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" />
                        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
exec('
SELECT count(distinct AC_RA_REGPATR) as PATRONES FROM (
SELECT [AC_SUBDEL]
,[AC_RA_REGPATR]
,[AC_RA_NUMCRED]
,[AC_RA_PERIODO]
,INC as RA_INC
,[AC_FECH_DILIGENCIA]
FROM [sirecacobros].[dbo].[CO_ACCIONES] LEFT JOIN (
SELECT ''COP'' as [TIPO],* FROM rale.dbo.['+@RALECOP+']
union all
SELECT ''RCV'' as [TIPO],* FROM rale.dbo.['+@RALERCV+']
) AS RALE
ON replace(REGPATR,''-'','''')=AC_RA_REGPATR AND NUMCRED=AC_RA_NUMCRED AND PERIODO=AC_RA_PERIODO
WHERE AC_DILIGENCIA=''22'' AND AC_SUBDEL='''+@SUBDEL+'''
and INC is not null
) AS SR1 
WHERE MONTH(AC_FECH_DILIGENCIA) LIKE '''+@MES+''' AND YEAR(AC_FECH_DILIGENCIA)='+@ANIO+'
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            HorizontalAlign="Center" 
            Caption="&lt;strong&gt;NO LOCALIZADOS POR CONFIRMAR&lt;/strong&gt;" 
            EmptyDataText="SIN RESULTADOS DE LOS FILTROS SELECCIONADOS">
                        <Columns>
                            <asp:BoundField DataField="AC_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                                SortExpression="AC_SUBDEL" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AC_RA_REGPATR" HeaderText="REG.PATR." 
                                ReadOnly="True" SortExpression="AC_RA_REGPATR" />
                            <asp:BoundField DataField="AC_RA_NUMCRED" HeaderText="CREDITO" 
                                ReadOnly="True" SortExpression="AC_RA_NUMCRED" />
                            <asp:BoundField DataField="AC_RA_PERIODO" HeaderText="PERIODO" 
                                ReadOnly="True" SortExpression="AC_RA_PERIODO" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RA_INC" HeaderText="INC.RALE" ReadOnly="True" 
                                SortExpression="RA_INC" >
                            <ItemStyle HorizontalAlign="Center" CssClass="btn-info" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RA_FINC" DataFormatString="{0:C}" 
                                HeaderText="FECH.INC.RALE" SortExpression="RA_FINC_O">
                            <ItemStyle CssClass="btn-info" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AC_CP_INSPEC" HeaderText="INSPEC." 
                                ReadOnly="True" SortExpression="AC_CP_INSPEC" />
                            <asp:BoundField DataField="AC_FECH_DILIGENCIA" HeaderText="FECH. DILIGENCIA" 
                                ReadOnly="True" SortExpression="AC_FECH_DILIGENCIA" 
                                DataFormatString="{0:d}" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="razonSocial" HeaderText="RAZON SOCIAL" 
                                ReadOnly="True" SortExpression="razonSocial" />
                            <asp:BoundField DataField="cotiz" HeaderText="COTIZ." ReadOnly="True" 
                                SortExpression="cotiz" DataFormatString="{0:N0}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @MES as VARCHAR(2)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
exec('
SELECT AC_SUBDEL,AC_RA_REGPATR,AC_RA_NUMCRED,substring(AC_RA_PERIODO,4,7) as AC_RA_PERIODO
,RA_INC
,RA_FINC
,convert(datetime,RA_FINC,103) as RA_FINC_O
,AC_CP_INSPEC,AC_FECH_DILIGENCIA
,razonSocial,cotiz FROM (
SELECT [AC_SUBDEL]
,[AC_RA_REGPATR]
,[AC_RA_NUMCRED]
,[AC_RA_PERIODO]
,INC as RA_INC
,FEINC as RA_FINC
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE ID=[AC_CP_INSPEC] ) AS [AC_CP_INSPEC]
,MAX([AC_FECH_DILIGENCIA]) AS [AC_FECH_DILIGENCIA]
FROM [sirecacobros].[dbo].[CO_ACCIONES] LEFT JOIN (
SELECT ''COP'' as [TIPO],* FROM rale.dbo.['+@RALECOP+']
union all
SELECT ''RCV'' as [TIPO],* FROM rale.dbo.['+@RALERCV+']
) AS RALE
ON replace(REGPATR,''-'','''')=AC_RA_REGPATR AND NUMCRED=AC_RA_NUMCRED AND PERIODO=AC_RA_PERIODO
WHERE AC_DILIGENCIA=''22'' AND AC_SUBDEL='''+@SUBDEL+'''
and INC is not null and INC NOT IN (''09'')
GROUP BY [AC_SUBDEL],[AC_RA_REGPATR],[AC_RA_NUMCRED],[AC_RA_PERIODO],INC,FEINC,[AC_CP_INSPEC]
) AS SR1 LEFT JOIN sireca.dbo.patrones on regpat=AC_RA_REGPATR
WHERE MONTH(AC_FECH_DILIGENCIA) LIKE '''+@MES+''' AND YEAR(AC_FECH_DILIGENCIA)='+@ANIO+'
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

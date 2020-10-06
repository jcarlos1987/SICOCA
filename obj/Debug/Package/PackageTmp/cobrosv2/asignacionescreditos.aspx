<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="asignacionescreditos.aspx.vb" Inherits="WebSIRECA.asignacionescreditos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px">
                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>
    <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" data-toggle="dropdown" AutoPostBack="True" Width="80px">
                            </asp:DropDownList>
<%  If Not Session.Item("SIRECAnombre") Is Nothing Then %>
   <% If Session.Item("SIRECAuser_type").ToString.Equals("0") Then%>
    <asp:DropDownList ID="DDLTipo" runat="server" Width="150px">
        <asp:ListItem Value="A">ASIGNACIONES</asp:ListItem>
        <asp:ListItem Value="D">DILIGENCIAS</asp:ListItem>
    </asp:DropDownList>
    <span class="add-on">
    <asp:LinkButton ID="LBDescargar" runat="server" CssClass="btn">Descargar</asp:LinkButton> 
    </span> 
   <% End If %>
<% End If %>
</div>   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" 
        Caption="FECHA DE ASIGNACION" AllowSorting="True" AllowPaging="True" 
        Font-Size="9pt" PageSize="6" EmptyDataText="SIN ASIGNACIONES">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:TemplateField HeaderText="POR CREDITOS" SortExpression="FECH_ASIG">
                <ItemTemplate>
                    <asp:LinkButton ID="LBFecha" runat="server" Text='<%# Eval("FECH_ASIG") %>'  OnClick='<%# "javascript:window.open(""rep_asignacion.aspx?subdel=" & Eval("SUBDEL") & "&fecha=" & Eval("FECH_ASIG") & "&inspector=" & Eval("ID_INS") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="POR PATRONES" SortExpression="FECH_ASIG">
                <ItemTemplate>
                    <asp:LinkButton ID="LBFecha2" runat="server" Text='<%# Eval("FECH_ASIG") %>'  OnClick='<%# "javascript:window.open(""rep_asigpatrones.aspx?subdel=" & Eval("SUBDEL") & "&fecha=" & Eval("FECH_ASIG") & "&inspector=" & Eval("ID_INS") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="btn-info" ForeColor="White" />
        <PagerSettings PageButtonCount="15" Position="Top" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USER_TYPE AS VARCHAR(50)
DECLARE @ID_USER AS VARCHAR(50)
DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
SET @SUBDEL=?
SET @USER_TYPE=?
SET @ID_USER=?
SET @MES=?
SET @ANIO=?

SET @USER_TYPE=(CASE WHEN @USER_TYPE='0' THEN '' ELSE 'AND ID_INS='''+@ID_USER+'''' END)

EXEC('
SELECT [R_SUBDEL] AS SUBDEL
,[ID_INS]
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios as uf WHERE uf.id=(case when [ID_INS]='''' then -1 else [ID_INS] end)) AS INSPECTOR
,convert(varchar(10),[FECH_INS],103) AS FECH_ASIG
FROM [sirecacobros].[dbo].[PAE_CRED]
WHERE R_SUBDEL='''+@SUBDEL+''' '+@USER_TYPE+'
and MONTH(FECH_INS)='+@MES+' AND YEAR(FECH_INS)='+@ANIO+'
GROUP BY [R_SUBDEL],[ID_INS],convert(varchar(10),[FECH_INS],103)
order by CONVERT(DATETIME,convert(varchar(10),[FECH_INS],103),103) DESC
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter Name="?" SessionField="SIRECAuser_type" />
            <asp:SessionParameter Name="?" SessionField="SIRECAid" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" HorizontalAlign="Center" 
        Caption="FECHA DE DILIGENCIA" AllowSorting="True" AllowPaging="True" 
        Font-Size="9pt" PageSize="6" EmptyDataText="SIN DILIGENCIAS">
        <Columns>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:TemplateField HeaderText="POR CREDITOS" SortExpression="FECH_ASIG">
                <ItemTemplate>
                    <asp:LinkButton ID="LBFecha3" runat="server" Text='<%# Eval("FECH_ASIG") %>'  
                        OnClick='<%# "javascript:window.open(""rep_asignacion2.aspx?subdel=" & Eval("SUBDEL") & "&fecha=" & Eval("FECH_ASIG") & "&inspector=" & Eval("ID_INS") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="btn-info" ForeColor="White" />
        <PagerSettings PageButtonCount="15" Position="Top" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USER_TYPE AS VARCHAR(50)
DECLARE @ID_USER AS VARCHAR(50)
DECLARE @SUBDEL AS VARCHAR(50)
DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
SET @SUBDEL=?
SET @USER_TYPE=?
SET @ID_USER=?
SET @MES=?
SET @ANIO=?

SET @USER_TYPE=(CASE WHEN @USER_TYPE='0' THEN '' ELSE 'AND ID_INS='''+@ID_USER+'''' END)

EXEC('

SELECT [R_SUBDEL] AS SUBDEL
,[ID_INS]
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios as uf WHERE uf.id=(case when [ID_INS]='''' then -1 else [ID_INS] end)) AS INSPECTOR
,convert(varchar(10),[FECH_INS],103) AS FECH_ASIG
FROM (
SELECT [PC_SUBDEL] AS R_SUBDEL
      ,[PC_INSPECTOR] AS ID_INS
      ,[PC_FECHA] AS FECH_INS
  FROM [sirecacobros].[dbo].[PAE_CITATORIO]
  UNION ALL
  SELECT [PD_SUBDEL] AS R_SUBDEL
      ,[PD_INSPECTOR] AS ID_INS
      ,[PD_FECHA] AS FECH_INS
  FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
) AS X
WHERE R_SUBDEL='''+@SUBDEL+''' '+@USER_TYPE+'
and MONTH(FECH_INS)='+@MES+' AND YEAR(FECH_INS)='+@ANIO+'
GROUP BY [R_SUBDEL],[ID_INS],convert(varchar(10),[FECH_INS],103)
ORDER BY CONVERT(DATETIME,convert(varchar(10),[FECH_INS],103),103) DESC
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:SessionParameter Name="?" SessionField="SIRECAuser_type" />
            <asp:SessionParameter Name="?" SessionField="SIRECAid" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</center>
    </asp:Content>

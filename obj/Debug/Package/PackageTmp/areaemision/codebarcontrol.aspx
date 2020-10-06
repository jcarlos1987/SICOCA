<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="codebarcontrol.aspx.vb" Inherits="WebSIRECA.codebarcontrol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center >
    <div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            ToolTip="SUBDELEGACION" Width="100px">
    </asp:DropDownList>
    <span class="add-on">
        <asp:Label ID="Label5" runat="server" Text=" VER LOS PRIMEROS: "></asp:Label>
    </span>
    <asp:DropDownList ID="DDLPrimeros" runat="server" Width="80px">
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
    </asp:DropDownList>
    <span class="add-on">
        <asp:Label ID="Label4" runat="server" Text="INSPECTOR:"></asp:Label>
    </span> 
    <asp:DropDownList ID="DDLInspector" runat="server" 
        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SELECT us.id as valor
,(select upper(uf.nombre) 
from fiscamovil.dbo.usuarios as uf 
where uf.id=us.id) as texto
from sireca.dbo.usuarios as us
where us.user_type='1' and us.subdel=@SUBDEL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <span class="add-on">
    <asp:LinkButton ID="LBActDatos" CssClass ="btn" runat="server" BackColor="#9CAAC1" >Actualizar</asp:LinkButton>
    <asp:LinkButton ID="LBExport" CssClass ="btn" runat="server" BackColor="#9CAAC1" >Exportar</asp:LinkButton>
    </span> 
    </div> 
    </center>
    <table align="center">
        <tr>
            <td><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" BackColor="White" 
        Font-Size="9pt" 
        Caption="&lt;strong&gt;DOCUMENTO(S) PENDIENTE(S) POR ENTRAR&lt;/strong&gt;" 
        AllowPaging="True" AllowSorting="True" PageSize="20">
        <Columns>
            <asp:BoundField DataField="DIAS_TRANCURRIDOS" HeaderText="DÍA(S)" 
                ReadOnly="True" SortExpression="DIAS_TRANCURRIDOS" 
                DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick ='<%# "javascript:window.open(""" & Eval("ARCHIVO") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>' ><i class ="icon-file"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REGPAT" SortExpression="R_REGPAT">
                <ItemTemplate>
                    <asp:Label ID="Label33" runat="server" Text='<%# Eval("R_REGPAT") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TD" SortExpression="TD">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("CODE_BAR") %>' ></asp:Label>
                    <br/>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TD") %>' Font-Size="8"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="FECHA_SALIDA" HeaderText="SALIDA" ReadOnly="True" 
                SortExpression="FECHA_SALIDA" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="OBSERVACION_OUT" HeaderText="OBSERVACION" 
                ReadOnly="True" SortExpression="OBSERVACION_OUT" />
            <asp:TemplateField>
                <ItemTemplate>
                <asp:HiddenField ID="HFCodeBar" runat="server" Value='<%# Eval("CODE_BAR") %>' />
                <div class="btn-group input-prepend">
                    <asp:DropDownList ID="DDLAccion" runat="server" Visible ='<%# IIF(Session.Item("SIRECAreg_tipo").ToString()="SUP1","true","false")%>' Width="130px" Font-Size="8">
                        <asp:ListItem Value="0">Resultado</asp:ListItem>
                        <asp:ListItem Value="02">Notificado</asp:ListItem>
                        <asp:ListItem Value="09">No Localizado</asp:ListItem>
                        <asp:ListItem Value="27">Autodeterminado</asp:ListItem>
                        <asp:ListItem Value="REASIGNACION">Para Reasignación</asp:ListItem>
                        <asp:ListItem Value="DEPURADO">Depurado</asp:ListItem>
                        <asp:ListItem Value="PAGADO">Pagado</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TBObser" runat="server" Visible ='<%# IIF(Session.Item("SIRECAreg_tipo").ToString()="SUP1","true","false")%>' placeholder="Observacion"></asp:TextBox>
                </div> 
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView></td>
        </tr>
        <tr>
            <td align="right">
                <asp:LinkButton ID="LBGuardar" runat="server" CssClass="btn" 
                    BackColor="#9CAAC1" BorderColor="Red" BorderStyle="Solid">Guardar</asp:LinkButton>
           </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @FILAS as VARCHAR(15)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FILAS=?
exec('
SELECT TOP '+@FILAS+' * FROM (
SELECT
(case when RR_FECHA_ACCION is null then sirecacobros.dbo.diasInabiles(R_FECHA_ACCION,getdate())
else 0
end) as DIAS_TRANCURRIDOS
,''http://11.200.24.211/WebSireca/descargas/emision/''+R_PATH as ARCHIVO
,R_CODE_BAR AS CODE_BAR
,RR_CODE_BAR
,R_INSPECTOR AS INSPECTOR
,R_ID_INSPECTOR AS ID_INSPECTOR
,R_TD AS TD,R_FECHA_ACCION AS FECHA_SALIDA
,R_OBSERVACION AS OBSERVACION_OUT,RR_FECHA_ACCION AS FECHA_ENTRADA,RR_OBSERVACION AS OBSERVACION_IN
,R_REGPAT
FROM
(SELECT 
R_CODE_BAR,R_PATH
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=R_ID_NOTIFICADOR) AS R_INSPECTOR
,R_ID_NOTIFICADOR AS R_ID_INSPECTOR
,R_TD,R_FECHA_ACCION,R_OBSERVACION
,R_REGPAT
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_ID_NOTIFICADOR
,(SELECT replace([CQ_DATO1],''REG. PATRONAL:$'','''')
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_REGPAT
,(SELECT [CQ_PATH]
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_PATH
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as R_TD
,[HA_ID_CODEBAR] AS R_CODE_BAR
,[HA_FECH_REGISTRO] as R_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as R_ACCION
,ISNULL(HA_OBSERVACION,'''') AS R_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''1''
) AS RESULT
) AS RI
LEFT JOIN
(
SELECT 
RR_CODE_BAR
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=RR_ID_NOTIFICADOR) AS RR_INSPECTOR
,RR_TD,RR_FECHA_ACCION,RR_OBSERVACION
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RR_ID_NOTIFICADOR
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RR_TD
,[HA_ID_CODEBAR] AS RR_CODE_BAR
,[HA_FECH_REGISTRO] as RR_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as RR_ACCION
,ISNULL(HA_OBSERVACION,'''') AS RR_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''2''
) AS RESULT2
) AS RS
on RS.RR_CODE_BAR=RI.R_CODE_BAR
) AS RESULTADO
WHERE RESULTADO.DIAS_TRANCURRIDOS &gt;= 0 and RESULTADO.ID_INSPECTOR like '''+@INSPECTOR+'''
and RR_CODE_BAR is null
')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="99999" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLPrimeros" DefaultValue="7" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

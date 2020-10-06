<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="codebarrecorrido.aspx.vb" Inherits="WebSIRECA.codebarrecorrido" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center >
    <div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            ToolTip="SUBDELEGACION" Width="100px">
    </asp:DropDownList>
    <span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="RECEPCION DEL: "></asp:Label>
    </span>
    <asp:TextBox ID="TBFIni" runat="server" Width="90px"></asp:TextBox>
    <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFIni">
    </asp:CalendarExtender>
    <span class="add-on">
        <asp:Label ID="Label14" runat="server" Text=" AL "></asp:Label>
    </span> 
    <asp:TextBox ID="TBFFin" runat="server" Width="90px"></asp:TextBox>
    <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFFin">
    </asp:CalendarExtender>
    <span class="add-on">
        <asp:Label ID="Label4" runat="server" Text=" DE(L) INSPECTOR:"></asp:Label>
    </span> 
    <asp:DropDownList ID="DDLInspector" runat="server" 
        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <span class="add-on">
        <asp:Label ID="Label18" runat="server" Text="PRIMEROS"></asp:Label>
    </span>
        <asp:DropDownList ID="DDLTop" runat="server" Width="60px">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
        </asp:DropDownList>
    <span class="add-on">

<asp:LinkButton CssClass ="btn" ID="LBActualizar" runat="server" BackColor="#9CAAC1">Actualizar</asp:LinkButton>
<asp:LinkButton ID="LBExport" CssClass ="btn" runat="server" BackColor="#9CAAC1" >Exportar</asp:LinkButton>
    </span> 
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
    </div> 
    </center>
    <asp:Repeater ID="RepeaterCodeBar" runat="server" 
        DataSourceID="SqlDataSourceCodeBar">
        <HeaderTemplate >
        <table border="1" align="center">
        <tr style="font-weight: bold">
            <td>
                Descripción</td>
            <td>
                Documento Entregado</td>
            <td>
                Documento Recibido</td>
            <td>
                &nbsp;</td>
            <td>
                Mesa de Captura</td>
            <td>
                &nbsp;</td>
            <td>
                Mesa de Registro</td>
            <td>
                &nbsp;</td>
        </tr>
        </HeaderTemplate>
        <ItemTemplate >
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text='<%# "<strong>Codigo de barra: </strong>" + Eval("CODE_BAR") %>'></asp:Label>
                <asp:Label ID="Label3" runat="server" Text='<%# "<br/>" + Eval("R_REGPAT") %>'></asp:Label>
                <asp:Label ID="Label4" runat="server" Text='<%# " - " + Eval("TD") %>'></asp:Label>
                <asp:Label ID="Label1" runat="server" Text='<%# "<br/> <strong>Inspector: </strong>" + Eval("INSPECTOR") %>'></asp:Label>
                </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text='<%# "<strong>Entrego: </strong>" + Eval("R_REGISTRO") %>'></asp:Label>
                <asp:Label ID="Label7" runat="server" Text='<%# "<br/> <strong>El: </strong>" + Eval("R_FECHA_ACCION") %>'></asp:Label>
                <asp:Label ID="Label8" runat="server" Text='<%# "<br/> <strong>Observación: </strong>" + Eval("R_OBSERVACION") %>'></asp:Label>
                </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text='<%# "<strong>Recibio: </strong>" + Eval("RR_REGISTRO") %>'></asp:Label>
                <asp:Label ID="Label9" runat="server" Text='<%# "<br/> <strong>El: </strong>" + Eval("RR_FECHA_ACCION") %>'></asp:Label>
                <asp:Label ID="Label10" runat="server" Text='<%# "<br/> <strong>Observación: </strong>" + Eval("RR_OBSERVACION") %>'></asp:Label>
                </td>
                <td><asp:Label ID="L8" runat="server" Text='<%# "<br/> <strong>" +  Ctype(Eval("RR_DIAS"),String) + "</strong>" %>'></asp:Label></td>
            <td>
                <asp:Label ID="Label11" runat="server" Text='<%# "<strong>Recibio: </strong>" + Eval("RRR_REGISTRO") %>'></asp:Label>
                <asp:Label ID="Label12" runat="server" Text='<%# "<br/> <strong>El: </strong>" + Eval("RRR_FECHA_ACCION") %>'></asp:Label>
                <asp:Label ID="Label13" runat="server" Text='<%# "<br/> <strong>Observación: </strong>" + Eval("RRR_OBSERVACION") %>'></asp:Label>
                </td>
                <td><asp:Label ID="L10" runat="server" Text='<%# "<br/> <strong>" +  Ctype(Eval("RRR_DIAS"),String) + "</strong>" %>'></asp:Label></td>
            <td>
                <asp:Label ID="Label15" runat="server" Text='<%# "<strong>Recibio: </strong>" + Eval("RRRR_REGISTRO") %>'></asp:Label>
                <asp:Label ID="Label16" runat="server" Text='<%# "<br/> <strong>El: </strong>" + Eval("RRRR_FECHA_ACCION") %>'></asp:Label>
                <asp:Label ID="Label17" runat="server" Text='<%# "<br/> <strong>Observación: </strong>" + Eval("RRRR_OBSERVACION") %>'></asp:Label>
                </td>
                <td><asp:Label ID="L17" runat="server" Text='<%# "<br/> <strong>" + Ctype(Eval("RRRR_DIAS"),String) + "</strong>" %>'></asp:Label></td>
        </tr>
        </ItemTemplate>
        <FooterTemplate >
          <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSourceCodeBar" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(15)
DECLARE @FECHA_RESEPCION1 as DATETIME
DECLARE @FECHA_RESEPCION2 as DATETIME
DECLARE @TOP_LISTA as VARCHAR(10)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @FECHA_RESEPCION1=?
SET @FECHA_RESEPCION2=?
SET @TOP_LISTA=?
EXEC('
SELECT TOP '+@TOP_LISTA+'
ARCHIVO
,CODE_BAR
,R_REGPAT,TD
,INSPECTOR
,R_REGISTRO,R_FECHA_ACCION,R_OBSERVACION
,RR_REGISTRO,RR_FECHA_ACCION,RR_OBSERVACION
,sirecacobros.dbo.diasInabiles(R_FECHA_ACCION,RR_FECHA_ACCION) AS RR_DIAS
,RRR_REGISTRO,RRR_FECHA_ACCION,RRR_OBSERVACION
,sirecacobros.dbo.diasInabiles(RR_FECHA_ACCION,RRR_FECHA_ACCION) AS RRR_DIAS
,RRRR_REGISTRO,RRRR_FECHA_ACCION,RRRR_OBSERVACION
,sirecacobros.dbo.diasInabiles(RRR_FECHA_ACCION,RRRR_FECHA_ACCION) AS RRRR_DIAS
FROM (
SELECT 
''http://11.200.24.211/WebSireca/descargas/emision/''+R_PATH as ARCHIVO
,R_CODE_BAR AS CODE_BAR,R_INSPECTOR AS INSPECTOR,R_ID_INSPECTOR AS ID_INSPECTOR,R_TD AS TD,R_REGPAT
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=R_REGISTRO) AS R_REGISTRO
,R_FECHA_ACCION,R_OBSERVACION
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=RR_REGISTRO) AS RR_REGISTRO
,RR_FECHA_ACCION,RR_OBSERVACION
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=RRR_REGISTRO) AS RRR_REGISTRO
,RRR_FECHA_ACCION,RRR_OBSERVACION
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=RRRR_REGISTRO) AS RRRR_REGISTRO
,RRRR_FECHA_ACCION,RRRR_OBSERVACION
FROM
(SELECT 
R_CODE_BAR,R_PATH
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=R_ID_NOTIFICADOR) AS R_INSPECTOR
,R_ID_NOTIFICADOR AS R_ID_INSPECTOR
,R_TD,R_FECHA_ACCION,R_OBSERVACION
,R_REGPAT,R_REGISTRO
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
,HA_ID_USER_REGISTRO AS R_REGISTRO
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
,RR_TD,RR_FECHA_ACCION,RR_OBSERVACION,RR_REGISTRO
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RR_ID_NOTIFICADOR
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RR_TD
,[HA_ID_CODEBAR] AS RR_CODE_BAR
,HA_ID_USER_REGISTRO AS RR_REGISTRO
,[HA_FECH_REGISTRO] as RR_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as RR_ACCION
,ISNULL(HA_OBSERVACION,'''') AS RR_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''2''
) AS RESULT2
) AS RS
on RR_CODE_BAR=R_CODE_BAR
LEFT JOIN
(
SELECT 
RRR_CODE_BAR
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=RRR_ID_NOTIFICADOR) AS RRR_INSPECTOR
,RRR_TD,RRR_FECHA_ACCION,RRR_OBSERVACION,RRR_REGISTRO
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RRR_ID_NOTIFICADOR
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RRR_TD
,[HA_ID_CODEBAR] AS RRR_CODE_BAR
,HA_ID_USER_REGISTRO AS RRR_REGISTRO
,[HA_FECH_REGISTRO] as RRR_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as RRR_ACCION
,ISNULL(HA_OBSERVACION,'''') AS RRR_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''3''
) AS RESULT3
) AS RS2
on RRR_CODE_BAR=R_CODE_BAR
LEFT JOIN
(
SELECT 
RRRR_CODE_BAR
,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=RRRR_ID_NOTIFICADOR) AS RRRR_INSPECTOR
,RRRR_TD,RRRR_FECHA_ACCION,RRRR_OBSERVACION,RRRR_REGISTRO
FROM (
SELECT 
(SELECT  replace([CQ_DATO3],''PROMOTOR:$VISIT_CVE:'','''') AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RRRR_ID_NOTIFICADOR
,(SELECT  [CQ_TD] AS ID
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA=''co'' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex(''!'',[HA_ID_CODEBAR])))) as RRRR_TD
,[HA_ID_CODEBAR] AS RRRR_CODE_BAR
,HA_ID_USER_REGISTRO AS RRRR_REGISTRO
,[HA_FECH_REGISTRO] as RRRR_FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as RRRR_ACCION
,ISNULL(HA_OBSERVACION,'''') AS RRRR_OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE [HA_SUBDEL]='''+@SUBDEL+''' and [HA_AC_ID]=''4''
) AS RESULT4
) AS RS3
on RRRR_CODE_BAR=R_CODE_BAR
) AS RESULTADO
WHERE ID_INSPECTOR like '''+@INSPECTOR+'''
AND R_FECHA_ACCION BETWEEN '''+@FECHA_RESEPCION1+''' AND '''+@FECHA_RESEPCION2+'''
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLInspector" DefaultValue="9999999" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLTop" DefaultValue="10" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="galeriaarchivoscargados.aspx.vb" Inherits="WebSIRECA.galeriaarchivoscargados" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GALERIA DE FOTOS</title>
    <link id="Link1" runat ="server" rel="Shortcut Icon" href="~/sireca.ico" type="image/x-icon" />
    <link id="Link2" runat ="server" rel="Icon" href="~/sireca.ico" type="image/ico" />
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <link href="../css/ciclo1.css" rel="stylesheet" type="text/css" />
    <script src="../js/sireca.js" type="text/javascript"></script>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!--link href="../bootstrap/css/docs.css" rel="stylesheet" type="text/css" /-->
    <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <%--<script src="../bootstrap/js/jquery-1.10.1.min.js" type="text/javascript"></script>--%>
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
    <script type ="text/javascript" >
        $(document).ready(
            function () {
                $('.dropdown-toggle').dropdown();
            }
        );
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server">
        </asp:ScriptManager>
        <%If Session.Item("SIRECAsubir_doc").ToString.Equals("1") Then%>
        <asp:Panel ID="PanelCarga" runat="server" HorizontalAlign="Center">
<div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="Label4" runat="server" Text="CARGAR"></asp:Label>
        </span> 
        <asp:TextBox ID="TBRegpat" runat="server" MaxLength="10" Width="90px"></asp:TextBox>
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                Width="100px" ></asp:DropDownList>                
        <span class="add-on">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="140" />
        </span> 
            <asp:DropDownList ID="DDLDocEntreg" CssClass="dropdown-toggle" runat="server" 
                DataSourceID="SqlDataSourceDocEntreg" DataTextField="texto" 
                DataValueField="valor" Width="150px" ToolTip="Seleccione el tipo de documento">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceDocEntreg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_tipo] AS valor
      ,[desc_tipo] AS texto
  FROM [sirecacobros].[dbo].[cae_tipodoc]
WHERE visibleInspectorb='1'
ORDER BY [desc_tipo]"></asp:SqlDataSource>
        <asp:DropDownList ID="DDLDiligencia0" runat="server" CssClass="dropdown-toggle" 
                DataSourceID="SqlDataSourceDelig" DataTextField="texto" DataValueField="valor" 
                Width="150px" ToolTip="Seleccione la diligencia">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDelig" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_diligencia] as valor
      ,[desc_diligencia] as texto
  FROM [sirecacobros].[dbo].[cae_diligencia]
WHERE visibleInspectorb='1'
order by [desc_diligencia]
"></asp:SqlDataSource>
            <asp:TextBox ID="TBFechDeligencia" runat="server" Width="80px" 
                ToolTip="Fecha de la diligencia"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="TBFechDeligencia">
            </asp:CalendarExtender>
        <span class="add-on">
            <asp:LinkButton ID="LBCargarImg" runat="server" BackColor="#BCC7D8" 
                CssClass="btn">CARGAR</asp:LinkButton>
        </span> 
        </div> 
        <br/>
            <asp:Label ID="LMsg" runat="server" Font-Italic="False" ForeColor="Red"></asp:Label>
        </asp:Panel>
        <% End If  %>
        <%If Session.Item("SIRECAver_doc").ToString.Equals("1") Then%>
        <asp:Panel ID="PanelBuscar" runat="server" HorizontalAlign="Center">
<div class="btn-group input-prepend">
        <span class="add-on">
        <asp:Label ID="Label5" runat="server" Text="BUSCAR"></asp:Label>
        </span> 
        <asp:DropDownList ID="DDLTipoArchivo" runat="server" CssClass="dropdown-toggle" Width="150px">
            <asp:ListItem>FOTO</asp:ListItem>
            <asp:ListItem>DOCUMENTO</asp:ListItem>
            <asp:ListItem Value="%">TODOS</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DDLDocumento" runat="server" CssClass="dropdown-toggle" DataSourceID="SqlDataSourceDocumento" DataTextField="texto" DataValueField="valor" Width="200px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDocumento" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct [AR_AC_DOC_ENTRGADO] as valor
,(SELECT cdoc.[desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] as cdoc WHERE cdoc.[id_tipo]=[AR_AC_DOC_ENTRGADO]) as texto
FROM [sirecacobros].[dbo].[CO_ARCHIVOS]
WHERE AR_SUBDEL=?
and AR_REGPAT=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="00000000" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DDLDiligencia" CssClass="dropdown-toggle" runat="server" DataSourceID="SqlDataSourceDiligencia" DataTextField="texto" DataValueField="valor" Width="200px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDiligencia" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT distinct [AR_AC_DILIGENCIA] as valor
,(case when [AR_AC_DOC_ENTRGADO]='99' then (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[AR_AC_DILIGENCIA])
else
replace((SELECT cdili.[desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] as cdili WHERE cdili.[id_diligencia]=[AR_AC_DILIGENCIA]),'(foto)','') 
end
) as texto
FROM [sirecacobros].[dbo].[CO_ARCHIVOS]
WHERE AR_SUBDEL=?
and AR_REGPAT=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="000000000" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <span class="add-on">
        <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#BCC7D8" CssClass="btn">BUSCAR</asp:LinkButton>
        </span> 
        </div> 
        </asp:Panel>
        <asp:Panel ID="PanelContenido" runat="server" HorizontalAlign="Center">
        <table align="center">
        <tr>
        <td>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="5">
            <ProgressTemplate ><asp:Panel ID="Panel1" runat="server" BackColor="#FFE8A6" 
                HorizontalAlign="Center">
            CARGANDO...
            </asp:Panel>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">        
        <ContentTemplate >
        <asp:Panel ID="Panel2" runat="server" BackColor="#D8D8D8" Width="800px" >
        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel2" Radius="20" Corners="All"></asp:RoundedCornersExtender>
        <asp:GridView ID="GridViewArchivos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceArchivos"
            AllowPaging="True" AllowSorting="True" PageSize="4" 
                            GridLines="None" Width="100%" 
                EmptyDataText="SIN FOTO(S)/DOCUMENTO(S)&nbsp;&nbsp;&nbsp;" 
                CssClass="table-bordered" >
            <AlternatingRowStyle BackColor="#BCC7D8" />
            <Columns>
                <asp:BoundField DataField="DOCUMENTO" HeaderText="DOCUMENTO" 
                    SortExpression="DOCUMENTO" >
                <ItemStyle HorizontalAlign="Left" ForeColor="#293955" />
                </asp:BoundField>
                <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" 
                    SortExpression="DILIGENCIA" >
                <ControlStyle Font-Underline="False" ForeColor="#003300" />
                <HeaderStyle Font-Strikeout="False" Font-Underline="False" />
                <ItemStyle HorizontalAlign="Left" ForeColor="#003300" />
                </asp:BoundField>
                <asp:BoundField DataField="FECH_DILIGENCIA" DataFormatString="{0:d}" HeaderText="DILIGENCIADO"
                    SortExpression="FECH_DILIGENCIA" >
                <ItemStyle HorizontalAlign="Center" ForeColor="#293955" />
                </asp:BoundField>
                <asp:TemplateField SortExpression="RUTA">
                    <ItemTemplate>
                    <% If DDLTipoArchivo.SelectedValue.Equals("FOTO") Then%>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/documentos/" & EVAL("RUTA")%>'
                            Height="120px" Width="180px" />
                    <% Else%>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/documentos/" & EVAL("RUTA")%>'>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/sitios/documento.png" BorderStyle="None" />
                            </asp:HyperLink>
                    <% End If  %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle HorizontalAlign="Center" CssClass="btn-info" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="#D8D8D8" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceArchivos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @REGPAT AS VARCHAR(11)
DECLARE @DOC AS VARCHAR(15)
DECLARE @DILIGENCIA AS VARCHAR(15)
DECLARE @TIPO_FILE AS VARCHAR(15)

SET @REGPAT=substring(?,1,10)
SET @DOC=?
SET @DILIGENCIA=?
SET @TIPO_FILE=?

SELECT 
(SELECT cdoc.[desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] as cdoc WHERE cdoc.[id_tipo]=[AR_AC_DOC_ENTRGADO]) as DOCUMENTO
,(case when [AR_AC_DOC_ENTRGADO]='99' then (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[AR_AC_DILIGENCIA])
else
(replace((SELECT cdili.[desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] as cdili WHERE cdili.[id_diligencia]=[AR_AC_DILIGENCIA]),'(foto)','')) 
end) as DILIGENCIA
,[AR_AC_FECH_DILIGENCIA] as FECH_DILIGENCIA
,((case when [AR_AC_DOC_ENTRGADO]='99' then 'emision\' else 'cobros\' end)+AR_REGPAT + '\' + AR_NOM_ARCHIVO
) as RUTA
FROM [sirecacobros].[dbo].[CO_ARCHIVOS]
WHERE substring(AR_REGPAT,1,10)=@REGPAT
and AR_AC_DOC_ENTRGADO like @DOC
and AR_AC_DILIGENCIA like @DILIGENCIA
and (case 
when charindex('.jpg',lower([AR_NOM_ARCHIVO]))&gt;0 then 'FOTO' 
when charindex('.jpeg',lower([AR_NOM_ARCHIVO]))&gt;0 then 'FOTO' 
when charindex('.png',lower([AR_NOM_ARCHIVO]))&gt;0 then 'FOTO' 
when charindex('.txt',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
when charindex('.doc',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
when charindex('.docx',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
when charindex('.pdf',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
when charindex('.xls',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
when charindex('.xlsx',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
when charindex('.tif',lower([AR_NOM_ARCHIVO]))&gt;0 then 'DOCUMENTO'
else 'DESCONOCIDO' 
end) like @TIPO_FILE
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="00000000" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DDLDocumento" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLDiligencia" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter DefaultValue="%" Name="?" ControlID="DDLTipoArchivo" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        </asp:Panel> 
        </ContentTemplate>
    </asp:UpdatePanel>
        </td>
        </tr>
        </table>
        </asp:Panel>
        <% End If  %>
    </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="mensajesobservacioncomentarios.aspx.vb" Inherits="WebSIRECA.mensajesobservacioncomentarios" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head" >
    <link href="cs/body.css" rel="stylesheet" type="text/css" />
    <script src="bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/sitios/1msg.png" 
            ImageAlign="AbsMiddle" /><asp:Label
            ID="Label1" runat="server" Text="Normal" Font-Bold="True" Font-Size="14pt" 
                ForeColor="#1AAE02"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image3" runat="server" ImageUrl="~/imagenes/sitios/2msg.png" 
            ImageAlign="AbsMiddle" /><asp:Label
            ID="Label2" runat="server" Text="No localizado" Font-Bold="True" 
                Font-Size="14pt" ForeColor="#B09A1E"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image4" runat="server" ImageUrl="~/imagenes/sitios/3msg.png" 
            ImageAlign="AbsMiddle" /><asp:Label
            ID="Label3" runat="server" Text="En espera de respuesta" Font-Bold="True" 
                Font-Size="14pt" ForeColor="#E54C2A"></asp:Label>
        </asp:Panel>
    
        <asp:GridView ID="GridViewMensajes" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSourceMensajes" Font-Size="10pt" 
            HorizontalAlign="Center" AllowSorting="True" 
            EmptyDataText="Bienvenido, este es el contenedor de mensajes resientes, por el momento el número de Mensajes es 0">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" />
                <asp:TemplateField SortExpression="tipo_msg" 
                    HeaderImageUrl="~/imagenes/expand_blue.jpg">
                    <ItemTemplate>
                        <asp:Image ID="ImageMsg" runat="server" ImageUrl='<%# "~/imagenes/sitios/" & Eval("tipo_msg") & "msg.png" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="REGPAT" HeaderText="REG.PATRONAL" 
                    NavigateUrl="~/observacionPatronal/Default.aspx" SortExpression="REGPAT" />
                <asp:BoundField DataField="USUARIO_CAP" HeaderText="PUBLICADOR" ReadOnly="True" 
                    SortExpression="USUARIO_CAP" />
                <asp:BoundField DataField="FECH_CAP" DataFormatString="{0:d}" 
                    HeaderText="PUBLICACIÓN" ReadOnly="True" SortExpression="FECH_CAP" />
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    ReadOnly="True" SortExpression="OBSERVACION" />
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceMensajes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USER_TYPE as VARCHAR(4)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @SUBDEL as VARCHAR(6)
SET @USER_TYPE=?
SET @INSPECTOR=?
SET @SUBDEL=?

if @USER_TYPE='0'
begin 
	SET @INSPECTOR='%'
end
if @SUBDEL='00'
begin 
	SET @SUBDEL='%'
end

SELECT 
CP_SUBDEL as SUBDEL
,(SELECT orden FROM [sirecaObservaciones].[dbo].[catalogoObservaciones] WHERE [clave]=ob.tipo) as tipo_msg
,upper(ob.[idRegpat]) as REGPAT
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=ob.[idUser]) as USUARIO_CAP
,ob.[fechaSystema] as FECH_CAP
,lower(ob.[observacion]) as OBSERVACION
,[CP_INSPEC] as LO_TIENE
,datediff(day,ob.[fechaSystema],getdate())
FROM [sirecaObservaciones].[dbo].[observacionPatronal] as ob 
left join
[sirecaObservaciones].[dbo].[comentarioObservacion] as cob
on ob.id=cob.[idObservacion]
left join
[sirecacobros].[dbo].[CO_CPATRONAL]
on [CP_REGPAT]=idRegpat
where (datediff(day,ob.[fechaSystema],getdate())&lt;6 or datediff(day,cob.[fechaSystema],getdate())&lt;6)
and [CP_INSPEC] like @INSPECTOR
and CP_SUBDEL like @SUBDEL
order by subdel,regpat,ob.[fechaSystema] desc
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="?" 
                    SessionField="SIRECAuser_type" />
                <asp:SessionParameter DefaultValue="9999" Name="?" SessionField="SIRECAid" />
                <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

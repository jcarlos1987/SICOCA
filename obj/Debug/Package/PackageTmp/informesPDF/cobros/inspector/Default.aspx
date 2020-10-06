<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default38" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <asp:Panel ID="PanelHerramientas" runat="server" HorizontalAlign="Center">
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
        AutoPostBack="True" Width="100px">
    </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label2" runat="server" Text="DILIGENCIA DEL:"></asp:Label>
</span>
                            <asp:TextBox ID="TBFechIni" runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
                            <asp:CalendarExtender ID="caext1" runat="server" Format="dd/MM/yyyy" 
                                TargetControlID="TBFechIni"></asp:CalendarExtender>
<span class="add-on">
    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn" 
        BackColor="#BCC7D8">Descargar</asp:LinkButton>
</span> 
</div>
        <asp:Label ID="Label4" runat="server" ForeColor="Red" 
            Text="Se descarga la diligencias del Mes y Anio Seleccionado"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="PanelReporte" runat="server" HorizontalAlign="Center">    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceUltimasDili" 
            HorizontalAlign="Center" PageSize="5" Width="100%">
            <Columns>
                <asp:BoundField DataField="FECHA_DILIGENCIAS" DataFormatString="{0:d}" 
                    HeaderText="ULTIMAS DILIGENCIAS" SortExpression="FECHA_DILIGENCIAS" />
                <asp:TemplateField HeaderText="INSPECTOR" SortExpression="FECHA_DILIGENCIAS">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value ='<%# Eval("FECHA_DILIGENCIAS") %>' />
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceDiliInspec">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick='<%# "javascript:window.open(""rep_diligenciados.aspx" & Eval("urlv") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>'  Text='<%# Eval("INSPECTOR") %>' ></asp:LinkButton>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSourceDiliInspec" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_ASIG AS VARCHAR(10)
SET @SUBDEL=?
SET @FECHA_ASIG=?

SELECT 
'?subdel='+@SUBDEL+'&amp;fecha='+@FECHA_ASIG+'&amp;inspector='+convert(varchar,AC_CP_INSPEC) as urlv
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=AC_CP_INSPEC) as INSPECTOR
FROM [sirecacobros].[dbo].[CO_ACCIONES]
WHERE [AC_SUBDEL]=@SUBDEL
and convert(nvarchar(10),[AC_FECH_DILIGENCIA],103)=convert(nvarchar(10),@FECHA_ASIG,103)
GROUP BY AC_CP_INSPEC
ORDER BY AC_CP_INSPEC
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="01/01/2000" 
                                    Name="?" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
            <PagerSettings Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceUltimasDili" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USER_TIPE AS VARCHAR(2)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_USER AS VARCHAR(6)
SET @SUBDEL=?
SET @USER_TIPE=?
SET @ID_USER=?

IF @USER_TIPE='0'
BEGIN
SELECT top 20 convert(nvarchar(10),[AC_FECH_DILIGENCIA],103) as FECHA_DILIGENCIAS
FROM [sirecacobros].[dbo].[CO_ACCIONES]
WHERE [AC_SUBDEL]=@SUBDEL
GROUP BY [AC_FECH_DILIGENCIA]
ORDER BY [AC_FECH_DILIGENCIA] DESC
END
ELSE
BEGIN
SELECT top 20 convert(nvarchar(10),[AC_FECH_DILIGENCIA],103) as FECHA_DILIGENCIAS
FROM [sirecacobros].[dbo].[CO_ACCIONES]
WHERE [AC_SUBDEL]=@SUBDEL
AND [AC_CP_INSPEC]=@ID_USER
GROUP BY [AC_FECH_DILIGENCIA]
ORDER BY [AC_FECH_DILIGENCIA] DESC
END
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter Name="?" SessionField="SIRECAuser_type" />
                <asp:SessionParameter Name="?" SessionField="SIRECAid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

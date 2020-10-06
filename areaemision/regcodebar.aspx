<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="regcodebar.aspx.vb" Inherits="WebSIRECA.regcodebar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type ="text/css" >
    hr.linea {
    border: 0;
    height: 1px;
    background-image: -webkit-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:    -moz-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:     -ms-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:      -o-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
}
</style>
<script type="text/javascript">
    $(window).load(function () {
        document.getElementById('<%=TBCodeBar.ClientID %>').focus();
        document.getElementById('<%=TBCodeBar.ClientID %>').select();
    });

    function enter(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 13) {
            document.getElementById('<%=LBReg.ClientID %>').click();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center >
        <asp:Panel ID="PanelMsg" runat="server" Visible="False">
<div class="btn-group input-prepend">
    <span class="add-on">
    <i><asp:Label ID="LMsg" runat="server" ForeColor="#CC0000" ></asp:Label></i>
    </span>
</div> 
        </asp:Panel>
<div class="btn-group input-prepend">
    <span class="add-on">
    <i class="icon-barcode" ></i>
    </span>
    <asp:TextBox ID="TBCodeBar" runat="server" placeholder="codigo de barra" 
        Width="100px" AutoPostBack="True"></asp:TextBox>
    <asp:DropDownList ID="DDLRegCodeBar" runat="server" 
        DataSourceID="SqlDataSourceRegCodeBar" DataTextField="texto" 
        DataValueField="valor" Width="200px" ForeColor="Red" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRegCodeBar" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CARGO AS VARCHAR(50)
DECLARE @DOC_OFIC AS VARCHAR(200)
SET @CARGO=?
SET @DOC_OFIC=?
SELECT [AC_ID] as valor,[AC_DESCRIPCION] as texto
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_OFICINA] like @CARGO and [AC_CARGO] like @DOC_OFIC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="X" Name="?" 
                SessionField="SIRECAreg_codebar" />
            <asp:SessionParameter DefaultValue="X" Name="?" SessionField="SIRECAreg_tipo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DDLAccion" runat="server" Width="160px" 
        AutoPostBack="True">
        <asp:ListItem Value="02">NOTIFICADO</asp:ListItem>
        <asp:ListItem Value="09">NO LOCALIZADO</asp:ListItem>
        <asp:ListItem Value="27">AUTODETERMINADO</asp:ListItem>
        <asp:ListItem Value="REASIGNACION">PARA REASIGNACION</asp:ListItem>
        <asp:ListItem>DEPURADO</asp:ListItem>
        <asp:ListItem>PAGADO</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TBCodeBarND" runat="server" placeholder="codigo de barra ND" 
        Width="100px" Visible="False"></asp:TextBox>
    <span class="add-on">
    <asp:LinkButton CssClass ="btn" ID="LBReg" runat="server" BackColor="#9CAAC1">Registrar</asp:LinkButton>
    <asp:LinkButton ID="LBPrint" runat="server" CssClass="btn"><i class="icon-print"></i></asp:LinkButton>
    </span>
    <br/>
    <asp:TextBox ID="TBObservacion" runat="server" 
        placeholder="OBSERVACIÓN DEL DOCUMENTO" TextMode="MultiLine" Width="620px"></asp:TextBox>
</div>
<br/>
<div class="btn-group input-prepend">
    <span class="add-on">
    <i><asp:Label ID="LUltReg" runat="server" ForeColor="#CC0000" ></asp:Label></i>
    </span>
</div> 
</center>
    <asp:GridView ID="GridViewRegitros" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceRegistros" CssClass="table-bordered" 
        ShowHeader="False" Font-Size="10pt" 
            HorizontalAlign="Center" 
        Caption="&lt;strong&gt;ULTIMO REGISTRO&lt;/strong&gt;">
        <Columns>
            <asp:TemplateField HeaderText="FECHA_ACCION" SortExpression="FECHA_ACCION">
                <ItemTemplate>
                <i class="icon- icon-chevron-right"></i>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("REGPAT") + " - " + Eval("TD") + " - " %>'></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("FECHA_ACCION", "{0:D}") %>'></asp:Label>,&nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ACCION") %>'></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%# IIF(Eval("OBSERVACION") = "", "", "<br/>")%>'></asp:Label>
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" Visible ='<%# IIF(Eval("OBSERVACION")="","false","true")%>' runat="server" Text="Observacón:" Font-Bold="True"></asp:Label><asp:Label ID="Label4" runat="server" Text='<%# Eval("OBSERVACION") %>' Visible ='<%# IIF(Eval("OBSERVACION")="","false","true")%>'></asp:Label>
                        <hr class="linea"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRegistros" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @IDBAR as VARCHAR(50)
SET @IDBAR=?
SET @IDBAR=(case 
when charindex('!',@IDBAR) not in (0) then substring(@IDBAR,charindex('!',@IDBAR)+1,9)
else @IDBAR end
)
SELECT 
ROW_NUMBER() OVER(order by [HA_FECH_REGISTRO] desc) as N
,(SELECT replace([CQ_DATO1],'REG. PATRONAL:$','')   
FROM [controlQR].[dbo].[CONTROL_QR]
where [CQ_ID]=substring(HA_ID_CODEBAR,1,charindex('!',HA_ID_CODEBAR)-1)) as REGPAT
,(SELECT CQ_TD
FROM [controlQR].[dbo].[CONTROL_QR]
where [CQ_ID]=substring(HA_ID_CODEBAR,1,charindex('!',HA_ID_CODEBAR)-1)) as TD
,(SELECT CQ_DATO5
FROM [controlQR].[dbo].[CONTROL_QR]
where [CQ_ID]=substring(HA_ID_CODEBAR,1,charindex('!',HA_ID_CODEBAR)-1)) as PERI_BIME
,[HA_FECH_REGISTRO] as FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as ACCION
,ISNULL(HA_OBSERVACION,'') AS OBSERVACION
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE substring(HA_ID_CODEBAR,charindex('!',HA_ID_CODEBAR)+1,9)=@IDBAR
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBCodeBar" DefaultValue="abcedfghi" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

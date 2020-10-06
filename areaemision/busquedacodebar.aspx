<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="busquedacodebar.aspx.vb" Inherits="WebSIRECA.busquedacodebar" %>
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
    };
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div class="btn-group input-prepend">
    <span class="add-on">
    <i class="icon-barcode" ></i>
    </span>
    <asp:TextBox ID="TBCodeBar" runat="server" onkeypress="javascript:enter(event);" placeholder="Codigo de Barra/Credito"></asp:TextBox>
    <span class="add-on">
    <asp:LinkButton CssClass ="btn" ID="LBReg" runat="server" BackColor="#9CAAC1">BUSCAR</asp:LinkButton>
    </span>
</div>
</center>
    <asp:GridView ID="GridViewRegitros" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceRegistros" CssClass="table-bordered" 
        ShowHeader="False" EmptyDataText="SIN DATOS" Font-Size="10pt" 
            HorizontalAlign="Center" 
        Caption="&lt;strong&gt;RESUMEN DE RESULTADOS&lt;/strong&gt;" 
        BackColor="White" BorderStyle="None" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="FECHA_ACCION" SortExpression="FECHA_ACCION">
                <ItemTemplate>
                <i class="icon- icon-chevron-right"></i>                
                <asp:Label ID="Label17" runat="server" Text='<%# Eval("CODE_BAR_O") %>'></asp:Label>
                <asp:LinkButton ID="LinkButton12" runat="server" OnClick ='<%# "javascript:window.open(""" & Eval("R_PATH_O") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>' ><i class ="icon-file"></i></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Text='<%# Eval("REGPAT") %>'></asp:Label>
                <br/>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("FECHA_ACCION", "{0:D}") %>'></asp:Label>,&nbsp;
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("R_TD") %>'></asp:Label>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("ACCION") %>'></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("FECHA_ACCION","{0:T}") %>'></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%# "("+Eval("REGISTRO")+")" %>' Font-Italic="True" Font-Size="9"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%# IIF(Eval("CODE_BAR_ACT_CIRCUNS") = "" or Eval("CODE_BAR_ACT_CIRCUNS")="02" or Eval("CODE_BAR_ACT_CIRCUNS")="PAGADO", "", "<br/>")%>'></asp:Label>
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" Visible ='<%# IIF(Eval("CODE_BAR_ACT_CIRCUNS")="" or Eval("CODE_BAR_ACT_CIRCUNS")="02" or Eval("CODE_BAR_ACT_CIRCUNS")="PAGADO","false","true")%>' runat="server" Text="Codigo Acta Circunstanciada:" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("CODE_BAR_ACT_CIRCUNS") %>' Visible ='<%# IIF(Eval("CODE_BAR_ACT_CIRCUNS")="" or Eval("CODE_BAR_ACT_CIRCUNS")="02" or Eval("CODE_BAR_ACT_CIRCUNS")="PAGADO","false","true")%>'></asp:Label>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible ='<%# IIF(Eval("CODE_BAR_ACT_CIRCUNS")="" or Eval("CODE_BAR_ACT_CIRCUNS")="02" or Eval("CODE_BAR_ACT_CIRCUNS")="PAGADO","false","true")%>' OnClick ='<%# "javascript:window.open(""" & Eval("R_PATH_ACT_CIRCUNS") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>' ><i class ="icon-file"></i></asp:LinkButton>
                        <asp:Label ID="Label8" runat="server" Text='<%# IIF(Eval("CODE_BAR_ACT_CIRCUNS") = "" or Eval("CODE_BAR_ACT_CIRCUNS")="02" or Eval("CODE_BAR_ACT_CIRCUNS")="PAGADO", "", "<br/>")%>'></asp:Label>                        
                        <asp:Image ID="Image1" runat="server" Visible ='<%# IIF(Eval("CODE_BAR_ACT_CIRCUNS")="" or Eval("CODE_BAR_ACT_CIRCUNS")="02" or Eval("CODE_BAR_ACT_CIRCUNS")="PAGADO","false","true")%>' ImageUrl='<%# "http://11.200.24.211/webqr/barra.aspx?key=" + Eval("CODE_BAR_ACT_CIRCUNS") %>' />
                        <asp:Label ID="Label18" runat="server" Text='<%# IIF(Eval("OBSERVACION") = "", "", "<br/>")%>'></asp:Label>
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
replace([HA_ID_CODEBAR],'!'+@IDBAR,'') as ID
,(SELECT replace([CQ_DATO1],'REG. PATRONAL:$','')
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=replace([HA_ID_CODEBAR],'!'+@IDBAR,'')) as REGPAT
,[HA_ID_CODEBAR] as CODE_BAR_O
,(SELECT [CQ_TD]
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA='co' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex('!',[HA_ID_CODEBAR])))) as R_TD
,'http://11.200.24.211/WebSireca/descargas/emision/'+(SELECT [CQ_PATH]
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA='co' and [CQ_ID]=(substring([HA_ID_CODEBAR],0,charindex('!',[HA_ID_CODEBAR])))) as R_PATH_O
,[HA_FECH_REGISTRO] as FECHA_ACCION
,(SELECT [AC_DESCRIPCION]
FROM [controlQR].[dbo].[ACCIONES]
WHERE [AC_ID]=[HA_AC_ID]) as ACCION
,ISNULL(HA_OBSERVACION,'') AS OBSERVACION
,isnull([HA_ND_CODE],'') as CODE_BAR_ACT_CIRCUNS
,'http://11.200.24.211/WebSireca/descargas/emision/'+(SELECT [CQ_PATH]
FROM [controlQR].[dbo].[CONTROL_QR]
where CQ_AREA='co' and [CQ_ID]=(substring([HA_ND_CODE],0,charindex('!',[HA_ND_CODE])))) as R_PATH_ACT_CIRCUNS
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[HA_ID_USER_REGISTRO]) as REGISTRO
FROM [controlQR].[dbo].[HIST_ACCIONES]
WHERE substring(HA_ID_CODEBAR,charindex('!',HA_ID_CODEBAR)+1,9)=@IDBAR
order by [HA_FECH_REGISTRO] desc
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBCodeBar" DefaultValue="abcedfghi" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

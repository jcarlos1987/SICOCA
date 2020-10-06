<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="reportebaserale.aspx.vb" Inherits="WebSIRECA.reportebaserale" %>
<asp:Content ID ="contedtHead" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <asp:Label ID="Label3" runat="server" Text="con INC."></asp:Label>
        </span>
        <asp:DropDownList ID="DDLInc" runat="server" ToolTip="PERIODO" 
            AutoPostBack="True" Width="200px" >
            <asp:ListItem Value="05">(05) EN SOLICITUD DE CONVENIO</asp:ListItem>
            <asp:ListItem Value="52">(52) CONVENIO CON PLAZO</asp:ListItem>
        </asp:DropDownList>
        <span class="add-on">
            <asp:Label ID="Label4" runat="server" Text="TIPO"></asp:Label>
        </span>
        <asp:DropDownList ID="DDLTipo" runat="server" ToolTip="PERIODO" 
            AutoPostBack="True" Width="140px" >
            <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
            <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
            <asp:ListItem Value="%">C.O.P. Y R.C.V.</asp:ListItem>
        </asp:DropDownList>
    </div> 
    </center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" 
    EmptyDataText="SIN RESULTADOS DE LOS SELECCIONADOS" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
                SortExpression="INCIDENCIA" />
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">               
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick='<%# "javascript:window.open(""detalles_reportebaseralepatrones.aspx?" & Eval("urlv") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>'  Text='<%# Eval("PATRONES", "{0:N0}") %>' ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CREDITO" SortExpression="CREDITO">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick='<%# "javascript:window.open(""detalles_reportebaserale.aspx?" & Eval("urlv") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>'  Text='<%# Eval("CREDITO", "{0:N0}") %>' ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @MES AS VARCHAR(2)
DECLARE @INC AS VARCHAR(2)
DECLARE @TIPO AS VARCHAR(3)
SET @SUBDEL=?
SET @ANIO=?
SET @MES=?
SET @INC=?
SET @TIPO=?
SELECT 
('subdel='+@SUBDEL+'&amp;anio='+@ANIO+'&amp;mes='+@MES+'&amp;inc='+@INC+'&amp;tipo='+@TIPO) as urlv
,(CASE 
WHEN @INC IN ('05') THEN '('+@INC+') EN SOLICITUD DE CONVENIO' 
WHEN @INC IN ('52') THEN '('+@INC+') CONVENIO CON PLAZO' 
END) AS INCIDENCIA
,COUNT(DISTINCT REGPATR) AS PATRONES,COUNT(NUMCRED) AS CREDITO,SUM(IMPORTE) AS IMPORTE
FROM [sirecacobros].[dbo].[CR_RALE]
WHERE SUBDEL LIKE @SUBDEL AND MONTH(FEINC) LIKE @MES AND YEAR(FEINC)=@ANIO 
AND INC=@INC AND TIPO LIKE @TIPO
">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DDLInc" DefaultValue="05" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DDLTipo" DefaultValue="COP" Name="?" 
            PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

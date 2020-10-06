<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteInspectorB.Master" CodeBehind="capturadiligencia.aspx.vb" Inherits="WebSIRECA.capturadiligencia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(window).load(function () {
            document.getElementById('<%=TBCredito.ClientID %>').focus();
            document.getElementById('<%=TBCredito.ClientID %>').select();
        });
        function enter(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) {
                document.getElementById('<%=LBBuscar.ClientID %>').click();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center >
    <asp:TextBox ID="TBCredito" runat="server" placeholder="CODIGO DE BARRA" CssClass="text-center search-query" MaxLength="19" Width="180px" ></asp:TextBox>
    <asp:DropDownList ID="DDLCopRcv" runat="server" Width="140px">
        <asp:ListItem Value="%">C.O.P. y R.C.V.</asp:ListItem>
        <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
        <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
    </asp:DropDownList>
    <asp:LinkButton ID="LBBuscar" runat="server" CssClass="btn" >BUSCAR</asp:LinkButton>
    <br/><asp:Label ID="LMensaje" runat="server" ForeColor="#CC0000" ></asp:Label>
<%--Panel de Citatorio Inicio--%>
<asp:Panel ID="PanelCitatorio" runat="server"  Visible="False" CssClass="well" Width="600">
    HORA DEL CITATORIO:<asp:DropDownList ID="DDLHoras" runat="server" Width="140px"></asp:DropDownList>
    FECHA <asp:TextBox ID="TBFechCitatorio" runat="server" Width="80px" ></asp:TextBox>
    <asp:CalendarExtender ID="CE33" runat="server" TargetControlID="TBFechCitatorio" Format="dd/MM/yyyy"></asp:CalendarExtender>
    <br/><asp:LinkButton ID="LBGuardarCitatorio" runat="server" CssClass="btn" 
        BorderColor="#293955" BorderStyle="Solid" BorderWidth="1px">Guardar</asp:LinkButton>
</asp:Panel>
<%--Panel de Citatorio Fin--%>

<%--Panel de Acciones o diligencias Inicio--%>
<asp:Panel ID="PanelAcciones" runat="server" Visible="False"  >
    <asp:Panel ID="PanelDiligencia" runat="server" CssClass="well" Width="600">
        <br/>DILIGENCIA<asp:DropDownList ID="DDLDiligencia" runat="server" 
            DataSourceID="SqlDataSourceDelig" DataTextField="texto" DataValueField="valor" 
            Font-Size="9pt" Width="320px">
        </asp:DropDownList>
        <asp:TextBox ID="TBFechDeligencia" runat="server" Width="80px" Height="20px"></asp:TextBox>
        <asp:CalendarExtender ID="CE2" runat="server" TargetControlID="TBFechDeligencia" Format="dd/MM/yyyy"></asp:CalendarExtender>

        <asp:LinkButton ID="LBCargarImg" runat="server" ToolTip="Carga de Fotos/Documentos">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/sitios/foto_doc.png" Height="22" ImageAlign="AbsMiddle" />
        </asp:LinkButton>
        <asp:SqlDataSource ID="SqlDataSourceDelig" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id_diligencia] as valor
      ,[desc_diligencia] as texto
  FROM [sirecacobros].[dbo].[cae_diligencia]
WHERE visibleInspectorb='1'
order by [desc_diligencia]
"></asp:SqlDataSource>
<br/>
        <asp:Label ID="Label1" runat="server" Text="IMPORTE $" Font-Bold="True" Font-Size="10pt"></asp:Label>
        <asp:TextBox ID="TBPago" runat="server" MaxLength="10" Width="80px">0.00</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Escriba la cantidad con dos decimales <br/>Ejemplo: <br/>250 escribir 250.00" ControlToValidate="TBPago" ValidationExpression="\d{1,10}.\d{2}" Display="None"></asp:RegularExpressionValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RegularExpressionValidator1"></asp:ValidatorCalloutExtender>
        <asp:Label ID="Label2" runat="server" Text="RECIBO" Font-Bold="True" Font-Size="10pt"></asp:Label>
        <asp:TextBox ID="TBResvProv" runat="server" MaxLength="15" Width="90px">000000000</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="El RESIVO PROVICIONAL debe tener minimo 5 numeros." ControlToValidate="TBResvProv" ValidationExpression="\d{5,9}" Display="None"></asp:RegularExpressionValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RegularExpressionValidator2"></asp:ValidatorCalloutExtender>
        <asp:Label ID="Label3" runat="server" Text="FECH.RECIBO" Font-Bold="True" Font-Size="10pt"></asp:Label>
        <asp:TextBox ID="TBFechResvProv" runat="server" MaxLength="10" Width="80px"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFechResvProv" Format="dd/MM/yyyy"></asp:CalendarExtender>  
    <br/><asp:LinkButton ID="LBGuardar" runat="server" CssClass="btn" BorderColor="#293955" BorderStyle="Solid" BorderWidth="1px" >Guardar</asp:LinkButton>
    </asp:Panel>

   <%-- inicio de cuadro de carga de imagenes--%>
    <asp:Panel ID="AnimatedModalPopupPanel" runat="server" BorderStyle="Solid" Height="20" Width="200" BackColor="#293955" >
    <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Right">
        <asp:Button ID="CloseButton" runat="server" Text="Cerrar" BorderStyle="Solid" BorderWidth="1" />
    </asp:Panel>
    <!-- -->
        <asp:Panel ID="PanelHeadCarga" runat="server" HorizontalAlign="Center" Height="60" BackColor="#6B99E3"><br />
            <asp:Label ID="Label9" runat="server" Text="FOTO(S) A CARGAR CON LA DILIGENCIA" Font-Bold="True" ForeColor="White"></asp:Label>
        </asp:Panel> 
        <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center"><br />
            <asp:Label ID="Label10" runat="server" Text="FOTO(1)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label11" runat="server" Text="FOTO(2)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload2" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label12" runat="server" Text="FOTO(3)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload3" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label13" runat="server" Text="FOTO(4)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload4" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label14" runat="server" Text="FOTO(5)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload5" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label15" runat="server" Text="FOTO(6)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload6" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label16" runat="server" Text="FOTO(7)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload7" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
            <asp:Label ID="Label17" runat="server" Text="FOTO(8)" ForeColor="White"></asp:Label>
            <asp:FileUpload ID="FileUpload8" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" BackColor="#293955" BorderColor="#293955" 
                ForeColor="White" /><br />
        </asp:Panel>
    <!-- -->
    </asp:Panel>
    <asp:ModalPopupExtender ID="MPE1" runat="server" CancelControlID="CloseButton" Enabled="True" PopupControlID="AnimatedModalPopupPanel" TargetControlID="LBCargarImg">
            <Animations>
                    <OnShowing>
                        <Sequence>
                            <StyleAction AnimationTarget="CloseButton" Attribute="display" Value="none" />
                            <Resize Duration="0" Height="70px" Width="100px" />
                        </Sequence>
                    </OnShowing>
                    <OnShown>
                        <Sequence>
                            <Parallel>
                                <FadeIn />
                                <Scale ScaleFactor="5" Center="True" />
                            </Parallel>
                            <StyleAction AnimationTarget="CloseButton" Attribute="display" Value="" />
                        </Sequence>
                    </OnShown>    
                    <OnHiding>
                        <Sequence>                            
                            <StyleAction AnimationTarget="CloseButton" Attribute="display" Value="none" />
                            <Parallel>
                                <FadeOut />
                                <Scale ScaleFactor="5" Center="True" />
                            </Parallel>
                        </Sequence>
                    </OnHiding>            
            </Animations>
    </asp:ModalPopupExtender>
   <%-- fin de cuadro de carga de imagenes--%>
</asp:Panel>
<%--Panel de Acciones o diligencias Fin--%>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" AllowSorting="True" 
            
        EmptyDataText="SIN RESULTADOS, INGRESE UN CODIGO VALIDO, SI CONTINUA VIENDO ESTE MENSAJE HABLE CON SU SUPERVISOR" 
        CssClass="table-condensed">
        <Columns>
            <asp:BoundField DataField="R_TIPO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="R_TIPO" />
            <asp:BoundField DataField="R_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="R_SUBDEL" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="R_NUMCRED" HeaderText="NUMCRED" ReadOnly="True" 
                SortExpression="R_NUMCRED">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="R_IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="R_IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="R_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="R_PERIODO">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CBSeleccion" runat="server" Checked="True" />
                    <asp:HiddenField ID="HFId" runat="server" Value='<%# Eval("R_ID") %>' />
                    <asp:HiddenField ID="HFCredito" runat="server" Value='<%# Eval("R_NUMCRED") %>' />
                    <asp:HiddenField ID="HFPeriodo" runat="server" Value='<%# Eval("R_PERIODO") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="btn-info" ForeColor="White" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CODE_BAR AS VARCHAR(50)
DECLARE @TIPO_DOC AS VARCHAR(20)
DECLARE @INSPECTOR AS VARCHAR(20)
DECLARE @TIPO_COP_RCV AS VARCHAR(20)
SET @CODE_BAR=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?
SET @TIPO_DOC=substring(@CODE_BAR,17,1)
SET @CODE_BAR=substring(@CODE_BAR,1,16)

SET @TIPO_DOC=(case 
when @TIPO_DOC='C' then ' and D_CIT_SUP=1 '
when @TIPO_DOC='M' then ' and D_MAN_SUP=1 '
when @TIPO_DOC='A' then ' and D_AMP_SUP=1 '
when @TIPO_DOC='R' then ' and D_REM_SUP=1 '
when @TIPO_DOC='J' then ' and D_CER_SUP=1 '
else ' and D_CIT_SUP=9 ' 
end)

exec('
SELECT R_ID
, [R_TIPO]
,[R_SUBDEL]
,[R_NUMCRED]
,[R_IMPORTE]
,[R_PERIODO]
FROM [sirecacobros].[dbo].[PAE_CRED] where [ACTIVO]=1111 and [CODE_BAR]='''+@CODE_BAR+''' '+@TIPO_DOC+'
and [ID_INS]='''+@INSPECTOR+''' and R_TIPO like '''+@TIPO_COP_RCV+'''
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBCredito" DefaultValue="ABC999000" Name="?" 
                PropertyName="Text" />
            <asp:SessionParameter DefaultValue="999999" Name="?" SessionField="SIRECAid" />
            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="COP" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</center>

</asp:Content>

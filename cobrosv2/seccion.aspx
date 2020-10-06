<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="seccion.aspx.vb" Inherits="WebSIRECA.seccion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
    <br />
    <div class="tabbable"> <!-- Only required for left/right tabs -->
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab11" data-toggle="tab">PARA REMOCION (INC 32)</a></li>
    <li><a href="#tab22" data-toggle="tab">CON ENVIO DE OFICIO (INC 43)</a></li>
    <li><a href="#tab33" data-toggle="tab">EMB. BIENES INMUEBLES SOLICITUDES DE AVALUO (INC 34)</a></li>
    <li><a href="#tab44" data-toggle="tab">EMBARGO DE NEGOCIACION (INC 35)</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab11">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" EmptyDataText="SIN PATRONES PARA REMOCION" 
            Caption="INC 32">
            <Columns>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="FECHA_32" HeaderText="FECHA" ReadOnly="True" 
                    SortExpression="FECHA_32" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_HABILES" HeaderText="DIAS HABILES" 
                    ReadOnly="True" SortExpression="DIAS_HABILES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton ID="LBActa32" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_ACTA") %>'>Acta</asp:LinkButton>
                    &nbsp;&nbsp;/&nbsp;&nbsp;
                    <asp:LinkButton ID="LBEntrAlma32" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_ALMACEN") %>'>Entr.Almacen</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="--PARA REMOCION 32=10, CON FECHA DE LA DILIGENCIA MAYOR A 15 DIAS
SELECT 
[PD_CODEBAR] AS CODEBAR
,SUBSTRING([PD_CODEBAR],1,10) AS REGPAT
,[PD_FECHA] AS FECHA_32
,sirecacobros.dbo.diasInabiles([PD_FECHA],getdate()) as DIAS_HABILES
,'default.aspx?rc=4&amp;r='+SUBSTRING([PD_CODEBAR],1,10) as VURL_ACTA
,'default.aspx?rc=5&amp;r='+SUBSTRING([PD_CODEBAR],1,10) as VURL_ALMACEN
FROM [sirecacobros].[dbo].[PAE_DILIGENCIA]
where [PD_DILIGENCIA]='10' --and sirecacobros.dbo.diasInabiles([PD_FECHA],getdate())&gt;15 
AND PD_SUBDEL=?
AND EXISTS(SELECT TOP 1 [CODE_BAR] FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [CODE_BAR]=SUBSTRING(PD_CODEBAR,1,16) AND ACTIVO=1)
group by [PD_CODEBAR],[PD_DILIGENCIA],[PD_OFICINA],[PD_FECHA],[PD_IP],[PD_INSPECTOR]
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="tab-pane " id="tab22">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" 
            EmptyDataText="SIN PATRONES CON FECHA DE OFICIO" Caption="INC 43">
            <Columns>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="FECHA_43" HeaderText="FECHA" ReadOnly="True" 
                    SortExpression="FECHA_43" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_HABILES" HeaderText="DIAS HABILES" 
                    ReadOnly="True" SortExpression="DIAS_HABILES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_SIARA" HeaderText="FOLIO" ReadOnly="True" 
                    SortExpression="FOLIO_SIARA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_SIARA" HeaderText="FECHA" ReadOnly="True" 
                    SortExpression="FECHA_SIARA" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_BANCARIO" HeaderText="FOLIO" ReadOnly="True" 
                    SortExpression="FOLIO_BANCARIO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_BANCARIO" HeaderText="FECHA" ReadOnly="True" 
                    SortExpression="FECHA_BANCARIO" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LBActualizar43" runat="server" >ACTUALIZAR</asp:LinkButton>
                        &nbsp;&nbsp;/&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_R") %>'>No Pago</asp:LinkButton>
                        &nbsp;&nbsp;/&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_P") %>'>Pago</asp:LinkButton>
                        <%--inicio actualizacion--%>
                        <asp:ModalPopupExtender ID="MP2CanInc" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBActualizar43" PopupControlID="PanelActCanInc" DropShadow="true" CancelControlID="LBCerrarActCanInc" ></asp:ModalPopupExtender>
                        <asp:Panel ID="PanelActCanInc" runat="server" Height="180px" Width="460px" Font-Size="9pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	                        <asp:Panel ID="PanelHeaderActCanInc" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
	                        </asp:Panel>
                            <br />
                            <h4>ACTUALIZAR</h4>
                            <asp:Label ID="Label1" runat="server" Text="*NOTA: Actualizara los campos que tengan fecha." ForeColor="#CC0000"></asp:Label>
                            <%--CONTENIDO INICIO--%>
                            <br />OFICIO SOLICITUD DEL SIARA
                            <asp:TextBox ID="TBFolioSiara" runat="server" Width="80px" placeholder="FOLIO" ></asp:TextBox>
                            <asp:TextBox ID="TBFechaSiara" runat="server" Width="80px" placeholder="dd/mm/aaaa" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CETBFechaSiara" runat="server" TargetControlID="TBFechaSiara" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />OFICIO SOLI. RESP. COMISION BANCARIO
                            <asp:TextBox ID="TBFolioBancario" runat="server" Width="80px" placeholder="FOLIO" ></asp:TextBox>
                            <asp:TextBox ID="TBFechaBancario" runat="server" Width="80px" placeholder="dd/mm/aaaa" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CETBFechaBancario" runat="server" TargetControlID="TBFechaBancario" Format="dd/MM/yyyy"></asp:CalendarExtender>
	                        <br />
                            <asp:LinkButton ID="LBguardarCanInc43" runat="server" CssClass ="btn btn-success" CommandArgument='<%# Eval("ID") & "-" & DirectCast(Container,GridViewRow).RowIndex.toString %>'
                                onclick="LBguardarCanInc43_Click" >GUARDAR</asp:LinkButton>
                            <asp:LinkButton ID="LBCerrarActCanInc" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" >CANCELAR</asp:LinkButton>
                            <%--CONTENIDO FIN--%>
                        </asp:Panel>
                        <asp:RoundedCornersExtender ID="RCE1CanInc" runat="server" Enabled="True" Radius="15" TargetControlID="PanelActCanInc"></asp:RoundedCornersExtender>
                        <%--fin actualizacion--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="--SOLICITA CHEQUE 43=8, CON FECHA DE OFICIO MAYOR A 30 DIAS
SELECT 
FI_ID AS ID
,[FI_CODEBAR] AS CODEBAR
,SUBSTRING([FI_CODEBAR],1,10) AS REGPAT
,[FI8_FECH_OFI_CONVE] AS FECHA_43
,[F8_FOLIO_SIARA] AS FOLIO_SIARA
,[F8_FECHA_SIARA] AS FECHA_SIARA
,[F8_FOLIO_BANCARIO] AS FOLIO_BANCARIO
,[F8_FECHA_BANCARIO] AS FECHA_BANCARIO
,sirecacobros.dbo.diasInabiles([FI8_FECH_OFI_CONVE],getdate()) AS DIAS_HABILES
,'default.aspx?rc=2&amp;r='+SUBSTRING([FI_CODEBAR],1,10) as VURL_R
,'default.aspx?rc=3&amp;r='+SUBSTRING([FI_CODEBAR],1,10) as VURL_P
FROM [sirecacobros].[dbo].[PAE_FECHAS]
WHERE [FI_INC]='43' AND FI_SUBDEL=?
--AND sirecacobros.dbo.diasInabiles([FI8_FECH_OFI_CONVE],getdate())&gt;30
AND EXISTS(SELECT TOP 1 [CODE_BAR] FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [CODE_BAR]=SUBSTRING([FI_CODEBAR],1,16) AND ACTIVO=1)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="tab-pane " id="tab33">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            Caption="INC 34" DataSourceID="SqlDataSource3" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_OFI_RPP_34" HeaderText="OFICIO RPP" 
                    ReadOnly="True" SortExpression="FECHA_OFI_RPP_34" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_HABIL_OFI_RPP" HeaderText="DIAS OFICIO" 
                    ReadOnly="True" SortExpression="DIAS_HABIL_OFI_RPP" 
                    DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_RES_RPP_34" HeaderText="FECHA RESP." 
                    ReadOnly="True" SortExpression="FECHA_RES_RPP_34" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_HABIL_RES_RPP" HeaderText="DIAS RESP." 
                    ReadOnly="True" SortExpression="DIAS_HABIL_RES_RPP" 
                    DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_SOLI" HeaderText="FOLIO SOLI." 
                    ReadOnly="True" SortExpression="FOLIO_SOLI" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_SOLI" HeaderText="FECHA SOLI." 
                    ReadOnly="True" SortExpression="FECHA_SOLI" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FICHA_SOLI" HeaderText="FICHA SOLI." 
                    ReadOnly="True" SortExpression="FICHA_SOLI" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_GRAVAMEN" HeaderText="FOLIO GRAVAMEN" 
                    ReadOnly="True" SortExpression="FOLIO_GRAVAMEN" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_GRAVAMEN" HeaderText="FECHA GRAVAMEN" 
                    ReadOnly="True" SortExpression="FECHA_GRAVAMEN" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:BoundField DataField="OFICINA_REMATE" HeaderText="OFICINA REMATE" 
                    ReadOnly="True" SortExpression="OFICINA_REMATE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_REMATE" HeaderText="FECHA REMATE" 
                    ReadOnly="True" SortExpression="FECHA_REMATE" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="F_SOLICITUD_AVALUO" DataFormatString="{0:d}" 
                    HeaderText="SOLICITUD AVALUO" SortExpression="F_SOLICITUD_AVALUO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="F_NOTIFICACION_AVALUO" DataFormatString="{0:d}" 
                    HeaderText="NOTIFICACION AVALUO" SortExpression="F_NOTIFICACION_AVALUO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="F_SUBE_REMATE" DataFormatString="{0:d}" 
                    HeaderText="SUBE A REMATE" SortExpression="F_SUBE_REMATE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LBActualizar34" CommandArgument ='<%# Eval("ID") %>' runat="server">Actualizar</asp:LinkButton>&nbsp;&nbsp;/&nbsp;&nbsp;
                        <asp:LinkButton ID="LBRegEmbar34" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_REGRESAR") %>'>REGRESAR EMBARGO</asp:LinkButton>
                        &nbsp;&nbsp;/&nbsp;&nbsp;
                        <asp:LinkButton ID="LBGestRemat34" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_GEST_REMATE") %>'>GESTION REMATE</asp:LinkButton>
                        <%--inicio actualizacion--%>
                        <asp:ModalPopupExtender ID="MP2CanInc" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBActualizar34" PopupControlID="PanelActCanInc" DropShadow="true" CancelControlID="LBCerrarActCanInc" ></asp:ModalPopupExtender>
                        <asp:Panel ID="PanelActCanInc" runat="server" Height="440px" Width="500px" Font-Size="9pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	                        <asp:Panel ID="PanelHeaderActCanInc" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
	                        </asp:Panel>
                            <br />
                            <h4>ACTUALIZAR</h4>
                            <asp:Label ID="Label1" runat="server" Text="*NOTA: Actualizara los campos que tengan fecha." ForeColor="#CC0000"></asp:Label>
                            <%--CONTENIDO INICIO--%>
                            <br />OFICIO DE SOLICITUD
                            <asp:TextBox ID="TBFolioOfiSoli" runat="server" Width="80px" placeholder="FOLIO" ></asp:TextBox>
                            <asp:TextBox ID="TBFechaNumFicha" runat="server" Width="80px" placeholder="dd/mm/aaaa" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CETBFechaNumFicha" runat="server" TargetControlID="TBFechaNumFicha" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            FICHA #<asp:TextBox ID="TBNumFicha" runat="server" Width="80px" placeholder="NUM. FICHA" ></asp:TextBox>
                            <br />LIBERTAD DE GRAVAMEN
                            <asp:TextBox ID="TBFolioLibGravamen" runat="server" Width="80px" placeholder="FOLIO" ></asp:TextBox>
                            <asp:TextBox ID="TBFechaLibGravamen" runat="server" Width="80px" placeholder="dd/mm/aaaa" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CETBFechaLibGravamen" runat="server" TargetControlID="TBFechaLibGravamen" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />SOLI. DE APROVA. DE REMATE(JURIDICA)
                            <asp:TextBox ID="TBFolioAproRemaJuri" runat="server" Width="80px" placeholder="NUM. OFICIO" ></asp:TextBox>
                            <asp:TextBox ID="TBFechaAproRemaJuri" runat="server" Width="80px" placeholder="dd/mm/aaaa" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CETBFechaAproRemaJuri" runat="server" TargetControlID="TBFechaAproRemaJuri" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />RES. OFICIO R.P.P.
                            <asp:TextBox ID="TBFech341" runat="server" Width="80px" placeholder="FOLIO" ></asp:TextBox>
                            <br />
                            SOLICITO AVALUO
                            <asp:TextBox ID="TBFech342" runat="server" Width="80px" MaxLength="10" placeholder="dd/mm/aaaa" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFech342" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />
                            NOTIFICO AVALUO
                            <asp:TextBox ID="TBFech343" runat="server" Width="80px" MaxLength="10" placeholder="dd/mm/aaaa" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TBFech343" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />
                            SUBIÓ GEST. REMATE
                            <asp:TextBox ID="TBFech344" runat="server" Width="80px" MaxLength="10" placeholder="dd/mm/aaaa" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TBFech344" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />
                            OBSERVACION
                            <asp:TextBox ID="TextBox2" runat="server" Width="80px" MaxLength="10" ></asp:TextBox>
                            <br />
	                        <asp:LinkButton ID="LBguardarCanInc34" runat="server" CssClass ="btn btn-success" CommandArgument='<%# Eval("ID") & "-" & DirectCast(Container,GridViewRow).RowIndex.toString %>'
                                onclick="LBguardarCanInc34_Click" >GUARDAR</asp:LinkButton>
                            <asp:LinkButton ID="LBCerrarActCanInc" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" >CANCELAR</asp:LinkButton>
                            <%--CONTENIDO FIN--%>
                        </asp:Panel>
                        <asp:RoundedCornersExtender ID="RCE1CanInc" runat="server" Enabled="True" Radius="15" TargetControlID="PanelActCanInc"></asp:RoundedCornersExtender>
                        <%--fin actualizacion--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="--SOLICITA CHEQUE 34=25, CON FECHA DE OFICIO MAYOR A 30 DIAS
SELECT 
[FI_CODEBAR] AS CODEBAR
,substring([FI_CODEBAR],1,10) AS REGPAT
,FI25_FECH_INSCRIP AS FECHA_OFI_RPP_34
,sirecacobros.dbo.diasInabiles(FI25_FECH_INSCRIP,getdate()) AS DIAS_HABIL_OFI_RPP
,FI25_FECH_TURNA_REMAT AS FECHA_RES_RPP_34
,sirecacobros.dbo.diasInabiles(FI25_FECH_TURNA_REMAT,getdate()) AS DIAS_HABIL_RES_RPP
,F25_FOLIO_SOLI AS FOLIO_SOLI
,F25_FECHA_SOLI AS FECHA_SOLI
,F25_FICHA_SOLI AS FICHA_SOLI
,F25_FOLIO_GRAVAMEN AS FOLIO_GRAVAMEN
,F25_FECHA_GRAVAMEN AS FECHA_GRAVAMEN
,F25_OFICINA_REMATE AS OFICINA_REMATE
,F25_FECHA_REMATE AS FECHA_REMATE
,[F25_FECH_SOLI_AVALUO] as F_SOLICITUD_AVALUO
,[F25_FECH_NOTI_AVALUO] as F_NOTIFICACION_AVALUO
,[F25_FECH_SUBE_REMAT] as F_SUBE_REMATE
,'default.aspx?rc=6&amp;r='+SUBSTRING([FI_CODEBAR],1,10) as VURL_REGRESAR
,'default.aspx?rc=8&amp;r='+SUBSTRING([FI_CODEBAR],1,10) as VURL_GEST_REMATE
,FI_ID as ID
,FI_SUBDEL AS R_SUBDEL
FROM [sirecacobros].[dbo].[PAE_FECHAS]
WHERE [FI_INC]='34' AND FI_SUBDEL=?
AND EXISTS(SELECT TOP 1 [CODE_BAR] FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [CODE_BAR]=SUBSTRING([FI_CODEBAR],1,16) AND ACTIVO=1)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="tab-pane" id="tab44">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource4" Caption="INC 35">
            <Columns>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="F_OFICIO_RPP_35" DataFormatString="{0:d}" 
                    HeaderText="OFICIO R.P.P." ReadOnly="True" SortExpression="F_OFICIO_RPP_35">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DIAS_HABIL_OFI_RPP" DataFormatString="{0:d}" 
                    HeaderText="DIAS OFI. R.P.P." ReadOnly="True" 
                    SortExpression="DIAS_HABIL_OFI_RPP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="F_NOMBRE_INTERVENTARIO_35" DataFormatString="{0:d}" 
                    HeaderText="NOMBRE INTERVENTARIO" ReadOnly="True" 
                    SortExpression="F_NOMBRE_INTERVENTARIO_35">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="F_NOTIFICACION_INTERVENCION_35" 
                    DataFormatString="{0:d}" HeaderText="NOTIFICACION INTERV." ReadOnly="True" 
                    SortExpression="F_NOTIFICACION_INTERVENCION_35">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="F_SEGUIMIENTO_INTERVENCION_35" 
                    DataFormatString="{0:d}" HeaderText="SEGUIMIENTO INTERV." ReadOnly="True" 
                    SortExpression="F_SEGUIMIENTO_INTERVENCION_35">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LBActualizar35" runat="server">Actualizar</asp:LinkButton>&nbsp;&nbsp;/&nbsp;&nbsp;
                        <%--inicio actualizacion--%>
                        <asp:ModalPopupExtender ID="MP2CanInc" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBActualizar35" PopupControlID="PanelActCanInc" DropShadow="true" CancelControlID="LBCerrarActCanInc" ></asp:ModalPopupExtender>
                        <asp:Panel ID="PanelActCanInc" runat="server" Height="300px" Width="380px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	                        <asp:Panel ID="PanelHeaderActCanInc" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
	                        </asp:Panel>
                            <br />
                            <h4>ACTUALIZAR</h4>
                            <asp:Label ID="Label1" runat="server" Text="*NOTA: Actualizara los campos que tengan fecha." ForeColor="#CC0000"></asp:Label>
                            <%--CONTENIDO INICIO--%>
                            <br />NOMBRA INTERVENTOR
                            <asp:TextBox ID="TBFech351" runat="server" Width="80px" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CEFechRpp11" runat="server" TargetControlID="TBFech351" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />
                            NOTIF. INTERVENTOR
                            <asp:TextBox ID="TBFech352" runat="server" Width="80px" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFech352" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />
                            SEG. INTERVENCIÓN
                            <asp:TextBox ID="TBFech353" runat="server" Width="80px" MaxLength="10" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TBFech353" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <br />
	                        <asp:LinkButton ID="LBguardarCanInc35" runat="server" CssClass ="btn btn-success" CommandArgument='<%# Eval("ID") & "-" & DirectCast(Container,GridViewRow).RowIndex.toString %>'
                                onclick="LBguardarCanInc35_Click" >GUARDAR</asp:LinkButton>
                            <asp:LinkButton ID="LBCerrarActCanInc" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" >CANCELAR</asp:LinkButton>
                            <%--CONTENIDO FIN--%>
                        </asp:Panel>
                        <asp:RoundedCornersExtender ID="RCE1CanInc" runat="server" Enabled="True" Radius="15" TargetControlID="PanelActCanInc"></asp:RoundedCornersExtender>
                        <%--fin actualizacion--%>
                        <asp:LinkButton ID="LBReg3135" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_REGRESAR31") %>'>REGRESAR A 31</asp:LinkButton>&nbsp;&nbsp;/&nbsp;&nbsp;
                        <asp:LinkButton ID="LBSegInter35" runat="server" PostBackUrl='<%# "~/cobrosv2/" & Eval("VURL_SEG_INTERVEN") %>'>SEGU. INTERVENCION</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--SOLICITA CHEQUE 35=11
SELECT 
[FI_CODEBAR] AS CODEBAR
,substring([FI_CODEBAR],1,10) AS REGPAT
,F11_FECH_RPP AS F_OFICIO_RPP_35
,sirecacobros.dbo.diasInabiles(F11_FECH_RPP,getdate()) AS DIAS_HABIL_OFI_RPP
,F11_FECH_NOM_INTERV AS F_NOMBRE_INTERVENTARIO_35
,F11_FECH_NOTI_INTERV AS F_NOTIFICACION_INTERVENCION_35
,F11_FECH_SEG_INTERV AS F_SEGUIMIENTO_INTERVENCION_35
,'default.aspx?rc=9&amp;r='+SUBSTRING([FI_CODEBAR],1,10) as VURL_REGRESAR31
,'default.aspx?rc=10&amp;r='+SUBSTRING([FI_CODEBAR],1,10) as VURL_SEG_INTERVEN
,FI_ID AS ID
FROM [sirecacobros].[dbo].[PAE_FECHAS]
WHERE [FI_INC]='35' AND FI_SUBDEL=?
AND EXISTS(SELECT TOP 1 [CODE_BAR] FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [CODE_BAR]=SUBSTRING([FI_CODEBAR],1,16) AND ACTIVO=1)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
  </div>
</div>
</center>
</asp:Content >

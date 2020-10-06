<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="patroneselegidos.aspx.vb" Inherits="WebSIRECA.patroneselegidos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
hr.linea {
    border: 0;
    height: 1px;
    background-image: -webkit-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:    -moz-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:     -ms-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:      -o-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div class="btn-group input-prepend"> 
        <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px"></asp:DropDownList>        
        <span class="add-on">
        <asp:LinkButton ID="LBActTab" CssClass="label label-info form-inline" runat="server"><span class="icon-refresh icon-white"></span>&nbsp;Actualizar Tabla</asp:LinkButton>&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" CssClass="label label-info form-inline" runat="server" PostBackUrl="~/cobrosv2/asignacionescreditos.aspx"><span class="icon-print icon-white"></span>&nbsp;Asignación</asp:LinkButton>
        </span>
        <span class="add-on">
        ASIGNACIÓN:
        </span>
        <asp:TextBox ID="TBFechAsigIni" runat="server" MaxLength="10" Width="120px" 
            CssClass ="text-center" BorderColor="#BCC7D8" BorderStyle="Solid" 
            BorderWidth="1px" ></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFechAsigIni" Format="dd/MM/yyyy"></asp:CalendarExtender>
        <span class="add-on">
        <asp:LinkButton ID="LinkButton2" CssClass="label label-info form-inline" runat="server" ><span class="icon-download-alt icon-white"></span>&nbsp; Listado</asp:LinkButton>
        </span>
    </div>
  <div class="form-search">
  <div class="input-append">
      <asp:TextBox ID="TBRegpat" placeholder="REG.PATRONAL" 
          CssClass="span2 search-query text-center" runat="server" MaxLength="10"></asp:TextBox>
      <asp:LinkButton ID="LBBuscar" CssClass="btn" runat="server" 
          BorderColor="#DEE1E7" BorderStyle="Solid" BorderWidth="1px">Buscar</asp:LinkButton>
     
  </div>
  </div>
    </center>
    <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        AllowSorting="True" EmptyDataText="SIN IMPRESIONES PENDIENTES" 
        CssClass="table-hover" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="FECH_INS" HeaderText="ASIGNADO" ReadOnly="True" 
                SortExpression="FECH_INS" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="R_REGPATR" HeaderText="REGPATR" ReadOnly="True" 
                SortExpression="R_REGPATR" />
            <asp:BoundField DataField="R_CREDITOS" DataFormatString="{0:N0}" 
                HeaderText="CREDITOS" ReadOnly="True" SortExpression="R_CREDITOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="R_IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="R_IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CITATORIO" SortExpression="D_CIT_SUP">
                <ItemTemplate>
                <!-- Inicio Citatorios MANDAMIENTO -->
                    <asp:LinkButton ID="LBD1CopM" Visible='<%# IIF((Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2") and (Eval("D_MAN_SUP")="1" or Eval("D_MAN_SUP")="2"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=M"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP MAN.</asp:LinkButton>
                    <asp:LinkButton ID="LBD1RcvM" Visible='<%# IIF((Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3") and (Eval("D_MAN_SUP")="2" or Eval("D_MAN_SUP")="3"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=M"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV MAN.</asp:LinkButton>
                <!-- Inicio Citatorios AMPLIACION -->
                    <asp:LinkButton ID="LBD1CopA" Visible='<%# IIF((Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2") and (Eval("D_AMP_SUP")="1" or Eval("D_AMP_SUP")="2"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=A"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP AMP.</asp:LinkButton>
                    <asp:LinkButton ID="LBD1RcvA" Visible='<%# IIF((Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3") and (Eval("D_AMP_SUP")="2" or Eval("D_AMP_SUP")="3"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=A"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV AMP.</asp:LinkButton>
                <!-- Inicio Citatorios REMOCION -->
                    <asp:LinkButton ID="LBD1CopR" Visible='<%# IIF((Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2") and (Eval("D_REM_SUP")="1" or Eval("D_REM_SUP")="2"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=R"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP REM.</asp:LinkButton>
                    <asp:LinkButton ID="LBD1RcvR" Visible='<%# IIF((Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3") and (Eval("D_REM_SUP")="2" or Eval("D_REM_SUP")="3"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=R"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV REM.</asp:LinkButton>
                <!-- Inicio Citatorios CERRAJERO -->
                    <asp:LinkButton ID="LBD1CopJ" Visible='<%# IIF((Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2") and (Eval("D_CER_SUP")="1" or Eval("D_CER_SUP")="2"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="1" or Eval("D_CIT_SUP")="2","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=J"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP CER.</asp:LinkButton>
                    <asp:LinkButton ID="LBD1RcvJ" Visible='<%# IIF((Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3") and (Eval("D_CER_SUP")="2" or Eval("D_CER_SUP")="3"),"true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CIT_SUP")="2" or Eval("D_CIT_SUP")="3","javascript:window.open(""documento.aspx?d=citatorio&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=J"",""citatorio"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV CER.</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MANDAMIENTO" SortExpression="D_MAN_SUP">
                <ItemTemplate>
                    <asp:LinkButton ID="LBD1Cop0" Visible='<%# IIF(Eval("D_MAN_SUP")="1" or Eval("D_MAN_SUP")="2","true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_MAN_SUP")="1" or Eval("D_MAN_SUP")="2","javascript:window.open(""documento.aspx?d=mandamiento&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=M"",""mandamiento"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP</asp:LinkButton>
                    <asp:LinkButton ID="LBD1Rcv0" Visible='<%# IIF(Eval("D_MAN_SUP")="2" or Eval("D_MAN_SUP")="3","true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_MAN_SUP")="2" or Eval("D_MAN_SUP")="3","javascript:window.open(""documento.aspx?d=mandamiento&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=M"",""mandamiento"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AMPLIACION" SortExpression="D_AMP_SUP">
                <ItemTemplate>
                    <asp:LinkButton ID="LBD1Cop1" Visible='<%# IIF(Eval("D_AMP_SUP")="1" or Eval("D_AMP_SUP")="2","true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_AMP_SUP")="1" or Eval("D_AMP_SUP")="2","javascript:window.open(""documento.aspx?d=ampliacion&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=A"",""ampliacion"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP</asp:LinkButton>
                    <asp:LinkButton ID="LBD1Rcv1" Visible='<%# IIF(Eval("D_AMP_SUP")="2" or Eval("D_AMP_SUP")="3","true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_AMP_SUP")="2" or Eval("D_AMP_SUP")="3","javascript:window.open(""documento.aspx?d=ampliacion&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=A"",""ampliacion"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REMOCION" SortExpression="D_REM_SUP">
                <ItemTemplate>
                    <asp:LinkButton ID="LBD1Cop2" Visible='<%# IIF(Eval("D_REM_SUP")="1" or Eval("D_REM_SUP")="2","true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_REM_SUP")="1" or Eval("D_REM_SUP")="2","javascript:window.open(""documento.aspx?d=remocion&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP&citdoc=R"",""remocion"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP</asp:LinkButton>
                    <asp:LinkButton ID="LBD1Rcv2" Visible='<%# IIF(Eval("D_REM_SUP")="2" or Eval("D_REM_SUP")="3","true","false") %>' runat="server" CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_REM_SUP")="2" or Eval("D_REM_SUP")="3","javascript:window.open(""documento.aspx?d=remocion&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=RCV&citdoc=R"",""remocion"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;RCV</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CERRAJERO" SortExpression="D_CER_SUP">
                <ItemTemplate>
                    <asp:LinkButton ID="LBD1CopRcv3" runat="server" Visible='<%# IIF(Eval("D_CER_SUP")="1" or Eval("D_CER_SUP")="2" or Eval("D_CER_SUP")="3","true","false") %>' CssClass="label label-success form-inline" OnClick='<%# IIF(Eval("D_CER_SUP")="1" or Eval("D_CER_SUP")="2" or Eval("D_CER_SUP")="3","javascript:window.open(""documento.aspx?d=cerrajero&export=doc&r=" & Eval("R_REGPATR") & "&a=" & IIF(Eval("INSPECTOR")="","0","1") & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & "&codbar=" & Eval("CODE_BAR") & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&tp=%&citdoc=J"",""cerrajero"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");","") %>' ><span class='icon-print icon-white' ></span>&nbsp;COP y RCV</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACTUALIZAR CASO">
                <ItemTemplate>
<asp:LinkButton CssClass="label label-info form-inline" OnClick='<%# "javascript:window.open(""documento.aspx?d=ampliacion&export=doc&r=" & Eval("R_REGPATR") & "&a=0" & "&s=" & Eval("R_SUBDEL") & "&sector=" & Eval("sector") & "&dom=" & Eval("dom") & "&loc=" & Eval("loc") & "&inspec=" & Eval("ID_INSPECTOR") & "&fecha=" & Eval("FECH_INS") & "&codbar=" & Eval("CODE_BAR") & "&tp=COP"",""ampliacion"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1"");" %>' ID="LBReasignar" runat="server" ><span class="icon-refresh icon-white"></span>&nbsp;REASIGNAR</asp:LinkButton>
&nbsp;&nbsp;<asp:LinkButton CssClass="label label-info form-inline" ID="LBCImprecion" runat="server" ><span class="icon-refresh icon-white"></span>&nbsp;ACTUALIZAR</asp:LinkButton>
&nbsp;&nbsp;<asp:LinkButton CssClass="label label-info form-inline" ID="LBCerrarCasoPAE" CommandArgument='<%# Eval("R_SUBDEL") & "-" & Eval("R_REGPATR") & "-" & Eval("CODE_BAR") %>' runat="server" onclick="LBCerrarCasoPAE_Click" ><span class="icon-ok icon-white"></span>&nbsp;REVISAR</asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2CanInc" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBCImprecion" PopupControlID="PanelActCanInc" DropShadow="true" CancelControlID="LBCerrarActCanInc" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelActCanInc" runat="server" Height="400px" Width="700px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderActCanInc" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
        <br/>
        <%--<asp:Label ID="Label4CanInc" runat="server" Text="Pasar con INC" Font-Size="18" Font-Bold="True"></asp:Label>--%>
       <%-- <hr/>--%>
	</asp:Panel>
    <%--CONTENIDO INICIO--%>
        <asp:DropDownList ID="DDLCierre" runat="server" Font-Size="9pt">
            <asp:ListItem >REMATE</asp:ListItem>
            <asp:ListItem >CONVENIO</asp:ListItem>
            <asp:ListItem Value="EMISION" >EMISIONES</asp:ListItem>
            <asp:ListItem Value="EJEC_FISCAL" >EJECUCION FISCAL</asp:ListItem>
            <asp:ListItem >IMPEDIMENTO</asp:ListItem>
            <asp:ListItem Value="INTERVENCION" >SECCION DE INTERVENCIONES</asp:ListItem>
        </asp:DropDownList><br/>
        <table class="table table-hover" cellpadding="0" cellspacing="0">
        <tr>
        <td><asp:Panel ID="Pa43" runat="server" HorizontalAlign="Left" Font-Size="9">
            <asp:RadioButton CssClass="form-inline" ID="RB43" runat="server" GroupName="inc" Text="(43)Embargo depo. banca." ToolTip="43" Checked="True" />
            Fecha Evio Oficio:
            <asp:TextBox ID="TBFechOfiConve8" runat="server" Width="80px" MaxLength="10" 
                oninit="TBFechOfiConve8_Init" ></asp:TextBox>
            <asp:CalendarExtender ID="CEFechOfiConve8" runat="server" TargetControlID="TBFechOfiConve8" Format="dd/MM/yyyy"></asp:CalendarExtender>
        </asp:Panel></td>
        </tr>
        <tr>
        <td><asp:Panel ID="Panel35" runat="server" HorizontalAlign="Left" Font-Size="9">
            <asp:RadioButton CssClass="form-inline" ID="RB35" runat="server" GroupName="inc" Text="(35)Embargo de Negociacion." ToolTip="35" />
            Fecha Oficio R.P.P.:
            <asp:TextBox ID="TBFechRpp11" runat="server" Width="80px" MaxLength="10" 
                oninit="TBFechRpp11_Init" ></asp:TextBox>
            <asp:CalendarExtender ID="CEFechRpp11" runat="server" TargetControlID="TBFechRpp11" Format="dd/MM/yyyy"></asp:CalendarExtender>
        </asp:Panel></td>
        </tr>
        <tr>
        <td><asp:Panel ID="Pa34" runat="server" HorizontalAlign="Left" Font-Size="9">
            <asp:RadioButton CssClass="form-inline" ID="RB34" runat="server" GroupName="inc" Text="(34)Embargo de bienes inmuebles" ToolTip="34" />
            &nbsp;FECHA R.P.P.:<asp:TextBox ID="TBFechInscrip25" runat="server" 
                Width="80px" MaxLength="10" oninit="TBFechInscrip25_Init" ></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TBFechInscrip25" Format="dd/MM/yyyy"></asp:CalendarExtender>
        </asp:Panel></td>
        </tr>
        <tr>
        <td><asp:Panel ID="Pa32" runat="server" HorizontalAlign="Left" Font-Size="9">
            <asp:RadioButton CssClass="form-inline" ID="RB32" runat="server" GroupName="inc" Text="(32)Emb. bienes mueb. deps. ajenas IMSS" ToolTip="32" />
            Fecha Req.: <asp:TextBox ID="TBFechReque10" runat="server" Width="80px" 
                MaxLength="10" oninit="TBFechReque10_Init" ></asp:TextBox>
            <asp:CalendarExtender ID="CETBFechReque10" runat="server" TargetControlID="TBFechReque10" Format="dd/MM/yyyy"></asp:CalendarExtender>
            y Hora: <asp:DropDownList ID="DDLHoraReque10" runat="server" Width="100px" 
                oninit="DDLHoraReque10_Init">
            </asp:DropDownList>
        </asp:Panel></td>
        </tr>
        <tr>
        <td><asp:Panel ID="PaO" runat="server" HorizontalAlign="Left" Font-Size="9">
            <asp:RadioButton CssClass="form-inline" ID="RBO" runat="server" GroupName="inc" Text="OTRO" ToolTip="O" />
        </asp:Panel></td>
        </tr>
        </table>
	<asp:LinkButton ID="LBguardarCanInc" runat="server" CssClass ="btn btn-success" CommandArgument='<%# Eval("R_SUBDEL") & "-" & Eval("R_REGPATR") & "-" & Eval("ID_INSPECTOR") & "-" & DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("CODE_BAR") %>'
        onclick="LBguardarCanInc_Click" >GUARDAR</asp:LinkButton>
    <asp:LinkButton ID="LBCerrarActCanInc" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" >CANCELAR</asp:LinkButton>
    <%--CONTENIDO FIN--%>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1CanInc" runat="server" Enabled="True" Radius="15" TargetControlID="PanelActCanInc"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#46A1BE" CssClass="btn-info" ForeColor="White" />
        <PagerSettings PageButtonCount="40" Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @REGPAT AS VARCHAR(15)
SET @SUBDEL=? 
SET @REGPAT=?
select 
R_SUBDEL,FECH_INS,ID_INSPECTOR,INSPECTOR,R_REGPATR,R_CREDITOS,R_IMPORTE,D_CIT_SUP,D_MAN_SUP,D_AMP_SUP,D_REM_SUP,D_CER_SUP,FECH_SUP,CODE_BAR,CODE_QR,sector,replace(dom,'#','') as dom,loc
from (
SELECT
[R_SUBDEL],convert(nvarchar,[FECH_INS],103) as [FECH_INS]
,isnull(max(ID_INS),'') as ID_INSPECTOR
,isnull((select upper(nombre) from fiscamovil.dbo.usuarios as uff where uff.id=(case when max(ID_INS)='' then -1 else max(ID_INS) end)),'') as INSPECTOR
,REPLACE([R_REGPATR],'-','') AS [R_REGPATR]
,count([R_NUMCRED]) as R_CREDITOS
,sum([R_IMPORTE]) as R_IMPORTE
,(case 
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='COP' and MAX([D_CIT_SUP])='1' then '1'
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='RCV' and MAX([D_CIT_SUP])='1' then '2'
when MIN([R_TIPO])='RCV' and MAX([R_TIPO])='RCV' and MAX([D_CIT_SUP])='1' then '3'
else '0' end) as [D_CIT_SUP]
,(case 
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='COP' and MAX([D_MAN_SUP])='1' then '1'
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='RCV' and MAX([D_MAN_SUP])='1' then '2'
when MIN([R_TIPO])='RCV' and MAX([R_TIPO])='RCV' and MAX([D_MAN_SUP])='1' then '3'
else '0' end) as [D_MAN_SUP]
,(case 
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='COP' and MAX([D_AMP_SUP])='1' then '1'
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='RCV' and MAX([D_AMP_SUP])='1' then '2'
when MIN([R_TIPO])='RCV' and MAX([R_TIPO])='RCV' and MAX([D_AMP_SUP])='1' then '3'
else '0' end) as [D_AMP_SUP]
,(case 
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='COP' and MAX([D_REM_SUP])='1' then '1'
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='RCV' and MAX([D_REM_SUP])='1' then '2'
when MIN([R_TIPO])='RCV' and MAX([R_TIPO])='RCV' and MAX([D_REM_SUP])='1' then '3'
else '0' end) as [D_REM_SUP]
,(case 
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='COP' and MAX([D_CER_SUP])='1' then '1'
when MIN([R_TIPO])='COP' and MAX([R_TIPO])='RCV' and MAX([D_CER_SUP])='1' then '2'
when MIN([R_TIPO])='RCV' and MAX([R_TIPO])='RCV' and MAX([D_CER_SUP])='1' then '3'
else '0' end) as [D_CER_SUP]
,MAX([FECH_SUP]) as [FECH_SUP]
,MAX([CODE_BAR]) AS [CODE_BAR]
,MAX([CODE_QR]) AS [CODE_QR]
FROM [sirecacobros].[dbo].[PAE_CRED]
WHERE R_SUBDEL=@SUBDEL and [ACTIVO]=1111
group by [R_SUBDEL],[R_REGPATR],convert(nvarchar,[FECH_INS],103)
) as rt left join sireca.dbo.patrones as ptn
on rt.r_regpatr=ptn.regpat
WHERE rt.r_regpatr like @REGPAT
order by [FECH_SUP] DESC
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter DefaultValue="%" Name="?" ControlID="TBRegpat" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

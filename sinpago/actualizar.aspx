<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="actualizar.aspx.vb" Inherits="WebSIRECA.actualizar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="btn-group input-prepend">
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px" CssClass="btn dropdown-toggle">
                            </asp:DropDownList>
<span class="add-on">
                            <asp:Label ID="Label1" runat="server" Text="PERIODO:"></asp:Label>
</span>
                            <asp:DropDownList ID="DDLMes" runat="server" Width="120px" CssClass="btn dropdown-toggle">
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
				<asp:ListItem Value="05">Mayo</asp:ListItem>
				<asp:ListItem Value="06">Junio</asp:ListItem>
				<asp:ListItem Value="07">Julio</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" data-toggle="dropdown" Width="80px" CssClass="btn dropdown-toggle">
                            </asp:DropDownList> 
<asp:TextBox ID="TBBusqueda" runat="server" MaxLength="100"></asp:TextBox>
<asp:LinkButton ID="BActualizarRGeneral" CssClass="btn" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
<asp:LinkButton ID="LBDescargar" CssClass="btn" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" BorderWidth="1px"><i class="icon-download"></i>&nbsp;Descargar</asp:LinkButton>
<asp:LinkButton ID="LBDescargar0" CssClass="btn" runat="server" BorderColor="#5D7BAC" BorderStyle="Solid" 
                                BorderWidth="1px" PostBackUrl="~/sinpago/cargardiligenciassinpago.aspx"><i class="icon-upload"></i>&nbsp;Cargar DILIGENCIAS</asp:LinkButton>
</div> 
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="50">
    <ProgressTemplate>
    Actualizando        
    </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>  
        <asp:GridView ID="GridViewSP" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceSP" Font-Size="10pt" HorizontalAlign="Center" 
        AllowPaging="True" AllowSorting="True" PageSize="20">
        <Columns>
            <asp:BoundField DataField="REG_PATRONAL" HeaderText="REG_PATRONAL" 
                ReadOnly="True" SortExpression="REG_PATRONAL" />
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" />
            <asp:BoundField DataField="PERIODOV" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODOV" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SECTOR" DataFormatString="{0:N0}" 
                HeaderText="SECTOR" ReadOnly="True" SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                SortExpression="INC">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                SortExpression="DILIGENCIA" />
            <asp:BoundField DataField="FECH_DILIGENCIA" DataFormatString="{0:d}" 
                HeaderText="FECH_DILIGENCIA" ReadOnly="True" SortExpression="FECH_DILIGENCIA" />
            <asp:TemplateField>
                <ItemTemplate>
<%--inicio--%>

    <asp:LinkButton ID="LBHF" runat="server" >
        <i class ="icon-pencil"></i>
    </asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBHF" PopupControlID="PanelAct" DropShadow="true" CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" BackColor="#EAA32D" Height="260px" 
            Width="680px" Font-Size="11pt" CssClass="btn-danger" >
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Right" Font-Strikeout="False" Font-Underline="False">
	<asp:LinkButton ID="LBCerrarAct" runat="server" Font-Underline="False" 
            ForeColor="White">cerrar&nbsp;&nbsp;</asp:LinkButton>
	</asp:Panel>
      <asp:Label ID="Label2" runat="server" Text="DILIGENCIA"></asp:Label>
      <asp:DropDownList ID="DDLDili" runat="server" DataSourceID="SqlDataSourceDili" DataTextField="texto" DataValueField="valor">
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSourceDili" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
          ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as valor
,[ACTIVIDAD] as texto
FROM [sireca].[dbo].[catalogo]
WHERE [CVE_SIN_PAGO]='1'
order by texto"></asp:SqlDataSource>
      <asp:TextBox ID="TBFDili" CssClass ="btn" runat="server" Width ="100" Text ='<%# Now.ToShortDateString %>'></asp:TextBox>
      <asp:CalendarExtender ID="TBFDili_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFDili"></asp:CalendarExtender>
      <asp:LinkButton ID="LBguardar" runat="server" CssClass ="btn btn-primary" OnClick="LBguardar_Click" ToolTip ='<%# Eval("REG_PATRONAL") & Eval("CREDITO") & Eval("PERIODO") %>'>Guardar</asp:LinkButton>
      <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>          
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
        <%--fin actualizacion--%>
<!-- Modal -->
<%--<asp:Panel ID="PanelAct" runat="server" Visible ="false" >

  </div> 
</asp:Panel>--%>
                    <%--fin--%>
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TEL.">
                <ItemTemplate>
                    <asp:HiddenField ID="HFRegptx" runat="server" Value ='<%# Eval("REG_PATRONAL") %>' />
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourceTel">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("info") %>' Font-Bold="True" ForeColor="#35496A"></asp:Label>
                    <br />
                    </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSourceTel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [info]
FROM [firmaDigital].[dbo].[info]
where [tipo]='3' and [regpat]=substring(?,1,10)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HFRegptx" DefaultValue="abcdefghij" Name="?" 
                                PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
            <PagerSettings Position="TopAndBottom" PageButtonCount="50" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceSP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @DEL AS VARCHAR(2)
DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @MES AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @ANIO2 AS VARCHAR(2)
DECLARE @RALECOP AS VARCHAR(15)
DECLARE @BUSCAR AS VARCHAR(50)
SET @DEL =?
SET @SUBDEL =?
SET @MES =?
SET @ANIO =?
SET @BUSCAR=?
SET @ANIO2 =(SELECT SUBSTRING(@ANIO,3,2))
SET @RALECOP = (select top 1 name from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
exec('
select
substring(EMIP_PATRON,2,11) as REG_PATRONAL
,TD
,INC
,NUMCRED as CREDITO
,PERIODO
,substring(PERIODO,4,7) as PERIODOV
,IMPORTE as IMPORTE
,EMIP_NOM_PATRON as RAZON_SOCIAL
,convert(varchar(50),EMIP_NUM_TRAB_COT) as COTIZANTES
,convert(varchar(50),EMIP_SEC) as SECTOR
,(
SELECT TOP 1 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[SP_DILI])
FROM [sireca].[dbo].[C_SIN_PAGO]
WHERE substring([SP_REGPAT],1,10)=substring(EMIP_PATRON,2,10)
AND [SP_CREDITO]= NUMCRED
AND [SP_PERIODO]=PERIODO
ORDER BY [SP_FECH_DILI] DESC
) AS DILIGENCIA
,(
SELECT TOP 1 [SP_FECH_DILI]
FROM [sireca].[dbo].[C_SIN_PAGO]
WHERE substring([SP_REGPAT],1,10)=substring(EMIP_PATRON,2,10)
AND [SP_CREDITO]= NUMCRED
AND [SP_PERIODO]=PERIODO
ORDER BY [SP_FECH_DILI] DESC
) AS FECH_DILIGENCIA
FROM [sireca].[dbo].[EMMA'+@DEL+@SUBDEL+@MES+@ANIO2+']
left join rale.dbo.['+@RALECOP+']
on replace([REGPATR],''-'','''')=substring(EMIP_PATRON,2,10) and [PERIODO]=''01/'+@MES+'/'+@ANIO+'''
where 
pagos is null
and (EMIP_PATRON like ''%'+@BUSCAR+'%'' or NUMCRED like ''%'+@BUSCAR+'%'' or EMIP_NOM_PATRON like ''%'+@BUSCAR+'%'')
and td in (''02'',''01'')
and not EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO]
WHERE [RCP_IMP_COP]&gt;0 and RCP_SUB like ''+@SUBDEL+''
AND substring([RCP_REGPAT],1,10)=substring(EMIP_PATRON,2,10) and (''01/''+substring([RCP_PER],6,2)+''/''+substring([RCP_PER],1,4))=PERIODO
)
--and inc not in (''00'')
')
">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="33" Name="?" SessionField="SIRECAdel" />
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBBusqueda" DefaultValue="%" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:HiddenField ID="HFid" runat="server" />
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

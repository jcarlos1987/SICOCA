<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="segundaconfirmacion.aspx.vb" Inherits="WebSIRECA.segundaconfirmacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="Content2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
        AutoPostBack="True" Width="100px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="FOLIO:"></asp:Label>
</span> 
<asp:DropDownList ID="DDLFolio" runat="server" 
            DataSourceID="SqlDataSourceFolio" DataTextField="V_FOLIO_P1" 
            DataValueField="V_FOLIO_P1" Width="120px">
        </asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" runat="server" CssClass="btn" BackColor="#BCC7D8"><i class="icon-refresh"></i>&nbsp;ACTUALIZAR</asp:LinkButton>
    <asp:LinkButton ID="LBPrint" runat="server" CssClass="btn" BackColor="#BCC7D8"><i class="icon-print"></i>&nbsp;IMPRIMIR</asp:LinkButton>
</span>
</div> 
        <asp:SqlDataSource ID="SqlDataSourceFolio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT DISTINCT [V_FOLIO_P1]
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL LIKE ? AND [V_FECHA_P2_TURNADO] IS NULL
AND [V_FOLIO_P1] IS NOT NULL
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAValidar2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceAValidar2" AllowSorting="True" Font-Size="9pt" 
            HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="N" HeaderText="N°" SortExpression="N">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIO_P1" HeaderText="FOLIO_P1" ReadOnly="True" 
                    SortExpression="FOLIO_P1" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO_ECO" HeaderText="TIPO_ECO" ReadOnly="True" 
                    SortExpression="TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ID_CAPTURO" HeaderText="ID_CAPTURO" ReadOnly="True" 
                    SortExpression="ID_CAPTURO" />
                <asp:BoundField DataField="FECHA_ASIGNACION" HeaderText="FECHA ASIGNACION" 
                    ReadOnly="True" SortExpression="FECHA_ASIGNACION" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_CAPTURA" HeaderText="INC_CAPTURA" 
                    ReadOnly="True" SortExpression="INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_CAPTURA" HeaderText="FECHA_CAPTURA" 
                    ReadOnly="True" SortExpression="FECHA_CAPTURA" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="SECTOR" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
<asp:LinkButton ID="LBHF" runat="server" ><i class ="icon-ok"></i></asp:LinkButton>
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBHF" PopupControlID="PanelAct" DropShadow="true" CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" Height="300px" Width="400px" Font-Size="11pt" HorizontalAlign="Center" BackColor="#FFE8A6">
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False">
        <br/>
        <asp:Label ID="Label4" runat="server" Text="Confirme su Verificación" Font-Size="14" Font-Bold="True"></asp:Label>
        <hr/>
	</asp:Panel>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="INC. CAPTURADA:"></asp:Label>
</span> 
<asp:DropDownList ID="DDLIncF" runat="server" DataSourceID="SqlDataSourceIncF" DataTextField="texto" DataValueField="valor" Width="150">
</asp:DropDownList>
</div>
<center>
    <asp:Label ID="LMesage" runat="server"></asp:Label></center>
    <asp:Panel ID="PanelObserv" runat="server" GroupingText="Observacion:">
        <asp:TextBox ID="TBObserv" runat="server" MaxLength="500" TextMode="MultiLine" Width="270"></asp:TextBox>
        <br />
        <asp:LinkButton ID="LBguardar" runat="server" CssClass ="btn btn-success" OnClick="LBguardar_Click" Height="38" CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex.toString & "-" & Eval("V_ID") %>' ><i class="icon-ok"></i><br/>CONFIRMAR</asp:LinkButton>
        <asp:LinkButton ID="LBCerrarAct" runat="server" CssClass ="btn btn-danger" Font-Underline="False" ForeColor="White" Height="38"><i class="icon-remove"></i><br/>CANCELAR</asp:LinkButton>
    </asp:Panel> 
<br />
	<asp:SqlDataSource ID="SqlDataSourceIncF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as valor
,[ACTIVIDAD] as texto
FROM [sireca].[dbo].[catalogo]
WHERE [CVE_VERIFI_EMISION]=1
"></asp:SqlDataSource>
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceAValidar2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FOLIO AS VARCHAR(15)
SET @SUBDEL=?
SET @FOLIO=?

SELECT 
ROW_NUMBER() OVER(order by [V_REGPAT] ) as N
,V_ID
     , [V_FOLIO_P1] AS FOLIO_P1
      ,[V_SUBDEL] AS SUBDEL
      ,[V_TIPO_ECO] AS TIPO_ECO
      ,[V_REGPAT] AS REGPAT
      ,[V_RAZON_SOCIAL] AS RAZON_SOCIAL
      ,[V_CREDITO] AS CREDITO
      ,[V_COTIZ] AS COTIZ
      ,[V_OMISION] AS IMPORTE
      ,[V_PERIODO] AS PERIODO
      ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[V_ID_CAPTURO]) AS ID_CAPTURO
      ,[V_FECHA_ASIGNACION] AS FECHA_ASIGNACION
      ,[V_INC_CAPTURA] AS INC_CAPTURA
      ,[V_FECHA_CAPTURA] AS FECHA_CAPTURA
      ,[V_SECTOR] AS SECTOR
      ,[V_CONFIRMO_INC_P2] AS CONFIRMO_INC_P2
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE V_SUBDEL=@SUBDEL
  and V_FOLIO_P1=@FOLIO
and [V_CONFIRMO_INC_P2] is null">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLFolio" DefaultValue="99999" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>    
    </div>
</asp:Content>

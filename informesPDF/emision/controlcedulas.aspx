<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="controlcedulas.aspx.vb" Inherits="WebSIRECA.controlcedulas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
	<script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
	<script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="120px" >
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="FOLIOS CREADOS DEL "></asp:Label>
</span>
<asp:TextBox ID="TBFechIni" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
<asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechIni">
</asp:CalendarExtender>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text=" AL "></asp:Label>
</span>
<asp:TextBox ID="TBFechFin" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
<asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechFin"></asp:CalendarExtender>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" runat="server" CssClass="btn" BackColor="#BCC7D8">ACTUALIZAR</asp:LinkButton>
</span> 
</div>
</center>
    <asp:GridView ID="GridViewCedulas" runat="server" HorizontalAlign="Center" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceCedulas">
        <Columns>
            <asp:BoundField DataField="TIPO_CEDULA" HeaderText="TIPO DE FOLIO" 
                ReadOnly="True" SortExpression="TIPO_CEDULA" />
            <asp:HyperLinkField DataNavigateUrlFields="VSUBDEL,VFECHA_INI,VFECHA_FIN,VTIPO_CEDULA" 
                DataNavigateUrlFormatString="controlcedulasdetalle.aspx?subdel={0}&amp;fechaini={1}&amp;fechafin={2}&amp;tipocedula={3}" 
                DataTextField="CASOS" DataTextFormatString="{0:N0}" HeaderText="CASOS" 
                NavigateUrl="~/informesPDF/emision/controlcedulasdetalle.aspx" 
                SortExpression="CASOS" Target="_blank">
            <ItemStyle HorizontalAlign="Right" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCedulas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECHA_INI AS DATETIME
DECLARE @FECHA_FIN AS DATETIME
SET @SUBDEL=?
SET @FECHA_INI=?
SET @FECHA_FIN=?

SELECT 
@SUBDEL AS VSUBDEL
,convert(nvarchar(10),@FECHA_INI,103) AS VFECHA_INI
,convert(nvarchar(10),@FECHA_FIN,103) AS VFECHA_FIN
,(CASE 
WHEN [V_INC_CAPTURA]='2' THEN '2'
WHEN [V_INC_CAPTURA]='9' THEN '9'
ELSE 'PAGADO'
END) AS VTIPO_CEDULA
,(CASE 
WHEN [V_INC_CAPTURA]='2' THEN '2'
WHEN [V_INC_CAPTURA]='9' THEN '9'
ELSE 'PAGADO'
END) AS TIPO_CEDULA
,COUNT(DISTINCT([V_FOLIO_P1])) AS CASOS
FROM [sirecaemisiones].[dbo].[eco]
WHERE V_SUBDEL=@SUBDEL
AND [V_FECHA_P1_TURNADO] BETWEEN @FECHA_INI AND @FECHA_FIN
GROUP BY (CASE 
WHEN [V_INC_CAPTURA]='2' THEN '2'
WHEN [V_INC_CAPTURA]='9' THEN '9'
ELSE 'PAGADO'
END)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

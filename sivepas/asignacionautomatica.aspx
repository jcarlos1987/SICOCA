<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="asignacionautomatica.aspx.vb" Inherits="WebSIRECA.asignacionautomatica" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<h4>Asignados</h4> 
    <div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" Width="100px" AutoPostBack="True" >
    </asp:DropDownList>
    <span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="SIVEPAS ASIGNADOS CON FECHAS"></asp:Label>
    </span>
        <asp:DropDownList ID="DDLFechIni" runat="server" Width="150px" DataSourceID="SqlDataSourceFecAsig" 
        DataTextField="texto" DataValueField="texto">
        </asp:DropDownList>
    <span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="AL"></asp:Label>
    </span> 
    <asp:DropDownList ID="DDLFechFin" runat="server" Width="150px" DataSourceID="SqlDataSourceFecAsig" DataTextField="texto" DataValueField="texto">
    </asp:DropDownList>
    <span class="add-on">
        <asp:LinkButton ID="BActualizarRGeneral" CssClass="btn" runat="server" 
            BackColor="#9CAAC1" ><i class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
    </span> 
</div> 
        <asp:SqlDataSource ID="SqlDataSourceFecAsig" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 20
CONVERT(VARCHAR(10),CPSV_FECH_ASIG,103) AS texto
FROM [sirecasivepas].dbo.SV_CPATRONAL LEFT JOIN sireca.dbo.patrones on substring(CPSV_REGPAT,1,10)=regpat
WHERE CPSV_SUBDEL=?
and CPSV_FECH_ASIG is not null
group by CONVERT(VARCHAR(10),CPSV_FECH_ASIG,103)
order by convert(datetime,CONVERT(VARCHAR(10),CPSV_FECH_ASIG,103),103) desc
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

 <asp:GridView ID="GridViewInspectores" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceInspectores" 
                    BorderColor="#35496A" CellPadding="1" CellSpacing="1" 
                    CssClass="table-bordered" BorderStyle="Solid" BorderWidth="1px" 
                    Caption="&lt;string&gt;INSPECTORES&lt;/string&gt;">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="SECTORES" HeaderText="SECTORES" ReadOnly="True" 
                    SortExpression="SECTORES" />
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
<asp:HyperLink ID="HLInspectores" runat="server" NavigateUrl="#"><i class="icon-pencil"></i></asp:HyperLink>
<%--inicio actualizacion--%>
                        <asp:HiddenField ID="HFIdInspector" runat="server" Value ='<%# Eval("ID_USUARIO")%>' />
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="HLInspectores" PopupControlID="PanelAct" DropShadow="true" CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" BackColor="#EAA32D" Height="260px" 
            Width="480px" Font-Size="11pt" CssClass="btn-danger" >
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Right" Font-Strikeout="False" Font-Underline="False">
	<asp:LinkButton ID="LBCerrarAct" runat="server" Font-Underline="False" 
            ForeColor="White">cerrar&nbsp;&nbsp;</asp:LinkButton>
	</asp:Panel>
      <asp:Label ID="Label2" runat="server" Text='<%# "INSPECTOR: " & Eval("INSPECTOR")%>'></asp:Label><br />
<div class="btn-group input-prepend">
<span class="add-on">
      <asp:Label ID="Label5" runat="server" Text="SECTORE(S):" ForeColor="Black"></asp:Label>
</span> 
      <asp:TextBox ID="TBSectores" runat="server" Text ='<%# Eval("SECTORES")%>' Width="120"></asp:TextBox>
<span class="add-on">
      <asp:LinkButton ID="LBGuardar" runat="server" CssClass ="btn btn-primary"  
        CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex %>' 
        onclick="LBGuardar_Click">Guardar</asp:LinkButton>
</span> 
</div> 
      <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>          
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="HFIdUser" runat="server" Value ='<%# Eval("ID_USUARIO") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="vurl" 
                    DataNavigateUrlFormatString="imprimirasignacion.aspx{0}" 
                    Text="ver asignacion" />
            </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceInspectores" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
SET @SUBDEL=?
--INTERVALO FECHA DE ASIGNACION
SET @FECH_INI =?
SET @FECH_FIN =?

SELECT 
'?fechaini=' + @FECH_INI + '&amp;fechafin=' + @FECH_FIN +'&amp;idinspector=' + convert(nvarchar(10),uf.id) as vurl
,uf.id AS ID_USUARIO
,upper(uf.nombre) as INSPECTOR
,us.sectores AS SECTORES
,count([CPSV_INSPEC]) as PATRONES
FROM 
sireca.dbo.usuarios AS us 
INNER JOIN 
fiscamovil.dbo.Usuarios AS uf ON us.id = uf.id 
LEFT JOIN
(select * from
[sirecasivepas].[dbo].[SV_CPATRONAL]
where
CONVERT(VARCHAR(10),[CPSV_FECH_ASIG],103) BETWEEN CONVERT(DATETIME,@FECH_INI,103) AND CONVERT(DATETIME,@FECH_FIN,103)
and CPSV_SUBDEL=@SUBDEL
)as svcp ON us.id=[CPSV_INSPEC]
WHERE us.subdel = @SUBDEL AND us.user_type in ('1')
GROUP BY uf.id,uf.nombre,us.sectores
ORDER BY INSPECTOR
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFechIni" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
<hr />
<h4>Para Asignar</h4>
<div class="btn-group input-prepend">
                    <span class="add-on">
                    <asp:Label ID="Label3" runat="server" Text="SIVEPAS GENERADAS"></asp:Label>
                    </span>
                    <asp:DropDownList ID="DDLFSIni" runat="server" 
                        DataSourceID="SqlDataSourceFecSive" DataTextField="texto" 
                        DataValueField="texto" Width="130px" AutoPostBack="True" >
                    </asp:DropDownList>
                    <span class="add-on">
                    <asp:Label ID="Label4" runat="server" Text="AL"></asp:Label>
                    </span> 
                    <asp:DropDownList ID="DDLFSFin" runat="server" 
                        DataSourceID="SqlDataSourceFecSive" DataTextField="texto" 
                        DataValueField="texto" Width="130px" AutoPostBack="True" >
                    </asp:DropDownList>
                    <asp:TextBox ID="TBBuscador" runat="server" placeholder="REG.PAT." MaxLength="20" Width="90px"></asp:TextBox>
                    <span class="add-on">
                    <asp:LinkButton ID="BActualizarRGeneral0" runat="server" CssClass="btn" 
                        BackColor="#9CAAC1"><i 
                        class="icon-refresh"></i>&nbsp;BUSCAR</asp:LinkButton>
                    </span> 
                    </div> 
<asp:SqlDataSource ID="SqlDataSourceFecSive" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 15 
CONVERT(NVARCHAR(10),[SV_FECHA],103) AS texto
FROM [sirecasivepas].[dbo].[SV_BASE] LEFT JOIN sireca.dbo.patrones on substring([SV_REG_PATRONAL],1,10)=regpat
WHERE [SV_SUBDEL]=?
group by [SV_FECHA]
order by [SV_FECHA] desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01/01/2000" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
<br />
<div class="btn-group input-prepend">
    <span class="add-on">
        <asp:Label ID="Label6" runat="server" Text="Asignar por inspector:"></asp:Label>
    </span>
    <asp:DropDownList ID="DDLPatAsignar" runat="server" Width="80px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                        </asp:DropDownList>
    <span class="add-on">
        <asp:Label ID="Label7" runat="server" Text=" patrone(s)"></asp:Label>
    </span>
    <asp:DropDownList ID="DDLAnuExtOpor" runat="server" Width="120px" 
        AutoPostBack="True" Font-Size="9pt">
        <asp:ListItem Value="SIVEPA_ANUAL">ANUAL</asp:ListItem>
        <asp:ListItem Value="SIVEPA_EXTEM">EXTEMPORANEO</asp:ListItem>
        <asp:ListItem Value="SIVEPA_OPORT">OPORTUNO</asp:ListItem>
        <asp:ListItem Value="%">TODOS</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DDLCopRcv" runat="server" Width="120px" 
        AutoPostBack="True" Font-Size="9pt">
        <asp:ListItem Value="SIVEPA-IMSS">C.O.P.</asp:ListItem>
        <asp:ListItem Value="SIVEPA-RCV">R.C.V.</asp:ListItem>
        <asp:ListItem Value="%">C.O.P. Y R.C.V.</asp:ListItem>
    </asp:DropDownList>
    <span class="add-on">
    <asp:LinkButton ID="LBAsingAutomat" runat="server" CssClass="btn" 
        BackColor="#9CAAC1"><i class="icon-refresh"></i>&nbsp;ASIGNAR</asp:LinkButton>
    </span> 
    </div> 
<asp:Panel ID="PanelSinAccion" runat="server" Height="400px" ScrollBars="Auto">
    <asp:GridView ID="GridViewSinAccion" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceSinAccion" AllowSorting="True" 
                        BorderColor="#293955" BorderStyle="Solid" CellPadding="1" CellSpacing="1" 
                        CssClass="table-bordered" Font-Size="9pt" AllowPaging="True" 
                        BorderWidth="1px" 
        Caption="&lt;strong&gt;POR ASIGNAR&lt;/strong&gt;">
                        <Columns>
                            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                SortExpression="INSPECTOR" />
                            <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                                SortExpression="REGPAT" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                                SortExpression="CREDITO" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                                SortExpression="COTIZ" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                                SortExpression="SECTOR" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" ReadOnly="True" 
                                SortExpression="ADEUDO" DataFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PAGO" HeaderText="PAGO" ReadOnly="True" 
                                SortExpression="PAGO" DataFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SALDO" DataFormatString="{0:C}" HeaderText="SALDO" 
                                ReadOnly="True" SortExpression="SALDO">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField>                                
                                <ItemTemplate>
<asp:HyperLink ID="HLEditSFaltante" runat="server" NavigateUrl="#"><i class="icon-pencil"></i></asp:HyperLink>
                                    <asp:HiddenField ID="HFRegpat" runat="server" Value ='<%# Eval("REGPAT")%>' />
<%--inicio actualizacion--%>
<asp:ModalPopupExtender ID="MP2" runat="server" Enabled="True" BackgroundCssClass="modalBackground" 
                                        TargetControlID="HLEditSFaltante" PopupControlID="PanelAct" DropShadow="true" 
                                        CancelControlID="LBCerrarAct" ></asp:ModalPopupExtender>
<asp:Panel ID="PanelAct" runat="server" BackColor="#EAA32D" Height="260px" 
            Width="580px" Font-Size="11pt" CssClass="btn-danger" ScrollBars="Horizontal" HorizontalAlign="Center" >
	<asp:Panel ID="PanelHeaderAct" runat="server" HorizontalAlign="Right" 
        Font-Strikeout="False" Font-Underline="False">
	<asp:LinkButton ID="LBCerrarAct" runat="server" Font-Underline="False" 
            ForeColor="White">cerrar&nbsp;&nbsp;</asp:LinkButton>
	</asp:Panel>
    <asp:GridView ID="GridViewCredSAsig" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceCredSAsig">
        <Columns>
            <asp:TemplateField> 
                <ItemTemplate>
                    <asp:HiddenField ID="HFIdSiv" runat="server" Value ='<%# Eval("ID_SIV") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" />
            <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                ReadOnly="True" SortExpression="ADEUDO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                ReadOnly="True" SortExpression="PAGO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SALDO" DataFormatString="{0:C}" HeaderText="SALDO" 
                ReadOnly="True" SortExpression="SALDO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
      <asp:DropDownList ID="DDLDiliSSP" runat="server" DataSourceID="SqlDataSourceDiliSSP" 
                        DataTextField="texto" DataValueField="valor" Width="120">
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSourceDiliSSP" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
          ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [CVE DILIG#] as valor
,[ACTIVIDAD] as texto
FROM [sireca].[dbo].[catalogo]
WHERE [CVE_SIVEPA]='1'
order by texto"></asp:SqlDataSource>
                    <br />
                    <asp:TextBox ID="TBFDiliSSP" CssClass ="btn" ToolTip="Fecha de la Diligencia" 
                        runat="server" Width ="110" Text ='<%# Now.ToShortDateString %>' 
                        oninit="TBFDiliSSP_Init"></asp:TextBox>
                    <asp:CalendarExtender ID="TBFDili_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFDiliSSP"></asp:CalendarExtender>
                    <br />
                    <asp:TextBox ID="TBObservacion" ToolTip="Observacion de la diligencia" 
                        runat="server" placeholder="OBSERVACION" Width="110px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CBConfirm" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinkButton ID="LBGSSP" onclick="LBGSSP_Click" runat="server" 
        CssClass="btn" 
        CommandArgument ='<%# DirectCast(Container,GridViewRow).RowIndex %>' >GUARDAR</asp:LinkButton>
      <asp:SqlDataSource ID="SqlDataSourceCredSAsig" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @REGPAT AS VARCHAR(20)
DECLARE @SIVEPA AS VARCHAR(20)
DECLARE @TIPO_COP_RCV AS VARCHAR(20)
SET @SUBDEL = ?
--INTERVALO DE FECHAS EN QUE SE GENERARON LOS SIVEPAS
SET @FECH_INI = ?
SET @FECH_FIN = ?
SET @REGPAT=?
SET @SIVEPA=?
SET @TIPO_COP_RCV=?
SELECT 
[SV_ID] as ID_SIV
,substring(convert(varchar(10),SV_PERIODO,103),4,7) as PERIODO
,([SV_CREDITO]) AS CREDITO
,([SV_EMI_REAL]) as ADEUDO
,([SV_RECAUDACION]) AS PAGO
,([SV_DIFERENCIA]) AS SALDO
FROM [sirecasivepas].[dbo].[SV_BASE]
left join 
sirecasivepas.dbo.SV_CPATRONAL on CPSV_REGPAT=[SV_REG_PATRONAL]
left join 
sireca.dbo.patrones on regpat=substring(sv_reg_patronal,1,10)
where [SV_CREDITO] is not null
and [SV_SUBDEL]=@SUBDEL
AND NOT EXISTS(SELECT [SVD_SV_ID] FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID])
and CONVERT(VARCHAR(10),[SV_FECHA],103) BETWEEN CONVERT(DATETIME,@FECH_INI,103) AND CONVERT(DATETIME,@FECH_FIN,103)
and [SV_REG_PATRONAL]=@REGPAT
and SV_TIPO like @SIVEPA
and SV_SIVEPA like @TIPO_COP_RCV
order by SECTOR,SALDO desc
">
          <SelectParameters>
              <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                  PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="DDLFSIni" DefaultValue="01/01/2000" Name="?" 
                  PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="DDLFSFin" DefaultValue="01/01/2000" Name="?" 
                  PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="HFRegpat" DefaultValue="abcdefg" Name="?" 
                  PropertyName="Value" />
              <asp:ControlParameter ControlID="DDLAnuExtOpor" DefaultValue="%" Name="?" 
                  PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="%" Name="?" 
                  PropertyName="SelectedValue" />
          </SelectParameters>
    </asp:SqlDataSource>      
</asp:Panel>
<asp:RoundedCornersExtender ID="RCE1" runat="server" Enabled="True" Radius="15" TargetControlID="PanelAct"></asp:RoundedCornersExtender>
<%--fin actualizacion--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Position="TopAndBottom" PageButtonCount="20" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceSinAccion" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @FECH_INI AS VARCHAR(10)
DECLARE @FECH_FIN AS VARCHAR(10)
DECLARE @BUSCADOR AS VARCHAR(20)
DECLARE @SIVEPA AS VARCHAR(20)
DECLARE @TIPO_COP_RCV AS VARCHAR(20)
SET @SUBDEL = ?
--INTERVALO DE FECHAS EN QUE SE GENERARON LOS SIVEPAS
SET @FECH_INI = ?
SET @FECH_FIN = ?
SET @BUSCADOR = ?
SET @SIVEPA=?
SET @TIPO_COP_RCV=?

SELECT 
(select upper(nombre) from fiscamovil.dbo.usuarios where id = max(CPSV_INSPEC)) as INSPECTOR
,[SV_REG_PATRONAL] AS REGPAT
,COUNT([SV_CREDITO]) AS CREDITO
,MAX([SV_COTIZ]) AS COTIZ
,SUM([SV_EMI_REAL]) as ADEUDO
,SECTOR
,SUM([SV_RECAUDACION]) AS PAGO
,SUM([SV_DIFERENCIA]) AS SALDO
FROM [sirecasivepas].[dbo].[SV_BASE]
left join 
sirecasivepas.dbo.SV_CPATRONAL on CPSV_REGPAT=[SV_REG_PATRONAL]
left join 
sireca.dbo.patrones on regpat=substring(sv_reg_patronal,1,10)
where [SV_CREDITO] is not null
and [SV_SUBDEL]=@SUBDEL
AND NOT EXISTS(SELECT [SVD_SV_ID] FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID])
and CONVERT(VARCHAR(10),[SV_FECHA],103) BETWEEN CONVERT(DATETIME,@FECH_INI,103) AND CONVERT(DATETIME,@FECH_FIN,103)
--and CPSV_INSPEC is null
and [SV_REG_PATRONAL] like '%'+@BUSCADOR+'%'
and SV_TIPO like @SIVEPA
and SV_SIVEPA like @TIPO_COP_RCV
GROUP BY SECTOR,[SV_REG_PATRONAL]
order by SECTOR,SALDO desc
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLFSIni" DefaultValue="01/01/2000" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLFSFin" DefaultValue="01/01/2000" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TBBuscador" DefaultValue="%" Name="?" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="DDLAnuExtOpor" DefaultValue="%" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="%" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</asp:Panel>
    
</center>
                   
</asp:Content>

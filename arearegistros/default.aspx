<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo3.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default49" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
    <div class="btn-group input-prepend">
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                Width="100px">
            </asp:DropDownList>
        <asp:TextBox ID="TBBuscar" runat="server" MaxLength="10" placeholder="REG. PATRONAL" 
            TabIndex="9" Width="130px"></asp:TextBox>
            <asp:LinkButton ID="LBBuscar" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CssClass="btn"><i class="icon-search"></i>&nbsp;BUSCAR</asp:LinkButton>
            <asp:LinkButton ID="LBAddCaso" runat="server" BorderColor="#BCC7D8" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="btn" 
                ToolTip="AGREGAR CASO NUEVO A LA MATRIZ 09"><i class="icon-plus"></i>&nbsp;AGREGAR CASO</asp:LinkButton>
            <span class="add-on">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" 
                PostBackUrl="~/arearegistros/casos.aspx" 
                ToolTip="LISTADO DE CASOS DE LA MATRIZ 09"><i class="icon-list"></i></asp:LinkButton>
            </span>
            <asp:LinkButton ID="LinkButton1" runat="server" BorderColor="#BCC7D8" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="btn" 
                PostBackUrl="~/arearegistros/cargarmatriz09.aspx" 
                ToolTip="CARGAR LA MATRIZ 09 DESDE UN ARCHIVO ZIP"><i class="icon-upload"></i>&nbsp;CARGAR MATRIZ</asp:LinkButton>
    </div> 
</center>
    <asp:SqlDataSource ID="SqlDataSourceG" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT  [G_ID] as ID
      ,[G_Subdel] as SUBDEL
      ,[G_Rango] AS RANGO
      ,[G_RegPat] AS REGPAT
      ,[G_RazonSocial] AS RAZON
      ,[G_ImporteCOP] AS IMPORTE_COP
      ,[G_FechaBaja] AS FECHA_BAJA
      ,(SELECT [C_SIGNIFICADO] FROM [sirecaregistros].[dbo].[NL_Catalogo] WHERE [C_GRUPO]='AREA_SOLICITA_LA_BAJA' AND [C_ID]=[G_AreaSolicitaLaBaja]) AS AREA_SOLICITO_BAJA
      ,(SELECT [C_SIGNIFICADO] FROM [sirecaregistros].[dbo].[NL_Catalogo] WHERE [C_GRUPO]='DOC_INFORMA_PATRON_ES_NL' AND [C_ID]=[G_DocInformaEsPatronNL]) AS DOC_INFORMA_PATRON_NL
      ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[G_ID_Integrador]) AS INTEGRADOR
      ,[G_FechaAsignacion] AS FECHA_ASIGNACION
  FROM [sirecaregistros].[dbo].[NL_General]
  WHERE [G_Subdel]=? and [G_RegPat]=?">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBBuscar" DefaultValue="ABCD" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewg" runat="server" AllowPaging="True" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceG" HorizontalAlign="Center" 
        PageSize="1" AutoGenerateColumns="False" ShowHeader="False">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text ="SUBDEL.:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text ='<%# Eval("SUBDEL") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label16" runat="server" Text =", FECHA DE LA BAJA:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text ='<%# Eval("FECHA_BAJA","{0:d}") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text =", RANGO" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text ='<%# Eval("RANGO") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label13" runat="server" Text =", IMPORTE C.O.P.:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text ='<%# Eval("IMPORTE_COP","{0:C}") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <br/>
                    <asp:Label ID="Label14" runat="server" Text ="REGISTRO PATRONAL:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text ='<%# Eval("REGPAT") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label15" runat="server" Text =", RAZON SOCIAL:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text ='<%# Eval("RAZON") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <%--<br/>
                    <asp:Label ID="Label19" runat="server" Text =" CASO ASIGNADO AL INTEGRADOR:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text ='<%# Eval("INTEGRADOR") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label20" runat="server" Text =" EN LA PROGRAMACION DE(L):" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text ='<%# Eval("FECHA_ASIGNACION","{0:d}") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <center >
    <asp:Wizard ID="WizardInfo" runat="server" Width="800px" ActiveStepIndex="0">
        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                CommandName="MovePrevious" Text="Previous" Visible="false" BorderColor="#BCC7D8" />
            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                Text="Finish" Visible="false"/>
        </FinishNavigationTemplate>
        <HeaderTemplate>
            <asp:Label ID="Label22" runat="server" Text="DATOS CARGADOS A MODIFICAR" Visible ="false"></asp:Label>            
        </HeaderTemplate>
        <SideBarStyle HorizontalAlign="Left" Width="150px" VerticalAlign="Top" />
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                Text="Next" Visible="false"  />
        </StartNavigationTemplate>
        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
                CommandName="MovePrevious" Text="Previous" Visible="false" />
            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                Text="Next" Visible="false"/>
        </StepNavigationTemplate>
        <StepStyle BorderColor="#BCC7D8" BorderStyle="Solid" />
        <WizardSteps>
            <asp:WizardStep runat="server" title="INFO. GENERAL">
                <asp:GridView ID="GridViewUpG" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSourceUpG" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table style="width:100%;" border="1">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="LmsgInvesInterna" runat="server" Font-Bold="True" ForeColor="#339933"></asp:Label>
                            <asp:HiddenField ID="HFIDG" Value ='<%# Eval("G_ID") %>' runat="server" />
                        </td>
                        <td>
                            <asp:LinkButton ID="LBActInfoGeneral" runat="server" 
                                ToolTip="GUARDA LOS CAMBIOS REALIZADOS EN INFORMACION GENERAL" 
                                onclick="LBActInfoGeneral_Click">
                            <i class ="icon-refresh"></i> 
                            </asp:LinkButton>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
    ESTATUS
	    <asp:DropDownList ID="DDLEstatus" runat="server" Width="208px">
            <asp:ListItem>PENDIENTE</asp:ListItem>
            <asp:ListItem>CANCELADO</asp:ListItem>
            <asp:ListItem>RESTABLECIMIENTO</asp:ListItem>
        </asp:DropDownList>
	</span> 
</div> 
                            
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
    RAZON
        <asp:TextBox ID="VTBRazon" runat="server" 
        Text='<%# Eval("G_RazonSocial") %>' Width="414px" MaxLength="500"></asp:TextBox>
	</span> 
</div> 
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
FECHA DE BAJA
        <asp:TextBox ID="VTBFechBaja" runat="server" 
        Text='<%# Eval("G_FechaBaja","{0:d}") %>' MaxLength="10" Width="120px"></asp:TextBox>
        <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFechBaja"></asp:CalendarExtender>
	</span> 
</div>                     
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
    RANGO
	    <asp:DropDownList ID="VDDLRango" runat="server" Width="208px">
            <asp:ListItem>I</asp:ListItem>
            <asp:ListItem>II</asp:ListItem>
            <asp:ListItem>III</asp:ListItem>
            <asp:ListItem>IV</asp:ListItem>
            <asp:ListItem>V</asp:ListItem>
        </asp:DropDownList>
	</span> 
</div> 
                            
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
IMPORTE C.O.P.
	<asp:TextBox ID="VTBImpCop" runat="server" 
        Text='<%# Eval("G_ImporteCOP","{0:N}") %>' MaxLength="10" Width="120px"></asp:TextBox>
	</span> 
</div> 
                            
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
IMPORTE R.C.V.
	<asp:TextBox ID="VTBImpRcv" runat="server" 
        Text='<%# Eval("G_ImporteRCV","{0:N}") %>' MaxLength="10" Width="120px"></asp:TextBox>
	</span> 
</div> 
                            
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
    AREA QUE SOLICITO LA BAJA
	                        <asp:DropDownList ID="VDDLAreaSolitoBaja" runat="server" 
                                DataSourceID="SqlDataSourceAreaSolicitoBaja" DataTextField="texto" 
                                DataValueField="valor" Width="270px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceAreaSolicitoBaja" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT C_ID as valor
,C_SIGNIFICADO as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE C_GRUPO='AREA_SOLICITA_LA_BAJA'"></asp:SqlDataSource>
	</span> 
</div> 

                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
    DOCUMENTO CON QUE SE SOLICITO
                            <asp:DropDownList ID="VDDLDocSolicito" runat="server" 
                                DataSourceID="SqlDataSourceDocSolicito" DataTextField="texto" 
                                DataValueField="valor">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDocSolicito" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT C_ID as valor
,C_SIGNIFICADO as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE C_GRUPO='DOC_INFORMA_PATRON_ES_NL'"></asp:SqlDataSource>	
	</span> 
</div> 

                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
INTEGRADOR
                            <asp:DropDownList ID="VDDLIntegrador" runat="server" 
                                DataSourceID="SqlDataSourceIntegrador" DataTextField="texto" 
                                DataValueField="valor" Width="384px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceIntegrador" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select uf.id as valor,upper(nombre) as texto from fiscamovil.dbo.usuarios as uf
where subdel=? and exists(select us.id from sireca.dbo.usuarios as us where us.id=uf.id
and us.userIntegrador=1 and substring(chmod,1,1)='x')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="AB" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
	</span> 
</div> 

                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
    FECHA DE ASIGNACION 
                            <asp:TextBox ID="TBFechAsigno" runat="server" 
        Text='<%# Eval("G_FechaAsignacion","{0:d}") %>' MaxLength="10" Width="120px"></asp:TextBox>
                            <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechAsigno"></asp:CalendarExtender>	
	</span> 
</div> 

                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView> 
                <asp:SqlDataSource ID="SqlDataSourceUpG" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [G_ID]
      ,[G_Subdel]
      ,[G_Estatus]
      ,[G_Rango]
      ,[G_RegPat]
      ,[G_RazonSocial]
      ,[G_ImporteCOP]
     ,[G_ImporteRCV]
      ,[G_FechaBaja]
      ,[G_AreaSolicitaLaBaja]
      ,[G_DocInformaEsPatronNL]
      ,[G_ID_Integrador]
      ,[G_FechaAsignacion]
  FROM [sirecaregistros].[dbo].[NL_General]
  where [G_ID]=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="INVEST. INTERNA">
                <asp:GridView ID="GridViewUpInvInterna" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSourceUpInvInterna" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table style="width:100%;" border="1">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="LmsgInvesInterna" runat="server" Font-Bold="True" 
                                ForeColor="#339933"></asp:Label>
                            <asp:HiddenField ID="HFIDII" runat="server" Value ='<%# Eval("II_G_ID") %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="LBActInvesInterna" runat="server" 
                                ToolTip="GUARDA LOS CAMBIOS REALIZADOS EN INVESTIGACION INTERNA" 
                                onclick="LBActInvesInterna_Click">
                            <i class ="icon-refresh"></i> 
                            </asp:LinkButton>
                            </td>
                    </tr>
                   <tr>
                    <td>
                    </td>
                    <td>
                            Catalogo de Control de Resultados Depto Cobranza<td>
                            </td>
                       </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio1" Text='<%# Eval("II_FolioCatalogoContResultDeptoCobranza") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS1" Text='<%# Eval("II_FSCatalogoContResultDeptoCobranza","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS1">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR1" Text='<%# Eval("II_FRCatalogoContResultDeptoCobranza","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR1">
	    </asp:CalendarExtender>
	</span> 
</div> 
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Ofna. de E.P.O.<td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label21" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio2" Text='<%# Eval("II_FolioOfnaEPO") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label23" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS2" Text='<%# Eval("II_SOfnaEPO","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS2">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label24" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR2" Text='<%# Eval("II_ROfnaEPO","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR2">
	    </asp:CalendarExtender>
	</span> 
</div>     
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Ofna. de Cobros</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label25" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio3" Text='<%# Eval("II_FolioOfnaCobros") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label26" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS3" Text='<%# Eval("II_SOfnaCobros","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS3">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label27" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR3" Text='<%# Eval("II_ROfnaCobros","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR3">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            <td>
                                &nbsp;</td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Expedientes de Convenios y Garantias</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label28" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio4" Text='<%# Eval("II_FolioExpeConveyGarantia") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label29" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS4" Text='<%# Eval("II_SExpeConveyGarantia","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender5" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS4">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label30" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR4" Text='<%# Eval("II_RExpeConveyGarantia","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender6" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR4">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            SINDO</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">    
	<span class="add-on">
	    <asp:Label ID="Label32" runat="server" Text=" VERIFICO "></asp:Label>
	    <asp:TextBox ID="VTBFS5" Text='<%# Eval("II_SINDO","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender7" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS5">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Depto. de Afiliación</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label34" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio6" Text='<%# Eval("II_FolioDeptoAfiliacion") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label35" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS6" Text='<%# Eval("II_SDeptoAfiliacion","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender9" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS6">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label36" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR6" Text='<%# Eval("II_RDeptoAfiliacion","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender10" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR6">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Depto. de Auditoria</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label37" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio7" Text='<%# Eval("II_FolioDeptoAuditoria") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label38" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS7" Text='<%# Eval("II_SDeptoAuditoria","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender11" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS7">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label39" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR7" Text='<%# Eval("II_RDeptoAuditoria","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender12" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR7">
	    </asp:CalendarExtender>
	</span> 
</div> 
</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Servicios Jurídicos</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label40" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio8" Text='<%# Eval("II_FolioServiciosJuridicos") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label41" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS8" Text='<%# Eval("II_SServiciosJuridicos","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender13" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS8">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label42" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR8" Text='<%# Eval("II_RServiciosJuridicos","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender14" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR8">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Secc. Bca.</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">	    
	<span class="add-on">
	    <asp:Label ID="Label44" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS9" Text='<%# Eval("II_SeccBca","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender15" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS9">
	    </asp:CalendarExtender>
	</span>
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            Secc. Ama.</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label47" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS10" Text='<%# Eval("II_SeccAma","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender17" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS10">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            SIEM</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label50" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS11" Text='<%# Eval("II_SIEM","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender19" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS11">
	    </asp:CalendarExtender>
	</span> 
</div> </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            COMPRA NET</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label53" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS12" Text='<%# Eval("II_COMPRA_NET","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender21" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS12">
	    </asp:CalendarExtender>
	</span> 
</div> 
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView> 
                <asp:SqlDataSource ID="SqlDataSourceUpInvInterna" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT II_ID
      ,II_G_ID
      ,II_FolioCatalogoContResultDeptoCobranza
      ,II_FSCatalogoContResultDeptoCobranza
      ,II_FRCatalogoContResultDeptoCobranza
      ,II_FolioOfnaEPO
      ,II_SOfnaEPO
      ,II_ROfnaEPO
      ,II_FolioOfnaCobros
      ,II_SOfnaCobros
      ,II_ROfnaCobros
      ,II_FolioExpeConveyGarantia
      ,II_SExpeConveyGarantia
      ,II_RExpeConveyGarantia
      ,II_SINDO
      ,II_FolioDeptoAfiliacion
      ,II_SDeptoAfiliacion
      ,II_RDeptoAfiliacion
      ,II_FolioDeptoAuditoria
      ,II_SDeptoAuditoria
      ,II_RDeptoAuditoria
      ,II_FolioServiciosJuridicos
      ,II_SServiciosJuridicos
      ,II_RServiciosJuridicos
      ,II_SeccBca
      ,II_SeccAma
      ,II_SIEM
      ,II_COMPRA_NET
  FROM sirecaregistros.dbo.NL_InvestInterna
  WHERE II_G_ID=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="INVEST. EXTERNA">
                <asp:GridView ID="GridViewInvetExterna" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceInvetExterna" 
                    ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="IE_ID" InsertVisible="False" 
                            SortExpression="IE_ID">
                            
                            <ItemTemplate>
                                <table border="1" style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td align="right">
                                            <asp:Label ID="LmsgInvesInterna" runat="server" Font-Bold="True" 
                                                ForeColor="#339933"></asp:Label>
                                            <asp:HiddenField ID="HFIDIE" runat="server" Value='<%# Eval("IE_G_ID") %>' />
                                        </td>
                                        <td>
                            <asp:LinkButton ID="LBActInvesExterna" runat="server" 
                                                ToolTip="GUARDA LOS CAMBIOS REALIZADOS EN INVESTIGACION EXTERNA" 
                                                onclick="LBActInvesExterna_Click">
                                <i class ="icon-refresh"></i> 
                            </asp:LinkButton>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            SAT D.F.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label31" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio1" Text='<%# Eval("IE_SAT_DF_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label33" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS1" Text='<%# Eval("IE_SAT_DF_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender8" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS1">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label43" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR1" Text='<%# Eval("IE_SAT_DF_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender16" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR1">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
    </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            SAT FORANEO<td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label45" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio2" Text='<%# Eval("IE_SAT_Foraneo_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label46" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS2" Text='<%# Eval("IE_SAT_Foraneo_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender18" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS2">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label48" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR2" Text='<%# Eval("IE_SAT_Foraneo_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender20" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR2">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            TESORERIA D.F.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label49" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio3" Text='<%# Eval("IE_III_Tesoreria_DF_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label51" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS3" Text='<%# Eval("IE_III_Tesoreria_DF_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender22" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS3">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label52" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR3" Text='<%# Eval("IE_III_Tesoreria_DF_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender23" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR3">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            TESORERIA FORANEO</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label54" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio4" Text='<%# Eval("IE_III_Tesoreria_Foraneo_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label55" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS4" Text='<%# Eval("IE_III_Tesoreria_Foraneo_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender24" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS4">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label56" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR4" Text='<%# Eval("IE_III_Tesoreria_Foraneo_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender25" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR4">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Registro Público de la Propiedad y del Comercio D.F. PATRON F.M.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label57" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio5" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FM_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label58" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS5" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FM_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender26" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS5">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label59" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR5" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FM_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender27" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR5">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Registro Público de la Propiedad y del Comercio D.F. PATRON F.R.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label60" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio6" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FR_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label61" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS6" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FR_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender28" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS6">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label62" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR6" Text='<%# Eval("IE_IV_RPPC_DF_PATRON_FR_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender29" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR6">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Registro Público de la Propiedad y del Comercio D.F. SOCIOS F.R.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label63" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio7" Text='<%# Eval("IE_IV_RPPC_DF_SOCIO_FR_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label64" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS7" Text='<%# Eval("IE_IV_RPPC_DF_SOCIO_FR_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender30" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS7">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label65" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR7" Text='<%# Eval("IE_IV_RPPC_DF_SOCIO_FR_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender31" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR7">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Registro Público de la Propiedad y del Comercio FORANEO PATRON F.M.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label66" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio8" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FM_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label67" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS8" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FM_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender32" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS8">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label68" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR8" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FM_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender33" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR8">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Registro Público de la Propiedad y del Comercio FORANEO PATRON F.R.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label69" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio9" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FR_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label70" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS9" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FR_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender34" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS9">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label71" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR9" Text='<%# Eval("IE_IV_RPPC_Foraneo_PATRON_FR_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender35" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR9">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Registro Público de la Propiedad y del Comercio FORANEO SOCIOS F.R.</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label72" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio10" Text='<%# Eval("IE_IV_RPPC_Foraneo_SOCIO_FR_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label73" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS10" Text='<%# Eval("IE_IV_RPPC_Foraneo_SOCIO_FR_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender36" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS10">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label74" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR10" Text='<%# Eval("IE_IV_RPPC_Foraneo_SOCIO_FR_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender37" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR10">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Archivo Gral. de Notarias</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label75" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio11" Text='<%# Eval("IE_V_ArchivoGralNotarias_Folio") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label76" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS11" Text='<%# Eval("IE_V_ArchivoGralNotarias_S","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender38" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS11">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label77" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR11" Text='<%# Eval("IE_V_ArchivoGralNotarias_R","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender39" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR11">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceInvetExterna" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [IE_ID]
      ,[IE_G_ID]
      ,[IE_SAT_DF_Folio]
      ,[IE_SAT_DF_S]
      ,[IE_SAT_DF_R]
      ,[IE_SAT_Foraneo_Folio]
      ,[IE_SAT_Foraneo_S]
      ,[IE_SAT_Foraneo_R]
      ,[IE_III_Tesoreria_DF_Folio]
      ,[IE_III_Tesoreria_DF_S]
      ,[IE_III_Tesoreria_DF_R]
      ,[IE_III_Tesoreria_Foraneo_Folio]
      ,[IE_III_Tesoreria_Foraneo_S]
      ,[IE_III_Tesoreria_Foraneo_R]
      ,[IE_IV_RPPC_DF_PATRON_FM_Folio]
      ,[IE_IV_RPPC_DF_PATRON_FM_S]
      ,[IE_IV_RPPC_DF_PATRON_FM_R]
      ,[IE_IV_RPPC_DF_PATRON_FR_Folio]
      ,[IE_IV_RPPC_DF_PATRON_FR_S]
      ,[IE_IV_RPPC_DF_PATRON_FR_R]
      ,[IE_IV_RPPC_DF_SOCIO_FR_Folio]
      ,[IE_IV_RPPC_DF_SOCIO_FR_S]
      ,[IE_IV_RPPC_DF_SOCIO_FR_R]
      ,[IE_IV_RPPC_Foraneo_PATRON_FM_Folio]
      ,[IE_IV_RPPC_Foraneo_PATRON_FM_S]
      ,[IE_IV_RPPC_Foraneo_PATRON_FM_R]
      ,[IE_IV_RPPC_Foraneo_PATRON_FR_Folio]
      ,[IE_IV_RPPC_Foraneo_PATRON_FR_S]
      ,[IE_IV_RPPC_Foraneo_PATRON_FR_R]
      ,[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio]
      ,[IE_IV_RPPC_Foraneo_SOCIO_FR_S]
      ,[IE_IV_RPPC_Foraneo_SOCIO_FR_R]
      ,[IE_V_ArchivoGralNotarias_Folio]
      ,[IE_V_ArchivoGralNotarias_S]
      ,[IE_V_ArchivoGralNotarias_R]
  FROM [sirecaregistros].[dbo].[NL_InvestExterna]
  WHERE [IE_G_ID]=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="INVEST. DE CAMPO">
                <asp:GridView ID="GridViewInvesCampo" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceInvetCampo" 
                    ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="IC_ID" InsertVisible="False" 
                            SortExpression="IC_ID">
                            <ItemTemplate>
                                <table border="1" style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td align="right">
                                            <asp:Label ID="LmsgInvesInterna" runat="server" Font-Bold="True" 
                                                ForeColor="#339933"></asp:Label>
                                            <asp:HiddenField ID="HFIDIC" runat="server" Value='<%# Eval("IC_G_ID") %>'/>
                                        </td>
                                        <td>
<asp:LinkButton ID="LBActInvesCampo" runat="server" ToolTip="GUARDA LOS CAMBIOS REALIZADOS EN INVESTIGACION DE CAMPO" 
                                                onclick="LBActInvesCampo_Click">
	<i class ="icon-refresh"></i> 
</asp:LinkButton>
                                           </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Visita Dom. Fiscal</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label78" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio1" Text='<%# Eval("IC_FolioVisitaDomFiscal") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label79" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS1" Text='<%# Eval("IC_SVisitaDomFiscal","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender40" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS1">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Visita Socios</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label81" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio2" Text='<%# Eval("IC_FolioVisitaSocios") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label82" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS2" Text='<%# Eval("IC_SVisitaSocios","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender42" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS2">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Entrevista a 3 Vecinos</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label84" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio3" Text='<%# Eval("IC_FolioEntrevista3Vecinos") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label85" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS3" Text='<%# Eval("IC_SEntrevista3Vecinos","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender44" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS3">
	    </asp:CalendarExtender>
	</span> 
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Entrevista a 3 Trabajadores</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label87" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio4" Text='<%# Eval("IC_FolioEntrevista3Trabajadores") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label88" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS4" Text='<%# Eval("IC_SEntrevista3Trabajadores","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender46" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS4">
	    </asp:CalendarExtender>
	</span>
</div> 
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Visitas Foráneas</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
<div class="btn-group input-prepend">
	<span class="add-on">
	    <asp:Label ID="Label80" runat="server" Text="FOLIO: "></asp:Label>
	    <asp:TextBox ID="VTBFolio5" Text='<%# Eval("IC_FolioVisitasForaneas") %>' runat="server"  MaxLength="10" Width="80px" ></asp:TextBox>
	</span> 
		    
	<span class="add-on">
	    <asp:Label ID="Label83" runat="server" Text=" SOLICITUD "></asp:Label>
	    <asp:TextBox ID="VTBFS5" Text='<%# Eval("IC_SVisitasForaneas","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender41" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFS5">
	    </asp:CalendarExtender>
	</span> 
	
	<span class="add-on">
	    <asp:Label ID="Label86" runat="server" Text=" RESPUESTA "></asp:Label>
	    <asp:TextBox ID="VTBFR5" Text='<%# Eval("IC_RVisitasForaneas","{0:d}") %>' runat="server" MaxLength="10" Width="80px" ></asp:TextBox>
	    <asp:CalendarExtender ID="CalendarExtender43" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VTBFR5">
	    </asp:CalendarExtender>
	</span> 
</div>
                                            </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceInvetCampo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [IC_ID]
      ,[IC_G_ID]
      ,[IC_FolioVisitaDomFiscal]
      ,[IC_SVisitaDomFiscal]
      ,[IC_FolioVisitaSocios]
      ,[IC_SVisitaSocios]
      ,[IC_FolioEntrevista3Vecinos]
      ,[IC_SEntrevista3Vecinos]
      ,[IC_FolioEntrevista3Trabajadores]
      ,[IC_SEntrevista3Trabajadores]
      ,[IC_FolioVisitasForaneas]
      ,[IC_SVisitasForaneas]
      ,[IC_RVisitasForaneas]
  FROM [sirecaregistros].[dbo].[NL_InvestCampo]
  WHERE [IC_G_ID]=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="OBSERVACIONES">
                <asp:GridView ID="GridViewObservacion" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceObservacion" 
                    HorizontalAlign="Center" CssClass="table-bordered" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="N" HeaderText="Ob" ReadOnly="True" 
                            SortExpression="N" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="C_Observacion" SortExpression="C_Observacion" />
                    </Columns>
                </asp:GridView>
                <center>
<div class="btn-group input-prepend">
    <asp:TextBox ID="TBObservacion" runat="server" TextMode="MultiLine" Height="50px" 
        Width="300px"></asp:TextBox>
<span class="add-on">
    <asp:LinkButton ID="LBObservacion" runat="server" CssClass="bnt">Agregar</asp:LinkButton>
</span>
</div>
                    <asp:GridView ID="GridViewObserTemp" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceObserTemp" ShowHeader="False" 
                        BorderColor="White" BorderStyle="None" BorderWidth="0px">
                        <Columns>
                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="ID" 
                                SortExpression="ID">
                                <ItemTemplate>
                                    <asp:HiddenField ID="HFObTemp" runat="server" Value='<%# Eval("ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceObserTemp" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                        SelectCommand="SELECT ? as ID" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</center>
                <asp:SqlDataSource ID="SqlDataSourceObservacion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY [C_ID]) as N
,[C_Observacion]
FROM [sirecaregistros].[dbo].[NL_Observaciones]
WHERE [C_G_ID]=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    </center>
    </span>
</asp:Content>

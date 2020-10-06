<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="controldelabaja.aspx.vb" Inherits="WebSIRECA.controldelabaja" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" Width="100px">
        </asp:DropDownList>
        <asp:TextBox ID="TBBuscar" runat="server" MaxLength="10" placeholder="REG. PATRONAL / CREDITO" TabIndex="9" Width="230px"></asp:TextBox>
        <asp:LinkButton ID="LBBuscar" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CssClass="btn">BUSCAR</asp:LinkButton>
            <asp:LinkButton ID="LBAddCaso" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CssClass="btn"><i class="icon-plus"></i>&nbsp;AGREGAR CREDITO</asp:LinkButton>
</div>
</center>
    <asp:SqlDataSource ID="SqlDataSourceG" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [PR_ID] as ID
      ,[PR_SUBDEL] as SUBDEL
      ,[PR_REGPAT] as REGPAT
      ,[PR_RAZON_SOCIAL] as RAZON
  FROM [sirecaregistros].[dbo].[CB_PROYECTO]
  WHERE  [PR_SUBDEL]=? AND [PR_REGPAT] LIKE (?+'%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBBuscar" DefaultValue="ABCD" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewg" runat="server" AllowPaging="True" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceG" HorizontalAlign="Center" 
        PageSize="1" AutoGenerateColumns="False" ShowHeader="False" 
        EmptyDataText="NO SE ENCONTRARON RESULTADOS INGRESE EL REGISTRO PATRONAL 10 DIGITOS Y AGREGUELO A LA BASE">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text ="SUBDEL.:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text ='<%# Eval("SUBDEL") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label16" runat="server" Text =", REGISTRO PATRONAL:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text ='<%# Eval("REGPAT") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text =", RAZON SOCIAL:" Font-Bold ="true" ForeColor="#35496A"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text ='<%# Eval("RAZON") %>' ForeColor="#9E7123" Font-Bold ="true"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings Position="Top" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:Panel ID="PanelCaptura" runat="server">
        <asp:GridView ID="GridViewCaptura" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceCaptura" HorizontalAlign="Center" ShowHeader="False">
            <Columns>
                <asp:TemplateField InsertVisible="False" >
                    <ItemTemplate>
                        <table style="width: 100%;" border="1">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="LmsgInvesInterna" runat="server"></asp:Label>
                                    <asp:HiddenField ID="HFID" runat="server" Value='<%# Eval("V_ID") %>' />
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="LBActualizar" runat="server" BorderStyle="Solid" 
                                        BorderWidth="1" CssClass="btn" onclick="LBActualizar_Click"><i 
                                        class="icon-refresh"></i>&nbsp;Actualizar</asp:LinkButton>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="Label17" runat="server" Text="Reg.Patronal"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TBRegPat" Text='<%# Eval("V_REGPAT") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;STATUS </td>
                                <td>
                                    <asp:DropDownList ID="DDLEstatus" runat="server" 
                                        DataSourceID="SqlDataSourceEstatus" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEstatus" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,[C_SIGNIFICADO] as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ACTIVO]=1 and [C_GRUPO]='ESTATUS_PROYECTO_BAJA'
order by texto"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;LOCALIZADO SIN RELACION OBRERO PATRONAL (SI, SOLO EN CASO DE SER ASI)</td>
                                <td>
                                    <asp:DropDownList ID="DDLSinRelObrPat" runat="server">
                                        <asp:ListItem Value="EN_PROCESO">EN PROCESO</asp:ListItem>
                                        <asp:ListItem>SI</asp:ListItem>
                                        <asp:ListItem>NO</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;OBSERVACIONES</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;R.F.C. (FISICAS 13 POSICIONES, MORALES 12 POSICIONES</td>
                                <td>
                                    <asp:TextBox ID="TBRfc" runat="server" Text='<%# Eval("V_RFC") %>' ></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;NOMBRE PATRON</td>
                                <td>
                                    <asp:TextBox ID="TBRazonSocial" runat="server" Text ='<%# Eval("V_RAZON") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;DOMICILIO FISCAL (IMSS)</td>
                                <td>
                                    <asp:TextBox ID="TBDomFisImss" runat="server" Text ='<%# Eval("V_DOM_FIS_IMSS") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;SOLICITUD AL SAT (ARCHIVO DE EXCEL)</td>
                                <td>
                                    <asp:TextBox ID="TBSolSatExcel" runat="server" Text ='<%# Eval("V_SOLI_SAT_EXCEL") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;DOMICILIO SAT (ARCHIVO DE EXCEL)</td>
                                <td>
                                    <asp:TextBox ID="TBDomSatExcel" runat="server" Text ='<%# Eval("V_DOMI_SAT_EXCEL") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;SOLICITUD AL SAT (CON OFICIO)</td>
                                <td>
                                    <asp:TextBox ID="TBSolSatOfi" runat="server" Text ='<%# Eval("V_SOLI_SAT_OFICIO") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;DOMICILIO SAT (OFICIO)</td>
                                <td>
                                    <asp:TextBox ID="TBDomSatOfi" runat="server" Text ='<%# Eval("V_DOMI_SAT_OFICIO") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;ACTIVIDAD</td>
                                <td>
                                    <asp:TextBox ID="TBActividad" runat="server" Text ='<%# Eval("V_ACT") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;FECHA ACTA CIRCUNST.</td>
                                <td>
                                    <asp:TextBox ID="TBActaCircuns_F" runat="server" MaxLength="10" Text ='<%# Eval("V_FECH_ACTA_CIRCUNS") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;FECHA RECEP. IMPED. COBRO</td>
                                <td>
                                    <asp:TextBox ID="TBRecepImpCobr_F" runat="server" MaxLength="10" Text ='<%# Eval("V_FECH_RECEP_IMPED_COBRO") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA LIM. (10 DIAS HABILES A PARTIR DE LA RECEPCION DEL ACTA CIRCUNSTANCIADA.)</td>
                                <td>
                                    <asp:TextBox ID="TBLimite_F" runat="server" MaxLength="10" Text='<%# Eval("V_FECHA_LIMIT") %>'></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA AFIL ALTA</td>
                                <td>
                                    <asp:TextBox ID="TBAfilAlta_F" Text='<%# Eval("FECH_AFIL_ALTA") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA INF. REL. LAB. INEX.</td>
                                <td>
                                    <asp:TextBox ID="TBInfRelLab_F" Text='<%# Eval("FECH_INF_REL_LAB_INEX") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA MEMO BAJA</td>
                                <td>
                                    <asp:TextBox ID="TBMemoBaja_F" Text='<%# Eval("V_FECH_MEMO_BAJA") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;NUMERO MEMO BAJA</td>
                                <td>
                                    <asp:TextBox ID="TBNumMemoBaja" Text='<%# Eval("V_NUM_MEMO_BAJA") %>' runat="server" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA DE BAJA</td>
                                <td>
                                    <asp:TextBox ID="TBBaja_F" Text='<%# Eval("V_FECH_BAJA") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;ENCARGADO DE LA MESA DE CREDITOS CON IMPED. DE COBRO</td>
                                <td>
                                    <asp:DropDownList ID="DDLEncCredImpCobro" runat="server" 
                                        DataSourceID="SqlDataSourceEncCredImpCobro" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEncCredImpCobro" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,(Select upper(nombre) from fiscamovil.dbo.usuarios where id=[C_ID]) as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ACTIVO]=? and [C_GRUPO]='ENCAR_CREDITOS_IMPEDIMENTO_COBRO'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;ENCARGADO DE LA OFICINA DE REGISTROS Y CONTROL DE LA CARTERA</td>
                                <td>
                                    <asp:DropDownList ID="DDLEncOfiRegistros" runat="server" 
                                        DataSourceID="SqlDataSourceEncOfiRegistros" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEncOfiRegistros" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,(Select upper(nombre) from fiscamovil.dbo.usuarios where id=[C_ID]) as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ACTIVO]=? and [C_GRUPO]='ENCAR_OFI_REGISTROS'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;JEFE DEL DEPTO. DE AFILIACION Y VIGENCIA DE DERECHOS</td>
                                <td>
                                    <asp:DropDownList ID="DDLEncDepAfil" runat="server" 
                                        DataSourceID="SqlDataSourceEncDepAfil" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEncDepAfil" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,(Select upper(nombre) from fiscamovil.dbo.usuarios where id=[C_ID]) as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ACTIVO]=? and [C_GRUPO]='ENCAR_JDEP_AFIL_VIGEN'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;TITULAR DE LA SUBDELEG.</td>
                                <td>
                                    <asp:DropDownList ID="DDLTitSubdel" runat="server" 
                                        DataSourceID="SqlDataSourceTitSubdel" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceTitSubdel" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,(Select upper(nombre) from fiscamovil.dbo.usuarios where id=[C_ID]) as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ACTIVO]=? and [C_GRUPO]='ENCAR_TITULAR_SUBDEL'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;N° TRAB.</td>
                                <td>
                                    <asp:TextBox ID="TBNumTrabajadores" Text='<%# Eval("V_COTIZ") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;PROCEDENCIA DEL ND QUE DA ORIGEN A LA BAJA (E.F. U OEPO)</td>
                                <td>
                                    <asp:DropDownList ID="DDLProcNdOriBaja" runat="server" 
                                        DataSourceID="SqlDataSourceProcNdOriBaja" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceProcNdOriBaja" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,[C_SIGNIFICADO] as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
where [C_GRUPO]='AREA_SOLICITA_LA_BAJA' and C_ACTIVO=1
order by texto"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;REFERENCIA (N° DE CED. CAPT. O REF. DE MEMO)</td>
                                <td>
                                    <asp:TextBox ID="TBRefMemoCed" Text='<%# Eval("V_REFERENCIA") %>' runat="server" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA DE REFERENCIA</td>
                                <td>
                                    <asp:TextBox ID="TBRefMemoCed_F" Text='<%# Eval("V_FECH_REFERENCIA") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;NOMBRE DEL NL QUE VERIFICA EL FISCAL</td>
                                <td>
                                    <asp:DropDownList ID="DDLVerificaFiscal" runat="server" 
                                        DataSourceID="SqlDataSourceNLVerificaFiscal" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceNLVerificaFiscal" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] as valor
,(case 
when isnumeric([C_ID])=1
then (SELECT upper(nombre) FROM fiscamovil.dbo.usuarios WHERE cast(id as varchar)=[C_ID])
else C_SIGNIFICADO
end) as texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_ACTIVO]=1 and [C_GRUPO]='ENCAR_NL_VERIFICA_FISCAL'
"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FEC. ENT.-DEV. NL</td>
                                <td>
                                    <asp:TextBox ID="TBEntDevNl_F" Text='<%# Eval("V_FECH_ENT_DEV_NL") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;RESULTADO DE LA VERIFICACION DEL DOMICILIO FISCAL (NEGATIVA, POSITIVA, 
                                    POSITIVA SIN RELACION)</td>
                                <td>
                                    <asp:DropDownList ID="DDLResVerDomFis" runat="server">
                                        <asp:ListItem Value="EN_PROCESO">EN PROCESO</asp:ListItem>
                                        <asp:ListItem>NEGATIVA</asp:ListItem>
                                        <asp:ListItem>POSITIVA</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;NOMBRE LOCALIZADOR</td>
                                <td>
                                    <asp:DropDownList ID="DDLLocalizador" runat="server" 
                                        DataSourceID="SqlDataSourceLocalozador" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceLocalozador" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] AS valor
,(CASE WHEN ISNUMERIC([C_ID])=1 THEN (SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[C_ID])
ELSE [C_SIGNIFICADO] END ) AS texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_GRUPO]='ENCAR_LOCALIZADOR' AND [C_ACTIVO]=?">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FEC. ENT.-DEV. LOCALIZADOR</td>
                                <td>
                                    <asp:TextBox ID="TBEntDevLocalizador_F" Text='<%# Eval("V_FECH_ENT_DEV_LOCALIZADOR") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;NOMBRE DEL NL QUE VERIFICA EL SAT (SOLO EN CASO DE QUE FISCAL Y SAT SEAN 
                                    DIFERENTES)</td>
                                <td>
                                    <asp:DropDownList ID="DDLNlVerSat" runat="server" 
                                        DataSourceID="SqlDataSourceNlVerSat" DataTextField="texto" 
                                        DataValueField="valor">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceNlVerSat" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [C_ID] AS valor
,(CASE WHEN ISNUMERIC([C_ID])=1 THEN (SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[C_ID])
ELSE [C_SIGNIFICADO] END ) AS texto
FROM [sirecaregistros].[dbo].[NL_Catalogo]
WHERE [C_GRUPO]='ENCAR_NL_VERIFICA_FISCAL' AND [C_ACTIVO]=?
ORDER BY texto">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FEC. ENT.-DEV. NL QUE VERIFICA EL SAT (SOLO EN CASO DE QUE FISCAL Y SAT SEAN 
                                    DIFERENTES)</td>
                                <td>
                                    <asp:TextBox ID="TBEntDevNlSat_F" Text='<%# Eval("V_FECH_ENT_DEV_NL_VERIFI_SAT") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;ELABORO</td>
                                <td>
                                    <asp:DropDownList ID="DDLElaboro" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;REF. MEMO DE AFILIACION CON QUE ENVIA EL AFIL DE BAJA</td>
                                <td>
                                    <asp:TextBox ID="TBRefMeAfilEnvAfilBaja" Text='<%# Eval("V_REF_MEMO_AFIL_EMV_AFIL_BAJA") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA RECEPCION DEL MEMO DE AFILIACION</td>
                                <td>
                                    <asp:TextBox ID="TBRecMeAfil_F" Text='<%# Eval("V_FECH_RESEP_MEMO_AFIL") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;RANGO</td>
                                <td>
                                    <asp:DropDownList ID="DDLRango" runat="server">
                                        <asp:ListItem>I</asp:ListItem>
                                        <asp:ListItem>II</asp:ListItem>
                                        <asp:ListItem>III</asp:ListItem>
                                        <asp:ListItem>IV</asp:ListItem>
                                        <asp:ListItem>V</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;IMPORTE COP</td>
                                <td>
                                    <asp:TextBox ID="TBImpCoP" Text='<%# Eval("V_IMP_COP") %>' runat="server" MaxLength="10">0</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;IMPORTE RCV</td>
                                <td>
                                    <asp:TextBox ID="TBImpRcv" Text='<%# Eval("V_IMP_RCV") %>' runat="server" MaxLength="10">0</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;SOLIC. A AFILIACION PARA INVEST. INTERNA (POLITICA 3.25)</td>
                                <td>
                                    <asp:TextBox ID="TBSolAfilInvInterna" Text='<%# Eval("V_SOLI_AFIL_INV_INT") %>' runat="server" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;LA FECHA DEL CORREO DE SOLICITUD (POLITICA 3.25)</td>
                                <td>
                                    <asp:TextBox ID="TBCorreoSoli_F" Text='<%# Eval("V_FECH_CORREO_SOLI") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA MEMO AFILIACION PARA INTERNA (DEVOLUCION)</td>
                                <td>
                                    <asp:TextBox ID="TBMeAfilInterna_F" Text='<%# Eval("V_FECH_MEMO_AFIL_INT") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;CONSULTA AL CATALOGO DE CONTROL DE RESULTADOS (POLITICA 3.32)</td>
                                <td>
                                    <asp:DropDownList ID="DDLConsultCatContResult" runat="server">
                                        <asp:ListItem Value="EN_PROCESO">EN PROCESO</asp:ListItem>
                                        <asp:ListItem>SI</asp:ListItem>
                                        <asp:ListItem>NO</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA DE CONSULTA AL CATALOGO DE CONTROL DE RESULTADOS (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultCatContResult_F" Text='<%# Eval("V_FECH_CONSUL_CAT_CONT_RESULT") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;CONSULTA A OEPO (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultOEPO" Text='<%# Eval("V_CONSULT_OEPO") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA CONSULTA A OEPO (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultOEPO_F" Text='<%# Eval("V_FECH_CONSULT_OEPO") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;CONSULTA A COBROS (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultCobros" Text='<%# Eval("V_CONSUL_COBROS") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA CONSULTA A COBROS (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultCobros_F" Text='<%# Eval("V_FECH_CONSULT_COBROS") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;CONSULTA A CONVENIOS (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultConvenios" Text='<%# Eval("V_CONSULT_CONVE") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA CONSULTA A CONVENIOS (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBConsultConvenios_F" Text='<%# Eval("V_FECH_CONSULT_CONVE") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;MEMO JURIDICO SOLICITUD INFORMACION (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBMeJuriSoli" Text='<%# Eval("V_MEMO_JURI_SOLI_INFOR") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA MEMO JURIDICO SOLICITUD INFORMACION (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBMeJuriSoli_F" Text='<%# Eval("V_FECH_MEMO_JURI_SOLI_INFOR") %>' runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;MEMO AUD. PATRONES SOLICITUD INFORMACION (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBMeAudPatSoli" Text='<%# Eval("V_MEMO_AUD_PAT_SOLI_INFOR") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FECHA MEMO AUD. PATRONES SOLICITUD INFORMACION (POLITICA 3.32)</td>
                                <td>
                                    <asp:TextBox ID="TBMeAudPatSoli_F" Text='<%# Eval("V_FECH_MEMO_AUD_PAT_SOLI_INFOR") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;ND ANTERIOR</td>
                                <td>
                                    <asp:TextBox ID="TBNdAnterior" Text='<%# Eval("V_ND_ANTERIOR") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;POSIBLE SUST. PAT.</td>
                                <td>
                                    <asp:TextBox ID="TBPosSusPatro" Text='<%# Eval("V_POSI_SUST_PAT") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FEC. ENVIO AL DEPTO. AUD. PAT.</td>
                                <td>
                                    <asp:TextBox ID="TBEnvDepAud_F" Text='<%# Eval("V_FECH_ENV_DEP_AUD_PAT") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;FEC. RECEP. RESP. A.P.</td>
                                <td>
                                    <asp:TextBox ID="TBRecRespAP_F" Text='<%# Eval("V_FECH_RECEP_RESP_A_P") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;REF. Y FECHA DE RESP. A.P.</td>
                                <td>
                                    <asp:TextBox ID="TBRefResAP_F" Text='<%# Eval("V_REF_FECH_RESP_A_P") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;OBSER. AUD. A PAT.</td>
                                <td>
                                    <asp:TextBox ID="TBObAudPat" Text='<%# Eval("V_OBSER_AUD_A_PAT") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (1)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom1" Text='<%# Eval("V_VERI_DOM1") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom1_Res" Text='<%# Eval("V_RESULT1") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (2) SAT</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDomSat2" Text='<%# Eval("V_VERI_DOM_SAT2") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;NL</td>
                                <td>
                                    <asp:TextBox ID="TBNL2" Text='<%# Eval("V_NL2") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBResVerifDomSat2" Text='<%# Eval("V_RESULT2") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (3)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom3" Text='<%# Eval("V_VERI_DOM3") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom3_Res" Text='<%# Eval("V_RESULT3") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (4)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom4" Text='<%# Eval("VERI_DOM4") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom4_Res" Text='<%# Eval("V_RESULT4") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (5)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom5" Text='<%# Eval("V_VERI_DOM5") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom5_Res" Text='<%# Eval("V_RESILT5") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (6)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom6" Text='<%# Eval("V_VERI_DOM6") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom6_Res" Text='<%# Eval("V_RESULT6") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (7)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom7" Text='<%# Eval("V_VERIF_DOM7") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom7_Res" Text='<%# Eval("V_RESULT7") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (8)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom8" Text='<%# Eval("V_VERIF_DOM8") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom8_Res" Text='<%# Eval("V_RESULT8") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (9)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom9" Text='<%# Eval("VERI_DOM9") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom9_Res" Text='<%# Eval("V_RESULT9") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;VERIFICACION DE DOM. (10)</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom10" Text='<%# Eval("V_VERI_DOM10") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;RESULTADO</td>
                                <td>
                                    <asp:TextBox ID="TBVerifDom10_Res" Text='<%# Eval("V_RESULT10") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCaptura" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [PR_ID] AS V_ID
      ,[PR_SUBDEL] as V_SUBDEL
      ,[PR_REGPAT] as V_REGPAT
      ,[PR_STATUS] as V_ESTATUS
      ,[PR_LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] AS V_LOC_REL_OBRE_PAT
      ,[PR_RFC] AS V_RFC
      ,[PR_RAZON_SOCIAL] AS V_RAZON
      ,[PR_DOMICILIO_FISCAL_IMSS] AS V_DOM_FIS_IMSS
      ,[PR_SOLICITUD_SAT_EXCEL] AS V_SOLI_SAT_EXCEL
      ,[PR_DOMICILIO_SAT_EXCEL] AS V_DOMI_SAT_EXCEL
      ,[PR_SOLICITUD_SAT_OFICIO] AS V_SOLI_SAT_OFICIO
      ,[PR_DOMICILIO_SAT_OFICIO] AS V_DOMI_SAT_OFICIO
      ,[PR_ACTIVIDAD] AS V_ACT
      ,[PR_FECHA_ACTA_CIRCUNST] AS V_FECH_ACTA_CIRCUNS
      ,[PR_FECHA_RECEP_IMPED_COBRO] AS V_FECH_RECEP_IMPED_COBRO
      ,[PR_FECHA_LIMITE] AS V_FECHA_LIMIT
      ,[PR_FECHA_AFIL_ALTA] AS FECH_AFIL_ALTA
      ,[PR_FECHA_INF_REL_LAB_INEX] AS FECH_INF_REL_LAB_INEX
      ,[PR_FECHA_MEMO_BAJA] AS V_FECH_MEMO_BAJA
      ,[PR_NUMERO_MEMO_BAJA] AS V_NUM_MEMO_BAJA
      ,[PR_FECHA_BAJA] AS V_FECH_BAJA
      ,[PR_ID_USER_ENCAR_CRED_CON_IMPED_COBRO] AS V_ID_CRED_IMPED_COBRO
      ,[PR_ID_USER_ENCAR_OFICINA_REGISTROS] AS V_ID_OFI_REG
      ,[PR_ID_USER_JEFE_DEPTO_AFILIACION] AS V_ID_JEF_DEP_AFIL
      ,[PR_ID_USER_TITULAR_SUBDELEGACION] AS V_ID_TITULAR_SUBDEL
      ,[PR_COTIZANTES] AS V_COTIZ
      ,[PR_PROCEDENCIA_ND_ORIGEN_A_LA_BAJA] AS V_PROCEDEN_ORIGEN_BAJA
      ,[PR_REFERENCIA] AS V_REFERENCIA
      ,[PR_FECHA_REFERENCIA] AS V_FECH_REFERENCIA
      ,[PR_ID_USER_NOMBRE_NL_VERIFICA_FISCAL] AS V_ID_NL_VERIFICA_FISCAL
      ,[PR_FECHA_ENT_DEV_NL] AS V_FECH_ENT_DEV_NL
      ,[PR_RESULT_VERIFI_DOM_FISCAL] AS V_RESULT_VERI_DOM_FISCAL
      ,[PR_ID_USER_LOCALIZADOR] AS V_ID_LOCALIZADOR
      ,[PR_FECHA_ENTREGA_DEV_LOCALIZADOR] AS V_FECH_ENT_DEV_LOCALIZADOR
      ,[PR_NOMBRE_NL_QUE_VERIFICA_SAT] AS V_NOM_NL_VERIFICA_SAT
      ,[PR_FECHA_ENT_DEV_NL_QUE_VERIFICA_SAT] AS V_FECH_ENT_DEV_NL_VERIFI_SAT
      ,[PR_ELABORO] AS V_ELABORA
      ,[PR_REF_MEMO_AFILIACION_ENVIA_AFIL_BAJA] AS V_REF_MEMO_AFIL_EMV_AFIL_BAJA
      ,[PR_FECHA_RECEPCION_MEMO_AFILIACION] AS V_FECH_RESEP_MEMO_AFIL
      ,[PR_RANGO] AS V_RANGO
      ,[PR_IMPORTE_COP] AS V_IMP_COP
      ,[PR_IMPORTE_RCV] AS V_IMP_RCV
      ,[PR_SOLIC_AFILIACION_PARA_INVEST_INTERNA] AS V_SOLI_AFIL_INV_INT
      ,[PR_FECHA_CORREO_SOLICITUD] AS V_FECH_CORREO_SOLI
      ,[PR_FECHA_MEMO_AFILIACION_PARA_INTERNA] AS V_FECH_MEMO_AFIL_INT
      ,[PR_CONSULTA_CATALOGO_CONTROL_RESULTADOS] AS V_CONSUL_CAT_CONT_RESULT
      ,[PR_FECHA_CONSULTA_CATALOGO_CONTROL_RESULTADOS] AS V_FECH_CONSUL_CAT_CONT_RESULT
      ,[PR_CONSULTA_OEPO] AS V_CONSULT_OEPO
      ,[PR_FECHA_CONSULTA_OEPO] AS V_FECH_CONSULT_OEPO
      ,[PR_CONSULTA_COBROS] AS V_CONSUL_COBROS
      ,[PR_FECHA_CONSULTA_COBROS] AS V_FECH_CONSULT_COBROS
      ,[PR_CONSULTA_CONVENIOS] AS V_CONSULT_CONVE
      ,[PR_FECHA_CONSULTA_CONVENIOS] AS V_FECH_CONSULT_CONVE
      ,[PR_MEMO_JURIDICO_SOLICITUD_INFORMACION] AS V_MEMO_JURI_SOLI_INFOR
      ,[PR_FECHA_MEMO_JURIDICO_SOLICITUD_INFORMACION] AS V_FECH_MEMO_JURI_SOLI_INFOR
      ,[PR_MEMO_AUD_PATRONES_SOLICITUD_INFORMACION] AS V_MEMO_AUD_PAT_SOLI_INFOR
      ,[PR_FECHA_MEMO_AUD_PATRONES_SOLICITUD_INFORMACION]  AS V_FECH_MEMO_AUD_PAT_SOLI_INFOR
      ,[PR_ND_ANTERIOR] AS V_ND_ANTERIOR
      ,[PR_POSIBLE_SUST_PAT] AS V_POSI_SUST_PAT
      ,[PR_FECH_ENVIO_AL_DEPTO_AUD_PAT] AS V_FECH_ENV_DEP_AUD_PAT
      ,[PR_FECH_RECEP_RESP_A_P] AS V_FECH_RECEP_RESP_A_P
      ,[PR_REF_FECHA_RESP_A_P] AS V_REF_FECH_RESP_A_P
      ,[PR_OBSER_AUD_A_PAT] AS V_OBSER_AUD_A_PAT
      ,[PR_VERIFICACION_DE_DOM_1] AS V_VERI_DOM1
      ,[PR_RESULTADO_1] AS V_RESULT1
      ,[PR_VERIFICACION_DE_DOM_SAT_2] AS V_VERI_DOM_SAT2
      ,[PR_NL_2] AS V_NL2
      ,[PR_RESULTADO_2] AS V_RESULT2
      ,[PR_VERIFICACION_DE_DOM_3] AS V_VERI_DOM3
      ,[PR_RESULTADO_3] AS V_RESULT3
      ,[PR_VERIFICACION_DE_DOM_4] AS VERI_DOM4
      ,[PR_RESULTADO_4] AS V_RESULT4
      ,[PR_VERIFICACION_DE_DOM_5] AS V_VERI_DOM5
      ,[PR_RESULTADO_5] AS V_RESILT5
      ,[PR_VERIFICACION_DE_DOM_6] AS V_VERI_DOM6
      ,[PR_RESULTADO_6] AS V_RESULT6
      ,[PR_VERIFICACION_DE_DOM_7] AS V_VERIF_DOM7
      ,[PR_RESULTADO_7] AS V_RESULT7
      ,[PR_VERIFICACION_DE_DOM_8] AS V_VERIF_DOM8
      ,[PR_RESULTADO_8] AS V_RESULT8
      ,[PR_VERIFICACION_DE_DOM_9] AS VERI_DOM9
      ,[PR_RESULTADO_9] AS V_RESULT9
      ,[PR_VERIFICACION_DE_DOM_10] AS V_VERI_DOM10
      ,[PR_RESULTADO_10] AS V_RESULT10
  FROM [sirecaregistros].[dbo].[CB_PROYECTO]
  where [PR_ID]=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewg" DefaultValue="0" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

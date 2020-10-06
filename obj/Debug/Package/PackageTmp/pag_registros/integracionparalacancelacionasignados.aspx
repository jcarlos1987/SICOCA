<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="integracionparalacancelacionasignados.aspx.vb" Inherits="WebSIRECA.integracionparalacancelacionasignados" %>

<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>    
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>    
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DDLIntegrador" runat="server" 
            DataSourceID="SqlDataSourceIntegrador" DataTextField="nombre" 
            DataValueField="valor">
        </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceIntegrador" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [id] as valor
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=us.id) as nombre
FROM [sireca].[dbo].[usuarios] as us
where userIntegrador='1' and subdel=? order by nombre
">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="00" Name="?" SessionField="SIRECAsubdel" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        <asp:TextBox ID="TBRegpat" runat="server" MaxLength="10" BorderStyle="Solid" 
            BorderWidth="1px"></asp:TextBox>
        <asp:Button ID="BBuscar" runat="server" Text="BUSCAR / ACTUALIZAR" BackColor="#FFF3CD" 
            BorderColor="#78859B" BorderStyle="Solid" />
                            <asp:DropDownList ID="DDLMes" runat="server" 
            AutoPostBack="True">
                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            CARGAR LOS PRIMEROS<asp:DropDownList ID="DropDownList1" 
            runat="server">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>60</asp:ListItem>
            <asp:ListItem>120</asp:ListItem>
            <asp:ListItem Value="240"></asp:ListItem>
        </asp:DropDownList>
        <hr />
    <asp:GridView ID="GVNDeligenciados" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceND" Font-Size="9pt" 
            GridLines="Vertical" AllowSorting="True" CaptionAlign="Left" 
            AllowPaging="True" 
            EmptyDataText="EL REGISTRO PATRONAL QUE CONSULTA NO FUE ENCONTRADO">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" title="control" rel="gb_page_fs[]"  
                            NavigateUrl='<%# "actualizarcontrolderangos.aspx?id_nd=" & Eval("ID_ND") & "&rango=" & Eval("RANGO") %>' 
                            Text="Control"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="FECH_ASIGNACION" DataFormatString="{0:d}" 
                    HeaderText="FECH. DE ASIG." SortExpression="FECH_ASIGNACION" />
                
                <asp:BoundField DataField="FECHA_BAJA" DataFormatString="{0:d}" 
                    HeaderText="FECHA DE LA BAJA" SortExpression="FECHA_BAJA" />
                
                <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" 
                    SortExpression="INTEGRADOR" />
                
                <asp:BoundField DataField="REG_PAT" HeaderText="REG_PAT" 
                    SortExpression="REG_PAT" />
                <asp:BoundField DataField="NOMBRE_PATRON" HeaderText="NOMBRE_PATRON" 
                    SortExpression="NOMBRE_PATRON" />
                <asp:BoundField DataField="RFC_FISICAS_13_MORALES_12" 
                    HeaderText="RFC_FISICAS_13_MORALES_12" 
                    SortExpression="RFC_FISICAS_13_MORALES_12" />
                <asp:BoundField DataField="DOMICILIO_FISCAL_IMSS" 
                    HeaderText="DOMICILIO_FISCAL_IMSS" SortExpression="DOMICILIO_FISCAL_IMSS" />
                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" 
                    SortExpression="ACTIVIDAD" />
                <asp:BoundField DataField="N_TRAB" HeaderText="N_TRAB" 
                    SortExpression="N_TRAB" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" SortExpression="RANGO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE_COP" SortExpression="IMPORTE_COP" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_RCV" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE_RCV" SortExpression="IMPORTE_RCV" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceND" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(10)
DECLARE @INTEGRADOR as VARCHAR(6)
DECLARE @MES as VARCHAR(6)
DECLARE @ANIO as VARCHAR(6)
DECLARE @TOPN as VARCHAR(6)
SET @SUBDEL=?
SET @REGPAT=?
SET @INTEGRADOR=?
SET @MES=?
SET @ANIO=?
SET @TOPN=?
exec('
SELECT TOP '+@TOPN+' nd.[ID_ND]
,cr.[C_FEC_ASIGNAC_EXP] as FECH_ASIGNACION
,case when [STATUS]=''APLICADA'' and [LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL]=''SI'' then ''listo.png''
else ''pendiente.png'' end as LISTO
      ,[SUBDEL]
	  ,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=(SELECT cr.C_INTEGRADOR FROM [sirecaregistros].[dbo].controlrangos cr WHERE cr.ID_ND=nd.ID_ND)) as INTEGRADOR
      ,[REG_PAT]
      ,[STATUS]
      ,[LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL]
      ,[OBSERVACIONES]
      ,[RFC_FISICAS_13_MORALES_12]
      ,[NOMBRE_PATRON]
      ,[DOMICILIO_FISCAL_IMSS]
      ,[SAT_ARCHIVO_DE_SOLICITUD]
      ,[SAT_FECHA_RESPUESTA]
      ,[SAT_FECHA_DE_RECEPCION_DEL_ARCHIVO]
      ,[SAT_EN_CASO_DE_HABERSE_SOLICITADO_POR_OFICIO_REFERENCIA]
      ,[SAT_FECHA_DE_LA_RESPUESTA]
      ,[SAT_SOLICITUD_CON_OFICIO]
      ,[SAT_FECHA_SOLICITUD_CON_OFICIO]
      ,[SAT_DOMICILIO]
      ,[ACTIVIDAD]
      ,[FECHA_ACTA_CIRCUNST]
      ,[FECHA_RECEP_IMPED_COBRO]
      ,[FECHA_RECEPCION_DEL_ACTA_CIRCUNSTANCIADA]
      ,[FECHA_AFIL_ALTA]
      ,[FECHA_INF_REL_LAB_INEX]
      ,[FECHA_MEMO_BAJA]
      ,[NUMERO_MEMO_BAJA]
      ,[FECHA_BAJA]
      ,[ENCARGADO_MESA_CREDITOS_CON_IMPED_COBRO]
      ,[JEFE_LA_OFICINA_REGISTROS_Y_CONTROL_LA_CARTERA]
      ,[JEFE_DEPTO_AFILIACION_Y_VIGENCIA_DERECHOS]
      ,[TITULAR_SUBDELEG]
      ,[N_TRAB]
      ,[PROCE_ND_QUE_ORIG_BAJA]
      ,[REFERENCIA_N_CED_CAPT_O_REF_DE_MEMO]
      ,[FECHA_REFERENCIA_LA_CEDULA]
      ,[FECHA_REFERENCIA_CAPT]
      ,[FECHA_REFERENCIA_MEMO]
      ,[NOMBRE_DEL_NL_QUE_VERIFICA_EL_FISCAL]
      ,[FECHA_ENT_DEV_NL]
      ,[RESULTADO_DE_LA_VERIFICACION_DEL_DOMICILIO_FISCAL]
      ,[NOMBRE_LOCALIZADOR]
      ,[FECHA_ENT_DEV_LOCALIZADOR]
      ,[NOMBRE_NL_VERIFICA_SAT_SOLO_CASO_QUE_FISCAL_Y_SAT_SEAN_DIFERENTE]
      ,[FECHA_ENT_DEV_NL_QUE_VERIFICA_EL_SAT_EN_CASO_DE_QUE_FISCAL_Y_SAT_S]
      ,[ELABORO]
      ,[REF_MEMO_AFILIACION_CON_QUE_ENVIA_EL_AFIL_DE_BAJA]
      ,[FECHA_RECEPCION_DEL_MEMO_DE_AFILIACION]
      ,[RANGO]
      ,[IMPORTE_COP]
      ,[IMPORTE_RCV]
      ,[REF_MEMO_AFILIACION_PARA_INVEST_INTERNA]
      ,[FECHA_MEMO_AFILIACION_PARA_INTERNA_ENTREGA_DEVOLUCION]
      ,[ND_ANTERIOR]
      ,[POSIBLE_SUST_PAT]
      ,[FECHA_ENVIO_AL_DEPTO_AUD_PAT]
      ,[OBSERVACION_AUDITORIA]
  FROM [sirecaregistros].[dbo].[nodiligenciados] as nd left join [sirecaregistros].[dbo].[controlrangos] as cr on
  nd.[ID_ND]=cr.[ID_ND]
WHERE [SUBDEL]='''+@SUBDEL+''' and [REG_PAT] like '''+@REGPAT+'''+''%''
and ([LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] in (''SI'')
and [STATUS] in (''APLICADA''))
and (SELECT cr.C_INTEGRADOR FROM [sirecaregistros].[dbo].controlrangos cr WHERE cr.ID_ND=nd.ID_ND) is not null
and (SELECT cr.C_INTEGRADOR FROM [sirecaregistros].[dbo].controlrangos cr WHERE cr.ID_ND=nd.ID_ND) like '''+@INTEGRADOR+'''
and month([C_FEC_ASIGNAC_EXP])='''+@MES+''' and year([C_FEC_ASIGNAC_EXP])='''+@ANIO+'''
order by LISTO desc
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DDLIntegrador" DefaultValue="%" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="5" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>


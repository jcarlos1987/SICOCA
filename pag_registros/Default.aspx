<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default19" %>
<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:TextBox ID="TBRegpat" runat="server" MaxLength="10" BorderStyle="Solid" 
            BorderWidth="1px"></asp:TextBox>
        <asp:Button ID="BBuscar" runat="server" Text="BUSCAR" BackColor="#FFF3CD" 
            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" />
        <asp:ImageButton ID="ImageButton5" runat="server" Height="25px" 
            ImageAlign="Middle" ImageUrl="~/imagenes/exportarexcel.png" Width="25px" />&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/pag_registros/ActualizarND.aspx?tipo=reg">Nuevo NO DELIGENCIADO</asp:HyperLink>
        <hr />
        <asp:GridView ID="GVNDeligenciados" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceND" Font-Size="9pt" 
            GridLines="Vertical" AllowSorting="True" CaptionAlign="Left" 
            AllowPaging="True" 
            EmptyDataText="EL REGISTRO PATRONAL QUE CONSULTA NO FUE ENCONTRADO">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:HyperLinkField Text="Actualizar" 
                    NavigateUrl="~/pag_registros/ActualizarND.aspx" 
                    DataNavigateUrlFields="ID_ND" 
                    DataNavigateUrlFormatString="ActualizarND.aspx?tipo=act&amp;id_nd={0}&estatus=n" />
                <asp:TemplateField SortExpression="LISTO" HeaderText="COMPLETO¿?">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/imagenes/" & Eval("LISTO") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LISTO") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" 
                    SortExpression="STATUS" />
                <asp:BoundField DataField="LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL" 
                    HeaderText="LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL" 
                    SortExpression="LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL" />
                <asp:BoundField DataField="REG_PAT" HeaderText="REG_PAT" 
                    SortExpression="REG_PAT" />
                <asp:BoundField DataField="NOMBRE_PATRON" HeaderText="NOMBRE_PATRON" 
                    SortExpression="NOMBRE_PATRON" />
                <asp:BoundField DataField="RFC_FISICAS_13_MORALES_12" HeaderText="RFC_FISICAS_13_MORALES_12" 
                    SortExpression="RFC_FISICAS_13_MORALES_12" />
                <asp:BoundField DataField="DOMICILIO_FISCAL_IMSS" 
                    HeaderText="DOMICILIO_FISCAL_IMSS" SortExpression="DOMICILIO_FISCAL_IMSS" />
                <asp:BoundField DataField="ACTIVIDAD" HeaderText="ACTIVIDAD" 
                    SortExpression="ACTIVIDAD" />
                <asp:BoundField DataField="N_TRAB" HeaderText="N_TRAB" 
                    SortExpression="N_TRAB" />
                <asp:BoundField DataField="RANGO" HeaderText="RANGO" SortExpression="RANGO" />
                <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:N}" 
                    HeaderText="IMPORTE_COP" SortExpression="IMPORTE_COP" />
                <asp:BoundField DataField="IMPORTE_RCV" DataFormatString="{0:N}" 
                    HeaderText="IMPORTE_RCV" SortExpression="IMPORTE_RCV" />
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
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ID_ND]
,case when [STATUS]='APLICADA' and [LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL]='SI' then 'listo.png'
else 'pendiente.png' end as LISTO
      ,[SUBDEL]
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
  FROM [sirecaregistros].[dbo].[nodiligenciados]
WHERE [SUBDEL]=? and [REG_PAT] like ?+'%'
and (([LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] not in ('SI') or [LOCALIZADO_SIN_RELACION_OBRERO_PATRONAL] is null)
and ([STATUS] not in ('APLICADA') or [STATUS] is null))
order by LISTO desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>


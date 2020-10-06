<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo3.Master" CodeBehind="casos.aspx.vb" Inherits="WebSIRECA.casos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<center >
<div class="btn-group input-prepend">
        <span class="add-on"><i class="icon-search"></i></span>
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                Width="120px">
            </asp:DropDownList>
        <asp:TextBox ID="TBBuscar" runat="server" MaxLength="10" placeholder="REG. PATRONAL" 
            TabIndex="9" Width="130px"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CssClass="btn">BUSCAR</asp:LinkButton>
</div> 
</center>
    <asp:GridView ID="GridViewAvance" runat="server" AutoGenerateColumns="False" 
        Caption="AVANCE DE CASOS" DataSourceID="SqlDataSourceAvance" 
        HorizontalAlign="Center" AllowSorting="True" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="RANGO" HeaderText="RANGO" ReadOnly="True" 
                SortExpression="RANGO">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="REG. PATRONAL" SortExpression="REGPAT">
                <ItemTemplate>
                    <asp:LinkButton ID="LBRegPat" runat="server" Text='<%# Eval("REGPAT", "{0:N0}") %>'></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                HeaderText="IMPORTE C.O.P." ReadOnly="True" SortExpression="IMPORTE_COP">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="AVANCE_MIN" DataFormatString="{0:P}" 
                HeaderText="AVANCE MIN." SortExpression="AVANCE_MIN">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="AVANCE_MAX" DataFormatString="{0:P}" 
                HeaderText="AVANCE MAX." SortExpression="AVANCE_MAX">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceAvance" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
SET @SUBDEL=?
SELECT 
'subdel='+@SUBDEL+'&amp;rango='+RANGO+'&amp;rangoavance=0' as VURL
,RANGO,COUNT(REGPAT) as REGPAT,SUM(IMPORTE_COP) as IMPORTE_COP,MIN(AVANCE) as AVANCE_MIN,MAX(AVANCE) as AVANCE_MAX FROM (
SELECT 
SUBDEL,RANGO,REGPAT,RAZON,IMPORTE_COP,FECHA_BAJA,INTEGRADOR,FECHA_ASIG
,AVANCE
,(CASE 
WHEN AVANCE&lt;=0.20 THEN 'ENTRE 0 y 20%'
WHEN AVANCE&gt;0.20 AND AVANCE&lt;=0.40 THEN 'ENTRE 21 y 40%'
WHEN AVANCE&gt;0.40 AND AVANCE&lt;=0.60 THEN 'ENTRE 41 y 60%'
WHEN AVANCE&gt;0.60 AND AVANCE&lt;=0.80 THEN 'ENTRE 61 y 80%'
WHEN AVANCE&gt;0.80 AND AVANCE&lt;=1.0 THEN 'ENTRE 81 y 100%'
END) AS RANGO_AVANCE
FROM (
SELECT 
[G_Subdel] as SUBDEL
,[G_Rango] as RANGO
,[G_RegPat] as REGPAT
,[G_RazonSocial] as RAZON
,[G_ImporteCOP] as IMPORTE_COP
,[G_FechaBaja] as FECHA_BAJA
,[G_ID_Integrador] as INTEGRADOR
,[G_FechaAsignacion] as FECHA_ASIG
,ROUND((((case when [G_Estatus] is null then 0 else 1 end)
+(case when [G_Rango] is null then 0 else 1 end)
+(case when [G_RegPat] is null then 0 else 1 end)
+(case when [G_RazonSocial] is null then 0 else 1 end)
+(case when [G_ImporteCOP] is null then 0 else 1 end)
+(case when [G_ImporteRCV] is null then 0 else 1 end)
+(case when [G_FechaBaja] is null then 0 else 1 end)
+(case when [G_AreaSolicitaLaBaja] is null then 0 else 1 end)
+(case when [G_DocInformaEsPatronNL] is null then 0 else 1 end)
+(case when [G_ID_Integrador] is null then 0 else 1 end)
+(case when [G_FechaAsignacion] is null then 0 else 1 end)
+(case when [II_FolioCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FSCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FRCatalogoContResultDeptoCobranza] is null then 0 else 1 end)
+(case when [II_FolioOfnaEPO] is null then 0 else 1 end)
+(case when [II_SOfnaEPO] is null then 0 else 1 end)
+(case when [II_ROfnaEPO] is null then 0 else 1 end)
+(case when [II_FolioOfnaCobros] is null then 0 else 1 end)
+(case when [II_SOfnaCobros] is null then 0 else 1 end)
+(case when [II_ROfnaCobros] is null then 0 else 1 end)
+(case when [II_FolioExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_SExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_RExpeConveyGarantia] is null then 0 else 1 end)
+(case when [II_SINDO] is null then 0 else 1 end)
+(case when [II_FolioDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_SDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_RDeptoAfiliacion] is null then 0 else 1 end)
+(case when [II_FolioDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_SDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_RDeptoAuditoria] is null then 0 else 1 end)
+(case when [II_FolioServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_SServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_RServiciosJuridicos] is null then 0 else 1 end)
+(case when [II_SeccBca] is null then 0 else 1 end)
+(case when [II_SeccAma] is null then 0 else 1 end)
+(case when [II_SIEM] is null then 0 else 1 end)
+(case when [II_COMPRA_NET] is null then 0 else 1 end)
+(case when [IE_SAT_DF_Folio] is null then 0 else 1 end)
+(case when [IE_SAT_DF_S] is null then 0 else 1 end)
+(case when [IE_SAT_DF_R] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_Folio] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_S] is null then 0 else 1 end)
+(case when [IE_SAT_Foraneo_R] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_Folio] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_S] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_DF_R] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_Folio] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_S] is null then 0 else 1 end)
+(case when [IE_III_Tesoreria_Foraneo_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FM_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_PATRON_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_DF_SOCIO_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FM_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_PATRON_FR_R] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_S] is null then 0 else 1 end)
+(case when [IE_IV_RPPC_Foraneo_SOCIO_FR_R] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_Folio] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_S] is null then 0 else 1 end)
+(case when [IE_V_ArchivoGralNotarias_R] is null then 0 else 1 end)
+(case when [IC_FolioVisitaDomFiscal] is null then 0 else 1 end)
+(case when [IC_SVisitaDomFiscal] is null then 0 else 1 end)
+(case when [IC_FolioVisitaSocios] is null then 0 else 1 end)
+(case when [IC_SVisitaSocios] is null then 0 else 1 end)
+(case when [IC_FolioEntrevista3Vecinos] is null then 0 else 1 end)
+(case when [IC_SEntrevista3Vecinos] is null then 0 else 1 end)
+(case when [IC_FolioEntrevista3Trabajadores] is null then 0 else 1 end)
+(case when [IC_SEntrevista3Trabajadores] is null then 0 else 1 end)
+(case when [IC_FolioVisitasForaneas] is null then 0 else 1 end)
+(case when [IC_SVisitasForaneas] is null then 0 else 1 end)
+(case when [IC_RVisitasForaneas] is null then 0 else 1 end))
-(case G_Rango
when 'I' then 29
when 'II' then 29
when 'III' then 21
when 'IV' then 3
when 'V' then 0
else 0 end))
/(82.00-(case G_Rango
when 'I' then 29.00
when 'II' then 29.00
when 'III' then 21.00
when 'IV' then 3.00
when 'V' then 0.00
else 0 end)),2) as AVANCE
FROM [sirecaregistros].[dbo].[NL_General]
left join [sirecaregistros].[dbo].[NL_InvestInterna] on II_G_ID=[G_ID]
left join [sirecaregistros].[dbo].[NL_InvestExterna] on IE_G_ID=[G_ID]
left join [sirecaregistros].[dbo].[NL_InvestCampo] on IC_G_ID=[G_ID]
WHERE G_Subdel LIKE @SUBDEL
) as RESULTADO1
) as RESULTADO2
GROUP BY RANGO--,RANGO_AVANCE
ORDER BY RANGO--,RANGO_AVANCE
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="abc" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewCasos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceCasos" HorizontalAlign="Center" 
        AllowPaging="True" AllowSorting="True" Font-Size="10pt">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                SortExpression="SUBDEL" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="RANGO" HeaderText="RANGO" SortExpression="RANGO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="REGPAT" 
                    DataNavigateUrlFormatString="../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon&amp;tipo=3" 
                    DataTextField="REGPAT" HeaderText="REG.PATRONAL" SortExpression="REGPAT" 
                    Target="_blank" >
            <ControlStyle Font-Underline="False" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="RAZON" HeaderText="RAZON" SortExpression="RAZON" />
            <asp:BoundField DataField="IMPORTE_COP" HeaderText="IMPORTE COP" 
                SortExpression="IMPORTE_COP" DataFormatString="{0:C}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_BAJA" HeaderText="FECHA BAJA" 
                SortExpression="FECHA_BAJA" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INTEGRADOR" HeaderText="INTEGRADOR" ReadOnly="True" 
                SortExpression="INTEGRADOR" />
            <asp:BoundField DataField="FECHA_PROGRAMADA" HeaderText="FECHA PROGRAMADA" 
                SortExpression="FECHA_PROGRAMADA" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <PagerSettings Position="TopAndBottom" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCasos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [G_ID] AS ID
      ,[G_Subdel] AS SUBDEL
      ,[G_Rango] AS RANGO
      ,[G_RegPat] AS REGPAT
      ,[G_RazonSocial] AS RAZON
      ,[G_ImporteCOP] AS IMPORTE_COP
      ,[G_FechaBaja] AS FECHA_BAJA
      ,(SELECT upper(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[G_ID_Integrador]) AS INTEGRADOR
      ,[G_FechaAsignacion] AS FECHA_PROGRAMADA
  FROM [sirecaregistros].[dbo].[NL_General]
  WHERE [G_Subdel]=? and [G_RegPat]  like ?+'%'">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBBuscar" DefaultValue="abc" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

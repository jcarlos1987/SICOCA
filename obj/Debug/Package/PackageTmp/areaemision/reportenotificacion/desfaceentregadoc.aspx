<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="desfaceentregadoc.aspx.vb" Inherits="WebSIRECA.desfaceentregadoc" %>
<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID ="head">
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
<center>
<div class="btn-group input-prepend">
<asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="120px">
</asp:DropDownList>
<span class="add-on">
                                            <asp:Label ID="Label4" runat="server" Text="FACTURAS DEL AÑO:"></asp:Label>
</span>
    <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="80px" >
    </asp:DropDownList>
</div>
</center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Caption="DESFACE DE DIAS DE ENTREGA" DataSourceID="SqlDataSource1" 
            AllowSorting="True" HorizontalAlign="Center" CellPadding="1" 
        CellSpacing="1" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FACTURA" HeaderText="FACTURA" ReadOnly="True" 
                    SortExpression="FACTURA" />
                <asp:BoundField DataField="CIFRA_CONTROL" HeaderText="CIFRA CONTROL" 
                    ReadOnly="True" SortExpression="CIFRA_CONTROL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_INICIO_NOT" 
                    HeaderText="INICIO NOT." ReadOnly="True" 
                    SortExpression="FECHA_INICIO_NOT" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_TERMINO_NOT" HeaderText="TERMINO NOT." 
                    ReadOnly="True" SortExpression="FECHA_TERMINO_NOT" 
                    DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_ENTREGA" HeaderText="RECEPCION EN SUBDEL." ReadOnly="True" 
                    SortExpression="FECHA_ENTREGA" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DESFACE_RECEPCION" DataFormatString="{0:N0}" 
                    HeaderText="DESFACE RECEPCION" 
                    SortExpression="DESFACE_RECEPCION" ReadOnly="True">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_TERMINO_NOT_REP" DataFormatString="{0:d}" 
                    HeaderText="TERMINO NOT. REPORTADO" ReadOnly="True" 
                    SortExpression="FECHA_TERMINO_NOT_REP">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DESFACE_NOTIFICACION" DataFormatString="{0:N0}" 
                    HeaderText="DESFACE NOTIFICACION" ReadOnly="True" 
                    SortExpression="DESFACE_NOTIFICACION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
SET @SUBDEL=?
SET @ANIO=?
IF @SUBDEL='%'
BEGIN
	SET @SUBDEL=''
END
exec('
select distinct 
'''+@SUBDEL+''' AS SUBDEL
,(SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=FACTURA) AS FACTURA
,CIFRA_CONTROL,PERIODO

,FECHA_INICIO_NOT
,FECHA_TERMINO_NOT
,FECHA_ENTREGA
,sirecacobros.dbo.diasInabiles(FECHA_INICIO_NOT,FECHA_ENTREGA) as DESFACE_RECEPCION
,FECHA_TERMINO_NOT_REP
,sirecacobros.dbo.diasInabiles(FECHA_TERMINO_NOT,FECHA_TERMINO_NOT_REP)-sirecacobros.dbo.diasInabiles(FECHA_INICIO_NOT,FECHA_ENTREGA)
as DESFACE_NOTIFICACION
 from (
SELECT [E_TIPO_FACTURA] as FACTURA
,g_cifraControl as CIFRA_CONTROL
,substring(convert(varchar(10),E_PERIODO,103),7,4) + ''/'' + substring(convert(varchar(10),E_PERIODO,103),4,2) as PERIODO
,g_entregaProducSup as FECHA_ENTREGA_CALENDARIO
,[E_ENTREGA_INFORMATICA] AS FECHA_ENTREGA
--,sirecacobros.dbo.diasInabiles(g_entregaProducSup,[E_ENTREGA_INFORMATICA]) as DESFACE
,E_DESFACE_NOT_CIFR'+@SUBDEL+' as FECHA_TERMINO_NOT_REP
,g_perNotInicio AS FECHA_INICIO_NOT
,g_perNotTermino AS FECHA_TERMINO_NOT
FROM [sireca].[dbo].[E_CONTCIFRA_ENTREGA] 
left join
[sireca].[dbo].[E_CONTCIFRA] on g_cifraControl=[E_CIFRA_CONTROL]
and (case 
when g_tipoProceso=''COP'' and g_perioEmiMensual is not null then ''COP''
when g_tipoProceso=''COMP'' and g_perioEmiMensual is not null then ''COMP''
else ''x''
end
)=[E_TIPO_FACTURA]
where [E_TIPO_FACTURA] in (''COP'',''COMP'')
and g_perioEmiMensual is not null
union all
SELECT [E_TIPO_FACTURA] as FACTURA
,g_cifraControl as CIFRA_CONTROL
,substring(convert(varchar(10),E_PERIODO,103),7,4) + ''/'' + substring(convert(varchar(10),E_PERIODO,103),4,2) as PERIODO
,g_entregaProducSup as FECHA_ENTREGA_CALENDARIO
,[E_ENTREGA_INFORMATICA] AS FECHA_ENTREGA
--,sirecacobros.dbo.diasInabiles(g_entregaProducSup,[E_ENTREGA_INFORMATICA]) as DESFACE
,E_DESFACE_NOT_CIFR'+@SUBDEL+' as FECHA_TERMINO_NOT_REP
,g_perNotInicio AS FECHA_INICIO_NOT
,g_perNotTermino AS FECHA_TERMINO_NOT
FROM [sireca].[dbo].[E_CONTCIFRA_ENTREGA]
left join
[sireca].[dbo].[E_CONTCIFRA] on g_cifraControl=[E_CIFRA_CONTROL]
and (case 
when g_tipoProceso=''COP'' and g_perioEmiBimestral is not null then ''RCV''
when g_tipoProceso=''COMP'' and g_perioEmiBimestral is not null then ''RCVCOMP''
else ''x''
end
)=[E_TIPO_FACTURA]
where [E_TIPO_FACTURA] in (''RCV'',''RCVCOMP'')
and g_perioEmiBimestral is not null
union all
SELECT [E_TIPO_FACTURA] as FACTURA
,g_cifraControl as CIFRA_CONTROL
,substring(convert(varchar(10),E_PERIODO,103),7,4) + ''/'' + substring(convert(varchar(10),E_PERIODO,103),4,2) as PERIODO
,g_entregaProducSup as FECHA_ENTREGA_CALENDARIO
,[E_ENTREGA_INFORMATICA] AS FECHA_ENTREGA
--,sirecacobros.dbo.diasInabiles(g_entregaProducSup,[E_ENTREGA_INFORMATICA]) as DESFACE
,E_DESFACE_NOT_CIFR'+@SUBDEL+' as FECHA_TERMINO_NOT_REP
,g_perNotInicio AS FECHA_INICIO_NOT
,g_perNotTermino AS FECHA_TERMINO_NOT
FROM [sireca].[dbo].[E_CONTCIFRA_ENTREGA]
left join
[sireca].[dbo].[E_CONTCIFRA] on g_cifraControl=[E_CIFRA_CONTROL]
and (case 
when g_tipoProceso=''SIVEPA_OPORT'' and g_perioEmiBimestral is not null then ''SIVEPA-RCVSIVEPA_OPORT''
when g_tipoProceso=''SIVEPA_EXTEM'' and g_perioEmiBimestral is not null then ''SIVEPA-RCVSIVEPA_EXTEM''
else ''x''
end
)=[E_TIPO_FACTURA]
where [E_TIPO_FACTURA] in (''SIVEPA-RCVSIVEPA_OPORT'',''SIVEPA-RCVSIVEPA_EXTEM'')
and g_perioEmiBimestral is not null
union all
SELECT [E_TIPO_FACTURA] as FACTURA
,g_cifraControl as CIFRA_CONTROL
,substring(convert(varchar(10),E_PERIODO,103),7,4) + ''/'' + substring(convert(varchar(10),E_PERIODO,103),4,2) as PERIODO
,g_entregaProducSup as FECHA_ENTREGA_CALENDARIO
,[E_ENTREGA_INFORMATICA] AS FECHA_ENTREGA
--,sirecacobros.dbo.diasInabiles(g_entregaProducSup,[E_ENTREGA_INFORMATICA]) as DESFACE
,E_DESFACE_NOT_CIFR'+@SUBDEL+' as FECHA_TERMINO_NOT_REP
,g_perNotInicio AS FECHA_INICIO_NOT
,g_perNotTermino AS FECHA_TERMINO_NOT
FROM [sireca].[dbo].[E_CONTCIFRA_ENTREGA]
left join
[sireca].[dbo].[E_CONTCIFRA] on g_cifraControl=[E_CIFRA_CONTROL]
and (case 
when g_tipoProceso=''SIVEPA_OPORT'' and g_perioEmiMensual is not null then ''SIVEPA-IMSSSIVEPA_OPORT''
when g_tipoProceso=''SIVEPA_EXTEM'' and g_perioEmiMensual is not null then ''SIVEPA-IMSSSIVEPA_EXTEM''
else ''x''
end
)=[E_TIPO_FACTURA]
where [E_TIPO_FACTURA] in (''SIVEPA-IMSSSIVEPA_OPORT'',''SIVEPA-IMSSSIVEPA_EXTEM'')
and g_perioEmiMensual is not null
) as resultado
where year(FECHA_ENTREGA_CALENDARIO)='+@ANIO+'
--order by FECHA_ENTREGA_CALENDARIO desc
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

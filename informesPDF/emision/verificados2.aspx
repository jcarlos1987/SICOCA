<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="verificados2.aspx.vb" Inherits="WebSIRECA.verificados2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VERIFICADOS</title>
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            Caption="&lt;strong&gt;DESCRIPCION DE LOS CREDITOS VERIFICADOS&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FECHA_ASIGNACION" HeaderText="FECHA ASIGNACION" 
                    SortExpression="V_FECHA_ASIGNACION" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="FOLIO" SortExpression="V_FOLIO_P1">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("V_FOLIO_P1") %>' PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="ECO" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CREDITOS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible='<%# IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","false","true")%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible='<%# IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false")%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CREDITOS / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" Visible='<%# IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false")%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%",Eval("V_URL_FOLIO") & "%") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 

'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]+'&amp;vinc='
+V_CONFIRMO_INC_P2+'&amp;eco='+V_TIPO_ECO
+'&amp;folio='+(case when V_FOLIO_P2 is null then '0' else V_FOLIO_P2 end)+'&amp;ori_mul='
 as V_URL_FOLIO
,'reporte2.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]+'&amp;vinc='
+V_CONFIRMO_INC_P2+'&amp;eco='+V_TIPO_ECO
+'&amp;folio='+(case when V_FOLIO_P2 is null then '0' else V_FOLIO_P2 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
 
,[V_SUBDEL]
,V_TIPO_ECO
,V_FOLIO_P2
,V_CONFIRMO_INC_P2
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P2 is null then '0' else V_FOLIO_P2 end) as V_FOLIO_P2
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like ? and V_FOLIO_P1 is not null
group by [V_SUBDEL],V_TIPO_ECO,V_FOLIO_P2,V_CONFIRMO_INC_P2
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenFieldSubdel" runat="server" Value="0" />
    <hr />
        <asp:GridView ID="GridViewFolios" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CssClass="table-bordered" 
            DataSourceID="SqlDataSourceFolios" Font-Size="9pt" 
            HorizontalAlign="Center" AllowPaging="True" 
            Caption="&lt;strong&gt;DESCRIPCION DE LOS FOLIOS CREADOS&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="V_SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="FOLIO" SortExpression="V_FOLIO">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("V_FOLIO") %>' PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_CONFIRMADO" DataFormatString="{0:d}" 
                    HeaderText="CONFIRMADO" ReadOnly="True" SortExpression="V_CONFIRMADO" >
                <ItemStyle ForeColor="#006600" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_CONFIRMO" HeaderText="CONFIRMO" ReadOnly="True" 
                    SortExpression="V_CONFIRMO" >
                <ItemStyle ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_TURNO" DataFormatString="{0:d}" HeaderText="TURNO" 
                    ReadOnly="True" SortExpression="V_TURNO" >
                <ItemStyle ForeColor="#CC0000" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_TURNADO" HeaderText="TURNADO" ReadOnly="True" 
                    SortExpression="V_TURNADO" >
                <ItemStyle ForeColor="#CC0000" />
                </asp:BoundField>
                <asp:BoundField DataField="V_DESCRIPCION" HeaderText="DESCRIPCION" 
                    ReadOnly="True" SortExpression="V_DESCRIPCION" />
            </Columns>
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceFolios" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select V_SUBDEL
,V_FOLIO
,convert(datetime,V_CONFIRMADO,103) as V_CONFIRMADO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_CONFIRMO) as V_CONFIRMO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_TURNADO) as V_TURNADO
,convert(datetime,V_TURNO,103) as V_TURNO
,V_DESCRIPCION from (
SELECT 
V_SUBDEL
,[V_FOLIO_P1] as V_FOLIO
,convert(varchar(10),[V_FECHA_CONFIRMACION_INC_P1],103) as V_CONFIRMADO
,[V_ID_CONFIRMO_P1] as V_CONFIRMO
,[V_FOLIO_P1_TURNADO_A] as V_TURNADO
,convert(varchar(10),[V_FECHA_P1_TURNADO],103) as V_TURNO
,[V_FOLIO_P1_OBSERVACION] as V_DESCRIPCION
FROM [sirecaemisiones].[dbo].[eco]
union all
SELECT 
V_SUBDEL
,[V_FOLIO_P2] as V_FOLIO
,convert(varchar(10),[V_FECHA_CONFIRMACION_INC_P2],103) as V_CONFIRMADO
,[V_CONFIRMO_INC_P2] as V_CONFIRMO
,[V_FOLIO_P2_TURNADO_A] as V_TURNADO
,convert(varchar(10),[V_FECHA_P2_TURNADO],103) as V_TURNO
,[V_FOLIO_P2_OBSERVACION] as V_DESCRIPCION
FROM [sirecaemisiones].[dbo].[eco]
) as resultado
where V_SUBDEL like ? and [V_FOLIO] is not null
group by 
V_SUBDEL,V_FOLIO,V_CONFIRMADO,V_CONFIRMO,V_TURNADO,V_TURNO,V_DESCRIPCION">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

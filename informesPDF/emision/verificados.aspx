<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="verificados.aspx.vb" Inherits="WebSIRECA.verificados" %>

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
    
        <asp:GridView ID="GridViewNotF" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceNotF" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS SIN FOLIO ECO&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("V_FOLIO_P1") %>' PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=" & Eval("V_FECHA_CAPTURA")  & "&tipo_eco=" & Eval("V_TIPO_ECO") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="ECO" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA DE DILIGENCIA" 
                    SortExpression="V_FECHA_CAPTURA">
                <ItemStyle Font-Bold="True" ForeColor="#006600" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","false","true"),"false")%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false"),"false")%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton8" runat="server" Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton10" runat="server" Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                           <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-warning" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
<center>

        <asp:GridView ID="GridViewNotF1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceNotFSivepas" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS SIN FOLIO SIVEPAS&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton26" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=" & Eval("V_FECHA_CAPTURA")  & "&tipo_eco=" & Eval("V_TIPO_ECO") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="SIVEPA" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA DE DILIGENCIA" 
                    SortExpression="V_FECHA_CAPTURA">
                <ItemStyle Font-Bold="True" ForeColor="#006600" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton27" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="SIVEPA-IMSS","false","true"),"false")%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton28" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="SIVEPA-RCV","true","false"),"false")%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton29" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="SIVEPA-IMSS","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton30" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="SIVEPA-IMSS","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton31" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="SIVEPA-IMSS","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                           <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-warning" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceNotF" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT 
'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103) as V_FECHA_CAPTURA
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and  V_INC_CAPTURA not in ('RE','POR PROCESAR','PAGADO','A','9')
and V_FOLIO_P1 is null
group by [V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
,V_FOLIO_P1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceNotFSivepas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT 
'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103) as V_FECHA_CAPTURA
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and  V_INC_CAPTURA not in ('RE','POR PROCESAR','PAGADO','A','9')
and V_FOLIO_P1 is null
group by [V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
,V_FOLIO_P1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceP" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS SIN FOLIO ECO&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton4" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=0"  & "&tipo_eco=" & Eval("V_TIPO_ECO") %>'></asp:LinkButton>
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
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","false","true"),"false")%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton6" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false"),"false")%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton7" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton9" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton11" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                            <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-warning" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
    
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourcePSivepas" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS SIN FOLIO SIVEPAS&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton32" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=0"  & "&tipo_eco=" & Eval("V_TIPO_ECO") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="SIVEPA" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton33" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="SIVEPA-IMSS/SIVEPA-RCV","false","true"),"false")%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton34" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="SIVEPA-RCV","true","false"),"false")%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton35" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="SIVEPA-IMSS/SIVEPA-RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton36" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="SIVEPA-IMSS/SIVEPA-RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton37" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="SIVEPA-IMSS/SIVEPA-RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                            <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-warning" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceP" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT 
'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and V_INC_CAPTURA not in ('2')
and V_FOLIO_P1 is null
group by [V_SUBDEL]
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
,V_FOLIO_P1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePSivepas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?

SELECT 
'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and V_INC_CAPTURA not in ('2')
and V_FOLIO_P1 is null
group by [V_SUBDEL]
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
,V_FOLIO_P1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
            </SelectParameters>
        </asp:SqlDataSource>
<div class="btn-group input-prepend">    
<span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="Folios del Año"></asp:Label>
</span>
        <asp:DropDownList ID="DDLAnio" runat="server" Width="100px" 
        AutoPostBack="True">
        </asp:DropDownList>
</div>
</center>
    
        <asp:GridView ID="GridViewNotF0" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceNotF0" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS CON FOLIO ECO&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton12" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=" & Eval("V_FECHA_CAPTURA")  & "&tipo_eco=" & Eval("V_TIPO_ECO") & "&anio=" & Eval("ANIO") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="ECO" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA DE DILIGENCIA" 
                    SortExpression="V_FECHA_CAPTURA">
                <ItemStyle Font-Bold="True" ForeColor="#006600" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton13" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","false","true"),"false")%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton14" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false"),"false")%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton24" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO_BARRA") & "%&export=PDF") %>'>
                            <i class="icon-barcode" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton15" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton16" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton17" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                           <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-success" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
    
        <asp:GridView ID="GridViewNotF2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceNotF0Sivepas" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS CON FOLIO SIVEPAS&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton38" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=" & Eval("V_FECHA_CAPTURA")  & "&tipo_eco=" & Eval("V_TIPO_ECO") & "&anio=" & Eval("ANIO") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="ECO" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FECHA_CAPTURA" HeaderText="FECHA DE DILIGENCIA" 
                    SortExpression="V_FECHA_CAPTURA">
                <ItemStyle Font-Bold="True" ForeColor="#006600" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="INC. CAPTURA" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton39" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","false","true"),"false")%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton40" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false"),"false")%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton41" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO_BARRA") & "%&export=PDF") %>'>
                            <i class="icon-barcode" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton42" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton43" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton44" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="COP","true","false"),IIF(Eval("V_INC_CAPTURA")="2","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                           <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-success" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNotF0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?
SET @ANIO =?

SELECT 
@ANIO as ANIO
,'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
 ,'ceduladecapturabarra.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO_BARRA
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103) as V_FECHA_CAPTURA
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and  V_INC_CAPTURA not in ('RE','POR PROCESAR','PAGADO','A','9')
and V_FOLIO_P1 is not null
and year(V_FECHA_P1_TURNADO)=@ANIO
group by [V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
,V_FOLIO_P1
,V_FECHA_P1_TURNADO
order by V_FECHA_P1_TURNADO desc
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceNotF0Sivepas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?
SET @ANIO =?

SELECT 
@ANIO as ANIO
,'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
 ,'ceduladecapturabarra.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO_BARRA
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
+'&amp;vfechacaptura='+convert(varchar(10),[V_FECHA_CAPTURA],103)
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103) as V_FECHA_CAPTURA
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and  V_INC_CAPTURA not in ('RE','POR PROCESAR','PAGADO','A','9')
and V_FOLIO_P1 is not null
and year(V_FECHA_P1_TURNADO)=@ANIO
group by [V_SUBDEL]
,convert(varchar(10),[V_FECHA_CAPTURA],103)
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then V_TIPO_ECO else V_TIPO_ECO end)
,V_FOLIO_P1
,V_FECHA_P1_TURNADO
order by V_FECHA_P1_TURNADO desc
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceP0" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS CON FOLIO ECO&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton18" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=0" & "&tipo_eco=" & Eval("V_TIPO_ECO") & "&anio=" & Eval("ANIO") %>'></asp:LinkButton>
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
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton19" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","false","true"),"false")%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton20" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false"),"false")%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton25" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO_BARRA") & "%&export=PDF") %>'>
                            <i class="icon-barcode" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton21" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton22" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton23" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                            <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-success" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
    
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceP0Sivepas" AllowSorting="True" 
            CssClass="table-bordered" Font-Size="9pt" HorizontalAlign="Center" 
            AllowPaging="True" 
            
            
            
            Caption="&lt;strong&gt;CREDITOS VERIFICADOS CON FOLIO SIVEPAS&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="V_SUBDEL" >
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
                        <asp:LinkButton ID="LinkButton45" runat="server" 
                            Text='<%# Eval("V_FOLIO_P1") %>' 
                            
                            
                            PostBackUrl='<%# "~/informesPDF/emision/detallescredfoliados.aspx?folio=" & Eval("V_FOLIO_P1") & "&subdel=" & Eval("V_SUBDEL") & "&inc_captura=" & Eval("V_INC_CAPTURA") & "&fecha_captura=0" & "&tipo_eco=" & Eval("V_TIPO_ECO") & "&anio=" & Eval("ANIO") %>'></asp:LinkButton>
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
                <asp:TemplateField HeaderText="ORIGEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton46" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","false","true"),"false")%>' 
                            
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "ORIGEN",Eval("V_URL_FOLIO") & "ORIGEN") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton47" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="2" and Eval("V_TIPO_ECO")="RCV","true","false"),"false")%>' 
                            
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "MULTA",Eval("V_URL_FOLIO") & "MULTA") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ORIGEN / MULTAS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton48" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO_BARRA") & "%&export=PDF") %>'>
                            <i class="icon-barcode" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton49" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=PDF",Eval("V_URL_FOLIO") & "%&export=PDF") %>'>
                            <i class="icon-print" title="IMPRIMIR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton50" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=EXCEL",Eval("V_URL_FOLIO") & "%&export=EXCEL") %>'>
                            <i class="icon-download" title="DESCARGAR"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton51" runat="server" 
                            Visible='<%# IIF(Eval("V_FOLIO_P1")="0",IIF(Eval("V_INC_CAPTURA")="9" and Eval("V_TIPO_ECO")="COP/RCV","true","false"),IIF(Eval("V_INC_CAPTURA")="9","true","false"))%>' 
                            
                            PostBackUrl='<%# IIF(Eval("V_FOLIO_P1")="0",Eval("V_URL_SIN_FOLIO") & "%&export=WORD",Eval("V_URL_FOLIO") & "%&export=WORD") %>'>
                            <i class="icon-file" title="DESCARGAR EN WORD"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="btn-success" ForeColor="White" />
            <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceP0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?
SET @ANIO=?
SELECT 
@ANIO as ANIO
,'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
 ,'ceduladecapturabarra.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO_BARRA
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[eco]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and V_INC_CAPTURA not in ('2')
and V_FOLIO_P1 is not null
and year(V_FECHA_P1_TURNADO)=@ANIO
group by [V_SUBDEL]
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then 'COP/RCV' else V_TIPO_ECO end)
,V_FOLIO_P1
,V_FECHA_P1_TURNADO
order by V_FECHA_P1_TURNADO desc
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceP0Sivepas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @ANIO as VARCHAR(4)
DECLARE @INC_CAP as VARCHAR(7)
SET @SUBDEL=?
SET @INC_CAP=?
SET @ANIO =?
SELECT 
@ANIO as ANIO
,'ceduladecaptura.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO
 ,'ceduladecapturabarra.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;anio='+@ANIO+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_FOLIO_BARRA
,'reporte.aspx?sub=01333301saddEDTVssaaqw982112dfsdfd09fs7d4ff98df323dfd12f4dfdf&amp;vsubdel='+[V_SUBDEL]
+'&amp;vinc='
+(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
+'&amp;eco='+(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
+'&amp;vfechacaptura=01/01/2000'
+'&amp;folio='+(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end)+'&amp;ori_mul='
 as V_URL_SIN_FOLIO
,[V_SUBDEL]
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end) as V_TIPO_ECO
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end) as [V_INC_CAPTURA]
,count(DISTINCT(V_REGPAT)) as PATRONES
,count(*) as CREDITOS
,(case when V_FOLIO_P1 is null then '0' else V_FOLIO_P1 end) as V_FOLIO_P1
FROM [sirecaemisiones].[dbo].[sivepas]
WHERE [V_SUBDEL] like @SUBDEL
and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)=@INC_CAP
and V_INC_CAPTURA not in ('2')
and V_FOLIO_P1 is not null
and year(V_FECHA_P1_TURNADO)=@ANIO
group by [V_SUBDEL]
,(case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)
,(case when V_INC_CAPTURA in ('9') then 'SIVEPA-IMSS/SIVEPA-RCV' else V_TIPO_ECO end)
,V_FOLIO_P1
,V_FECHA_P1_TURNADO
order by V_FECHA_P1_TURNADO desc
">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenFieldSubdel" DefaultValue="00" Name="?" 
                    PropertyName="Value" />
                <asp:QueryStringParameter DefaultValue="2" Name="?" QueryStringField="vincx" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenFieldSubdel" runat="server" Value="0" />
    <hr />
    
    </div>
    </form>
</body>
</html>

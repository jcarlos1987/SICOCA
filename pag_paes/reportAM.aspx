<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="reportAM.aspx.vb" Inherits="WebSIRECA.reportAM" %>
<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID ="head" >
<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
</script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="cont1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    
        <asp:Label ID="Label5" runat="server" Text="SUBDEL:" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
    <hr />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceReporteAnios" 
            HorizontalAlign="Center" 
            Caption="&lt;strong&gt;AÑOS ANTERIORES 11/2012&lt;/strong&gt;" CaptionAlign="Left" 
            AllowSorting="True" Font-Size="10pt" ShowFooter="True" 
            EmptyDataText="SIN AÑOS ANTERIORES">
            <Columns>
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" ReadOnly="True" 
                    SortExpression="EJECUTOR" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "SeleccionPatronesEjecutor.aspx?idejecutor=" & Eval("idejecutor") & "&ejecutor=" & Eval("EJECUTOR") %>' 
                            Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" NullDisplayText="0" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_09" DataFormatString="{0:N0}" HeaderText="P_09" 
                    SortExpression="P_09" />
                <asp:TemplateField HeaderText="09" SortExpression="09">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="" 
                            Text='<%# Eval("09", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$09" HeaderText="$09" ReadOnly="True" 
                    SortExpression="$09" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_31" DataFormatString="{0:N0}" HeaderText="P_31" 
                    SortExpression="P_31" />
                <asp:TemplateField HeaderText="31" SortExpression="31">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="" 
                            Text='<%# Eval("31") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$31" HeaderText="$31" ReadOnly="True" 
                    SortExpression="$31" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_32" DataFormatString="{0:N0}" HeaderText="P_32" 
                    SortExpression="P_32" />
                <asp:TemplateField HeaderText="32" SortExpression="32">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="" 
                            Text='<%# Eval("32") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$32" HeaderText="$32" ReadOnly="True" 
                    SortExpression="$32" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_33" DataFormatString="{0:N0}" HeaderText="P_33" 
                    SortExpression="P_33" />
                <asp:TemplateField HeaderText="33" SortExpression="33">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="" 
                            Text='<%# Eval("33") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$33" HeaderText="$33" ReadOnly="True" 
                    SortExpression="$33" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_43" DataFormatString="{0:N0}" HeaderText="P_43" 
                    SortExpression="P_43" />
                <asp:TemplateField HeaderText="43" SortExpression="43">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="" 
                            Text='<%# Eval("43") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$43" HeaderText="$43" ReadOnly="True" 
                    SortExpression="$43" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_RE" DataFormatString="{0:N0}" HeaderText="P_RE" 
                    SortExpression="P_RE" />
                <asp:TemplateField HeaderText="RE" SortExpression="RE">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="" 
                            Text='<%# Eval("RE", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$RE" DataFormatString="{0:C}" HeaderText="$RE" 
                    NullDisplayText="0" SortExpression="$RE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_03" DataFormatString="{0:N0}" HeaderText="P_03" 
                    SortExpression="P_03" />
                <asp:TemplateField HeaderText="03" SortExpression="03">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="" 
                            Text='<%# Eval("03", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$03" DataFormatString="{0:C}" HeaderText="$03" 
                    NullDisplayText="0" SortExpression="$03">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_67" DataFormatString="{0:N0}" HeaderText="P_67" 
                    SortExpression="P_67" />
                <asp:TemplateField HeaderText="67" SortExpression="67">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="" 
                            Text='<%# Eval("67", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$67" DataFormatString="{0:C}" HeaderText="$67" 
                    NullDisplayText="0" SortExpression="$67">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_23" HeaderText="P_23" SortExpression="P_23" />
                <asp:TemplateField HeaderText="23" SortExpression="23">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="" 
                            Text='<%# Eval("23") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$23" HeaderText="$23" SortExpression="$23" 
                    NullDisplayText="0" />
                <asp:BoundField DataField="P_05" DataFormatString="{0:N0}" HeaderText="P_05" 
                    SortExpression="P_05" />
                <asp:TemplateField HeaderText="05" SortExpression="05">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="" 
                            Text='<%# Eval("05", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$05" DataFormatString="{0:C}" HeaderText="$05" 
                    SortExpression="$05" NullDisplayText="0" />
                <asp:BoundField DataField="P_34" DataFormatString="{0:N0}" HeaderText="P_34" 
                    SortExpression="P_34" />
                <asp:TemplateField HeaderText="34" SortExpression="34">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="" 
                            Text='<%# Eval("34", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$34" DataFormatString="{0:C}" HeaderText="$34" 
                    SortExpression="$34" NullDisplayText="0" />
                <asp:BoundField DataField="P_52" DataFormatString="{0:N0}" HeaderText="P_52" 
                    SortExpression="P_52" />
                <asp:TemplateField HeaderText="52" SortExpression="52">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="" 
                            Text='<%# Eval("52", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$52" DataFormatString="{0:C}" HeaderText="$52" 
                    SortExpression="$52" NullDisplayText="0" />
                <asp:BoundField DataField="P_54" DataFormatString="{0:N0}" HeaderText="P_54" 
                    SortExpression="P_54" />
                <asp:TemplateField HeaderText="54" SortExpression="54">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="" 
                            Text='<%# Eval("54", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$54" DataFormatString="{0:C}" HeaderText="$54" 
                    SortExpression="$54" NullDisplayText="0" />
                <asp:BoundField DataField="P_F" DataFormatString="{0:N0}" HeaderText="P_F" 
                    SortExpression="P_F" />
                <asp:TemplateField HeaderText="F" SortExpression="F">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="" 
                            Text='<%# Eval("F", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$F" DataFormatString="{0:C}" HeaderText="$F" 
                    SortExpression="$F" NullDisplayText="0" />
            </Columns>
            <FooterStyle BackColor="#CCCCFF" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceReporteAnios" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIOSANTERIORES VARCHAR(50)
SET @ANIOSANTERIORES='01/11/2012'
SELECT 
(SELECT upper(usf.nombre) FROM fiscamovil.dbo.usuarios as usf WHERE usf.[id]=[ID_RESPONSABLE]) as EJECUTOR
,[ID_RESPONSABLE] as idejecutor
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as PATRONES
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as CREDITOS
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as IMPORTE
--09
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='09' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_09'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='09' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '09'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='09' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$09'
--RE
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='RE' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_RE'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='RE' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'RE'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='RE' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$RE'
--03
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='03' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_03'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='03' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '03'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='03' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$03'
--67
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='67' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_67'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='67' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '67'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='67' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$67'
--31
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='31' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_31'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='31' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '31'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='31' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$31'
--32
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='32' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_32'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='32' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '32'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='32' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$32'
--33
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='33' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_33'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='33' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '33'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='33' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$33'
--43
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='43' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_43'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='43' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '43'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='43' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$43'
--05
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='05' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_05'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='05' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '05'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='05' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$05'
--34
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='34' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_34'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='34' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '34'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='34' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$34'
--52
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='52' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_52'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='52' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '52'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='52' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$52'
--54
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='54' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_54'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='54' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '54'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='54' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$54'
--23
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='23' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_23'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='23' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '23'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='23' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$23'
--x
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='x' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'P_F'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='x' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as 'F'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='x' and convert(datetime,etct.periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)) as '$F'
  FROM [sirecacobros].[dbo].[ecoTiposHistorial] as etc inner join sireca.dbo.patrones as ptn on [ID_RESPONSABLE]=ptn.[id] and etc.subdel=?
  where convert(datetime,periodo,102)&lt;=convert(datetime,@ANIOSANTERIORES,102)
  group by [ID_RESPONSABLE]
  order by 1">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource><hr />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceReporteMeses" 
            HorizontalAlign="Center" 
            Caption="&lt;strong&gt;AÑOS ANTERIORES 11/2012&lt;/strong&gt;" CaptionAlign="Left" 
            AllowSorting="True" Font-Size="10pt" ShowFooter="True" 
            EmptyDataText="SIN MESES ADELANTE">
            <Columns>
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" ReadOnly="True" 
                    SortExpression="EJECUTOR" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink17"  title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "SeleccionPatronesEjecutor.aspx?idejecutor=" & Eval("idejecutor") & "&ejecutor=" & Eval("EJECUTOR") %>' 
                            Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" NullDisplayText="0" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_09" DataFormatString="{0:N0}" HeaderText="P_09" 
                    SortExpression="P_09" />
                <asp:TemplateField HeaderText="09" SortExpression="09">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="" 
                            Text='<%# Eval("09", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$09" HeaderText="$09" ReadOnly="True" 
                    SortExpression="$09" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_31" DataFormatString="{0:N0}" HeaderText="P_31" 
                    SortExpression="P_31" />
                <asp:TemplateField HeaderText="31" SortExpression="31">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="" 
                            Text='<%# Eval("31") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$31" HeaderText="$31" ReadOnly="True" 
                    SortExpression="$31" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_32" DataFormatString="{0:N0}" HeaderText="P_32" 
                    SortExpression="P_32" />
                <asp:TemplateField HeaderText="32" SortExpression="32">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="" 
                            Text='<%# Eval("32") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$32" HeaderText="$32" ReadOnly="True" 
                    SortExpression="$32" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_33" DataFormatString="{0:N0}" HeaderText="P_33" 
                    SortExpression="P_33" />
                <asp:TemplateField HeaderText="33" SortExpression="33">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="" 
                            Text='<%# Eval("33") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$33" HeaderText="$33" ReadOnly="True" 
                    SortExpression="$33" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_43" DataFormatString="{0:N0}" HeaderText="P_43" 
                    SortExpression="P_43" />
                <asp:TemplateField HeaderText="43" SortExpression="43">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="" 
                            Text='<%# Eval("43") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$43" HeaderText="$43" ReadOnly="True" 
                    SortExpression="$43" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_RE" DataFormatString="{0:N0}" HeaderText="P_RE" 
                    SortExpression="P_RE" />
                <asp:TemplateField HeaderText="RE" SortExpression="RE">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="" 
                            Text='<%# Eval("RE", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$RE" DataFormatString="{0:C}" HeaderText="$RE" 
                    NullDisplayText="0" SortExpression="$RE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_03" DataFormatString="{0:N0}" HeaderText="P_03" 
                    SortExpression="P_03" />
                <asp:TemplateField HeaderText="03" SortExpression="03">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="" 
                            Text='<%# Eval("03", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$03" DataFormatString="{0:C}" HeaderText="$03" 
                    NullDisplayText="0" SortExpression="$03">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_67" DataFormatString="{0:N0}" HeaderText="P_67" 
                    SortExpression="P_67" />
                <asp:TemplateField HeaderText="67" SortExpression="67">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink25" runat="server" NavigateUrl="" 
                            Text='<%# Eval("67", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$67" DataFormatString="{0:C}" HeaderText="$67" 
                    NullDisplayText="0" SortExpression="$67">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_05" HeaderText="P_05" SortExpression="P_05" />
                <asp:TemplateField HeaderText="05" SortExpression="05">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="" 
                            Text='<%# Eval("05") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$05" HeaderText="$05" SortExpression="$05" />
                <asp:BoundField DataField="P_34" HeaderText="P_34" SortExpression="P_34" />
                <asp:TemplateField HeaderText="34" SortExpression="34">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="" 
                            Text='<%# Eval("34") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$34" HeaderText="$34" SortExpression="$34" />
                <asp:BoundField DataField="P_52" HeaderText="P_52" SortExpression="P_52" />
                <asp:TemplateField HeaderText="52" SortExpression="52">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="" 
                            Text='<%# Eval("52") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$52" HeaderText="$52" SortExpression="$52" />
                <asp:BoundField DataField="P_54" HeaderText="P_54" SortExpression="P_54" />
                <asp:TemplateField HeaderText="54" SortExpression="54">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="" 
                            Text='<%# Eval("54") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$54" HeaderText="$54" SortExpression="$54" />
                <asp:BoundField DataField="P_23" DataFormatString="{0:N0}" HeaderText="P_23" 
                    SortExpression="P_23" />
                <asp:TemplateField HeaderText="23" SortExpression="23">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="" 
                            Text='<%# Eval("23", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$23" DataFormatString="{0:C}" HeaderText="$23" 
                    NullDisplayText="0" SortExpression="$23" />
                <asp:BoundField DataField="P_F" DataFormatString="{0:N0}" HeaderText="P_F" 
                    SortExpression="P_F" />
                <asp:TemplateField HeaderText="F" SortExpression="F">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="" 
                            Text='<%# Eval("F", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$F" DataFormatString="{0:C}" HeaderText="$F" 
                    NullDisplayText="0" SortExpression="$F" />
            </Columns>
            <FooterStyle BackColor="#CCCCFF" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceReporteMeses" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--SIN MESES EN ADELANTE
DECLARE @MESESADELANTE VARCHAR(50)
SET @MESESADELANTE='01/11/2012'
SELECT 
(SELECT upper(usf.nombre) FROM fiscamovil.dbo.usuarios as usf WHERE usf.[id]=[ID_RESPONSABLE]) as EJECUTOR
,[ID_RESPONSABLE] as idejecutor
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as PATRONES
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as CREDITOS
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as IMPORTE
--09
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='09' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_09'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='09' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '09'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='09' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$09'
--RE
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='RE' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_RE'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='RE' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'RE'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='RE' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$RE'
--03
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='03' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_03'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='03' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '03'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='03' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$03'
--67
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='67' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_67'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='67' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '67'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='67' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$67'
--31
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='31' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_31'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='31' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '31'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='31' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$31'
--32
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='32' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_32'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='32' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '32'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='32' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$32'
--33
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='33' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_33'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='33' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '33'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='33' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$33'
--43
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='43' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_43'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='43' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '43'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='43' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$43'
--05
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='05' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_05'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='05' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '05'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='05' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$05'
--34
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='34' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_34'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='34' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '34'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='34' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$34'
--52
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='52' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_52'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='52' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '52'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='52' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$52'
--54
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='54' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_54'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='54' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '54'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='54' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$54'
--23
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='23' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_23'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='23' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '23'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='23' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$23'
--x
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='x' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'P_F'
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='x' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as 'F'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE]  and etct.INC_CAP='x' and convert(datetime,etct.periodo,102)&gt;convert(datetime,@MESESADELANTE,102)) as '$F'
  FROM [sirecacobros].[dbo].[ecoTiposHistorial] as etc inner join sireca.dbo.patrones as ptn on [ID_RESPONSABLE]=ptn.[id] and etc.subdel=?
  where convert(datetime,periodo,102)&gt;convert(datetime,@MESESADELANTE,102)
  group by [ID_RESPONSABLE]
  order by 1
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

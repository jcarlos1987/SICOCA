<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="reporteEjecutor.aspx.vb" Inherits="WebSIRECA.reporteEjecutor" %>
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
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="TIPO:" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DDLREjecutor" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="FECH.ASIGNACION:" 
            Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DDLFech" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSourceFechCap" DataTextField="FECHA" 
            DataValueField="FECHA">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceFechCap" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [FECH_ASIG] AS FECHA
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=?
GROUP BY [FECH_ASIG]
order by FECHA desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource><hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceReporte" 
            HorizontalAlign="Center" Caption="EJECUTORES" CaptionAlign="Left" 
            AllowSorting="True" Font-Size="10pt" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" ReadOnly="True" 
                    SortExpression="EJECUTOR" >
                <HeaderStyle BackColor="#666666" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <HeaderStyle BackColor="#666666" />
                </asp:BoundField>
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
                <asp:TemplateField HeaderText="09" SortExpression="09">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" 
                            Text='<%# Eval("09", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$09" HeaderText="$09" ReadOnly="True" 
                    SortExpression="$09" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="31" SortExpression="31">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="" 
                            Text='<%# Eval("31") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$31" HeaderText="$31" ReadOnly="True" 
                    SortExpression="$31" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="32" SortExpression="32">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="" 
                            Text='<%# Eval("32") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$32" HeaderText="$32" ReadOnly="True" 
                    SortExpression="$32" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="33" SortExpression="33">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="" 
                            Text='<%# Eval("33") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$33" HeaderText="$33" ReadOnly="True" 
                    SortExpression="$33" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="43" SortExpression="43">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="" 
                            Text='<%# Eval("43") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$43" HeaderText="$43" ReadOnly="True" 
                    SortExpression="$43" DataFormatString="{0:C}" NullDisplayText="0" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="RE" SortExpression="RE">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="" 
                            Text='<%# Eval("RE", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$RE" DataFormatString="{0:C}" HeaderText="$RE" 
                    NullDisplayText="0" SortExpression="$RE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="03" SortExpression="03">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="" 
                            Text='<%# Eval("03", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$03" DataFormatString="{0:C}" HeaderText="$03" 
                    NullDisplayText="0" SortExpression="$03">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="67" SortExpression="67">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="" 
                            Text='<%# Eval("67", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="$67" DataFormatString="{0:C}" HeaderText="$67" 
                    NullDisplayText="0" SortExpression="$67">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="23" SortExpression="23">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="" 
                            Text='<%# Eval("23", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$23" DataFormatString="{0:C}" HeaderText="$23" 
                    NullDisplayText="0" SortExpression="$23" />
                <asp:TemplateField HeaderText="05" SortExpression="05">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="" 
                            Text='<%# Eval("05", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$05" DataFormatString="{0:C}" HeaderText="$05" 
                    NullDisplayText="0" SortExpression="$05" />
                <asp:TemplateField HeaderText="34" SortExpression="34">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="" 
                            Text='<%# Eval("34", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$34" DataFormatString="{0:C}" HeaderText="$34" 
                    NullDisplayText="0" SortExpression="$34" />
                <asp:TemplateField HeaderText="52" SortExpression="52">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="" 
                            Text='<%# Eval("52", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$52" DataFormatString="{0:C}" HeaderText="$52" 
                    NullDisplayText="0" SortExpression="$52" />
                <asp:TemplateField HeaderText="54" SortExpression="54">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="" 
                            Text='<%# Eval("54", "{0:N0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="$54" DataFormatString="{0:C}" HeaderText="$54" 
                    NullDisplayText="0" SortExpression="$54" />
                <asp:TemplateField HeaderText="F" SortExpression="F">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink14" runat="server" title="Detalles CREDITOS" rel="gb_page_fs[]" NavigateUrl='<%# "DetallesReporteEjecutor.aspx?idejecutor=" & Eval("idejecutor") & "&clasificacion=" & Eval("clasificacion") & "&fechaasignacion=" & Eval("fechaasignacion") & "&inccap=x" & "&creditos=" & Eval("F") & "&importe=" & Eval("$F")%>'
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
        <asp:SqlDataSource ID="SqlDataSourceReporte" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CLASIFICACION VARCHAR(50)
DECLARE @FECHASIGNACION VARCHAR(50)
SET @CLASIFICACION=?
SET @FECHASIGNACION=?
SELECT 
[ID_RESPONSABLE] as idejecutor
,@CLASIFICACION as clasificacion
,@FECHASIGNACION as fechaasignacion
,(SELECT upper(usf.nombre) FROM fiscamovil.dbo.usuarios as usf WHERE usf.[id]=[ID_RESPONSABLE]) as EJECUTOR
,(select count(distinct(etct.[regpatr])) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.[FECH_ASIG]=@FECHASIGNACION) as PATRONES
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.[FECH_ASIG]=@FECHASIGNACION) as CREDITOS
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.[FECH_ASIG]=@FECHASIGNACION) as IMPORTE
--09
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='09' and etct.[FECH_ASIG]=@FECHASIGNACION) as '09'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='09' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$09'
--RE
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='RE' and etct.[FECH_ASIG]=@FECHASIGNACION) as 'RE'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='RE' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$RE'
--03
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='03' and etct.[FECH_ASIG]=@FECHASIGNACION) as '03'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='03' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$03'
--67
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='67' and etct.[FECH_ASIG]=@FECHASIGNACION) as '67'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='67' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$67'
--31
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='31' and etct.[FECH_ASIG]=@FECHASIGNACION) as '31'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='31' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$31'
--32
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='32' and etct.[FECH_ASIG]=@FECHASIGNACION) as '32'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='32' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$32'
--33
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='33' and etct.[FECH_ASIG]=@FECHASIGNACION) as '33'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='33' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$33'
--43
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='43' and etct.[FECH_ASIG]=@FECHASIGNACION) as '43'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='43' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$43'
--23
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='23' and etct.[FECH_ASIG]=@FECHASIGNACION) as '23'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='23' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$23'
--05
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='05 ' and etct.[FECH_ASIG]=@FECHASIGNACION) as '05'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='05' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$05'
--34
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='34' and etct.[FECH_ASIG]=@FECHASIGNACION) as '34'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='34' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$34'
--52
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='52' and etct.[FECH_ASIG]=@FECHASIGNACION) as '52'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='52' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$52'
--54
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='54' and etct.[FECH_ASIG]=@FECHASIGNACION) as '54'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='54' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$54'
--x
,(select count(etct.[regpatr]) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='x' and etct.[FECH_ASIG]=@FECHASIGNACION) as 'F'
,(select sum(etct.adeudo) from [sirecacobros].[dbo].[ecoTiposHistorial] as etct where etct.[ID_RESPONSABLE]=etc.[ID_RESPONSABLE] and etct.clasificacion=@CLASIFICACION and etct.INC_CAP='x' and etct.[FECH_ASIG]=@FECHASIGNACION) as '$F'
  FROM [sirecacobros].[dbo].[ecoTiposHistorial] as etc inner join sireca.dbo.patrones as ptn on [ID_RESPONSABLE]=ptn.[id] and etc.subdel=?
  group by [ID_RESPONSABLE]
  order by 1">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLREjecutor" DefaultValue="000000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLFech" DefaultValue="01-10-2013" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

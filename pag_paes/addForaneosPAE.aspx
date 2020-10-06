<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="addForaneosPAE.aspx.vb" Inherits="WebSIRECA.addForaneosPAE" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head"  >
    <%--<script type="text/javascript">
    var GB_ROOT_DIR = '../greybox/';
    </script>

    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID ="cont" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="SUBDELEGACIÓN"></asp:Label>
</span> 
        <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
        AutoPostBack="True" Width="150px">
        </asp:DropDownList>
</div> 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceForaneos" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" HorizontalAlign="Center" Caption="&lt;strong&gt;Patrones Foraneos PAE&lt;/strong&gt;" 
            AllowSorting="True" DataKeyNames="RUTA" Font-Size="10pt">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="RUTA" HeaderText="RUTA" 
                    SortExpression="RUTA" DataFormatString="Ruta {0}" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                            NavigateUrl='<%# "setForaneasPAE.aspx?foraneo=" & Eval("RUTA") & "&patrones=" & Eval("PATRONES") & "&importe=" & Eval("IMPORTE") & "&subdel=" & Eval("subdel") %>' 
                            Text='<%# Eval("PATRONES") %>' Target="_blank"></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" SortExpression="CREDITOS" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
<asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="RUTAS">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("RUTA") %>' />
                        <asp:Repeater ID="Repeater1" runat="server" 
                            DataSourceID="SqlDataSourceMunicipio">                        
                        <ItemTemplate>
                            <% If numMuni < 5 Then%>
                                ,&nbsp;<asp:Label ID="municipioLabel" runat="server" Text='<%# Eval("municipio") %>' />
                            <% numMuni=numMuni+1 %>
                            <% Else numMuni=0 %>
                            <br />
                                ,&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("municipio") %>' />                            
                            <% End If%>
                        </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:SqlDataSource ID="SqlDataSourceMunicipio" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                            
                            SelectCommand="SELECT [municipio]  FROM [sirecacobros].[dbo].[foraneo] where alias=?">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="00" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"/>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceForaneos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
SET @SUBDEL=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
exec('
select 
'''+@SUBDEL+''' as SUBDEL
,RUTA
,count(distinct(regpat)) as PATRONES
,count(CREDITOS) as CREDITOS
,sum(COTIZANTES) as COTIZANTES
,sum(IMPORTE) as IMPORTE
from
(
SELECT distinct fora.[alias] AS RUTA
,(REGPATR) AS REGPAT
,razonSocial AS RAZON
,dom AS DOMICILIO
,loc AS LOCALIDAD
,ptn.sector AS SECTOR
,cotiz as COTIZANTES
,NUMCRED as CREDITOS
,FALTA AS FALTA
,FNOTIFICACION AS FECH_NOTIF
,INC AS INC
,FEINC AS FECH_INC
,DIAS AS DIAS
,(IMPORTE) AS IMPORTE
,DC AS DC
,SC AS SC
,PERIODO AS PERIODO
,tipo_cop_rcv as TIPO
FROM [sirecacobros].[dbo].[foraneo] AS fora 
INNER JOIN 
(
SELECT ''COP'' as tipo_cop_rcv,*
FROM [rale].[dbo].['+@RALECOP+']
where td in (''02'') and inc in (''31'',''32'',''43'')
union all
SELECT ''RCV'' as tipo_cop_rcv,*
FROM [rale].[dbo].['+@RALERCV+']
where td in (''02'') and inc in (''31'',''32'',''43'')
 ) AS pae 
ON substring(pae.REGPATR,1,3) = fora.claveForaneo
left join sireca.dbo.patrones as ptn on regpat=replace(pae.REGPATR,''-'','''')
) as resultado
group by ruta
order by ruta
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>    
    
    </div>
</asp:Content>

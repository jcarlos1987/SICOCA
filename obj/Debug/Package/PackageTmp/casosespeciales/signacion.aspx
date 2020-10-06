<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="signacion.aspx.vb" Inherits="WebSIRECA.signacion" %>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    
    <asp:DropDownList ID="DDLSubdel" runat="server" 
                           AutoPostBack="True">
                        </asp:DropDownList>
                        CASO ESPECIAL DE:<asp:DropDownList ID="DDLAplicarA" 
            runat="server" AutoPostBack="True">
            <asp:ListItem Value="NOT_PAE">NOTIFICACION/P.A.E.</asp:ListItem>
            <asp:ListItem Value="NOT">NOTIFICACION</asp:ListItem>
            <asp:ListItem Value="PAE">P.A.E.</asp:ListItem>
        </asp:DropDownList>
        <asp:LinkButton ID="LBActualizar" runat="server" BackColor="#FFE8A6" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
            Font-Strikeout="False" Font-Underline="False">&nbsp;&nbsp;&nbsp;Actualizar&nbsp;&nbsp;&nbsp;</asp:LinkButton>
    <hr />
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="Label1" runat="server" Text="ASIGNAR A:" Font-Bold="True"></asp:Label>
                    <asp:DropDownList ID="DDLInspector" runat="server" Width="210px" 
                        DataSourceID="SqlDataSourceInspector" DataTextField="texto" 
                        DataValueField="valor">
                        </asp:DropDownList>
        <asp:LinkButton ID="LBAsignar" runat="server" BackColor="#FFE8A6" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
            Font-Strikeout="False" Font-Underline="False">&nbsp;&nbsp;&nbsp;ASIGNAR&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                        <asp:SqlDataSource ID="SqlDataSourceInspector" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @USUARIO_TIPO as VARCHAR(10)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @USUARIO_TIPO=?

if @USUARIO_TIPO='NOT'
begin
	select sire.id as valor
	,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
	FROM [sireca].[dbo].[usuarios] as sire
	where subdel=@SUBDEL and (user_type in ('1'))
	order by texto
end
else
begin
	if @USUARIO_TIPO='PAE'
	begin
		select sire.id as valor
		,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
		FROM [sireca].[dbo].[usuarios] as sire
		where subdel=@SUBDEL and (userPae2='1')
		order by texto
	end
	else
	begin
		select sire.id as valor
		,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id=sire.id) as texto
		FROM [sireca].[dbo].[usuarios] as sire
		where subdel=@SUBDEL and (user_type in ('1') or userPae2='1')
		order by texto
	end
end
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLAplicarA" DefaultValue="ECO" Name="?" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
    
                    &nbsp;</td>
                <td>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" 
                            
            EmptyDataText="SIN PATRONES REGISTRADOS EN LOS FILTROS SELECCIONADOS" 
                        Caption="&lt;strong&gt;CASOS ESPECIALES&lt;/strong&gt;">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="HFIdAlias" runat="server" 
                            Value='<%# Eval("ID_ALIAS") %>' />
                        <asp:CheckBox ID="CBIdAlias" runat="server" />
                    </ItemTemplate>                    
                </asp:TemplateField>
                <asp:BoundField DataField="ALIAS" HeaderText="ALIAS" ReadOnly="True" 
                    SortExpression="ALIAS" />
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" 
                    SortExpression="INSPECTOR" />
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
idAlias as ID_ALIAS
,[paa_alias] as ALIAS
,count(distinct(regpatr)) as PATRONES
,paa_idusuario as ID_INSPECTOR
,(case when paa_idusuario is null then 'SIN ASIGNAR' else (select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=paa_idusuario) end) as INSPECTOR
FROM [sirecacobros].[dbo].[patronesAlianza] as pa
left join
[sirecacobros].[dbo].[patronesAlianzaAlias]
on idAlias=paa_id
where pa.subdel=? and pa.aplica=?
group by idAlias,[paa_alias],paa_idusuario
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAplicarA" DefaultValue="eco" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>

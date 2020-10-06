<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="depuradosporpago.aspx.vb" Inherits="WebSIRECA.depuradosporpago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="120px" >
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="PERIODO:"></asp:Label>
</span>
<asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" Width="120px" >
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
    <asp:DropDownList ID="DDLAnio" runat="server" ToolTip="PERIODO" AutoPostBack="True" Width="80px">
    </asp:DropDownList>
</div>
</center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" ShowFooter="True" 
        Caption="&lt;strong&gt;DEPURADOS POR PAGO&lt;/strong&gt;" 
        HorizontalAlign="Center">
    <Columns>
        <asp:BoundField DataField="TIPO_FACTURA" HeaderText="TIPO_FACTURA" 
            ReadOnly="True" SortExpression="TIPO_FACTURA" />
        <asp:BoundField DataField="PERIODO_BIMESTRE" HeaderText="PERIODO / BIMESTRE" 
            ReadOnly="True" SortExpression="PERIODO_BIMESTRE" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" ReadOnly="True" 
            SortExpression="INCIDENCIA" />
        <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("CREDITOS","{0:N0}") %>' 
                NavigateUrl='<%# "~/cruceslgpprocesarrale/depuradospagosdetalle.aspx?subdel=" & Eval("VSUBDEL") & "&periodo=" & Eval("VPERIODO") & "&depuradoporpago=" & Eval("INCIDENCIA") & "&periodobimentre=" & Eval("PERIODO_BIMESTRE") & "&tipoeco=" & Eval("TIPO_FACTURA") & "" %>' Target="_blank"></asp:HyperLink>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
        <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
            SortExpression="IMPORTE" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @PERIODO AS VARCHAR(6)
SET @SUBDEL=?
SET @PERIODO=?+''+?

select 
@SUBDEL AS VSUBDEL
,@PERIODO AS VPERIODO
,tipoeco AS TIPO_FACTURA,PERIODO_BIMESTRE,depurado_por as INCIDENCIA,count(*) as CREDITOS,sum(omision) as IMPORTE
from (
select 
(case 
when fecha_notificacion&gt;fech_pago then 'DEPURADO POR PAGO'
when fecha_notificacion&lt;=fech_pago then 'OTRAS INC'
when fech_pago is not null then 'DEPURADO POR PAGO'
else 'OTRAS INC' --incidenciarale
end) AS DEPURADO_POR
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO_BIMESTRE
,*
from (
SELECT 
(
	case 
	when eco.incidencia in ('2') then eco.fechacaptura 
	else
		(
			SELECT top 1 hinc.fecha
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia='2' and hinc.ideco=eco.id
			order by ideco desc
		)
	end 
	) as fecha_notificacion
,*
FROM sireca.dbo.eco WHERE 
subdel LIKE @SUBDEL and fechaeco=@PERIODO
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
) as resultado
--AND INCIDENCIA='RB'
) as result
group by tipoeco,PERIODO_BIMESTRE,depurado_por
ORDER BY 1,3
">
    <SelectParameters>
        <asp:ControlParameter ControlID="DDLSubdel" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DDLMes" DefaultValue="01" Name="?" 
            PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
            PropertyName="SelectedValue" />
    </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

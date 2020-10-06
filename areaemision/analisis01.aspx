<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="analisis01.aspx.vb" Inherits="WebSIRECA.analisis01" %>

<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<center>
    <div class="btn-group input-prepend">
<asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" Width="150px"></asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="RALE C.O.P."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRCop" runat="server" Width="140px" 
        DataSourceID="SqlDataSourceRaleCop" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRaleCop" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 1 [name] as valor
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='COP' 
order by [fecha] desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
<span class="add-on">
    <asp:Label ID="Label4" runat="server" Text="RALE R.C.V."></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRRcv" runat="server" Width="140px" 
        DataSourceID="SqlDataSourceRaleRcv" DataTextField="texto" 
        DataValueField="valor">
    </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSourceRaleRcv" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 1 [name] as valor
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='RCV' 
order by [fecha] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
    <span class="add-on">
    <asp:LinkButton ID="LBActualizar" CssClass ="btn" runat="server"><i class="icon-refresh"></i>ACTUALIZAR</asp:LinkButton>
    </span> 
</div> 

    <asp:LinkButton ID="LBINC" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" 
    CssClass="btn">Descargar creditos con INCIDENCIAS POR NOTIFICAR(01) en R.A.L.E. vs fechas de NOTIFICACION(02) en SIRECA</asp:LinkButton>
    <asp:GridView ID="GridViewInc01" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceInc01" HorizontalAlign="Center" 
        AllowSorting="True" Font-Size="10pt">
        <Columns>
            <asp:BoundField DataField="ECO_DILIGENCIA" HeaderText="DILIGENCIA EN SIRECA" 
                ReadOnly="True" SortExpression="ECO_DILIGENCIA" />
            <asp:BoundField DataField="FECHA_NOTIFICACION" HeaderText="FECHA DE NOTIFICACION" 
                ReadOnly="True" SortExpression="FECHA_NOTIFICACION" />
            <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                SortExpression="PATRONES" DataFormatString="{0:N0}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CREDITOS" SortExpression="CREDITOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        Text ='<%# Eval("CREDITOS", "{0:N0}") %>' 
                        CommandArgument='<%# "detallesanalisis01.aspx?subdel=" & Eval("SUBDEL") & "&diligencia=" & Eval("ECO_DILIGENCIA") & "&fech_rn_sn=" & Eval("FECHA_NOTIFICACION") & "&ralecop=" & Eval("RALE_COP") & "&ralercv=" & Eval("RALE_RCV") %>' 
                        onprerender="LinkButton1_PreRender">LinkButton</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceInc01" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
SET @SUBDEL=?
SET @RALECOP=?
SET @RALERCV=?
exec('
select 
'''+@SUBDEL+''' AS SUBDEL
,'''+@RALECOP+''' AS RALE_COP
,'''+@RALERCV+''' AS RALE_RCV
,isnull(ECO_DILIGENCIA,''N/A'') as V_ECO_DILIGENCIA
,isnull((SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=ECO_DILIGENCIA),''N/A'') as ECO_DILIGENCIA
,FECHA_NOTIFICACION,COUNT(DISTINCT(RALE_REGPAT)) AS PATRONES,COUNT(*) AS CREDITOS,SUM(RALE_IMPORTE) AS IMPORTE
from (
select TIPO AS RALE_TIPO
,RALE_CREDITO,RALE_REGPAT,MOV AS RALE_MOV,FMOV AS RALE_FECH_MOV
,SECTOR AS RALE_SECTOR
,TD AS RALE_TD
,FALTA AS RALE_FECH_ALTA
,RALE_PERIODO AS RALE_PERIODO
,IMPORTE AS RALE_IMPORTE
,ECO_PAGO as ECO_PAGO
,DIAS AS RALE_DIAS
,INC AS RALE_INC
,FEINC AS RALE_FECH_INC
,FNOTIFICACION AS RALE_FECH_NOTIFICACION
,ECO_FECH_NOTIFICACION as ECO_FECH_NOTIFICACION
,ECO_DILIGENCIA
,ECO_FECH_DILIGENCIA as ECO_FECH_DILIGENCIA
,case 
when FNOTIFICACION is null and ECO_FECH_NOTIFICACION is null then ''RALE(NO)-SIRECA(NO)''
when FNOTIFICACION is not null and ECO_FECH_NOTIFICACION is not null then ''RALE(SI)-SIRECA(SI)''
when FNOTIFICACION is not null and ECO_FECH_NOTIFICACION is null then ''RALE(SI)-SIRECA(NO)''
when FNOTIFICACION is null and ECO_FECH_NOTIFICACION is not null then ''RALE(NO)-SIRECA(SI)''
end as FECHA_NOTIFICACION
,ECO_PERIODO
,ECO_CREDITO
,ECO_REGPAT
from (
select ''COP'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT

,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO, * from rale.dbo.['+@RALECOP+']
where inc in (''01'')
union all
select ''RCV'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT
,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO, * from rale.dbo.['+@RALERCV+']
where inc in (''01'')
) as rale
left join 
(
select 
	(case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
		(
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by hinc.id desc
		) end 
	) as ECO_FECH_NOTIFICACION
,credito AS ECO_CREDITO
,SUBSTRING(reg#patronal,1,10) AS ECO_REGPAT
,incidencia AS ECO_DILIGENCIA
,fechaCaptura as ECO_FECH_DILIGENCIA
,pago as ECO_PAGO
,(case 
when [tipoECO] in (''COP'',''COMP'') then
(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in (''RCV'',''RCVCOMP'') then
(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
end
) as ECO_PERIODO
from sireca.dbo.eco as eco
where tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and subdel='''+@SUBDEL+'''
) as sireca
ON ECO_REGPAT=RALE_REGPAT AND ECO_CREDITO=RALE_CREDITO AND ECO_PERIODO=RALE_PERIODO
) as rr
group by ECO_DILIGENCIA,FECHA_NOTIFICACION
order by 1,2
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLRCop" DefaultValue="xxxxxxxxxxx" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLRRcv" DefaultValue="xxxxxxxxxxx" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</center>
</asp:Content>
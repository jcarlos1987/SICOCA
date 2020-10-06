<%@ Page Language="vb" MasterPageFile ="~/Site2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default3" %>
<asp:Content ID="conten1" runat ="server" ContentPlaceHolderID ="head" >
        <title>Resultados</title>
    <style type="text/css">
        body {
	        font-family: "Calibri";
        }
    </style>
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID ="contend" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <asp:Label ID="Label6" runat="server" Text="Para el Acuerdo 187"></asp:Label><hr />
    <asp:Label ID="Label4" runat="server" Text="Subdelegacion:"></asp:Label>&nbsp;
    <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
    </asp:DropDownList>&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="RALE:"></asp:Label>&nbsp;
    <asp:DropDownList ID="DDLRale" runat="server" DataSourceID="SqlDataSourceRALE" 
        DataTextField="name" DataValueField="name">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRALE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [name]
  FROM [rale].[dbo].[tablas]
  where subdel =? and tipo='COP'
  order by fecha desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Tipo de Semaforeo:"></asp:Label>&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value=" and bandera in ('3rojo','2amarillo','1verde')">TODOS</asp:ListItem>
        <asp:ListItem Value=" and bandera in ('3rojo')">ROJO</asp:ListItem>
        <asp:ListItem Value=" and bandera in ('2amarillo')">AMARILLO</asp:ListItem>
        <asp:ListItem Value=" and bandera in ('1verde')">VERDE</asp:ListItem>
    </asp:DropDownList>&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Actualizar" />&nbsp;
    <asp:ImageButton ID="ImageButton5" runat="server" 
        ImageUrl="~/imagenes/exportarexcel.png" />&nbsp;
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSourceDeudas" 
        Font-Size="9pt" HorizontalAlign="Center">
        <Columns>
            <asp:TemplateField HeaderText="REGPATR" SortExpression="REGPATR">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" title="Detalles" rel="gb_page_fs[]" runat="server" 
                        NavigateUrl='<%# Eval("REGPATR", "DetallesPatron.aspx?regpat={0}") %>' 
                        Text='<%# Eval("REGPATR") %>'></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle ForeColor="White" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                ReadOnly="True" SortExpression="RAZON_SOCIAL">
            <HeaderStyle ForeColor="White" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="TIPO_PERSONA" HeaderText="TIPO_PERSONA" 
                SortExpression="TIPO_PERSONA">
            <HeaderStyle ForeColor="White" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Asignado A:">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" 
                        Text='<%# Eval("RESPONSABLE") %>'></asp:Label><br />
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceInspectores" DataTextField="nombreu" 
                        DataValueField="idu" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">PENDIENTE</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceInspectores" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT uss.[id] as idu
,usf.nombre as nombreu
FROM [sireca].[dbo].[usuarios] as uss inner join fiscamovil .dbo.Usuarios as usf on uss.[id]=usf.[id]
where uss.user_type ='1' and uss.subdel =?">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle ForeColor="White" />
            </asp:TemplateField>
            <asp:BoundField DataField="DIAS" DataFormatString="{0:N0}" HeaderText="DIAS" 
                ReadOnly="True" SortExpression="DIAS">
            <HeaderStyle ForeColor="White" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <HeaderStyle ForeColor="#CC0000" />
            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="ACT" DataFormatString="{0:C}" HeaderText="ACT" 
                NullDisplayText="Actualize Tabla de Recargos" ReadOnly="True" 
                SortExpression="ACT">
            <HeaderStyle ForeColor="#CC0000" />
            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="REC" DataFormatString="{0:C}" HeaderText="REC" 
                NullDisplayText="Actualize Tabla de Recargos" ReadOnly="True" 
                SortExpression="REC">
            <HeaderStyle ForeColor="#CC0000" />
            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="total = importe + act + rec" 
                DataFormatString="{0:C}" HeaderText="Total" 
                NullDisplayText="Actualize Tabla de Recargos" ReadOnly="True" 
                SortExpression="total = importe + act + rec">
            <HeaderStyle ForeColor="#CC0000" />
            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="pago_inicial" DataFormatString="{0:C}" 
                HeaderText="pago_inicial" NullDisplayText="Actualize Tabla de Recargos" 
                ReadOnly="True" SortExpression="pago_inicial">
            <HeaderStyle ForeColor="#009933" />
            <ItemStyle ForeColor="#003300" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="gasto_ejecusion" DataFormatString="{0:C}" 
                HeaderText="gasto_ejecusion" NullDisplayText="Actualize Tabla de Recargos" 
                ReadOnly="True" SortExpression="gasto_ejecusion">
            <HeaderStyle ForeColor="#009933" />
            <ItemStyle ForeColor="#003300" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="total = pago_inicial + gasto_ejecusion" 
                DataFormatString="{0:C}" HeaderText="Total" 
                NullDisplayText="Actualize Tabla de Recargos" ReadOnly="True" 
                SortExpression="total = pago_inicial + gasto_ejecusion">
            <HeaderStyle ForeColor="#009933" />
            <ItemStyle ForeColor="#003300" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SALDO" DataFormatString="{0:C}" HeaderText="SALDO" 
                NullDisplayText="Actualize Tabla de Recargos" ReadOnly="True" 
                SortExpression="SALDO">
            <HeaderStyle ForeColor="#FF3300" />
            <ItemStyle ForeColor="#FF3300" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="MESES_PAGO" HeaderText="MESES_PAGO" ReadOnly="True" 
                SortExpression="MESES_PAGO">
            <HeaderStyle ForeColor="#FF3300" />
            <ItemStyle ForeColor="#FF3300" />
            </asp:BoundField>
            <asp:BoundField DataField="MENSUALIDAD" DataFormatString="{0:C}" 
                HeaderText="MENSUALIDAD" NullDisplayText="Actualize Tabla de Recargos" 
                ReadOnly="True" SortExpression="MENSUALIDAD">
            <HeaderStyle ForeColor="#FF3300" />
            <ItemStyle ForeColor="#FF3300" HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="bandera" HeaderText="&lt;&gt;" 
                SortExpression="bandera">
            <ItemStyle Font-Size="1pt" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="Black" Font-Size="11pt" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDeudas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        
        SelectCommand="if exists(select * from sirecacobros.dbo.sysobjects where name = 'cop187') 
begin
drop table sirecacobros.dbo.cop187
end
SELECT 
		rale.[REGPATR]
      ,(select '('+mov_pat+') '+descripcion from sireca.dbo.mov_rale where mov_pat=rale.[MOV]) as [MOV]
      ,rale.[FMOV]
      --,rale.[SECTOR]
      ,rale.[NUMCRED]
      --,rale.[CE]
      ,(select '('+docto+') '+descripcion from sireca.dbo.doc_rale where docto=rale.[TD]) as [TD]
      --,rale.[FALTA]
      ,(select '('+inc+') '+descripcion from sireca.dbo.inc_rale where inc=rale.[INC]) as [INC]
      --,rale.[FEINC]
      ,rale.[DIAS]
      ,case 
when rale.[DIAS]&gt;300 then '3rojo'
when rale.[DIAS] between 100 and 300 then '2amarillo'
when rale.[DIAS]&lt;100 then '1verde'
end as bandera
      ,rale.[IMPORTE]
      --,rale.[OBSERVA]
      ,rale.[PERIODO]
,case when rale.TD='81' 
then (rale.[IMPORTE]*(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))) 
else (rale.[IMPORTE]*(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO])))
end as ACTUALIZADO
,case when rale.TD='81' 
then ((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100)
else ((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))))/100)
end as RECARGO
,case when rale.TD='81' 
then (rale.[IMPORTE]+(rale.[IMPORTE]*(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2)))+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))
else (rale.[IMPORTE]+(rale.[IMPORTE]*(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO])))+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))))/100))
end as TOTAL_ACTUALIZADO
--,case when rale.TD='81' 
--then (rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]*2))))/100))
--else (rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))))/100))
--end as TOTAL_ACTUALIZADO
,case when rale.TD='81' 
then ((rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))*0.02)
else ((rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))))/100))*0.02)
end as [PORCIENTO2]
,case when rale.TD='81' 
then (
case when (((rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))*0.02)&gt;340) then 
	((rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=(month(rale.[PERIODO])*2))))/100))*0.02)
else
	340
end
)
else (
case when (((rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))))/100))*0.02)&gt;340) then 
	((rale.[IMPORTE]+((rale.[IMPORTE]*(SELECT recargo.[REC] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))*(1+(SELECT recargo.[ACT] FROM [sirecacobros].[dbo].[tablarecargos] as recargo where year(recargo.[PERIODO])= year(rale.[PERIODO]) and recargo.TD='2' and month(recargo.[PERIODO])=month(rale.[PERIODO]))))/100))*0.02)
else
	340
end
)
end as GASTO
,(
select
case 
when len(ptn.rfc)=13 then 'FISICA'
when len(ptn.rfc)=10 then 'FISICA'
when len(ptn.rfc)=12 then 'MORAL'
when len(ptn.rfc)=11 then 'MORAL'
when ptn.razonsocial like '% SA %' then 'MORAL'
when ptn.razonsocial like '% S A %' then 'MORAL'
when ptn.razonsocial like '% S.A. %' then 'MORAL'
when ptn.razonsocial like '% S. A. %' then 'MORAL'
when ptn.razonsocial like '% PRIVADA %' then 'MORAL'
when ptn.razonsocial like '% CV %' then 'MORAL'
when ptn.razonsocial like '% C V %' then 'MORAL'
when ptn.razonsocial like '% C.V. %' then 'MORAL'
when ptn.razonsocial like '% C. V. %' then 'MORAL'
when ptn.razonsocial like '% SC %' then 'MORAL'
when ptn.razonsocial like '% S C %' then 'MORAL'
when ptn.razonsocial like '% S.C. %' then 'MORAL'
when ptn.razonsocial like '% A. C. %' then 'MORAL'
when ptn.razonsocial like '% SCP %' then 'MORAL'
when ptn.razonsocial like '% S C P %' then 'MORAL'
when ptn.razonsocial like '% S.C.P. %' then 'MORAL'
when ptn.razonsocial like '% S. C. P. %' then 'MORAL'
when ptn.razonsocial like '% S DE %' then 'MORAL'
when ptn.razonsocial like '% S. DE %' then 'MORAL'
when ptn.razonsocial like '% MAYAB %' then 'MORAL'
when ptn.razonsocial like '% PENINSULARES %' then 'MORAL'
when ptn.razonsocial like '% PESQUERA %' then 'MORAL'
when ptn.razonsocial like '% MEDICO %' then 'MORAL'
else 'FISICA'
end as TIPO_PERSONA
from sireca.dbo.patrones as ptn where ptn.regpat=replace(rale.[REGPATR],'-','')
) as TIPO_PERSONA
INTO sirecacobros.dbo.cop187
FROM [rale].[dbo].[3301ACOP201112] as rale
where rale.TD in ('08','80','81','82','88')
--AND periodo between convert(datetime,'1/01/2012') and convert(datetime,'1/09/2012',103)
--select 
--*
--[REGPATR],count(*) 
--from sirecacobros.dbo.cop187 
--group by [REGPATR]
--and rale.INC NOT IN ('52','54')
-------------------------------------------------------------------------------------------------------------------
DECLARE @MESES FLOAT
DECLARE @PRCENTAJE1 FLOAT  --es el porcentaje de calculo de los gastos de ejecusion
DECLARE @PRCENTAJE2 FLOAT  --es el porcentaje de calculo de pago inicial
SET @MESES = 48
SET @PRCENTAJE1 = 0.02
SET @PRCENTAJE2 = 0.25
SELECT 
[REGPATR]
,(SELECT top 1 cop.responsable FROM sirecacobros .dbo .co187capturas as cop where cop.[REGPATR]=rale.[REGPATR]) as [RESPONSABLE]
,sum([IMPORTE]) as IMPORTE
,sum([ACTUALIZADO]) as ACT
,sum([RECARGO]) as REC
,sum([TOTAL_ACTUALIZADO]) as [total = importe + act + rec]
,(SELECT ptn.razonSocial FROM sireca.dbo.patrones as ptn WHERE ptn.regpat=replace([REGPATR],'-','')) as [RAZON_SOCIAL]
,TIPO_PERSONA
,MAX([DIAS]) AS DIAS
,(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2) as pago_inicial
,case 
when (sum([TOTAL_ACTUALIZADO])&lt;20000) then 340
else (sum([TOTAL_ACTUALIZADO])*@PRCENTAJE1)
end as gasto_ejecusion
,case
when (sum([TOTAL_ACTUALIZADO])&lt;20000) then (340+(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2))
else ((sum([TOTAL_ACTUALIZADO])*@PRCENTAJE1)+(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2))
end as [total = pago_inicial + gasto_ejecusion]
,(sum([TOTAL_ACTUALIZADO])-(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2)) as SALDO
,@MESES as MESES_PAGO
,((sum([TOTAL_ACTUALIZADO])-(sum([TOTAL_ACTUALIZADO])* @PRCENTAJE2))/@MESES) as MENSUALIDAD
,max(bandera) as bandera
  FROM [sirecacobros].[dbo].[cop187] as rale
WHERE [PERIODO] between convert(datetime,'1/01/1888') and convert(datetime,'1/09/2012',103)
group by [REGPATR],TIPO_PERSONA order by [DIAS] desc --having sum([ACTUALIZADO])&gt;0"></asp:SqlDataSource>
</asp:Content>

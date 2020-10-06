<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default26" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="CONTENIDO1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
<center >
<div class="btn-group input-prepend">
        <span class="add-on">
            <asp:Label ID="Label4" runat="server" Text="SUBDEL.:"></asp:Label>
        </span> 
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" ToolTip="SUBDELEGACION" Width="100px">
            </asp:DropDownList>
            <span class="add-on">
                <asp:Label ID="Label1" runat="server" Text="BASE A CARGAR:"></asp:Label>
            </span>
            <span class="add-on">
                <asp:FileUpload ID="FUBase" runat="server" />
            </span>
            <span class="add-on">
                <asp:LinkButton ID="LBCargar" CssClass="btn" runat="server">CARGAR BASE</asp:LinkButton>
            </span>
        </div>
<div class="btn-group input-prepend">
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="RALE C.O.P.:"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRCop" runat="server" DataSourceID="SqlDataSourceRCop" 
            DataTextField="texto" DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRCop" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 160 [name] as valor     
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='COP'
order by fecha desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
<span class="add-on">
    <asp:Label ID="Label3" runat="server" Text="RALE R.C.V.:"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLRRcv" runat="server" DataSourceID="SqlDataSourceRRcv" 
            DataTextField="texto" DataValueField="valor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRRcv" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 160 [name] as valor     
,convert(varchar(10),[fecha],103) as texto
FROM [rale].[dbo].[tablas]
where subdel=? and tipo='RCV'
order by fecha desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <span class="add-on">
        <asp:LinkButton ID="LBCargar0" runat="server" CssClass="btn">ACTUALIZAR</asp:LinkButton>
        </span> 
</div> 
</center>
        <br />
        <center ><asp:Label ID="LMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></center>
        <asp:HiddenField ID="HiddenFieldSlarioMin" runat="server" />
        <asp:GridView ID="GridViewPatrones" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourcePatrones" HorizontalAlign="Center" 
            Font-Size="9pt" AllowPaging="True" PageSize="15" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="E_REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="E_REGPAT" />
                <asp:BoundField DataField="E_CRED_COP" HeaderText="CRED. C.O.P." ReadOnly="True" 
                    SortExpression="E_CRED_COP" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="E_IMPORTE_COP" HeaderText="IMPORTE C.O.P." 
                    ReadOnly="True" SortExpression="E_IMPORTE_COP" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="E_RANGO" HeaderText="RANGO" ReadOnly="True" 
                    SortExpression="E_RANGO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="E_CRED_RCV" HeaderText="CRED. R.C.V." ReadOnly="True" 
                    SortExpression="E_CRED_RCV" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="E_IMPORTE_RCV" HeaderText="IMPORTE R.C.V." 
                    ReadOnly="True" SortExpression="E_IMPORTE_RCV" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="E_OTROS_CREDITOS" HeaderText="OTROS CRED." 
                    ReadOnly="True" SortExpression="E_OTROS_CREDITOS" 
                    DataFormatString="{0:N0}" Visible="False" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="DICTAMEN">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBDictamen" runat="server" 
                            onprerender="LBDictamen_PreRender" CommandArgument ='<%# Eval("E_SUBDEL") & "_" & Eval("E_REGPAT") & "_" & Eval("E_REGISTRO_DICTAMEN") & "_" & Eval("E_CRED_COP") & "_" & Eval("E_CRED_RCV") & "_" & Eval("E_INTEGRADOR") & "_" & Eval("E_RALE_COP") & "_" & Eval("E_RALE_RCV") %>'><i class="icon-print"></i></asp:LinkButton>
                            <asp:LinkButton ID="LBDictamenWord" runat="server" 
                             
                            CommandArgument ='<%# Eval("E_SUBDEL") & "_" & Eval("E_REGPAT") & "_" & Eval("E_REGISTRO_DICTAMEN") & "_" & Eval("E_CRED_COP") & "_" & Eval("E_CRED_RCV") & "_" & Eval("E_INTEGRADOR") & "_" & Eval("E_RALE_COP") & "_" & Eval("E_RALE_RCV") %>' 
                            onprerender="LBDictamenWord_PreRender"><i class="icon-download"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SOLICITUD">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBSolicitud" runat="server" 
                            onprerender="LBSolicitud_PreRender" CommandArgument ='<%# Eval("E_SUBDEL") & "_" & Eval("E_REGPAT") & "_" & Eval("E_REGISTRO_DICTAMEN") & "_" & Eval("E_CRED_COP") & "_" & Eval("E_CRED_RCV") & "_" & Eval("E_INTEGRADOR") & "_" & Eval("E_RALE_COP") & "_" & Eval("E_RALE_RCV") %>'><i class="icon-print"></i></asp:LinkButton>
                            <asp:LinkButton ID="LBSolicitudWord" runat="server" 
                             
                            CommandArgument ='<%# Eval("E_SUBDEL") & "_" & Eval("E_REGPAT") & "_" & Eval("E_REGISTRO_DICTAMEN") & "_" & Eval("E_CRED_COP") & "_" & Eval("E_CRED_RCV") & "_" & Eval("E_INTEGRADOR") & "_" & Eval("E_RALE_COP") & "_" & Eval("E_RALE_RCV") %>' 
                            onprerender="LBSolicitudWord_PreRender"><i class="icon-download"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ANALISIS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBAnalisis" runat="server" 
                            onprerender="LBAnalisis_PreRender" CommandArgument ='<%# Eval("E_SUBDEL") & "_" & Eval("E_REGPAT") & "_" & Eval("E_REGISTRO_DICTAMEN") & "_" & Eval("E_CRED_COP") & "_" & Eval("E_CRED_RCV") & "_" & Eval("E_INTEGRADOR")  & "_" & Eval("E_RALE_COP") & "_" & Eval("E_RALE_RCV") %>'><i class="icon-print"></i></asp:LinkButton>
                            <asp:LinkButton ID="LBAnalisisWord" runat="server" 
                             
                            CommandArgument ='<%# Eval("E_SUBDEL") & "_" & Eval("E_REGPAT") & "_" & Eval("E_REGISTRO_DICTAMEN") & "_" & Eval("E_CRED_COP") & "_" & Eval("E_CRED_RCV") & "_" & Eval("E_INTEGRADOR") & "_" & Eval("E_RALE_COP") & "_" & Eval("E_RALE_RCV") %>' 
                            onprerender="LBAnalisisWord_PreRender"><i class="icon-download"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePatrones" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @SALARIO as FLOAT
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @ID_INTEGRADOR as VARCHAR(10)
SET @SUBDEL=?
SET @ID_INTEGRADOR=?
SET @SALARIO=?


SET @RALECOP=?
SET @RALERCV=?
exec('
if exists(select * from tempdb.dbo.sysobjects where name = ''registros_doc'+@ID_INTEGRADOR+@SUBDEL+''') 
begin 
drop table [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
end 
select rale.* 
into tempdb.dbo.[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
from (
select ''COP'' as TIPO,replace(REGPATR,''-'','''') as REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,INC,FEINC,IMPORTE,substring(PERIODO,4,7) as PERIODO from rale.dbo.['+@RALECOP+'] WHERE MOV=''2'' and INC=''09''
union all
select ''RCV'' as TIPO,replace(REGPATR,''-'','''') as REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,INC,FEINC,IMPORTE,substring(PERIODO,4,7) as PERIODO from rale.dbo.['+@RALERCV+'] WHERE MOV=''2'' and INC=''09''
) as rale
')
exec('
if exists(select * from tempdb.dbo.sysobjects where name = ''basepatronescancelar'+@SUBDEL+@ID_INTEGRADOR+''') 
begin 
insert into [sirecaregistros].[dbo].[cancelacinesInfo]
SELECT 
'''+@SUBDEL+''' as E_SUBDEL
,'''+@RALECOP+''' as E_RALE_COP
,'''+@RALERCV+''' as E_RALE_RCV
,'''+@ID_INTEGRADOR+''' as E_INTEGRADOR
,'+@SALARIO+' as E_SALARIO_MINIMO
,B_REGPAT AS E_REGPAT
,(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') AS E_CRED_COP
,ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0) AS E_IMPORTE_COP
,(case 
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;=(25*'+@SALARIO+'*365) then ''V''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;(4*'+@SALARIO+'*365) and (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=(25*'+@SALARIO+'*365) then ''IV''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;(2*'+@SALARIO+'*365) and (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=(4*'+@SALARIO+'*365) then ''III''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;('+@SALARIO+'*365) and (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=(2*'+@SALARIO+'*365) then ''II''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=('+@SALARIO+'*365) then ''I''
end) as E_RANGO
,(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) AS E_CRED_RCV
,ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
),0) AS E_IMPORTE_RCV
,(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and (MOV NOT IN (''2'') OR INC NOT IN(''09''))
) E_OTROS_CREDITOS
,(CASE WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=32 THEN 32  WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=71 THEN 71 ELSE 100 END) AS E_REGISTRO_ANALISIS
,(CASE WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=36 THEN 36  WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=80 THEN 80 ELSE 100 END) AS E_REGISTRO_SOLICITUD
,(CASE WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=24 THEN 24  WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=65 THEN 65 ELSE 100 END) AS E_REGISTRO_DICTAMEN
,B_FECHA_CLASIFICACION as E_FECHA_CLASIFICACION
,B_AFIL_01 as E_AFIL_01
,B_DOMICILIO_FISCAL as E_DOMICILIO_FISCAL
,B_REFERENCIA as E_REFERENCIA
FROM [tempdb].[dbo].[basepatronescancelar'+@SUBDEL+@ID_INTEGRADOR+']
end
')
exec('
if exists(select * from tempdb.dbo.sysobjects where name = ''basepatronescancelar'+@SUBDEL+@ID_INTEGRADOR+''') 
begin 
SELECT 
'''+@SUBDEL+''' as E_SUBDEL
,'''+@RALECOP+''' as E_RALE_COP
,'''+@RALERCV+''' as E_RALE_RCV
,'''+@ID_INTEGRADOR+''' as E_INTEGRADOR
,'+@SALARIO+' as E_SALARIO_MINIMO
,B_REGPAT AS E_REGPAT
,(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') AS E_CRED_COP
,ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0) AS E_IMPORTE_COP
,(case 
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;=(25*'+@SALARIO+'*365) then ''V''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;(4*'+@SALARIO+'*365) and (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=(25*'+@SALARIO+'*365) then ''IV''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;(2*'+@SALARIO+'*365) and (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=(4*'+@SALARIO+'*365) then ''III''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&gt;('+@SALARIO+'*365) and (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=(2*'+@SALARIO+'*365) then ''II''
when (ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP''),0))&lt;=('+@SALARIO+'*365) then ''I''
end) as E_RANGO
,(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) AS E_CRED_RCV
,ISNULL((SELECT SUM([IMPORTE])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
),0) AS E_IMPORTE_RCV
,(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and (MOV NOT IN (''2'') OR INC NOT IN(''09''))
) E_OTROS_CREDITOS
,(CASE WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=32 THEN 32  WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=71 THEN 71 ELSE 100 END) AS E_REGISTRO_ANALISIS
,(CASE WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=36 THEN 36  WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=80 THEN 80 ELSE 100 END) AS E_REGISTRO_SOLICITUD
,(CASE WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=24 THEN 24  WHEN (CASE WHEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'')&gt;(SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) THEN (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''COP'') ELSE (SELECT count([NUMCRED])
FROM [tempdb].[dbo].[registros_doc'+@ID_INTEGRADOR+@SUBDEL+']
WHERE REGPATR=B_REGPAT and MOV=''2'' and INC=''09''
and TIPO=''RCV''
) END)&lt;=65 THEN 65 ELSE 100 END) AS E_REGISTRO_DICTAMEN
,B_FECHA_CLASIFICACION as E_FECHA_CLASIFICACION
,B_AFIL_01 as E_AFIL_01
,B_DOMICILIO_FISCAL as E_DOMICILIO_FISCAL
,B_REFERENCIA as E_REFERENCIA
FROM [tempdb].[dbo].[basepatronescancelar'+@SUBDEL+@ID_INTEGRADOR+']
end 
else 
begin
SELECT '''' as E_SUBDEL,'''' as E_RALE_COP,'''' as E_RALE_RCV,'''' as E_INTEGRADOR,'''' as E_SALARIO_MINIMO,'''' as E_REGPAT,'''' as E_CRED_COP,'''' as E_IMPORTE_COP,'''' as E_RANGO,'''' as E_CRED_RCV,'''' as E_IMPORTE_RCV,'''' as E_OTROS_CREDITOS,'''' as E_REGISTRO_ANALISIS,'''' as E_REGISTRO_SOLICITUD,'''' as E_REGISTRO_DICTAMEN,'''' as E_FECHA_CLASIFICACION,'''' as E_AFIL_01,'''' as E_DOMICILIO_FISCAL,'''' as E_REFERENCIA
end
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter DefaultValue="99999" Name="?" SessionField="SIRECAid" />
                <asp:ControlParameter ControlID="HiddenFieldSlarioMin" DefaultValue="0" 
                    Name="?" PropertyName="Value" />
                <asp:ControlParameter ControlID="DDLRCop" DefaultValue="xxxxxxxxx" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLRRcv" DefaultValue="xxxxxxxxx" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
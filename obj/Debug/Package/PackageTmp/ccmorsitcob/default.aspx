<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default50" %>

<asp:Content ID="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div><center>
        <div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                ToolTip="SUBDELEGACION" Width="130px">
        </asp:DropDownList>
        </div> 
        <strong>
        <br />La siguiente informacion se obtuvo del R.A.L.E. C.O.P. con Fecha(s):<br/>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceRepeater1">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FECHA","{0:D}") & " de la Subdelegación:" & Eval("SUBDEL")%>'></asp:Label>
            </ItemTemplate>
            <SeparatorTemplate><br/></SeparatorTemplate>
        </asp:Repeater>
        </strong>
        <asp:SqlDataSource ID="SqlDataSourceRepeater1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FRALECOP01 as DATETIME
DECLARE @FRALECOP33 as DATETIME
SET @SUBDEL=?
SET @FRALECOP01 = (SELECT top 1 FECHA FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @FRALECOP33 = (SELECT top 1 FECHA FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SELECT * FROM (
select '01' AS SUBDEL,@FRALECOP01 AS FECHA
union all
select '33' AS SUBDEL,@FRALECOP33 AS FECHA
) AS RESULT
WHERE SUBDEL LIKE @SUBDEL">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        </center>
        <center><h4><strong>1) Cartera de Créditos en Mora por situación de cobro</strong></h4></center>
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            HorizontalAlign="Center" ShowFooter="True" 
            CssClass="table-condensed table-hover" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="INCIDENCIAS1" HeaderText="INCIDENCIAS" 
                    ReadOnly="True" SortExpression="INCIDENCIAS1" />
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_CRED" DataFormatString="{0:P}" HeaderText="%" 
                    ReadOnly="True" SortExpression="P_CRED">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_IMP" DataFormatString="{0:P}" HeaderText="%" 
                    ReadOnly="True" SortExpression="P_IMP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="btn-success" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @FRALECOP01 as VARCHAR(15)
DECLARE @FRALECOP33 as VARCHAR(15)
DECLARE @REPORTE as VARCHAR(1)
SET @SUBDEL=?
--Valor Estatico
SET @REPORTE='1'

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @FRALECOP01 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @FRALECOP33 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)

--SELECT @FRALECOP01,@FRALECOP33

exec('
DECLARE @T_CREDITO AS FLOAT
DECLARE @T_IMPORTE AS FLOAT
SET @T_CREDITO=(
SELECT count(*) as T_CREDITOS
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
ELSE 2
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
ELSE 2
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
ELSE 2
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
ELSE 2
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
)

----------------------------------------------------------------------------------------------------------------------
SET @T_IMPORTE=(SELECT SUM(IMPORTE) as T_IMPORTE
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
ELSE 2
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
ELSE 2
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
ELSE 2
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
ELSE 2
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
)
----------------------------------------------------------------------------------------------------------------------

SELECT INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',COUNT(NUMCRED) AS CREDITOS,COUNT(NUMCRED)/@T_CREDITO as P_CRED,SUM(IMPORTE) AS IMPORTE,SUM(IMPORTE)/@T_IMPORTE AS P_IMP
FROM (
select 
(CASE WHEN IMPORTE&lt;2500 THEN (case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end) END) AS MUNICIPIO_m2500
,(CASE 
WHEN TD=''02'' THEN ''E.C.O.''
WHEN TD IN (''08'',''80'',''81'',''82'',''83'',''84'',''85'',''86'',''87'',''88'',''89'') THEN ''MULTA''
WHEN TD IN (''03'') THEN ''SIVEPA''
WHEN TD IN (''05'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'') THEN ''AUDITORIA''
WHEN TD IN (''00'',''70'',''71'') THEN ''CAPITALES CONST.''
WHEN TD IN (''04'') THEN ''AVISOS EXTEMP''
ELSE TD
END) AS TD_D
,(CASE
WHEN MESES&lt;=6 THEN ''menos de 6 meses''
WHEN MESES between 7 and 12 THEN ''7 meses a 12 meses''
WHEN MESES between 12 and 36 THEN ''1 a 3 años''
WHEN MESES between 36 and 60 THEN ''**3 a 5 años''
WHEN MESES &gt; 60 THEN ''***mas de 5 años''
END) as PERIODOS
,(CASE
WHEN MESES&lt;=6 THEN 1
WHEN MESES between 7 and 12 THEN 2
WHEN MESES between 12 and 36 THEN 3
WHEN MESES between 36 and 60 THEN 4
WHEN MESES &gt; 60 THEN 5
END) as PERIODOS_ORDEN,* from (
select ''01'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP01+'''),'''+@FRALECOP01+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
ELSE ''Factible de Cobro/En trámite de recuperación''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
ELSE 2
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
ELSE 2
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP33+'''),'''+@FRALECOP33+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
ELSE ''Factible de Cobro/En trámite de recuperación''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
ELSE ''Factible de Cobro''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
ELSE 2
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
ELSE 2
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+' IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
GROUP BY INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+'
ORDER BY INCIDENCIAS'+@REPORTE+'_ORDEN
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    <center><h4><strong>2) Antigüedad de los periodos de la cartera</strong></h4></center>
        <asp:GridView ID="GridView2" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
            ShowHeader="False" HorizontalAlign="Center" 
            CssClass="table-bordered table-hover" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="INCIDENCIAS" HeaderText="INCIDENCIAS" 
                    ReadOnly="True" SortExpression="INCIDENCIAS" />
                <asp:TemplateField HeaderText="PERIODOS_O" SortExpression="PERIODOS_O">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("PERIODOS_O") %>' />
                        <asp:GridView ID="GridView21" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource21" Font-Size="8pt" ShowFooter="True" 
                            onprerender="GridView21_PreRender" Width="100%" 
                            CssClass="table-condensed" >
                            <Columns>
                                <asp:BoundField DataField="PERIODOS" HeaderText="PERIODOS" ReadOnly="True" 
                                    SortExpression="PERIODOS" />
                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_CRED" DataFormatString="{0:P}" HeaderText="%" 
                                    ReadOnly="True" SortExpression="P_CRED">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_IMP" DataFormatString="{0:P}" HeaderText="%" 
                                    ReadOnly="True" SortExpression="P_IMP">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="btn-success" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource21" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @FRALECOP01 as VARCHAR(15)
DECLARE @FRALECOP33 as VARCHAR(15)
DECLARE @REPORTE as VARCHAR(1)
DECLARE @REPORTE_INC as VARCHAR(1)
SET @SUBDEL=?
SET @REPORTE_INC=?
--Valor Estatico
SET @REPORTE='2'

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @FRALECOP01 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @FRALECOP33 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)

exec('
DECLARE @T_CREDITO AS FLOAT
DECLARE @T_IMPORTE AS FLOAT
SET @T_CREDITO=(
SELECT count(*) as T_CREDITOS
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+')

----------------------------------------------------------------------------------------------------------------------
SET @T_IMPORTE=(SELECT SUM(IMPORTE) as T_IMPORTE
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+')
----------------------------------------------------------------------------------------------------------------------

SELECT INCIDENCIAS'+@REPORTE+'_ORDEN,PERIODOS_ORDEN,INCIDENCIAS'+@REPORTE+',PERIODOS,COUNT(NUMCRED) AS CREDITOS,COUNT(NUMCRED)/@T_CREDITO as P_CRED,SUM(IMPORTE) AS IMPORTE,SUM(IMPORTE)/@T_IMPORTE as P_IMP 
FROM (
select 
(CASE WHEN IMPORTE&lt;2500 THEN (case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end) END) AS MUNICIPIO_m2500
,(CASE 
WHEN TD=''02'' THEN ''E.C.O.''
WHEN TD IN (''08'',''80'',''81'',''82'',''83'',''84'',''85'',''86'',''87'',''88'',''89'') THEN ''MULTA''
WHEN TD IN (''03'') THEN ''SIVEPA''
WHEN TD IN (''05'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'') THEN ''AUDITORIA''
WHEN TD IN (''00'',''70'',''71'') THEN ''CAPITALES CONST.''
WHEN TD IN (''04'') THEN ''AVISOS EXTEMP''
END) AS TD_D
,(CASE
WHEN MESES&lt;=6 THEN ''menos de 6 meses''
WHEN MESES between 7 and 12 THEN ''7 meses a 12 meses''
WHEN MESES between 12 and 36 THEN ''1 a 3 años''
WHEN MESES between 36 and 60 THEN ''**3 a 5 años''
WHEN MESES &gt; 60 THEN ''***mas de 5 años''
END) as PERIODOS
,(CASE
WHEN MESES&lt;=6 THEN 1
WHEN MESES between 7 and 12 THEN 2
WHEN MESES between 12 and 36 THEN 3
WHEN MESES between 36 and 60 THEN 4
WHEN MESES &gt; 60 THEN 5
END) as PERIODOS_ORDEN,* from (
select ''01'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP01+'''),'''+@FRALECOP01+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP33+'''),'''+@FRALECOP33+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+' IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
GROUP BY INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',PERIODOS_ORDEN,PERIODOS
ORDER BY INCIDENCIAS'+@REPORTE+'_ORDEN,PERIODOS_ORDEN
')
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="0" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT 'Dinámicas' AS INCIDENCIAS,'1' AS PERIODOS_O
union all
SELECT 'Factibles de cobro' AS INCIDENCIAS,'2' AS PERIODOS_O
union all
SELECT 'Baja probabilidad de cobro' AS INCIDENCIAS,'3' AS PERIODOS_O
union all
SELECT 'Controvertidos' AS INCIDENCIAS,'4' AS PERIODOS_O
">
        </asp:SqlDataSource>
<center><h4><strong>3) Desglose de Créditos Factibles de Cobro/En trámite de recuperación</strong></h4></center>
<asp:GridView ID="GridView3" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource3" 
            HorizontalAlign="Center" ShowFooter="True" 
            CssClass="table-condensed table-hover" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="TD_D" 
                    ReadOnly="True" SortExpression="TD_D" >
                <HeaderStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_CRED" DataFormatString="{0:P}" HeaderText="%" 
                    ReadOnly="True" SortExpression="P_CRED">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="P_IMP" DataFormatString="{0:P}" HeaderText="%" 
                    ReadOnly="True" SortExpression="P_IMP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="btn-success" Wrap="True" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @FRALECOP01 as VARCHAR(15)
DECLARE @FRALECOP33 as VARCHAR(15)
DECLARE @REPORTE as VARCHAR(1)
DECLARE @REPORTE_INC as VARCHAR(1)

SET @SUBDEL=?
SET @REPORTE_INC=?
--Valor Estatico
SET @REPORTE='1'

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @FRALECOP01 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @FRALECOP33 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)

--SELECT @FRALECOP01,@FRALECOP33

exec('
DECLARE @T_CREDITO AS FLOAT
DECLARE @T_IMPORTE AS FLOAT
SET @T_CREDITO=(
SELECT count(*) as T_CREDITOS
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
)

----------------------------------------------------------------------------------------------------------------------
SET @T_IMPORTE=(SELECT SUM(IMPORTE) as T_IMPORTE
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
)
----------------------------------------------------------------------------------------------------------------------

SELECT INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',TD_D,COUNT(NUMCRED) AS CREDITOS,COUNT(NUMCRED)/@T_CREDITO as P_CRED,SUM(IMPORTE) AS IMPORTE,SUM(IMPORTE)/@T_IMPORTE AS P_IMP
FROM (
select 
(CASE WHEN IMPORTE&lt;2500 THEN (case when len(loc)=40 then substring(loc,1,len(loc)-5) else loc end) END) AS MUNICIPIO_m2500
,(CASE 
WHEN TD=''02'' THEN ''E.C.O.''
WHEN TD IN (''08'',''80'',''81'',''82'',''83'',''84'',''85'',''86'',''87'',''88'',''89'') THEN ''MULTA''
WHEN TD IN (''03'') THEN ''SIVEPA''
WHEN TD IN (''05'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'') THEN ''AUDITORIA''
WHEN TD IN (''00'',''70'',''71'') THEN ''CAPITALES CONST.''
WHEN TD IN (''04'') THEN ''AVISOS EXTEMP''
ELSE TD
END) AS TD_D
,(CASE
WHEN MESES&lt;=6 THEN ''menos de 6 meses''
WHEN MESES between 7 and 12 THEN ''7 meses a 12 meses''
WHEN MESES between 12 and 36 THEN ''1 a 3 años''
WHEN MESES between 36 and 60 THEN ''**3 a 5 años''
WHEN MESES &gt; 60 THEN ''***mas de 5 años''
END) as PERIODOS
,(CASE
WHEN MESES&lt;=6 THEN 1
WHEN MESES between 7 and 12 THEN 2
WHEN MESES between 12 and 36 THEN 3
WHEN MESES between 36 and 60 THEN 4
WHEN MESES &gt; 60 THEN 5
END) as PERIODOS_ORDEN,* from (
select ''01'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP01+'''),'''+@FRALECOP01+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP33+'''),'''+@FRALECOP33+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+' IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
GROUP BY INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',TD_D
ORDER BY INCIDENCIAS'+@REPORTE+'_ORDEN
')
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="2" Name="?" />
            </SelectParameters>
        </asp:SqlDataSource>
<center><h4><strong>4) Créditos con importe menor a $2,500</strong></h4></center>

    </div>
        <asp:GridView ID="GridView22" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource4" 
            ShowHeader="False" HorizontalAlign="Center" 
        CssClass="table-bordered table-hover" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="INCIDENCIAS" HeaderText="INCIDENCIAS" 
                    ReadOnly="True" SortExpression="INCIDENCIAS" />
                <asp:TemplateField HeaderText="PERIODOS_O" SortExpression="PERIODOS_O">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField2" runat="server" 
                            Value='<%# Eval("PERIODOS_O") %>' />
                        <asp:GridView ID="GridView23" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource22" Font-Size="8pt" ShowFooter="True" 
                            onprerender="GridView23_PreRender" BorderStyle="Solid" Width="100%" 
                            CssClass="table-condensed">
                            <Columns>
                                <asp:BoundField DataField="CASO" HeaderText="CASO" ReadOnly="True" 
                                    SortExpression="CASO" />
                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_CRED" DataFormatString="{0:P}" HeaderText="%" 
                                    ReadOnly="True" SortExpression="P_CRED">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_IMP" DataFormatString="{0:P}" HeaderText="%" 
                                    ReadOnly="True" SortExpression="P_IMP">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="btn-success" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @FRALECOP01 as VARCHAR(15)
DECLARE @FRALECOP33 as VARCHAR(15)
DECLARE @REPORTE as VARCHAR(1)
DECLARE @REPORTE_INC as VARCHAR(1)

SET @SUBDEL=?
SET @REPORTE_INC=?
-----------------------------------
SET @REPORTE='1'

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @FRALECOP01 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @FRALECOP33 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)

--SELECT @FRALECOP01,@FRALECOP33

exec('
DECLARE @T_CREDITO AS FLOAT
DECLARE @T_IMPORTE AS FLOAT
SET @T_CREDITO=(
SELECT count(*) as T_CREDITOS
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
)

----------------------------------------------------------------------------------------------------------------------
SET @T_IMPORTE=(SELECT SUM(IMPORTE) as T_IMPORTE
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN from (
select ''01'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'') THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'') THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'') THEN 3
WHEN INC IN (''06'',''14'') THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
)
----------------------------------------------------------------------------------------------------------------------

SELECT INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',CASO,COUNT(NUMCRED) AS CREDITOS,COUNT(NUMCRED)/@T_CREDITO as P_CRED,SUM(IMPORTE) AS IMPORTE,SUM(IMPORTE)/@T_IMPORTE AS P_IMP
FROM (
select
(CASE WHEN IMPORTE&lt;2500 THEN ''MENOR A $2,500'' ELSE ''MAYORES'' END) AS CASO
,(case when len(loc)=40 then substring(loc,1,len(loc)-5) END) AS MUNICIPIO_m2500
,(CASE 
WHEN TD=''02'' THEN ''E.C.O.''
WHEN TD IN (''08'',''80'',''81'',''82'',''83'',''84'',''85'',''86'',''87'',''88'',''89'') THEN ''MULTA''
WHEN TD IN (''03'') THEN ''SIVEPA''
WHEN TD IN (''05'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'') THEN ''AUDITORIA''
WHEN TD IN (''00'',''70'',''71'') THEN ''CAPITALES CONST.''
WHEN TD IN (''04'') THEN ''AVISOS EXTEMP''
ELSE TD
END) AS TD_D
,(CASE
WHEN MESES&lt;=6 THEN ''menos de 6 meses''
WHEN MESES between 7 and 12 THEN ''7 meses a 12 meses''
WHEN MESES between 12 and 36 THEN ''1 a 3 años''
WHEN MESES between 36 and 60 THEN ''**3 a 5 años''
WHEN MESES &gt; 60 THEN ''***mas de 5 años''
END) as PERIODOS
,(CASE
WHEN MESES&lt;=6 THEN 1
WHEN MESES between 7 and 12 THEN 2
WHEN MESES between 12 and 36 THEN 3
WHEN MESES between 36 and 60 THEN 4
WHEN MESES &gt; 60 THEN 5
END) as PERIODOS_ORDEN,* from (
select ''01'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP01+'''),'''+@FRALECOP01+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP33+'''),'''+@FRALECOP33+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+' IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+'
GROUP BY INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',CASO
ORDER BY INCIDENCIAS'+@REPORTE+'_ORDEN
')
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HiddenField2" DefaultValue="0" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="SELECT 'Dinámicas' AS INCIDENCIAS,'1' AS PERIODOS_O
union all
SELECT 'Factible de Cobro/En trámite de recuperación' AS INCIDENCIAS,'2' AS PERIODOS_O
/*union all
SELECT 'Baja probabilidad o Con impedimento de cobro' AS INCIDENCIAS,'3' AS PERIODOS_O
*/">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView24" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource5" 
            ShowHeader="False" HorizontalAlign="Center" 
        CssClass="table-bordered table-hover" Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="INCIDENCIAS" HeaderText="INCIDENCIAS" 
                    ReadOnly="True" SortExpression="INCIDENCIAS" />
                <asp:TemplateField HeaderText="PERIODOS_O" SortExpression="PERIODOS_O">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField3" runat="server" 
                            Value='<%# Eval("PERIODOS_O") %>' />
                        <asp:GridView ID="GridView25" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource23" Font-Size="8pt" ShowFooter="True" 
                            onprerender="GridView23_PreRender" BorderStyle="Solid" Width="100%" 
                            CssClass="table-condensed" Font-Strikeout="False">
                            <Columns>
                                <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" ReadOnly="True" 
                                    SortExpression="MUNICIPIO" />
                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_CRED" DataFormatString="{0:P}" HeaderText="%" 
                                    ReadOnly="True" SortExpression="P_CRED">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_IMP" DataFormatString="{0:P}" HeaderText="%" 
                                    ReadOnly="True" SortExpression="P_IMP">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="btn-success" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource23" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            
                            
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP01 as VARCHAR(15)
DECLARE @RALECOP33 as VARCHAR(15)
DECLARE @FRALECOP01 as VARCHAR(15)
DECLARE @FRALECOP33 as VARCHAR(15)
DECLARE @REPORTE as VARCHAR(1)
DECLARE @REPORTE_INC as VARCHAR(1)

SET @SUBDEL=?
SET @REPORTE_INC=?
-----------------------------------
SET @REPORTE='1'

SET @RALECOP01 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @RALECOP33 = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)
SET @FRALECOP01 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='01' and tipo='COP' order by fecha desc)
SET @FRALECOP33 = (SELECT top 1 CONVERT(VARCHAR(10),FECHA,103) FROM [rale].[dbo].[tablas] where subdel='33' and tipo='COP' order by fecha desc)

--SELECT @FRALECOP01,@FRALECOP33

exec('
DECLARE @T_CREDITO AS FLOAT
DECLARE @T_IMPORTE AS FLOAT
SET @T_CREDITO=(
SELECT count(*) as T_CREDITOS
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN,CASO from (
select ''01'' as subdel
,(CASE WHEN IMPORTE&lt;2500 THEN ''MENOR A $2,500'' ELSE ''MAYORES'' END) AS CASO
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE WHEN IMPORTE&lt;2500 THEN ''MENOR A $2,500'' ELSE ''MAYORES'' END) AS CASO
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+' and CASO not in (''MAYORES'')
)

----------------------------------------------------------------------------------------------------------------------
SET @T_IMPORTE=(SELECT SUM(IMPORTE) as T_IMPORTE
FROM (
select 
IMPORTE,INCIDENCIAS'+@REPORTE+'_ORDEN,CASO from (
select ''01'' as subdel
,(CASE WHEN IMPORTE&lt;2500 THEN ''MENOR A $2,500'' ELSE ''MAYORES'' END) AS CASO
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,(CASE WHEN IMPORTE&lt;2500 THEN ''MENOR A $2,500'' ELSE ''MAYORES'' END) AS CASO
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN='+@REPORTE_INC+' and CASO not in (''MAYORES'')
)
----------------------------------------------------------------------------------------------------------------------

SELECT INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',CASO,MUNICIPIO,COUNT(NUMCRED) AS CREDITOS,COUNT(NUMCRED)/@T_CREDITO as P_CRED,SUM(IMPORTE) AS IMPORTE,SUM(IMPORTE)/@T_IMPORTE AS P_IMP
FROM (
select
(CASE WHEN IMPORTE&lt;2500 THEN ''MENOR A $2,500'' ELSE ''MAYORES'' END) AS CASO
,(case when len(loc)=40 then substring(loc,1,len(loc)-5) END) AS MUNICIPIO
,(CASE 
WHEN TD=''02'' THEN ''E.C.O.''
WHEN TD IN (''08'',''80'',''81'',''82'',''83'',''84'',''85'',''86'',''87'',''88'',''89'') THEN ''MULTA''
WHEN TD IN (''03'') THEN ''SIVEPA''
WHEN TD IN (''05'',''50'',''51'',''52'',''53'',''54'',''55'',''56'',''57'',''58'',''59'',''60'') THEN ''AUDITORIA''
WHEN TD IN (''00'',''70'',''71'') THEN ''CAPITALES CONST.''
WHEN TD IN (''04'') THEN ''AVISOS EXTEMP''
ELSE TD
END) AS TD_D
,(CASE
WHEN MESES&lt;=6 THEN ''menos de 6 meses''
WHEN MESES between 7 and 12 THEN ''7 meses a 12 meses''
WHEN MESES between 12 and 36 THEN ''1 a 3 años''
WHEN MESES between 36 and 60 THEN ''**3 a 5 años''
WHEN MESES &gt; 60 THEN ''***mas de 5 años''
END) as PERIODOS
,(CASE
WHEN MESES&lt;=6 THEN 1
WHEN MESES between 7 and 12 THEN 2
WHEN MESES between 12 and 36 THEN 3
WHEN MESES between 36 and 60 THEN 4
WHEN MESES &gt; 60 THEN 5
END) as PERIODOS_ORDEN,* from (
select ''01'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP01+'''),'''+@FRALECOP01+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP01+']
union all
select ''33'' as subdel
,DATEDIFF(MONTH,DATEADD(DAY,-1*DIAS,'''+@FRALECOP33+'''),'''+@FRALECOP33+''') AS MESES
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro/En trámite de recuperación''
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad o Con impedimento de cobro''
END) as INCIDENCIAS1
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN ''Dinámicas''
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN ''Factible de Cobro''
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN ''Baja probabilidad''
WHEN INC IN (''06'',''14'')THEN ''Controvertido''
END) as INCIDENCIAS2
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''09'',''10'',''12'',''15'',''16'',''19'',''26'')THEN 3
WHEN INC IN (''06'',''14'')THEN 4
END) as INCIDENCIAS2_ORDEN
,(CASE 
WHEN INC IN (''01'',''02'',''03'',''00'',''20'',''21'')THEN 1
WHEN INC IN (''04'',''05'',''07'',''08'',''11'',''13'',''17'',''18'',''22'',''23'',''25'',''27'')THEN 2
WHEN INC IN (''06'',''09'',''10'',''12'',''14'',''15'',''16'',''19'',''26'')THEN 3
END) as INCIDENCIAS1_ORDEN,REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC,FEINC,DIAS,IMPORTE,PERIODO from rale.dbo.['+@RALECOP33+']
) as rale LEFT JOIN (SELECT REGPAT,LOC FROM SIRECA.DBO.PATRONES) AS PATRONES ON PATRONES.REGPAT=REPLACE(RALE.REGPATR,''-'','''')
WHERE INCIDENCIAS'+@REPORTE+' IS NOT NULL and RALE.subdel like '''+@SUBDEL+'''
) AS RESULT 
WHERE INCIDENCIAS'+@REPORTE+'_ORDEN in ('+@REPORTE_INC+') and CASO not in (''MAYORES'')
GROUP BY INCIDENCIAS'+@REPORTE+'_ORDEN,INCIDENCIAS'+@REPORTE+',CASO,MUNICIPIO
ORDER BY MUNICIPIO
')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="HiddenField3" DefaultValue="0" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="/*SELECT 'Dinámicas mayores a $2,500' AS INCIDENCIAS,'1' AS PERIODOS_O
union all*/
SELECT 'Factible de Cobro/En trámite de recuperación  mayores a $2,500' AS INCIDENCIAS,'2' AS PERIODOS_O
/*union all
SELECT 'Baja probabilidad o Con impedimento de cobro  mayores a $2,500' AS INCIDENCIAS,'3' AS PERIODOS_O
*/">
        </asp:SqlDataSource>
</asp:Content>

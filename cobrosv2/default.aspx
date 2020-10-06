<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="default.aspx.vb" Inherits="WebSIRECA._default51" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
hr.linea {
    border: 0;
    height: 1px;
    background-image: -webkit-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:    -moz-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:     -ms-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
    background-image:      -o-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0)); 
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
<center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
    <asp:TextBox ID="TBCredito" runat="server" placeholder="CODIGO DE BARRA" 
        CssClass="text-center search-query" MaxLength="50" Width="180px" ></asp:TextBox>
    <asp:DropDownList ID="DDLCopRcv" runat="server" Width="140px">
        <asp:ListItem Value="%">C.O.P. y R.C.V.</asp:ListItem>
        <asp:ListItem Value="COP">C.O.P.</asp:ListItem>
        <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="BBuscar" runat="server" Text="BUSCAR" CssClass="btn"/>
</div>
<div class="tabbable"> <!-- Only required for left/right tabs -->
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab11" data-toggle="tab">RESULTADOS</a></li>
    <li><a href="#tab22" data-toggle="tab">ACCION A REALIZAR</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab11">
      <p>
          &nbsp;<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left" Width="600px" CssClass="well">
    <asp:Repeater ID="RepeaterDatos" runat="server" DataSourceID="SqlDataSourceDatos">
    <ItemTemplate>
    <dl>
      <dt>Detalles</dt>
      <dd>
        <p>
        El Patron <asp:Label ID="Label2" runat="server" Text='<%# Eval("REGPAT") %>' Font-Underline="True"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text='<%# Eval("RAZON_SOCIAL") %>' Font-Underline="True"></asp:Label>
         con actividad <asp:Label ID="Label7" runat="server" Text='<%# Eval("ACTIVIDAD") %>' Font-Underline="True"></asp:Label>
        <%--<br /><asp:Label ID="Label4" runat="server" Text='<%# Eval("RFC") %>'></asp:Label>--%>
        Registrado con domicilio <asp:Label ID="Label5" runat="server" Text='<%# Eval("DOMICILIO") %>' Font-Underline="True"></asp:Label>
        en la localidad de <asp:Label ID="Label6" runat="server" Text='<%# Eval("LOCALIDAD") %>' Font-Underline="True"></asp:Label>
        con <asp:Label ID="Label4" runat="server" Text='<%# Eval("COTIZANTES","{0:N0}") %>' Font-Underline="True"></asp:Label> trabajadores
        </p>
      </dd>
      <dt>Listado de adeudo Empleado</dt>
      <dd>
        <p>
        C.O.P. del <asp:Label ID="Label9" runat="server" Text='<%# Eval("RALECOP_FECHA","{0:D}") %>' Font-Underline="True"></asp:Label>
        <br/>R.C.V. del <asp:Label ID="Label10" runat="server" Text='<%# Eval("RALERCV_FECHA","{0:D}") %>' Font-Underline="True"></asp:Label>
        </p>
      </dd>
      <dt>Informacion de Interes</dt>
      <dd>
        <p>
        <strong>Representante Legal:</strong><asp:Label ID="Label8" runat="server" Text='<%# Eval("REP_LEGA") %>'></asp:Label>
        <br /><strong>Enviar un Correo: </strong><asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("CORREO") %>' NavigateUrl='<%# "mailto:" & Eval("CORREO") & "?subject=AVISO DE PAGO&body=Buenas, le informo:" %>'></asp:HyperLink>
        <br /><strong>Telefono/No. Celular: </strong> <asp:Label ID="Label1" runat="server" Text='<%# Eval("TELEFONO") %>'></asp:Label>
        </p>
      </dd>
      <dt>Nota</dt>
      <dd>
        <p>
        <strong><asp:Label ID="Label11" runat="server" Text='<%# Eval("CASOS_D","{0:N0}") %>' Font-Underline="True" ></asp:Label> Creditos(<asp:Label ID="Label16" runat="server" Text='<%# Eval("IMPORTE_D","{0:C}") %>' Font-Underline="True"></asp:Label>)</strong> por CLASIFICAR
        <br/><strong><asp:Label ID="Label12" runat="server" Text='<%# Eval("CASOS_C","{0:N0}") %>' Font-Underline="True" ></asp:Label> Creditos(<asp:Label ID="Label15" runat="server" Text='<%# Eval("IMPORTE_C","{0:C}") %>' Font-Underline="True"></asp:Label>)</strong> FACTIBLES de COBRO
        <br/><strong><asp:Label ID="Label17" runat="server" Text='<%# Eval("CASOS_I","{0:N0}") %>' Font-Underline="True" ></asp:Label> Creditos(<asp:Label ID="Label18" runat="server" Text='<%# Eval("IMPORTE_I","{0:C}") %>' Font-Underline="True"></asp:Label>)</strong> con IMPEDIMENTO DE COBRO
        </p>
      </dd>
    </dl>
    </ItemTemplate>
    </asp:Repeater>    
  <asp:SqlDataSource ID="SqlDataSourceDatos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @RALECOP_FECHA as DATETIME
DECLARE @RALERCV_FECHA as DATETIME
DECLARE @CREDITO_CODEBAR as VARCHAR(50)
DECLARE @REGPAT as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(15)
SET @SUBDEL = ?
SET @CREDITO_CODEBAR = ?
SET @TIPO_COP_RCV=?

SET @RALECOP = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @RALECOP_FECHA = (select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV_FECHA = (select top 1 [fecha] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @REGPAT=(case 
when charindex('!',@CREDITO_CODEBAR)=0 then @CREDITO_CODEBAR
else (
SELECT TOP 1 replace([CQ_DATO1],'REG. PATRONAL:$','') 
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(@CREDITO_CODEBAR,1,charindex('!',@CREDITO_CODEBAR)-1)
)
end)
SET @REGPAT=substring(@REGPAT,1,10)


exec('
SELECT
convert(datetime,'''+@RALECOP_FECHA+''',103) as RALECOP_FECHA
,convert(datetime,'''+@RALERCV_FECHA+''',103) as RALERCV_FECHA
,SECTOR,REGPAT,RFC,DOMICILIO,LOCALIDAD,ACTIVIDAD,RAZON_SOCIAL,COTIZANTES,ULTIMA_EMI,REP_LEGA,CORREO,TELEFONO
,REGPATR_D,ISNULL(GRUPO_D,0) AS GRUPO_D,ISNULL(CASOS_D,0) AS CASOS_D,ISNULL(IMPORTE_D,0) AS IMPORTE_D
,REGPATR_C,ISNULL(GRUPO_C,0) AS GRUPO_C,ISNULL(CASOS_C,0) AS CASOS_C,ISNULL(IMPORTE_C,0) AS IMPORTE_C
,REGPATR_I,ISNULL(GRUPO_I,0) AS GRUPO_I,ISNULL(CASOS_I,0) AS CASOS_I,ISNULL(IMPORTE_I,0) AS IMPORTE_I
FROM
(SELECT sector AS SECTOR
,regpat AS REGPAT
,rfc AS RFC
,dom AS DOMICILIO
,loc AS LOCALIDAD
,act AS ACTIVIDAD
,razonSocial AS RAZON_SOCIAL
,cotiz AS COTIZANTES
,vigencia AS ULTIMA_EMI
,ISNULL((SELECT TOP 1 inf.[info] FROM [firmaDigital].[dbo].[info] as inf where [tipo]=''1'' and inf.[regpat]=ptn2.regpat),''SIN REP.LEGAL REGISTRADO'') as REP_LEGA
,ISNULL((SELECT TOP 1 inf.[info] FROM [firmaDigital].[dbo].[info] as inf where [tipo]=''2'' and inf.[regpat]=ptn2.regpat),''SIN CORREO REGISTRADO'') as CORREO
,ISNULL((SELECT TOP 1 inf.[info] FROM [firmaDigital].[dbo].[info] as inf where [tipo]=''3'' and inf.[regpat]=ptn2.regpat),''SIN TELEFONO REGISTRADO'') as TELEFONO
from sireca.dbo.patrones as ptn2 WHERE regpat='''+@REGPAT+'''
) AS PTN
LEFT JOIN

(
SELECT REPLACE(REGPATR,''-'','''') AS REGPATR_D,GRUPO AS GRUPO_D,COUNT(*) AS CASOS_D,SUM(IMPORTE) AS IMPORTE_D FROM (
SELECT TIPO,(
case 
when INC in (''00'',''01'',''02'',''03'',''08'',''18'',''20'',''21'',''23'',''25'',''27'') then ''DINAMICA''
when INC in (''04'',''05'',''07'',''17'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''51'',''52'',''53'',''54'',''55'') then ''COBRO''
else ''IMPEDIMENTO''
end
) as GRUPO,REGPATR,[NUMCRED],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],[TD],[FALTA],[FNOTIFICACION] 
FROM (
SELECT ''COP'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALECOP+'] as tcop
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
union all
SELECT ''RCV'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALERCV+'] as trcv
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
) as rale
) AS RESULTADO
WHERE TIPO LIKE '''+@TIPO_COP_RCV+''' AND GRUPO=''DINAMICA''
GROUP BY REGPATR,GRUPO
) AS DATOSD
 ON DATOSD.REGPATR_D=PTN.REGPAT
 
 LEFT JOIN
(
SELECT REPLACE(REGPATR,''-'','''') AS REGPATR_C,GRUPO AS GRUPO_C,COUNT(*) AS CASOS_C,SUM(IMPORTE) AS IMPORTE_C FROM (
SELECT TIPO,(
case 
when INC in (''00'',''01'',''02'',''03'',''08'',''18'',''20'',''21'',''23'',''25'',''27'') then ''DINAMICA''
when INC in (''04'',''05'',''07'',''17'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''51'',''52'',''53'',''54'',''55'') then ''COBRO''
else ''IMPEDIMENTO''
end
) as GRUPO,REGPATR,[NUMCRED],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],[TD],[FALTA],[FNOTIFICACION] 
FROM (
SELECT ''COP'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALECOP+'] as tcop
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
union all
SELECT ''RCV'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALERCV+'] as trcv
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
) as rale
) AS RESULTADO
WHERE TIPO LIKE '''+@TIPO_COP_RCV+''' AND GRUPO=''COBRO''
GROUP BY REGPATR,GRUPO
) AS DATOSC
 ON DATOSC.REGPATR_C=PTN.REGPAT
 
LEFT JOIN
(
SELECT REPLACE(REGPATR,''-'','''') AS REGPATR_I,GRUPO AS GRUPO_I,COUNT(*) AS CASOS_I,SUM(IMPORTE) AS IMPORTE_I FROM (
SELECT TIPO,(
case 
when INC in (''00'',''01'',''02'',''03'',''08'',''18'',''20'',''21'',''23'',''25'',''27'') then ''DINAMICA''
when INC in (''04'',''05'',''07'',''17'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''51'',''52'',''53'',''54'',''55'') then ''COBRO''
else ''IMPEDIMENTO''
end
) as GRUPO,REGPATR,[NUMCRED],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],[TD],[FALTA],[FNOTIFICACION] 
FROM (
SELECT ''COP'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALECOP+'] as tcop
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
union all
SELECT ''RCV'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALERCV+'] as trcv
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
) as rale
) AS RESULTADO
WHERE TIPO LIKE '''+@TIPO_COP_RCV+''' AND GRUPO=''IMPEDIMENTO''
GROUP BY REGPATR,GRUPO
) AS DATOSI
 ON DATOSI.REGPATR_I=PTN.REGPAT
')
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="33" Name="?" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="TBCredito" DefaultValue="999999999999" 
                                        Name="?" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="%" Name="?" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
    </asp:Panel>
      </p>
    </div>
    <div class="tab-pane" id="tab22">
                <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Left" Width="600px" CssClass="well">
                <ul class="nav nav-list">
                    <li class="nav-header">Paso 1) Seleccione Creditos a Trabajar</li>
                    <li><asp:LinkButton ID="LBCreditos" CssClass="form-inline" runat="server"><span class="icon-list-alt" ></span>&nbsp;Lista de Creditos</asp:LinkButton></li>
                    <li class="nav-header">Paso 2) Seleccione Accion a Realizar</li>
                    <li><a href="#"><asp:CheckBox ID="CBCitatorio" CssClass="form-inline" runat="server" Text="CITATORIO" Checked="True" /></a></li>
                    <li><a href="#"><asp:CheckBox ID="CBMandamiento" CssClass="form-inline" runat="server" Text="MANDAMIENTO" Checked="True" /></a></li>
                    <li><a href="#"><asp:CheckBox ID="CBAmpliacion" CssClass="form-inline" runat="server" Text="AMPLIACION" /></a></li>
                    <li><a href="#"><asp:CheckBox ID="CBRemocion" CssClass="form-inline" runat="server" Text="REMOCIÓN" /></a></li>
                    <li><a href="#"><asp:CheckBox ID="CBCerrajero" CssClass="form-inline" runat="server" Text="CERRAJERO" /></a></li>
                    <li class="nav-header">Paso 3) Agrege al Patron en la lista</li>
                    <li><asp:LinkButton ID="LBAmpliacion" runat="server" ><span class="icon-list"></span>&nbsp;AGREGAR</asp:LinkButton></li>
                    <li></li>
                </ul>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate >
                            <asp:LinkButton ID="LinkButton1" CssClass="label label-info" runat="server" Text='<%# "Llevas en lista " & Eval("PATRONES") & " patron(es) sin asignar" %>' PostBackUrl="~/cobrosv2/patroneselegidos.aspx"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT count(distinct [R_REGPATR]) as PATRONES
FROM [sirecacobros].[dbo].[PAE_CRED] WHERE [R_SUBDEL]=?
and ACTIVO='1111' and ID_INS is null ">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
        </asp:Panel>
    </div>
  </div>
</div>
    
</center>
<br/>
    <asp:ModalPopupExtender ID="MPCreditos" runat="server" Enabled="True" BackgroundCssClass="modalBackground" TargetControlID="LBCreditos" PopupControlID="PanelCreditos" DropShadow="true" CancelControlID="LBCerrar" ></asp:ModalPopupExtender>
    <asp:Panel ID="PanelCreditos" runat="server" BackColor="#F0F0F0" Width="840px" 
        HorizontalAlign="Right">
        <asp:LinkButton ID="LBCerrar" runat="server">cerrar</asp:LinkButton>&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" Height="500px" 
        ScrollBars="Horizontal" Font-Size="9pt">
<div class="tabbable">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">POR CLASIFICAR</a></li>
    <li><a href="#tab2" data-toggle="tab">FACTIBLES DE COBRO</a></li>
    <li><a href="#tab3" data-toggle="tab">IMPEDIMENTO DE COBRO</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab1">
      <p><asp:GridView ID="GridViewDinamicas" runat="server" CssClass="table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDinamicas" AllowSorting="True" HorizontalAlign="Center" Caption="CREDITO(S) POR CLASIFICAR EN COBRO">
    <Columns>
        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
            SortExpression="TIPO" />
        <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" ReadOnly="True" 
            SortExpression="NUMCRED" >
        <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Maroon" />
        </asp:BoundField>
        <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
            SortExpression="INC" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FEINC" HeaderText="FEINC" ReadOnly="True" 
            SortExpression="FEINC" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
            SortExpression="DIAS" DataFormatString="{0:N0}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
            SortExpression="IMPORTE" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#000066" />
        </asp:BoundField>
        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
            SortExpression="PERIODO" >
        <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Maroon" />
        </asp:BoundField>
        <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
            SortExpression="TD" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FALTA" HeaderText="FALTA" ReadOnly="True" 
            SortExpression="FALTA" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FNOTIFICACION" HeaderText="FNOTIFICACION" 
            ReadOnly="True" SortExpression="FNOTIFICACION" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CBAgregar" runat="server" ToolTip="Seleccione para incluirlo en el documento" />
                <asp:HiddenField ID="HFRegpat" runat="server" Value='<%# Eval("REGPATR") %>' />
                <asp:HiddenField ID="HFrazonSocial" runat="server" Value='<%# Eval("razonSocial") %>' />
                <asp:HiddenField ID="HFSector" runat="server" Value='<%# Eval("sector") %>' />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:BoundField DataField="PAGO" HeaderText="PAGO" ReadOnly="True" 
            SortExpression="PAGO" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
            SortExpression="CREDITO" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="ACC_ANT" HeaderText="ACC_ANT" ReadOnly="True" 
            SortExpression="ACC_ANT" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDinamicas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @CREDITO_CODEBAR as VARCHAR(50)
DECLARE @REGPAT as VARCHAR(50)
DECLARE @GRUPO_INC as VARCHAR(50)
DECLARE @TIPO_COP_RCV as VARCHAR(50)
SET @SUBDEL =?
SET @CREDITO_CODEBAR = ?
SET @TIPO_COP_RCV=?

SET @GRUPO_INC='DINAMICA' --DINAMICA,COBRO,IMPEDIMENTO
SET @RALECOP = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @REGPAT=(case 
when charindex('!',@CREDITO_CODEBAR)=0 then @CREDITO_CODEBAR
else (
SELECT TOP 1 replace([CQ_DATO1],'REG. PATRONAL:$','') 
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(@CREDITO_CODEBAR,1,charindex('!',@CREDITO_CODEBAR)-1)
)
end)
SET @REGPAT=substring(@REGPAT,1,10)

exec('
select TIPO,GRUPO,REGPATR,NUMCRED,INC,FEINC,DIAS,IMPORTE,PERIODO,TD,FALTA,FNOTIFICACION,CREDITO,FECHA_MOV,PAGO,ACC_ANT,sector,razonSocial from (
SELECT TAB1.TIPO,TAB1.GRUPO,TAB1.REGPATR,TAB1.NUMCRED,TAB1.INC,TAB1.FEINC,TAB1.DIAS,TAB1.IMPORTE
,substring(TAB1.PERIODO,4,7) AS PERIODO
,TAB1.TD,TAB1.FALTA,TAB1.FNOTIFICACION
--,TAB2.PAGO
--,TAB2.TIPO,TAB2.REGPAT,TAB2.PERIODO
,TAB2.CREDITO
,TAB2.FECHA_MOV
,TAB2.IMPORTE AS PAGO 
,(SELECT TOP 1 (case when [AC_DOC_ENTRGADO] in (''1'') then ''MANDAMIENTO'' when [AC_DOC_ENTRGADO] in (''2'') then ''AMPLIACION'' END)+''(''+CONVERT(NVARCHAR,[AC_FECH_DILIGENCIA],103)+'')'' AS ULTIMA_ACCION
FROM [sirecacobros].[dbo].[CO_ACCIONES]
WHERE [AC_DOC_ENTRGADO] in (''1'',''3'') and [AC_SUBDEL]='''+@SUBDEL+''' --and [AC_HORA_CITATORIO] in (''--:-- -.-.'')
and [AC_RA_REGPATR]=REGPATR
and [AC_RA_NUMCRED]=NUMCRED
and [AC_RA_PERIODO]=TAB1.PERIODO
order by [AC_FECH_DILIGENCIA] desc) AS ACC_ANT
FROM (
SELECT * FROM (
SELECT TIPO,(
case 
when INC in (''00'',''01'',''02'',''03'',''08'',''18'',''20'',''21'',''23'',''25'',''27'') then ''DINAMICA''
when INC in (''04'',''05'',''07'',''17'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''51'',''52'',''53'',''54'',''55'') then ''COBRO''
else ''IMPEDIMENTO''
end
) as GRUPO,replace(REGPATR,''-'','''') as REGPATR,[NUMCRED],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],[TD],[FALTA],[FNOTIFICACION] 
FROM (
SELECT ''COP'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALECOP+'] as tcop
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
union all
SELECT ''RCV'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALERCV+'] as trcv
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
) as rale
) as RESULTADO
WHERE GRUPO='''+@GRUPO_INC+'''
AND TIPO LIKE '''+@TIPO_COP_RCV+'''
) AS TAB1 
LEFT JOIN 
(SELECT DISTINCT TIPO,REGPAT,PERIODO,IMPORTE,CREDITO,FECHA_MOV,PAGO FROM (
--LGP
SELECT ''LGP'' AS PAGO,''COP'' AS TIPO,substring([RC_PATRON],2,8)+[RC_MOD] AS REGPAT
,''01/''+SUBSTRING([RC_PER],6,2)+''/''+SUBSTRING([RC_PER],1,4) AS PERIODO
,[RC_CRED] AS CREDITO,CONVERT(VARCHAR,MAX([RC_FEC_MOV]),103) AS FECHA_MOV,SUM([RC_IMP_TOT]) AS IMPORTE
FROM [lgp].[dbo].[RC] WHERE (substring([RC_PATRON],2,8)+[RC_MOD])='''+@REGPAT+''' AND [RC_IMP_TOT]&gt;0
GROUP BY substring([RC_PATRON],2,8)+[RC_MOD],[RC_PER],[RC_CRED]
UNION ALL
--SIPARE
SELECT ''SIPARE'' AS PAGO,''COP'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT
,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO
,''%'' AS CREDITO
,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV
,SUM([ImporteIMSS]) AS IMPORTE
FROM [sirecaemisiones].[dbo].[sipare] WHERE SUBSTRING([RegistroPatronal],1,10)='''+@REGPAT+''' AND [ImporteIMSS]&gt;0
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate())
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate())
GROUP BY [RegistroPatronal],[PeriodoPago]
UNION ALL
SELECT ''SIPARE'' AS PAGO,''RCV'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO,''NNNNNNNNN'' AS CREDITO
,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV
,SUM([ImporteRCV]) AS IMPORTE
FROM [sirecaemisiones].[dbo].[sipare] WHERE SUBSTRING([RegistroPatronal],1,10)='''+@REGPAT+''' AND [ImporteRCV]&gt;0
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate())
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate())
GROUP BY [RegistroPatronal],[PeriodoPago]
UNION ALL
--PROCESAR
SELECT ''PROCESAR'' AS PAGO,''COP'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT
,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO
,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_COP]) AS IMPORTE
FROM [procesar].[dbo].[RCPRO]
WHERE substring([RCP_REGPAT],1,10)='''+@REGPAT+''' AND [RCP_IMP_COP]&gt;0
and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate())
GROUP BY [RCP_REGPAT],[RCP_PER]
UNION ALL
SELECT ''PROCESAR'' AS PAGO,''RCV'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT
,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO
,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_RCV]) AS IMPORTE
FROM [procesar].[dbo].[RCPRO]
WHERE substring([RCP_REGPAT],1,10)='''+@REGPAT+''' AND [RCP_IMP_RCV]&gt;0
and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate())
GROUP BY [RCP_REGPAT],[RCP_PER]
) AS PAGOS) AS TAB2 ON TAB1.REGPATR=TAB2.REGPAT AND TAB1.PERIODO=TAB2.PERIODO AND TAB1.TIPO=TAB2.TIPO
and TAB1.NUMCRED like TAB2.CREDITO
) as rr left join sireca.dbo.patrones as ptn on ptn.regpat=rr.regpatr
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBCredito" DefaultValue="9999000000999" 
                Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </p>
    </div>
    <div class="tab-pane" id="tab2">
      <p><asp:GridView ID="GridViewCobros" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceCobros" AllowSorting="True" 
        HorizontalAlign="Center" Caption="CREDITO(S) CON FACTIBILIDAD DE COBRO" 
        CssClass="table-bordered">
    <Columns>
        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
            SortExpression="TIPO" />
        <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" ReadOnly="True" 
            SortExpression="NUMCRED" >
        <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Maroon" />
        </asp:BoundField>
        <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
            SortExpression="INC" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FEINC" HeaderText="FEINC" ReadOnly="True" 
            SortExpression="FEINC" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
            SortExpression="DIAS" DataFormatString="{0:N0}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
            SortExpression="IMPORTE" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#000066" />
        </asp:BoundField>
        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
            SortExpression="PERIODO" >
        <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Maroon" />
        </asp:BoundField>
        <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
            SortExpression="TD" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FALTA" HeaderText="FALTA" ReadOnly="True" 
            SortExpression="FALTA" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FNOTIFICACION" HeaderText="FNOTIFICACION" 
            ReadOnly="True" SortExpression="FNOTIFICACION" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CBAgregar0" runat="server" 
                    ToolTip="Seleccione para incluirlo en el documento" Checked='<%# IIF(Eval("INC")="31" and IsDBNull(Eval("ACC_ANT")),"True","False") %>' />
                <asp:HiddenField ID="HFRegpat0" runat="server" Value='<%# Eval("REGPATR") %>' />
                <asp:HiddenField ID="HFrazonSocial0" runat="server" Value='<%# Eval("razonSocial") %>' />
                <asp:HiddenField ID="HFSector0" runat="server" Value='<%# Eval("sector") %>' />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:BoundField DataField="PAGO" HeaderText="PAGO" ReadOnly="True" 
            SortExpression="PAGO" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
            SortExpression="CREDITO" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="ACC_ANT" HeaderText="ACC_ANT" ReadOnly="True" 
            SortExpression="ACC_ANT" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCobros" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @CREDITO_CODEBAR as VARCHAR(50)
DECLARE @REGPAT as VARCHAR(15)
DECLARE @GRUPO_INC as VARCHAR(15)
DECLARE @TIPO_COP_RCV as VARCHAR(15)
SET @SUBDEL =?
SET @CREDITO_CODEBAR = ?
SET @TIPO_COP_RCV=?

SET @GRUPO_INC='COBRO' --DINAMICA,COBRO,IMPEDIMENTO
SET @RALECOP = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @REGPAT=(case 
when charindex('!',@CREDITO_CODEBAR)=0 then @CREDITO_CODEBAR
else (
SELECT TOP 1 replace([CQ_DATO1],'REG. PATRONAL:$','') 
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(@CREDITO_CODEBAR,1,charindex('!',@CREDITO_CODEBAR)-1)
)
end)
SET @REGPAT=substring(@REGPAT,1,10)

exec('
select TIPO,GRUPO,REGPATR,NUMCRED,INC,FEINC,DIAS,IMPORTE,PERIODO,TD,FALTA,FNOTIFICACION,CREDITO,FECHA_MOV,PAGO,ACC_ANT,sector,razonSocial from (
SELECT TAB1.TIPO,TAB1.GRUPO,TAB1.REGPATR,TAB1.NUMCRED,TAB1.INC,TAB1.FEINC,TAB1.DIAS,TAB1.IMPORTE
,substring(TAB1.PERIODO,4,7) AS PERIODO
,TAB1.TD,TAB1.FALTA,TAB1.FNOTIFICACION
--,TAB2.PAGO
--,TAB2.TIPO,TAB2.REGPAT,TAB2.PERIODO
,TAB2.CREDITO
,TAB2.FECHA_MOV
,TAB2.IMPORTE AS PAGO 
,(SELECT TOP 1 (case when [AC_DOC_ENTRGADO] in (''1'') then ''MANDAMIENTO'' when [AC_DOC_ENTRGADO] in (''2'') then ''AMPLIACION'' END)+''(''+CONVERT(NVARCHAR,[AC_FECH_DILIGENCIA],103)+'')'' AS ULTIMA_ACCION
FROM [sirecacobros].[dbo].[CO_ACCIONES]
WHERE [AC_DOC_ENTRGADO] in (''1'',''3'') and [AC_SUBDEL]='''+@SUBDEL+''' --and [AC_HORA_CITATORIO] in (''--:-- -.-.'')
and [AC_RA_REGPATR]=REGPATR
and [AC_RA_NUMCRED]=NUMCRED
and [AC_RA_PERIODO]=TAB1.PERIODO
order by [AC_FECH_DILIGENCIA] desc) AS ACC_ANT
FROM (
SELECT * FROM (
SELECT TIPO,(
case 
when INC in (''00'',''01'',''02'',''03'',''08'',''18'',''20'',''21'',''23'',''25'',''27'') then ''DINAMICA''
when INC in (''04'',''05'',''07'',''17'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''51'',''52'',''53'',''54'',''55'') then ''COBRO''
else ''IMPEDIMENTO''
end
) as GRUPO,replace(REGPATR,''-'','''') as REGPATR,[NUMCRED],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],[TD],[FALTA],[FNOTIFICACION] 
FROM (
SELECT ''COP'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALECOP+'] as tcop
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
union all
SELECT ''RCV'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALERCV+'] as trcv
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
) as rale
) as RESULTADO
WHERE GRUPO='''+@GRUPO_INC+'''
AND TIPO LIKE '''+@TIPO_COP_RCV+'''
) AS TAB1 
LEFT JOIN 
(SELECT DISTINCT TIPO,REGPAT,PERIODO,IMPORTE,CREDITO,FECHA_MOV,PAGO FROM (
--LGP
SELECT ''LGP'' AS PAGO,''COP'' AS TIPO,substring([RC_PATRON],2,8)+[RC_MOD] AS REGPAT
,''01/''+SUBSTRING([RC_PER],6,2)+''/''+SUBSTRING([RC_PER],1,4) AS PERIODO
,[RC_CRED] AS CREDITO,CONVERT(VARCHAR,MAX([RC_FEC_MOV]),103) AS FECHA_MOV,SUM([RC_IMP_TOT]) AS IMPORTE
FROM [lgp].[dbo].[RC] WHERE (substring([RC_PATRON],2,8)+[RC_MOD])='''+@REGPAT+''' AND [RC_IMP_TOT]&gt;0
GROUP BY substring([RC_PATRON],2,8)+[RC_MOD],[RC_PER],[RC_CRED]
UNION ALL
--SIPARE
SELECT ''SIPARE'' AS PAGO,''COP'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT
,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO
,''%'' AS CREDITO
,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV
,SUM([ImporteIMSS]) AS IMPORTE
FROM [sirecaemisiones].[dbo].[sipare] WHERE SUBSTRING([RegistroPatronal],1,10)='''+@REGPAT+''' AND [ImporteIMSS]&gt;0
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate())
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate())
GROUP BY [RegistroPatronal],[PeriodoPago]
UNION ALL
SELECT ''SIPARE'' AS PAGO,''RCV'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO,''NNNNNNNNN'' AS CREDITO
,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV
,SUM([ImporteRCV]) AS IMPORTE
FROM [sirecaemisiones].[dbo].[sipare] WHERE SUBSTRING([RegistroPatronal],1,10)='''+@REGPAT+''' AND [ImporteRCV]&gt;0
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate())
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate())
GROUP BY [RegistroPatronal],[PeriodoPago]
UNION ALL
--PROCESAR
SELECT ''PROCESAR'' AS PAGO,''COP'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT
,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO
,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_COP]) AS IMPORTE
FROM [procesar].[dbo].[RCPRO]
WHERE substring([RCP_REGPAT],1,10)='''+@REGPAT+''' AND [RCP_IMP_COP]&gt;0
and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate())
GROUP BY [RCP_REGPAT],[RCP_PER]
UNION ALL
SELECT ''PROCESAR'' AS PAGO,''RCV'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT
,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO
,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_RCV]) AS IMPORTE
FROM [procesar].[dbo].[RCPRO]
WHERE substring([RCP_REGPAT],1,10)='''+@REGPAT+''' AND [RCP_IMP_RCV]&gt;0
and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate())
GROUP BY [RCP_REGPAT],[RCP_PER]
) AS PAGOS) AS TAB2 ON TAB1.REGPATR=TAB2.REGPAT AND TAB1.PERIODO=TAB2.PERIODO AND TAB1.TIPO=TAB2.TIPO
and TAB1.NUMCRED like TAB2.CREDITO
) as rr left join sireca.dbo.patrones as ptn on ptn.regpat=rr.regpatr
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBCredito" DefaultValue="9999000000999" 
                Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource></p>
    </div>
    <div class="tab-pane" id="tab3">
      <p><asp:GridView ID="GridViewImpedimento" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSourceImpedimento" AllowSorting="True" 
        HorizontalAlign="Center" Caption="CREDITO(S) CON IMPEDIMENTO DE COBRO" 
        CssClass="table-bordered">
    <Columns>
        <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
            SortExpression="TIPO" />
        <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" ReadOnly="True" 
            SortExpression="NUMCRED" >
        <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Maroon" />
        </asp:BoundField>
        <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
            SortExpression="INC" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FEINC" HeaderText="FEINC" ReadOnly="True" 
            SortExpression="FEINC" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
            SortExpression="DIAS" DataFormatString="{0:N0}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
            SortExpression="IMPORTE" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#000066" />
        </asp:BoundField>
        <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
            SortExpression="PERIODO" >
        <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Maroon" />
        </asp:BoundField>
        <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
            SortExpression="TD" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FALTA" HeaderText="FALTA" ReadOnly="True" 
            SortExpression="FALTA" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FNOTIFICACION" HeaderText="FNOTIFICACION" 
            ReadOnly="True" SortExpression="FNOTIFICACION" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CBAgregar1" runat="server" ToolTip="Seleccione para incluirlo en el documento" />
                <asp:HiddenField ID="HFRegpat1" runat="server" Value='<%# Eval("REGPATR") %>' />
                <asp:HiddenField ID="HFrazonSocial1" runat="server" Value='<%# Eval("razonSocial") %>' />
                <asp:HiddenField ID="HFSector1" runat="server" Value='<%# Eval("sector") %>' />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:BoundField DataField="PAGO" HeaderText="PAGO" ReadOnly="True" 
            SortExpression="PAGO" DataFormatString="{0:C}" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
            SortExpression="CREDITO" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="ACC_ANT" HeaderText="ACC_ANT" ReadOnly="True" 
            SortExpression="ACC_ANT" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceImpedimento" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @CREDITO_CODEBAR as VARCHAR(50)
DECLARE @REGPAT as VARCHAR(15)
DECLARE @GRUPO_INC as VARCHAR(15)
DECLARE @TIPO_COP_RCV as VARCHAR(15)
SET @SUBDEL =?
SET @CREDITO_CODEBAR = ?
SET @TIPO_COP_RCV=?
SET @GRUPO_INC='IMPEDIMENTO' --DINAMICA,COBRO,IMPEDIMENTO
SET @RALECOP = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
SET @REGPAT=(case 
when charindex('!',@CREDITO_CODEBAR)=0 then @CREDITO_CODEBAR
else (
SELECT TOP 1 replace([CQ_DATO1],'REG. PATRONAL:$','') 
FROM [controlQR].[dbo].[CONTROL_QR] where [CQ_ID]=substring(@CREDITO_CODEBAR,1,charindex('!',@CREDITO_CODEBAR)-1)
)
end)
SET @REGPAT=substring(@REGPAT,1,10)

exec('
select TIPO,GRUPO,REGPATR,NUMCRED,INC,FEINC,DIAS,IMPORTE,PERIODO,TD,FALTA,FNOTIFICACION,CREDITO,FECHA_MOV,PAGO,ACC_ANT,sector,razonSocial from (
SELECT TAB1.TIPO,TAB1.GRUPO,TAB1.REGPATR,TAB1.NUMCRED,TAB1.INC,TAB1.FEINC,TAB1.DIAS,TAB1.IMPORTE
,substring(TAB1.PERIODO,4,7) AS PERIODO
,TAB1.TD,TAB1.FALTA,TAB1.FNOTIFICACION
--,TAB2.PAGO
--,TAB2.TIPO,TAB2.REGPAT,TAB2.PERIODO
,TAB2.CREDITO
,TAB2.FECHA_MOV
,TAB2.IMPORTE AS PAGO 
,(SELECT TOP 1 (case when [AC_DOC_ENTRGADO] in (''1'') then ''MANDAMIENTO'' when [AC_DOC_ENTRGADO] in (''2'') then ''AMPLIACION'' END)+''(''+CONVERT(NVARCHAR,[AC_FECH_DILIGENCIA],103)+'')'' AS ULTIMA_ACCION
FROM [sirecacobros].[dbo].[CO_ACCIONES]
WHERE [AC_DOC_ENTRGADO] in (''1'',''3'') and [AC_SUBDEL]='''+@SUBDEL+''' --and [AC_HORA_CITATORIO] in (''--:-- -.-.'')
and [AC_RA_REGPATR]=REGPATR
and [AC_RA_NUMCRED]=NUMCRED
and [AC_RA_PERIODO]=TAB1.PERIODO
order by [AC_FECH_DILIGENCIA] desc) AS ACC_ANT
FROM (
SELECT * FROM (
SELECT TIPO,(
case 
when INC in (''00'',''01'',''02'',''03'',''08'',''18'',''20'',''21'',''23'',''25'',''27'') then ''DINAMICA''
when INC in (''04'',''05'',''07'',''17'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''38'',''39'',''40'',''41'',''42'',''43'',''51'',''52'',''53'',''54'',''55'') then ''COBRO''
else ''IMPEDIMENTO''
end
) as GRUPO,replace(REGPATR,''-'','''') as REGPATR,[NUMCRED],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO],[TD],[FALTA],[FNOTIFICACION] 
FROM (
SELECT ''COP'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALECOP+'] as tcop
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
union all
SELECT ''RCV'' as TIPO,[REGPATR],[MOV],[FMOV],[SECTOR],[NUMCRED],[TD],[FALTA],[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[PERIODO] FROM rale.dbo.['+@RALERCV+'] as trcv
WHERE replace(REGPATR,''-'','''')='''+@REGPAT+'''
) as rale
) as RESULTADO
WHERE GRUPO='''+@GRUPO_INC+'''
AND TIPO LIKE '''+@TIPO_COP_RCV+'''
) AS TAB1 
LEFT JOIN 
(SELECT DISTINCT TIPO,REGPAT,PERIODO,IMPORTE,CREDITO,FECHA_MOV,PAGO FROM (
--LGP
SELECT ''LGP'' AS PAGO,''COP'' AS TIPO,substring([RC_PATRON],2,8)+[RC_MOD] AS REGPAT
,''01/''+SUBSTRING([RC_PER],6,2)+''/''+SUBSTRING([RC_PER],1,4) AS PERIODO
,[RC_CRED] AS CREDITO,CONVERT(VARCHAR,MAX([RC_FEC_MOV]),103) AS FECHA_MOV,SUM([RC_IMP_TOT]) AS IMPORTE
FROM [lgp].[dbo].[RC] WHERE (substring([RC_PATRON],2,8)+[RC_MOD])='''+@REGPAT+''' AND [RC_IMP_TOT]&gt;0
GROUP BY substring([RC_PATRON],2,8)+[RC_MOD],[RC_PER],[RC_CRED]
UNION ALL
--SIPARE
SELECT ''SIPARE'' AS PAGO,''COP'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT
,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO
,''%'' AS CREDITO
,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV
,SUM([ImporteIMSS]) AS IMPORTE
FROM [sirecaemisiones].[dbo].[sipare] WHERE SUBSTRING([RegistroPatronal],1,10)='''+@REGPAT+''' AND [ImporteIMSS]&gt;0
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate())
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate())
GROUP BY [RegistroPatronal],[PeriodoPago]
UNION ALL
SELECT ''SIPARE'' AS PAGO,''RCV'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO,''NNNNNNNNN'' AS CREDITO
,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV
,SUM([ImporteRCV]) AS IMPORTE
FROM [sirecaemisiones].[dbo].[sipare] WHERE SUBSTRING([RegistroPatronal],1,10)='''+@REGPAT+''' AND [ImporteRCV]&gt;0
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate())
and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate())
GROUP BY [RegistroPatronal],[PeriodoPago]
UNION ALL
--PROCESAR
SELECT ''PROCESAR'' AS PAGO,''COP'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT
,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO
,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_COP]) AS IMPORTE
FROM [procesar].[dbo].[RCPRO]
WHERE substring([RCP_REGPAT],1,10)='''+@REGPAT+''' AND [RCP_IMP_COP]&gt;0
and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate())
GROUP BY [RCP_REGPAT],[RCP_PER]
UNION ALL
SELECT ''PROCESAR'' AS PAGO,''RCV'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT
,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO
,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_RCV]) AS IMPORTE
FROM [procesar].[dbo].[RCPRO]
WHERE substring([RCP_REGPAT],1,10)='''+@REGPAT+''' AND [RCP_IMP_RCV]&gt;0
and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate())
GROUP BY [RCP_REGPAT],[RCP_PER]
) AS PAGOS) AS TAB2 ON TAB1.REGPATR=TAB2.REGPAT AND TAB1.PERIODO=TAB2.PERIODO AND TAB1.TIPO=TAB2.TIPO
and TAB1.NUMCRED like TAB2.CREDITO
) as rr left join sireca.dbo.patrones as ptn on ptn.regpat=rr.regpatr
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBCredito" DefaultValue="9999000000999" 
                Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="DDLCopRcv" DefaultValue="%" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource></p>
    </div>
  </div>
</div>
        </asp:Panel>
    </asp:Panel>
</div>
</asp:Content>

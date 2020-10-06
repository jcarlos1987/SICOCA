<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default33" %>

<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script type="text/javascript">
        var GB_ROOT_DIR = '../../greybox/';
    </script>    
    <script src="../../greybox/AJS.js" type="text/javascript"></script>
    <script src="../../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="Content2" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <table style="width:100%;">
            <tr>
                <td bgcolor="#FFE8A6">&nbsp;&nbsp;AREA DE CONVENIOS DE LA SUBDELEGACIÓN:
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                                            <asp:Wizard ID="Wizard1" runat="server" 
                        ActiveStepIndex="2" BackColor="#F7F6F3" 
                                                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                Font-Names="Verdana" Font-Size="0.8em" 
                        Height="100%" Width="100%" 
                                                FinishCompleteButtonText="">
                                                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                                                    Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                                                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                                                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                                    ForeColor="#284775" />
                                                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                                                <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
                                                    VerticalAlign="Top" Width="200px" />
                                                <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                                                <WizardSteps>
                                                    <asp:WizardStep runat="server" Title="1)SOLICITUDES">
                                                        <asp:TextBox ID="TBRegpat" runat="server" MaxLength="10" BorderStyle="Solid" 
                                                            BorderWidth="1px"></asp:TextBox>
                                                        <asp:DropDownList ID="DDLTEco" runat="server" AutoPostBack="True">
                                                            <asp:ListItem>RCV</asp:ListItem>
                                                            <asp:ListItem>COP</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Button ID="Button1" runat="server" Text="PASO 1) BUSCAR" 
                                                            BackColor="#FFF3CD" BorderColor="#BCC7D8" BorderStyle="Solid" 
                                                            BorderWidth="1px" />
                                                        <asp:Button ID="Button2" runat="server" BackColor="#FFF3CD" 
                                                            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" 
                                                            Text="PASO 2) Agregar a CONVENIOS" Visible="False" />
                                                        <asp:Label ID="LAddConvenio" runat="server" ForeColor="#CC0000"></asp:Label>
                                                        <asp:GridView ID="GridView1Convenio05" runat="server" AllowSorting="True" 
                                                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                                                            CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSourceConvenios05" 
                                                            EmptyDataText="SIN SOLICITUDES DE CONVENIO" Font-Size="8pt">
                                                            <Columns>
                                                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                    SortExpression="TIPO" />
                                                                <asp:TemplateField>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" ReadOnly="True" 
                                                                    SortExpression="NUMCRED" />
                                                                <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" ReadOnly="True" 
                                                                    SortExpression="REGPATR" />
                                                                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                                                                    ReadOnly="True" SortExpression="RAZON_SOCIAL" />
                                                                <asp:BoundField DataField="RFC" HeaderText="RFC" ReadOnly="True" 
                                                                    SortExpression="RFC" />
                                                                <asp:BoundField DataField="DOMICILIO" HeaderText="DOMICILIO" ReadOnly="True" 
                                                                    SortExpression="DOMICILIO" />
                                                                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" ReadOnly="True" 
                                                                    SortExpression="LOCALIDAD" />
                                                                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                                                                    SortExpression="COTIZANTES" />
                                                                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                                                                    SortExpression="TD" />
                                                                <asp:BoundField DataField="FALTA" HeaderText="FALTA" ReadOnly="True" 
                                                                    SortExpression="FALTA" NullDisplayText="--/--/----" />
                                                                <asp:BoundField DataField="FNOTIFICACION" HeaderText="FNOTIFICACION" 
                                                                    ReadOnly="True" SortExpression="FNOTIFICACION" 
                                                                    NullDisplayText="--/--/----" />
                                                                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                                                    SortExpression="INC" />
                                                                <asp:BoundField DataField="FEINC" HeaderText="FEINC" ReadOnly="True" 
                                                                    SortExpression="FEINC" NullDisplayText="--/--/----" />
                                                                <asp:BoundField DataField="DIAS" HeaderText="DIAS" ReadOnly="True" 
                                                                    SortExpression="DIAS" />
                                                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                                                    SortExpression="IMPORTE" />
                                                                <asp:BoundField DataField="DC" HeaderText="DC" ReadOnly="True" 
                                                                    SortExpression="DC" />
                                                                <asp:BoundField DataField="SC" HeaderText="SC" ReadOnly="True" 
                                                                    SortExpression="SC" />
                                                                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                    SortExpression="PERIODO" />
                                                            </Columns>
                                                            <HeaderStyle BackColor="#BBC4D3" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSourceConvenios05" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                            
                                                            
                                                            
                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(50)
DECLARE @RALERCV as VARCHAR(50)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_INC as VARCHAR(2)
DECLARE @TIPO_ECO as VARCHAR(3)
DECLARE @REGPAT as VARCHAR(12)
SET @SUBDEL=?
SET @TIPO_INC=?
SET @REGPAT=?
SET @TIPO_ECO=?

SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)
if @TIPO_ECO='COP'
begin
exec('
select ''COP'' as TIPO
,replace([REGPATR],''-'','''') as [REGPATR]
,ptn.razonSocial as RAZON_SOCIAL
,ptn.rfc as RFC
,ptn.dom as DOMICILIO
,ptn.loc as LOCALIDAD
,ptn.cotiz as COTIZANTES
      ,[NUMCRED]
      ,[TD]
      ,[FALTA]
      ,[FNOTIFICACION]
      ,[INC]
      ,[FEINC]
      ,[DIAS]
      ,[IMPORTE]
      ,[DC]
      ,[SC]
      ,[PERIODO]
 from rale.dbo.['+@RALECOP+'] as rale left join sireca.dbo.patrones as ptn on replace(regpatr,''-'','''')=regpat
where inc in ('''+@TIPO_INC+''')
and replace(REGPATR,''-'','''') like '''+@REGPAT+'%''
and not exists(
SELECT con.[ID_CONVENIO05] FROM [sirecacobros].[dbo].[conveniocreditos] as con
WHERE con.REGPATR=replace(rale.REGPATR,''-'','''') and con.NUMCRED=rale.NUMCRED and con.TD=rale.TD
)
order by regpatr
')
end
else
begin
if @TIPO_ECO='RCV'
begin
exec('
select ''RCV'' as TIPO
,replace([REGPATR],''-'','''') as [REGPATR]
,ptn.razonSocial as RAZON_SOCIAL
,ptn.rfc as RFC
,ptn.dom as DOMICILIO
,ptn.loc as LOCALIDAD
,ptn.cotiz as COTIZANTES
      ,[NUMCRED]
      ,[TD]
      ,[FALTA]
      ,[FNOTIFICACION]
      ,[INC]
      ,[FEINC]
      ,[DIAS]
      ,[IMPORTE]
      ,[DC]
      ,[SC]
      ,[PERIODO]
 from rale.dbo.['+@RALERCV+'] as rale left join sireca.dbo.patrones as ptn on replace(regpatr,''-'','''')=regpat
where inc in ('''+@TIPO_INC+''')
and replace(REGPATR,''-'','''') like '''+@REGPAT+'%''
and not exists(
SELECT con.[ID_CONVENIO05] FROM [sirecacobros].[dbo].[conveniocreditos] as con
WHERE con.REGPATR=replace(rale.REGPATR,''-'','''') and con.NUMCRED=rale.NUMCRED and con.TD=rale.TD
)
order by regpatr
')
end
end
">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:Parameter DefaultValue="05" Name="?" />
                                                                <asp:ControlParameter ControlID="TBRegpat" DefaultValue="%" Name="?" 
                                                                    PropertyName="Text" />
                                                                <asp:ControlParameter ControlID="DDLTEco" DefaultValue="COP" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep runat="server" Title="2)EN PROCESO">
                                                        <asp:Button ID="Button4" runat="server" BackColor="#F8EFD2" 
                                                            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" Text="Actualizar" />
                                                        <asp:GridView ID="GridView1Convenios" runat="server" AllowSorting="True" 
                                                            AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="1" CellSpacing="1" 
                                                            DataSourceID="SqlDataSourceConvenios" CaptionAlign="Left">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" title="Observacion" rel="gb_page_fs[]" runat="server" 
                                                                            NavigateUrl='<%# "actualizar05.aspx?id=" & Eval("id") & "&subdel=" & Eval("subdel") %>' 
                                                                            Text="Actualizar" Target="_blank"></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="FEC_REGISTRO" DataFormatString="{0:d}" 
                                                                    HeaderText="REGISTRO" SortExpression="FEC_REGISTRO" />
                                                                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                                                    SortExpression="SUBDEL" />
                                                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                                                                <asp:BoundField DataField="TIPO_PROCE" HeaderText="CONVENIO" 
                                                                    SortExpression="TIPO_PROCE" />
                                                                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                                                                    SortExpression="REGPAT" />
                                                                <asp:BoundField DataField="SOLICITUD" HeaderText="SOLICITUD" 
                                                                    SortExpression="SOLICITUD" />
                                                                <asp:BoundField DataField="FEC_SOLICITUD" HeaderText="FEC_SOLICITUD" 
                                                                    SortExpression="FEC_SOLICITUD" Visible="False" />
                                                                <asp:BoundField DataField="IFE" HeaderText="IFE" SortExpression="IFE" />
                                                                <asp:BoundField DataField="FEC_IFE" HeaderText="FEC_IFE" 
                                                                    SortExpression="FEC_IFE" Visible="False" />
                                                                <asp:BoundField DataField="ACTA_CONSTITUTIVA" HeaderText="ACTA_CONSTITUTIVA" 
                                                                    SortExpression="ACTA_CONSTITUTIVA" />
                                                                <asp:BoundField DataField="FEC_ACT_CONST" HeaderText="FEC_ACT_CONST" 
                                                                    SortExpression="FEC_ACT_CONST" Visible="False" />
                                                                <asp:BoundField DataField="GARANTIA" HeaderText="GARANTIA" 
                                                                    SortExpression="GARANTIA" />
                                                                <asp:BoundField DataField="FEC_GARANTIA" HeaderText="FEC_GARANTIA" 
                                                                    SortExpression="FEC_GARANTIA" Visible="False" />
                                                                <asp:BoundField DataField="EVALUO" HeaderText="EVALUO" 
                                                                    SortExpression="EVALUO" />
                                                                <asp:BoundField DataField="FEC_EVALUO" HeaderText="FEC_EVALUO" 
                                                                    SortExpression="FEC_EVALUO" Visible="False" />
                                                                <asp:BoundField DataField="ADEUDO_TOTAL" DataFormatString="{0:C}" 
                                                                    HeaderText="ADEUDO TOTAL" SortExpression="ADEUDO_TOTAL">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PAGO_INICIAL_20_2" DataFormatString="{0:C}" 
                                                                    HeaderText="PAGO_INICIAL" SortExpression="PAGO_INICIAL_20_2">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="FEC_PAG_INI" HeaderText="FEC_PAG_INI" 
                                                                    SortExpression="FEC_PAG_INI" Visible="False" />
                                                                <asp:BoundField DataField="PAGO_MULTAS_10" DataFormatString="{0:C}" 
                                                                    HeaderText="PAGO_MULTAS_10" SortExpression="PAGO_MULTAS_10">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="FEC_PAG_MUL" HeaderText="FEC_PAG_MUL" 
                                                                    SortExpression="FEC_PAG_MUL" Visible="False" />
                                                            </Columns>
                                                            <HeaderStyle BackColor="#BCC7D8" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSourceConvenios" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                            
                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
                                                            SelectCommand="SELECT
 FECH_SYSTEM as FEC_REGISTRO
 ,[SUBDEL]
 ,[TIPO]
 ,[TIPO_PROCE]
 ,ID_CONVENIO05 as id
 ,substring(ID_CONVENIO05,len(ID_CONVENIO05)-9,len(ID_CONVENIO05)) as REGPAT
 ,[SOLICITUD]
 ,[FEC_SOLICITUD]
 ,[IFE]
 ,[FEC_IFE]
 ,[ACTA_CONSTITUTIVA]
 ,[FEC_ACT_CONST]
 ,[GARANTIA]
 ,[FEC_GARANTIA]
 ,[EVALUO]
 ,[FEC_EVALUO]
 ,[PAGO_INICIAL_20_2]
 ,[FEC_PAG_INI]
 ,[PAGO_MULTAS_10]
 ,[FEC_PAG_MUL]   
,[ADEUDO_TOTAL]   
  FROM [sirecacobros].[dbo].[convenio05]
  WHERE SUBDEL=?
and ([SOLICITUD] in ('NO') or [IFE] in ('NO') or [ACTA_CONSTITUTIVA] in ('NO') or [GARANTIA] in ('NO') or [EVALUO] in ('NO') or [PAGO_INICIAL_20_2] in ('0') or [PAGO_MULTAS_10] in ('0') or [ADEUDO_TOTAL] in ('0'))
ORDER BY FECH_SYSTEM  DESC">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep runat="server" Title="3)EN CONVENIO">
                                                        <asp:Button ID="Button3" runat="server" BackColor="#F8EFD2" 
                                                            BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" Text="Actualizar" />
                                                        <asp:GridView ID="GridView1Convenios0" runat="server" AllowSorting="True" 
                                                            AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="1" CellSpacing="1" 
                                                            DataSourceID="SqlDataSourceConvenios6" CaptionAlign="Left">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" title="Observacion" rel="gb_page_fs[]" runat="server" 
                                                                            NavigateUrl='<%# "agregarpagoconvenio52.aspx?id=" & Eval("id") & "&subdel=" & Eval("subdel") %>' 
                                                                            Text="agregar Pago" Target="_blank"></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="FEC_REGISTRO" DataFormatString="{0:d}" 
                                                                    HeaderText="ALTA" SortExpression="FEC_REGISTRO" />
                                                                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                                                                    SortExpression="SUBDEL" />
                                                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                                                                <asp:BoundField DataField="TIPO_PROCE" HeaderText="TIPO DE CONVENIO" 
                                                                    SortExpression="TIPO_PROCE" Visible="False" />
                                                                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                                                                    SortExpression="REGPAT" />
                                                                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                                                                    HeaderText="CREDITOS" SortExpression="CREDITOS" >
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="OTROS ADEUDOS" SortExpression="REGPAT">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("REGPAT") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>                                                                        
                                                                        <asp:HiddenField ID="HFRegpat" runat="server" Value='<%# Bind("REGPAT") %>' />
                                                                        <asp:GridView ID="GridViewOA" runat="server" AllowSorting="True" 
                                                                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                                                                            DataSourceID="SqlDataSourceOA" Font-Size="5pt">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                                                                                    SortExpression="TIPO" />
                                                                                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                                                                    SortExpression="PERIODO" />
                                                                                <asp:BoundField DataField="NUMCRED" HeaderText="NUMCRED" ReadOnly="True" 
                                                                                    SortExpression="NUMCRED" />
                                                                                <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                                                                                    SortExpression="MOV" />
                                                                                <asp:BoundField DataField="FMOV" HeaderText="FMOV" ReadOnly="True" 
                                                                                    SortExpression="FMOV" />
                                                                                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                                                                                    SortExpression="TD" />
                                                                                <asp:BoundField DataField="FALTA" HeaderText="FALTA" ReadOnly="True" 
                                                                                    SortExpression="FALTA" />
                                                                                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                                                                                    SortExpression="INC" />
                                                                                <asp:BoundField DataField="FEINC" HeaderText="FEINC" ReadOnly="True" 
                                                                                    SortExpression="FEINC" />
                                                                            </Columns>
                                                                            <HeaderStyle BackColor="#FFF3CD" />
                                                                        </asp:GridView>
                                                                        <asp:SqlDataSource ID="SqlDataSourceOA" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(50)
DECLARE @RALERCV as VARCHAR(50)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(12)
SET @SUBDEL=?
SET @REGPAT=?
SET @RALECOP=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

EXEC('
SELECT ''COP'' AS TIPO,((CASE WHEN LEN(MONTH(PERIODO))=1 THEN ''0''+CONVERT(VARCHAR(2),MONTH(PERIODO)) ELSE CONVERT(VARCHAR(2),MONTH(PERIODO)) END)+''/''+CONVERT(VARCHAR(4),YEAR(PERIODO))) AS PERIODO,[NUMCRED],MOV,[FMOV],TD,[FALTA],INC,[FEINC] FROM RALE.DBO.['+@RALECOP+'] AS RALE 
WHERE REPLACE(REGPATR,''-'','''')='''+@REGPAT+'''
AND INC IN (''09'',''31'',''32'',''43'',''05'')
AND NOT EXISTS(
SELECT CC.[REGPATR],CC.[NUMCRED] FROM [sirecacobros].[dbo].[conveniocreditos] AS CC 
WHERE CC.[REGPATR]=REPLACE(RALE.REGPATR,''-'','''') AND CC.[NUMCRED]=RALE.[NUMCRED]
)
UNION ALL
SELECT ''RCV'' AS TIPO,((CASE WHEN LEN(MONTH(PERIODO))=1 THEN ''0''+CONVERT(VARCHAR(2),MONTH(PERIODO)) ELSE CONVERT(VARCHAR(2),MONTH(PERIODO)) END)+''/''+CONVERT(VARCHAR(4),YEAR(PERIODO))) AS PERIODO,[NUMCRED],MOV,[FMOV],TD,[FALTA],INC,[FEINC] FROM RALE.DBO.['+@RALERCV+'] AS RALE 
WHERE REPLACE(REGPATR,''-'','''')='''+@REGPAT+'''
AND INC IN (''09'',''31'',''32'',''43'',''05'')
AND NOT EXISTS(
SELECT CC.[REGPATR],CC.[NUMCRED] FROM [sirecacobros].[dbo].[conveniocreditos] AS CC 
WHERE CC.[REGPATR]=REPLACE(RALE.REGPATR,''-'','''') AND CC.[NUMCRED]=RALE.[NUMCRED]
)
')
">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                    PropertyName="SelectedValue" />
                                                                                <asp:ControlParameter ControlID="HFRegpat" DefaultValue="000000000" Name="?" 
                                                                                    PropertyName="Value" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="PAGO_INICIAL_20_2" HeaderText="PAGO_INICIAL" 
                                                                    SortExpression="PAGO_INICIAL_20_2" DataFormatString="{0:C}" >
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PAGO_MULTAS_10" DataFormatString="{0:C}" 
                                                                    HeaderText="PAGO_MULTAS" SortExpression="PAGO_MULTAS_10">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ADEUDO" DataFormatString="{0:C}" HeaderText="ADEUDO" 
                                                                    SortExpression="ADEUDO">
                                                                <HeaderStyle BackColor="#CC6600" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                                                                    SortExpression="PAGO">
                                                                <HeaderStyle BackColor="#CC6600" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="DIFERENCIA" DataFormatString="{0:C}" 
                                                                    HeaderText="DIFERENCIA" SortExpression="DIFERENCIA">
                                                                <HeaderStyle BackColor="#CC6600" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PAGOS_PENDIENTES" HeaderText="PAGOS PENDIENTES" 
                                                                    SortExpression="PAGOS_PENDIENTES">
                                                                <HeaderStyle BackColor="#339933" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PAGADOS" HeaderText="PAGADOS" 
                                                                    SortExpression="PAGADOS">
                                                                <HeaderStyle BorderColor="#339933" BackColor="#339933" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                            <HeaderStyle BackColor="#BCC7D8" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSourceConvenios6" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                                                            
                                                            
                                                            
                                                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT
 FECH_SYSTEM as FEC_REGISTRO
 ,[SUBDEL]
 ,[TIPO]
 ,[TIPO_PROCE]
 ,ID_CONVENIO05 as id
 ,substring(ID_CONVENIO05,len(ID_CONVENIO05)-9,len(ID_CONVENIO05)) as REGPAT
,(select count(*) from sirecacobros.dbo.conveniocreditos as cc where cc.ID_CONVENIO05=c05.ID_CONVENIO05 and cc.subdel=c05.subdel ) as CREDITOS
,ADEUDO_TOTAL as ADEUDO
,(select case when sum(cc.importe) is null then 0 else sum(cc.importe) end from sirecacobros.dbo.convenio52 as cc where cc.ID_CONVENIO05=c05.ID_CONVENIO05 and cc.subdel=c05.subdel) as PAGO
,((select case when sum(cc.importe) is null then 0 else sum(cc.importe) end from sirecacobros.dbo.convenio52 as cc where cc.ID_CONVENIO05=c05.ID_CONVENIO05 and cc.subdel=c05.subdel)-ADEUDO_TOTAL) as DIFERENCIA
,(select COUNT(*) from sirecacobros.dbo.convenio52 as cc where cc.ID_CONVENIO05=c05.ID_CONVENIO05 and cc.subdel=c05.subdel and importe in ('0')) as PAGOS_PENDIENTES
,(select COUNT(*) from sirecacobros.dbo.convenio52 as cc where cc.ID_CONVENIO05=c05.ID_CONVENIO05 and cc.subdel=c05.subdel and importe not in ('0')) as PAGADOS
 ,[SOLICITUD]
 ,[FEC_SOLICITUD]
 ,[IFE]
 ,[FEC_IFE]
 ,[ACTA_CONSTITUTIVA]
 ,[FEC_ACT_CONST]
 ,[GARANTIA]
 ,[FEC_GARANTIA]
 ,[EVALUO]
 ,[FEC_EVALUO]
 ,[PAGO_INICIAL_20_2]
 ,[FEC_PAG_INI]
 ,[PAGO_MULTAS_10]
 ,[FEC_PAG_MUL]      
  FROM [sirecacobros].[dbo].[convenio05] as c05
WHERE SUBDEL=?
and [SOLICITUD] in ('SI') 
and [IFE] in ('SI') 
and [ACTA_CONSTITUTIVA] in ('SI') 
and [GARANTIA] in ('SI') 
and [EVALUO] in ('SI') 
and [PAGO_INICIAL_20_2] not in ('0') 
and [PAGO_MULTAS_10] not in ('0')
and [ADEUDO_TOTAL] not in ('0')
ORDER BY FECH_SYSTEM DESC
">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </asp:WizardStep>
                                                </WizardSteps>
                                            </asp:Wizard>
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

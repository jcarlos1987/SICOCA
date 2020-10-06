<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="documentos.aspx.vb" Inherits="WebSIRECA.documentos" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../css/sireca.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style12
        {
            width: 130px;
        }
        .style14
        {
            width: 260px;
        }
        .style18
        {
            width: 164px;
        }
        .style22
        {
            width: 453px;
        }
        .style26
        {
            width: 126px;
        }
        .style28
        {
            width: 141px;
        }
        .style29
        {
            width: 20px;
        }
        .style30
        {
            width: 140px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" >
        </asp:ScriptManager>
    
    </div>
    <table style="width:100%;" border="0" cellpadding="4" cellspacing="0">
        <tr>
            <td class="style12" bgcolor="#DEE1E7">
    
        <asp:Label ID="Label3" runat="server" Text="SUBDELEGACION"></asp:Label>
            </td>
            <td class="style14" bgcolor="#DEE1E7">
    
        <asp:DropDownList ID="DDLSubdel" runat="server">
        </asp:DropDownList>
    
            </td>
            <td class="style11" bgcolor="#DEE1E7" align="left" rowspan="3">
                
                <table border="1" class="style22" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="style18" align="center">
                            TIPO DE DOCUMENTO</td>
                        <td class="style26" align="center">
                            <asp:Label ID="Label4" runat="server" Text="PERSONA"></asp:Label>
                        </td>
                        <td class="style28" align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="style18">
                            <asp:DropDownList ID="DDLDoc" runat="server">
                                <asp:ListItem Value="CITATORIO_PAE">CITATORIO PAE</asp:ListItem>
                                <asp:ListItem>MANDAMIENTO</asp:ListItem>
                                <asp:ListItem>AMPLIACION</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style26" align="center">
                            <asp:RadioButtonList ID="RBPersona" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">FISICA</asp:ListItem>
                                <asp:ListItem>MORAL</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="style28" align="center">
                            <asp:ImageButton ID="IBImprimir" runat="server" 
                                ImageUrl="~/imagenes/imprimir1.jpg" 
                                ToolTip="IMPRIMIR DOCUMENTO DE PERSONA MORAL" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style18">
                            &nbsp;</td>
                        <td class="style26">
                            &nbsp;</td>
                        <td class="style28">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                <asp:Panel ID="PanelHeadRale" runat="server" BorderColor="#293955" BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">       
                    <table style="width:100%;">
                        <tr>
                            <td class="style29">
                                <asp:Image ID="ImageRale" runat="server" AlternateText="Ocultar" 
                                    ImageAlign="AbsMiddle" ImageUrl="~/imagenes/expand_blue.jpg" Width="20px" />
                            </td>
                            <td class="style30" >
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="12pt" 
                                    Text="R.A.L.E. C.O.P. del "></asp:Label>
                            </td>
                            <td>
                                <asp:FormView ID="FormViewFechRaleCop" runat="server" 
                                    DataSourceID="SqlDataSourceFechRaleCop" Font-Size="12pt">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("RALE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSourceFechRaleCop" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALE as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @RALE=(select top 1 convert(nvarchar(10),fecha,103) from rale.dbo.tablas where subdel=@SUBDEL and tipo=@TIPO_COP_RCV order by fecha desc)
SELECT @RALE as RALE
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:Parameter DefaultValue="COP" Name="?" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</asp:Panel>
<asp:Panel ID="PanelContendRale" runat="server">
    <asp:UpdateProgress ID="UpdateProgressRaleCop" runat="server" 
        AssociatedUpdatePanelID="UpdatePanelRaleCop" DisplayAfter="50">
        <ProgressTemplate>
            <asp:Panel ID="Panel2" runat="server" BackColor="#E8AA35" 
                HorizontalAlign="Center">
                <asp:Label ID="Label9" runat="server" Text="CARGANDO..." Font-Bold="True"></asp:Label>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanelRaleCop" runat="server" UpdateMode="Conditional">
    <ContentTemplate >
    
    <asp:GridView ID="GridViewRaleCop" runat="server" 
        DataSourceID="SqlDataSourceRaleCop" AllowSorting="True" 
        AutoGenerateColumns="False" HorizontalAlign="Center" ShowFooter="True" 
            Font-Size="10pt">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO" />
            <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" ReadOnly="True" 
                SortExpression="REGPATR" />
            <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                SortExpression="MOV">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_MOV" HeaderText="FECHA_MOV" ReadOnly="True" 
                SortExpression="FECHA_MOV" />
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" />
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_ALTA" HeaderText="FECHA_ALTA" ReadOnly="True" 
                SortExpression="FECHA_ALTA" />
            <asp:BoundField DataField="FECHA_NOTIFICACION" HeaderText="FECHA_NOTIFICACION" 
                ReadOnly="True" SortExpression="FECHA_NOTIFICACION" />
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO_ORD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                SortExpression="INC" >
            <ItemStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_INC" HeaderText="FECHA_INC" ReadOnly="True" 
                SortExpression="FECHA_INC" />
            <asp:BoundField DataField="DIAS" DataFormatString="{0:N0}" HeaderText="DIAS" 
                ReadOnly="True" SortExpression="DIAS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DC" HeaderText="DC" ReadOnly="True" 
                SortExpression="DC" />
            <asp:BoundField DataField="SC" HeaderText="SC" ReadOnly="True" 
                SortExpression="SC" />
        </Columns>
        <HeaderStyle BackColor="#DEE1E7" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRaleCop" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALE as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(20)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @REGPAT=substring(replace(?,'-',''),1,10)
SET @TIPO_COP_RCV=?
SET @RALE=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo=@TIPO_COP_RCV order by fecha desc)

exec('
select 
'''+@TIPO_COP_RCV+''' as TIPO
,REGPATR
,MOV
,FMOV AS FECHA_MOV
,SECTOR
,NUMCRED AS CREDITO
,TD
,FALTA AS FECHA_ALTA
,FNOTIFICACION AS FECHA_NOTIFICACION
,(select ''(''+incr.inc + '')'' + incr.descripcion from sireca.dbo.inc_rale as incr where incr.inc=rale.INC) as INC
,FeINC AS FECHA_INC
,DIAS
,IMPORTE
,DC
,SC
,substring(PERIODO,4,7) as PERIODO
,convert(datetime,periodo,103) as PERIODO_ORD
from [rale].[dbo].['+@RALE+'] as rale
where replace(REGPATR,''-'','''')='''+@REGPAT+'''
order by convert(datetime,periodo,103)
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBRegPat" DefaultValue="REGPAT" Name="?" 
                PropertyName="Text" />
            <asp:Parameter DefaultValue="COP" Name="?" />
        </SelectParameters>
    </asp:SqlDataSource>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendRale" 
            CollapseControlID="PanelHeadRale" ExpandControlID="PanelHeadRale" 
            SuppressPostBack="True" ImageControlID="ImageRale" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
</asp:CollapsiblePanelExtender>
<asp:Panel ID="PanelHeadRaleRcv" runat="server" BorderColor="#293955" BorderStyle="Dashed" BorderWidth="1px" CssClass="accordionHeader">       
                    <table style="width:100%;">
                        <tr>
                            <td class="style29">
                                <asp:Image ID="ImageRaleRcv" runat="server" AlternateText="Ocultar" 
                                    ImageAlign="AbsMiddle" ImageUrl="~/imagenes/expand_blue.jpg" Width="20px" />
                            </td>
                            <td class="style30" >
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="12pt" 
                                    Text="R.A.L.E. R.C.V. del "></asp:Label>
                            </td>
                            <td>
                                <asp:FormView ID="FormViewFechRaleRcv" runat="server" 
                                    DataSourceID="SqlDataSourceFechRaleRcv" Font-Size="12pt">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("RALE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSourceFechRaleRcv" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALE as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @TIPO_COP_RCV=?
SET @RALE=(select top 1 convert(nvarchar(10),fecha,103) from rale.dbo.tablas where subdel=@SUBDEL and tipo=@TIPO_COP_RCV order by fecha desc)
SELECT @RALE as RALE
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:Parameter DefaultValue="RCV" Name="?" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</asp:Panel>
<asp:Panel ID="PanelContendRaleRcv" runat="server">
    <asp:UpdateProgress ID="UpdateProgressRaleRcv" runat="server" 
        AssociatedUpdatePanelID="UpdatePanelRaleRcv" DisplayAfter="50">
        <ProgressTemplate>
            <asp:Panel ID="Panel22" runat="server" BackColor="#E8AA35" 
                HorizontalAlign="Center">
                <asp:Label ID="Label99" runat="server" Text="CARGANDO..." Font-Bold="True"></asp:Label>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanelRaleRcv" runat="server" UpdateMode="Conditional">
    <ContentTemplate >
    
    <asp:GridView ID="GridViewRaleRcv" runat="server" 
        DataSourceID="SqlDataSourceRaleRcv" AllowSorting="True" 
        AutoGenerateColumns="False" HorizontalAlign="Center" ShowFooter="True" 
            Font-Size="10pt">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                SortExpression="TIPO" />
            <asp:BoundField DataField="REGPATR" HeaderText="REGPATR" ReadOnly="True" 
                SortExpression="REGPATR" />
            <asp:BoundField DataField="MOV" HeaderText="MOV" ReadOnly="True" 
                SortExpression="MOV">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_MOV" HeaderText="FECHA_MOV" ReadOnly="True" 
                SortExpression="FECHA_MOV" />
            <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                SortExpression="SECTOR">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" />
            <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                SortExpression="TD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_ALTA" HeaderText="FECHA_ALTA" ReadOnly="True" 
                SortExpression="FECHA_ALTA" />
            <asp:BoundField DataField="FECHA_NOTIFICACION" HeaderText="FECHA_NOTIFICACION" 
                ReadOnly="True" SortExpression="FECHA_NOTIFICACION" />
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO_ORD">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                SortExpression="INC" >
            <ItemStyle Font-Bold="True" Font-Italic="False" />
            </asp:BoundField>
            <asp:BoundField DataField="FECHA_INC" HeaderText="FECHA_INC" ReadOnly="True" 
                SortExpression="FECHA_INC" />
            <asp:BoundField DataField="DIAS" DataFormatString="{0:N0}" HeaderText="DIAS" 
                ReadOnly="True" SortExpression="DIAS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DC" HeaderText="DC" ReadOnly="True" 
                SortExpression="DC" />
            <asp:BoundField DataField="SC" HeaderText="SC" ReadOnly="True" 
                SortExpression="SC" />
        </Columns>
        <HeaderStyle BackColor="#DEE1E7" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceRaleRcv" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALE as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @REGPAT as VARCHAR(20)
DECLARE @TIPO_COP_RCV as VARCHAR(6)
SET @SUBDEL=?
SET @REGPAT=substring(replace(?,'-',''),1,10)
SET @TIPO_COP_RCV=?
SET @RALE=(select top 1 [name] from rale.dbo.tablas where subdel=@SUBDEL and tipo=@TIPO_COP_RCV order by fecha desc)

exec('
select 
'''+@TIPO_COP_RCV+''' as TIPO
,REGPATR
,MOV
,FMOV AS FECHA_MOV
,SECTOR
,NUMCRED AS CREDITO
,TD
,FALTA AS FECHA_ALTA
,FNOTIFICACION AS FECHA_NOTIFICACION
,(select ''(''+incr.inc + '')'' + incr.descripcion from sireca.dbo.inc_rale as incr where incr.inc=rale.INC) as INC
,FeINC AS FECHA_INC
,DIAS
,IMPORTE
,DC
,SC
,substring(PERIODO,4,7) as PERIODO
,convert(datetime,periodo,103) as PERIODO_ORD
from [rale].[dbo].['+@RALE+'] as rale
where replace(REGPATR,''-'','''')='''+@REGPAT+'''
order by convert(datetime,periodo,103)
')
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TBRegPat" DefaultValue="REGPAT" Name="?" 
                PropertyName="Text" />
            <asp:Parameter DefaultValue="RCV" Name="?" />
        </SelectParameters>
    </asp:SqlDataSource>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender6" runat="server" 
            CollapsedImage="~/imagenes/collapse_blue.jpg" 
            ExpandedImage="~/imagenes/expand_blue.jpg" TargetControlID="PanelContendRaleRcv" 
            CollapseControlID="PanelHeadRaleRcv" ExpandControlID="PanelHeadRaleRcv" 
            SuppressPostBack="True" ImageControlID="ImageRaleRcv" CollapsedText="Desplegar" 
            ExpandedText="Ocultar">
</asp:CollapsiblePanelExtender>


                </td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style14" >
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
        </tr>
        </table>
    </form>
</body>
</html>

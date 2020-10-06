<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo2.Master" CodeBehind="concentrado.aspx.vb" Inherits="WebSIRECA.concentrado" %>
<asp:Content ID ="contend" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="SUBDELEGACION:"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="AÑO:"></asp:Label>
        <asp:DropDownList ID="DDLAnio" runat="server" AutoPostBack="True">
            <asp:ListItem>2013</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="MES:"></asp:Label>
        <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True">
            <asp:ListItem Value="01">ENERO</asp:ListItem>
            <asp:ListItem Value="02">FEBRERO</asp:ListItem>
            <asp:ListItem Value="03">MARZO</asp:ListItem>
            <asp:ListItem Value="04">ABRIL</asp:ListItem>
            <asp:ListItem Value="05">MAYO</asp:ListItem>
            <asp:ListItem Value="06">JUNIO</asp:ListItem>
            <asp:ListItem Value="07">JULIO</asp:ListItem>
            <asp:ListItem Value="08">AGOSTO</asp:ListItem>
            <asp:ListItem Value="09">SEPTIEMBRE</asp:ListItem>
            <asp:ListItem Value="10">OCTUBRE</asp:ListItem>
            <asp:ListItem Value="11">NOVIEMBRE</asp:ListItem>
            <asp:ListItem Value="12">DICIEMBRE</asp:ListItem>
        </asp:DropDownList>
    <hr />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="Carga y/o Asignación del Mes" 
            CellPadding="3" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--Carga y/o Asignación del Mes
SELECT  (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE) as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="EMBARGOS" CellPadding="3" 
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--EMBARGOS
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (8,9,10,11,12,13)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="RECAUDACION" CellPadding="3" 
            DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--RECAUDACION
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (3,4,5,6,7)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="NO LOCALIZADOS" CellPadding="3" 
            DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--NO LOCALIZADOS
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (22)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="INPEDIMIENTO DE COBRO" CellPadding="3" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--INPEDIMIENTO DE COBRO
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (18,19,20)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView6" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="CONVENIO" CellPadding="3" 
            DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--CONVENIO
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (16,17)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView7" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="PARA REASIGNAR" CellPadding="3" 
            DataSourceID="SqlDataSource7">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--PARA REASIGNAR
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (21)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView8" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="DEVUELTO SIN TRAMITAR" 
            CellPadding="3" DataSourceID="SqlDataSource8">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--DEVUELTO SIN TRAMITAR
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (23)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView9" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="REMOSION DE DEPOSITARIO" 
            CellPadding="3" DataSourceID="SqlDataSource9">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--REMOSION DE DEPOSITARIO
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (14)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView10" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="AMPLIACION DE EMBARGO" 
            CellPadding="3" DataSourceID="SqlDataSource10">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--AMPLIACION DE EMBARGO
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (15)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView11" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="SIN NOTIFICAR" CellPadding="3" 
            DataSourceID="SqlDataSource11">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--SIN NOTIFICAR
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (2)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView12" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Caption="NOTIFICADO" CellPadding="3" 
            DataSourceID="SqlDataSource12">
            <Columns>
                <asp:BoundField DataField="INSPECTOR" HeaderText="EJECUTOR" 
                    SortExpression="INSPECTOR" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" DataFormatString="{0:N0}" 
                    HeaderText="NUMCREDS" ReadOnly="True" SortExpression="NUMCREDS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
DECLARE @SUBDEL VARCHAR(5)
SET @ANIO = ?
SET @MES = ?
SET @SUBDEL = ?
--NOTIFICADO
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE)  as INSPECTOR
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where YEAR([FECH_ASIG])=@ANIO and MONTH([FECH_ASIG])=@MES 
and [RESULTADO_DE_LA_DILIGENCIA_id_descrip] in (1)
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

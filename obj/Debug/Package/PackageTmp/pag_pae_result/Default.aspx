<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default11" %>
<asp:Content ID ="contend" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="SUBDELEGACION:"></asp:Label>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>&nbsp;
        <asp:Label ID="Label2" runat="server" Text="AÑO:"></asp:Label>
        <asp:DropDownList ID="DDLAnio" runat="server" AutoPostBack="True">
            <asp:ListItem>2013</asp:ListItem>
        </asp:DropDownList>&nbsp;
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="Carga y/o Asignación del Mes" CellPadding="3" 
            DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ID_RESPONSABLE" HeaderText="EJECUTOR" 
                    SortExpression="ID_RESPONSABLE" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="NUMCREDS" HeaderText="NUMCREDS" ReadOnly="True" 
                    SortExpression="NUMCREDS" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
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
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT  (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=cae.ID_RESPONSABLE) as ID_RESPONSABLE
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES 
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae
where subdel in (?) and YEAR([FECH_ASIG])=? and MONTH([FECH_ASIG])=?
group by [ID_RESPONSABLE]
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="Diligenciados en el Mes" CellPadding="3" 
            DataSourceID="SqlDataSource2" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ID_RESPONSABLE" HeaderText="EJECUTOR" 
                    SortExpression="ID_RESPONSABLE" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="NUMCREDS" HeaderText="NUMCREDS" ReadOnly="True" 
                    SortExpression="NUMCREDS" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
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
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--Diligenciados en el Mes
SELECT  (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE) as ID_RESPONSABLE
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where FECHA_DE_LA_DILIGENCIA is not null
and subdel in (?) and YEAR([FECH_ASIG])=? and MONTH([FECH_ASIG])=?
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="Pendientes en el Mes" CellPadding="3" 
            DataSourceID="SqlDataSource3" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ID_RESPONSABLE" HeaderText="EJECUTOR" 
                    SortExpression="ID_RESPONSABLE" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="NUMCREDS" HeaderText="NUMCREDS" ReadOnly="True" 
                    SortExpression="NUMCREDS" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
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
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="--Pendientes en el Mes
SELECT (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=ID_RESPONSABLE) as ID_RESPONSABLE
,count(distinct(REGPATR)) as PATRONES
,'' as COTIZANTES
,COUNT(NUMCRED) as NUMCREDS
,SUM(ADEUDO) as IMPORTE
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where FECHA_DE_LA_DILIGENCIA is null
and subdel in (?) and YEAR([FECH_ASIG])=? and MONTH([FECH_ASIG])=?
group by [ID_RESPONSABLE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            Caption="Efectividad del Mes" CellPadding="3" 
            DataSourceID="SqlDataSource4" AutoGenerateColumns="False" 
            AllowSorting="True">
<Columns>
                <asp:BoundField DataField="ID_RESPONSABLE" HeaderText="EJECUTOR" 
                    SortExpression="ID_RESPONSABLE" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" DataFormatString="{0:P}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NUMCREDS" HeaderText="NUMCREDS" ReadOnly="True" 
                    SortExpression="NUMCREDS" DataFormatString="{0:P}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:P}" >
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
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(5)
DECLARE @ANIO VARCHAR(5)
DECLARE @MES VARCHAR(5)
SET @SUBDEL = ?
SET @ANIO = ?
SET @MES = ?
--Efectividad del Mes
SELECT  (select fc.nombre from fiscamovil.dbo.usuarios as fc where fc.[id]=cae.ID_RESPONSABLE) as ID_RESPONSABLE
,((convert(float,(SELECT count(distinct(cae2.REGPATR))
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae2
where cae2.ID_RESPONSABLE = cae.ID_RESPONSABLE 
and cae2.FECHA_DE_LA_DILIGENCIA is not null
and YEAR(cae2.[FECH_ASIG])=@ANIO and MONTH(cae2.[FECH_ASIG])=@MES
and cae2.subdel in (@SUBDEL)
))
/
convert(float,(SELECT count(distinct(cae2.REGPATR))
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae2
where  cae2.ID_RESPONSABLE = cae.ID_RESPONSABLE 
and YEAR(cae2.[FECH_ASIG])=@ANIO and MONTH(cae2.[FECH_ASIG])=@MES
and cae2.subdel in (@SUBDEL)
)))) as PATRONES

,((convert(float,(SELECT count(cae2.NUMCRED)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae2
where cae2.ID_RESPONSABLE = cae.ID_RESPONSABLE 
and cae2.FECHA_DE_LA_DILIGENCIA is not null
and YEAR(cae2.[FECH_ASIG])=@ANIO and MONTH(cae2.[FECH_ASIG])=@MES
and cae2.subdel in (@SUBDEL)
))
/
convert(float,(SELECT count(cae2.NUMCRED)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae2
where  cae2.ID_RESPONSABLE = cae.ID_RESPONSABLE 
and YEAR(cae2.[FECH_ASIG])=@ANIO and MONTH(cae2.[FECH_ASIG])=@MES
and cae2.subdel in (@SUBDEL)
)))) as NUMCREDS

,(((SELECT SUM(cae2.ADEUDO)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae2
where cae2.ID_RESPONSABLE = cae.ID_RESPONSABLE 
and cae2.FECHA_DE_LA_DILIGENCIA is not null
and YEAR(cae2.[FECH_ASIG])=@ANIO and MONTH(cae2.[FECH_ASIG])=@MES
and cae2.subdel in (@SUBDEL)
)
/
(SELECT SUM(cae2.ADEUDO)
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae2
where  cae2.ID_RESPONSABLE = cae.ID_RESPONSABLE 
and YEAR(cae2.[FECH_ASIG])=@ANIO and MONTH(cae2.[FECH_ASIG])=@MES
and cae2.subdel in (@SUBDEL)
))) as IMPORTE

FROM [sirecacobros].[dbo].[ecoTiposHistorial] as cae
where YEAR(cae.[FECH_ASIG])=@ANIO and MONTH(cae.[FECH_ASIG])=@MES
and subdel in (@SUBDEL)
group by [ID_RESPONSABLE]
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
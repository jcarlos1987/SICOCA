<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="bajas251.aspx.vb" Inherits="WebSIRECA.bajas251" %>

<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >   
<center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="180px">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLBaRest" runat="server" AutoPostBack="True" Width="180px">
        <asp:ListItem Value="2">BAJAS</asp:ListItem>
        <asp:ListItem Value="3">RESTABLECIMIENTOS</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
 DEL:
</span> 
    <asp:DropDownList ID="DDLAnio" runat="server" AutoPostBack="True" Width="100px">
    </asp:DropDownList>
</div>
</center>
        <asp:GridView ID="GridViewB251" runat="server" AutoGenerateColumns="False" 
            Caption="BAJAS POR 251" DataSourceID="SqlDataSourceB251" 
            HorizontalAlign="Center" EmptyDataText="SIN RESULTADOS" 
        ShowFooter="True" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="MES_BAJA" HeaderText="MES" ReadOnly="True" 
                    SortExpression="MES_BAJA" />
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBPatrones" runat="server" Text ='<%# Eval("PATRONES") %>'>LinkButton</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="IMPORTE_COP" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE C.O.P." ReadOnly="True" SortExpression="IMPORTE_COP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE_RCV" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE R.C.V." ReadOnly="True" SortExpression="IMPORTE_RCV">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CRED_COP" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS C.O.P." ReadOnly="True" SortExpression="CRED_COP">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CRED_RCV" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS R.C.V." ReadOnly="True" SortExpression="CRED_RCV">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField ReadOnly="True">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="RANGO I" SortExpression="RANGO_I">                    
                    <ItemTemplate>
                        <asp:LinkButton ID="LBR1" runat="server"  Text='<%# Eval("RANGO_I", "{0:N0}") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RANGO II" SortExpression="RANGO_II">                    
                    <ItemTemplate>
                        <asp:LinkButton ID="LBR2" runat="server"  Text='<%# Eval("RANGO_II", "{0:N0}") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RANGO III" SortExpression="RANGO_III">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBR3" runat="server"  Text='<%# Eval("RANGO_III", "{0:N0}") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RANGO IV" SortExpression="RANGO_IV">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBR4" runat="server"  Text='<%# Eval("RANGO_IV", "{0:N0}") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RANGO V" SortExpression="RANGO_V">
                    <ItemTemplate>
                    <asp:LinkButton ID="LBR5" runat="server"  Text='<%# Eval("RANGO_V", "{0:N0}") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F0F0F0" Font-Bold="True" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#F0F0F0" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceB251" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ANIO AS VARCHAR(4)
DECLARE @BAJA_REST AS VARCHAR(4)
DECLARE @SALARIO as FLOAT
SET @SUBDEL=?
SET @ANIO=?
SET @BAJA_REST=?
SET @SALARIO=isnull((select salario from sirecaregistros.dbo.br_salario where anio=@ANIO),'0')
SELECT 
'subdel='+@SUBDEL+'&amp;anio='+@ANIO+'&amp;mes='+MES_BAJA+'&amp;barest='+@BAJA_REST+'&amp;rango=' as vurl
,ORDEN,MES_BAJA
,COUNT(PATRONES) AS PATRONES,SUM(IMPORTE_COP) AS IMPORTE_COP,SUM(IMPORTE_RCV) AS IMPORTE_RCV
,SUM(CRED_COP) AS CRED_COP,SUM(CRED_RCV) AS CRED_RCV,SUM(COTIZANTES) AS COTIZANTES
,SUM([I]) AS RANGO_I,SUM([II]) AS RANGO_II,SUM([III]) AS RANGO_III,SUM([IV]) AS RANGO_IV,SUM([V]) AS RANGO_V FROM (
--------------------------------------------------------------------
SELECT 
1 AS FILA
,[SUBDEL]
,ORDEN,MES_BAJA,PATRONES
,SUM(IMPORTE_COP) AS IMPORTE_COP,SUM(IMPORTE_RCV) AS IMPORTE_RCV
,SUM(CRED_COP) AS CRED_COP,SUM(CRED_RCV) AS CRED_RCV,SUM(COTIZANTES) AS COTIZANTES
,(case 
when sum(IMPORTE_COP)&gt;=(25*@SALARIO*365) then 'V'
when sum(IMPORTE_COP)&gt;(4*@SALARIO*365) and sum(IMPORTE_COP)&lt;=(25*@SALARIO*365) then 'IV'
when sum(IMPORTE_COP)&gt;(2*@SALARIO*365) and sum(IMPORTE_COP)&lt;=(4*@SALARIO*365) then 'III'
when sum(IMPORTE_COP)&gt;(@SALARIO*365) and sum(IMPORTE_COP)&lt;=(2*@SALARIO*365) then 'II'
when sum(IMPORTE_COP)&lt;=(@SALARIO*365) then 'I'
end) AS RANGO
FROM (
SELECT 
1 AS FILA
,[SUBDEL]
,month(FMOV) AS ORDEN
,upper(datename(month,FMOV)) AS MES_BAJA
,(REGPATR) AS PATRONES
,(CASE WHEN TIPO='COP' THEN IMPORTE ELSE 0 END) AS IMPORTE_COP
,(CASE WHEN TIPO='RCV' THEN IMPORTE ELSE 0 END) AS IMPORTE_RCV
,(CASE WHEN TIPO='COP' THEN 1 ELSE 0 END) AS CRED_COP
,(CASE WHEN TIPO='RCV' THEN 1 ELSE 0 END) AS CRED_RCV
,(0) AS COTIZANTES
FROM [sirecaregistros].[dbo].[BR_RALE]
WHERE [SUBDEL] like @SUBDEL AND MOV=@BAJA_REST
AND YEAR(FMOV)=@ANIO
) AS RX
GROUP BY [SUBDEL],ORDEN,MES_BAJA,PATRONES
--------------------------------------------------------------------
) AS p PIVOT
(
COUNT(p.FILA)
for [RANGO] in ([I],[II],[III],[IV],[V])
) as pvt
GROUP BY [SUBDEL],ORDEN,MES_BAJA
ORDER BY ORDEN
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="2000" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLBaRest" DefaultValue="2" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="indicadoresdedesempenio.aspx.vb" Inherits="WebSIRECA.indicadoresdedesempenio1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" AutoPostBack="True" Width="100px" CssClass="btn dropdown-toggle btn-small">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label1" runat="server" Text="ASIGNACIONES"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLFecInicio" runat="server" 
        DataSourceID="SqlDataSourceFecha" DataTextField="fecha" 
        DataTextFormatString="{0:d}" DataValueField="fecha" Width="150px">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLFechFin" runat="server" 
        DataSourceID="SqlDataSourceFecha" DataTextField="fecha" 
        DataTextFormatString="{0:d}" DataValueField="fecha" Width="150px">
    </asp:DropDownList>
<span class="add-on">
    <asp:Label ID="Label2" runat="server" Text="PATRONES POR DÍA"></asp:Label>
</span> 
    <asp:DropDownList ID="DDLDia" runat="server" Width="60px">
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
    </asp:DropDownList>
<span class="add-on">
    <asp:LinkButton ID="LBActualizar" runat="server" CssClass="btn">Actualizar</asp:LinkButton>
</span> 
</div> 
</center>
<asp:SqlDataSource ID="SqlDataSourceFecha" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
SET @SUBDEL=?
SELECT fecha FROM (
SELECT 
CONVERT(VARCHAR(10),[CP_FECH_ASIG],103) AS fecha
FROM [sirecacobros].[dbo].[CO_CRED_ASIG]
WHERE [RA_SUBDEL] LIKE @SUBDEL
and year([CP_FECH_ASIG]) in (year(getdate()),year(dateadd(year,-1,getdate())))
GROUP BY CONVERT(VARCHAR(10),[CP_FECH_ASIG],103)
UNION ALL
SELECT CONVERT(VARCHAR(10),[FECH_INS],103) AS fecha
FROM [sirecacobros].[dbo].[PAE_CRED]
WHERE [R_SUBDEL] LIKE @SUBDEL
and year([FECH_INS]) in (year(getdate()),year(dateadd(year,-1,getdate())))
GROUP BY CONVERT(VARCHAR(10),[FECH_INS],103)
) AS RESULTADO
ORDER BY CONVERT(DATETIME,fecha,103) DESC
">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                                PropertyName="SelectedValue" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
        SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @PAT_DAY float
DECLARE @FEC_INI datetime
DECLARE @FEC_FIN datetime
SET @SUBDEL=?
SET @PAT_DAY=?
SET @FEC_INI=?
SET @FEC_FIN=?
SELECT
G2.SUBDEL,G2.ID,G2.NOMBRE
	,CONVERT(VARCHAR(10),G2.[ULTIMA ASIGNACION],103) AS [ULTIMA_ASIGNACION]
	,G2.[DIAS ASIGNADOS] as DIAS_ASIGNADOS
	,G2.[PATRONES ASIGNADOS] as PATRONES_ASIGNADOS
	,G2.[CREDITOS ASIGNADOS] as CREDITOS_ASIGNADOS
	,G2.[CREDITOS ASIGNADOS]/G2.[DIAS ASIGNADOS] AS [CREDITOS_ASIGNADOS_PROMEDIO_AL_DIA]
	,CONVERT(VARCHAR(10),G2.[ULTIMA CAPTURA],103) AS [ULTIMA_CAPTURA]
	,G2.[DIAS CAPTURADOS] as DIAS_CAPTURADOS
	,G2.[PATRONES CAPTURADOS] as [PATRONES_CAPTURADOS]
	,(convert(float,G2.[PATRONES CAPTURADOS])/convert(float,G2.[PATRONES ASIGNADOS])) as PATRONES_P
	,G2.[CREDITOS CAPTURADOS] as CREDITOS_CAPTURADOS
	,(G2.[CREDITOS CAPTURADOS]/convert(float,G2.[CREDITOS ASIGNADOS])) as CREDITOS_P
	,ROUND(G2.[PATRONES CAPTURADOS]/CAST(NULLIF(G2.[DIAS ASIGNADOS],0) AS FLOAT)+0.1,0) AS [CREDITOS_CAPTURADOS_PROMEDIO_AL_DIA]	
	,((G2.[PATRONES CAPTURADOS]/CAST((G2.[DIAS ASIGNADOS]*@PAT_DAY) AS FLOAT))) AS DESEMPENIO
	,(G2.[CREDITOS ASIGNADOS]-G2.[CREDITOS CAPTURADOS]) AS CRED_FALTANTES
	,RA_IMPORTE_T
	,AC_IMPORTE
	,(AC_IMPORTE/RA_IMPORTE_T) AS IMPORTE_P
FROM (
SELECT 
	G1.SUBDEL,
	G1.ID,
	G1.nombre AS NOMBRE,
	max(G1.CP_FECH_ASIG) AS [ULTIMA ASIGNACION],  
	count(DISTINCT convert(varchar(10),G1.CP_FECH_ASIG,103)) AS [DIAS ASIGNADOS],
	count(DISTINCT G1.CP_REGPAT) AS [PATRONES ASIGNADOS],
	count(G1.RA_NUMCRED) AS [CREDITOS ASIGNADOS],
	max(G1.AC_FECH_DILIGENCIA) AS [ULTIMA CAPTURA],
	count(DISTINCT convert(varchar(10),G1.AC_FECH_DILIGENCIA,103)) AS [DIAS CAPTURADOS],
	count(DISTINCT G1.AC_RA_REGPATR) AS [PATRONES CAPTURADOS],
	count(G1.AC_RA_NUMCRED) AS [CREDITOS CAPTURADOS],
	SUM(G1.RA_IMPORTE_T) AS RA_IMPORTE_T,
	SUM(G1.AC_IMPORTE) AS AC_IMPORTE 
FROM (
/*......INICIO CONJUNTO DE DATOS......*/
SELECT * FROM
(
SELECT USERSIRECA.id,USERSIRECA.del,USERSIRECA.subdel,USERS.nombre 
FROM sireca.dbo.usuarios AS USERSIRECA LEFT JOIN fiscamovil.dbo.usuarios AS USERS ON  USERSIRECA.id = USERS.id WHERE USERSIRECA.userPae2='1' and USERSIRECA.subdel like @SUBDEL
) AS EJECUTORES
LEFT JOIN
(
/*PRIMERA BASE*/
	SELECT DISTINCT CP_INSPEC,CP_FECH_ASIG,CP_REGPAT,RA_NUMCRED,max(AC_FECH_DILIGENCIA) as AC_FECH_DILIGENCIA,AC_RA_REGPATR,AC_RA_NUMCRED,RA_IMPORTE as RA_IMPORTE_T,(CASE WHEN AC_RA_NUMCRED IS NOT NULL THEN RA_IMPORTE ELSE 0.0 END) AS AC_IMPORTE
	FROM sirecacobros.dbo.[ASIGNACIONES COBROS] as vt --vista
	WHERE CP_FECH_ASIG BETWEEN @FEC_INI AND @FEC_FIN AND (AC_FECH_DILIGENCIA&gt;=@FEC_INI or AC_FECH_DILIGENCIA is null)
	GROUP BY CP_INSPEC,CP_FECH_ASIG,CP_REGPAT,RA_NUMCRED,AC_RA_REGPATR,AC_RA_NUMCRED,RA_IMPORTE
/*SEGUNDA BASE*/
union all
	SELECT CP_INSPEC,CP_FECH_ASIG,CP_REGPAT,RA_NUMCRED,AC_FECH_DILIGENCIA,(CASE WHEN AC_FECH_DILIGENCIA IS NOT NULL THEN CP_REGPAT ELSE NULL END) AS AC_RA_REGPATR,(CASE WHEN AC_FECH_DILIGENCIA IS NOT NULL THEN RA_NUMCRED ELSE NULL END) AS AC_RA_NUMCRED,RA_IMPORTE_T as RA_IMPORTE_T,(CASE WHEN AC_FECH_DILIGENCIA IS NOT NULL THEN RA_IMPORTE_T ELSE 0.0 END) AS AC_IMPORTE 
	FROM (
		SELECT [ID_INS] AS CP_INSPEC,[FECH_INS] AS CP_FECH_ASIG,[R_REGPATR] AS CP_REGPAT,[R_NUMCRED] AS RA_NUMCRED,(SELECT TOP 1 PD_FECHA FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] AS dili WHERE dili.[PD_R_ID]=crp.[R_ID] AND dili.[PD_INSPECTOR]=crp.[ID_INS] AND dili.[PD_SUBDEL]=crp.[R_SUBDEL] ORDER BY dili.[PD_FECHA] DESC) AS AC_FECH_DILIGENCIA,R_IMPORTE as RA_IMPORTE_T
		FROM [sirecacobros].[dbo].[PAE_CRED] AS crp
		WHERE crp.FECH_INS between @FEC_INI AND @FEC_FIN
	) AS UA
) AS PAEXX 
on PAEXX.CP_INSPEC=EJECUTORES.id
WHERE PAEXX.CP_INSPEC IS NOT NULL
--and PAEXX.AC_FECH_DILIGENCIA IS NULL
/*......FIN CONJUNTO DE DATOS......*/
) AS G1
GROUP BY G1.subdel,G1.id,G1.nombre
) AS G2
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="01" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLDia" DefaultValue="1" Name="?" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLFecInicio" DefaultValue="01/01/2000" 
                Name="?" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DDLFechFin" DefaultValue="01/01/2000" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        AllowSorting="True" AutoGenerateColumns="False" Font-Size="8pt" 
        ShowFooter="True" HorizontalAlign="Center" CssClass="table-condensed">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                SortExpression="SUBDEL">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" ReadOnly="True" 
                SortExpression="NOMBRE" />
            <asp:BoundField DataField="ULTIMA_ASIGNACION" HeaderText="ULTIMA ASIG." 
                ReadOnly="True" SortExpression="ULTIMA_ASIGNACION">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DIAS_ASIGNADOS" DataFormatString="{0:N0}" 
                HeaderText="DIAS ASIG." ReadOnly="True" SortExpression="DIAS_ASIGNADOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES_ASIGNADOS" DataFormatString="{0:N0}" 
                HeaderText="PAT. ASIG." ReadOnly="True" 
                SortExpression="PATRONES_ASIGNADOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CRED. ASIG." 
                SortExpression="CREDITOS_ASIGNADOS">
                <ItemTemplate>
                    <asp:LinkButton ID="LBCredAsig" CommandArgument='<%# Eval("ID") %>'  runat="server" 
                        Text='<%# Eval("CREDITOS_ASIGNADOS", "{0:N0}") %>' 
                        onprerender="LBCredAsig_PreRender" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="CREDITOS_ASIGNADOS_PROMEDIO_AL_DIA" 
                DataFormatString="{0:N0}" HeaderText="CRED. ASIG. PROM. AL DIA" 
                ReadOnly="True" SortExpression="CREDITOS_ASIGNADOS_PROMEDIO_AL_DIA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="ULTIMA_CAPTURA" HeaderText="ULTIMO REG." 
                ReadOnly="True" SortExpression="ULTIMA_CAPTURA">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DIAS_CAPTURADOS" DataFormatString="{0:N0}" 
                HeaderText="DIAS REG." ReadOnly="True" SortExpression="DIAS_CAPTURADOS">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES_CAPTURADOS" DataFormatString="{0:N0}" 
                HeaderText="PAT. REG." ReadOnly="True" 
                SortExpression="PATRONES_CAPTURADOS">
            <ItemStyle HorizontalAlign="Right" CssClass="btn-info" />
            </asp:BoundField>
            <asp:BoundField DataField="PATRONES_P" DataFormatString="{0:P0}" HeaderText="PAT.%" 
                SortExpression="PATRONES_P">
            <ItemStyle HorizontalAlign="Right" CssClass="btn-info" Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS_CAPTURADOS" DataFormatString="{0:N0}" 
                HeaderText="CRED. REG." ReadOnly="True" 
                SortExpression="CREDITOS_CAPTURADOS">
            <ItemStyle HorizontalAlign="Right" CssClass="btn-success" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS_P" DataFormatString="{0:P0}" HeaderText="CRED.%" 
                SortExpression="CREDITOS_P">
            <ItemStyle HorizontalAlign="Right" CssClass="btn-success" Font-Bold="True" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CRED. PEND." SortExpression="CRED_FALTANTES">
                <ItemTemplate>
                    <asp:LinkButton ID="LBPend" runat="server" 
                        Text='<%# Eval("CRED_FALTANTES", "{0:N0}") %>' CommandArgument='<%# Eval("ID") %>' onprerender="LBPend_PreRender"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="RA_IMPORTE_T" DataFormatString="{0:C}" 
                HeaderText="IMP. TOTAL" SortExpression="RA_IMPORTE_T">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="AC_IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMP. REG." SortExpression="AC_IMPORTE">
            <ItemStyle HorizontalAlign="Right" CssClass="btn-warning" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPORTE_P" DataFormatString="{0:P0}" HeaderText="IMP.%" 
                SortExpression="IMPORTE_P">
            <ItemStyle HorizontalAlign="Right" CssClass="btn-warning" Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="CREDITOS_CAPTURADOS_PROMEDIO_AL_DIA" 
                DataFormatString="{0:N0}" HeaderText="PAT. REG. PROM. AL DIA" 
                ReadOnly="True" SortExpression="CREDITOS_CAPTURADOS_PROMEDIO_AL_DIA">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="DESEMPENIO" DataFormatString="{0:P0}" 
                HeaderText="DESEMP." ReadOnly="True" SortExpression="DESEMPENIO">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle HorizontalAlign="Right" />
    </asp:GridView>
    
</asp:Content>

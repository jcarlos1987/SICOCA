<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="indicadoresdedesempeniopendetalles.aspx.vb" Inherits="WebSIRECA.indicadoresdedesempeniopendetalles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DETALLES</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center >
        <asp:LinkButton ID="LBDescargar" runat="server" CssClass="btn" 
            BackColor="#9CAAC1">Descargar Excel</asp:LinkButton>
    </center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" AllowSorting="True" HorizontalAlign="Center" 
            CssClass="table-condensed" Font-Size="8pt">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" ReadOnly="True" 
                    SortExpression="NOMBRE" />
                <asp:BoundField DataField="CP_FECH_ASIG" HeaderText="ASIGNADO" 
                    ReadOnly="True" SortExpression="CP_FECH_ASIG" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CP_REGPAT" HeaderText="REG.PATR." ReadOnly="True" 
                    SortExpression="CP_REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="RA_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="RA_PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RA_NUMCRED" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="RA_NUMCRED" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RA_IMPORTE_T" HeaderText="IMPORTE" 
                    ReadOnly="True" SortExpression="RA_IMPORTE_T" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="SECTOR" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_INC" HeaderText="RALE. INC." 
                    SortExpression="RALE_INC">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_TIPO" HeaderText="RALE. TIPO" 
                    SortExpression="RALE_TIPO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="btn-info" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @ID_INSPECTOR AS VARCHAR(15)
DECLARE @FEC_INI datetime
DECLARE @FEC_FIN datetime
DECLARE @RALECOP AS VARCHAR(15)
DECLARE @RALERCV AS VARCHAR(15)
SET @SUBDEL=?
SET @ID_INSPECTOR=?
SET @FEC_INI=?
SET @FEC_FIN=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=@SUBDEL and tipo='RCV' order by fecha desc)

exec('
SELECT 
SUBDEL,NOMBRE,CP_FECH_ASIG,CP_REGPAT,RAZON,RA_PERIODO,RA_NUMCRED,RA_IMPORTE_T,SECTOR,COTIZ
,RALE_INC,RALE_TIPO
FROM (
SELECT
X.SUBDEL,NOMBRE,CP_FECH_ASIG,CP_REGPAT,razonSocial AS RAZON
,SUBSTRING(RA_PERIODO,4,7) AS RA_PERIODO
,RA_NUMCRED,RA_IMPORTE_T,SECTOR,COTIZ
FROM (
SELECT subdel,nombre,CP_FECH_ASIG,CP_REGPAT,RA_PERIODO,RA_NUMCRED,RA_IMPORTE_T
 FROM
(
SELECT USERSIRECA.id,USERSIRECA.del,USERSIRECA.subdel,USERS.nombre 
FROM sireca.dbo.usuarios AS USERSIRECA LEFT JOIN fiscamovil.dbo.usuarios AS USERS ON  USERSIRECA.id = USERS.id WHERE USERSIRECA.userPae2=''1'' and USERSIRECA.subdel like '''+@SUBDEL+'''
) AS EJECUTORES
LEFT JOIN
(
/*PRIMERA BASE*/
	SELECT DISTINCT CP_INSPEC,CP_FECH_ASIG,CP_REGPAT,RA_PERIODO,RA_NUMCRED,max(AC_FECH_DILIGENCIA) as AC_FECH_DILIGENCIA,AC_RA_REGPATR,AC_RA_NUMCRED,RA_IMPORTE as RA_IMPORTE_T,(CASE WHEN AC_RA_NUMCRED IS NOT NULL THEN RA_IMPORTE ELSE 0.0 END) AS AC_IMPORTE
	FROM sirecacobros.dbo.[ASIGNACIONES COBROS] as vt --vista
	WHERE CP_FECH_ASIG BETWEEN '''+@FEC_INI+''' AND '''+@FEC_FIN+''' AND (AC_FECH_DILIGENCIA&gt;='''+@FEC_INI+''' or AC_FECH_DILIGENCIA is null)
	GROUP BY CP_INSPEC,CP_FECH_ASIG,CP_REGPAT,RA_PERIODO,RA_NUMCRED,AC_RA_REGPATR,AC_RA_NUMCRED,RA_IMPORTE
/*SEGUNDA BASE*/
union all
	SELECT CP_INSPEC,CP_FECH_ASIG,CP_REGPAT,RA_PERIODO,RA_NUMCRED,AC_FECH_DILIGENCIA,(CASE WHEN AC_FECH_DILIGENCIA IS NOT NULL THEN CP_REGPAT ELSE NULL END) AS AC_RA_REGPATR,(CASE WHEN AC_FECH_DILIGENCIA IS NOT NULL THEN RA_NUMCRED ELSE NULL END) AS AC_RA_NUMCRED,RA_IMPORTE_T as RA_IMPORTE_T,(CASE WHEN AC_FECH_DILIGENCIA IS NOT NULL THEN RA_IMPORTE_T ELSE 0.0 END) AS AC_IMPORTE 
	FROM (
		SELECT [ID_INS] AS CP_INSPEC,[FECH_INS] AS CP_FECH_ASIG,[R_REGPATR] AS CP_REGPAT,R_PERIODO AS RA_PERIODO,[R_NUMCRED] AS RA_NUMCRED,(SELECT TOP 1 PD_FECHA FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] AS dili WHERE dili.[PD_R_ID]=crp.[R_ID] AND dili.[PD_INSPECTOR]=crp.[ID_INS] AND dili.[PD_SUBDEL]=crp.[R_SUBDEL] ORDER BY dili.[PD_FECHA] DESC) AS AC_FECH_DILIGENCIA,R_IMPORTE as RA_IMPORTE_T
		FROM [sirecacobros].[dbo].[PAE_CRED] AS crp
		WHERE crp.FECH_INS between '''+@FEC_INI+''' AND '''+@FEC_FIN+'''
	) AS UA
) AS PAEXX 
on PAEXX.CP_INSPEC=EJECUTORES.id
WHERE PAEXX.CP_INSPEC='''+@ID_INSPECTOR+'''
and PAEXX.AC_FECH_DILIGENCIA IS NULL
and RA_IMPORTE_T is not null

/*......FIN CONJUNTO DE DATOS......*/
) AS X LEFT JOIN sireca.dbo.patrones as ptn on ptn.regpat=x.cp_regpat
) AS RESULTADOS
left join (
SELECT replace([REGPATR],''-'','''') as RALE_REGPATR
      ,[NUMCRED] AS RALE_NUMCRED
      ,[INC] AS RALE_INC
      ,[IMPORTE] AS RALE_IMPORTE
      ,[PERIODO] AS RALE_PERIODO
      ,''COP'' AS RALE_TIPO
  FROM [rale].[dbo].['+@RALECOP+']
  UNION ALL
  SELECT replace([REGPATR],''-'','''') as RALE_REGPATR
      ,[NUMCRED] AS RALE_NUMCRED
      ,[INC] AS RALE_INC
      ,[IMPORTE] AS RALE_IMPORTE
      ,[PERIODO] AS RALE_PERIODO
      ,''RCV'' AS RALE_TIPO
  FROM [rale].[dbo].['+@RALERCV+']
) as rale ON RALE_REGPATR=CP_REGPAT AND RALE_NUMCRED=RA_NUMCRED AND SUBSTRING(RALE_PERIODO,4,7)=RA_PERIODO
--ORDER BY X.CP_REGPAT,X.CP_FECH_ASIG
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="9999999" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechfin" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

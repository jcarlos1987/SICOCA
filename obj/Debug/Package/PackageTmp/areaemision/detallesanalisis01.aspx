<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detallesanalisis01.aspx.vb" Inherits="WebSIRECA.detallesanalisis01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles</title>
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="10pt" 
            HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="RALE_TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="RALE_TIPO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="RALE_REGPAT">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="RALE_CREDITO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_MOV" HeaderText="MOV" ReadOnly="True" 
                    SortExpression="RALE_MOV">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_FECH_MOV" HeaderText="FECHA DE MOV." 
                    ReadOnly="True" SortExpression="RALE_FECH_MOV">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_SECTOR" HeaderText="SECTOR" ReadOnly="True" 
                    SortExpression="RALE_SECTOR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_TD" HeaderText="TD" ReadOnly="True" 
                    SortExpression="RALE_TD">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_FECH_ALTA" HeaderText="FECHA DE ALTA" 
                    ReadOnly="True" SortExpression="RALE_FECH_ALTA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="RALE_PERIODO">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="RALE_IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ECO_PAGO" DataFormatString="{0:C}" 
                    HeaderText="SIRECA PAGO" ReadOnly="True" SortExpression="ECO_PAGO">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle HorizontalAlign="Right" Font-Bold="True" Font-Italic="False" 
                    ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_DIAS" HeaderText="DIAS" ReadOnly="True" 
                    SortExpression="RALE_DIAS">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_FECH_INC" HeaderText="FECHA INC. 01" 
                    ReadOnly="True" SortExpression="RALE_FECH_INC">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RALE_FECH_NOTIFICACION" 
                    HeaderText="FECHA DE NOTIFICACION" ReadOnly="True" 
                    SortExpression="RALE_FECH_NOTIFICACION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ECO_FECH_NOTIFICACION" 
                    HeaderText="SIRECA FECHA DE NOTIFICACION" ReadOnly="True" 
                    SortExpression="ECO_FECH_NOTIFICACION">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="ECO_DILIGENCIA" HeaderText="SIRECA DILIGENCIA" 
                    ReadOnly="True" SortExpression="ECO_DILIGENCIA">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle Font-Bold="True" ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="ECO_FECH_DILIGENCIA" DataFormatString="{0:d}" 
                    HeaderText="SIRECA FECHA DE DILIGENCIA" ReadOnly="True" 
                    SortExpression="ECO_FECH_DILIGENCIA">
                <ControlStyle Font-Bold="True" ForeColor="#996633" />
                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#FF3300" />
                </asp:BoundField>
                <asp:BoundField DataField="ALTA_EN_SUBDEL" HeaderText="ALTA EN SUBDEL" 
                    SortExpression="ALTA_EN_SUBDEL">
                <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ULTIMA_EMISION" HeaderText="ULTIMA EMISION" 
                    SortExpression="ULTIMA_EMISION">
                <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @RALECOP as VARCHAR(15)
DECLARE @RALERCV as VARCHAR(15)
DECLARE @SUBDEL as VARCHAR(2)
DECLARE @DILIGENCIA as VARCHAR(50)
DECLARE @FECH_RN_SN as VARCHAR(50)
SET @SUBDEL=?
SET @DILIGENCIA=?
SET @FECH_RN_SN=?
SET @RALECOP=?
SET @RALERCV=?

exec('
select 
'''+@RALECOP+''' AS RALE_COP
,'''+@RALERCV+''' AS RALE_RCV
,ptn.subdel AS ALTA_EN_SUBDEL
,substring(convert(varchar(10),ptn.vigencia,103),4,7) as ULTIMA_EMISION
,RALE_TIPO
,RALE_REGPAT
,RALE_CREDITO
,RALE_MOV
,RALE_FECH_MOV
,RALE_SECTOR
,RALE_TD,RALE_FECH_ALTA,RALE_PERIODO,RALE_IMPORTE,ECO_PAGO,RALE_DIAS,RALE_INC,RALE_FECH_INC,RALE_FECH_NOTIFICACION,ECO_FECH_NOTIFICACION,ECO_DILIGENCIA,ECO_FECH_DILIGENCIA,FECHA_NOTIFICACION
from (
select TIPO AS RALE_TIPO
,RALE_CREDITO,RALE_REGPAT,MOV AS RALE_MOV,FMOV AS RALE_FECH_MOV
,SECTOR AS RALE_SECTOR
,TD AS RALE_TD
,FALTA AS RALE_FECH_ALTA
,RALE_PERIODO AS RALE_PERIODO
,IMPORTE AS RALE_IMPORTE
,ECO_PAGO as ECO_PAGO
,DIAS AS RALE_DIAS
,INC AS RALE_INC
,FEINC AS RALE_FECH_INC
,FNOTIFICACION AS RALE_FECH_NOTIFICACION
,ECO_FECH_NOTIFICACION as ECO_FECH_NOTIFICACION
,ISNULL(ECO_DILIGENCIA,''N/A'') AS ECO_DILIGENCIA
,ECO_FECH_DILIGENCIA as ECO_FECH_DILIGENCIA
,case 
when FNOTIFICACION is null and ECO_FECH_NOTIFICACION is null then ''RALE(NO)-SIRECA(NO)''
when FNOTIFICACION is not null and ECO_FECH_NOTIFICACION is not null then ''RALE(SI)-SIRECA(SI)''
when FNOTIFICACION is not null and ECO_FECH_NOTIFICACION is null then ''RALE(SI)-SIRECA(NO)''
when FNOTIFICACION is null and ECO_FECH_NOTIFICACION is not null then ''RALE(NO)-SIRECA(SI)''
end as FECHA_NOTIFICACION
,ECO_PERIODO
,ECO_CREDITO
,ECO_REGPAT
from (
select ''COP'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT

,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO, * from rale.dbo.['+@RALECOP+']
where inc in (''01'')
union all
select ''RCV'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT
,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO, * from rale.dbo.['+@RALERCV+']
where inc in (''01'')
) as rale
left join 
(
select 
	(case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else 
		(
			SELECT top 1 convert(nvarchar(10),hinc.fecha,103)
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia=''2'' and hinc.ideco=eco.id
			order by hinc.id desc
		) end 
	) as ECO_FECH_NOTIFICACION
,credito AS ECO_CREDITO
,SUBSTRING(reg#patronal,1,10) AS ECO_REGPAT
,incidencia AS ECO_DILIGENCIA
,fechaCaptura as ECO_FECH_DILIGENCIA
,pago as ECO_PAGO
,(case 
when [tipoECO] in (''COP'',''COMP'') then
(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in (''RCV'',''RCVCOMP'') then
(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end)
end
) as ECO_PERIODO
from sireca.dbo.eco as eco
where tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
and subdel='''+@SUBDEL+'''
) as sireca
ON ECO_REGPAT=RALE_REGPAT AND ECO_CREDITO=RALE_CREDITO AND ECO_PERIODO=RALE_PERIODO
) as rr
left join sireca.dbo.patrones as ptn on ptn.regpat=rr.rale_regpat
WHERE ECO_DILIGENCIA='''+@DILIGENCIA+'''
AND FECHA_NOTIFICACION='''+@FECH_RN_SN+'''
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="" Name="?" 
                    QueryStringField="diligencia" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fech_rn_sn" />
                <asp:QueryStringParameter DefaultValue="abcd" Name="?" 
                    QueryStringField="ralecop" />
                <asp:QueryStringParameter DefaultValue="abcd" Name="?" 
                    QueryStringField="ralercv" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

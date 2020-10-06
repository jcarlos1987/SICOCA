<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="depuradospagosdetalle.aspx.vb" Inherits="WebSIRECA.depuradospagosdetalle" %>

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
    <center>
        <asp:LinkButton ID="LBExportar" runat="server" CssClass="btn">Exportar a EXCEL</asp:LinkButton>
    </center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Font-Size="10pt" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FACTURA" HeaderText="FACTURA" ReadOnly="True" 
                    SortExpression="FACTURA" />
                <asp:BoundField DataField="PERIODO_BIMESTRE" HeaderText="PERIODO / BIMESTRE" 
                    ReadOnly="True" SortExpression="PERIODO_BIMESTRE" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="COTIZ" DataFormatString="{0:N0}" HeaderText="COTIZ" 
                    ReadOnly="True" SortExpression="COTIZ">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="EMISION" DataFormatString="{0:C}" 
                    HeaderText="EMISION" ReadOnly="True" SortExpression="EMISION">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                    ReadOnly="True" SortExpression="PAGO">
                <ItemStyle HorizontalAlign="Right" BackColor="#FFEFBB" />
                </asp:BoundField>
                <asp:BoundField DataField="DIFERENCIA" DataFormatString="{0:C}" 
                    HeaderText="DIFERENCIA" SortExpression="DIFERENCIA">
                <ItemStyle HorizontalAlign="Right" BackColor="#FFD467" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_PAGO" DataFormatString="{0:d}" 
                    HeaderText="FECHA PAGO" ReadOnly="True" SortExpression="FECHA_PAGO">
                <ItemStyle HorizontalAlign="Center" BackColor="#FFEFBB" />
                </asp:BoundField>
                <asp:BoundField DataField="FEHCA_NOTIFICACION" DataFormatString="{0:d}" 
                    HeaderText="FEHCA NOTIFICACION" ReadOnly="True" 
                    SortExpression="FEHCA_NOTIFICACION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="FECHA_ASIGNACION" DataFormatString="{0:d}" 
                    HeaderText="FECHA ASIGNACION" ReadOnly="True" SortExpression="FECHA_ASIGNACION">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DILIGENCIA_SIRECA" HeaderText="DILIGENCIA SIRECA" 
                    ReadOnly="True" SortExpression="DILIGENCIA_SIRECA" />
                <asp:BoundField DataField="FECHA_DILIGENCIA" DataFormatString="{0:d}" 
                    HeaderText="FECHA DILIGENCIA" ReadOnly="True" SortExpression="FECHA_DILIGENCIA">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SECTOR" DataFormatString="{0:D6}" 
                    HeaderText="SECTOR" ReadOnly="True" SortExpression="SECTOR">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="INC_RALE" HeaderText="INC RALE" ReadOnly="True" 
                    SortExpression="INC_RALE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TD_RALE" HeaderText="TD RALE" ReadOnly="True" 
                    SortExpression="TD_RALE">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @PERIODO AS VARCHAR(6)
DECLARE @DEPURADO_POR AS VARCHAR(20)
DECLARE @PERIODO_BIMESTRE AS VARCHAR(15)
DECLARE @TIPOECO AS VARCHAR(10)

SET @SUBDEL=?
SET @PERIODO=?
SET @DEPURADO_POR=?
SET @PERIODO_BIMESTRE=?
SET @TIPOECO=?

select 
subdel as SUBDEL,tipoECO as FACTURA,PERIODO_BIMESTRE
,REG#PATRONAL as REGPAT,[NOMBRE O RAZON SOCIAL] as RAZON,CREDITO,COTIZ
,OMISION as EMISION
,isnull(pago,0) as PAGO
,(OMISION-isnull(pago,0)) as DIFERENCIA
,fech_pago as FECHA_PAGO,fecha_notificacion as FEHCA_NOTIFICACION
,(select upper(nombre) from fiscamovil.dbo.usuarios where id=responsable) as INSPECTOR
,fechaSeleccion as FECHA_ASIGNACION

,incidencia as DILIGENCIA_SIRECA,fechaCaptura as FECHA_DILIGENCIA,sector as SECTOR
,incidenciarale as INC_RALE,tdrale as TD_RALE
from (
select 
(case 
when fecha_notificacion&gt;fech_pago then 'DEPURADO POR PAGO'
when fecha_notificacion&lt;=fech_pago then 'OTRAS INC'
when fech_pago is not null then 'DEPURADO POR PAGO'
else 'OTRAS INC' --incidenciarale
end) AS DEPURADO_POR
,(case 
when [tipoECO] in ('COP','COMP') then
(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
when [tipoECO] in ('RCV','RCVCOMP') then
(case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end)
end
) as PERIODO_BIMESTRE
,*
from (
SELECT 
(
	case 
	when eco.incidencia in ('2') then eco.fechacaptura 
	else
		(
			SELECT top 1 hinc.fecha
			FROM [sireca].[dbo].[HistorialInc] as hinc
			where hinc.incidencia='2' and hinc.ideco=eco.id
			order by ideco desc
		)
	end 
	) as fecha_notificacion
,*
FROM sireca.dbo.eco WHERE 
subdel LIKE @SUBDEL and fechaeco=@PERIODO
and tipoeco in ('COP','COMP','RCV','RCVCOMP')
) as resultado
--AND INCIDENCIA='RB'
) as result
WHERE DEPURADO_POR=@DEPURADO_POR
AND PERIODO_BIMESTRE=@PERIODO_BIMESTRE
AND TIPOECO=@TIPOECO
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="01" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="12000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="abcde" Name="?" 
                    QueryStringField="depuradoporpago" />
                <asp:QueryStringParameter DefaultValue="01/2000" Name="?" 
                    QueryStringField="periodobimentre" />
                <asp:QueryStringParameter DefaultValue="cop" Name="?" 
                    QueryStringField="tipoeco" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

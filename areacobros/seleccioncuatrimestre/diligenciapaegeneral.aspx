<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="diligenciapaegeneral.aspx.vb" Inherits="WebSIRECA.diligenciapaegeneral" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DILIGENCIA</title>
    <link href="../../css/sireca.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewSaldo" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" 
            DataSourceID="SqlDataSourceDili" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:HyperLinkField DataNavigateUrlFields="PATRONES" 
                    DataNavigateUrlFormatString="../../observacionPatronal/Default.aspx?regpat={0}&amp;razon=razon" 
                    DataTextField="PATRONES" HeaderText="REG.PATRONAL" SortExpression="PATRONES" 
                    Target="_blank" />
                <asp:BoundField DataField="razonSocial" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="razonSocial" />
                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                    SortExpression="CREDITOS" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="HFRegPat" runat="server" Value='<%# Eval("PATRONES") %>' />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" Font-Size="8pt" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                                    SortExpression="PERIODO" />
                                <asp:BoundField DataField="CREDITOS" HeaderText="CREDITOS" ReadOnly="True" 
                                    SortExpression="CREDITOS" />
                                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                    SortExpression="IMPORTE" DataFormatString="{0:C}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DILIGENCIA" HeaderText="DILIGENCIA" ReadOnly="True" 
                                    SortExpression="DILIGENCIA" />
                                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" ReadOnly="True" 
                                    SortExpression="INC_RALE" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TIPORALE" HeaderText="TIPORALE" ReadOnly="True" 
                                    SortExpression="TIPORALE" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#BCC7D8" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @RALECOP AS VARCHAR(50)
DECLARE @RALERCV AS VARCHAR(50)
DECLARE @REGPAT AS VARCHAR(50)

SET @SUBDEL=?
SET @REGPAT=?

SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
SET @RALERCV = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='RCV' order by fecha desc)

---------------------por tipo y grupo de incidencias
exec('
SELECT
(substring(RA_PERIODO,4,7)) as PERIODO
,RA_NUMCRED as CREDITOS
,(RA_IMPORTE) as IMPORTE
,(case when (select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) is null then ''SALDO'' else (SELECT replace(replace([desc_diligencia],''(foto)'',''''),''> seleccione'',''CITATORIO'') FROM [sirecacobros].[dbo].[cae_diligencia] where [id_diligencia]=(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc)) end) as DILIGENCIA
,cuatrimestre_ciclo
,cuatrimestre_num
,rale.inc as INC_RALE
,RA_TIPO as TIPORALE
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
left join (select * from [rale].[dbo].['+@RALECOP+'] union all select * from [rale].[dbo].['+@RALERCV+']) as rale 
on replace(rale.regpatr,''-'','''')=RA_REGPATR and rale.NUMCRED=RA_NUMCRED
WHERE 
[CP_INSPEC] is not null
and cp_subdel='''+@SUBDEL+'''
and ra_subdel='''+@SUBDEL+'''
and RA_VIVO=''SI'' and RA_INC in (''01'',''02'',''31'',''32'',''43'')
and [CP_REGPAT]='''+@REGPAT+'''
')
">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                                    QueryStringField="subdel" />
                                <asp:ControlParameter ControlID="HFRegPat" DefaultValue="G6666666" Name="?" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#BCC7D8" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceDili" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"             
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @FECH_INI as VARCHAR(10)
DECLARE @FECH_FIN as VARCHAR(10)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @TIPO_REP as VARCHAR(6) --general=0, por figura=1
DECLARE @TIPO_COP_RCV as VARCHAR(6)
DECLARE @DILIGENCIA AS VARCHAR(50)

SET @SUBDEL=?
SET @FECH_INI=?
SET @FECH_FIN=?
SET @TIPO_REP=?
SET @INSPECTOR=?
SET @TIPO_COP_RCV=?
SET @DILIGENCIA=?

if @TIPO_REP='0'
begin
SET @INSPECTOR='%'
end
---------------------por tipo y grupo de incidencias
exec('
SELECT
[CP_SUBDEL] as SUBDEL
,[CP_REGPAT] as PATRONES
,razonSocial
,count(RA_NUMCRED) as CREDITOS
,max(ptn.cotiz) as COTIZANTES
,sum(RA_IMPORTE) as IMPORTE
FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT
left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'')
left join sireca.dbo.patrones as ptn on regpat=RA_REGPATR
WHERE 
[CP_INSPEC] is not null
and [CP_INSPEC] like '''+@INSPECTOR+'''
and cp_subdel='''+@SUBDEL+'''
and ra_subdel='''+@SUBDEL+'''
and RA_TIPO like '''+@TIPO_COP_RCV+'''
and [CP_FECH_ASIG] between '''+@FECH_INI+''' and '''+@FECH_FIN+'''
and RA_VIVO=''SI'' and RA_INC in (''01'',''02'',''31'',''32'',''43'')
and (case when (select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) is null then 999 else (select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) end)='''+@DILIGENCIA+'''
group by [CP_SUBDEL],[CP_REGPAT],razonSocial
')
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechaini" />
                <asp:QueryStringParameter DefaultValue="01/01/2000" Name="?" 
                    QueryStringField="fechafin" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="reportetipo" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="inspector" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="tipoeco" />
                <asp:QueryStringParameter DefaultValue="0" Name="?" 
                    QueryStringField="diligencia" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

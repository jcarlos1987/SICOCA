<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo2.Master" CodeBehind="detallesCreditos.aspx.vb" Inherits="WebSIRECA.detallesCreditos" %>

<asp:Content ID="contenido1" runat="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <asp:GridView ID="GVDCreditos" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSourceDCreditos" Font-Size="10pt" 
            HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="NUMCRED" HeaderText="CREDITO" 
                    SortExpression="NUMCRED" />
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TD" HeaderText="TD" SortExpression="TD" />
                <asp:BoundField DataField="INC" HeaderText="INC" SortExpression="INC" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                    SortExpression="INC_RALE" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" />
                <asp:BoundField DataField="ID_RESPONSABLE" HeaderText="INSPECTOR B" 
                    SortExpression="ID_RESPONSABLE" />
                <asp:BoundField DataField="INC_CAP" HeaderText="INC_CAP" 
                    SortExpression="INC_CAP" />
                <asp:BoundField DataField="FECH_CAP" HeaderText="FECH_CAP" 
                    SortExpression="FECH_CAP" />
                <asp:BoundField DataField="FECH_ASIG" HeaderText="FECH_ASIG" 
                    SortExpression="FECH_ASIG" />
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    SortExpression="OBSERVACION" />
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
        <asp:SqlDataSource ID="SqlDataSourceDCreditos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @REGPAT VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @TIPO_ESTADO VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @RALECOP as varchar(50)
SET @SUBDEL=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @REGPAT=?
SET @TIPO_TRAB=?
SET @TIPO_ESTADO=?
SET @ID_EJECUTOR=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
exec(
'select
eth.[PERIODO]
,eth.[NUMCRED]
,eth.[ADEUDO]
,(SELECT ''(''+dr.[docto]+'')''+dr.[descripcion] FROM [sireca].[dbo].[doc_rale] as dr where dr.[docto]=eth.[TD]) as [TD]
,(SELECT ''(''+ir.[inc]+'')''+ir.[descripcion] FROM [sireca].[dbo].[inc_rale] as ir where ir.[inc]=eth.[INC]) as [INC]
,eth.[emision]
,eth.[DIAS]
,(SELECT upper(uf.[nombre]) as [nombre] FROM [fiscamovil].[dbo].[Usuarios] as uf where uf.[id]=[ID_RESPONSABLE]) as [ID_RESPONSABLE]
,(case when [INC_CAP]=''x'' then ''SIN CAPTURA''
else (SELECT ''(''+cr.[CVE_DILIG_PAE]+'')''+cr.[ACTIVIDAD] FROM [sireca].[dbo].[catalogo] as cr where cr.[CVE_DILIG_PAE]=[INC_CAP])
end) as [INC_CAP]
,eth.[FECH_CAP]
,eth.TIPOFILE as TIPO
,(SELECT ''(''+ir.[inc]+'')''+ir.[descripcion] FROM [sireca].[dbo].[inc_rale] as ir where ir.[inc]=rale.INC) as INC_RALE
,eth.[FECH_ASIG]
,eth.[OBSERVACION]
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as eth left join rale.dbo.['+@RALECOP+'] as rale
on eth.REGPATR=rale.REGPATR and eth.NUMCRED=rale.NUMCRED
where subdel='''+@SUBDEL+'''
and convert(datetime,eth.FECH_ASIG,103) 
between convert(datetime,'''+@FECH_INICIO+''',103) 
and convert(datetime,'''+@FECH_FIN+''',103) 
and eth.REGPATR='''+@REGPAT+'''
and eth.[ID_RESPONSABLE] like '''+@ID_EJECUTOR+'''+''%''
and eth.TIPO_TRABAJO='''+@TIPO_TRAB+'''
and (case 
when [INC_CAP] in (''05'',''52'',''54'',''RB'',''RE'', ''23'') then ''COBRADO''
when [INC_CAP] in (''09'') then ''NO LOCALIZADO''
when [INC_CAP] in (''31'',''x'') then ''PENDIENTE''
when [INC_CAP] in (''33'') then ''REMOCION''
when [INC_CAP] in (''43'') then ''EMB. CUENTA''
when [INC_CAP] in (''34'') then ''EMB. INMUEBLE''
when [INC_CAP] in (''32'') then ''EMB. MONTAÑO''
when [INC_CAP] in (''03'') then ''EN ACLARACION''
else [INC_CAP]
end)='''+@TIPO_ESTADO+''''
)
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_inicio" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="00000000" Name="?" 
                    QueryStringField="regpat" />
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="tipo_trabajo" />
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="tipo_estado" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="id_ejecutor" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourceDCreditosGeneral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL VARCHAR(50)
DECLARE @FECH_INICIO VARCHAR(50)
DECLARE @FECH_FIN VARCHAR(50)
DECLARE @REGPAT VARCHAR(50)
DECLARE @TIPO_TRAB VARCHAR(50)
DECLARE @ID_EJECUTOR VARCHAR(50)
DECLARE @RALECOP as varchar(50)
SET @SUBDEL=?
SET @FECH_INICIO=?
SET @FECH_FIN=?
SET @REGPAT=?
SET @TIPO_TRAB=?
SET @ID_EJECUTOR=?
SET @RALECOP = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel=''+@SUBDEL+'' and tipo='COP' order by fecha desc)
exec(
'select
eth.[PERIODO]
,eth.[NUMCRED]
,eth.[ADEUDO]
,(SELECT ''(''+dr.[docto]+'')''+dr.[descripcion] FROM [sireca].[dbo].[doc_rale] as dr where dr.[docto]=eth.[TD]) as [TD]
,(SELECT ''(''+ir.[inc]+'')''+ir.[descripcion] FROM [sireca].[dbo].[inc_rale] as ir where ir.[inc]=eth.[INC]) as [INC]
,eth.[emision]
,eth.[DIAS]
,(SELECT upper(uf.[nombre]) as [nombre] FROM [fiscamovil].[dbo].[Usuarios] as uf where uf.[id]=[ID_RESPONSABLE]) as [ID_RESPONSABLE]
,(case when [INC_CAP]=''x'' then ''SIN CAPTURA''
else (SELECT ''(''+cr.[CVE_DILIG_PAE]+'')''+cr.[ACTIVIDAD] FROM [sireca].[dbo].[catalogo] as cr where cr.[CVE_DILIG_PAE]=[INC_CAP])
end) as [INC_CAP]
,eth.[FECH_CAP]
,eth.TIPOFILE as TIPO
,(SELECT ''(''+ir.[inc]+'')''+ir.[descripcion] FROM [sireca].[dbo].[inc_rale] as ir where ir.[inc]=rale.INC) as INC_RALE
,eth.[FECH_ASIG]
,eth.[OBSERVACION]
FROM [sirecacobros].[dbo].[ecoTiposHistorial] as eth left join rale.dbo.['+@RALECOP+'] as rale
on eth.REGPATR=rale.REGPATR and eth.NUMCRED=rale.NUMCRED
where eth.subdel='''+@SUBDEL+'''
and convert(datetime,eth.FECH_ASIG,103) 
between convert(datetime,'''+@FECH_INICIO+''',103) 
and convert(datetime,'''+@FECH_FIN+''',103) 
and [ID_RESPONSABLE] like '''+@ID_EJECUTOR+'''+''%''
and eth.REGPATR='''+@REGPAT+'''
and TIPO_TRABAJO='''+@TIPO_TRAB+''''
)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_inicio" />
                <asp:QueryStringParameter DefaultValue="01-01-2000" Name="?" 
                    QueryStringField="fech_fin" />
                <asp:QueryStringParameter DefaultValue="00000000" Name="?" 
                    QueryStringField="regpat" />
                <asp:QueryStringParameter DefaultValue="000000" Name="?" 
                    QueryStringField="tipo_trabajo" />
                <asp:QueryStringParameter DefaultValue="%" Name="?" 
                    QueryStringField="id_ejecutor" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

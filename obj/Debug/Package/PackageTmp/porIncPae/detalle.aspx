<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detalle.aspx.vb" Inherits="WebSIRECA.detalle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/sireca.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource1" Font-Size="9pt" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:TemplateField HeaderText="REG_PATRONAL" SortExpression="REG_PATRONAL">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("REG_PATRONAL", "../observacionPatronal/Default.aspx?razon=razon&regpat={0}") %>' 
                            Target="_blank" Text='<%# Eval("REG_PATRONAL") %>' Font-Strikeout="False" 
                            Font-Underline="False"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" 
                    SortExpression="RAZON_SOCIAL" />
                <asp:BoundField DataField="COTIZANTES" DataFormatString="{0:N0}" 
                    HeaderText="COTIZANTES" ReadOnly="True" SortExpression="COTIZANTES">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PAGO" DataFormatString="{0:C}" HeaderText="PAGO" 
                    NullDisplayText="$0.00" ReadOnly="True" SortExpression="PAGO">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                    SortExpression="INC" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" ReadOnly="True" 
                    SortExpression="INC_RALE" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Visible="False" 
                             BorderColor="White" BorderStyle="None" 
                            BorderWidth="0px"  Font-Strikeout="False" 
                            Font-Underline="False">
                            <asp:Image ID="Image1" CssClass="linkx" ImageUrl="~/imagenes/listo.png" runat="server" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @INSPECTOR as VARCHAR(6)
DECLARE @PERIODO as VARCHAR(6)
DECLARE @INCIDENCIA as VARCHAR(3)
DECLARE @CICLO as VARCHAR(3)
SET @SUBDEL=?
SET @INSPECTOR=?
SET @PERIODO=?
SET @INCIDENCIA=?
SET @CICLO=?
IF @INSPECTOR='abc'
begin
	IF @CICLO='1'
	begin
	SELECT  SUBDEL
  ,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
  ,reg#patronal as REG_PATRONAL
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
  ,cotiz as COTIZANTES
  ,credito as CREDITO
  ,omision as IMPORTE
  ,PAGO
  ,incidencia as INC
  ,incidenciarale as INC_RALE  
  FROM [sireca].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL  
  order by subdel
	end
	else
	begin
	SELECT  SUBDEL
  ,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
  ,reg#patronal as REG_PATRONAL
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
  ,cotiz as COTIZANTES
  ,credito as CREDITO
  ,omision as IMPORTE
  ,PAGO
  ,incidencia as INC
  ,incidenciarale as INC_RALE  
  FROM [sirecacobros].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL  
  order by subdel
	end
end
else
begin
-------------------------------------------------------------------------------------------------
IF @CICLO='1'
begin
---------------------------
IF @PERIODO='all'
BEGIN
SELECT  SUBDEL
  ,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
  ,reg#patronal as REG_PATRONAL
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
  ,cotiz as COTIZANTES
  ,credito as CREDITO
  ,omision as IMPORTE
  ,PAGO
  ,incidencia as INC
  ,incidenciarale as INC_RALE  
  FROM [sireca].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  and responsable=@INSPECTOR
  order by subdel
END
ELSE
BEGIN
  SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
  ,reg#patronal as REG_PATRONAL
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
  ,cotiz as COTIZANTES
  ,credito as CREDITO
  ,omision as IMPORTE  
  ,PAGO
  ,incidencia as INC
  ,incidenciarale as INC_RALE
  FROM [sireca].[dbo].[eco]
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null
  and subdel=@SUBDEL
  and responsable=@INSPECTOR
  and fechaeco=@PERIODO
  order by subdel,responsable,fechaeco
END
-------------------------------
end
else
begin
----------------------------------------
IF @PERIODO='all'
BEGIN
SELECT  SUBDEL
  ,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
  ,reg#patronal as REG_PATRONAL
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
  ,cotiz as COTIZANTES
  ,credito as CREDITO
  ,omision as IMPORTE
  ,PAGO
  ,incidencia as INC
  ,incidenciarale as INC_RALE  
  FROM [sirecacobros].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  and responsable=@INSPECTOR
  order by subdel
END
ELSE
BEGIN
  SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
  ,reg#patronal as REG_PATRONAL
,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL
  ,cotiz as COTIZANTES
  ,credito as CREDITO
  ,omision as IMPORTE  
  ,PAGO
  ,incidencia as INC
  ,incidenciarale as INC_RALE
  FROM [sirecacobros].[dbo].[eco]
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null
  and subdel=@SUBDEL
  and responsable=@INSPECTOR
  and fechaeco=@PERIODO
  order by subdel,responsable,fechaeco
END
----------------------------------------
end
-------------------------------------------------------------------------------------------------
end
">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="00" Name="?" 
                    QueryStringField="subdel" />
                <asp:QueryStringParameter DefaultValue="" Name="?" 
                    QueryStringField="idinspector" />
                <asp:QueryStringParameter DefaultValue="12000" Name="?" 
                    QueryStringField="periodo" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="inc" />
                <asp:QueryStringParameter DefaultValue="00" Name="?" QueryStringField="c" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

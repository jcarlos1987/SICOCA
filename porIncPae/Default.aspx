<%@ Page Language="vb" MasterPageFile="~/sitios/SiteGeneral.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default34" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <table style="width: 100%;">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                            <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                    incidencia<asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>32</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" BackColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px" Text="ACTUALIZAR" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td bgcolor="#FFF3CD">
                                CICLO 1<hr /></td>
                            <td bgcolor="#BCC7D8">
                                CICLO 2<hr /></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFF3CD">
                                <asp:GridView 
                        runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" Caption="RESULTADO SUBDELEGACIONAL" 
                        CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSourceIncSubdel" BorderColor="Black" BorderWidth="1px" 
                        BorderStyle="Solid" ID="GVRGIncidencias1" Font-Size="10pt"><Columns>
<asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" DataFormatString="{0:N0}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                DataNavigateUrlFormatString="detalle.aspx{0}" DataTextField="CREDITOS" 
                                DataTextFormatString="{0:N0}" HeaderText="CREDITOS" 
                                NavigateUrl="~/porIncPae/detalle.aspx" SortExpression="CREDITOS" 
                                Target="_blank" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:HyperLinkField>
<asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
</Columns>

<FooterStyle Font-Bold="True"></FooterStyle>

<HeaderStyle BackColor="#D4D0C8"></HeaderStyle>
</asp:GridView>

                                                        <asp:SqlDataSource ID="SqlDataSourceIncSubdel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CICLO as VARCHAR(1)
DECLARE @INCIDENCIA as VARCHAR(3)
SET @SUBDEL=?
SET @CICLO=?
SET @INCIDENCIA=?
if @CICLO='1'
begin
SELECT  SUBDEL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector=abc&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=1') as urlv
  FROM [sireca].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel
  end 
  else
  begin
  SELECT  SUBDEL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector=abc&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=2') as urlv
  FROM [sirecacobros].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel
  end
  ">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:Parameter DefaultValue="1" Name="?" />
                                                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                    </asp:SqlDataSource>
                            </td>
                            <td bgcolor="#BCC7D8">
                                <asp:GridView 
                        runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" Caption="RESULTADO SUBDELEGACIONAL" 
                        CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSourceIncSubdel0" BorderColor="Black" BorderWidth="1px" 
                        BorderStyle="Solid" ID="GVRGIncidencias2" Font-Size="10pt"><Columns>
<asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" DataFormatString="{0:N0}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                DataNavigateUrlFormatString="detalle.aspx{0}" DataTextField="CREDITOS" 
                                DataTextFormatString="{0:N0}" HeaderText="CREDITOS" 
                                NavigateUrl="~/porIncPae/detalle.aspx" SortExpression="CREDITOS" 
                                Target="_blank" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:HyperLinkField>
<asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
</Columns>

<FooterStyle Font-Bold="True"></FooterStyle>

<HeaderStyle BackColor="#D4D0C8"></HeaderStyle>
</asp:GridView>

                                                        <asp:SqlDataSource ID="SqlDataSourceIncSubdel0" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CICLO as VARCHAR(1)
DECLARE @INCIDENCIA as VARCHAR(3)
SET @SUBDEL=?
SET @CICLO=?
SET @INCIDENCIA=?
if @CICLO='1'
begin
SELECT  SUBDEL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector=abc&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=1') as urlv
  FROM [sireca].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel
  end 
  else
  begin
  SELECT  SUBDEL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector=abc&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=2') as urlv
  FROM [sirecacobros].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel
  end
  ">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:Parameter DefaultValue="2" Name="?" />
                                                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
                    </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFF3CD">
                    <asp:GridView 
                        runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" Caption="RESULTADO POR INSPECTOR" 
                        CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSourceRGIncidencias" BorderColor="Black" BorderWidth="1px" 
                        BorderStyle="Solid" ID="GVRGIncidencias" Font-Size="10pt"><Columns>
<asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                SortExpression="INSPECTOR">
</asp:BoundField>
                            <asp:BoundField DataField="PATRONES_INICIAL" DataFormatString="{0:N0}" 
                                HeaderText="PATRONES_INICIAL" SortExpression="PATRONES_INICIAL">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
<asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" DataFormatString="{0:N0}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                DataNavigateUrlFormatString="detalle.aspx{0}" DataTextField="CREDITOS" 
                                DataTextFormatString="{0:N0}" HeaderText="CREDITOS" 
                                NavigateUrl="~/porIncPae/detalle.aspx" SortExpression="CREDITOS" 
                                Target="_blank" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:HyperLinkField>
<asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
</Columns>

<FooterStyle Font-Bold="True"></FooterStyle>

<HeaderStyle BackColor="#D4D0C8"></HeaderStyle>
</asp:GridView>

<asp:SqlDataSource runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CICLO as VARCHAR(1)
DECLARE @INCIDENCIA as VARCHAR(3)
SET @SUBDEL=?
SET @CICLO=?
SET @INCIDENCIA=?
if @CICLO='1'
begin
SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in ('122012','12013','22013','32013','42013','52013','62013') and ec.responsable=eco.responsable) as PATRONES_INICIAL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=1') as urlv
  FROM [sireca].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel,responsable
  order by subdel
  end 
  else
  begin
  SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in ('122012','12013','22013','32013','42013','52013','62013') and ec.responsable=eco.responsable) as PATRONES_INICIAL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=2') as urlv
  FROM [sirecacobros].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel,responsable
  order by subdel
  end
" ID="SqlDataSourceRGIncidencias">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:Parameter DefaultValue="1" Name="?" />
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
</asp:SqlDataSource>

                            </td>
                            <td bgcolor="#BCC7D8">
                    <asp:GridView 
                        runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" Caption="RESULTADO POR INSPECTOR" 
                        CaptionAlign="Left" CellPadding="1" CellSpacing="1" 
                        DataSourceID="SqlDataSourceRGIncidencias0" BorderColor="Black" BorderWidth="1px" 
                        BorderStyle="Solid" ID="GVRGIncidencias3" Font-Size="10pt"><Columns>
<asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                                SortExpression="INSPECTOR">
</asp:BoundField>
                            <asp:BoundField DataField="PATRONES_INICIAL" DataFormatString="{0:N0}" 
                                HeaderText="PATRONES_INICIAL" SortExpression="PATRONES_INICIAL">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
<asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                                SortExpression="PATRONES" DataFormatString="{0:N0}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                DataNavigateUrlFormatString="detalle.aspx{0}" DataTextField="CREDITOS" 
                                DataTextFormatString="{0:N0}" HeaderText="CREDITOS" 
                                NavigateUrl="~/porIncPae/detalle.aspx" SortExpression="CREDITOS" 
                                Target="_blank" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:HyperLinkField>
<asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                                SortExpression="IMPORTE" DataFormatString="{0:C}">
                            <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
</Columns>

<FooterStyle Font-Bold="True"></FooterStyle>

<HeaderStyle BackColor="#D4D0C8"></HeaderStyle>
</asp:GridView>

<asp:SqlDataSource runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CICLO as VARCHAR(1)
DECLARE @INCIDENCIA as VARCHAR(3)
SET @SUBDEL=?
SET @CICLO=?
SET @INCIDENCIA=?
if @CICLO='1'
begin
SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in ('122012','12013','22013','32013','42013','52013','62013') and ec.responsable=eco.responsable) as PATRONES_INICIAL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=1') as urlv
  FROM [sireca].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel,responsable
  order by subdel
  end 
  else
  begin
  SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in ('122012','12013','22013','32013','42013','52013','62013') and ec.responsable=eco.responsable) as PATRONES_INICIAL
,count(distinct(reg#patronal)) as PATRONES
,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;periodo=all&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;c=2') as urlv
  FROM [sirecacobros].[dbo].[eco] as eco
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null  
  and subdel=@SUBDEL
  group by subdel,responsable
  order by subdel
  end
" ID="SqlDataSourceRGIncidencias0">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                            <asp:Parameter DefaultValue="2" Name="?" />
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
</asp:SqlDataSource>

                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFF3CD">
                
                                                        <asp:GridView runat="server" 
                        AllowSorting="True" AutoGenerateColumns="False" 
                        Caption="RESULTADO POR INSPECTOR Y PERIODO" CaptionAlign="Left" CellPadding="1" 
                        CellSpacing="1" 
                        DataSourceID="SqlDataSourceRGIncidenciasPeriodo" BorderColor="Black" 
                        BorderWidth="1px" BorderStyle="Solid" ID="GVRGIncidencias0" 
                        Font-Size="10pt"><Columns>
<asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" SortExpression="INSPECTOR" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" SortExpression="PERIODO">
</asp:BoundField>
                                                                <asp:BoundField DataField="PATRONES_INICIAL" DataFormatString="{0:N0}" 
                                                                    HeaderText="PATRONES_INICIAL" SortExpression="PATRONES_INICIAL">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
<asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES" DataFormatString="{0:N}">
                                                                <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
                                                                <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                                                    DataNavigateUrlFormatString="detalle.aspx{0}" DataTextField="CREDITOS" 
                                                                    HeaderText="CREDITOS" NavigateUrl="~/porIncPae/detalle.aspx" 
                                                                    SortExpression="CREDITOS" Target="_blank" DataTextFormatString="{0:N0}" >
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:HyperLinkField>
<asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" DataFormatString="{0:C}">
                                                                <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
</Columns>

<FooterStyle Font-Bold="True"></FooterStyle>

<HeaderStyle BackColor="#BFBBB4"></HeaderStyle>
</asp:GridView>

                                                        <asp:SqlDataSource runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CICLO as VARCHAR(1)
DECLARE @INCIDENCIA as VARCHAR(3)
SET @SUBDEL=?
SET @CICLO=?
SET @INCIDENCIA=?
if @CICLO='1'
begin
SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in (eco.fechaeco) and ec.responsable=eco.responsable) as PATRONES_INICIAL
  ,count(distinct(reg#patronal)) as PATRONES,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;periodo='+convert(varchar(6),fechaeco)+'&amp;c=1') as urlv
  FROM [sireca].[dbo].[eco]
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null
  and subdel=@SUBDEL
  group by subdel,responsable,fechaeco
  order by subdel,responsable,fechaeco
  
  end 
  else
  begin
  SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in (eco.fechaeco) and ec.responsable=eco.responsable) as PATRONES_INICIAL
  ,count(distinct(reg#patronal)) as PATRONES,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;periodo='+convert(varchar(6),fechaeco)+'&amp;c=2') as urlv
  FROM [sirecacobros].[dbo].[eco]
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null
  and subdel=@SUBDEL
  group by subdel,responsable,fechaeco
  order by subdel,responsable,fechaeco
  end
" ID="SqlDataSourceRGIncidenciasPeriodo">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:Parameter DefaultValue="1" Name="?" />
                                                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
</asp:SqlDataSource>

                            </td>
                            <td bgcolor="#BCC7D8">
                
                                                        <asp:GridView runat="server" 
                        AllowSorting="True" AutoGenerateColumns="False" 
                        Caption="RESULTADO POR INSPECTOR Y PERIODO" CaptionAlign="Left" CellPadding="1" 
                        CellSpacing="1" 
                        DataSourceID="SqlDataSourceRGIncidenciasPeriodo0" BorderColor="Black" 
                        BorderWidth="1px" BorderStyle="Solid" ID="GVRGIncidencias4" 
                        Font-Size="10pt"><Columns>
<asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" SortExpression="INSPECTOR" ReadOnly="True"></asp:BoundField>
<asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" SortExpression="PERIODO">
</asp:BoundField>
                                                                <asp:BoundField DataField="PATRONES_INICIAL" DataFormatString="{0:N0}" 
                                                                    HeaderText="PATRONES_INICIAL" SortExpression="PATRONES_INICIAL">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
<asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES" DataFormatString="{0:N}">
                                                                <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
                                                                <asp:HyperLinkField DataNavigateUrlFields="urlv" 
                                                                    DataNavigateUrlFormatString="detalle.aspx{0}" DataTextField="CREDITOS" 
                                                                    HeaderText="CREDITOS" NavigateUrl="~/porIncPae/detalle.aspx" 
                                                                    SortExpression="CREDITOS" Target="_blank" DataTextFormatString="{0:N0}" >
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                </asp:HyperLinkField>
<asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" DataFormatString="{0:C}">
                                                                <ItemStyle HorizontalAlign="Right" />
</asp:BoundField>
</Columns>

<FooterStyle Font-Bold="True"></FooterStyle>

<HeaderStyle BackColor="#BFBBB4"></HeaderStyle>
</asp:GridView>

                                                        <asp:SqlDataSource runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                        
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL as VARCHAR(2)
DECLARE @CICLO as VARCHAR(1)
DECLARE @INCIDENCIA as VARCHAR(3)
SET @SUBDEL=?
SET @CICLO=?
SET @INCIDENCIA=?
if @CICLO='1'
begin
SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in (eco.fechaeco) and ec.responsable=eco.responsable) as PATRONES_INICIAL
  ,count(distinct(reg#patronal)) as PATRONES,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;periodo='+convert(varchar(6),fechaeco)+'&amp;c=1') as urlv
  FROM [sireca].[dbo].[eco]
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null
  and subdel=@SUBDEL
  group by subdel,responsable,fechaeco
  order by subdel,responsable,fechaeco
  
  end 
  else
  begin
  SELECT  SUBDEL,(SELECT upper(uf.nombre) FROM fiscamovil.dbo.usuarios as uf where uf.id =responsable) AS INSPECTOR
  ,(case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end ) as PERIODO
,(select count(distinct(reg#patronal)) from sireca.dbo.eco as ec where ec.subdel=eco.subdel and ec.fechaeco in (eco.fechaeco) and ec.responsable=eco.responsable) as PATRONES_INICIAL
  ,count(distinct(reg#patronal)) as PATRONES,count(*) as CREDITOS, sum(omision) as IMPORTE
,('?subdel='+@SUBDEL+'&amp;idinspector='+responsable+'&amp;inc='+convert(varchar(2),@INCIDENCIA)+'&amp;periodo='+convert(varchar(6),fechaeco)+'&amp;c=2') as urlv
  FROM [sirecacobros].[dbo].[eco]
  where incidencia=@INCIDENCIA
  and fechaeco in ('122012','12013','22013','32013','42013','52013','62013')
  and responsable is not null
  and subdel=@SUBDEL
  group by subdel,responsable,fechaeco
  order by subdel,responsable,fechaeco
  end
" ID="SqlDataSourceRGIncidenciasPeriodo0">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                                <asp:Parameter DefaultValue="1" Name="?" />
                                                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="00" Name="?" 
                                                                    PropertyName="SelectedValue" />
                                                            </SelectParameters>
</asp:SqlDataSource>

                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>

                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                
                                                        </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

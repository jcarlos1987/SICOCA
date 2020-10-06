<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="documentosgenerados.aspx.vb" Inherits="WebSIRECA.documentosgenerados" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
<div class="btn-group input-prepend">
    <asp:DropDownList ID="DDLSubdel" runat="server" ToolTip="SUBDELEGACION" 
        AutoPostBack="True" Width="100px">
    </asp:DropDownList>
    <asp:TextBox ID="TBBuscar" runat="server" Width="280px"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
            WatermarkCssClass="watermarked" runat="server" TargetControlID="TBBuscar" 
            WatermarkText="CODIGO A BUSCAR"></asp:TextBoxWatermarkExtender> 
<span class="add-on">
    <asp:LinkButton ID="LBBuscar" runat="server" CssClass ="btn">Buscar</asp:LinkButton>
</span> 
</div> 
</center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Font-Size="10pt" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
        CssClass="table-bordered" EmptyDataText="SIN RESULTADOS">
        <Columns>
            <asp:BoundField DataField="IMPRESO" HeaderText="IMPRESO" ReadOnly="True" 
                SortExpression="IMPRESO" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPRIMIO" HeaderText="POR" ReadOnly="True" 
                SortExpression="IMPRIMIO" />
            <asp:BoundField DataField="DOCUMENTO" HeaderText="DOCUMENTO" ReadOnly="True" 
                SortExpression="DOCUMENTO" />
            <asp:BoundField DataField="FACTURA_ASIGNADO" HeaderText="FACTURA ASIGNADO" 
                ReadOnly="True" SortExpression="FACTURA_ASIGNADO" 
                DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="REGPAT" HeaderText="REGISTRO PATRONAL" ReadOnly="True" 
                SortExpression="REGPAT" />
            <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                SortExpression="RAZON" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                SortExpression="OBSERVACION" />
        </Columns>
        <EmptyDataRowStyle ForeColor="#CC0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CLAVE as VARCHAR(50)
DECLARE @CLAVE_ID as VARCHAR(50)
SET @CLAVE=?
SET @CLAVE_ID=(SELECT top 1 k.IM_ID
 FROM [sirecaemisiones].[dbo].[hist_impresion] as k
 where  @CLAVE like convert(varchar(10),k.IM_ID)+'_'+k.[IM_KEY])
SELECT [IM_FECHA_IMPRESION] AS IMPRESO
      ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[IM_USER_PRINT]) AS IMPRIMIO
      ,[IM_TIPO_IMPRESION] AS DOCUMENTO
      ,[IM_FECHA_ASIGNACION] AS FACTURA_ASIGNADO
      ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[IM_INSPECTOR]) AS INSPECTOR
      ,[IM_REGPAT] AS REGPAT
      ,[IM_RAZON_SOCIAL] AS RAZON
      ,[IM_CREDITO] AS CREDITO
      ,[IM_PERIODO] AS PERIODO
      ,[IM_OBSERVACION] AS OBSERVACION      
  FROM [sirecaemisiones].[dbo].[hist_impresion]
 where  [IM_KEY]=substring(@CLAVE,len(@CLAVE_ID)+2,len([IM_KEY])+len(@CLAVE_ID))
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBBuscar" 
                DefaultValue="T11111111112222222333333333T" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" HorizontalAlign="Center" Font-Size="10pt" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="1" CellSpacing="1" 
        CssClass="table-bordered" EmptyDataText="SIN RESULTADOS">
        <Columns>
            <asp:BoundField DataField="IMPRESO" HeaderText="IMPRESO" ReadOnly="True" 
                SortExpression="IMPRESO" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IMPRIMIO" HeaderText="POR" ReadOnly="True" 
                SortExpression="IMPRIMIO" />
            <asp:BoundField DataField="DOCUMENTO" HeaderText="DOCUMENTO" ReadOnly="True" 
                SortExpression="DOCUMENTO" />
            <asp:BoundField DataField="FACTURA_ASIGNADO" HeaderText="FACTURA ASIGNADO" 
                ReadOnly="True" SortExpression="FACTURA_ASIGNADO" 
                DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                SortExpression="INSPECTOR" />
            <asp:BoundField DataField="REGPAT" HeaderText="REGISTRO PATRONAL" ReadOnly="True" 
                SortExpression="REGPAT" />
            <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                SortExpression="RAZON" />
            <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                SortExpression="CREDITO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                SortExpression="PERIODO" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                SortExpression="OBSERVACION" />
        </Columns>
        <EmptyDataRowStyle ForeColor="#CC0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @CLAVE as VARCHAR(50)
DECLARE @CLAVE_ID as VARCHAR(50)
SET @CLAVE=?
SET @CLAVE_ID=(SELECT top 1 k.IM_ID
 FROM [sirecaemisiones].[dbo].[hist_impresion] as k
 where  @CLAVE like convert(varchar(10),k.IM_ID)+k.[IM_KEY])
SELECT [IM_FECHA_IMPRESION] AS IMPRESO
      ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[IM_USER_PRINT]) AS IMPRIMIO
      ,[IM_TIPO_IMPRESION] AS DOCUMENTO
      ,[IM_FECHA_ASIGNACION] AS FACTURA_ASIGNADO
      ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE id=[IM_INSPECTOR]) AS INSPECTOR
      ,[IM_REGPAT] AS REGPAT
      ,[IM_RAZON_SOCIAL] AS RAZON
      ,[IM_CREDITO] AS CREDITO
      ,[IM_PERIODO] AS PERIODO
      ,[IM_OBSERVACION] AS OBSERVACION      
  FROM [sirecaemisiones].[dbo].[hist_impresion]
 where [IM_KEY]=substring(@CLAVE,len(@CLAVE_ID)+1,len([IM_KEY])+len(@CLAVE_ID))
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBBuscar" 
                DefaultValue="T11111111112222222333333333T" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

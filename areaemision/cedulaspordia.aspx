<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="cedulaspordia.aspx.vb" Inherits="WebSIRECA.cedulaspordia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenido" runat="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
    <center>
        <div class="btn-group input-prepend">
            <span class="add-on">
                <asp:Label ID="Label1" runat="server" Text="Cedulas del "></asp:Label>
            </span>
            <asp:TextBox ID="TBFechIni" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
            <asp:CalendarExtender ID="caext1" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechIni">
            </asp:CalendarExtender>
            <span class="add-on">
                <asp:Label ID="Label2" runat="server" Text=" al "></asp:Label>
            </span>
            <asp:TextBox ID="TBFechFin" runat="server" BorderStyle="Solid" BorderWidth="1px" MaxLength="10" Width="80px" BorderColor="#BCC7D8"></asp:TextBox>
            <asp:CalendarExtender ID="caext2" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="TBFechFin"></asp:CalendarExtender>
        </div>
        <br />
        <div class="btn-group input-prepend">
            <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
                Width="120px" >
            </asp:DropDownList>
            <asp:DropDownList ID="DDLTEco" runat="server" 
                Width="124px" >
                <asp:ListItem Value="%">C.O.P. Y R.C.V.</asp:ListItem>
                <asp:ListItem Value="COP">C.O.P</asp:ListItem>
                <asp:ListItem Value="RCV">R.C.V.</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DDLTCedula" runat="server" >
                <asp:ListItem Value="%">Cam. 31, 09 Y Cancelación</asp:ListItem>
                <asp:ListItem Value="CAMBIO A LA 31">Cambio a la 31</asp:ListItem>
                <asp:ListItem Value="NO LOCALIZADO">No Localizado</asp:ListItem>
                <asp:ListItem Value="CANCELACION">Cancelación</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DDLTCredito" runat="server" 
                Width="180px" >
                <asp:ListItem Value="%">Credito Origen y Multa</asp:ListItem>
                <asp:ListItem Value="ORIGEN">Crédito Origen</asp:ListItem>
                <asp:ListItem Value="MULTA">Crédito Multa</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="BActualizar" runat="server" Text="Actualizar" CssClass="btn" /> 
        </div>
        <asp:GridView ID="GridViewG" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceG" 
            Caption="&lt;strong&gt;CEDULAS CREADAS&lt;s/trong&gt;">
            <Columns>
                <asp:BoundField DataField="DIAS" DataFormatString="{0:N0}" HeaderText="DIAS" 
                    ReadOnly="True" SortExpression="DIAS" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="FOLIOS" DataFormatString="{0:N0}" 
                    HeaderText="FOLIOS" ReadOnly="True" SortExpression="FOLIOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PATRONES" DataFormatString="{0:N0}" 
                    HeaderText="PATRONES" ReadOnly="True" SortExpression="PATRONES">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceG" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO_ECO AS VARCHAR(5)
DECLARE @TIPO_CEDULA AS VARCHAR(20)
DECLARE @TIPO_CREDITO AS VARCHAR(20)
DECLARE @FECHA_INI AS DATETIME
DECLARE @FECHA_FIN AS DATETIME
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @TIPO_CEDULA=? --NO LOCALIZADO, CAMBIO A LA 31, CANCELACION
SET @TIPO_CREDITO=? --ORIGEN,MULTA
SET @FECHA_INI=?
SET @FECHA_FIN=?
SELECT
-- ('?dia='+CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103)+'&amp;sudel='+@SUBDEL+'&amp;tipoeco='+@TIPO_ECO+'&amp;tipocedula='+@TIPO_CEDULA+'&amp;tipocredito='+@TIPO_CREDITO) AS VURL
count(distinct CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103)) AS DIAS
,COUNT(DISTINCT V_FOLIO_P1) AS FOLIOS
,COUNT(DISTINCT [V_REGPAT]) AS PATRONES
,COUNT(*) AS CREDITOS 
,SUM([V_OMISION]) AS IMPORTE
FROM (
SELECT 
      [V_ORI_MUL]
      ,[V_TIPO_ECO]
      ,[V_SUBDEL]
      ,[V_REGPAT]
      ,[V_RAZON_SOCIAL]
      ,[V_CREDITO]
      ,[V_COTIZ]
      ,[V_OMISION]
      ,[V_PERIODO]
      ,[V_SECTOR]
      ,(CASE 
      WHEN V_INC_CAPTURA='9' THEN 'NO LOCALIZADO' 
      WHEN V_INC_CAPTURA='2' THEN 'CAMBIO A LA 31'
      ELSE 'CANCELACION'
      END) AS TIPO_CEDULA
      ,((CASE 
      WHEN V_INC_CAPTURA='9' THEN 'NO LOCALIZADO' 
      WHEN V_INC_CAPTURA='2' THEN 'CAMBIO A LA 31'
      ELSE 'CANCELACION'
      END)+[V_FOLIO_P1]) as [V_FOLIO_P1]
      ,[V_FECHA_P1_TURNADO]
      ,[V_FOLIO_P1_OBSERVACION]
      ,[V_CIFRA_CONTROL]
      ,[V_TD]
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE [V_FECHA_P1_TURNADO] BETWEEN @FECHA_INI AND @FECHA_FIN
  AND [V_SUBDEL] LIKE @SUBDEL AND V_TIPO_ECO LIKE @TIPO_ECO AND [V_ORI_MUL] LIKE @TIPO_CREDITO
  ) AS R1
  WHERE TIPO_CEDULA LIKE @TIPO_CEDULA
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTEco" DefaultValue="x" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTCedula" DefaultValue="x" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTCredito" DefaultValue="x" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2014" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2014" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewCedulas" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSourceCedulas" 
            Caption="&lt;strong&gt;CEDULAS POR DÍA&lt;/strong&gt;">
            <Columns>
                <asp:BoundField DataField="FECHA" DataFormatString="{0:D}" HeaderText="FECHA" 
                    ReadOnly="True" SortExpression="FECHA" />
                <asp:BoundField DataField="FOLIOS" DataFormatString="{0:N0}" 
                    HeaderText="FOLIOS" ReadOnly="True" SortExpression="FOLIOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            Text='<%# Eval("PATRONES", "{0:N0}") %>' OnClick ='<%# "javascript:window.open(""cedulaspordiadetalles.aspx" & Eval("VURL") & "&pat=" & Eval("PATRONES") & """,""imprimir"",""top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1"");" %>' ></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCedulas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="DECLARE @SUBDEL AS VARCHAR(2)
DECLARE @TIPO_ECO AS VARCHAR(5)
DECLARE @TIPO_CEDULA AS VARCHAR(20)
DECLARE @TIPO_CREDITO AS VARCHAR(20)
DECLARE @FECHA_INI AS DATETIME
DECLARE @FECHA_FIN AS DATETIME
SET @SUBDEL=?
SET @TIPO_ECO=?
SET @TIPO_CEDULA=? --NO LOCALIZADO, CAMBIO A LA 31, CANCELACION
SET @TIPO_CREDITO=? --ORIGEN,MULTA
SET @FECHA_INI=?
SET @FECHA_FIN=?
SELECT ('?dia='+CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103)+'&amp;subdel='+@SUBDEL+'&amp;tipoeco='+@TIPO_ECO+'&amp;tipocedula='+@TIPO_CEDULA+'&amp;tipocredito='+@TIPO_CREDITO) AS VURL
,CONVERT(DATETIME,CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103)) AS FECHA
,COUNT(DISTINCT V_FOLIO_P1) AS FOLIOS
,COUNT(DISTINCT [V_REGPAT]) AS PATRONES
,COUNT(*) AS CREDITOS 
,SUM([V_OMISION]) AS IMPORTE
FROM (
SELECT 
      [V_ORI_MUL]
      ,[V_TIPO_ECO]
      ,[V_SUBDEL]
      ,[V_REGPAT]
      ,[V_RAZON_SOCIAL]
      ,[V_CREDITO]
      ,[V_COTIZ]
      ,[V_OMISION]
      ,[V_PERIODO]
      ,[V_SECTOR]
      ,(CASE 
      WHEN V_INC_CAPTURA='9' THEN 'NO LOCALIZADO' 
      WHEN V_INC_CAPTURA='2' THEN 'CAMBIO A LA 31'
      ELSE 'CANCELACION'
      END) AS TIPO_CEDULA
      ,((CASE 
      WHEN V_INC_CAPTURA='9' THEN 'NO LOCALIZADO' 
      WHEN V_INC_CAPTURA='2' THEN 'CAMBIO A LA 31'
      ELSE 'CANCELACION'
      END)+[V_FOLIO_P1]) as [V_FOLIO_P1]
      ,[V_FECHA_P1_TURNADO]
      ,[V_FOLIO_P1_OBSERVACION]
      ,[V_CIFRA_CONTROL]
      ,[V_TD]
  FROM [sirecaemisiones].[dbo].[eco]
  WHERE [V_FECHA_P1_TURNADO] BETWEEN @FECHA_INI AND @FECHA_FIN
  AND [V_SUBDEL] LIKE @SUBDEL AND V_TIPO_ECO LIKE @TIPO_ECO AND [V_ORI_MUL] LIKE @TIPO_CREDITO
  ) AS R1
  WHERE TIPO_CEDULA LIKE @TIPO_CEDULA
  GROUP BY CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTEco" DefaultValue="x" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTCedula" DefaultValue="x" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLTCredito" DefaultValue="x" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBFechIni" DefaultValue="01/01/2014" Name="?" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TBFechFin" DefaultValue="01/01/2014" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </center>
    </div>
</asp:Content>

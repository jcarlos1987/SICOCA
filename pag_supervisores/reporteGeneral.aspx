<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="reporteGeneral.aspx.vb" Inherits="WebSIRECA.reporteGeneral1" %>

<asp:Content ID="conten1" runat ="server" ContentPlaceHolderID ="head" >
    <title>Resultados</title>
    
    <script type="text/javascript">
        var GB_ROOT_DIR = '../greybox/';
    </script>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../greybox/AJS.js" type="text/javascript"></script>
    <script src="../greybox/AJS_fx.js" type="text/javascript"></script>
    <script src="../greybox/gb_scripts.js" type="text/javascript"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    <asp:Panel ID="Panel3" runat="server" BackColor="#BDCBD6">
        
                <br />
                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Subd.:"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" DataTextField="subdel" 
                    DataValueField="subdel">
                </asp:DropDownList>
        
        <asp:HiddenField ID="HFsubdel" runat="server" Value="%" />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Rale:" Font-Bold="True"></asp:Label>&nbsp;
            <asp:DropDownList ID="DDLRale" runat="server" 
                DataSourceID="SqlDataSourceRaleList" DataTextField="name" DataValueField="name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceRaleList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                
                
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 6 [name]
      ,[del]
      ,[subdel]
      ,[origen]
      ,[tipo]
      ,[fecha]
  FROM [rale].[dbo].[tablas]
WHERE [subdel]=? and [name] like '%COP%'
order by [fecha] desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;            
            <asp:Label ID="Label2" runat="server" Text="Periodo:" Font-Bold="True"></asp:Label>&nbsp;
                <asp:DropDownList ID="DDLMes" runat="server">
                    <asp:ListItem Value="01">Enero</asp:ListItem>
                    <asp:ListItem Value="02">Febrero</asp:ListItem>
                    <asp:ListItem Value="03">Marzo</asp:ListItem>
                    <asp:ListItem Value="04">Abril</asp:ListItem>
                    <asp:ListItem Value="05">Mayo</asp:ListItem>
                    <asp:ListItem Value="06">Junio</asp:ListItem>
                    <asp:ListItem Value="07">Julio</asp:ListItem>
                    <asp:ListItem Value="08">Agosto</asp:ListItem>
                    <asp:ListItem Value="09">Septiembre</asp:ListItem>
                    <asp:ListItem Value="10">Octubre</asp:ListItem>
                    <asp:ListItem Value="11">Noviembre</asp:ListItem>
                    <asp:ListItem Value="12">Diciembre</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DDLAnio" runat="server" 
                    ToolTip="PERIODO">
                </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceCrarT" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where actividad = 'abc'"></asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Text="Actualizar" BorderColor="#4D6082" 
                    BorderStyle="Solid" BorderWidth="1px" />

            
             <%  If Session.Item("SIRECAchmod9") Is Nothing Then
                 ElseIf Session.Item("SIRECAchmod7").ToString.Equals("x") And (Session.Item("SIRECAsubdel").ToString.Equals("00")) And Session.Item("SIRECAchmod8").ToString.Equals("l") Then
                            %>
                            <asp:Button ID="BActualizar" runat="server" Text="Crear EMA vs LGP" 
                    BorderColor="#4D6082" BorderStyle="Solid" BorderWidth="1px" />
                      <%
                        End If
                        %>
            <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSourceCrarT">
            </asp:GridView>
            &nbsp;&nbsp;</asp:Panel>
    <asp:GridView ID="GVTotal" runat="server" AutoGenerateColumns="False" 
        Caption="TOTAL" DataSourceID="SqlDataSourceTotal" HorizontalAlign="Center" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3">
        <Columns>
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "detallesSeleccionReporteGeneral.aspx?busqueda=TODO&ema=" & Eval("nomema") %>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
                <ControlStyle Font-Bold="False" />
                <ItemStyle Font-Bold="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                SortExpression="COTIZANTES" DataFormatString="{0:N0}" />
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" ReadOnly="True" 
                SortExpression="IMPORTE" DataFormatString="{0:C}" />
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
    <asp:SqlDataSource ID="SqlDataSourceTotal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 0 count([PAGADO POR]) as [PATRONES]
,'0' as [COTIZANTES]
,'0' as [IMPORTE]
,'0' as [nomema]
FROM [sireca].[dbo].[EMMA33010612]"></asp:SqlDataSource>
    <asp:GridView ID="GVDTotal" runat="server" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px" Caption="DETALLES DEL TOTAL" 
        CellPadding="3" DataSourceID="SqlDataSourceDTotal" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="tipodepago" HeaderText="PERIODO DE PAGO" 
                NullDisplayText="SIN PAGO" SortExpression="tipodepago" />
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "detallesSeleccionReporteGeneral.aspx?busqueda=DETALLE&ema=" & Eval("nomema") & "&tipodepago=" & Eval("tipodepago")%>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                SortExpression="COTIZANTES" DataFormatString="{0:N0}" />
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
            <asp:BoundField />
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
    <asp:SqlDataSource ID="SqlDataSourceDTotal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT top 0 'x' as [tipodepago]
,'0' as [PATRONES]
,'0' as [COTIZANTES]
,'0' as [IMPORTE]
,'0' as [nomema]
  FROM [sireca].[dbo].[EMMA33010312]
group by [tipodepago]"></asp:SqlDataSource>
<hr />
    <asp:GridView ID="GVDeben" runat="server" AutoGenerateColumns="False" 
        Caption="SALDOS EN RALE" DataSourceID="SqlDataSourceDeben" HorizontalAlign="Center" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4">
        <Columns>
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" 
                SortExpression="ESTADO" />
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "detallesSeleccionDeven.aspx?tipo=DEBEN&estado=" & Eval("ESTADO") & "&subdel=" & Eval("subdel") & "&anio=" & Eval("anio") & "&mes=" & Eval("mes") %>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                SortExpression="COTIZANTES" DataFormatString="{0:N0}" />
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
            <asp:BoundField />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDeben" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT [ESTADO]
	  ,'0' as PATRONES      
      ,'0' as COTIZANTES 
	  ,'0' as [IMPORTE]   
  FROM [sireca].[dbo].[TEMP]
where estado='expirado'
group by [ESTADO]"></asp:SqlDataSource>
    <asp:GridView ID="GVDDeben" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        Caption="DETALLES DE LOS SALDOS EN RALE" CellPadding="4" 
        DataSourceID="SqlDataSourceDDeben" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="INCIDENCIA" HeaderText="INCIDENCIA" 
                SortExpression="INCIDENCIA" NullDisplayText="SIN ATENDER" />
            <asp:TemplateField HeaderText="PATRONES" SortExpression="PATRONES">
                <ItemTemplate>
                    <asp:HyperLink title="Detalles" rel="gb_page_fs[]" ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "detallesSeleccionDeven.aspx?tipo=DDEBEN&incidencia=" & Eval("INCIDENCIA") & "&subdel=" & Eval("subdel") & "&anio=" & Eval("anio") & "&mes=" & Eval("mes") %>' 
                        Text='<%# Eval("PATRONES", "{0:N0}") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                SortExpression="COTIZANTES" DataFormatString="{0:N0}" />
            <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDDeben" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT TOP 0 [INCIDENCIA]
	  ,'0' as [PATRONES]
	  ,'0' as [COTIZANTES]
      ,'0' as [IMPORTE]
  FROM [sireca].[dbo].[TEMPDEBEN127_0_0_1]
group by [INCIDENCIA]"></asp:SqlDataSource>
        <br />
<% if(session.item("SIRECAsubdel")<>"00") then %>
    &nbsp;<script type="text/javascript">
              //document.getElementById('alerta').click();
    </script><% End if%>
    </div> 
</asp:Content>

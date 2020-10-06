<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/sitios/SiteCiclo1.Master" CodeBehind="buscadorvalidados.aspx.vb" Inherits="WebSIRECA.buscadorvalidados" %>
<asp:Content ID ="Content1" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="contenido" runat ="server"  ContentPlaceHolderID="ContentPlaceHolder1" >
<center>
    <div class="btn-group input-prepend">
    <span class="add-on"><i class="icon-search"></i></span>
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True" 
            Width="150px">
        </asp:DropDownList>
    <asp:TextBox ID="TBBuscar" runat="server" MaxLength="30" placeholder="CREDITO" 
        TabIndex="9"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" CssClass="btn">BUSCAR</asp:LinkButton>
</div>
</center>
    <div>
    
        <asp:GridView ID="GridViewBuscador" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceBuscador" CssClass="table-condensed" 
            AllowPaging="True" AllowSorting="True" Font-Size="8pt" 
            EmptyDataText="SIN RESULTADOS">
            <Columns>
                <asp:BoundField DataField="V_SUBDEL" HeaderText="SUBDEL" ReadOnly="True" 
                    SortExpression="V_SUBDEL" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_FOLIO" HeaderText="FOLIO" ReadOnly="True" 
                    SortExpression="V_FOLIO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_DESCRIPCION" HeaderText="DESCRIPCION" ReadOnly="True" 
                    SortExpression="V_DESCRIPCION" />
                <asp:BoundField DataField="V_CONFIRMADO" HeaderText="AGREGADO PARA FOLIAR" 
                    ReadOnly="True" SortExpression="V_CONFIRMADO" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_CONFIRMO" HeaderText="AGREGO" ReadOnly="True" 
                    SortExpression="V_CONFIRMO" />
                <asp:BoundField DataField="V_TURNADO" HeaderText="PARA TURNAR A" ReadOnly="True" 
                    SortExpression="V_TURNADO" DataFormatString="{0:d}" />
                <asp:BoundField DataField="V_TURNO" HeaderText="FOLIO CREADO" ReadOnly="True" 
                    SortExpression="V_TURNO" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_REGPAT" HeaderText="REGPAT" 
                    ReadOnly="True" SortExpression="V_REGPAT" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_RAZON_SOCIAL" HeaderText="RAZON SOCIAL" 
                    ReadOnly="True" SortExpression="V_RAZON_SOCIAL" />
                <asp:BoundField DataField="V_CREDITO" HeaderText="CREDITO" ReadOnly="True" 
                    SortExpression="V_CREDITO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_COTIZ" HeaderText="COTIZ" ReadOnly="True" 
                    SortExpression="V_COTIZ" DataFormatString="{0:N0}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="V_OMISION" HeaderText="IMPORTE" ReadOnly="True" 
                    SortExpression="V_OMISION" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="V_PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="V_PERIODO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_INC_CAPTURA" HeaderText="DILIGENCIA" ReadOnly="True" 
                    SortExpression="V_INC_CAPTURA" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_SECTOR" HeaderText="SECTOR" 
                    ReadOnly="True" SortExpression="V_SECTOR" Visible="False" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="V_TIPO_ECO" HeaderText="ECO" ReadOnly="True" 
                    SortExpression="V_TIPO_ECO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CEDULA_CREADA" DataFormatString="{0:d}" 
                    HeaderText="CEDULA CREADA" SortExpression="CEDULA_CREADA">
                <ItemStyle CssClass="btn-success" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CREADA_POR" HeaderText="POR" 
                    SortExpression="CREADA_POR">
                <ItemStyle CssClass="btn-success" />
                </asp:BoundField>
                <asp:BoundField DataField="PARA_CAMBIO_A" HeaderText="CAMBIO A" 
                    SortExpression="PARA_CAMBIO_A">
                <ItemStyle CssClass="btn-success" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHA_CAMBIO" DataFormatString="{0:d}" 
                    HeaderText="FECHA DEL CAMBIO" SortExpression="FECHA_CAMBIO">
                <ItemStyle CssClass="btn-success" HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="btn-info" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSourceBuscador" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" 
            SelectCommand="select V_SUBDEL
,V_ID_ECO
,V_FOLIO
,convert(datetime,V_CONFIRMADO,103) as V_CONFIRMADO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_CONFIRMO) as V_CONFIRMO
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=V_TURNADO) as V_TURNADO
,convert(datetime,V_TURNO,103) as V_TURNO
,V_DESCRIPCION 

,V_TIPO_ECO
,V_REGPAT
,V_RAZON_SOCIAL
,V_CREDITO
,V_COTIZ
,V_OMISION
,V_PERIODO
,V_INC_CAPTURA
,V_SECTOR

,[V_FECHA_CONFIRMACION_INC_P2] AS CEDULA_CREADA
,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=[V_CONFIRMO_INC_P2]) AS CREADA_POR
,[V_FOLIO_P2] as FOLIO_REGISTRO
,[V_FOLIO_P2_TURNADO_A] AS PARA_CAMBIO_A
,[V_FECHA_P2_TURNADO] AS FECHA_CAMBIO
from (
SELECT 
V_SUBDEL
,V_ID_ECO
,[V_FOLIO_P1] as V_FOLIO
,convert(varchar(10),[V_FECHA_CONFIRMACION_INC_P1],103) as V_CONFIRMADO
,[V_ID_CONFIRMO_P1] as V_CONFIRMO
,[V_FOLIO_P1_TURNADO_A] as V_TURNADO
,convert(varchar(10),[V_FECHA_P1_TURNADO],103) as V_TURNO
,[V_FOLIO_P1_OBSERVACION] as V_DESCRIPCION

,V_TIPO_ECO
,V_REGPAT
,V_RAZON_SOCIAL
,V_CREDITO
,V_COTIZ
,V_OMISION
,V_PERIODO
,V_INC_CAPTURA
,V_SECTOR

,[V_CONFIRMO_INC_P2]
,[V_FECHA_CONFIRMACION_INC_P2]
,[V_FOLIO_P2]
,[V_FOLIO_P2_TURNADO_A]
,[V_FECHA_P2_TURNADO]
FROM [sirecaemisiones].[dbo].[eco]
where V_SUBDEL like ? and V_CREDITO = ?
) as resultado
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TBBuscar" DefaultValue="9999999" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

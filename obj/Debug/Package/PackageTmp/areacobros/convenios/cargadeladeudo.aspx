<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="cargadeladeudo.aspx.vb" Inherits="WebSIRECA.cargadeladeudo" %>

<asp:Content ID ="contedtHead" runat ="server" ContentPlaceHolderID ="head" >
    <script src="../../bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/jquery-2.0.2.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-tooltip.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/bootstrap-dropdown.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID ="contenido1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
<center>
    <div>
        <asp:Panel ID="Panel2" runat="server" GroupingText="CARGA DEL ADEUDO" 
            CssClass ="well" Width="500px">
        <div class ="alert-danger ">CARGUE ARCHIVO NATIVO DEL ADEUDO.<i>(nombre del archivo, con la <strong>palabra COP</strong> ó <strong>RCV</strong> 
            segun el adeudo a cargar)</i><asp:HyperLink ID="HyperLink1" CssClass ="label label-info" runat="server" Target="_blank" NavigateUrl="~/manuales/CalculoConvenio.pdf">Ayuda</asp:HyperLink>
        </div>    
        <br />
            ADEUDO C.O.P.:<asp:FileUpload ID="FileUploadCarga1" runat="server" />
                <br />
            ADEUDO R.C.V.:<asp:FileUpload ID="FileUploadCarga2" runat="server" />
                 <br />
            <asp:LinkButton ID="LBCargar" runat="server" CssClass="btn btn-danger">&nbsp;&nbsp;CARGAR&nbsp;&nbsp;</asp:LinkButton>
        </asp:Panel> 
    <br />
        <asp:Panel ID="Panel1" runat="server" 
            GroupingText="CARGA DE LA TABLA DE ACTU./REC." 
            CssClass ="well" Width="500px">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" ShowHeader="False" EmptyDataText="NO SE ENCUENTRA CARGADA NINGUNA TABLA DE ACT./REC." 
                BackColor="#FAD55F">
                <Columns>
                    <asp:BoundField DataField="ULTIMO_PERIODO" HeaderText="ULTIMO_PERIODO" 
                        ReadOnly="True" SortExpression="ULTIMO_PERIODO" 
                        DataFormatString="ULTIMO PERIODO DE ACT./REC.  {0}," />
                    <asp:BoundField DataField="FECHA_CARGA" HeaderText="FECHA_CARGA" ReadOnly="True" 
                        SortExpression="FECHA_CARGA" DataFormatString=" CARGADA EL {0:d}" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
(SELECT TOP 1 PERIODO FROM [sirecacobros].[dbo].[tabActRec] order by [FEC_VIGENCIA] desc) AS ULTIMO_PERIODO
,(select crdate from sirecacobros.dbo.sysobjects where name = 'tabActRec') AS FECHA_CARGA">
            </asp:SqlDataSource>
            <div class ="text-error">
            CARGUE EL ARCHIVO NATIVO <strong>separado por TABULACION</strong>
            </div>
            <asp:FileUpload ID="FileUploadTabAcRec" runat="server" />
            <asp:LinkButton ID="LBTabActRec" runat="server" CssClass="btn btn-warning " >&nbsp;&nbsp;CARGAR&nbsp;&nbsp;</asp:LinkButton>
        </asp:Panel>
        
        
    </div>
</center>
</asp:Content>

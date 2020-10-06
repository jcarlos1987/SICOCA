<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/sitios/SiteCiclo1.Master" CodeBehind="cargarLGP.aspx.vb" Inherits="WebSIRECA.cargarLGP" %>
<asp:Content ID ="ContentH1" runat ="server" ContentPlaceHolderID ="head"  >
    
</asp:Content>
<asp:Content ID ="conten1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <center >
    <asp:Label ID="Label1" runat="server" Text="CARGA DEL LGP"></asp:Label><asp:Label
        ID="Label4" runat="server" 
    Text="(Archivo Zip generado por el sistema.)" Font-Italic="True" 
    ForeColor="#FF3300"></asp:Label><hr />
         <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="#BCC7D8" 
    BorderStyle="Solid" BorderWidth="1px" />
        <asp:Button ID="Button1" runat="server" Text="Cargar" 
    BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px" />
    <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
            ForeColor="#009900"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceDepuracionPRO" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="update [sireca].[dbo].[eco]
set cambiarIncidencia = 1
,horaCitatorio = null
,diasDisponibles = 0
,incidencia = 'PAGADO'
/*SELECT eco.REG#PATRONAL,lgp.[IMP_TOT],eco.omision
,eco.fechaEco,substring(lgp.[RC_PER],6,2)+substring(lgp.[RC_PER],1,4)
,eco.credito,lgp.[RC_CRED]*/
FROM [sireca].[dbo].[eco] as eco 
inner join 
(
SELECT (substring(lg.[RC_PATRON],2,8)+lg.[RC_MOD]) as REGPAT,lg.[RC_PER],lg.[RC_CRED],SUM(lg.[RC_IMP_TOT]) as [IMP_TOT] 
FROM [lgp].[dbo].[RC] as lg 
where lg.[RC_DOC] in ('01','02') 
group by (substring(lg.[RC_PATRON],2,8)+lg.[RC_MOD]),lg.[RC_PER],lg.[RC_CRED]
) as lgp 
on substring(eco.[REG#PATRONAL],1,10) = lgp.REGPAT
AND eco.fechaEco=(substring(lgp.[RC_PER],6,2)+substring(lgp.[RC_PER],1,4))
AND eco.credito=lgp.[RC_CRED]
WHERE 
eco.tipoeco in ('COP','COMP')
AND (eco.incidencia not in ('POR PROCESAR','PAGADO','RE','BD') or eco.incidencia is null)
AND lgp.[IMP_TOT]&gt;=eco.omision
select 'Depuracion por LGP Completa' as resultado">
                </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" Font-Bold="True" Font-Italic="True" 
                Font-Size="Large" ForeColor="#CC0000" ShowHeader="False">
            </asp:GridView>
    <br />
        <asp:Label ID="Label3" runat="server" Text="" Font-Bold="True" ForeColor="#003300"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        Caption="ULTIMO LGP" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" SortExpression="SUBDEL">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LGP" HeaderText="LGP DE" ReadOnly="True" 
                SortExpression="LGP" />
        </Columns>
        <HeaderStyle CssClass="btn-info" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
[RC_SUB] AS SUBDEL
,DATENAME(MONTH,MAX([RC_FEC_MOV])) + ' ' + DATENAME(YEAR,MAX([RC_FEC_MOV])) AS LGP
FROM [lgp].[dbo].[RC]
GROUP BY [RC_SUB]"></asp:SqlDataSource>
</center>
        </asp:Content>

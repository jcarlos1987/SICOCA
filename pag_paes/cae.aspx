<%@ Page Language="vb" MasterPageFile="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="cae.aspx.vb" Inherits="WebSIRECA.cae" %>

<asp:Content ID ="contend1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1"  >
    <div>    
        <asp:DropDownList ID="DDLSubdel" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DDLAnio" runat="server" 
            DataSourceID="SqlDataSourceAnio" DataTextField="ANIO" 
            DataValueField="ANIO" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceAnio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select year(FECH_ASIG) as ANIO
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=?
group by year(FECH_ASIG) order by year(FECH_ASIG) ">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DDLMes" runat="server" 
            DataSourceID="SqlDataSourceMes" DataTextField="MES" DataValueField="MES" 
            AutoPostBack="True">
        </asp:DropDownList>
    
        <asp:SqlDataSource ID="SqlDataSourceMes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select month(FECH_ASIG) as MES
FROM [sirecacobros].[dbo].[ecoTiposHistorial]
where subdel=?
group by month(FECH_ASIG) order by month(FECH_ASIG) ">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:Button ID="Button1" runat="server" Text="Exportar" />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourcePAE" AllowSorting="True" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CaptionAlign="Left" 
            CellPadding="3" Font-Size="10pt">
            <Columns>
                <asp:BoundField DataField="SUPERVISOR" HeaderText="SUPERVISOR" ReadOnly="True" 
                    SortExpression="SUPERVISOR" />
                <asp:BoundField DataField="ID_ASIGNO" HeaderText="ID_ASIGNO" 
                    SortExpression="ID_ASIGNO" />
                <asp:BoundField DataField="EJECUTOR" HeaderText="EJECUTOR" ReadOnly="True" 
                    SortExpression="EJECUTOR" />
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" ReadOnly="True" 
                    SortExpression="RAZON" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" ReadOnly="True" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="ADEUDO" HeaderText="ADEUDO" 
                    SortExpression="ADEUDO" />
                <asp:BoundField DataField="TD" HeaderText="TD" ReadOnly="True" 
                    SortExpression="TD" />
                <asp:BoundField DataField="INC" HeaderText="INC" ReadOnly="True" 
                    SortExpression="INC" />
                <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" />
                <asp:BoundField DataField="INC_CAP" HeaderText="INC_CAP" ReadOnly="True" 
                    SortExpression="INC_CAP" />
                <asp:BoundField DataField="FECH_CAP" HeaderText="FECH_CAP" 
                    SortExpression="FECH_CAP" />
                <asp:BoundField DataField="FECH_ASIG" HeaderText="FECH_ASIG" 
                    SortExpression="FECH_ASIG" />
                <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" 
                    SortExpression="OBSERVACION" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                <asp:BoundField DataField="SECTOR" HeaderText="SECTOR" 
                    SortExpression="SECTOR" />
                <asp:BoundField DataField="DOCUEMENTO" HeaderText="DOCUEMENTO" ReadOnly="True" 
                    SortExpression="DOCUEMENTO" />
                <asp:BoundField DataField="SUPERVISOR1" HeaderText="SUPERVISOR1" 
                    SortExpression="SUPERVISOR1" />
                <asp:BoundField DataField="FECH_CITATORIO" HeaderText="FECH_CITATORIO" 
                    SortExpression="FECH_CITATORIO" />
                <asp:BoundField DataField="FECH_DELIGENCIA" HeaderText="FECH_DELIGENCIA" 
                    SortExpression="FECH_DELIGENCIA" />
                <asp:BoundField DataField="RESUL_DELIGENCIA" HeaderText="RESUL_DELIGENCIA" 
                    ReadOnly="True" SortExpression="RESUL_DELIGENCIA" />
                <asp:BoundField DataField="RECIBO_PROVISIONAL" HeaderText="RECIBO_PROVISIONAL" 
                    SortExpression="RECIBO_PROVISIONAL" />
                <asp:BoundField DataField="FECH_RECIBO_PROVISIONAL" 
                    HeaderText="FECH_RECIBO_PROVISIONAL" SortExpression="FECH_RECIBO_PROVISIONAL" />
                <asp:BoundField DataField="TIPO_RUGRO" HeaderText="TIPO_RUGRO" 
                    SortExpression="TIPO_RUGRO" />
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
    
        <asp:SqlDataSource ID="SqlDataSourcePAE" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
	  UPPER((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=[ID_ASIGNO])) AS SUPERVISOR
	  ,[ID_ASIGNO]
	  ,UPPER((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=[ID_RESPONSABLE])) AS EJECUTOR
	  ,[REGPATR] AS REGPAT
	  ,UPPER([RAZON_SOCIAL]) AS RAZON
	  ,SUBSTRING([PERIODO],4,7) AS PERIODO
      ,[NUMCRED] AS CREDITO
      ,[ADEUDO] AS ADEUDO
      ,(SELECT '('+dr.docto+')'+dr.descripcion FROM sireca.dbo.doc_rale  as dr WHERE dr.docto=TD) AS TD
      ,(SELECT '('+ir.inc+')'+ir.descripcion FROM sireca.dbo.inc_rale as ir WHERE ir.inc=eth.INC) AS INC
      ,[DIAS] AS DIAS
      ,(SELECT (case when [CVE_DILIG_PAE]='x' then [ACTIVIDAD] else '('+[CVE_DILIG_PAE]+')'+[ACTIVIDAD] end) FROM [sireca].[dbo].[catalogo] WHERE [CVE_DILIG_PAE]=[INC_CAP]) AS INC_CAP
      ,[FECH_CAP] AS FECH_CAP      
      ,[FECH_ASIG] AS FECH_ASIG
      ,[OBSERVACION] AS OBSERVACION
      ,[tipoFile] AS TIPO
      ,[SECTOR] AS SECTOR
      ,(SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipo] WHERE [id_tipo]=[DOCUMENTO_ENTREGADO_id_tipo]) AS DOCUEMENTO
      ,[CLAVE_DEL_SUPERVISOR] AS SUPERVISOR
      ,[FECHA_CITATORIO] AS FECH_CITATORIO
      ,[FECHA_DE_LA_DILIGENCIA] AS FECH_DELIGENCIA
      ,(SELECT [desc_descrip] FROM [sirecacobros].[dbo].[cae_descripcion] WHERE [id_descrip]=[RESULTADO_DE_LA_DILIGENCIA_id_descrip]) AS RESUL_DELIGENCIA
      ,[RECIBO_PROVISIONAL] AS RECIBO_PROVISIONAL
      ,[FECHA_RECIBO_PROVISIONAL] AS FECH_RECIBO_PROVISIONAL
      ,[TIPO_RRUGRO] AS TIPO_RUGRO
      ,(case when [TIPO_TRABAJO]='MONTANIO' then 'MONTAÑO' else [TIPO_TRABAJO] end) AS TIPO_TRABAJO
      ,convert(datetime,PERIODO,103) as PERIODOF
  FROM [sirecacobros].[dbo].[ecoTiposHistorial] as eth
  WHERE GRUPO='PAE' 
  and subdel=? 
  and month(FECH_ASIG)=? and year(FECH_ASIG)=?
  ORDER BY REGPAT,PERIODOF">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLMes" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAnio" DefaultValue="0000" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo1.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default14" %>

<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
    
        <asp:Label ID="Label1" runat="server" 
            Text="LISTADO DE LOS NO LOCALIZADOS DE EMISIONES" Font-Bold="True"></asp:Label>
        <asp:DropDownList
            ID="DDLSubdel" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="ACTUALIZAR" />
        <asp:Button ID="Button2" runat="server" Text="Exportar" />
        <hr />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSource1" Font-Size="10pt" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="REGPAT" HeaderText="REGPAT" ReadOnly="True" 
                    SortExpression="REGPAT" />
                <asp:BoundField DataField="RAZON" HeaderText="RAZON" SortExpression="RAZON" />
                <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" 
                    SortExpression="CREDITO" />
                <asp:BoundField DataField="PERIODO" HeaderText="PERIODO" 
                    SortExpression="PERIODO" />
                <asp:BoundField DataField="MOV" HeaderText="MOV" SortExpression="MOV" />
                <asp:BoundField DataField="INC_RALE" HeaderText="INC_RALE" 
                    SortExpression="INC_RALE" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" 
                    SortExpression="IMPORTE" />
                <asp:BoundField DataField="INSPECTOR" HeaderText="INSPECTOR" ReadOnly="True" 
                    SortExpression="INSPECTOR" />
                <asp:BoundField DataField="FECH_CAP" HeaderText="FECH_CAP" 
                    SortExpression="FECH_CAP" />
                <asp:BoundField DataField="ULTIMA_VIGENCIA" HeaderText="ULTIMA_VIGENCIA" 
                    ReadOnly="True" SortExpression="ULTIMA_VIGENCIA" />
                <asp:BoundField DataField="TIPO" HeaderText="TIPO" ReadOnly="True" 
                    SortExpression="TIPO" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT substring(eco.[REG#PATRONAL],1,10) as REGPAT
,ptn.razonSocial as RAZON
,eco.[CREDITO]
,substring(rale.PERIODO,4,8) as PERIODO
,rale.MOV
,rale.inc as INC_RALE
,ptn.cotiz as COTIZANTES
,rale.IMPORTE
,(select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.id = eco.responsable) as INSPECTOR
,eco.fechaCaptura as FECH_CAP
,convert(varchar,month(ptn.vigencia))+'/'+convert(varchar,year(ptn.vigencia)) as ULTIMA_VIGENCIA
,case when (select count(modt.REG_PAT) from sirecacobros.dbo.casosMontanio as modt where (modt.REG_PAT+modt.[mod])=substring(eco.[REG#PATRONAL],1,10) and modt.CREDITOS=eco.credito and modt.sub=?)='1' then 'CASO MONTAÑO' else '' end TIPO
  FROM [sireca].[dbo].[eco] as eco 
  inner join
  sirecacobros.dbo.ralecoprcv33 as rale on 
  replace(rale.REGPATR,'-','')=substring(eco.[REG#PATRONAL],1,10) and rale.NUMCRED=eco.[CREDITO] 
  left join sireca.dbo.patrones as ptn on ptn.REGPAT=replace(rale.regpatr,'-','') and ptn.subdel=?
  where incidencia='9' and eco.subdel=? and rale.inc not in ('09') and mov in ('9999')
  group by eco.[REG#PATRONAL],eco.[CREDITO],rale.PERIODO,rale.IMPORTE,rale.inc,ptn.vigencia,rale.MOV,ptn.cotiz,eco.responsable,eco.fechaCaptura,ptn.razonSocial
  order by 1">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLSubdel" DefaultValue="00" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>

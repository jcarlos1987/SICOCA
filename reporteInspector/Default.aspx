<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebSIRECA._Default6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Subdel.:"></asp:Label><asp:TextBox ID="TBSubdel"
            runat="server">01</asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Periodo"></asp:Label>
        <asp:TextBox ID="TBPeriodo" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="INSPECTOR"></asp:Label>
        <asp:TextBox ID="TBInsp" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Actualizar" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceIspectores" HorizontalAlign="Center" 
            AllowSorting="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" EmptyDataText="Sin resultados" 
            Font-Size="9pt">
            <Columns>
                <asp:BoundField DataField="SUBDEL" HeaderText="SUBDEL" 
                    SortExpression="SUBDEL" />
                <asp:BoundField DataField="INSPEC." HeaderText="INSPEC." 
                    ReadOnly="True" SortExpression="INSPEC." />
                <asp:BoundField DataField="fechaEco" HeaderText="fechaEco" 
                    SortExpression="fechaEco" />
                <asp:BoundField DataField="PATR." DataFormatString="{0:N0}" 
                    HeaderText="PATR." ReadOnly="True" SortExpression="PATR.">
                </asp:BoundField>
                <asp:BoundField DataField="POR NOTIFICAR" DataFormatString="{0:N0}" 
                    HeaderText="POR NOTIFICAR" ReadOnly="True" SortExpression="POR NOTIFICAR">
                </asp:BoundField>
                <asp:BoundField DataField="NOTIFICADO" DataFormatString="{0:N0}" 
                    HeaderText="NOTIFICADO" ReadOnly="True" SortExpression="NOTIFICADO">
                </asp:BoundField>
                <asp:BoundField DataField="POR COB." DataFormatString="{0:N0}" 
                    HeaderText="POR COB." ReadOnly="True" SortExpression="POR COB." />
                <asp:BoundField DataField="PAGADO" DataFormatString="{0:N0}" 
                    HeaderText="PAGADO" ReadOnly="True" SortExpression="PAGADO" />
                <asp:BoundField DataField="AUT." DataFormatString="{0:N0}" HeaderText="AUT." 
                    ReadOnly="True" SortExpression="AUT." />
                <asp:BoundField DataField="POR PRO." DataFormatString="{0:N0}" 
                    HeaderText="POR PRO." ReadOnly="True" SortExpression="POR PRO." />
                <asp:BoundField DataField="E.C." DataFormatString="{0:N0}" HeaderText="E.C." 
                    ReadOnly="True" SortExpression="E.C." />
                <asp:BoundField DataField="E.M." DataFormatString="{0:N0}" HeaderText="E.M." 
                    ReadOnly="True" SortExpression="E.M." />
                <asp:BoundField DataField="E.I." DataFormatString="{0:N0}" HeaderText="E.I." 
                    ReadOnly="True" SortExpression="E.I." />
                <asp:BoundField DataField="R.E." DataFormatString="{0:N0}" HeaderText="R.E." 
                    ReadOnly="True" SortExpression="R.E." />
                <asp:BoundField DataField="EM.PROCURA." DataFormatString="{0:N0}" 
                    HeaderText="EM.PROCURA." ReadOnly="True" SortExpression="EM.PROCURA." />
                <asp:BoundField DataField="NO LOCALIZADO" DataFormatString="{0:N0}" 
                    HeaderText="NO LOCALIZADO" ReadOnly="True" SortExpression="NO LOCALIZADO" />
                <asp:BoundField DataField="COMV." DataFormatString="{0:N0}" HeaderText="COMV." 
                    ReadOnly="True" SortExpression="COMV." />
                <asp:BoundField DataField="CAM.SUB" DataFormatString="{0:N0}" 
                    HeaderText="CAM.SUB" ReadOnly="True" SortExpression="CAM.SUB" />
                <asp:BoundField DataField="BAJ.DEF." DataFormatString="{0:N0}" 
                    HeaderText="BAJ.DEF." ReadOnly="True" SortExpression="BAJ.DEF." />
                <asp:BoundField DataField="CREDITOS" DataFormatString="{0:N0}" 
                    HeaderText="CREDITOS" ReadOnly="True" SortExpression="CREDITOS">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE R.E." DataFormatString="{0:C}" 
                    HeaderText="IMPORTE R.E." ReadOnly="True" SortExpression="IMPORTE R.E.">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE SIN R.E." DataFormatString="{0:C}" 
                    HeaderText="IMPORTE SIN R.E." ReadOnly="True" SortExpression="IMPORTE SIN R.E.">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:C}" 
                    HeaderText="IMPORTE" ReadOnly="True" SortExpression="IMPORTE">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceIspectores" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
eco1.subdel as SUBDEL
--,[responsable]
,upper((select uf.nombre from fiscamovil.dbo.usuarios as uf where uf.id=eco1.[responsable])) as [INSPEC.]
,eco1.fechaEco
--,(select ci.ACTIVIDAD from sireca.dbo.catalogo as ci where ci.[CVE DILIG#]=incidencia) as INCIDENCIA
,count(distinct([REG#PATRONAL])) as [PATR.]
--,case when [incidencia]='9' then count(*) end as [NO LOCALIZADO]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='1') as [POR NOTIFICAR]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='2') as [NOTIFICADO]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='PP') as [POR COB.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='PAGADO') as [PAGADO]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='A') as [AUT.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='POR PROCESAR') as [POR PRO.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='EC') as [E.C.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='EM') as [E.M.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='EI') as [E.I.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='RE') as [R.E.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='13') as [EM.PROCURA.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='9') as [NO LOCALIZADO]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='13') as [COMV.]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='60') as [CAM.SUB]
,(select count(*) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='BD') as [BAJ.DEF.]
,count(*) as [CREDITOS]
,(select sum(eco2.omision) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia='RE') as [IMPORTE R.E.]
,(select sum(eco2.omision) from [sireca].[dbo].[eco] as eco2 where eco2.responsable=eco1.responsable
and eco2.fechaEco=eco1.fechaEco and eco2.subdel=eco1.subdel and eco2.incidencia not in('RE')) as [IMPORTE SIN R.E.]
,sum(eco1.[OMISION]) as [IMPORTE]
  FROM [sireca].[dbo].[eco] as eco1
where
eco1.responsable is not null
and subdel like ?+'%' and fechaEco like ?+'%'
--and ((select ci.ACTIVIDAD from sireca.dbo.catalogo as ci where ci.[CVE DILIG#]=incidencia)) like '%'
and ((select ci.nombre from fiscamovil.dbo.usuarios as ci where ci.[id]=responsable)) like ?+'%'
group by eco1.subdel,eco1.[responsable],eco1.fechaEco
order by 1,2">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBSubdel" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
<asp:ControlParameter ControlID="TBPeriodo" PropertyName="Text" DefaultValue="%" Name="?"></asp:ControlParameter>
                <asp:ControlParameter ControlID="TBInsp" DefaultValue="%" Name="?" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

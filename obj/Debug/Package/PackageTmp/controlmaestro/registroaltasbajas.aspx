<%@ Page MaintainScrollPositionOnPostback="true" Language="vb" MasterPageFile="~/sitios/SiteGeneral.Master" CodeBehind="registroaltasbajas.aspx.vb"
    Inherits="WebSIRECA.registroaltasbajas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenido" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="style16">
                    &nbsp;
                </td>
                <td>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                        DisplayAfter="50">
                        <ProgressTemplate>
                            <asp:Panel ID="Panel1" runat="server" BackColor="#FFD467" HorizontalAlign="Center"
                                Direction="LeftToRight">
                                CARGANDO...
                            </asp:Panel>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="style19">
                            <asp:Panel ID="Panel2" runat="server" BackColor="#99CB99" Width="400" 
                                Height="60px">
                                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel2"
                                    Radius="20" Corners="Right">
                                </asp:RoundedCornersExtender>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:ListBox ID="ListBoxUsuarios" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceUsuariosRegistrados"
                                                DataTextField="texto" DataValueField="valor" Rows="2" Width="100%" BackColor="#99CB99"
                                                Height="58px"></asp:ListBox>
                                            <asp:SqlDataSource ID="SqlDataSourceUsuariosRegistrados" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select upper(uf.[nombre]) as texto,uf.[id] as valor
from 
fiscamovil.dbo.usuarios as uf
where
uf.nombre like '%'+?+'%' order by texto ">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="TextBoxUsuarios" DefaultValue="%" Name="?" PropertyName="Text" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td class="style20">
                            &nbsp;&nbsp;
                        </td>
                        <td class="style21">
                            <asp:Panel ID="Panel3" runat="server" BackColor="#99CB99" Width="300px">
                                <asp:RoundedCornersExtender ID="Panel3_RoundedCornersExtender" runat="server" TargetControlID="Panel3"
                                    Radius="20">
                                </asp:RoundedCornersExtender>
                                <br />
                                &nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="TextBoxUsuarios" runat="server" BorderStyle="None" MaxLength="50"
                                    Width="90%" AutoPostBack="True" BackColor="#99CB99"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="TBE1" runat="server" TargetControlID="TextBoxUsuarios"
                                    WatermarkCssClass="watermarked" WatermarkText="&nbsp;&nbsp;USUARIO A BUSCAR...">
                                </asp:TextBoxWatermarkExtender>
                                <br />
                                &nbsp;
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; vertical-align: top" class="style11" colspan="3">
                            <asp:Panel ID="Panel4" runat="server" BackColor="#304362" Height="100%" 
                                Width="900px" Font-Size="9pt">
                                <br />
                                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" Radius="30"
                                    TargetControlID="Panel4" Corners="Right">
                                </asp:RoundedCornersExtender>
                                <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>"
                                    
                                    
                                    
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="select top 1 
upper(uf.[nombre]) as uf_nombre
,uf.[user] as uf_usuario
,uf.[pwd] as uf_pasword
,upper(uf.cargo) as uf_cargo
,(case when uf.email is null then '-' else uf.email end) as uf_correo
,(case when us.del is null then uf.del else us.del end) as us_del
,(case when us.subdel is null then uf.subdel else us.subdel end) as us_subdel
,(case when us.user_type is null then '1' else us.user_type end) as us_usertype --0=supervisor, 1=inspector a-b, 9 inspector b
,(case when us.chmod is null then '0' else substring(us.chmod,1,1) end) as us_accesoC1
,(case when us.chmod is null then '0' else substring(us.chmod,3,1) end) as us_accesoC2
,(case when us.chmod is null then '0' else substring(us.chmod,5,1) end) as us_accesoC3
,(case when us.chmod is null then '0' else substring(us.chmod,7,1) end) as us_asigC1
,(case when us.chmod is null then '0' else substring(us.chmod,9,1) end) as us_asigC2
,(case when us.chmod is null then '0' else substring(us.chmod,11,1) end) as us_asigC3
,(case when us.chmod is null then '0' else substring(us.chmod,13,1) end) as us_acceso
,(case when us.chmod is null then '0' else substring(us.chmod,15,1) end) as us_crearTablaPagos
,(case when us.chmod is null then 'p' else substring(us.chmod,17,1) end) as us_pagRedirecion
,(case when us.sectores is null then '0' else us.sectores end) as us_sectores --solo inspectores
,(case when us.totalFacturas is null then '0' else convert(varchar(15),us.totalFacturas) end) as us_totalFacturas --solo inspectores
,(case when us.chmod2 is null then '0' else (case when charindex('CR',chmod2)&lt;&gt;0 then 'CR' else 'NCR' end ) end) as cargaRale
,(case when us.chmod2 is null then '0' else (case when charindex('DR',chmod2)&lt;&gt;0 then 'DR' else 'NDR' end ) end) as descargaRale
,(case when us.chmod2 is null then '0' else (case when charindex('CL',chmod2)&lt;&gt;0 then 'CL' else 'NCL' end ) end) as cargaLgp
,(case when us.chmod2 is null then '0' else (case when charindex('DL',chmod2)&lt;&gt;0 then 'DL' else 'NDL' end ) end) as descargaLgp
,(case when us.chmod2 is null then '0' else (case when charindex('CP',chmod2)&lt;&gt;0 then 'CP' else 'NCP' end ) end) as cargaProcesar
,(case when us.chmod2 is null then '0' else (case when charindex('DP',chmod2)&lt;&gt;0 then 'DP' else 'NDP' end ) end) as descargaProcesar
,(case when us.chmod2 is null then '0' else (case when charindex('ARR',chmod2)&lt;&gt;0 then 'ARR' else 'NARR' end ) end) as us_x2
,(case when us.chmod2 is null then '0' else (case when charindex('DA',chmod2)&lt;&gt;0 then 'DA' else 'NDA' end ) end) as us_x3
,(case when us.chmod2 is null then '0' else (case when charindex('RG',chmod2)&lt;&gt;0 then 'RG' else 'NRG' end ) end) as us_x4
,(case when us.credencial is null then '-' else us.credencial end) as us_credencial --solo inspector
,(case when us.observacionPatronal is null then '0' else us.observacionPatronal end) as us_accesoObseervacion
,(case when us.printPaeDoc is null then '0' else us.printPaeDoc end) as us_impimirDoc
,(case when us.cargaebaema is null then '0' else us.cargaebaema end) as us_cargaebaema --caso especial
,(case when us.baseNDRegistros is null then '0' else us.baseNDRegistros end) as us_
,(case when us.userIntegrador is null then '0' else us.userIntegrador end) as us_integrador --tipo 1=solo captura,2=asignacion y captura,3=asignacion,4=solo consultas
,(case when us.alerta is null then '0' else us.alerta end) as us_alerta --mostrar comentarios
,(case when us.correoAuto is null then '0-0-0' else us.correoAuto end) as correoAutomatico
from 
fiscamovil.dbo.usuarios as uf
left join
sireca.dbo.usuarios as us
on uf.id=us.id
where
uf.id=?
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ListBoxUsuarios" DefaultValue="9999" Name="?" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceUsuarios"
                                    EmptyDataText="SELECCIONE UN USUARIO DE LA LISTA" Font-Bold="True" Width="100%">
                                    <EmptyDataRowStyle ForeColor="White" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td align="left" class="style14" colspan="3">
                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                                        <tr>
                                                            <td class="style13" rowspan="4">
                                                                <asp:ImageButton ID="IBUsuarios" runat="server" ImageAlign="AbsBottom" ImageUrl="~/imagenes/usuarios/avatar/usuarioSireca.jpg"
                                                                    OnLoad="IBUsuarios_Load" />
                                                            </td>
                                                            <td class="style18">
                                                                <asp:Label ID="Label2" runat="server" ForeColor="#F0F0F0" Text="NOMBRE:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="uf_nombreLabel" runat="server" BackColor="#304362" BorderStyle="None"
                                                                    BorderWidth="1" ForeColor="White" ReadOnly="True" Text='<%# Eval("uf_nombre") %>'
                                                                    Width="97%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style18">
                                                                <asp:Label ID="Label5" runat="server" ForeColor="#F0F0F0" Text="CARGO:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="uf_cargoLabel" runat="server" BackColor="#304362" BorderStyle="None"
                                                                    BorderWidth="1" ForeColor="White" ReadOnly="True" Text='<%# Eval("uf_cargo") %>'
                                                                    Width="97%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style18">
                                                                <asp:Label ID="Label18" runat="server" ForeColor="#F0F0F0" Text="CREDENCIAL:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="us_credencialLabel" runat="server" BackColor="#304362" BorderStyle="None"
                                                                    BorderWidth="1" ForeColor="White" Text='<%# Eval("us_credencial") %>'
                                                                    Width="97%" MaxLength="6"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style18">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style13" colspan="3">
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                                        <tr>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:Label ID="Label24" runat="server" ForeColor="#958FAD" Text="ROL:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:DropDownList ID="DDLRol" runat="server" AutoPostBack="True" 
                                                                    OnSelectedIndexChanged="DDLRol_SelectedIndexChanged" Width="200px">
                                                                    <asp:ListItem Value="-">PERSONALIZADO</asp:ListItem>
                                                                    <asp:ListItem Value="9">BAJA</asp:ListItem>
                                                                    <asp:ListItem Value="0">JEFES</asp:ListItem>
                                                                    <asp:ListItem Value="00">SUPERVISOR CICLO 1</asp:ListItem>
                                                                    <asp:ListItem Value="000">SUPERVISOR CICLO 2</asp:ListItem>
                                                                    <asp:ListItem Value="0000">SUPERVISOR CICLO 3</asp:ListItem>
                                                                    <asp:ListItem Value="1">INSPECTOR A(CICLO 1)</asp:ListItem>
                                                                    <asp:ListItem Value="99">INSPECTOR B(CICLO 2)</asp:ListItem>
                                                                    <asp:ListItem Value="111">INTEGRADOR(CICLO 3)</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label15" runat="server" ForeColor="#958FAD" Text="R.A.L.E.:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:CheckBox ID="cargaRale" runat="server" 
                                                                    Checked='<%#IIF(Eval("cargaRale").equals("CR"),"True","False")%>' 
                                                                    ForeColor="#958FC1" Text="CARGAR" CssClass="checkbox inline" />
                                                                <asp:CheckBox ID="descargaRale" runat="server" CssClass="checkbox inline" Checked='<%#IIF(Eval("descargaRale").equals("DR"),"True","False")%>' ForeColor="#958FC1" 
                                                                    Text="DESCARGAR" />
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label10" runat="server" ForeColor="#958FAD" 
                                                                    Text="TIPO DE USUARIO:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="us_usertype" runat="server" AutoPostBack="True" 
                                                                    SelectedValue='<%# Eval("us_usertype") %>' Width="200px">
                                                                    <asp:ListItem Value="1">INSPECTOR A/B</asp:ListItem>
                                                                    <asp:ListItem Value="9">INSPECTOR B</asp:ListItem>
                                                                    <asp:ListItem Value="0">JEFES/SUPERVISOR/INTEGRADOR</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label16" runat="server" ForeColor="#958FAD" Text="L.G.P.:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:CheckBox ID="cargaLgp" runat="server" Checked='<%#IIF(Eval("cargaLgp").equals("CL"),"True","False")%>' CssClass="checkbox inline" ForeColor="#958FC1" Text="CARGAR" />
                                                                <asp:CheckBox ID="descargaLgp" runat="server" 
                                                                    Checked='<%#IIF(Eval("descargaLgp").equals("DL"),"True","False")%>' ForeColor="#958FC1" 
                                                                    Text="DESCARGAR" CssClass="checkbox inline" />
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
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
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label7" runat="server" ForeColor="#958FAD" Text="DELEGACION:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:DropDownList ID="us_del" runat="server" DataTextField="texto" 
                                                                    DataValueField="valor" SelectedValue='<%# Eval("us_del") %>' 
                                                                    ToolTip="Delegacion al cual tendra acceso el usuario." Width="200px">
                                                                    <asp:ListItem Value="33">YUCATAN</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;<asp:Label ID="Label17" runat="server" ForeColor="#958FAD" Text="PROCESAR:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:CheckBox ID="cargaProcesar" 
                                                                    Checked='<%#IIF(Eval("cargaProcesar").equals("CP"),"True","False")%>' 
                                                                    runat="server" ForeColor="#958FC1" 
                                                                    Text="CARGAR" CssClass="checkbox inline" />
                                                                <asp:CheckBox ID="descargaProcesar" 
                                                                    Checked='<%#IIF(Eval("descargaProcesar").equals("DP"),"True","False")%>' 
                                                                    runat="server" ForeColor="#958FC1" 
                                                                    Text="DESCARGAR" CssClass="checkbox inline" />
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label8" runat="server" ForeColor="#958FAD" Text="SUBDELEGACION:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="us_subdel" runat="server" DataTextField="texto" 
                                                                    DataValueField="valor" SelectedValue='<%# Eval("us_subdel") %>' 
                                                                    ToolTip="Subdelegacion al cual tendra acceso el usuario." Width="200px">
                                                                    <asp:ListItem Value="00">DELEGACION</asp:ListItem>
                                                                    <asp:ListItem Value="01">NORTE</asp:ListItem>
                                                                    <asp:ListItem Value="33">SUR</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left">
                                                            &nbsp;
                                                                <asp:Label ID="Label23" runat="server" ForeColor="#958FAD" Text="ALERTAS"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="us_alertas" runat="server" SelectedValue='<%# Eval("us_alerta")%>' ToolTip="Esstado de alerta de mensajes">
                                                                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                                                    <asp:ListItem Value="1">Activo</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
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
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label12" runat="server" ForeColor="#958FAD" Text="ACCESO:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:CheckBox ID="us_accesoC1" runat="server" ForeColor="#958FC1" 
                                                                    Checked='<%#IIF(Eval("us_accesoC1").equals("x"),"True","False")%>' 
                                                                    Text="CICLO1" CssClass="checkbox inline"/>
                                                                <asp:CheckBox ID="us_accesoC2" runat="server" ForeColor="#958FC1" 
                                                                    Checked='<%#IIF(Eval("us_accesoC2").equals("x"),"True","False")%>' 
                                                                    Text="CICLO2" CssClass="checkbox inline"/>
                                                                <asp:CheckBox ID="us_accesoC3" runat="server" ForeColor="#958FC1" 
                                                                    Checked='<%#IIF(Eval("us_accesoC3").equals("x"),"True","False")%>' 
                                                                    Text="CICLO3" CssClass="checkbox inline"/>                                                                
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7" colspan="2">
                                                                &nbsp;
                                                                <asp:Label ID="Label22" runat="server" ForeColor="#958FAD" Text="CREAR COMPORT. PAGO:"></asp:Label>
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                <asp:DropDownList ID="us_crearcopmpago" SelectedValue='<%# Eval("us_crearTablaPagos")%>' runat="server" Width="200px">
                                                                    <asp:ListItem Value="0">NO</asp:ListItem>
                                                                    <asp:ListItem Value="l">SI</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label13" runat="server" ForeColor="#958FAD" Text="ASIGNAR:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:CheckBox ID="us_asigC1" runat="server" ForeColor="#958FC1" 
                                                                    Checked='<%#IIF(Eval("us_asigC1").equals("x"),"True","False")%>' Text="CICLO1" 
                                                                    CssClass="checkbox inline"/>
                                                                <asp:CheckBox ID="us_asigC2" runat="server" ForeColor="#958FC1" 
                                                                    Checked='<%#IIF(Eval("us_asigC2").equals("x"),"True","False")%>' Text="CICLO2" 
                                                                    CssClass="checkbox inline"/>
                                                                <asp:CheckBox ID="us_asigC3" runat="server" ForeColor="#958FC1" 
                                                                    Checked='<%#IIF(Eval("us_asigC3").equals("x"),"True","False")%>' Text="CICLO3" 
                                                                    CssClass="checkbox inline"/>
                                                            </td>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
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
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label21" runat="server" ForeColor="#958FAD" 
                                                                    Text="NIVEL CICLO 3:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:DropDownList ID="us_integrador" SelectedValue='<%# Eval("us_integrador") %>' runat="server" Width="200px">
                                                                    <asp:ListItem Value="0">NINGUNA</asp:ListItem>
                                                                    <asp:ListItem Value="4">CONSULTA</asp:ListItem>
                                                                    <asp:ListItem Value="1">CAPTURA</asp:ListItem>
                                                                    <asp:ListItem Value="3">ASIGNACION</asp:ListItem>
                                                                    <asp:ListItem Value="2">ASIGNACION Y CAPTURA</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7" colspan="2">
                                                                &nbsp;
                                                                <asp:Label ID="Label19" runat="server" ForeColor="#958FAD" Text="IMPRIMIR DOC.:"></asp:Label>
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                <asp:DropDownList ID="us_printdoc" SelectedValue='<%# Eval("us_impimirDoc") %>' runat="server" Width="200px">
                                                                    <asp:ListItem Value="0">NO</asp:ListItem>
                                                                    <asp:ListItem Value="1">SI</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label3" runat="server" ForeColor="#958FAD" Text="USUARIO:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="uf_usuarioLabel" runat="server" BackColor="#304362" 
                                                                    BorderStyle="None" BorderWidth="1" ReadOnly="True" 
                                                                    Text='<%# "  " & Eval("uf_usuario") %>' Width="220px" ForeColor="White"></asp:TextBox>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
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
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label4" runat="server" ForeColor="#958FAD" Text="CONTRASEÑA:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                <asp:TextBox ID="uf_paswordLabel" runat="server" BackColor="#DEE1E7" 
                                                                    BorderStyle="None" BorderWidth="1" ForeColor="#DEE1E7" ReadOnly="True" 
                                                                    Text='<%# "  " & Eval("uf_pasword") %>' Width="220px"></asp:TextBox>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7" colspan="2">
                                                                &nbsp;
                                                                <asp:Label ID="Label20" runat="server" ForeColor="#958FAD" Text="NIVEL ACCESO A OBSERVACIONES:"></asp:Label>
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                <asp:DropDownList ID="us_observaciones" SelectedValue='<%# Eval("us_accesoObseervacion") %>' runat="server" Width="200px">
                                                                    <asp:ListItem Value="0">NINGUNA</asp:ListItem>
                                                                    <asp:ListItem Value="1">PERSONAL</asp:ListItem>
                                                                    <asp:ListItem Value="2">TODOS</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label6" runat="server" ForeColor="#958FAD" Text="CORREO:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="uf_correoLabel" runat="server" BackColor="#304362" 
                                                                    BorderStyle="None" BorderWidth="1" ReadOnly="True" 
                                                                    Text='<%# Eval("uf_correo") %>' Width="220px" ForeColor="White"></asp:TextBox>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:Label ID="Label11" runat="server" ForeColor="#958FAD" Text="ACCESO:"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="us_acceso" runat="server" SelectedValue='<%# Eval("us_acceso") %>'
                                                                    ToolTip="Acceso al sistema" Width="200px">
                                                                    <asp:ListItem Value="x">SI</asp:ListItem>
                                                                    <asp:ListItem Value="0">NO</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
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
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label14" runat="server" ForeColor="#958FAD" Text="DIRIGIR A:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:DropDownList ID="us_pagdirigir" SelectedValue='<%# Eval("us_pagRedirecion") %>' runat="server" Width="200px">
                                                                    <asp:ListItem Value="p">MENU PRINCIPAL</asp:ListItem>
                                                                    <asp:ListItem Value="1">CICLO 1</asp:ListItem>
                                                                    <asp:ListItem Value="2">CICLO 2</asp:ListItem>
                                                                    <asp:ListItem Value="3">CICLO 3</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" bgcolor="#465A7D">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7">
                                                                &nbsp;
                                                                <asp:Label ID="Label25" runat="server" ForeColor="#958FAD" Text="CORREOS AUT.:"></asp:Label>
                                                            </td>
                                                            <td align="left" bgcolor="#DEE1E7" colspan="2">
                                                                &nbsp;
                                                                <asp:CheckBox ID="us_correonl" Text ="NO LOCALIZADOS" 
                                                                    Checked='<%#IIF(Eval("correoAutomatico").Contains("NL"),"True","False")%>' 
                                                                    runat="server" ForeColor="#958FB7" CssClass="checkbox inline" />
                                                                <asp:CheckBox ID="us_correoeedr" Text ="ESPERA DE RESPUESTA" 
                                                                    Checked='<%#IIF(Eval("correoAutomatico").Contains("EEDR"),"True","False")%>' 
                                                                    runat="server" ForeColor="#958FB7" CssClass="checkbox inline" />
                                                                <asp:CheckBox ID="us_correotramite" Text ="TRAMITE" 
                                                                    Checked='<%#IIF(Eval("correoAutomatico").Contains("TRAMITE"),"True","False")%>' 
                                                                    runat="server" ForeColor="#958FB7" CssClass="checkbox inline" />
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                            <td bgcolor="#DEE1E7">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style14">
                                                    &nbsp;
                                                </td>
                                                <td align="right" class="style17">
                                                    &nbsp;</td>
                                                <td align="right" class="style15">
                                                    <asp:Label ID="LMsg" runat="server" ForeColor="#FF9900"></asp:Label>
                                                    <asp:LinkButton ID="LBGPermisos" runat="server" BackColor="#FFCB53" BorderStyle="Solid"
                                                        BorderWidth="1px" Font-Bold="True" Font-Underline="False" 
                                                        onclick="LBGPermisos_Click">&nbsp;&nbsp;Guardar Permisos&nbsp;&nbsp;</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                                <br />
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style11
        {
        }
        .style13
        {
            width: 80px;
        }
        .style14
        {
        }
        .style16
        {
            width: 1px;
        }
        .style18
        {
            width: 66px;
        }
        .style19
        {
            width: 200px;
        }
        .style20
        {
            width: 20px;
        }
    </style>
</asp:Content>

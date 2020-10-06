<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo3.Master" AutoEventWireup="false" CodeBehind="ActualizarND.aspx.vb" Inherits="WebSIRECA.ActualizarND" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID ="contenido2" runat ="server" ContentPlaceHolderID ="head" >
    
</asp:Content>

<asp:Content ID ="contenido" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1" >
    <div>
        <table style="width:100%;" class="table table-bordered" cellpadding="0" 
            cellspacing="0">
            <tr>
                <td align="left" style="font-weight: bold; font-size: 10pt;" 
                    colspan="3">
                    LLENADO/ACTUALIZACIÓN DE LOS DATOS DE UN NO DELIGENCIADO, 1º PASO 
                    <br />
                    (PARA PASAR AL 
                    2º PASO, CUMPLIR CON <asp:Label ID="Label1" runat="server" Text="APLICADA" 
                        ForeColor="#CC0000"></asp:Label>&nbsp;Y 
                    <asp:Label ID="Label2" runat="server" Text="3)SI" ForeColor="#CC0000"></asp:Label>)</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    01)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    REGISTRO PATRONAL:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V01" runat="server" MaxLength="10" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:Button ID="BActDatosPatron" runat="server" Text="ACT.**" 
                        BackColor="#FFE8A6" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px" />
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    02)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    ESTATUS:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="VDDL02" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>APLICADA</asp:ListItem>
                        <asp:ListItem>NO PROCEDE</asp:ListItem>
                        <asp:ListItem>PENDIENTE</asp:ListItem>
                        <asp:ListItem>EN FIRMA</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    03)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    LOCALIZADO SIN RELACION OBRERO PATRONAL:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="VDDL03" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    04)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    OBSERVACIONES</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V04" runat="server" MaxLength="254" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    05)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    RFC(FISICAS 13 Y MORALES 12):</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V05" runat="server" MaxLength="20" BackColor="#FFE8A6" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    **</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    06)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    NOMBRE DEL PATRON:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V06" runat="server" MaxLength="254" BackColor="#FFE8A6" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    **</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    07)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    DOMICILIO FISCAL(IMSS):</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V07" runat="server" MaxLength="254" BackColor="#FFE8A6" 
                        BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    **</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    08)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT ARCHIVO DE SOLICITUD:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V08" runat="server" MaxLength="254" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    09)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT FECHA RESPUESTA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech09" runat="server" MaxLength="254" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="caext09" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech09">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    10)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT FECHA DE RECEPCION DEL ARCHIVO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech10" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender10" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech10">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    11)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT EN CASO DE HABERSE SOLICITADO POR OFICIO REFERENCIA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V11" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    12)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT FECHA DE RESPUESTA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech12" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender12" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech12">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    13)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT SOLICITUD CON OFICIO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V13" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    14)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT FECHA DE LA SOLICITUD CON OFICIO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech14" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender14" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech14">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    15)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    SAT DOMICILIO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V15" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    16)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    ACTIVIDAD:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V16" runat="server" BackColor="#FFE8A6" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    **</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    17)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DEL ACTA CIRCUNSTANCIAL:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech17" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender17" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech17">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    18)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE LA RECEPCION DEL IMPEDIMIENTO DE COBRO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech18" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender18" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech18">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    19)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE RECEPCION DEL ACTA CIRCUNSTANCIADA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech19" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender19" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech19">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    20)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA AFIL ALTA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech20" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender20" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech20">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    21)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA INF REL LAB INEX:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech21" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender21" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech21">
                </asp:CalendarExtender>
                    </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    22)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DEL MEMO DE LA BAJA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech22" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender22" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech22">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    23)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    NUMERO DE MEMO DE LA BAJA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V23" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    24)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE LA BAJA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech24" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender24" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech24">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    25)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    ENCARGADO DE LA MESA CREDITOS CON IMPEDIMIENTO DE&nbsp; COBRO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V25" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    26)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    JEFE DE LA OFICINA DE REGISTROS Y CONTROL DE LA CARTERA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V26" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    27)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    JEFE DEPTO AFILIACION Y VIGENCIA DE DERECHOS:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V27" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    28)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    TITULAR DE LA SUBDELEGACION:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V28" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    29)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    NUMERO DE TRABAJADORES:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V29" runat="server" BackColor="#FFE8A6" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    **</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    30)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    PROCEDENCIA DEL ND QUE DA ORIGEN A LA BAJA (E.F. U OEPO):</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="VDDL30" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>EF</asp:ListItem>
                        <asp:ListItem>OEPO</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    31)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    REFERENCIA (N° DE CED. CAPT. O REF. DE MEMO):</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V31" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    32)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE REFERENCIA DE LA CEDULA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech32" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender32" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech32">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    33)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA REFERENCIA DE CAPTURA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech33" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender33" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech33">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    34)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE REFERENCIA DEL MEMO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech34" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender34" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech34">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    35)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    NOMBRE DEL NL QUE VERIFICA EL FISCAL:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V35" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    36)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA ENTREGA_DEV NL:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech36" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender36" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech36">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    37)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    RESULTADO DE LA VERIFICACION DEL DOMICILIO FISCAL:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V37" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    38)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    NOMBRE DEL LOCALIZADOR:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V38" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    39)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA ENTREGA DEVUELTO POR EL LOCALIZADOR:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech39" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender39" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech39">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    40)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    NOMBRE DEL NL QUE VERIFICA EL SAT(SOLO EN CASO DE QUE FISCAL Y SAT SEAN 
                    DIFERENTES):</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V40" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    41)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE ENTREGA DEVUELTO_NL QUE VERIFICA EL SAT(SOLO EN CASO DE QUE FISCAL Y 
                    SAT SEAN DIFERENTES):</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech41" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender41" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech41">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    42)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    ELABORO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V42" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    43)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    REF. MEMO DE AFILIACION CON QUE ENVIA EL AFIL DE BAJA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V43" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    44)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA RECEPCION DEL MEMO DE AFILIACION:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech44" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender44" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech44">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    45)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    RANGO:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V45" runat="server" BackColor="#FFE8A6" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                &nbsp;&nbsp; I,II,III,IV,V</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    46)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    IMPORTE COP:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VCCOP" runat="server" MaxLength="10" Width="50px" 
                        BackColor="#FFE8A6" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:TextBox ID="V46" runat="server" MaxLength="10" Width="100px" 
                        BackColor="#FFE8A6" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    *</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    47)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    IMPORTE RCV:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VCRCV" runat="server" MaxLength="10" Width="50px" 
                        BackColor="#FFE8A6" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:TextBox ID="V47" runat="server" MaxLength="10" Width="100px" 
                        BackColor="#FFE8A6" BorderColor="#BCC7D8" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    *</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    48)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    REF. MEMO AFILIACION PARA INVEST. INTERNA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V48" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    49)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA MEMO AFILIACION PARA INTERNA (ENTREGA-DEVOLUCION):</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech49" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender49" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech49">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    50)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    ND ANTERIOR:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V50" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    51)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    POSIBLE SUSTITUCION PATRONAL:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V51" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    52)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    FECHA DE ENVIO AL DEPARTAMENTO DE AUDITORIA A PATRONES:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="VFech52" runat="server" BorderColor="#BCC7D8" 
                        BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender52" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="VFech52">
                </asp:CalendarExtender>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    53)</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    OBSERVACION POR PARTE DE AUDITORIA:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="V53" runat="server" BorderColor="#BCC7D8" BorderStyle="Solid" 
                        BorderWidth="1px"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    &nbsp;</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left"  style="font-weight: bold; font-size: 10pt;">
                    &nbsp;</td>
                <td align="left" style="font-weight: bold; font-size: 10pt;">
                    <asp:Button ID="BRegistro" runat="server" Text="Agregar" />
                    <asp:Button ID="BActualizar" runat="server" Text="Actualizar" />
                    <asp:Label ID="LError" runat="server" Font-Bold="True" Font-Size="X-Large" 
                        ForeColor="Red"></asp:Label>
                </td>
                <td class="style21">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>

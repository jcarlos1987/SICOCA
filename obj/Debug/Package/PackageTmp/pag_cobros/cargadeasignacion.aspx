<%@ Page Language="vb" MasterPageFile ="~/sitios/SiteCiclo2.Master" AutoEventWireup="false" CodeBehind="cargadeasignacion.aspx.vb" Inherits="WebSIRECA.cargadeasignacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID ="content1" runat ="server" ContentPlaceHolderID ="ContentPlaceHolder1">
    <div>
        <asp:Panel ID="Panel1" runat="server" BackColor="#FFE8A6" BorderColor="#CC0000" 
            BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                Font-Size="16pt" ForeColor="#000099">CARGA DE LA ASIGNACION DE P.A.E.</asp:Label>
            <br />
            <asp:Label ID="LMensaje" runat="server" Font-Bold="True" 
                Font-Size="16pt" ForeColor="#000099">VERIFIQUE QUE EL ARCHIVO A CARGAR SEA UN CSV, DELIMITADO POR ,</asp:Label>
        </asp:Panel>
    <hr />
<center>
<div class="btn-group input-prepend">
        <asp:DropDownList ID="DDLSubdel" runat="server" Width="120px" 
        AutoPostBack="True"></asp:DropDownList>
<span class="add-on">
        <asp:Label ID="Label1" runat="server" Text="FECHA DE ASIG.:"></asp:Label>
</span>
        <asp:TextBox ID="TBFechaAsignacion" runat="server" BorderWidth="1px" MaxLength="10" Width="80px"></asp:TextBox>
        <asp:CalendarExtender id="CalendarExtender2" runat="server" TargetControlID="TBFechaAsignacion" Format="dd/MM/yyyy"></asp:CalendarExtender>
        <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" />&nbsp;&nbsp;
<span class="add-on">
        <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server" 
            BackColor="#9CAAC1" >&nbsp;&nbsp;CARGAR ASIGNACION PATRONAL&nbsp;&nbsp;</asp:LinkButton>
</span>
</div>
</center>
        <table style="width: 100%;">
            <tr>
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
                <td>
                    &nbsp;
                    <asp:Panel ID="Panel2" runat="server" GroupingText="ASIGNADOS" Height="300px" 
                        ScrollBars="Auto">
                        <asp:Table ID="TableCargados" runat="server" BorderStyle="Solid" 
                            BorderWidth="1px" CellPadding="1" CellSpacing="1" GridLines="Both">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" Font-Bold="True">LINEA</asp:TableCell>
                                <asp:TableCell runat="server" Font-Bold="True">REG.PAT.</asp:TableCell>
                                <asp:TableCell runat="server" Font-Bold="True" HorizontalAlign="Center">ID_INSPECTOR</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                    <asp:Panel ID="Panel3" runat="server" GroupingText="NO ASIGNADOS" Height="300px" 
                        ScrollBars="Auto">
                        <asp:Table ID="TableNoCargados" runat="server" BorderStyle="Solid" 
                                        BorderWidth="1px" CellPadding="1" CellSpacing="1" GridLines="Both">
                                        <asp:TableRow ID="TableRow1" runat="server">
                                            <asp:TableCell ID="TableCell1" runat="server" Font-Bold="True">LINEA</asp:TableCell>
                                            <asp:TableCell ID="TableCell2" runat="server" Font-Bold="True">REG.PAT.</asp:TableCell>
                                            <asp:TableCell ID="TableCell3" runat="server" Font-Bold="True" HorizontalAlign="Center">ID_INSPECTOR</asp:TableCell>
                                        </asp:TableRow> 
                                    </asp:Table>                        
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                    <asp:Panel ID="Panel4" runat="server" GroupingText="NOTA" Height="300px" 
                        ScrollBars="Auto">
                        <table style="width:100%;">
                            <tr>
                                <td rowspan="2">
                                    &nbsp;</td>
                                <td>
                                    Los no asignados se deben por:
                                    <ul>
                                    <li>EL ARCHIVO <strong>CSV</strong> NO TIENE EL FORMATO CORRECTO.</li>
                                    <li>EL <strong >REG.PAT.</strong> NO TIENE 10 CARACTERES.</li>
                                    <li>EL <strong >REG.PAT.</strong> NO PERTENESE A LA SUBDELEGACION SELECCIONADA.</li>
                                    <li>EL <strong >ID_INSPECTOR</strong> NO PERTENECE AL DE UN INSPECTOR, DE LA SUBDELEGACION SELECCIONADA.</li>                                                                       
                                    </ul>
                                    <hr />
                                    Descargar de <strong>lista de INSPECTORES con su ID </strong><asp:LinkButton
                                        ID="LBDescargar" runat="server">Descargar Lista</asp:LinkButton>
                                    </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
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
        </table>
    
    </div>
</asp:Content>

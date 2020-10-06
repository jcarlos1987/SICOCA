<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CitatorioCOPRCV.aspx.vb" Inherits="WebSIRECA.CitatorioCOPRCV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Remocion</title>    
    <style type="text/css">
        .style1
        {
            width: 14px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">    
    <asp:Panel ID="PanelContenido" runat="server" BorderStyle="None" 
        BorderWidth="0px" Font-Overline="False">     
    <table style="line-height: 1.0em;" border ="0" cellpadding ="0" cellspacing ="0">
    <tr>
    <td class="style1"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td class="style1"><asp:Image ID="ImageLogo" runat="server" /></td>
    <td colspan="8">
        <table border="0" cellpadding="0" cellspacing="0" style="line-height: 1.0em;">
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" 
                        Text="INSTITUTO MEXICANO DEL SEGURO SOCIAL" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="DELEGACION ESTATAL YUCATAN" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelSubdelegacion" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelOficina" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </td>
        <td style="text-align: right; vertical-align: top"></td>
    </tr>
    <tr>    
    <td colspan="10">
    
    </td> 
    </tr> 
    <tr>    
    <td colspan="10">
    
    </td> 
    </tr>
    <tr>    
    <td colspan="10"> &nbsp;<br/>   
    </td> 
    </tr>
</table>
	<table border="1" cellpadding="1" cellspacing="0" style="line-height: 1.0em;">
		<tr>
			<td colspan="3">
                <asp:Label ID="Label1" runat="server" Text="DEUDOR:" Font-Bold="True"></asp:Label><asp:Label ID="LDeudor" runat="server"></asp:Label>
            </td>
		</tr>
		<tr>
			<td >
                <asp:Label ID="Label5" runat="server" Text="REGISTRO PATRONAL:" 
                    Font-Bold="True"></asp:Label><asp:Label ID="LRegPat" runat="server" ></asp:Label>
            </td>
			<td colspan="2">
                <asp:Label ID="Label7" runat="server" Text="ACTIVIDAD:" Font-Bold="True"></asp:Label><asp:Label ID="LActividad" runat="server" ></asp:Label>
            </td>
		</tr>
		<tr>
			<td colspan="3">
                <asp:Label ID="Label6" runat="server" Text="DOMICILIO:" Font-Bold="True"></asp:Label><asp:Label ID="LDomicilio" runat="server" ></asp:Label>
            </td>
		</tr>
		<tr>
			<td colspan="2">
                <asp:Label ID="Label8" runat="server" Text="C.P.:" Font-Bold="True"></asp:Label><asp:Label ID="LCodPostal" runat="server"></asp:Label>
            </td>
			<td >
                <asp:Label ID="Label9" runat="server" Text="SECTOR:" Font-Bold="True"></asp:Label><asp:Label ID="LSector" runat="server" ></asp:Label>
            </td>
		</tr>
		<tr>
			<td colspan="3">
                <asp:Label ID="Label10" runat="server" Text="LOCALIDAD:" Font-Bold="True"></asp:Label><asp:Label ID="LLocalidad" runat="server" ></asp:Label>
            </td>
		</tr>
        <tr>
			<td colspan="3">
                <asp:Label ID="Label12" runat="server" Text="CONSEPTO:" Font-Bold="True"></asp:Label><asp:Label ID="LConsepto" runat="server" ></asp:Label>
            </td>
		</tr>
	</table>	
    <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td align="center"><asp:Label ID="Label11" runat="server" Text="DETALLES DEL ADEUDO" Font-Bold="True"></asp:Label></td>
    </tr>
    <tr>
    <td><asp:Label ID="LTipoCOP" runat="server" Font-Bold="True">CUOTAS OBRERO PATRONALES</asp:Label></td>
    </tr>
    
    <tr><td>
            <asp:Table ID="Table1" runat="server" BorderStyle="Solid" GridLines="Both" 
                HorizontalAlign="Center">
                <asp:TableRow ID="TableRow1" runat="server" Font-Bold="True" HorizontalAlign="Center">
                    <asp:TableCell ID="TableCell1" runat="server">CREDITO</asp:TableCell>
                    <asp:TableCell ID="TableCell2" runat="server">PERIODO</asp:TableCell>
                    <asp:TableCell ID="TableCell3" runat="server">IMPORTE</asp:TableCell>
                    <asp:TableCell ID="TableCell4" runat="server">CREDITO</asp:TableCell>
                    <asp:TableCell ID="TableCell5" runat="server">PERIODO</asp:TableCell>
                    <asp:TableCell ID="TableCell6" runat="server">IMPORTE</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </td></tr>	    
    <tr>
    <td><asp:Label ID="LTipoRCV" runat="server" Font-Bold="True">RETIRO, CESANTIA Y VEJEZ</asp:Label></td>
    </tr>
    
    <tr><td>
            <asp:Table ID="Table2" runat="server" BorderStyle="Solid" GridLines="Both" 
                HorizontalAlign="Center">
                <asp:TableRow ID="TableRow2" runat="server" Font-Bold="True" HorizontalAlign="Center">
                    <asp:TableCell ID="TableCell7" runat="server">CREDITO</asp:TableCell>
                    <asp:TableCell ID="TableCell8" runat="server">PERIODO</asp:TableCell>
                    <asp:TableCell ID="TableCell9" runat="server">IMPORTE</asp:TableCell>
                    <asp:TableCell ID="TableCell10" runat="server">CREDITO</asp:TableCell>
                    <asp:TableCell ID="TableCell11" runat="server">PERIODO</asp:TableCell>
                    <asp:TableCell ID="TableCell12" runat="server">IMPORTE</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </td></tr>	    
    <tr>
    <td align="center"></td>
    </tr>
    <tr>
    <td align="center"></td>
    </tr>
    </table>        
<table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">       
  <tr>
    <td style="text-align: justify">
Más Actualización, Recargos y Gastos de Ejecución que se generen al momento del pago.
        </td>
  </tr>
  </table>
  <strong style="text-align: center">CITATORIO PALA LA APLICACIÓN DEL PROCEDIMIENTO</strong>
  <br />
  <strong style="text-align: center">ADMINISTRATIVO DE EJECUCIÓN</strong>
  <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td style="text-align: justify;">
En Mérida, Yucatán, México, siendo las ____ horas con____ minutos, del día___ de _____________de 2013, el suscrito C. _______________________________________, actuando como ejecutor fiscal, quien se identifica con su credencial número __________, con vigencia del día ____ de ________________ de 2013, y hasta el ____ de _________________ 2013, suscrita por la C. __________________________________, Jefa de la Oficina para Cobros de la Subdelegación Mérida _________, Órgano Operativo en Yucatán del Instituto Mexicano del Seguro Social. - - - - - - - - - - - - - - - - - - - -
<br/>
Me constituí  en  el  domicilio fiscal del patrón _________________________________ ubicado en _______________________________, y cerciorándome de que es el domicilio fiscal de este, porque coincide con los datos del domicilio fiscal que el patrón manifestó ante el Instituto  y por así habérmelo manifestado el o la C.________________________________, quien se identifica con__________, con número___________, expedida por___________, en la que aparecen su fotografía, nombre y firma, documento que se tiene a la vista y se devolvió a su portador, quien manifestó ser ________________, del patrón antes citado, por lo que por su conducto procedo a solicitar la presencia del representante legal del patrón ________________ con el fin de practicar la diligencia de requerimiento de pago o embargo, respecto a los créditos fiscales arriba señalados; pero la persona que atiende la diligencia me manifestó que no se encuentra la persona buscada, por lo que se procede a entregarle el presente citatorio, para efecto de que el representante legal del patrón antes mencionado, espere al suscrito ejecutor fiscal en este mismo domicilio en que se esta actuando, el día ____ del mes____, de 2013, a las ____ horas con ____ minutos, para requerir el pago o embargo de bienes, en cumplimiento a lo previsto en los artículos 134 fracción I, 137 y 150 del Código Fiscal de la Federación, 5ª, 9, 251 fracciones XXV, XXXIV y XXXVII, 271 y 291 de la Ley del Seguro Social, en vigor; 2, fracción VI, inciso c), 154, fracciones I, II, V y VIII y 155, fracción XXXII, inciso b), del Reglamento Interior del Instituto Mexicano del Seguro Social, publicado en el diario Oficial de la Federación el 18 de septiembre de 2006, en la inteligencia de que, en caso de no estar presente, se practicará la diligencia de que se trata con quien se encuentre en el domicilio o en su defecto con un vecino.
<br/>
No habiendo más que hacer constar, se da por terminada esta diligencia, siendo las ___ con ____ minutos, del día de su inicio, levantándose la presente en dos tantos, firmados de manera autógrafa por quienes en ella intervinieron y quisieron hacerlo una de las cuales se entrega a la persona que atendió la diligencia.
<br/>
*El importe total podrá ser cubierto con cheque certificado, cheque de caja o efectivo.       
    </td>
  </tr>
</table>    	
        <table style="width: 100%;">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="center">
                <td>
                    El ejecutor</td>
                <td>
                    Recibí original</td>
            </tr>
            <tr align="center">
                <td>
                    ______________________________</td>
                <td>
                    
                    ______________________________</td>
            </tr>
            <tr align="center">
                <td>
                    Nombre y Firma</td>
                <td>
                     Nombre, Firma y Fecha</td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>



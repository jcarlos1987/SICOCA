<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CerrajeroCOPRCV.aspx.vb" Inherits="WebSIRECA.CerrajeroCOPRCV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Remocion</title>    
</head>
<body >
    <form id="form1" runat="server">    
    <asp:Panel ID="PanelContenido" runat="server" BorderStyle="None" 
        BorderWidth="0px" Font-Overline="False">     
    <table style="line-height: 1.0em;" border ="0" cellpadding ="0" cellspacing ="0">
    <tr>
    <td></td>
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
    <td><asp:Image ID="ImageLogo" runat="server" /></td>
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
                    <asp:Label ID="Label3" runat="server" Text="SEGURIDAD Y SOLIDARIDAD SOCIAL" 
                        Font-Bold="True"></asp:Label></td>
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
                    <asp:Label ID="LabelDomicilio" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        </td>
        <td style="text-align: right; vertical-align: top"></td>
    </tr>
    <tr>    
    <td colspan="10">
    Lugar y fecha: __________________________________________________________________________
    </td> 
    </tr> 
    <tr>    
    <td colspan="10">
    Oficio No. _____________________________________________________________________________
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
                <asp:TableRow runat="server" Font-Bold="True" HorizontalAlign="Center">
                    <asp:TableCell runat="server">CREDITO</asp:TableCell>
                    <asp:TableCell runat="server">PERIODO</asp:TableCell>
                    <asp:TableCell runat="server">IMPORTE</asp:TableCell>
                    <asp:TableCell runat="server">CREDITO</asp:TableCell>
                    <asp:TableCell runat="server">PERIODO</asp:TableCell>
                    <asp:TableCell runat="server">IMPORTE</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </td></tr>	    
    <tr>
    <td><asp:Label ID="LTipoRCV" runat="server" Font-Bold="True">RETIRO, CESANTIA Y VEJEZ</asp:Label></td>
    </tr>
    
    <tr><td>
            <asp:Table ID="Table2" runat="server" BorderStyle="Solid" GridLines="Both" 
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
    <td align="center"><strong style="font-weight: bold;">ACUERDO PARA EL ROMPIMIENTO DE CERRADURAS</strong></td>
    </tr>
    <tr>
    <td align="center"><strong style="font-weight: bold;">En MÉRIDA, YÚCATAN a <asp:Label ID="LFecha" runat="server"></asp:Label></strong> </td>
    </tr>
    </table>        
<table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">       
  <tr>
    <td style="text-align: justify">
Visto el expediente formado en esta oficina al deudor citado con motivo de la falta de pago oportuno del adeudo descrito, y encontrando en el mismo que para la práctica de la diligencia de __________________________________________________________, se designó al C. Ejecutor __________________________________________________________, quien mediante informe de fecha ______________________________________________, comunicó al suscrito que al pretender practicar la diligencia, ______________________________________________________________________________, en uso de las facultades señaladas en los Artículos 163 del Código Fiscal de la Federación; 5A, 9, 251 fracciones XXV, XXXIV y XXXVII, 271 y 291 de la Ley del Seguro Social; en vigor; 2, fracción VI, inciso c), 154, fracciones I, II, V y VII y 155, fracción XXXII, inciso a), del Reglamento Interior del Instituto Mexicano del Seguro Social, publicado en el Diario Oficial de la Federación el 18 de septiembre de 2006, se emite el siguiente:
                
        </td>
  </tr>
  </table>
  <strong style="text-align: center">A C U E R D O</strong>
  <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td style="text-align: justify;">
        <asp:Label ID="Label18" runat="server" Text="Único" Font-Bold="True"></asp:Label>.- 
        <asp:Label ID="Label19" runat="server" 
            Text="De conformidad con lo dispuesto por el artículo 163 del Código Fiscal de la Federación, procédase al rompimiento de las cerraduras que fuesen necesarias para llevar a cabo la diligencia que ha quedado señalada en el presente oficio." 
            Font-Italic="True"></asp:Label>
    </td>
  </tr>
</table>    	
        <asp:Panel ID="Panel33" runat="server">
         <table>
          <tr>
              <td>
              <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td align="center">LO ACUERDA Y FIRMA</td>
  </tr>
  <tr>
    <td align="center">
        <asp:Label ID="LJefeOficinaCobros33" runat="server"></asp:Label>
        </td>
  </tr>
  <tr>
    <td ></td>
  </tr>  
  <tr>
    <td align="center"><strong>______________________________________________________</strong></td>
  </tr>
    <tr>
    <td align="center"><strong>
        <asp:Label ID="LNombreJefeOficinaCobros33" runat="server" ></asp:Label></strong></td>
  </tr>
    <tr>
    <td align="center">
        <asp:Label ID="LClaveJC33" runat="server" Font-Bold="True"></asp:Label>
     </td>
    </tr> 
  </table>
              </td>
              
          </tr>  
          </table>
        </asp:Panel>
        <asp:Panel ID="Panel01" runat="server">
        <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td align="center">LO ACUERDA Y FIRMA</td>
  </tr>
  <tr>
    <td align="center">
        <asp:Label ID="LJefeOficinaCobros" runat="server"></asp:Label>
        </td>
  </tr>
  <tr>
    <td ></td>
  </tr>  
  <tr>
    <td align="center"><strong>______________________________________________________</strong></td>
  </tr>
    <tr>
    <td align="center"><strong>
        <asp:Label ID="LNombreJefeOficinaCobros" runat="server" ></asp:Label></strong></td>
  </tr>
    <tr>
    <td align="center">
        <asp:Label ID="LClaveJC" runat="server" Font-Bold="True"></asp:Label>
     </td>
    </tr> 
  </table>
        </asp:Panel> 

    </asp:Panel>
    </form>
</body>
</html>


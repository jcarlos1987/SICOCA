<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RemocionCOPRCV.aspx.vb" Inherits="WebSIRECA.RemocionCOPRCV" %>

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
        <td style="text-align: right; vertical-align: top"><strong style="text-align: right">COFI 03</strong></td>
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
	</table>	
    <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td align="center"><asp:Label ID="Label11" runat="server" Text="DETALLES DEL ADEUDO" Font-Bold="True"></asp:Label></td>
    </tr>
    <tr>
    <td><asp:Label ID="LTipo" runat="server" Font-Bold="True"></asp:Label></td>
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
    <td align="center"><strong style="font-weight: bold;">ACUERDO DE REMOCIÓN DE DEPOSITARIO</strong></td>
    </tr>
    <tr>
    <td align="center"><strong style="font-weight: bold;">En MÉRIDA, YÚCATAN a <asp:Label ID="LFecha" runat="server"></asp:Label></strong> </td>
    </tr>
    </table>        
<table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">       
  <tr>
    <td style="text-align: justify">
        El suscrito, Jefe de la Oficina para Cobros del Instituto Mexicano del Seguro 
        Social
        <asp:Label ID="LabelSubd20" runat="server" ></asp:Label>
        , con fundamento en lo dispuesto en el Artículo 153 del Código Fiscal de la 
        Federación y en ejercicio de las facultades que se me confieren en términos de 
        los Artículo 5 A,. 9 y 271 de la Ley del Seguro Social en vigor, así como en los 
        artículo, 138, 139 y 142, fracción III, 154, fracciones I, II, VIII, y 155, 
        fracción XXXII, inciso a) del Reglamento Interior del Instituto Mexicano del 
        Seguro Social, publicado en el Diario Oficial de la Federación el 18 de 
        Septiembre de 2006, ha resuelto:
<br/>
Primero.- Remover al C.____________________________________________________________________________________, depositario de los bienes embargados el________________________________________________________________________, y nombrar en su lugar, bajo la responsabilidad de esta Oficina, al C._________________________________________________________________________________ _______________________encargado de la bodega para bienes embargados ubicada en calle 7 No. 131 por 38 colonia pensiones.
<br/>
Segundo.- Designar al C. Ejecutor_____________________________________________________________________________ para que de cumplimiento al presente, y de posesión de los bienes embargados al depositario designado en el punto que antecede.
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
    <td align="center"><strong>________________________________________________________</strong></td>
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
    <td align="center"><strong>________________________________________________________</strong></td>
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
  <strong style="text-align: center">ACTA DE REMOCIÓN DE DEPOSITARIO</strong>
  <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td style="text-align: justify;">
        En______________________________________________________________________________________________________, 
        domicilio en el que se encuentran depositados los bienes embargados al patrón al 
        rubro citado, siendo las_________________, horas del día__________ de 
        ________________ de 
        <asp:Label ID="LAnio1" runat="server" ></asp:Label>, se constituyo el suscrito ejecutor, para dar 
        cumplimiento al Acuerdo de Remoción de Depositario, dictado por el Jefe de la 
        Oficina para Cobros del IMSS,
        <asp:Label ID="LabelSubd21" runat="server"></asp:Label>
        , y habiéndome cerciorado que el depositario_____________ atendió el citatorio 
        de fecha_________ de ______________de <asp:Label ID="LAnio2" runat="server" ></asp:Label>, se practica la diligencia 
        con el 
        C.___________________________________________________________________, 
        quien se identifica con 
        __________________________________________________________________ y manifiesta 
        tener el cargo de 
        _____________________________________________________________________________________________ 
        que acredita con ___________________________________________________________ a 
        quien se hace del conocimiento el Acuerdo antes citado, dándole lectura integra 
        del mimo.
<br/>
Acta seguido el suscrito Ejecutor con fundamento en lo dispuesto por el Artículo 161 del Código Fiscal de la Federación, requiere a la persona antes indicada, la entrega de los bienes embargados con fecha___________________________________________, apercibiéndole de que, en caso de no efectuar dicha entrega, se le impondrá la sanción que establece el Artículo 112 del ordenamiento legal antes citado.
<br/>
A continuación el C._____________________________________________________________________________hace entrega al ejecutor de los siguientes bienes, ___________________ la intervención de testigos:
        <br/>
<table  border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.5em;"><tr><td align="center">
<asp:Label ID="labelLeneas" runat="server"></asp:Label></td></tr>
</table>
El suscrito ejecutor hace constar que los bienes antes indicados se reciben para hacer entregados para su custodia el depositario designado.
<br/>
Se hace constar que se entrego a la persona con quien se entiende la presente diligencia copia del acuerdo de remoción de depositario con firma autógrafa del Jefe del Oficina y acta de la diligencia, que firman las personas que en ella intervinieron, cuyos cargos y nombre se indican al calce
    </td>
  </tr>
</table>    
	<table border="1" cellpadding="1" cellspacing="1" style="line-height: 1.0em;">
		<tr>
			<td ><br /><br /></td>
			<td colspan="2">&nbsp;</td>
			<td >&nbsp;</td>
		</tr>
				<tr>
			<td align="center">
                <asp:Label ID="Label13" runat="server" Text="Ejecutor" Font-Bold="True"></asp:Label></td>
			<td colspan="2" align="center">
                <asp:Label ID="Label17" runat="server" Text="Persona con quien se 
			entiende la deligencia" Font-Bold="True"></asp:Label></td>
			<td align="center">
                <asp:Label ID="Label16" runat="server" Text="Depositario designado" Font-Bold="True"></asp:Label></td>
		</tr>
				<tr>
			<td colspan="2" ><br /><br /></td>
			<td colspan="2" >&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
                <asp:Label ID="Label14" runat="server" Text="Testigo" Font-Bold="True"></asp:Label></td>
			<td colspan="2" align="center">
                <asp:Label ID="Label15" runat="server" Text="Testigo" Font-Bold="True"></asp:Label></td>
		</tr>
	</table>
    </asp:Panel>
    </form>
</body>
</html>


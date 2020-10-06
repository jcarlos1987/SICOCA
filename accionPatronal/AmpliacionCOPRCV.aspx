<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AmpliacionCOPRCV.aspx.vb" Inherits="WebSIRECA.AmpliacionCOPRCV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ampliacion</title>    
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
        <td style="text-align: right; vertical-align: top"><strong style="text-align: right">COFI 02</strong></td>
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
    <td align="center"><strong style="font-weight: bold;">AMPLIACI�N DE EMBARGO</strong></td>
    </tr>
    <tr>
    <td align="center"><strong style="font-weight: bold;">En M�RIDA, Y�CATAN a <asp:Label ID="LFecha" runat="server"></asp:Label></strong> </td>
    </tr>
    </table>        
<table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">       
  <tr>
    <td style="text-align: justify">
Considerando que a juicio de esta Oficina Ejecutora, los bienes descritos en el acta de embargo de fecha _________________________, resultan insuficientes para cubrir el adeudo arriba detallado, con fundamento en los art�culos 154 del C�digo Fiscal de la Federaci�n vigente; 5, 5 A, 9, 251 primer p�rrafo, fracciones VII y XXV, 271 y 291 de la Ley del Seguro Social en vigor y en ejercicio de las facultades que se me confieren en t�rminos de los art�culos, 138, 139, 142 primer p�rrafo, fracciones II y III, 154 primer p�rrafo, fracciones I, II y VIII, y 155 primer p�rrafo, fracci�n XXXII, inciso a), del Reglamento Interior del Instituto Mexicano del Seguro Social vigente, el suscrito emite el presente acuerdo y determina:
<br/>
Primero.- Ampliar el embargo sobre otros bienes propiedad del patr�n, cuyos datos se indican al principio del presente documento, a fin de que sean suficientes para garantizar el inter�s fiscal.
<br/>
Segundo.- Para cumplir lo ordenado en el punto que antecede, se designa a los 
        <asp:Label ID="LabelEjecutores" runat="server" Font-Bold="True"></asp:Label>
, como ejecutores para que practiquen la ampliaci�n de embargo ordenada y realicen los actos necesarios para llevar a cabo tal encomienda.        
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
  <strong style="text-align: center">ACTA DE AMPLIACI�N DE EMBARGO</strong>
  <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td style="text-align: justify;">
        En _________________ a las ____________ horas del d�a _______ de 
        __________________ de ______, el suscrito ejecutor se constituy� en el domicilio 
        fiscal del patr�n citado al rubro para dar cumplimiento al acuerdo de ampliaci�n 
        de embargo dictado por el Jefe de la Oficina para Cobros del Instituto Mexicano 
        del Seguro Social
        <asp:Label ID="LNombreJefeOficinaCobros2" runat="server" ></asp:Label>
        .
<br/>
Acto seguido, ante el C. _________________________________________________en su car�cter de ________________________________ y que se identifica con ____________________________________, quien es la persona con la que se lleva a cabo la diligencia, procedo a identificarme con ________________________________________, cercior�ndose que el patr�n o su representante legal _________________ atendi� el citatorio que se le hizo el d�a ___________________________________________, para que esperara en el domicilio citado el d�a de hoy a las _________________, a continuaci�n se da a conocer a la persona con quien se entiende esta diligencia, el acuerdo de ampliaci�n de embargo de fecha, ___________________________apercibi�ndolo que se proceder� al embargo de bienes suficientes y bastantes para garantizar el inter�s fiscal.
<br/>
El suscrito ejecutor inicia la diligencia de ampliaci�n de embargo, indic�ndole a la persona con quien se entiende, el derecho que tiene a designar dos testigos y a se�alar bienes en que trabar ejecuci�n, advirti�ndole que de negarse a ello o no hacerlo en el orden que establece el art�culo 155 del C�digo Fiscal de la Federaci�n, lo har� el ejecutor con apoyo en el art�culo 156 del propio ordenamiento.
<br/>
A continuaci�n, el C. ________________________________________________________ se�ala para embargo los siguientes bienes, ________ la intervenci�n de testigos.
<br />    
<table  border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.5em;"><tr><td align="center"><strong>DETALLE DE LOS BIENES EMBARGADOS</strong><br /><asp:Label ID="labelLeneas" runat="server"></asp:Label></td></tr></table>
El suscrito Ejecutor trab� embargo en los bienes descritos y con fundamento en el art�culo 153 del C�digo Fiscal de la Federaci�n, nombra depositario de los mismos al C. __________________________________________________ quien se identifica con ______________________________________________, acepta el cargo y protesta su fiel desempe�o, recibi�ndolos de conformidad y que se�ala como su domicilio particular el ubicado en __________________________________________________ quedando enterado que deber� custodiarlos, conservarlos y mantenerlos a disposici�n de la Oficina para Cobros del Instituto Mexicano del Seguro Social.
<br/>
Se hace constar que se entreg� a la persona con quien se entiende la presente diligencia, copia del acuerdo de ampliaci�n de embargo con firma aut�grafa del Jefe de la Oficina y acta de la diligencia, que firman las personas que en ella intervinieron, cuyos cargos y nombres se indican al calce.
<br/>
El presente acto administrativo de conformidad con el art�culo 23 de la Ley Federal de los Derechos del Contribuyente vigente, que en contra del presente acto (o resoluci�n), el medio de defensa procedente es el Recurso de Revocaci�n, cuyo plazo de presentaci�n es de cuarenta y cinco d�as h�biles siguientes a aqu�l en que haya surtido efectos su notificaci�n, y que deber� interponerse directamente ante esta Oficina Para Cobros del IMSS, o bien, puede optar por promover el Juicio Contencioso Administrativo Federal, ante la Sala Regional competente del Tribunal Federal de Justicia Fiscal y Administrativa, en la v�a tradicional por escrito, o a trav�s del Sistema de Justicia en L�nea, cuyo plazo de interposici�n para cualquiera de ellos, es de cuarenta y cinco d�as h�biles siguientes a aqu�l en que haya surtido efectos la notificaci�n del acto (o resoluci�n). O bien, podr� optarse, por tramitar en la v�a sumaria el Juicio Contencioso Administrativo Federal, cuando se impugnen resoluciones definitivas, cuyo importe no exceda de cinco veces el salario m�nimo general vigente en el Distrito Federal elevado al a�o al momento de su emisi�n. La demanda deber� presentarse dentro de los quince d�as siguientes a aqu�l en que surta efectos la notificaci�n de la resoluci�n impugnada; lo anterior con base en los art�culos 13, 58-1 y 58-2 de la Ley Federal del Procedimiento Contencioso Administrativo vigente y 295 de la Ley del Seguro Social vigente.
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
                <asp:Label ID="Label16" runat="server" Text="P&aacute;tron" Font-Bold="True"></asp:Label></td>
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


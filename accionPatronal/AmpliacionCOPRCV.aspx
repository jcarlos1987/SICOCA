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
    <td align="center"><strong style="font-weight: bold;">AMPLIACIÓN DE EMBARGO</strong></td>
    </tr>
    <tr>
    <td align="center"><strong style="font-weight: bold;">En MÉRIDA, YÚCATAN a <asp:Label ID="LFecha" runat="server"></asp:Label></strong> </td>
    </tr>
    </table>        
<table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">       
  <tr>
    <td style="text-align: justify">
Considerando que a juicio de esta Oficina Ejecutora, los bienes descritos en el acta de embargo de fecha _________________________, resultan insuficientes para cubrir el adeudo arriba detallado, con fundamento en los artículos 154 del Código Fiscal de la Federación vigente; 5, 5 A, 9, 251 primer párrafo, fracciones VII y XXV, 271 y 291 de la Ley del Seguro Social en vigor y en ejercicio de las facultades que se me confieren en términos de los artículos, 138, 139, 142 primer párrafo, fracciones II y III, 154 primer párrafo, fracciones I, II y VIII, y 155 primer párrafo, fracción XXXII, inciso a), del Reglamento Interior del Instituto Mexicano del Seguro Social vigente, el suscrito emite el presente acuerdo y determina:
<br/>
Primero.- Ampliar el embargo sobre otros bienes propiedad del patrón, cuyos datos se indican al principio del presente documento, a fin de que sean suficientes para garantizar el interés fiscal.
<br/>
Segundo.- Para cumplir lo ordenado en el punto que antecede, se designa a los 
        <asp:Label ID="LabelEjecutores" runat="server" Font-Bold="True"></asp:Label>
, como ejecutores para que practiquen la ampliación de embargo ordenada y realicen los actos necesarios para llevar a cabo tal encomienda.        
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
  <strong style="text-align: center">ACTA DE AMPLIACIÓN DE EMBARGO</strong>
  <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td style="text-align: justify;">
        En _________________ a las ____________ horas del día _______ de 
        __________________ de ______, el suscrito ejecutor se constituyó en el domicilio 
        fiscal del patrón citado al rubro para dar cumplimiento al acuerdo de ampliación 
        de embargo dictado por el Jefe de la Oficina para Cobros del Instituto Mexicano 
        del Seguro Social
        <asp:Label ID="LNombreJefeOficinaCobros2" runat="server" ></asp:Label>
        .
<br/>
Acto seguido, ante el C. _________________________________________________en su carácter de ________________________________ y que se identifica con ____________________________________, quien es la persona con la que se lleva a cabo la diligencia, procedo a identificarme con ________________________________________, cerciorándose que el patrón o su representante legal _________________ atendió el citatorio que se le hizo el día ___________________________________________, para que esperara en el domicilio citado el día de hoy a las _________________, a continuación se da a conocer a la persona con quien se entiende esta diligencia, el acuerdo de ampliación de embargo de fecha, ___________________________apercibiéndolo que se procederá al embargo de bienes suficientes y bastantes para garantizar el interés fiscal.
<br/>
El suscrito ejecutor inicia la diligencia de ampliación de embargo, indicándole a la persona con quien se entiende, el derecho que tiene a designar dos testigos y a señalar bienes en que trabar ejecución, advirtiéndole que de negarse a ello o no hacerlo en el orden que establece el artículo 155 del Código Fiscal de la Federación, lo hará el ejecutor con apoyo en el artículo 156 del propio ordenamiento.
<br/>
A continuación, el C. ________________________________________________________ señala para embargo los siguientes bienes, ________ la intervención de testigos.
<br />    
<table  border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.5em;"><tr><td align="center"><strong>DETALLE DE LOS BIENES EMBARGADOS</strong><br /><asp:Label ID="labelLeneas" runat="server"></asp:Label></td></tr></table>
El suscrito Ejecutor trabó embargo en los bienes descritos y con fundamento en el artículo 153 del Código Fiscal de la Federación, nombra depositario de los mismos al C. __________________________________________________ quien se identifica con ______________________________________________, acepta el cargo y protesta su fiel desempeño, recibiéndolos de conformidad y que señala como su domicilio particular el ubicado en __________________________________________________ quedando enterado que deberá custodiarlos, conservarlos y mantenerlos a disposición de la Oficina para Cobros del Instituto Mexicano del Seguro Social.
<br/>
Se hace constar que se entregó a la persona con quien se entiende la presente diligencia, copia del acuerdo de ampliación de embargo con firma autógrafa del Jefe de la Oficina y acta de la diligencia, que firman las personas que en ella intervinieron, cuyos cargos y nombres se indican al calce.
<br/>
El presente acto administrativo de conformidad con el artículo 23 de la Ley Federal de los Derechos del Contribuyente vigente, que en contra del presente acto (o resolución), el medio de defensa procedente es el Recurso de Revocación, cuyo plazo de presentación es de cuarenta y cinco días hábiles siguientes a aquél en que haya surtido efectos su notificación, y que deberá interponerse directamente ante esta Oficina Para Cobros del IMSS, o bien, puede optar por promover el Juicio Contencioso Administrativo Federal, ante la Sala Regional competente del Tribunal Federal de Justicia Fiscal y Administrativa, en la vía tradicional por escrito, o a través del Sistema de Justicia en Línea, cuyo plazo de interposición para cualquiera de ellos, es de cuarenta y cinco días hábiles siguientes a aquél en que haya surtido efectos la notificación del acto (o resolución). O bien, podrá optarse, por tramitar en la vía sumaria el Juicio Contencioso Administrativo Federal, cuando se impugnen resoluciones definitivas, cuyo importe no exceda de cinco veces el salario mínimo general vigente en el Distrito Federal elevado al año al momento de su emisión. La demanda deberá presentarse dentro de los quince días siguientes a aquél en que surta efectos la notificación de la resolución impugnada; lo anterior con base en los artículos 13, 58-1 y 58-2 de la Ley Federal del Procedimiento Contencioso Administrativo vigente y 295 de la Ley del Seguro Social vigente.
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


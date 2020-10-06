<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MandamientoCOPRCV.aspx.vb" Inherits="WebSIRECA.MandamientoCOPRCV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Mandamiento</title>    
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
    <td>
        <asp:Image ID="ImageLogo" runat="server" />
        </td>
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
                        Font-Bold="True" Font-Size="7pt"></asp:Label></td>
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
        <td style="text-align: right; vertical-align: top"><strong style="text-align: right">COFI 01</strong></td>
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
    <td align="center"><strong style="font-weight: bold;">MANDAMIENTO DE EJECUCI&Oacute;N</strong></td>
    </tr>
    <tr>
    <td align="center"><strong style="font-weight: bold;">En M�RIDA, Y�CATAN a <asp:Label ID="LFecha" runat="server"></asp:Label></strong> </td>
    </tr>
    </table>        
<table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">       
  <tr>
    <td style="text-align: justify">

        &nbsp;De las constancias que obran en el expediente formado en este Instituto a 
        nombre del deudor citado al rubro, se desprende que el adeudo arriba detallado, 
        mismo que fue debidamente determinado en cantidad liquida y notificado al 
        deudor, no fue cubierto ni garantizado dentro del t�rmino que para ese efecto 
        se�alan los art�culos 39 de la Ley del Seguro Social, 127 del Reglamento de la 
        Ley del Seguro Social en Materia de Afiliaci�n, Clasificaci�n de Empresas, 
        Recaudaci�n y Fiscalizaci�n, y 144, primer p�rrafo, del C�digo Fiscal de la 
        Federaci�n, por lo que son exigibles para los efectos del art�culo 145 del 
        C�digo citado, en correlaci�n con los art�culos 251, fracci�n XXV, 251 A, 287 y 
        291 de la Ley del Seguro Social en vigor. En tal virtud, el suscrito Jefe de la 
        Oficina para Cobros del IMSS, en ejercicio de las facultades que le confiere el 
        art�culo 271 de la Ley del Seguro Social en vigor, as� como en los art�culos ; 
        2, primer p�rrafo, fracci�n VI, incisos b) y c), 138, 139 y 142, primer p�rrafo 
        fracciones II y III, 154, primer p�rrafo, fracciones I, II y VIII y 155, primer 
        p�rrafo, fracci�n XXXII, inciso b), del Reglamento Interior del Instituto 
        Mexicano del Seguro Social vigente, emite el presente mandamiento de ejecuci�n y 
        determina:<br /> PRIMERO.- Es procedente exigir el pago de los cr�ditos fiscales 
        referidos mediante el procedimiento administrativo de ejecuci�n, por lo que se 
        ordena al Ejecutor designado, que en los t�rminos de los art�culos 150, 151, 152 
        y 153 del C�digo citado, requiera de pago al deudor para que en el mismo acto 
        del requerimiento acredite el pago efectuado de los cr�ditos se�alados al rubro, 
        y de no hacerlo, se le embarguen bienes de su propiedad suficientes para obtener 
        el pago correspondiente mediante su remate o venta fuera de remate.<br /> 
        SEGUNDO.- Para cumplir lo ordenado en el punto que antecede, se designa a los
        <asp:Label ID="LabelEjecutores" runat="server" Font-Bold="True"></asp:Label>
        , para el efecto que de manera conjunta o separada, practiquen el requerimiento 
        de pago y el embargo en su caso, y con fundamento en el Art�culo 153 del propio 
        C�digo Fiscal, designen depositario de los bienes que embargue.<br /> TERCERO.- 
        Con fundamento en el Art�culo 13 del C�digo Fiscal de la Federaci�n, se habilita 
        ________________________________________________________ para la pr�ctica de la 
        diligencia de que se trata, en virtud de 
        ___________________________________________________________________________.<br />

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
  <strong style="text-align: center">REQUERIMIENTO DE PAGO</strong>
  <table border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.0em;">
    <tr>
    <td style="text-align: justify;">
        En ______________________________________ a las _________ horas del d�a 
        ____________ de _______________________ de ______, fecha y hora se�alados en el 
        citatorio de fecha _______ de _________________ de ________, mismo que fuera 
        entendido por el C. __________________________________________, entreg�ndosele 
        el citatorio y quien manifest� ser ____________________________________________ 
        del patr�n, citatorio del que se anexa copia, formulado al patr�n o su 
        representante legal para llevar a cabo la presente diligencia, el suscrito 
        Ejecutor Fiscal __________________________ se constituye en el domicilio fiscal 
        del patr�n ____________________________ ubicado en ______________, y 
        cercior�ndome de que es el domicilio fiscal de este, porque coincide con los 
        datos del domicilio fiscal que el patr�n manifest� ante el Instituto, para dar 
        cumplimiento al Mandamiento de Ejecuci�n que antecede, dictado por el Jefe de la 
        Oficina para Cobros de la Subdelegaci�n M�rida _______, �rgano operativo en 
        Yucat�n del Instituto Mexicano del Seguro Social citado al rubro, dicho ejecutor 
        se identifica con credencial n�mero ____, con vigencia del d�a ________ de _____ 
        de 2013, y hasta el ____ de ____ 2013, suscrita por la C. <strong>
        <asp:Label ID="LNombreJefeOficinaCobros34" runat="server" 
            style="text-decoration: underline"></asp:Label>
        ,</strong> Jefa de la Oficina para Cobros de la Subdelegaci�n M�rida
        <asp:Label ID="LSubdel" runat="server"></asp:Label>
        , �rgano Operativo en Yucat�n del Instituto Mexicano del Seguro Social, ante la 
        persona que en este momento se encuentra en dicho domicilio, quien manifiesta 
        llamarse _____________________________________, e informa a requerimiento del 
        ejecutor, que el patr�n deudor o su representante legal ________ se encuentra 
        presente en este momento. En tal virtud, se procede a realizar las diligencias 
        ordenadas, entendi�ndolas con el C. ___________________________________________, 
        en su car�cter de __________________________________del patr�n citado, quien se 
        encuentra presente en el domicilio antes se�alado y se identifica con 
        _________________________________________________, con n�mero _________________ 
        expedida por________________, para lo cual en este acto se le requiere que 
        acredite el pago efectuado del cr�dito fiscal se�alado al rubro, apercibi�ndole 
        que en caso de no acreditarlo o no realizarlo en este momento, se proceder� de 
        inmediato a embargar bienes suficientes para garantizarlo, habiendo manifestado:
        <br />
        ( ) Que el cr�dito fiscal citado al rubro, ya fue pagado y entrega copia simple 
        del comprobante de pago expedido por el 
        banco___________________________________________________, el d�a ______ del 
        mes________________ de __________ con n�mero de folio _________________ e 
        importe de $___________________. 
        <br />
(  ) Que en este acto efect�a el pago del cr�dito y sus accesorios, y el C. Ejecutor le entrega recibo provisional n�mero _______________ por la cantidad de $ ________________________ (_________________________________________________), inform�ndole que deber� canjearlo, por el comprobante de pago respectivo, ante la Oficina Ejecutora, por lo que se da por concluida la presente diligencia.
<br />
(  ) Que no puede acreditar el pago ni puede cubrir desde luego el adeudo, por lo que se procede al embargo en los t�rminos del acta que aparece en el cuerpo de este documento.
    
    <table  border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.5em;"><tr><td align="center"><strong>ACTA DE EMBARGO</strong></td></tr></table>
        En vista de no haberse acreditado el pago del cr�dito fiscal en el requerimiento, el suscrito ejecutor fiscal C._____________________ quien se id�ntico como qued� se�alado en el mandamiento arriba indicado,  inicia la diligencia de embargo, indicando a la persona con quien se entiende la diligencia, el derecho que tiene a designar dos testigos y a se�alar bienes en que trabar ejecuci�n, haciendo de su conocimiento que los mismos deben ser de f�cil realizaci�n o venta, y advirti�ndole que de negarse a se�alarlos o no hacerlo en el orden que establece el art�culo 155 del C�digo Fiscal de la Federaci�n, lo har� el ejecutor con apoyo en el art�culo 156 del propio Ordenamiento. Asimismo, se le hace saber que en caso de se�alar para embargo bienes inmuebles, deber� manifestar, bajo protesta de decir verdad, si dichos bienes reportan cualquier gravamen real, embargo anterior, se encuentran en copropiedad o pertenecen a sociedad conyugal alguna, y que tales hechos deber� acreditarlos ante la Oficina ejecutora dentro de los 15 d�as siguientes a la presente diligencia.
        <br />
        A continuaci�n, el C. ______________________________________ en su car�cter de 
        ____________________ procede _______________ la intervenci�n de testigos, a 
        se�alar para embargo los bienes siguientes:
    <table  border ="0" cellpadding ="0" cellspacing ="0" style="line-height: 1.5em;"><tr><td align="center"><asp:Label ID="labelLeneas" runat="server"></asp:Label></td></tr></table>
        Acto seguido, el suscrito ejecutor fiscal, traba embargo en los bienes descritos 
        y con fundamento en el art�culo 153 del C�digo Fiscal de la Federaci�n, nombra 
        depositario de los mismos al C. ______________________________________, en su 
        car�cter quien acepta el cargo y protesta su fiel desempe�o, recibe los bienes 
        de conformidad, se�ala como su domicilio particular 
        ______________________________________________________ que comprueba con 
        _______________________________________________, quedando enterado que deber� 
        custodiar los bienes y conservarlos a disposici�n del Instituto Mexicano del 
        Seguro Social, para entregarlos cuando as� le sea requerido, quedando enterado 
        de las obligaciones y responsabilidades se�aladas en los Art�culos 112, 153, 
        161, y 164 al 167 del C�digo Fiscal de la Federaci�n.
<br/>
Se hace constar que se entrega a la persona con quien se entienden las diligencias, copia del Mandamiento de Ejecuci�n con firma aut�grafa del Jefe de la Oficina Ejecutora, y copia del acta de las presentes diligencias, que firman las personas que intervinieron en las mismas y quisieron hacerlo, cuyos cargos y nombres se indican al calce. 
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
                <asp:Label ID="Label17" runat="server" Text="P&aacute;tron y/o Persona con quien se 
			entiende la deligencia" Font-Bold="True"></asp:Label></td>
			<td align="center">
                <asp:Label ID="Label16" runat="server" Text="Depositario" Font-Bold="True"></asp:Label></td>
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


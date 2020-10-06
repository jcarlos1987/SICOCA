Imports System.Data.OleDb

Public Class getdatosdelpatron
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Clear()
        Response.ContentType = "text/xml"
        'Response.ContentType = "text/plain"

        Response.ContentEncoding = Encoding.UTF8
        If Not Request.QueryString("credito") Is Nothing Then
            If Request.QueryString("credito").ToString.Length = 9 Then
                If Not Request.QueryString("keycode") Is Nothing Then
                    If Request.QueryString("keycode").ToString.Equals("ghHsSSK3yQ2H01X39rtRSc98pq080_s0Ll511ll1ll3s3s4s5s55SSs646712SIR44A444VECA2Tq01z743Hzwwvvvdq230R80t6kEy") Then
                        Response.Write(datosdelpatron)
                    Else
                        Response.Write("0")
                    End If
                Else
                    Response.Write("0")
                End If
            Else
                Response.Write("0")
            End If
        Else
            Response.Write("0")
        End If
        Response.End()
    End Sub
    Private Function datosdelpatron() As String
        Dim subdel As String = ""
        Dim tipo As String = ""
        Dim reg_patronal As String = ""
        Dim credito As String = ""
        Dim periodo As String = ""
        Dim importe As String = ""
        Dim razon_social As String = ""
        Dim rfc As String = ""
        Dim actividad As String = ""
        Dim localidad As String = ""
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " DECLARE @RALECOP01 as VARCHAR(50) " _
& " DECLARE @RALERCV01 as VARCHAR(50) " _
& " DECLARE @RALECOP33 as VARCHAR(50) " _
& " DECLARE @RALERCV33 as VARCHAR(50) " _
& " DECLARE @CREDITO as VARCHAR(9) " _
& " SET @RALECOP01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='COP' order by fecha desc) " _
& " SET @RALERCV01=(select top 1 [name] from rale.dbo.tablas where subdel='01' and tipo='RCV' order by fecha desc) " _
& " SET @RALECOP33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='COP' order by fecha desc) " _
& " SET @RALERCV33=(select top 1 [name] from rale.dbo.tablas where subdel='33' and tipo='RCV' order by fecha desc) " _
& " SET @CREDITO='" + Request.QueryString("credito").ToString + "' " _
& " exec(' " _
& " select top 1 rale.subdel as SUBDEL,rale.tipo as TIPO,rale.regpat AS REG_PATRONAL,rale.numcred as CREDITO,rale.periodo as PERIODO,rale.importe as IMPORTE,ptn.razonSocial as RAZON_SOCIAL,ptn.rfc as RFC,ptn.act as ACTIVIDAD,ptn.loc as LOCALIDAD " _
& " from ( " _
& " select ''01'' as SUBDEL,''COP'' as TIPO,replace(REGPATR,''-'','''') as REGPAT,NUMCRED,substring(PERIODO,4,7) as PERIODO,IMPORTE from rale.dbo.['+@RALECOP01+'] " _
& " where NUMCRED like ''%'+@CREDITO+''' " _
& " union all " _
& " select ''01'' as SUBDEL,''RCV'' as TIPO,replace(REGPATR,''-'','''') as REGPAT,NUMCRED,substring(PERIODO,4,7) as PERIODO,IMPORTE from rale.dbo.['+@RALERCV01+'] " _
& " where NUMCRED like ''%'+@CREDITO+''' " _
& " union all " _
& " select ''33'' as SUBDEL,''COP'' as TIPO,replace(REGPATR,''-'','''') as REGPAT,NUMCRED,substring(PERIODO,4,7) as PERIODO,IMPORTE from rale.dbo.['+@RALECOP33+'] " _
& " where NUMCRED like ''%'+@CREDITO+''' " _
& " union all " _
& " select ''33'' as SUBDEL,''RCV'' as TIPO,replace(REGPATR,''-'','''') as REGPAT,NUMCRED,substring(PERIODO,4,7) as PERIODO,IMPORTE from rale.dbo.['+@RALERCV33+'] " _
& " where NUMCRED like ''%'+@CREDITO+''' " _
& " ) as rale left join sireca.dbo.patrones as ptn on rale.REGPAT=ptn.REGPAT " _
& " ') "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                subdel = myReader2.GetValue(0).ToString
                tipo = myReader2.GetValue(1).ToString
                reg_patronal = myReader2.GetValue(2).ToString
                credito = myReader2.GetValue(3).ToString
                periodo = myReader2.GetValue(4).ToString
                importe = myReader2.GetValue(5).ToString
                razon_social = myReader2.GetValue(6).ToString
                rfc = myReader2.GetValue(7).ToString
                actividad = myReader2.GetValue(8).ToString
                localidad = myReader2.GetValue(9).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        'Return (subdel & ";" & tipo & ";" & reg_patronal & ";" & credito & ";" & periodo & ";" & importe & ";" & razon_social & ";" & rfc & ";" & actividad & ";" & localidad)
        Dim datosxml As String = "<datos>"
        datosxml += "<subdel>" & subdel & "</subdel>"
        datosxml += "<tipo>" & tipo & "</tipo>"
        datosxml += "<registroPatronal>" & reg_patronal & "</registroPatronal>"
        datosxml += "<credito>" & credito & "</credito>"
        datosxml += "<periodo>" & periodo & "</periodo>"
        datosxml += "<importe>" & importe & "</importe>"
        datosxml += "<razonSocial>" & razon_social & "</razonSocial>"
        datosxml += "<rfc>" & rfc & "</rfc>"
        datosxml += "<actividad>" & actividad & "</actividad>"
        datosxml += "<localidad>" & localidad & "</localidad>"
        datosxml += "</datos>"
        Return datosxml
    End Function
End Class
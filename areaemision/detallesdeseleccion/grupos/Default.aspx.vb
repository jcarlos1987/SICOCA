Imports addHistorialAcciones

Public Class _Default27
    Inherits System.Web.UI.Page
    Dim histAcciones As HistorialWeb = New HistorialWeb
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Try
            Dim direccion As String = Request.Url.AbsolutePath
            Dim direccionGet As String = Request.Url.AbsoluteUri.Split("?").GetValue(1).ToString
            If direccionGet.Length < 254 Then
                direccionGet = direccionGet
            Else
                direccionGet = direccionGet.Substring(0, 254)
            End If
            histAcciones.agregarHistorial(cadenaconexion, Request.QueryString("subdel").ToString, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "", direccion, Request.QueryString("anio").ToString, Request.QueryString("mes").ToString, direccionGet, "regpat", Request.UserHostAddress)
            'mes=02&anio=2013&subdel=01&tipo_eco=1&tipo_file=COMP&incidencia=NO LOCALIZADOS
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count & " RESULTADOS, CLASIFICACIÓN: " & Request.QueryString("incidencia").ToString & ", SUBDELEGACIÓN:" & Request.QueryString("subdel").ToString & ", del periodo: " & Request.QueryString("mes").ToString & "/" & Request.QueryString("anio").ToString & "</strong>"
    End Sub
End Class
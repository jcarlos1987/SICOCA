Imports System.Globalization
Imports System.Data.OleDb

Public Class reporteDescriptivo
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("tipo_trabajo").Equals("ATENDIDO") Then
            Image1.Visible = False
        Else
            Image1.Visible = True
        End If
    End Sub

    Protected Sub GVReporte2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVReporte2.PreRender
        Dim cotiz As String = ""
        If IsNumeric(Request.QueryString("cotizantes").ToString) Then
            cotiz = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("cotizantes").ToString))
        Else
            cotiz = "desconocido"
        End If
        GVReporte2.Caption = "" _
            & "<strong style='font-size: 18px; color: #CC3300;' >" & getNombreUser() & "</strong><br/>" _
            & "<strong style='font-size: 18px'>PATRONES:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("patrones").ToString)) & "</strong>," _
            & "<strong style='font-size: 18px'>COTIZANTES:</strong><strong style='font-size: 18px; color: #CC3300;' >" & cotiz & "</strong>," _
            & "<strong style='font-size: 18px'>CREDITOS:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("creditos").ToString)) & "</strong>," _
            & "<strong style='font-size: 18px'>IMPORTE:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("importe").ToString)) & "</strong>," _
            & "<strong style='font-size: 18px'>ESTADO:</strong><strong style='font-size: 18px; color: #CC3300;' >" & Request.QueryString("tipo_trabajo").ToString & "</strong>"
    End Sub
    Private Function getNombreUser() As String
        Dim nomUser As String = ""
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT top 1 uf.nombre FROM fiscamovil.dbo.usuarios as uf where convert(varchar,uf.id)='" & Request.QueryString("id_ejecutor").ToString & "' "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                nomUser = myReader2.GetValue(0)
                Exit Do
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
        Return nomUser
    End Function
End Class
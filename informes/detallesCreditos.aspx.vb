Imports System.Globalization
Imports System.Data.OleDb

Public Class detallesCreditos
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("tipo_reporte").ToString.Equals("general") Then
            GVDCreditos.DataSourceID = "SqlDataSourceDCreditosGeneral"
            GVDCreditos.DataBind()
        ElseIf Request.QueryString("tipo_reporte").ToString.Equals("descriptivo") Then
            GVDCreditos.DataSourceID = "SqlDataSourceDCreditos"
            GVDCreditos.DataBind()
        End If
    End Sub

    Protected Sub GVDCreditos_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVDCreditos.PreRender
        Try
            Dim cotiz As String = ""
            If IsNumeric(Request.QueryString("cotizantes").ToString) Then
                cotiz = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("cotizantes").ToString))
            Else
                cotiz = "desconocido"
            End If
            GVDCreditos.Caption = "" _
                        & "<strong style='font-size: 18px; color: #CC3300;' >" & getNombreUser() & "</strong><br/>" _
                        & "<strong style='font-size: 18px'>" & Request.QueryString("regpat").ToString & "</strong><strong style='font-size: 18px; color: #CC3300;' > (" _
                        & Request.QueryString("razonSocial").ToString & ")</strong>," _
                        & "<strong style='font-size: 18px'>COTIZANTES:</strong><strong style='font-size: 18px; color: #CC3300;' >" & cotiz & "</strong>," _
                        & "<strong style='font-size: 18px'>CREDITOS:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:N0}", GVDCreditos.Rows.Count) & "</strong>," _
                        & "<strong style='font-size: 18px'>IMPORTE:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("adeudo").ToString)) & "</strong>," _
                        & "<strong style='font-size: 18px'>ESTADO:</strong><strong style='font-size: 18px; color: #CC3300;' >" & Request.QueryString("tipo_trabajo").ToString & "</strong>"
        Catch ex As Exception

        End Try

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
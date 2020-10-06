Imports System.Globalization
Imports System.Data.OleDb

Public Class detallesSeleccion1
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("tipo_reporte").ToString.Equals("general") Then
            GVDRepotGeneral.DataSourceID = "SqlDataSourceReportGeneral"
            GVDRepotGeneral.DataBind()
        ElseIf Request.QueryString("tipo_reporte").ToString.Equals("descriptivo") Then
            GVDRepotGeneral.DataSourceID = "SqlDataSourceReportDescrip"
            GVDRepotGeneral.DataBind()
        End If
    End Sub

    Protected Sub GVDRepotGeneral_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVDRepotGeneral.PreRender
        Try
            GVDRepotGeneral.Caption = "" _
            & "<strong style='font-size: 18px; color: #CC3300;' >" & getNombreUser() & "</strong><br/>" _
            & "<strong style='font-size: 18px'>PATRONES:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:N0}", GVDRepotGeneral.Rows.Count) & "</strong>," _
            & "<strong style='font-size: 18px'>CREDITOS:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(Request.QueryString("creditos").ToString)) & "</strong>," _
            & "<strong style='font-size: 18px'>IMPORTE:</strong><strong style='font-size: 18px; color: #CC3300;' >" & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("importe").ToString)) & "</strong>," _
            & "<strong style='font-size: 18px'>ESTADO:</strong><strong style='font-size: 18px; color: #CC3300;' >" & Request.QueryString("tipo_trabajo").ToString & "</strong>"
            GVDRepotGeneral.FooterRow.Cells(2).Text = "0"
            GVDRepotGeneral.FooterRow.Cells(3).Text = "0"
            GVDRepotGeneral.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GVDRepotGeneral.Rows.Count - 1)
                Dim hl1 As HyperLink = GVDRepotGeneral.Rows(i).FindControl("HyperLink1")
                GVDRepotGeneral.FooterRow.Cells(2).Text = Convert.ToDouble(GVDRepotGeneral.FooterRow.Cells(2).Text) + Convert.ToDouble(hl1.Text.Replace(",", ""))
                GVDRepotGeneral.FooterRow.Cells(3).Text = Convert.ToDouble(GVDRepotGeneral.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GVDRepotGeneral.FooterRow.Cells(3).Text.Replace(",", ""))
                GVDRepotGeneral.FooterRow.Cells(4).Text = Convert.ToDouble(GVDRepotGeneral.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GVDRepotGeneral.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GVDRepotGeneral.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVDRepotGeneral.FooterRow.Cells(2).Text))
            GVDRepotGeneral.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVDRepotGeneral.FooterRow.Cells(3).Text))
            GVDRepotGeneral.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GVDRepotGeneral.FooterRow.Cells(4).Text))
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
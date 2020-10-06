Public Class DetallesPatron1
    Inherits System.Web.UI.Page
    Dim verde As String = ConfigurationSettings.AppSettings("Color0")
    Dim amarillo As String = ConfigurationSettings.AppSettings("Color30")
    Dim rojo As String = ConfigurationSettings.AppSettings("Color90")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSourceDetallesPatron.SelectCommand = SqlDataSourceDetallesPatron.SelectCommand.Replace("cop187", "cop187" & Request.UserHostAddress.Replace(".", "_"))
    End Sub
    Private Sub colorizar()
        For index As Integer = 0 To (GridView1.Rows.Count - 1)
            If GridView1.Rows(index).Cells(0).Text.Equals("1verde") Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(verde)
            ElseIf GridView1.Rows(index).Cells(0).Text.Equals("2amarillo") Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(amarillo)
            ElseIf GridView1.Rows(index).Cells(0).Text.Equals("3rojo") Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(rojo)
            End If
        Next
    End Sub
    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " CREDITO(S)."
        colorizar()
    End Sub
End Class
Public Class detalle
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            Dim rutaInc32 As String = Server.MapPath("\fotosIncidencia\" & CType(GridView1.Rows(i).Cells(11).FindControl("HyperLink2"), HyperLink).Text.Substring(0, 10) & "\32")
            If System.IO.Directory.Exists(rutaInc32) Then
                CType(GridView1.Rows(i).Cells(11).FindControl("HyperLink1"), HyperLink).Visible = True
                CType(GridView1.Rows(i).Cells(11).FindControl("HyperLink1"), HyperLink).NavigateUrl = "~\fotosIncidencia\" & CType(GridView1.Rows(i).Cells(11).FindControl("HyperLink2"), HyperLink).Text.Substring(0, 10) & "\32"
            End If
        Next
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Resultados con incidencia " & Request.QueryString("inc").ToString
        
    End Sub
End Class
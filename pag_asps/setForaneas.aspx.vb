Public Class setForaneas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then

            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " PATRONES DISPONIBLES"
        HiddenField1.Value = "var "
        For i As Int16 = 0 To (GridView1.Rows.Count - 1)
            HiddenField1.Value += "marker = createMarker('" & GridView1.Rows(i).Cells(6).Text & "<br/><em>" & GridView1.Rows(i).Cells(8).Text & "</em>',new google.maps.LatLng(" & GridView1.Rows(i).Cells(22).Text & "," & GridView1.Rows(i).Cells(23).Text & "));"
            'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView1.Rows(i).Cells(9).Text & "," & GridView1.Rows(i).Cells(8).Text & "), map: map});"
        Next
    End Sub
End Class
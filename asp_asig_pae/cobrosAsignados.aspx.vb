Public Class cobrosAsignados1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Session.Item("SIRECAuser") Is Nothing Then
        'Response.Redirect("~/Login.aspx")
        'Else
        'If (Session.Item("SIRECAsubdel").ToString <> "00") And (Session.Item("SIRECAuser_type").ToString.Equals("10") Or Session.Item("SIRECAuser_type").ToString.Equals("11")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
        LNom1.Text = Request.QueryString("nombre").ToString
        LNom2.Text = Request.QueryString("nombre").ToString
        'Else
        'Response.Redirect("~/Login.aspx")
        'End If
        'End If
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        GridView1.Caption = "<h2>Factura(s): " & GridView1.Rows.Count & "</h2>"
        Try
            GridView1.Caption = "Factura(s) Actual(es): " & GridView1.Rows.Count
            If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                HFOrigen.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                HFDestino.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
            ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                HFOrigen.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                HFDestino.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
            End If
            HiddenField1.Value = "var "
            For i As Int16 = 0 To (GridView1.Rows.Count)
                HiddenField1.Value += "marker = createMarker('" & GridView1.Rows(i).Cells(6).Text & "',new google.maps.LatLng(" & GridView1.Rows(i).Cells(11).Text & "," & GridView1.Rows(i).Cells(12).Text & "));"
                'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"
            Next
        Catch ex As Exception

        End Try
    End Sub
End Class
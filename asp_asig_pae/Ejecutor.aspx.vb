Public Class Ejecutor1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session.Item("SIRECAuser") Is Nothing Then
                Response.Redirect("~/Login.aspx")
            Else
                If (Session.Item("SIRECAsubdel").ToString <> "00") And (Session.Item("SIRECAuser_type").ToString.Equals("10") Or Session.Item("SIRECAuser_type").ToString.Equals("11")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                    'Dim st() As String = Session.Item("SIRECAsectores").ToString.Split("-")       
                    ImageButton1.OnClientClick = "javascript:void window.open('imprimir.aspx?fecha=" & DDLFechas.Text & "', 'cobros', 'fullscreen=no scrollbars=yes top=0 left=0 width=850 height=500 menu=no status=no')"
                Else
                    Response.Redirect("~/Login.aspx")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Try
            GridView2.Caption = "Factura(s) Actual(es): " & GridView2.Rows.Count
            If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                HFOrigen.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                HFDestino.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
            ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                HFOrigen.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                HFDestino.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
            End If
            HiddenField1.Value = "var "
            For i As Int16 = 0 To (GridView2.Rows.Count)

                HiddenField1.Value += "marker = createMarker('" & GridView2.Rows(i).Cells(3).Text & "',new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "));"
                'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"

            Next
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        GridView2.DataBind()
    End Sub
End Class
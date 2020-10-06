Imports System.Globalization

Public Class PaesAsignados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones"
        Try
            GridView1.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                    Dim hl1 As HyperLink = GridView1.Rows(i).FindControl("HyperLink1")
                    hl1.Visible = True
                Else
                    Dim hl1 As HyperLink = GridView1.Rows(i).FindControl("HyperLink1")
                    hl1.Visible = False
                End If
                'GridView7.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView7.FooterRow.Cells(0).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(6).Text = Convert.ToDouble(GridView1.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))
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
                    HiddenField1.Value += "marker = createMarker('" & GridView1.Rows(i).Cells(3).Text & "',new google.maps.LatLng(" & GridView1.Rows(i).Cells(7).Text & "," & GridView1.Rows(i).Cells(8).Text & "));"
                    'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"
                Next
            Catch ex As Exception
            End Try
        Catch ex As Exception

        End Try
    End Sub
End Class
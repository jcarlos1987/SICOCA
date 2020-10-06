Public Class cobrosAsignadoscobros
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            
        End If

    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        GridView1.Caption = "<h2>Factura(s): " & GridView1.Rows.Count & "</h2>"
        Try
            GridView1.Caption = "Factura(s) Actual(es): " & GridView1.Rows.Count
            If Request.QueryString("subdel").ToString.Equals("01") Then
                HFOrigen.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                HFDestino.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
            ElseIf Request.QueryString("subdel").ToString.Equals("33") Then
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

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -1, Now)))
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub
End Class
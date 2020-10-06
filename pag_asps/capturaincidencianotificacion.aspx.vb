Public Class capturaincidencianotificacion
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("IA") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorA.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("IB") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorB.Master"
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(Now) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
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

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        GridView2.DataBind()
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        GridView2.DataBind()
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        'longitud=24, latitud=25        
        Try
            If e.Row.RowIndex >= 0 Then
                If e.Row.RowIndex = 0 Then
                    If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                        HFOrigen.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                        HFDestino.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                    ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                        HFOrigen.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                        HFDestino.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                    End If
                    HiddenField1.Value = "var "
                End If
                HiddenField1.Value += "marker = createMarker('" & e.Row.DataItem(3).ToString() & "',new google.maps.LatLng(" & e.Row.DataItem(25).ToString() & "," & e.Row.DataItem(24).ToString() & "));"
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
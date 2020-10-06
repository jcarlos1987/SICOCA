Imports System.Data.OleDb

Public Class capturainspectorb
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session.Item("SIRECAuser") Is Nothing Then
                Response.Redirect("~/Login.aspx")
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
            'For i As Int16 = 0 To (GridView2.Rows.Count)
            'HiddenField1.Value += " marker = createMarker('" & GridView2.Rows(i).Cells(5).Text & "',new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "));"
            ''HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"
            'Next
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        GridView2.DataBind()
    End Sub

    Protected Sub BComentar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BComentar.Click
        LError.Text = ""
        If TBObservacion.Text.Replace(" ", "").Length > 1 Then
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaObservaciones].[dbo].[ObservacionInspector]([id_inspector],[id_observo],[fecha_observacion],[observacion],[ip_host]) "
            myInsertQuery22 += " VALUES(?,?,getdate(),?,?) "
            cmd22.CommandText = myInsertQuery22

            cmd22.Parameters.Add("@id_inspector", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@id_observo", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = TBObservacion.Text
            cmd22.Parameters.Add("@ip_host", OleDbType.VarChar).Value = Request.UserHostAddress()

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LError.Text = "Error al Comentar"
            Else
                Repeater1.DataBind()
            End If
            con22.Close()
        End If
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

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(Now) - 1)
    End Sub

    Protected Sub BActualizarInspector_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarInspector.Click
        Wizard1.DataBind()
    End Sub

    Protected Sub DDLFechas_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLFechas.PreRender
        Try
            ImageButton1.OnClientClick = "javascript:void window.open('imprimir.aspx?fecha=" & DDLFechas.Text & "', 'cobros', 'fullscreen=no scrollbars=yes top=0 left=0 width=850 height=500 menu=no status=no')"
        Catch ex As Exception

        End Try
    End Sub
End Class
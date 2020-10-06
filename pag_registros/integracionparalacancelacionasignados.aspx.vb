Public Class integracionparalacancelacionasignados
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Protected Sub GVNDeligenciados_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVNDeligenciados.PreRender
        GVNDeligenciados.Caption = "<strong>" & GVNDeligenciados.Rows.Count.ToString & " PARA LA INTEGRACION DE CANCELACION ASIGNADOS</strong>"
    End Sub

    Protected Sub DDLIntegrador_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLIntegrador.PreRender
        If DDLIntegrador.Items.Contains(New ListItem("TODOS", "%")) Then
        Else
            DDLIntegrador.Items.Add(New ListItem("TODOS", "%"))
        End If
    End Sub

    Protected Sub BBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BBuscar.Click
        GVNDeligenciados.DataBind()
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = Month(Now)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
    End Sub

End Class
Public Class verificados
    Inherits System.Web.UI.Page
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session.Item("SIRECAsubdel") Is Nothing Then
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                HiddenFieldSubdel.Value = "%"
            Else
                HiddenFieldSubdel.Value = Session.Item("SIRECAsubdel").ToString
            End If
        End If
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, 0, Now)).ToString, Year(DateAdd(DateInterval.Month, 0, Now)).ToString))
    End Sub
End Class
Imports System.Data.OleDb

Public Class cargaemaebaydepuracion
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAcargaebaema").ToString.Equals("1") Then
            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If
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

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -1, Now)) - 1)
    End Sub

    Protected Sub BCargaEmaEba_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BCargaEmaEba.Click
        GVMaster.DataSourceID = "SqlDataSourceCargaEmaEba"
        GVMaster.DataBind()
    End Sub

    Protected Sub BDepuracion_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BDepuracion.Click
        GVMaster.DataSourceID = "SqlDataSourceDepuracion"
        GVMaster.DataBind()
    End Sub

    Protected Sub BDepuracionPro_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BDepuracionPro.Click
        GVMaster.DataSourceID = "SqlDataSourceDepuracionPRO"
        GVMaster.DataBind()
    End Sub
End Class
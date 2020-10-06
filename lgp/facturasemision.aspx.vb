Public Class facturasemision
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If        
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = 11
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = 1
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Repeater2.DataBind()
    End Sub

    Protected Sub Repeater2_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Repeater2.ItemDataBound
        If (CType(e.Item.FindControl("Label3"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label3"), Label).Text = "0.00"
        End If
        If (CType(e.Item.FindControl("Label4"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label4"), Label).Text = "0.00"
        End If
        If (CType(e.Item.FindControl("Label5"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label5"), Label).Text = "0.00"
        End If
        If (CType(e.Item.FindControl("Label6"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label6"), Label).Text = "0.00"
        End If
        If (CType(e.Item.FindControl("Label7"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label7"), Label).Text = "0.00"
        End If
        If (CType(e.Item.FindControl("Label8"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label8"), Label).Text = "0.00"
        End If
        If (CType(e.Item.FindControl("Label9"), Label).Text).Equals("") Then
            CType(e.Item.FindControl("Label9"), Label).Text = "0.00 %"
        End If
    End Sub
End Class
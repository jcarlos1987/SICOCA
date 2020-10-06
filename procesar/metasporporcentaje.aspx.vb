Public Class metasporporcentaje
    Inherits System.Web.UI.Page
    Dim vmeta As Double = 0
    Dim vemision As Double = 0
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim sumaTPro As Double = 0
    Dim sumaTDif As Double = 0
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Response.Redirect("~/procesar/metasporporcentaje.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Server.Transfer("~/Login.aspx")
        Else
            Label7.Text = DDLSubdel.SelectedItem.Text & "(META)"
            Label14.Text = "META AL DÍA " & DDLDia.SelectedItem.Text
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -2, Now)) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -2, Now)).ToString, Year(DateAdd(DateInterval.Month, -2, Now)).ToString))
    End Sub

    Protected Sub Repeater1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Repeater1.ItemDataBound
        Try
            If e.Item.ItemIndex = 0 Then
                sumaTPro = IIf(IsNumeric(e.Item.DataItem(3)), CDbl(e.Item.DataItem(3)), 0)
                sumaTDif = IIf(IsNumeric(e.Item.DataItem(4)), CDbl(e.Item.DataItem(4)), 0)
            ElseIf e.Item.ItemIndex = 3 Then
                sumaTPro += IIf(IsNumeric(e.Item.DataItem(3)), CDbl(e.Item.DataItem(3)), 0)
                sumaTDif += IIf(IsNumeric(e.Item.DataItem(4)), CDbl(e.Item.DataItem(4)), 0)
                LabelLGP.Text = sumaTPro.ToString("C")
                LabelDIF.Text = sumaTDif.ToString("C")
            ElseIf e.Item.ItemIndex > 2 Then
                sumaTPro += IIf(IsNumeric(e.Item.DataItem(3)), CDbl(e.Item.DataItem(3)), 0)
                sumaTDif += IIf(IsNumeric(e.Item.DataItem(4)), CDbl(e.Item.DataItem(4)), 0)
            End If

            If e.Item.ItemIndex = 0 Then
                vmeta = IIf(IsNumeric(e.Item.DataItem(1)), CDbl(e.Item.DataItem(1)), 0)
            End If
            If e.Item.ItemIndex = 1 Then
                vemision = IIf(IsNumeric(e.Item.DataItem(1)), CDbl(e.Item.DataItem(1)), 0)
            End If
            'MsgBox(e.Item.ItemIndex)
            'Label3 0,1,22,23,25,26,28,33 en negrita
            If e.Item.ItemIndex = 0 Or e.Item.ItemIndex = 1 Or e.Item.ItemIndex = 2 Then
                CType(e.Item.FindControl("Label3"), Label).Font.Bold = True
                CType(e.Item.FindControl("Label10"), Label).Font.Bold = True
                CType(e.Item.FindControl("Label9"), Label).Font.Bold = True
                CType(e.Item.FindControl("Label8"), Label).Font.Bold = True
                CType(e.Item.FindControl("LabelP"), Label).Font.Bold = True
                CType(e.Item.FindControl("Label15"), Label).Font.Bold = True

                CType(e.Item.FindControl("Label3"), Label).Font.Size = 11
                CType(e.Item.FindControl("Label10"), Label).Font.Size = 11

                CType(e.Item.FindControl("Label9"), Label).Font.Size = 11
                CType(e.Item.FindControl("Label8"), Label).Font.Size = 11
                CType(e.Item.FindControl("LabelP"), Label).Font.Size = 11
                CType(e.Item.FindControl("Label15"), Label).Font.Size = 11
            End If
            'Label3 un espacio
            If e.Item.ItemIndex = 3 Or e.Item.ItemIndex = 4 Then
                CType(e.Item.FindControl("Label3"), Label).Text = "&nbsp;&nbsp;" & CType(e.Item.FindControl("Label3"), Label).Text
            End If
            'If e.Item.ItemIndex = 16 Or e.Item.ItemIndex = 17 Or e.Item.ItemIndex = 19 Or e.Item.ItemIndex = 20 Or e.Item.ItemIndex = 21 Or e.Item.ItemIndex = 27 Then
            '    CType(e.Item.FindControl("Label3"), Label).Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & CType(e.Item.FindControl("Label3"), Label).Text
            'End If
            'If e.Item.ItemIndex = 29 Or e.Item.ItemIndex = 30 Or e.Item.ItemIndex = 31 Or e.Item.ItemIndex = 32 Then
            '    CType(e.Item.FindControl("Label3"), Label).Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & CType(e.Item.FindControl("Label3"), Label).Text
            'End If
            If Not e.Item.ItemIndex = 1 Then
                If IsNumeric(CType(e.Item.FindControl("Label9"), Label).Text) And IsNumeric(CType(e.Item.FindControl("Label8"), Label).Text) Then
                    If Not CType(e.Item.FindControl("Label8"), Label).Text.Equals("0") Then
                        CType(e.Item.FindControl("LabelP"), Label).Text = (CDbl(CType(e.Item.FindControl("Label9"), Label).Text) / CDbl(CType(e.Item.FindControl("Label8"), Label).Text)).ToString("P")
                    End If
                End If

                If (CType(e.Item.FindControl("Label8"), Label).Text).Equals("") Then
                    CType(e.Item.FindControl("Label8"), Label).Text = "$0.00"
                End If
                If (CType(e.Item.FindControl("Label9"), Label).Text).Equals("") Then
                    CType(e.Item.FindControl("Label9"), Label).Text = "$0.00"
                End If
                If (CType(e.Item.FindControl("Label10"), Label).Text).Equals("") Then
                    CType(e.Item.FindControl("Label10"), Label).Text = "$0.00"
                End If
                If (CType(e.Item.FindControl("LabelP"), Label).Text).Equals("Infinito") Or (CType(e.Item.FindControl("LabelP"), Label).Text).Equals("NeuN") Or (CType(e.Item.FindControl("LabelP"), Label).Text).Equals("") Then
                    CType(e.Item.FindControl("LabelP"), Label).Text = "0.00 %"
                End If
                LabelDifMet.Text = (vemision - vmeta).ToString("C")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Repeater1.DataBind()
    End Sub
    
    Protected Sub RepeaterMetaT_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles RepeaterMetaT.ItemDataBound
        Try
            LabelLGP.Text = CDbl(sumaTPro).ToString("C")
            LabelP.Text = (CDbl(sumaTPro) / CDbl(e.Item.DataItem(0))).ToString("P")
        Catch ex As Exception

        End Try
    End Sub
End Class
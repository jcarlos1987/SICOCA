Public Class _Default42
    Inherits System.Web.UI.Page
    Dim vmeta As Double = 0
    Dim vemision As Double = 0
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Server.Transfer("~/lgp/Default.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Server.Transfer("~/Login.aspx")
        Else
            If Not Request.QueryString("tipo") Is Nothing Then
                DDLMes.Visible = False
                DDLVista.Visible = False
                Repeater1.DataSourceID = "SqlDataSourceAnual"
                Repeater1.DataBind()
                Chart1.Visible = False
            End If
            Label7.Text = DDLSubdel.SelectedItem.Text & "(META)"
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
            If IsNumeric(TBRevCuotas.Text) Then
                If e.Item.ItemIndex = 0 Then
                    vmeta = IIf(IsNumeric(CType(e.Item.FindControl("Label8"), Label).Text), CDbl(CType(e.Item.FindControl("Label8"), Label).Text), 0)
                End If
                If e.Item.ItemIndex = 1 Then
                    vemision = IIf(IsNumeric(CType(e.Item.FindControl("Label8"), Label).Text), CDbl(CType(e.Item.FindControl("Label8"), Label).Text), 0)
                End If
                'MsgBox(e.Item.ItemIndex)
                'Label3 0,1,22,23,25,26,28,33 en negrita
                If e.Item.ItemIndex = 0 Or e.Item.ItemIndex = 1 Or e.Item.ItemIndex = 22 Or e.Item.ItemIndex = 15 Or e.Item.ItemIndex = 18 Or e.Item.ItemIndex = 26 Or e.Item.ItemIndex = 28 Or e.Item.ItemIndex = 33 Then
                    CType(e.Item.FindControl("Label3"), Label).Font.Bold = True
                    CType(e.Item.FindControl("Label10"), Label).Font.Bold = True
                    CType(e.Item.FindControl("Label9"), Label).Font.Bold = True
                    CType(e.Item.FindControl("Label8"), Label).Font.Bold = True
                    CType(e.Item.FindControl("LabelP"), Label).Font.Bold = True

                    CType(e.Item.FindControl("Label3"), Label).Font.Size = 9
                    CType(e.Item.FindControl("Label10"), Label).Font.Size = 9
                    CType(e.Item.FindControl("Label9"), Label).Font.Size = 9
                    CType(e.Item.FindControl("Label8"), Label).Font.Size = 9
                    CType(e.Item.FindControl("LabelP"), Label).Font.Size = 9
                End If
                'Label3 un espacio
                If e.Item.ItemIndex = 3 Or e.Item.ItemIndex = 4 Or e.Item.ItemIndex = 5 Or e.Item.ItemIndex = 6 Or e.Item.ItemIndex = 7 Or e.Item.ItemIndex = 8 Or e.Item.ItemIndex = 9 Or e.Item.ItemIndex = 10 Or e.Item.ItemIndex = 11 Or e.Item.ItemIndex = 12 Or e.Item.ItemIndex = 13 Or e.Item.ItemIndex = 14 Then
                    CType(e.Item.FindControl("Label3"), Label).Text = "&nbsp;&nbsp;" & CType(e.Item.FindControl("Label3"), Label).Text
                End If
                If e.Item.ItemIndex = 16 Or e.Item.ItemIndex = 17 Or e.Item.ItemIndex = 19 Or e.Item.ItemIndex = 20 Or e.Item.ItemIndex = 21 Or e.Item.ItemIndex = 27 Then
                    CType(e.Item.FindControl("Label3"), Label).Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & CType(e.Item.FindControl("Label3"), Label).Text
                End If
                If e.Item.ItemIndex = 29 Or e.Item.ItemIndex = 30 Or e.Item.ItemIndex = 31 Or e.Item.ItemIndex = 32 Then
                    CType(e.Item.FindControl("Label3"), Label).Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & CType(e.Item.FindControl("Label3"), Label).Text
                End If
                If Not e.Item.ItemIndex = 1 Then
                    If e.Item.ItemIndex = 33 Then
                        LabelLGP.Text = (CDbl(CType(e.Item.FindControl("Label9"), Label).Text) / CDbl(CType(e.Item.FindControl("Label8"), Label).Text)).ToString("P")
                        LabelDIF.Text = (CDbl(CType(e.Item.FindControl("Label10"), Label).Text) / CDbl(CType(e.Item.FindControl("Label8"), Label).Text)).ToString("P")
                    End If
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
            Else
                LabelMsg.Text = "Ingrese un IMPORTE VALIDO"
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        'If IsNumeric(TBRevCuotas.Text) Then
        Repeater1.DataBind()
        'Else
        'LabelMsg.Text = "Ingrese un IMPORTE VALIDO"
        'End If
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        ExportToExcel("ingresoslgp" & DDLSubdel.SelectedValue)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
        Dim responsePage As HttpResponse = Response
        Dim sw As New System.IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        form.Controls.Add(MultiView1)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub

    Protected Sub DDLVista_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLVista.SelectedIndexChanged
        MultiView1.ActiveViewIndex = DDLVista.SelectedIndex
        If DDLVista.SelectedIndex = 1 Then
            LinkButton2.Visible = False
        Else
            LinkButton2.Visible = True
        End If
    End Sub
End Class
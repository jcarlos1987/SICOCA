Imports System.IO

Public Class entregaretrasonotificado
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Server.Transfer("~/areaemision/reportenotificacion/entregaretrasonotificado.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
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
        DDLMes.SelectedIndex = 12 '(Month(DateAdd(DateInterval.Month, -2, Now)) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -2, Now)).ToString, Year(DateAdd(DateInterval.Month, -2, Now)).ToString))
    End Sub

    Protected Sub Repeater1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Repeater1.ItemDataBound
        If e.Item.ItemIndex = 0 Then
            LTotal.Text = "0"
            LTOportuno.Text = "0"
            LTNotPost.Text = "0"
            LTSinNot.Text = "0"
            LTPenNot.Text = "0"
            LNotRecuperado.Text = "0"
            LT3.Text = "0"
            LT4.Text = "0"
            LT5.Text = "0"
            LT7.Text = "0"
            LT10.Text = "0"
        End If
        LTotal.Text = CInt(IIf(IsNumeric(LTotal.Text.Replace(",", "")), CInt(LTotal.Text.Replace(",", "")), 0) + CInt(e.Item.DataItem(2))).ToString("N0")
        Dim valor1 As Double = IIf(IsNumeric(LTotal.Text.Replace(",", "")), CDbl(LTotal.Text.Replace(",", "")), 1)

        LTOportuno.Text = CInt(IIf(IsNumeric(LTOportuno.Text.Replace(",", "")), CInt(LTOportuno.Text.Replace(",", "")), 0) + CInt(e.Item.DataItem(3))).ToString("N0")
        LT3.Text = CDbl(IIf(IsNumeric(LTOportuno.Text.Replace(",", "")), CInt(LTOportuno.Text.Replace(",", "")), 0) / valor1).ToString("P")
        LTNotPost.Text = CInt(IIf(IsNumeric(LTNotPost.Text.Replace(",", "")), CInt(LTNotPost.Text.Replace(",", "")), 0) + CInt(e.Item.DataItem(5))).ToString("N0")
        LT4.Text = CDbl(IIf(IsNumeric(LTOportuno.Text.Replace(",", "")), CInt(LTOportuno.Text.Replace(",", "")), 0) + IIf(IsNumeric(LTNotPost.Text.Replace(",", "")), CInt(LTNotPost.Text.Replace(",", "")), 0)).ToString("N0")
        LT5.Text = CDbl(IIf(IsNumeric(LT4.Text.Replace(",", "")), CInt(LT4.Text.Replace(",", "")), 0) / valor1).ToString("P")
        LTSinNot.Text = CInt(IIf(IsNumeric(LTSinNot.Text.Replace(",", "")), CInt(LTSinNot.Text.Replace(",", "")), 0) + CInt(e.Item.DataItem(8))).ToString("N0")
        LT7.Text = CDbl(IIf(IsNumeric(LTSinNot.Text.Replace(",", "")), CInt(LTSinNot.Text.Replace(",", "")), 0) / valor1).ToString("P")
        LNotRecuperado.Text = CDbl((CDbl(LTOportuno.Text.Replace(",", "")) + CDbl(LTNotPost.Text.Replace(",", "")) + CDbl(LTSinNot.Text.Replace(",", ""))) / CDbl(LTotal.Text.Replace(",", ""))).ToString("P")
        LTPenNot.Text = CInt(IIf(IsNumeric(LTPenNot.Text.Replace(",", "")), CInt(LTPenNot.Text.Replace(",", "")), 0) + CInt(e.Item.DataItem(11))).ToString("N0")
        LT10.Text = CDbl(IIf(IsNumeric(LTPenNot.Text.Replace(",", "")), CInt(LTPenNot.Text.Replace(",", "")), 0) / valor1).ToString("P")
        'e.Item.DataItem(5) = "<a target='_blank' href='detalles.aspx' >" & CInt(e.Item.DataItem(5)).ToString("N0") & "</a>"

    End Sub

    Protected Sub Repeater2_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Repeater2.ItemDataBound
        If e.Item.ItemIndex = 0 Then
            LIMP1.Text = "0"
            LIMP2.Text = "0"
            LIMP3.Text = "0"
            LIMP4.Text = "0"
            LIMP5.Text = "0"

            LIMPX3.Text = "0"
            LIMPX4.Text = "0"
            LIMPX5.Text = "0"
            LIMPX7.Text = "0"
            LIMPX10.Text = "0"
        End If
        LIMP1.Text = CDbl(IIf(IsNumeric(LIMP1.Text.Replace(",", "")), CDbl(LIMP1.Text.Replace(",", "")), 0) + CDbl(e.Item.DataItem(2))).ToString("N")
        Dim valor1 As Double = IIf(IsNumeric(LIMP1.Text.Replace(",", "")), CDbl(LIMP1.Text.Replace(",", "")), 1)

        LIMP2.Text = CDbl(IIf(IsNumeric(LIMP2.Text.Replace(",", "")), CDbl(LIMP2.Text.Replace(",", "")), 0) + CDbl(e.Item.DataItem(3))).ToString("N")
        LIMPX3.Text = CDbl(IIf(IsNumeric(LIMP2.Text.Replace(",", "")), CInt(LIMP2.Text.Replace(",", "")), 0) / valor1).ToString("P")
        LIMP3.Text = CDbl(IIf(IsNumeric(LIMP3.Text.Replace(",", "")), CDbl(LIMP3.Text.Replace(",", "")), 0) + CDbl(e.Item.DataItem(5))).ToString("N")
        LIMPX4.Text = CDbl(IIf(IsNumeric(LIMP2.Text.Replace(",", "")), CInt(LIMP2.Text.Replace(",", "")), 0) + IIf(IsNumeric(LIMP3.Text.Replace(",", "")), CInt(LIMP3.Text.Replace(",", "")), 0)).ToString("N")
        LIMPX5.Text = CDbl(IIf(IsNumeric(LIMPX4.Text.Replace(",", "")), CInt(LIMPX4.Text.Replace(",", "")), 0) / valor1).ToString("P")
        LIMP4.Text = CDbl(IIf(IsNumeric(LIMP4.Text.Replace(",", "")), CDbl(LIMP4.Text.Replace(",", "")), 0) + CDbl(e.Item.DataItem(8))).ToString("N")
        LIMPX7.Text = CDbl(IIf(IsNumeric(LIMP4.Text.Replace(",", "")), CInt(LIMP4.Text.Replace(",", "")), 0) / valor1).ToString("P")
        LIMP6.Text = CDbl((CDbl(LIMP2.Text.Replace(",", "")) + CDbl(LIMP3.Text.Replace(",", "")) + CDbl(LIMP4.Text.Replace(",", ""))) / CDbl(LIMP1.Text.Replace(",", ""))).ToString("P")
        LIMP5.Text = CDbl(IIf(IsNumeric(LIMP5.Text.Replace(",", "")), CDbl(LIMP5.Text.Replace(",", "")), 0) + CDbl(e.Item.DataItem(11))).ToString("N")
        LIMPX10.Text = CDbl(IIf(IsNumeric(LIMP5.Text.Replace(",", "")), CInt(LIMP5.Text.Replace(",", "")), 0) / valor1).ToString("P")
    End Sub

    Protected Sub LBOportuno_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsolutePath.Replace("entregaretrasonotificado.aspx", "entregaretrasonotificadodetalles.aspx") & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LBPosterior_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsolutePath.Replace("entregaretrasonotificado.aspx", "entregaretrasonotificadodetalles.aspx") & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LBSinNot_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsolutePath.Replace("entregaretrasonotificado.aspx", "entregaretrasonotificadodetalles.aspx") & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LBPendientes_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsolutePath.Replace("entregaretrasonotificado.aspx", "entregaretrasonotificadodetalles.aspx") & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        ExportToExcel("D" & Now.Day.ToString("D2") & Now.Month.ToString("D2") & Now.Year.ToString("D4"), PanelDatos)
    End Sub

    Private Sub ExportToExcel(ByVal nameReport As String, ByVal wControl As Panel)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        form.InnerHtml = "<strong>" & DDLSubdel.SelectedItem.Text & "</strong>" _
            & "<br/><strong>PERIODO:</strong> " & DDLMes.SelectedItem.Text & "/" & DDLAnio.SelectedItem.Text
        '..................................................
        'Dim c As Control
        'Dim childc As Control
        'For Each c In wControl.Controls
        '    For Each childc In c.Controls
        '        If TypeOf childc Is LinkButton Then
        '            CType(childc, LinkButton).Attributes.Clear()
        '        End If
        '    Next
        'Next
        '..................................................
        form.Controls.Add(wControl)

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
End Class
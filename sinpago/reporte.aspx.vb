Imports System.Globalization

Public Class reporte
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Server.Transfer("~/Erroremisioninvalida.aspx", False)
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

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        GridViewRep.DataBind()
        GridViewRep0.DataBind()
        GridViewRep1.DataBind()
    End Sub

    Protected Sub GridViewRep_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRep.PreRender
        Try            
            GridViewRep.FooterRow.Cells(1).Text = "0"
            GridViewRep.FooterRow.Cells(2).Text = "0"
            GridViewRep.FooterRow.Cells(3).Text = "0"
            GridViewRep.FooterRow.Cells(4).Text = "0"
            GridViewRep.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewRep.Rows.Count - 1)           
                GridViewRep.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewRep.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewRep.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewRep.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewRep.Rows(i).Cells(2).FindControl("LinkButton2"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewRep.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewRep.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewRep.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewRep.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                GridViewRep.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewRep.Rows(i).Cells(4).Text.Replace("%", "")) + Convert.ToDouble(GridViewRep.FooterRow.Cells(4).Text)
                GridViewRep.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewRep.Rows(i).Cells(5).Text.Replace("%", "")) + Convert.ToDouble(GridViewRep.FooterRow.Cells(5).Text)
            Next
            GridViewRep.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRep.FooterRow.Cells(1).Text))
            GridViewRep.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRep.FooterRow.Cells(2).Text))
            GridViewRep.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewRep.FooterRow.Cells(3).Text))
            GridViewRep.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N}", Convert.ToDouble(GridViewRep.FooterRow.Cells(4).Text)) & " %"
            GridViewRep.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N}", Convert.ToDouble(GridViewRep.FooterRow.Cells(5).Text)) & " %"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        ExportToExcel("reporte_sinpago")
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
        form.Controls.Add(GridViewRep0)
        GridViewRep.AllowSorting = False
        GridViewRep.DataBind()
        For i As Int32 = 0 To (GridViewRep.Rows.Count - 1)
            GridViewRep.Rows(i).Cells(2).Text = CType(GridViewRep.Rows(i).Cells(2).FindControl("LinkButton2"), HyperLink).Text
        Next
        form.Controls.Add(GridViewRep)

        GridViewRep1.AllowSorting = False
        GridViewRep1.DataBind()
        For i As Int32 = 0 To (GridViewRep1.Rows.Count - 1)
            GridViewRep1.Rows(i).Cells(2).Text = CType(GridViewRep1.Rows(i).Cells(2).FindControl("LinkButton3"), HyperLink).Text
        Next
        form.Controls.Add(GridViewRep1)

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

    Protected Sub GridViewRep0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRep0.PreRender
        GridViewRep0.Caption = "<strong>BASE INICIAL: </strong>" & DDLSubdel.SelectedItem.Text & "" _
            & "<br/>" & DDLBase.SelectedItem.Text.Replace("BASE DEL PERIODO", "<strong>BASE DEL PERIODO:</strong>").Replace("CREADO", "<strong>CREADO:</strong>")
    End Sub

    Protected Sub GridViewRep1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRep1.PreRender
        Try
            GridViewRep1.FooterRow.Cells(1).Text = "0"
            GridViewRep1.FooterRow.Cells(2).Text = "0"
            GridViewRep1.FooterRow.Cells(3).Text = "0"
            GridViewRep1.FooterRow.Cells(4).Text = "0"
            GridViewRep1.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewRep1.Rows.Count - 1)
                GridViewRep1.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewRep1.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewRep1.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewRep1.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewRep1.Rows(i).Cells(2).FindControl("LinkButton3"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewRep1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewRep1.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewRep1.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewRep1.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                GridViewRep1.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewRep1.Rows(i).Cells(4).Text.Replace("%", "")) + Convert.ToDouble(GridViewRep1.FooterRow.Cells(4).Text)
                GridViewRep1.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewRep1.Rows(i).Cells(5).Text.Replace("%", "")) + Convert.ToDouble(GridViewRep1.FooterRow.Cells(5).Text)
            Next
            GridViewRep1.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRep1.FooterRow.Cells(1).Text))
            GridViewRep1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRep1.FooterRow.Cells(2).Text))
            GridViewRep1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewRep1.FooterRow.Cells(3).Text))
            GridViewRep1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N}", Convert.ToDouble(GridViewRep1.FooterRow.Cells(4).Text)) & " %"
            GridViewRep1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N}", Convert.ToDouble(GridViewRep1.FooterRow.Cells(5).Text)) & " %"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewRep_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewRep.RowDataBound        
        If e.Row.RowIndex >= 0 Then
            e.Row.Cells(4).Text = (CDbl(CType(e.Row.Cells(2).FindControl("LinkButton2"), LinkButton).Text.Replace(",", "")) / CDbl(CType(GridViewRep0.Rows(0).Cells(2).FindControl("HyperLink2"), HyperLink).Text.Replace(",", ""))).ToString("P")
            e.Row.Cells(5).Text = (CDbl(e.Row.Cells(3).Text.Replace("$", "").Replace(",", "")) / CDbl(GridViewRep0.Rows(0).Cells(3).Text.Replace("$", "").Replace(",", ""))).ToString("P")
        End If
    End Sub

    Protected Sub GridViewRep1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewRep1.RowDataBound
        If e.Row.RowIndex >= 0 Then
            e.Row.Cells(4).Text = (CDbl(CType(e.Row.Cells(2).FindControl("LinkButton3"), LinkButton).Text.Replace(",", "")) / CDbl(CType(GridViewRep0.Rows(0).Cells(2).FindControl("HyperLink2"), HyperLink).Text.Replace(",", ""))).ToString("P")
            e.Row.Cells(5).Text = (CDbl(e.Row.Cells(3).Text.Replace("$", "").Replace(",", "")) / CDbl(GridViewRep0.Rows(0).Cells(3).Text.Replace("$", "").Replace(",", ""))).ToString("P")
        End If
    End Sub

End Class
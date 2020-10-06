Public Class bajas251
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
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

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub GridViewB251_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewB251.PreRender
        Try
            For i As Int32 = 1 To 11
                If i <> 6 Then
                    GridViewB251.FooterRow.Cells(i).Text = "0"
                End If
            Next
            For i As Int32 = 0 To (GridViewB251.Rows.Count - 1)
                GridViewB251.FooterRow.Cells(1).Text = CDbl(CType(GridViewB251.Rows(i).Cells(1).FindControl("LBPatrones"), LinkButton).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewB251.FooterRow.Cells(2).Text = CDbl(GridViewB251.Rows(i).Cells(2).Text.Replace(",", "").Replace("$", "")) + CDbl(GridViewB251.FooterRow.Cells(2).Text.Replace(",", "").Replace("$", ""))
                GridViewB251.FooterRow.Cells(3).Text = CDbl(GridViewB251.Rows(i).Cells(3).Text.Replace(",", "").Replace("$", "")) + CDbl(GridViewB251.FooterRow.Cells(3).Text.Replace(",", "").Replace("$", ""))

                GridViewB251.FooterRow.Cells(4).Text = CDbl(GridViewB251.Rows(i).Cells(4).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewB251.FooterRow.Cells(5).Text = CDbl(GridViewB251.Rows(i).Cells(5).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(5).Text.Replace(",", ""))
                'GridViewB251.FooterRow.Cells(6).Text = CDbl(GridViewB251.Rows(i).Cells(6).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(6).Text.Replace(",", ""))

                GridViewB251.FooterRow.Cells(7).Text = CDbl(CType(GridViewB251.Rows(i).Cells(7).FindControl("LBR1"), LinkButton).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(7).Text.Replace(",", ""))
                GridViewB251.FooterRow.Cells(8).Text = CDbl(CType(GridViewB251.Rows(i).Cells(8).FindControl("LBR2"), LinkButton).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(8).Text.Replace(",", ""))
                GridViewB251.FooterRow.Cells(9).Text = CDbl(CType(GridViewB251.Rows(i).Cells(9).FindControl("LBR3"), LinkButton).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(9).Text.Replace(",", ""))
                GridViewB251.FooterRow.Cells(10).Text = CDbl(CType(GridViewB251.Rows(i).Cells(10).FindControl("LBR4"), LinkButton).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(10).Text.Replace(",", ""))
                GridViewB251.FooterRow.Cells(11).Text = CDbl(CType(GridViewB251.Rows(i).Cells(11).FindControl("LBR5"), LinkButton).Text.Replace(",", "")) + CDbl(GridViewB251.FooterRow.Cells(11).Text.Replace(",", ""))
            Next
            GridViewB251.FooterRow.Cells(1).Text = CInt(GridViewB251.FooterRow.Cells(1).Text.Replace(",", "")).ToString("N0")
            GridViewB251.FooterRow.Cells(2).Text = CDbl(GridViewB251.FooterRow.Cells(2).Text.Replace(",", "")).ToString("C")
            GridViewB251.FooterRow.Cells(3).Text = CDbl(GridViewB251.FooterRow.Cells(3).Text.Replace(",", "")).ToString("C")

            GridViewB251.FooterRow.Cells(4).Text = CInt(GridViewB251.FooterRow.Cells(4).Text.Replace(",", "")).ToString("N0")
            GridViewB251.FooterRow.Cells(5).Text = CInt(GridViewB251.FooterRow.Cells(5).Text.Replace(",", "")).ToString("N0")
            'GridViewB251.FooterRow.Cells(6).Text = CInt(GridViewB251.FooterRow.Cells(6).Text.Replace(",", "")).ToString("N0")

            GridViewB251.FooterRow.Cells(7).Text = CInt(GridViewB251.FooterRow.Cells(7).Text.Replace(",", "")).ToString("N0")
            GridViewB251.FooterRow.Cells(8).Text = CInt(GridViewB251.FooterRow.Cells(8).Text.Replace(",", "")).ToString("N0")
            GridViewB251.FooterRow.Cells(9).Text = CInt(GridViewB251.FooterRow.Cells(9).Text.Replace(",", "")).ToString("N0")
            GridViewB251.FooterRow.Cells(10).Text = CInt(GridViewB251.FooterRow.Cells(10).Text.Replace(",", "")).ToString("N0")
            GridViewB251.FooterRow.Cells(11).Text = CInt(GridViewB251.FooterRow.Cells(11).Text.Replace(",", "")).ToString("N0")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewB251_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewB251.RowDataBound
        If e.Row.RowIndex >= 0 Then
            CType(e.Row.Cells(1).FindControl("LBPatrones"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("bajas251.aspx", "baja251detalles.aspx?") & e.Row.DataItem(0).ToString & "%','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
            CType(e.Row.Cells(7).FindControl("LBR1"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("bajas251.aspx", "baja251detalles.aspx?") & e.Row.DataItem(0).ToString & "I','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
            CType(e.Row.Cells(8).FindControl("LBR2"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("bajas251.aspx", "baja251detalles.aspx?") & e.Row.DataItem(0).ToString & "II','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
            CType(e.Row.Cells(9).FindControl("LBR3"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("bajas251.aspx", "baja251detalles.aspx?") & e.Row.DataItem(0).ToString & "III','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
            CType(e.Row.Cells(10).FindControl("LBR4"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("bajas251.aspx", "baja251detalles.aspx?") & e.Row.DataItem(0).ToString & "IV','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
            CType(e.Row.Cells(11).FindControl("LBR5"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("bajas251.aspx", "baja251detalles.aspx?") & e.Row.DataItem(0).ToString & "V','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
        End If
    End Sub
End Class
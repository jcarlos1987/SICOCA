Public Class casos
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAsubdel") Is Nothing Then
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

    Protected Sub GridViewAvance_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAvance.RowDataBound
        If e.Row.RowIndex >= 0 Then
            CType(e.Row.Cells(1).FindControl("LBRegPat"), LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("casos.aspx", "matriz09.aspx?") & e.Row.DataItem(0).ToString & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=1000, scrollbars=1');")
        End If
    End Sub

    Protected Sub GridViewAvance_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewAvance.PreRender
        GridViewAvance.FooterRow.Cells(1).Text = "0"
        GridViewAvance.FooterRow.Cells(2).Text = "0"
        For i As Int32 = 0 To (GridViewAvance.Rows.Count - 1)
            GridViewAvance.FooterRow.Cells(1).Text = CInt(CType(GridViewAvance.Rows(i).Cells(1).FindControl("LBRegPat"), LinkButton).Text.Replace(",", "")) + CInt(GridViewAvance.FooterRow.Cells(1).Text.Replace(",", ""))
            GridViewAvance.FooterRow.Cells(2).Text = CDbl(GridViewAvance.Rows(i).Cells(2).Text.Replace(",", "").Replace("$", "")) + CDbl(GridViewAvance.FooterRow.Cells(2).Text.Replace(",", "").Replace("$", ""))
        Next
        GridViewAvance.FooterRow.Cells(1).Text = CInt(GridViewAvance.FooterRow.Cells(1).Text.Replace(",", "")).ToString("N0")
        GridViewAvance.FooterRow.Cells(2).Text = CDbl(GridViewAvance.FooterRow.Cells(2).Text.Replace(",", "")).ToString("C")
    End Sub
End Class
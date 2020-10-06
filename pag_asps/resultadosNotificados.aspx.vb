Public Class resultadosNotificados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub sumatoriaNotificadores()
        'GWNotificador.AllowSorting = False
        GridView1.DataBind()
        Dim sum As Double = 0
        For i As Int32 = 1 To (GridView1.Columns.Count - 1)
            sum = 0
            For j As Int32 = 0 To (GridView1.Rows.Count - 1)
                If IsNumeric(GridView1.Rows(j).Cells(i).Text.Replace("$", "")) Then
                    sum += Convert.ToDouble(GridView1.Rows(j).Cells(i).Text.Replace("$", ""))
                End If
            Next
            If sum = 0 Then
                If (GridView1.HeaderRow.Cells(i).Text.Equals(GridView1.HeaderRow.Cells(i - 1).Text) And (GridView1.HeaderRow.Cells(i - 1).Visible)) Then
                    For j As Int32 = 0 To (GridView1.Rows.Count - 1)
                        'GWNotificador.Rows(j).Cells(i).Visible = True
                        'GWNotificador.HeaderRow.Cells(i).Visible = True
                        'GWNotificador.FooterRow.Cells(i).Visible = True
                        GridView1.Rows(j).Cells(i - 1).Visible = False

                    Next
                    GridView1.FooterRow.Cells(i).Text = GridView1.FooterRow.Cells(i - 1).Text
                    GridView1.HeaderRow.Cells(i - 1).Visible = False
                    GridView1.FooterRow.Cells(i - 1).Visible = False
                Else
                    For j As Int32 = 0 To (GridView1.Rows.Count - 1)
                        GridView1.Rows(j).Cells(i).Visible = False
                    Next
                    GridView1.HeaderRow.Cells(i).Visible = False
                    GridView1.FooterRow.Cells(i).Visible = False
                End If
            Else
                GridView1.FooterRow.Cells(i).Text = sum
            End If
        Next
        'GWNotificador.AllowSorting = True
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        sumatoriaNotificadores()
    End Sub
End Class
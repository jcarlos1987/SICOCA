Imports System.Globalization

Public Class reportAM
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
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
        End If
    End Sub
    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        Dim cantidad As Int32() = {2, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40}
        Dim cantidadHl As Int32() = {1, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44}
        Dim cantidadHlNom As Int32() = {2, 9, 10, 11, 12, 13, 14, 15, 16, 3, 4, 5, 6, 7, 8}
        Dim precio As Int32() = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45}
        Try
            For i As Int32 = 1 To (GridView3.Columns.Count - 1)
                GridView3.FooterRow.Cells(i).Text = "0"
            Next
            For cant As Int32 = 0 To (cantidad.Length - 1)
                For i As Int32 = 0 To (GridView3.Rows.Count - 1)
                    GridView3.FooterRow.Cells(cantidad.GetValue(cant)).Text = Convert.ToDouble(GridView3.Rows(i).Cells(cantidad.GetValue(cant)).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(cantidad.GetValue(cant)).Text.Replace(",", ""))
                Next
            Next
            For cantHl As Int32 = 0 To (cantidadHl.Length - 1)
                For i As Int32 = 0 To (GridView3.Rows.Count - 1)
                    Dim hh As String = "HyperLink" & (cantidadHlNom.GetValue(cantHl))
                    Dim hl1 As HyperLink = GridView3.Rows(i).FindControl(hh)
                    GridView3.FooterRow.Cells(cantidadHl.GetValue(cantHl)).Text = Convert.ToDouble(hl1.Text) + Convert.ToDouble(GridView3.FooterRow.Cells(cantidadHl.GetValue(cantHl)).Text.Replace(",", ""))
                Next
            Next
            For pre As Int32 = 0 To (precio.Length - 1)
                For i As Int32 = 0 To (GridView3.Rows.Count - 1)
                    GridView3.FooterRow.Cells(precio.GetValue(pre)).Text = Convert.ToDouble(GridView3.Rows(i).Cells(precio.GetValue(pre)).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(precio.GetValue(pre)).Text.Replace("$", "").Replace(",", ""))
                    'MsgBox(GridView3.FooterRow.Cells(precio.GetValue(pre)).Text)
                Next
            Next
            ' Aplicando formato a las celdas
            For cant As Int32 = 0 To (cantidad.Length - 1)
                GridView3.FooterRow.Cells(cantidad.GetValue(cant)).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(cantidad.GetValue(cant)).Text))
            Next
            For pre As Int32 = 0 To (precio.Length - 1)
                GridView3.FooterRow.Cells(precio.GetValue(pre)).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView3.FooterRow.Cells(precio.GetValue(pre)).Text))
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView4_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView4.PreRender
        Dim cantidad As Int32() = {2, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40}
        Dim cantidadHl As Int32() = {1, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44}
        Dim cantidadHlNom As Int32() = {17, 18, 19, 20, 21, 22, 23, 24, 25, 6, 5, 4, 3}
        Dim precio As Int32() = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45}
        Try
            For i As Int32 = 1 To (GridView4.Columns.Count - 1)
                GridView4.FooterRow.Cells(i).Text = "0"
            Next
            For cant As Int32 = 0 To (cantidad.Length - 1)
                For i As Int32 = 0 To (GridView4.Rows.Count - 1)
                    GridView4.FooterRow.Cells(cantidad.GetValue(cant)).Text = Convert.ToDouble(GridView4.Rows(i).Cells(cantidad.GetValue(cant)).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(cantidad.GetValue(cant)).Text.Replace(",", ""))
                Next
            Next
            For cantHl As Int32 = 0 To (cantidadHl.Length - 1)
                For i As Int32 = 0 To (GridView4.Rows.Count - 1)
                    Dim hh As String = "HyperLink" & (cantidadHlNom.GetValue(cantHl))
                    Dim hl1 As HyperLink = GridView4.Rows(i).FindControl(hh)
                    GridView4.FooterRow.Cells(cantidadHl.GetValue(cantHl)).Text = Convert.ToDouble(hl1.Text) + Convert.ToDouble(GridView4.FooterRow.Cells(cantidadHl.GetValue(cantHl)).Text.Replace(",", ""))
                Next
            Next
            For pre As Int32 = 0 To (precio.Length - 1)
                For i As Int32 = 0 To (GridView4.Rows.Count - 1)
                    GridView4.FooterRow.Cells(precio.GetValue(pre)).Text = Convert.ToDouble(GridView4.Rows(i).Cells(precio.GetValue(pre)).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(precio.GetValue(pre)).Text.Replace("$", "").Replace(",", ""))
                    'MsgBox(GridView4.FooterRow.Cells(precio.GetValue(pre)).Text)
                Next
            Next
            ' Aplicando formato a las celdas
            For cant As Int32 = 0 To (cantidad.Length - 1)
                GridView4.FooterRow.Cells(cantidad.GetValue(cant)).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(cantidad.GetValue(cant)).Text))
            Next
            For pre As Int32 = 0 To (precio.Length - 1)
                GridView4.FooterRow.Cells(precio.GetValue(pre)).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView4.FooterRow.Cells(precio.GetValue(pre)).Text))
            Next
        Catch ex As Exception

        End Try
    End Sub
End Class
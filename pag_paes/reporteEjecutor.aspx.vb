Imports System.Globalization

Public Class reporteEjecutor
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count & " EJECUTORES</strong>" '6
        Dim cantidad As Int32() = {1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30}
        Dim precio As Int32() = {3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31}
        Try
            For i As Int32 = 1 To (GridView1.Columns.Count - 1)
                GridView1.FooterRow.Cells(i).Text = "0"
            Next
            For cant As Int32 = 0 To (cantidad.Length - 1)
                'MsgBox(cantidad.GetValue(cant))
                For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                    If GridView1.Rows(i).Cells(cantidad.GetValue(cant)).Text.Equals("") Then
                        Dim hh As String = "HyperLink" & (cant - 1)
                        Dim hl1 As HyperLink = GridView1.Rows(i).FindControl(hh)
                        GridView1.FooterRow.Cells(cantidad.GetValue(cant)).Text = Convert.ToDouble(hl1.Text) + Convert.ToDouble(GridView1.FooterRow.Cells(cantidad.GetValue(cant)).Text.Replace(",", ""))
                    Else
                        GridView1.FooterRow.Cells(cantidad.GetValue(cant)).Text = Convert.ToDouble(GridView1.Rows(i).Cells(cantidad.GetValue(cant)).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(cantidad.GetValue(cant)).Text.Replace(",", ""))
                    End If
                Next
            Next
            For pre As Int32 = 0 To (precio.Length - 1)
                For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                    GridView1.FooterRow.Cells(precio.GetValue(pre)).Text = Convert.ToDouble(GridView1.Rows(i).Cells(precio.GetValue(pre)).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(precio.GetValue(pre)).Text.Replace("$", "").Replace(",", ""))
                    'MsgBox(GridView1.FooterRow.Cells(precio.GetValue(pre)).Text)
                Next
            Next
            ' Aplicando formato a las celdas
            For cant As Int32 = 0 To (cantidad.Length - 1)
                GridView1.FooterRow.Cells(cantidad.GetValue(cant)).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(cantidad.GetValue(cant)).Text))
            Next
            For pre As Int32 = 0 To (precio.Length - 1)
                GridView1.FooterRow.Cells(precio.GetValue(pre)).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(precio.GetValue(pre)).Text))
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DDLREjecutor_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLREjecutor.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLREjecutor.Items.Clear()
            DDLREjecutor.Items.Add(New ListItem("PAE PERIODO", "1"))
            DDLREjecutor.Items.Add(New ListItem("PAE PERIODO CON MORA", "2"))
            DDLREjecutor.Items.Add(New ListItem("PAE SIN EMA - MORA", "3"))
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
End Class
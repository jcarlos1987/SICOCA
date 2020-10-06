Imports System.Globalization

Public Class detallesseleccionporestatusintegrador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count.ToString("N0") & " PATRON(ES), ESTATUS: "
        If Request.QueryString("estatus").ToString.Equals("%") Then
            GridView1.Caption = GridView1.Caption & "CANCELADO y PENDIENTE"
        Else
            GridView1.Caption = GridView1.Caption & Request.QueryString("estatus").ToString
        End If
        GridView1.Caption = GridView1.Caption
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        Try
            GridView3.FooterRow.Cells(1).Text = "0"
            GridView3.FooterRow.Cells(2).Text = "0"
            GridView3.FooterRow.Cells(3).Text = "0"
            GridView3.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridView3.Rows.Count - 1)
                GridView3.FooterRow.Cells(1).Text = Convert.ToDouble(GridView3.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(2).Text = Convert.ToDouble(GridView3.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(3).Text = Convert.ToDouble(GridView3.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(4).Text = Convert.ToDouble(GridView3.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView3.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(1).Text))
            GridView3.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(2).Text))
            GridView3.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(3).Text))
            GridView3.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView3.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
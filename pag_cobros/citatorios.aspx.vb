Imports System.Globalization

Public Class citatorios
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

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewCitatorios.DataBind()
        GridViewDetalleCitatorio.DataBind()
    End Sub

    Protected Sub GridViewDetalleCitatorio_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewDetalleCitatorio.PreRender        
        Dim columna As Int32 = 11
        For i As Int32 = 0 To (GridViewDetalleCitatorio.Rows.Count - 1)
            If IsNumeric(GridViewDetalleCitatorio.Rows(i).Cells(columna).Text.Replace("H.r.", "")) Then
                If CType(GridViewDetalleCitatorio.Rows(i).Cells(columna).Text.Replace("H.r.", ""), Int32) > 48 Then
                    GridViewDetalleCitatorio.Rows(i).BackColor = Drawing.Color.FromName("#FF3C25")
                ElseIf CType(GridViewDetalleCitatorio.Rows(i).Cells(columna).Text.Replace("H.r.", ""), Int32) > 24 Then
                    GridViewDetalleCitatorio.Rows(i).BackColor = Drawing.Color.FromName("#FFD324")
                End If
            End If
        Next
    End Sub

    Protected Sub GridViewCitatorios_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCitatorios.PreRender
        Try
            'GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridViewCitatorios.FooterRow.Cells(2).Text = "0"
            GridViewCitatorios.FooterRow.Cells(3).Text = "0"
            GridViewCitatorios.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewCitatorios.Rows.Count - 1)
                'Dim cell4 As String = CType(GridViewCitatorios.Rows(i).Cells(4).FindControl("HyperLink1"), HyperLink).Text
                GridViewCitatorios.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewCitatorios.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(2).Text.Replace(",", ""))
                'GridViewCitatorios.FooterRow.Cells(4).Text = Convert.ToDouble(cell4.Replace(",", "")) + Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCitatorios.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCitatorios.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCitatorios.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCitatorios.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewCitatorios.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(2).Text))
            GridViewCitatorios.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(3).Text))
            GridViewCitatorios.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCitatorios.FooterRow.Cells(4).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not DDLInspector.Items.Contains(New ListItem("TODOS", "%")) Then
                If Session.Item("SIRECAuser_type").ToString.Equals("0") Then
                    DDLInspector.Items.Add(New ListItem("TODOS", "%"))
                End If
            End If
        End If
    End Sub
End Class
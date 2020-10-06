Imports System.Globalization

Public Class ecos
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

    Protected Sub GridViewEco_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewEco.PreRender
        Try
            'GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridViewEco.FooterRow.Cells(4).Text = "0"
            GridViewEco.FooterRow.Cells(5).Text = "0"
            GridViewEco.FooterRow.Cells(6).Text = "0"
            GridViewEco.FooterRow.Cells(7).Text = "0"
            For i As Int32 = 0 To (GridViewEco.Rows.Count - 1)
                GridViewEco.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewEco.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewEco.FooterRow.Cells(5).Text = Convert.ToDouble(CType(GridViewEco.Rows(i).Cells(5).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(5).Text.Replace(",", ""))
                GridViewEco.FooterRow.Cells(6).Text = Convert.ToDouble(GridViewEco.Rows(i).Cells(6).Text.Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(6).Text.Replace(",", ""))
                GridViewEco.FooterRow.Cells(7).Text = Convert.ToDouble(GridViewEco.Rows(i).Cells(7).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(7).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewEco.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEco.FooterRow.Cells(4).Text))
            GridViewEco.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEco.FooterRow.Cells(5).Text))
            GridViewEco.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEco.FooterRow.Cells(6).Text))
            GridViewEco.FooterRow.Cells(7).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewEco.FooterRow.Cells(7).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewEco.DataBind()
        GridViewPendientes.DataBind()
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
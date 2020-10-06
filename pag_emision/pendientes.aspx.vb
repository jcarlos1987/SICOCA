Imports System.Globalization

Public Class pendientesparaocr
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
        '3,(4),5,6
        Try
            GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridViewEco.FooterRow.Cells(3).Text = "0"
            GridViewEco.FooterRow.Cells(4).Text = "0"
            GridViewEco.FooterRow.Cells(5).Text = "0"
            GridViewEco.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridViewEco.Rows.Count - 1)
                Dim cell4 As String = CType(GridViewEco.Rows(i).Cells(4).FindControl("HyperLink1"), HyperLink).Text
                GridViewEco.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewEco.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewEco.FooterRow.Cells(4).Text = Convert.ToDouble(cell4.Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewEco.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewEco.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(5).Text.Replace(",", ""))
                GridViewEco.FooterRow.Cells(6).Text = Convert.ToDouble(GridViewEco.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewEco.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewEco.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEco.FooterRow.Cells(3).Text))
            GridViewEco.FooterRow.Cells(4).Text = "<a href='detallespendientes.aspx?subdel=" + DDLSubdel.SelectedValue + "&tipo=%&inc=%'>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEco.FooterRow.Cells(4).Text)) + "</a>"
            GridViewEco.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewEco.FooterRow.Cells(5).Text))
            GridViewEco.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewEco.FooterRow.Cells(6).Text))

        Catch ex As Exception

        End Try
    End Sub
End Class
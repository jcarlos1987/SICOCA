Imports System.Globalization

Public Class _default44
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim vcreditos As Int32 = 0
    Dim vimporte As Int32 = 0
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("3") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo3.Master"
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub GridViewResult_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewResult.PreRender
        Try
            GridViewResult.FooterRow.Cells(1).Text = "0"
            GridViewResult.FooterRow.Cells(2).Text = "0"
            GridViewResult.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridViewResult.Rows.Count - 1)
                GridViewResult.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewResult.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewResult.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewResult.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewResult.Rows(i).Cells(2).FindControl("LinkButton1"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewResult.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewResult.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewResult.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewResult.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewResult.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResult.FooterRow.Cells(1).Text))
            GridViewResult.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResult.FooterRow.Cells(2).Text))
            GridViewResult.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewResult.FooterRow.Cells(3).Text))

            For i As Int32 = 0 To (GridViewResult.Rows.Count - 1)                
                GridViewResult.Rows(i).Cells(4).Text = (Convert.ToDouble(CType(GridViewResult.Rows(i).Cells(2).FindControl("LinkButton1"), LinkButton).Text.Replace(",", "")) / Convert.ToDouble(GridViewResult.FooterRow.Cells(2).Text.Replace(",", ""))).ToString("P")
                GridViewResult.Rows(i).Cells(5).Text = (Convert.ToDouble(GridViewResult.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) / Convert.ToDouble(GridViewResult.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))).ToString("P")
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewBusqueda_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewBusqueda.RowDataBound
        Try
            If e.Row.RowIndex >= 0 Then
                If e.Row.DataItem(6).ToString.Equals("0") Then
                    e.Row.Cells(6).Text = "<i class='icon-ban-circle'></i>"
                Else
                    Dim lb As HyperLink = New HyperLink
                    lb.NavigateUrl = "~/carteradigital/" & e.Row.DataItem(6).ToString
                    lb.Target = "_blank"
                    lb.Text = "<i class='icon-file'></i>"
                    e.Row.Cells(6).Controls.Add(lb)
                End If
            End If
        Catch
        End Try
    End Sub

    Protected Sub LBBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBBuscar.Click
        GridViewBusqueda.DataBind()
    End Sub

    Protected Sub DDLAltaCredito_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAltaCredito.PreRender
        If Not DDLAltaCredito.Items.Contains(New ListItem("TODOS", "%")) Then
            DDLAltaCredito.Items.Add(New ListItem("TODOS", "%"))
        End If
    End Sub

    Protected Sub LBBuscador_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBBuscador.Click
        GridViewResult.DataBind()
    End Sub
End Class
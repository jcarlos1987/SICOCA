Imports System.Globalization

Public Class generalresumen
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
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

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewResumen1.DataBind()
        GridViewResumen2.DataBind()
    End Sub

    Protected Sub GridViewResumen1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewResumen1.PreRender
        Try
            'GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridViewResumen1.FooterRow.Cells(1).Text = "<strong>TOTAL</strong>"
            GridViewResumen1.FooterRow.Cells(2).Text = "0"
            GridViewResumen1.FooterRow.Cells(3).Text = "0"
            GridViewResumen1.FooterRow.Cells(4).Text = "0"
            GridViewResumen1.FooterRow.Cells(5).Text = "0"
            GridViewResumen1.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridViewResumen1.Rows.Count - 1)
                'CType(GridViewResumen1.Rows(i).Cells(3).FindControl("HyperLink1"), HyperLink).NavigateUrl = "#"
                'CType(GridViewResumen1.Rows(i).Cells(4).FindControl("HyperLink2"), HyperLink).NavigateUrl = "#"
                'CType(GridViewResumen1.Rows(i).Cells(5).FindControl("HyperLink3"), HyperLink).NavigateUrl = "#"
                'CType(GridViewResumen1.Rows(i).Cells(6).FindControl("HyperLink4"), HyperLink).NavigateUrl = "#"
                GridViewResumen1.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewResumen1.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewResumen1.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridViewResumen1.Rows(i).Cells(3).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewResumen1.FooterRow.Cells(4).Text = Convert.ToDouble(CType(GridViewResumen1.Rows(i).Cells(4).FindControl("HyperLink2"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewResumen1.FooterRow.Cells(5).Text = Convert.ToDouble(CType(GridViewResumen1.Rows(i).Cells(5).FindControl("HyperLink3"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen1.FooterRow.Cells(5).Text.Replace(",", ""))
                GridViewResumen1.FooterRow.Cells(6).Text = Convert.ToDouble(CType(GridViewResumen1.Rows(i).Cells(6).FindControl("HyperLink4"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen1.FooterRow.Cells(6).Text.Replace(",", ""))
                'GridViewResumen1.FooterRow.Cells(6).Text = Convert.ToDouble(GridViewResumen1.Rows(i).Cells(6).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen1.FooterRow.Cells(6).Text.Replace(",", ""))

            Next
            GridViewResumen1.FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen1.FooterRow.Cells(2).Text)) + "</strong>"
            GridViewResumen1.FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen1.FooterRow.Cells(3).Text)) + "</strong>"
            GridViewResumen1.FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen1.FooterRow.Cells(4).Text)) + "</strong>"
            GridViewResumen1.FooterRow.Cells(5).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen1.FooterRow.Cells(5).Text)) + "</strong>"
            GridViewResumen1.FooterRow.Cells(6).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen1.FooterRow.Cells(6).Text)) + "</strong>"
            GridViewResumen1.FooterStyle.HorizontalAlign = HorizontalAlign.Right
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewResumen2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewResumen2.PreRender
        Try
            'GridViewResumen2.Caption = "<strong>" & GridViewResumen2.Rows.Count.ToString & " PATRONES </strong>"
            GridViewResumen2.FooterRow.Cells(2).Text = "0"
            GridViewResumen2.FooterRow.Cells(3).Text = "0"
            GridViewResumen2.FooterRow.Cells(4).Text = "0"
            GridViewResumen2.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewResumen2.Rows.Count - 1)                
                GridViewResumen2.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewResumen2.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen2.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewResumen2.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewResumen2.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen2.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewResumen2.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewResumen2.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen2.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewResumen2.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewResumen2.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewResumen2.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewResumen2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen2.FooterRow.Cells(2).Text))
            GridViewResumen2.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen2.FooterRow.Cells(3).Text))
            GridViewResumen2.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen2.FooterRow.Cells(4).Text))
            GridViewResumen2.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewResumen2.FooterRow.Cells(5).Text))
            GridViewResumen2.FooterStyle.Font.Bold = True
            GridViewResumen2.FooterStyle.HorizontalAlign = HorizontalAlign.Right
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init       
        DDLMes.SelectedIndex = (Month(Now) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init        
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
    End Sub

    Protected Sub GridViewResumen3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewResumen3.PreRender
        Try
            'GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridViewResumen3.FooterRow.Cells(2).Text = "<strong>TOTAL</strong>"
            GridViewResumen3.FooterRow.Cells(3).Text = "0"
            GridViewResumen3.FooterRow.Cells(4).Text = "0"
            GridViewResumen3.FooterRow.Cells(5).Text = "0"
            GridViewResumen3.FooterRow.Cells(6).Text = "0"
            GridViewResumen3.FooterRow.Cells(7).Text = "0"
            For i As Int32 = 0 To (GridViewResumen3.Rows.Count - 1)
                GridViewResumen3.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewResumen3.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen3.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewResumen3.FooterRow.Cells(4).Text = Convert.ToDouble(CType(GridViewResumen3.Rows(i).Cells(4).FindControl("HyperLink4"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen3.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewResumen3.FooterRow.Cells(5).Text = Convert.ToDouble(CType(GridViewResumen3.Rows(i).Cells(5).FindControl("HyperLink5"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen3.FooterRow.Cells(5).Text.Replace(",", ""))
                GridViewResumen3.FooterRow.Cells(6).Text = Convert.ToDouble(CType(GridViewResumen3.Rows(i).Cells(6).FindControl("HyperLink6"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen3.FooterRow.Cells(6).Text.Replace(",", ""))
                GridViewResumen3.FooterRow.Cells(7).Text = Convert.ToDouble(GridViewResumen3.Rows(i).Cells(7).Text.Replace(",", "")) + Convert.ToDouble(GridViewResumen3.FooterRow.Cells(7).Text.Replace(",", ""))

            Next
            GridViewResumen3.FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen3.FooterRow.Cells(3).Text)) + "</strong>"
            GridViewResumen3.FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen3.FooterRow.Cells(4).Text)) + "</strong>"
            GridViewResumen3.FooterRow.Cells(5).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen3.FooterRow.Cells(5).Text)) + "</strong>"
            GridViewResumen3.FooterRow.Cells(6).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen3.FooterRow.Cells(6).Text)) + "</strong>"
            GridViewResumen3.FooterRow.Cells(7).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewResumen3.FooterRow.Cells(7).Text)) + "</strong>"
            GridViewResumen3.FooterStyle.HorizontalAlign = HorizontalAlign.Right
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DDLAnio0_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio0.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio0.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
    End Sub

    Protected Sub DDLMes0_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes0.Init
        DDLMes0.SelectedIndex = (Month(Now) - 1)
    End Sub
End Class
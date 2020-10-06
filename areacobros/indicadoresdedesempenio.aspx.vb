Imports System.Globalization

Public Class indicadoresdedesempenio1
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not Session.Item("SIRECAind_desempenio").ToString.Equals("1") Then
                Response.Redirect("~/Login.aspx")
            End If
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.FooterRow.Cells(3).Text = "0"
            GridView1.FooterRow.Cells(4).Text = "0"
            GridView1.FooterRow.Cells(5).Text = "0"
            'GridView1.FooterRow.Cells(6).Text = "0"
            GridView1.FooterRow.Cells(8).Text = "0"
            GridView1.FooterRow.Cells(9).Text = "0"
            GridView1.FooterRow.Cells(11).Text = "0"
            GridView1.FooterRow.Cells(13).Text = "0"
            GridView1.FooterRow.Cells(14).Text = "0"
            GridView1.FooterRow.Cells(15).Text = "0"
            GridView1.FooterRow.Cells(17).Text = "0"
            GridView1.FooterRow.Cells(18).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(GridView1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(5).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(5).FindControl("LBCredAsig"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(5).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(8).Text = Convert.ToDouble(GridView1.Rows(i).Cells(8).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(8).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(9).Text = Convert.ToDouble(GridView1.Rows(i).Cells(9).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(9).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(11).Text = Convert.ToDouble(GridView1.Rows(i).Cells(11).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(11).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(13).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(13).FindControl("LBPend"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(13).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(14).Text = Convert.ToDouble(GridView1.Rows(i).Cells(14).Text.Replace(",", "").Replace("$", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(14).Text.Replace(",", "").Replace("$", ""))
                GridView1.FooterRow.Cells(15).Text = Convert.ToDouble(GridView1.Rows(i).Cells(15).Text.Replace(",", "").Replace("$", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(15).Text.Replace(",", "").Replace("$", ""))
                GridView1.FooterRow.Cells(17).Text = Convert.ToDouble(GridView1.Rows(i).Cells(17).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(17).Text.Replace(",", ""))
            Next
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(5).Text))
            'GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))
            GridView1.FooterRow.Cells(8).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(8).Text))
            GridView1.FooterRow.Cells(9).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(9).Text))
            GridView1.FooterRow.Cells(11).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(11).Text))
            GridView1.FooterRow.Cells(13).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(13).Text))
            GridView1.FooterRow.Cells(14).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(14).Text))
            GridView1.FooterRow.Cells(15).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(15).Text))
            GridView1.FooterRow.Cells(17).Text = (CDbl(GridView1.FooterRow.Cells(17).Text.Replace(",", "")) / CDbl(GridView1.Rows.Count)).ToString("N0")
            GridView1.FooterRow.Cells(18).Text = ((CDbl(GridView1.FooterRow.Cells(9).Text.Replace(",", "")) / (CDbl(GridView1.FooterRow.Cells(3).Text.Replace(",", "")) * CDbl(DDLDia.SelectedValue)))).ToString("P0")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBCredAsig_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("indicadoresdedesempenio.aspx", "indicadoresdedesempeniodetalles.aspx") & "&subdel=" & DDLSubdel.SelectedValue & "&fechini=" & DDLFecInicio.SelectedValue & "&fechfin=" & DDLFechFin.SelectedValue & "&inspector=" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1');")
    End Sub

    Protected Sub LBPend_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("indicadoresdedesempenio.aspx", "indicadoresdedesempeniopendetalles.aspx") & "&subdel=" & DDLSubdel.SelectedValue & "&fechini=" & DDLFecInicio.SelectedValue & "&fechfin=" & DDLFechFin.SelectedValue & "&inspector=" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1');")
    End Sub
End Class
Imports System.Globalization

Public Class controlimpresiones
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Response.Redirect(Request.Url.AbsoluteUri)
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

    Protected Sub TBFechIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechIni.Init
        CType(sender, TextBox).Text = "01/" + Now.Month.ToString("00") + "/" + Now.Year.ToString
    End Sub

    Protected Sub TBFechFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechFin.Init
        CType(sender, TextBox).Text = Now.ToShortDateString()
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        'GridViewImpresionesC.DataBind()
        'GridViewImpresionesN.DataBind()
        'GridView1.DataBind()
    End Sub

    Protected Sub LBSinRep_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LBSinRep2_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LBSinRep3_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub LBSinRep4_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub

    Protected Sub GridViewImpresionesC_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewImpresionesC.PreRender
        Try
            GridViewImpresionesC.FooterRow.Cells(1).Text = "0"
            GridViewImpresionesC.FooterRow.Cells(2).Text = "0"
            GridViewImpresionesC.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridViewImpresionesC.Rows.Count - 1)
                GridViewImpresionesC.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewImpresionesC.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewImpresionesC.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewImpresionesC.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewImpresionesC.Rows(i).Cells(2).FindControl("LBSinRep"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewImpresionesC.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewImpresionesC.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridViewImpresionesC.Rows(i).Cells(3).FindControl("LBSinRep2"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewImpresionesC.FooterRow.Cells(3).Text.Replace(",", ""))
            Next
            GridViewImpresionesC.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewImpresionesC.FooterRow.Cells(1).Text))
            GridViewImpresionesC.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewImpresionesC.FooterRow.Cells(2).Text))
            GridViewImpresionesC.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewImpresionesC.FooterRow.Cells(3).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewImpresionesN_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewImpresionesN.PreRender
        Try
            GridViewImpresionesN.FooterRow.Cells(1).Text = "0"
            GridViewImpresionesN.FooterRow.Cells(2).Text = "0"
            GridViewImpresionesN.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridViewImpresionesN.Rows.Count - 1)
                GridViewImpresionesN.FooterRow.Cells(1).Text = Convert.ToDouble(GridViewImpresionesN.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridViewImpresionesN.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewImpresionesN.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewImpresionesN.Rows(i).Cells(2).FindControl("LBSinRep3"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewImpresionesN.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewImpresionesN.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridViewImpresionesN.Rows(i).Cells(3).FindControl("LBSinRep4"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewImpresionesN.FooterRow.Cells(3).Text.Replace(",", ""))
            Next
            GridViewImpresionesN.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewImpresionesN.FooterRow.Cells(1).Text))
            GridViewImpresionesN.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewImpresionesN.FooterRow.Cells(2).Text))
            GridViewImpresionesN.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewImpresionesN.FooterRow.Cells(3).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
Imports System.Globalization

Public Class Ciclo3
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim salarioBase As String = ConfigurationSettings.AppSettings("salarioMinimo")
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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub HiddenFieldSalario_Init(ByVal sender As Object, ByVal e As EventArgs) Handles HiddenFieldSalario.Init
        HiddenFieldSalario.Value = salarioBase
    End Sub

    Protected Sub TBFechIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechIni.Init
        TBFechIni.Text = "01/01/1980"
        'DateAdd("d", (1 - Day(Now)), Now).ToShortDateString()
    End Sub

    Protected Sub TBFechFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechFin.Init
        TBFechFin.Text = Now.ToShortDateString
    End Sub

    Protected Sub TextBox1_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox1.Init
        TextBox1.Text = DateAdd("d", (1 - Day(Now)), Now).ToShortDateString
    End Sub

    Protected Sub TextBox2_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox2.Init
        TextBox2.Text = Now.ToShortDateString
    End Sub

    Protected Sub TextBox3_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox3.Init
        TextBox3.Text = "01/01/1980"
    End Sub

    Protected Sub TextBox4_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox4.Init
        TextBox4.Text = Now.ToShortDateString
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton3.Click
        GridViewGeneral0.DataBind()
    End Sub

    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton4.Click
        GridView1.DataBind()
    End Sub

    Protected Sub TextBox5_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox5.Init
        TextBox5.Text = DateAdd("d", (1 - Day(Now)), Now).ToShortDateString
    End Sub

    Protected Sub TextBox6_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox6.Init
        TextBox6.Text = Now.ToShortDateString
    End Sub

    Protected Sub GridViewGeneral_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGeneral.PreRender
        Try
            GridViewGeneral.FooterRow.Cells(1).Text = "0"
            GridViewGeneral.FooterRow.Cells(2).Text = "0"
            GridViewGeneral.FooterRow.Cells(3).Text = "0"
            GridViewGeneral.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewGeneral.Rows.Count - 1)                
                GridViewGeneral.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridViewGeneral.Rows(i).Cells(1).FindControl("LBInventario"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewGeneral.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewGeneral.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGeneral.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGeneral.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral.FooterRow.Cells(3).Text.Replace(",", ""))            
                GridViewGeneral.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewGeneral.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGeneral.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewGeneral.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral.FooterRow.Cells(1).Text))
            GridViewGeneral.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral.FooterRow.Cells(2).Text))
            GridViewGeneral.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral.FooterRow.Cells(3).Text))
            GridViewGeneral.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGeneral.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewGeneral1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGeneral1.PreRender
        Try
            GridViewGeneral1.FooterRow.Cells(1).Text = "0"
            GridViewGeneral1.FooterRow.Cells(2).Text = "0"
            GridViewGeneral1.FooterRow.Cells(3).Text = "0"
            GridViewGeneral1.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewGeneral1.Rows.Count - 1)
                GridViewGeneral1.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridViewGeneral1.Rows(i).Cells(1).FindControl("LBAsignado"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewGeneral1.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewGeneral1.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGeneral1.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGeneral1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewGeneral1.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewGeneral1.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewGeneral1.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(1).Text))
            GridViewGeneral1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(2).Text))
            GridViewGeneral1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(3).Text))            
            GridViewGeneral1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGeneral1.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewGeneral2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGeneral2.PreRender
        Try
            GridViewGeneral2.FooterRow.Cells(1).Text = "0"
            GridViewGeneral2.FooterRow.Cells(2).Text = "0"
            GridViewGeneral2.FooterRow.Cells(3).Text = "0"
            GridViewGeneral2.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewGeneral2.Rows.Count - 1)
                GridViewGeneral2.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridViewGeneral2.Rows(i).Cells(1).FindControl("LBPenAsig"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewGeneral2.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewGeneral2.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGeneral2.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGeneral2.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewGeneral2.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewGeneral2.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewGeneral2.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(1).Text))
            GridViewGeneral2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(2).Text))
            GridViewGeneral2.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(3).Text))
            GridViewGeneral2.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGeneral2.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewSubDiliRangos_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Try
            For j As Int32 = 0 To (GridViewDiliRangos.Rows.Count - 1)
                Dim GVTemp As GridView = CType(GridViewDiliRangos.Rows(j).Cells(1).FindControl("GridViewSubDiliRangos"), GridView)
                GVTemp.FooterRow.Cells(0).Text = "0"
                GVTemp.FooterRow.Cells(1).Text = "0"
                For i As Int32 = 0 To (GVTemp.Rows.Count - 1)
                    GVTemp.FooterRow.Cells(0).Text = Convert.ToDouble(CType(GVTemp.Rows(i).Cells(0).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(0).Text.Replace(",", ""))
                    GVTemp.FooterRow.Cells(1).Text = Convert.ToDouble(GVTemp.Rows(i).Cells(1).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(1).Text.Replace("$", "").Replace(",", ""))
                Next
                GVTemp.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVTemp.FooterRow.Cells(0).Text))
                GVTemp.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GVTemp.FooterRow.Cells(1).Text))
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Try
            For j As Int32 = 0 To (GridView1.Rows.Count - 1)
                Dim GVTemp As GridView = CType(GridView1.Rows(j).Cells(1).FindControl("GridView3"), GridView)
                GVTemp.FooterRow.Cells(2).Text = "0"
                GVTemp.FooterRow.Cells(3).Text = "0"
                GVTemp.FooterRow.Cells(4).Text = "0"
                GVTemp.FooterRow.Cells(5).Text = "0"
                For i As Int32 = 0 To (GVTemp.Rows.Count - 1)
                    'GVTemp.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GVTemp.Rows(i).Cells(0).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(0).Text.Replace(",", ""))
                    GVTemp.FooterRow.Cells(2).Text = Convert.ToDouble(GVTemp.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(2).Text.Replace(",", ""))
                    GVTemp.FooterRow.Cells(3).Text = Convert.ToDouble(GVTemp.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(3).Text.Replace(",", ""))
                    GVTemp.FooterRow.Cells(4).Text = Convert.ToDouble(GVTemp.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(4).Text.Replace(",", ""))
                    GVTemp.FooterRow.Cells(5).Text = Convert.ToDouble(GVTemp.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GVTemp.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
                Next
                GVTemp.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVTemp.FooterRow.Cells(2).Text))
                GVTemp.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVTemp.FooterRow.Cells(3).Text))
                GVTemp.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVTemp.FooterRow.Cells(4).Text))
                GVTemp.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GVTemp.FooterRow.Cells(5).Text))
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.FooterRow.Cells(1).Text = "0"
            GridView1.FooterRow.Cells(2).Text = "0"
            GridView1.FooterRow.Cells(3).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                GridView1.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(1).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(2).FindControl("HyperLink2"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(3).FindControl("HyperLink3"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
            Next
            GridView1.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(1).Text))
            GridView1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(2).Text))
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewGeneral0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGeneral0.PreRender
        Try
            GridViewGeneral0.FooterRow.Cells(1).Text = "0"
            GridViewGeneral0.FooterRow.Cells(2).Text = "0"
            GridViewGeneral0.FooterRow.Cells(3).Text = "0"
            GridViewGeneral0.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewGeneral0.Rows.Count - 1)
                GridViewGeneral0.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridViewGeneral0.Rows(i).Cells(1).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(1).Text.Replace(",", ""))
                GridViewGeneral0.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewGeneral0.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGeneral0.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGeneral0.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewGeneral0.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewGeneral0.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewGeneral0.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(1).Text))
            GridViewGeneral0.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(2).Text))
            GridViewGeneral0.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(3).Text))
            GridViewGeneral0.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGeneral0.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
Imports System.Globalization
Imports System.Data.OleDb
Imports System.IO

Public Class _Default12
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
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

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Try
            GridView2.FooterRow.Cells(1).Text = "0"
            GridView2.FooterRow.Cells(2).Text = "0"
            GridView2.FooterRow.Cells(3).Text = "0"
            'GridView2.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView2.Rows.Count - 1)
                GridView2.FooterRow.Cells(1).Text = Convert.ToDouble(GridView2.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridView2.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView2.FooterRow.Cells(3).Text = Convert.ToDouble(GridView2.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                'GridView2.FooterRow.Cells(6).Text = Convert.ToDouble(GridView2.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView2.FooterRow.Cells(4).Text = (Convert.ToDouble(GridView2.FooterRow.Cells(2).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(2).Text.Replace(",", ""))).ToString("P")
            GridView2.FooterRow.Cells(5).Text = (Convert.ToDouble(GridView2.FooterRow.Cells(3).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(3).Text.Replace(",", "").Replace("$", ""))).ToString("P")

            GridView2.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(1).Text))
            GridView2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(2).Text))
            GridView2.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView2.FooterRow.Cells(3).Text))
            'GridView2.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView2.FooterRow.Cells(6).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView4_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView4.PreRender
        Try
            GridView4.FooterRow.Cells(1).Text = "0"
            GridView4.FooterRow.Cells(2).Text = "0"
            GridView4.FooterRow.Cells(3).Text = "0"
            'GridView4.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView4.Rows.Count - 1)
                GridView4.FooterRow.Cells(1).Text = Convert.ToDouble(GridView4.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridView4.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView4.FooterRow.Cells(3).Text = Convert.ToDouble(GridView4.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                'GridView4.FooterRow.Cells(6).Text = Convert.ToDouble(GridView4.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView4.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView4.FooterRow.Cells(4).Text = (Convert.ToDouble(GridView4.FooterRow.Cells(2).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(2).Text.Replace(",", ""))).ToString("P")
            GridView4.FooterRow.Cells(5).Text = (Convert.ToDouble(GridView4.FooterRow.Cells(3).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(3).Text.Replace(",", "").Replace("$", ""))).ToString("P")

            GridView4.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(1).Text))
            GridView4.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView4.FooterRow.Cells(2).Text))
            GridView4.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView4.FooterRow.Cells(3).Text))
            'GridView4.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView4.FooterRow.Cells(6).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView5_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView5.PreRender
        Try
            GridView5.FooterRow.Cells(1).Text = "0"
            GridView5.FooterRow.Cells(2).Text = "0"
            GridView5.FooterRow.Cells(3).Text = "0"
            'GridView5.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView5.Rows.Count - 1)
                GridView5.FooterRow.Cells(1).Text = Convert.ToDouble(GridView5.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView5.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView5.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridView5.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView5.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView5.FooterRow.Cells(3).Text = Convert.ToDouble(GridView5.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView5.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                'GridView5.FooterRow.Cells(6).Text = Convert.ToDouble(GridView5.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView5.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView5.FooterRow.Cells(4).Text = (Convert.ToDouble(GridView5.FooterRow.Cells(2).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(2).Text.Replace(",", ""))).ToString("P")
            GridView5.FooterRow.Cells(5).Text = (Convert.ToDouble(GridView5.FooterRow.Cells(3).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(3).Text.Replace(",", "").Replace("$", ""))).ToString("P")

            GridView5.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView5.FooterRow.Cells(1).Text))
            GridView5.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView5.FooterRow.Cells(2).Text))
            GridView5.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView5.FooterRow.Cells(3).Text))
            'GridView5.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView5.FooterRow.Cells(6).Text))
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        'HyperLink1.NavigateUrl = "~/casosMontanio/detalleCambioInc.aspx?inc=COP"
        GridView1.DataBind()
        GridView2.DataBind()
        GridView4.DataBind()
        GridView5.DataBind()
        GridView7.DataBind()
        GridView8.DataBind()
        GridView9.DataBind()        
        GridView11.DataBind()
    End Sub

    Protected Sub GridView9_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView9.PreRender
        Try
            GridView9.FooterRow.Cells(1).Text = "0"
            GridView9.FooterRow.Cells(2).Text = "0"
            GridView9.FooterRow.Cells(3).Text = "0"
            GridView9.FooterRow.Cells(4).Text = "100 %"
            GridView9.FooterRow.Cells(5).Text = "100 %"
            For i As Int32 = 0 To (GridView9.Rows.Count - 1)
                GridView9.FooterRow.Cells(1).Text = Convert.ToDouble(GridView9.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView9.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView9.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridView9.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView9.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView9.FooterRow.Cells(3).Text = Convert.ToDouble(GridView9.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView9.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                'GridView9.FooterRow.Cells(6).Text = Convert.ToDouble(GridView9.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView9.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView9.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView9.FooterRow.Cells(1).Text))
            GridView9.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView9.FooterRow.Cells(2).Text))
            GridView9.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView9.FooterRow.Cells(3).Text))
            'GridView9.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView9.FooterRow.Cells(6).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView11_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView11.PreRender
        Try
            GridView11.FooterRow.Cells(1).Text = "0"
            GridView11.FooterRow.Cells(2).Text = "0"
            GridView11.FooterRow.Cells(3).Text = "0"
            'GridView11.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView11.Rows.Count - 1)
                GridView11.FooterRow.Cells(1).Text = Convert.ToDouble(GridView11.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView11.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView11.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridView11.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridView11.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView11.FooterRow.Cells(3).Text = Convert.ToDouble(GridView11.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView11.FooterRow.Cells(3).Text.Replace("$", "").Replace(",", ""))
                'GridView11.FooterRow.Cells(6).Text = Convert.ToDouble(GridView11.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView11.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView11.FooterRow.Cells(4).Text = (Convert.ToDouble(GridView11.FooterRow.Cells(2).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(2).Text.Replace(",", ""))).ToString("P")
            GridView11.FooterRow.Cells(5).Text = (Convert.ToDouble(GridView11.FooterRow.Cells(3).Text) / Convert.ToDouble(GridView9.FooterRow.Cells(3).Text.Replace(",", "").Replace("$", ""))).ToString("P")

            GridView11.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView11.FooterRow.Cells(1).Text))
            GridView11.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView11.FooterRow.Cells(2).Text))
            GridView11.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView11.FooterRow.Cells(3).Text))
            'GridView11.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView11.FooterRow.Cells(6).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        'Dim msgRales As String =""
        GridView1.Caption = ""
        For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
            If DDLSubdel.SelectedValue.Equals("%") Then
                GridView1.Caption = "<strong>GENERAL CIERRE DE " + HFCierre.Value + "</strong><br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP", DDLRCop.SelectedValue) & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                GridView1.Caption += "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV", DDLRRcv.SelectedValue) & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
            Else
                If DDLSubdel.SelectedValue.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                    GridView1.Caption = "<strong>GENERAL CIERRE DE " + HFCierre.Value + "</strong><br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP", DDLRCop.SelectedValue) & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    GridView1.Caption += "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV", DDLRRcv.SelectedValue) & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                End If
            End If
        Next
    End Sub
    Function fechaDelrale(ByVal subdel As String, ByVal tipoCopRcv As String, ByVal nomrale As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 (datename(weekday,fecha)+','+datename(day,fecha)+' de '+datename(month,fecha)+' de '+datename(year,fecha)) from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' and name='" + nomrale + "'order by fecha desc "
        'textConx += " GROUP BY eco.responsable"
        'MsgBox(valorUser)
        'MsgBox(textConx)
        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Do While myReaderx.Read()
            Dim vvx As Object = myReaderx.GetValue(0)
            ralex = vvx.ToString
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return ralex
    End Function

    Protected Sub LinkButton2_Load(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Load
        If DDLSubdel.SelectedValue.Equals("%") Then
            LinkButton2.Visible = False
        Else
            LinkButton2.Visible = True
        End If
    End Sub

    Protected Sub DDLSubdel_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.PreRender
        If DDLSubdel.SelectedValue.Equals("%") Then
            LinkButton2.Visible = False
        Else
            LinkButton2.Visible = True
        End If
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        Try
            LabelMsg.Text = ""
            If DDLSubdel.SelectedValue.Equals("%") Then
                LabelMsg.Text = "Seleccione una Subdelegación para iniciar una depuración."
            Else
                Dim dv As DataView
                Dim estado As Integer
                dv = CType(SqlDataSourceDepuracion.Select(DataSourceSelectArguments.Empty), DataView)
                estado = CType(dv.Table.Rows(0)(0), Integer)
                If (estado = 3) Then
                    LabelMsg.Text = "Depurado."
                    GridView1.DataBind()
                    GridView2.DataBind()
                    GridView4.DataBind()
                    GridView5.DataBind()
                    GridView7.DataBind()
                    GridView8.DataBind()
                    GridView9.DataBind()
                    GridView11.DataBind()
                Else
                    LabelMsg.Text = "Problemas en la depuracion."
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class

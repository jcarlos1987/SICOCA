Imports System.IO
Imports System.Globalization

Public Class _Default4
    Inherits System.Web.UI.Page
    Dim tipoIncidenciaSireca As String = ""
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECA2chmod7").ToString.Equals("ARR") Then
                SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("ANALISIS_INCIDENCIAS", "ANALISIS_INCIDENCIAS" & Request.UserHostAddress.Replace(".", "_"))
                SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("and [SR_OMISION]='0'", "")
                GridView1.DataBind()
                'SqlDataSourceAnalisis.DataBind()
                SqlDataSourceRRB.SelectCommand = SqlDataSourceRRB.SelectCommand.Replace("ANALISIS_INCIDENCIAS", "ANALISIS_INCIDENCIAS" & Request.UserHostAddress.Replace(".", "_"))
                SqlDataSourceRRA.SelectCommand = SqlDataSourceRRA.SelectCommand.Replace("ANALISIS_INCIDENCIAS", "ANALISIS_INCIDENCIAS" & Request.UserHostAddress.Replace(".", "_"))
            Else
                Response.Redirect("~/accesoDenegado.aspx")
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
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        cargaDedatos()
    End Sub
    Protected Sub cargaDedatos()
        tipoIncidenciaSireca = DDLInc.SelectedValue
        If tipoIncidenciaSireca.Equals("TODOS") Then
            SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("DS3301FR061112FC271112", DDLAnalizar.SelectedValue)
            SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("3301ACOP201112", DDLRale.SelectedValue)
            SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("=?", " not in (?) ")
            SqlDataSourceInc.SelectCommand = SqlDataSourceInc.SelectCommand.Replace("DS3301FR061112FC271112", DDLAnalizar.SelectedValue)
            GridView1.DataBind()
            GridView2.DataBind()
            GridView3.DataBind()
        Else
            SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("DS3301FR061112FC271112", DDLAnalizar.SelectedValue)
            SqlDataSourceAnalisis.SelectCommand = SqlDataSourceAnalisis.SelectCommand.Replace("3301ACOP201112", DDLRale.SelectedValue)
            SqlDataSourceInc.SelectCommand = SqlDataSourceInc.SelectCommand.Replace("DS3301FR061112FC271112", DDLAnalizar.SelectedValue)
            GridView1.DataBind()
            GridView2.DataBind()
            GridView3.DataBind()
        End If
    End Sub
    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca '& ", DE LA SUBDELEGACION: " & DDLSubdel.SelectedValue & ", Con el RALE: " & DDLRale.SelectedValue
            GridView1.FooterRow.Cells(0).Text = "0"
            GridView1.FooterRow.Cells(1).Text = "0"
            GridView1.FooterRow.Cells(3).Text = "0"
            'GridView1.FooterRow.Cells(5).Text = "0"
            GridView1.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(1).Text = Convert.ToDouble(GridView1.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(GridView1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                'GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(6).Text = Convert.ToDouble(GridView1.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridView1.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(1).Text))
            GridView1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text))
            'GridView1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text))
            GridView1.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(6).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        GridView1.AllowSorting = False
        GridView1.DataBind()
        GridView2.AllowSorting = False
        GridView2.DataBind()
        GridView3.AllowSorting = False
        GridView3.DataBind()
        cargaDedatos()
        ExportToExcel("resumenaRalevsRale")
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)

        form.Controls.Add(GridView3)
        form.Controls.Add(GridView2)
        form.Controls.Add(GridView1)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Try
            GridView2.FooterRow.Cells(1).Text = "0"
            GridView2.FooterRow.Cells(2).Text = "0"
            GridView2.FooterRow.Cells(3).Text = "0"
            GridView2.FooterRow.Cells(4).Text = "0"
            
            For i As Int32 = 0 To (GridView2.Rows.Count - 1)
                If GridView2.Rows(i).Cells(0).Text.Equals("NO SE ENCUENTRA(RALE COMPARATIVO)") Then
                Else
                    GridView2.FooterRow.Cells(1).Text = Convert.ToDouble(GridView2.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(1).Text.Replace(",", ""))
                    'GridView2.FooterRow.Cells(2).Text = Convert.ToDouble(GridView2.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(2).Text.Replace(",", ""))
                    GridView2.FooterRow.Cells(3).Text = Convert.ToDouble(GridView2.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(3).Text.Replace(",", ""))
                    GridView2.FooterRow.Cells(4).Text = Convert.ToDouble(GridView2.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView2.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
                End If
            Next
                GridView2.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(1).Text))
                'GridView2.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(2).Text))
                GridView2.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView2.FooterRow.Cells(3).Text))
                GridView2.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView2.FooterRow.Cells(4).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        Try
            GridView3.FooterRow.Cells(1).Text = "0"
            GridView3.FooterRow.Cells(2).Text = "0"
            GridView3.FooterRow.Cells(3).Text = "0"
            GridView3.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridView3.Rows.Count - 1)
                'Dim hlf1 As HyperLinkField = GridView3.Columns(2)
                'Dim hlf2 As HyperLinkField = GridView3.Rows(i).FindControl("")
                'MsgBox(hlf1.Text)
                GridView3.FooterRow.Cells(1).Text = Convert.ToDouble(GridView3.Rows(i).Cells(1).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(1).Text.Replace(",", ""))
                'GridView3.FooterRow.Cells(2).Text = Convert.ToDouble(hlf1.Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(3).Text = Convert.ToDouble(GridView3.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView3.FooterRow.Cells(4).Text = Convert.ToDouble(GridView3.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView3.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView3.FooterRow.Cells(1).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(1).Text))
            'GridView3.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(2).Text))
            GridView3.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView3.FooterRow.Cells(3).Text))
            GridView3.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView3.FooterRow.Cells(4).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
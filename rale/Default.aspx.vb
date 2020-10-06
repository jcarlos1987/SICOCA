Imports System.IO
Imports System.Globalization
Imports System.Data.OleDb

Public Class _Default36
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
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
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal wControl As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        wControl.AllowSorting = False
        wControl.DataBind()
        For i As Int32 = 0 To (wControl.Rows.Count - 1)
            wControl.Rows(i).Cells(1).Text = CType(wControl.Rows(i).Cells(1).FindControl("HyperLink2"), HyperLink).Text
            wControl.Rows(i).Cells(3).Text = CType(wControl.Rows(i).Cells(3).FindControl("HyperLink1"), HyperLink).Text
        Next
        form.Controls.Add(wControl)

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
    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
    End Sub

    Protected Sub IBExportar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBExportar.Click
        ExportToExcel(Now.Year.ToString("D4") + Now.Month.ToString("D2") + Now.Day.ToString("D2"), GridView1)
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            'GridViewEco.Caption = "<strong>PARA EL CAMBIO <br/>A LA 31 </strong>"
            GridView1.FooterRow.Cells(0).Text = "<strong>TOTAL</strong>"
            GridView1.FooterRow.Cells(1).Text = "0"
            GridView1.FooterRow.Cells(2).Text = "0"
            GridView1.FooterRow.Cells(3).Text = "0"
            GridView1.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridView1.Rows.Count - 1)
                GridView1.FooterRow.Cells(1).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(1).FindControl("LinkButton1"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(1).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(2).Text = Convert.ToDouble(GridView1.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridView1.Rows(i).Cells(3).FindControl("LinkButton2"), LinkButton).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridView1.FooterRow.Cells(4).Text = Convert.ToDouble(GridView1.Rows(i).Cells(4).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(4).Text.Replace("$", "").Replace(",", ""))
            Next
            GridView1.FooterRow.Cells(1).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(1).Text)) + "</strong>"
            GridView1.FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(2).Text)) + "</strong>"
            GridView1.FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(3).Text)) + "</strong>"
            GridView1.FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridView1.FooterRow.Cells(4).Text)) + "</strong>"
        Catch ex As Exception

        End Try
        'GREGANDO TEXTO EN EL ENCABEZADO DE LA TABLA
        GridView1.Caption = "<strong>RESUMEN POR INCIDENCIAS</strong>"
        'Dim msgRales As String =""
        For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
            If DropDownSubdel.SelectedValue.Equals("%") Then
                If DropDownTipo.SelectedValue.Equals("COP") Then
                    GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                ElseIf DropDownTipo.SelectedValue.Equals("RCV") Then
                    GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                Else
                    GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                End If
            Else
                If DropDownSubdel.SelectedValue.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                    If DropDownTipo.SelectedValue.Equals("COP") Then
                        GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    ElseIf DropDownTipo.SelectedValue.Equals("RCV") Then
                        GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    Else
                        GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                        GridView1.Caption = GridView1.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    End If
                End If
            End If
        Next
    End Sub

    Protected Sub DropDownSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DropDownSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DropDownSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DropDownSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DropDownSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DropDownSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub
    Function fechaDelrale(ByVal subdel As String, ByVal tipoCopRcv As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 (datename(weekday,fecha)+','+datename(day,fecha)+' de '+datename(month,fecha)+' de '+datename(year,fecha)) from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' order by fecha desc "
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
End Class
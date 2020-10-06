Imports System.Globalization
Imports System.Data.OleDb

Public Class los20mayoresporincdesglose
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

    Protected Sub GridViewMayores_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewMayores.PreRender
        Try
            GridViewMayores.FooterRow.Cells(4).Text = "0"
            GridViewMayores.FooterRow.Cells(5).Text = "0"
            GridViewMayores.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridViewMayores.Rows.Count - 1)
                GridViewMayores.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewMayores.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewMayores.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewMayores.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewMayores.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridViewMayores.FooterRow.Cells(5).Text.Replace(",", ""))
                GridViewMayores.FooterRow.Cells(6).Text = Convert.ToDouble(GridViewMayores.Rows(i).Cells(6).Text.Replace(",", "").Replace("$", "")) + Convert.ToDouble(GridViewMayores.FooterRow.Cells(6).Text.Replace(",", ""))
            Next
            GridViewMayores.FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewMayores.FooterRow.Cells(4).Text)) + "</strong>"
            GridViewMayores.FooterRow.Cells(5).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewMayores.FooterRow.Cells(5).Text)) + "</strong>"
            GridViewMayores.FooterRow.Cells(6).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewMayores.FooterRow.Cells(6).Text)) + "</strong>"

            GridViewMayores.Caption = (GridViewMayores.FooterRow.Cells(4).Text) & " CREDITOS, con un IMPORTE de " & (GridViewMayores.FooterRow.Cells(6).Text)

            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If DDLSubdel.SelectedValue.Equals("%") Then
                    If DDLEco.SelectedValue.Equals("COP") Then
                        GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    ElseIf DDLEco.SelectedValue.Equals("RCV") Then
                        GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    Else
                        GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                        GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                    End If
                Else
                    If DDLSubdel.SelectedValue.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        If DDLEco.SelectedValue.Equals("COP") Then
                            GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                        ElseIf DDLEco.SelectedValue.Equals("RCV") Then
                            GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                        Else
                            GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. C.O.P.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "COP") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                            GridViewMayores.Caption = GridViewMayores.Caption + "<br/><strong>R.A.L.E. R.C.V.:</strong>" + fechaDelrale(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0), "RCV") & " <strong>SUBDEL.:</strong>" & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)
                        End If
                    End If
                End If
            Next
        Catch ex As Exception

        End Try
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
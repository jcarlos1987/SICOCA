Imports System.IO

Public Class documentos1
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim direccionip As String = ConfigurationSettings.AppSettings("direccionip")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
        End If
    End Sub

    Protected Sub Table1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles Table1.PreRender
        Dim nomDirectorio As String = Server.MapPath("~/descargas/sinpago/" & DropDownSubdel.SelectedValue)
        Dim archivos As String() = Directory.GetFiles(nomDirectorio)
        For i As Int32 = 0 To (archivos.Length - 1)            
            If archivos.GetValue(i).ToString.Contains(".zip") Then
                Dim tempRow As New TableRow()
                'For j As Int32 = 0 To 2
                Dim tempCell1 As New TableCell()
                tempCell1.Text = DropDownSubdel.SelectedValue
                tempRow.Cells.Add(tempCell1)
                Dim tempCell2 As New TableCell()
                Dim nomFileZip As String = archivos.GetValue(i).ToString.Split("\").GetValue(archivos.GetValue(i).ToString.Split("\").Length - 1)
                tempCell2.Text = nomFileZip.Insert(4, "/").Substring(2, 7) & " CREADO:" & (nomFileZip.Insert(11, "/").Insert(14, "/")).Substring(9).Replace(".zip", "")
                tempRow.Cells.Add(tempCell2)
                Dim tempCell3 As New TableCell()
                tempCell3.Text = "<a href='" + direccionip + "/WebSireca/descargas/sinpago/" & DropDownSubdel.SelectedValue + "/" + nomFileZip + "'>DESCARGAR</a>"
                tempRow.Cells.Add(tempCell3)
                'Next
                tempRow.Font.Bold = True
                tempRow.HorizontalAlign = HorizontalAlign.Center
                Table1.Rows.Add(tempRow)
            End If
        Next
    End Sub
End Class
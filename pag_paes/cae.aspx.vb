Imports System.IO

Public Class cae
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
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

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Resultados"
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ExportToExcel("CAE", GridView1)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal gv As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        form.Controls.Add(gv)

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
End Class
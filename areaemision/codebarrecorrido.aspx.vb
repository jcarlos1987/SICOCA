Public Class codebarrecorrido
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~/areaemision/codebarrecorrido.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''If Session.Item("SIRECAuser") Is Nothing Then
        ''Response.Redirect("~/Login.aspx")
        '' End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        '' If Session.Item("SIRECAuser") Is Nothing Then
        ''  Response.Redirect("~/Login.aspx")
        ''Else
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
        ''End If
    End Sub

    Protected Sub TBFIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFIni.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFFin.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If Not CType(sender, DropDownList).Items.Contains(New ListItem("TODOS", "%")) Then
            CType(sender, DropDownList).Items.Add(New ListItem("TODOS", "%"))
        End If
    End Sub

    Protected Sub LBExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBExport.Click
        ExportToExcel("CodeBar" + Year(Now).ToString + Month(Now).ToString + Day(Now).ToString)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String)
        Dim responsePage As HttpResponse = Response
        Dim sw As New System.IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
       
        form.Controls.Add(RepeaterCodeBar)

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
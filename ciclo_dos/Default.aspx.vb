Imports System.IO

Public Class _Default3
    Inherits System.Web.UI.Page
    Dim verde As String = ConfigurationSettings.AppSettings("Color0")
    Dim amarillo As String = ConfigurationSettings.AppSettings("Color30")
    Dim rojo As String = ConfigurationSettings.AppSettings("Color90")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSourceDeudas.SelectCommand = SqlDataSourceDeudas.SelectCommand.Replace("cop187", "cop187" & Request.UserHostAddress.Replace(".", "_"))
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones, TD '08','80','81','82' y '88' del RALE: " & DDLRale.SelectedValue
        colorizar()
    End Sub
    Private Sub colorizar()
        For index As Integer = 0 To (GridView1.Rows.Count - 1)
            If GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text.Equals("1verde") Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(verde)
            ElseIf GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text.Equals("2amarillo") Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(amarillo)
            ElseIf GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text.Equals("3rojo") Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(rojo)
            End If
        Next
    End Sub
    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        GridView1.AllowSorting = False
        GridView1.DataBind()
        ExportToExcel("exportacion", GridView1)
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        'SqlDataSourceDeudas.SelectCommand = SqlDataSourceDeudas.SelectCommand.Replace("cop187", "cop187" & Request.UserHostAddress.Replace(".", "_"))
        SqlDataSourceDeudas.SelectCommand = SqlDataSourceDeudas.SelectCommand.Replace("3301ACOP201112", DDLRale.SelectedValue)
        SqlDataSourceDeudas.SelectCommand = SqlDataSourceDeudas.SelectCommand.Replace("group by [REGPATR],TIPO_PERSONA order by [DIAS] desc --having sum([ACTUALIZADO])>0", " ") & DropDownList1.SelectedValue & " group by [REGPATR],TIPO_PERSONA order by [DIAS] desc --having sum([ACTUALIZADO])>0"
        GridView1.DataBind()
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
            'DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            'DDLSubdel.Items.Add(New ListItem("SUR", "33"))
        Else
            DDLSubdel.Items.Clear()
            If Session.Item("SIRECAsubdel").Equals("01") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            ElseIf Session.Item("SIRECAsubdel").Equals("33") Then
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            Else
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
        End If
    End Sub
End Class
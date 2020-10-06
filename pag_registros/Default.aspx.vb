Imports System.IO
Imports addHistorialAcciones

Public Class _Default19
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim histAcciones As HistorialWeb = New HistorialWeb
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        histAcciones.agregarHistorial(cadenaconexion, "", Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "3", "Consulta", "", "", "No deligenciados", "regpat", Request.UserHostAddress)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAbaseNDRegistros").ToString.Equals("1") Then

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

    Protected Sub GVNDeligenciados_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVNDeligenciados.PreRender
        GVNDeligenciados.Caption = "<strong>" & GVNDeligenciados.Rows.Count & " PATRONE(S) NO DELIGENCIADOS</strong>"
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        ExportToExcel("NDDepRegistros", GVNDeligenciados)
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

    Protected Sub BBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BBuscar.Click
        GVNDeligenciados.DataBind()
    End Sub
End Class
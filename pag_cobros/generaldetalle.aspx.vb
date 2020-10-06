Public Class generaldetalle
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
        If Not Request.QueryString("subdel") Is Nothing Then
            DDLSubdel.SelectedValue = Request.QueryString("subdel").ToString
        End If        
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        Try
            If Request.QueryString("periodo").ToString.Substring(3, 7).Equals(Request.QueryString("periodofin").ToString.Substring(3, 7)) Then
                GridView1.Caption = GridView1.Rows.Count.ToString & " PATRONES del PERIODO " & Request.QueryString("periodo").ToString.Substring(3, 7)
            Else
                GridView1.Caption = GridView1.Rows.Count.ToString & " PATRONES del PERIODO " & Request.QueryString("periodo").ToString.Substring(3, 7) & " al " & Request.QueryString("periodofin").ToString.Substring(3, 7)
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DDLTipo_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLTipo.Init
        If Not Request.QueryString("tipo") Is Nothing Then
            DDLTipo.SelectedValue = Request.QueryString("tipo").ToString
        End If        
    End Sub

    Protected Sub DDLInspector_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.Init        
        
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        'If Not Request.QueryString("inspector") Is Nothing Then
        '   DDLInspector.SelectedValue = Request.QueryString("inspector").ToString
        'End If
    End Sub

    Protected Sub DDLInspector_DataBound(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.DataBound
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not DDLInspector.Items.Contains(New ListItem("TODOS", "%")) Then
                DDLInspector.Items.Add(New ListItem("TODOS", "%"))
                DDLInspector.SelectedValue = Request.QueryString("inspector").ToString
            Else
                DDLInspector.SelectedValue = Request.QueryString("inspector").ToString
            End If
            If Not DDLInspector.Items.Contains(New ListItem("SIN ASIGNAR", "SN")) Then
                DDLInspector.Items.Add(New ListItem("SIN ASIGNAR", "SN"))
                DDLInspector.SelectedValue = Request.QueryString("inspector").ToString
            Else
                DDLInspector.SelectedValue = Request.QueryString("inspector").ToString
            End If
        End If
    End Sub
End Class
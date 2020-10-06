Public Class ejecutor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/cobros/login2.aspx")
        ElseIf Session.Item("SIRECA2chmod1").ToString.Equals("x") And Session.Item("SIRECAuser_type").ToString.Equals("1") Then
        Else
            Response.Redirect("~/cobros/login2.aspx")
        End If
    End Sub

   
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim patrones As String = ""
        For i As Integer = 0 To (GridView1.Rows.Count - 1)
            Dim c1 As CheckBox = GridView1.Rows(i).Cells(0).FindControl("CheckBox1")
            If c1.Checked Then
                patrones += "marcadores.push({ location: new google.maps.LatLng(" & GridView1.Rows(i).Cells(10).Text & ", " & GridView1.Rows(i).Cells(11).Text & ") });"
            End If
        Next
        HiddenField1.Value = patrones        
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)        
        Dim ddl As DropDownList = sender
        For i As Integer = 0 To (GridView1.Rows.Count - 1)
            ddl = GridView1.Rows(i).Cells(7).FindControl("DropDownList1")
            If ddl.SelectedValue.Equals("32") Then
                GridView1.Rows(i).Cells(7).FindControl("FUImagen").Visible = True
                GridView1.Rows(i).Cells(7).FindControl("BSubir").Visible = True
            Else
                GridView1.Rows(i).Cells(7).FindControl("FUImagen").Visible = False
                GridView1.Rows(i).Cells(7).FindControl("BSubir").Visible = False
            End If
            
        Next
        'GridView1.Rows().Cells(0).FindControl("CheckBox1")
    End Sub
End Class
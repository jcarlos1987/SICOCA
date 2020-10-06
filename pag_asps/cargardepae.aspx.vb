Imports System.Data.OleDb
Public Class cargardepae
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        For fila As Int16 = 0 To (GridView1.Rows.Count - 1)
            Dim ddl As DropDownList = GridView1.Rows(fila).FindControl("DropDownList1")
            Dim rbl As RadioButtonList = GridView1.Rows(fila).FindControl("RadioButtonList1")
            'MsgBox(rbl.SelectedValue)
            If (rbl.SelectedValue.Equals("")) Then

            Else
                Dim con As New OleDbConnection(cadenaconexion)
                Dim cmd As New OleDbCommand()
                cmd.Connection = con
                Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [incidencia]=?,[grado3]=?,[fechaCaptura]=?,[responsable]=?,[nomResponsable]=? WHERE [id]=?"
                cmd.CommandText = myInsertQuery

                cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = rbl.SelectedValue
                cmd.Parameters.Add("@grado3", OleDbType.VarChar).Value = rbl.SelectedValue
                cmd.Parameters.Add("@fechaCaptura", OleDbType.Date).Value = Now
                cmd.Parameters.Add("@responsable", OleDbType.VarChar).Value = ddl.SelectedValue
                cmd.Parameters.Add("@nomResponsable", OleDbType.VarChar).Value = ddl.SelectedValue

                cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToInt32(GridView1.Rows(fila).Cells(0).Text)
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End If
        Next
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Resultados"
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
End Class
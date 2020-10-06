Imports System.Data.OleDb

Public Class SetUbicacion
    Inherits System.Web.UI.Page
    'Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Session.Item("SIRECAuser") Is Nothing Then
        '   Response.Redirect("~/Login.aspx")
        'Else
        'If Session.Item("SIRECAchmod1").ToString.Equals("x") Then

        '  Else
        '       Response.Redirect("~/Login.aspx")
        '    End If
        ' End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            'Dim con As New OleDbConnection(cadenaconexion)
            'Dim cmd As New OleDbCommand()
            'cmd.Connection = con

            'Dim myInsertQuery As String = "update [sireca].[dbo].[patrones] set [latitud] = ?,[longitud]=? WHERE [regpat] like '%'+?+'%'"
            'cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@longitud", OleDbType.Double).Value = Convert.ToDouble(VPLong.Text)
            'cmd.Parameters.Add("@latitud", OleDbType.Double).Value = Convert.ToDouble(VPLlat.Text)
            'cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = DDLregpat.SelectedValue.ToString
            'con.Open()
            'cmd.ExecuteNonQuery()
            '   con.Close()
            '  GridView1.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        GridView1.DataBind()
    End Sub
End Class
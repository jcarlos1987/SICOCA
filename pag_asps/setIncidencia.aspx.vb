Imports System.Data.OleDb

Public Class setIncidencia
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                LIncidencia.Text = Request.QueryString("incidencia").ToString
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub BIncidencia_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BIncidencia.Click
        If Session.Item("SIRECAchmod4").ToString.Equals("x") Then
            '-------historial Incidencia INICIO--------------------        
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con
            Dim myInsertQuery As String = "INSERT INTO [sireca].[dbo].[HistorialInc] ([usuario],[subdel],[ip],[sector],[regpat],[periodo],[fecha],[incidencia],[observaciones],[tipoEco],[idEco])"
            myInsertQuery += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@id", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@usuario", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString
            cmd.Parameters.Add("@ip", OleDbType.VarChar).Value = Request.UserHostAddress()
            cmd.Parameters.Add("@sector", OleDbType.VarChar).Value = Request.QueryString("emisec").ToString
            cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = Request.QueryString("regpat").ToString
            cmd.Parameters.Add("@periodo", OleDbType.Double).Value = Convert.ToDouble(Request.QueryString("fechaEco").ToString)
            cmd.Parameters.Add("@fecha", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = DDLIncidencia.SelectedValue

            cmd.Parameters.Add("@observaciones", OleDbType.VarChar).Value = ""

            cmd.Parameters.Add("@tipoEco", OleDbType.VarChar).Value = Request.QueryString("tipoEcox").ToString
            cmd.Parameters.Add("@idEco", OleDbType.Double).Value = Request.QueryString("id").ToString
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()

            '<<<<<<<<<<<Inicio de la Actualizar de la incidencia>>>>>>>>>>>>>>>>>>>
            con = New OleDbConnection(cadenaconexion)
            cmd = New OleDbCommand()
            cmd.Connection = con

            myInsertQuery = "update [sireca].[dbo].[eco] set [incidencia] = ?, [grado2]=?, [fechaCaptura]=? WHERE [id]=?"
            cmd.CommandText = myInsertQuery
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = DDLIncidencia.SelectedValue
            cmd.Parameters.Add("@grado2", OleDbType.VarChar).Value = DDLIncidencia.SelectedValue
            cmd.Parameters.Add("@fechaCaptura", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(Request.QueryString("id").ToString)
            con.Open()
            If cmd.ExecuteNonQuery() > 0 Then
                LIncidencia.Text = DDLIncidencia.Text
            End If
            con.Close()
            '<<<<<<<<<<<Fin Actualizacion de la Incidencia>>>>>>>>>>>>>>>>>>>
        Else
            Server.Transfer("~/accesoDenegado.aspx")
        End If
    End Sub
End Class
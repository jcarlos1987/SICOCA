Imports System.Data.OleDb

Public Class detallesRegpat
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
        'Label1.Text = "Incidencia Actual: " & Request.QueryString("incidencia").ToString
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If Session.Item("SIRECAchmod4").ToString.Equals("x") Then
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [nomResponsable]=?,[cambiarIncidencia]=?,[responsable] = ? ,[fechaSeleccion] = ?,[diasDisponibles]=? WHERE [id]=?"
            cmd.CommandText = myInsertQuery

            cmd.Parameters.Add("@nomResponsable", OleDbType.VarChar).Value = DropDownList1.SelectedValue
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@responsable", OleDbType.VarChar).Value = DropDownList1.SelectedValue
            cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToInt32(Request.QueryString("id").ToString)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()

        Else
            Server.Transfer("~/accesoDenegado.aspx")
        End If
    End Sub

    Protected Sub BIncidencia_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BIncidencia.Click
        If Session.Item("SIRECAchmod4").ToString.Equals("x") Then
            If IsDate(TextBox2.Text) Then
                '-------historial Incidencia INICIO--------------------        
                Dim conx As New OleDbConnection(cadenaconexion)
                Dim cmdx As New OleDbCommand()
                cmdx.Connection = conx
                Dim myInsertQueryx As String = "INSERT INTO [sireca].[dbo].[HistorialInc] ([usuario],[subdel],[ip],[sector],[regpat],[periodo],[fecha],[incidencia],[observaciones],[tipoEco],[idEco])"
                myInsertQueryx += " values("
                myInsertQueryx += " '" & Session.Item("SIRECAid").ToString & "'"
                myInsertQueryx += " , '" & Session.Item("SIRECAsubdel").ToString & "'"
                myInsertQueryx += " , '" & Request.UserHostAddress() & "'"
                myInsertQueryx += " , '" & GridView5.Rows(0).Cells(3).Text & "'"
                myInsertQueryx += " , '" & Request.QueryString("regpat").ToString & "'"
                myInsertQueryx += " , " & Request.QueryString("periodo").ToString & ""
                myInsertQueryx += " , convert(datetime,'" & TextBox2.Text & "',103) "
                myInsertQueryx += " , '" & DDLIncidencia.SelectedValue & "'"
                myInsertQueryx += " , ''"
                myInsertQueryx += " , '" & GridView5.Rows(0).Cells(1).Text & "'"
                myInsertQueryx += " , '" & Request.QueryString("id").ToString & "'"
                myInsertQueryx += " )"
                cmdx.CommandText = myInsertQueryx
                conx.Open()
                cmdx.ExecuteNonQuery()
                conx.Close()

                '<<<<<<<<<<<Inicio de la Actualizar de la incidencia>>>>>>>>>>>>>>>>>>>
                LERROR.Text = ""

                Dim con As New OleDbConnection(cadenaconexion)
                Dim cmd As New OleDbCommand()
                con = New OleDbConnection(cadenaconexion)
                cmd = New OleDbCommand()
                cmd.Connection = con

                Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [incidencia] = ?, [fechaCaptura]=? WHERE [id]=?"
                cmd.CommandText = myInsertQuery
                cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = DDLIncidencia.SelectedValue
                cmd.Parameters.Add("@fechaCaptura", OleDbType.Date).Value = Convert.ToDateTime(TextBox2.Text)
                cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(Request.QueryString("id").ToString)
                con.Open()
                If cmd.ExecuteNonQuery() > 0 Then
                    LIncidencia.Text = DDLIncidencia.Text
                End If
                con.Close()
            Else
                LERROR.Text = "Fecha Invalida."
            End If
            '<<<<<<<<<<<Fin Actualizacion de la Incidencia>>>>>>>>>>>>>>>>>>>
        Else
            Server.Transfer("~/accesoDenegado.aspx")
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        Dim con As New OleDbConnection(cadenaconexion)
        Dim cmd As New OleDbCommand()
        cmd.Connection = con

        Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [sector]=? WHERE [id]=?"
        cmd.CommandText = myInsertQuery

        cmd.Parameters.Add("@sector", OleDbType.VarChar).Value = TextBox1.Text
        cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToInt32(Request.QueryString("id").ToString)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        GridView5.DataBind()
    End Sub

    Protected Sub TextBox1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox1.PreRender
        TextBox1.Text = GridView5.Rows(0).Cells(3).Text
    End Sub

    Protected Sub BReset_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BReset.Click
        If Session.Item("SIRECAchmod4").ToString.Equals("x") Then
            If CBReset.Checked Then
                Dim con As New OleDbConnection(cadenaconexion)
                Dim cmd As New OleDbCommand()
                cmd.Connection = con

                Dim myInsertQuery As String = " update [sireca].[dbo].[eco] "
                myInsertQuery += " set "
                myInsertQuery += " responsable=null "
                myInsertQuery += " ,fechaSeleccion=null "
                myInsertQuery += " ,cambiarIncidencia='9' "
                myInsertQuery += " ,incidencia=null "
                myInsertQuery += " ,nomResponsable=null "
                myInsertQuery += " ,grado1='0000' "
                myInsertQuery += " ,grado2=null "
                myInsertQuery += " where id=" & Request.QueryString("id").ToString & " "
                myInsertQuery += " and fechaEco=" & GridView5.Rows(0).Cells(0).Text & " "
                myInsertQuery += " and substring(REG#PATRONAL,1,10)='" & GridView5.Rows(0).Cells(4).Text & "' "
                myInsertQuery += " and CREDITO='" & GridView5.Rows(0).Cells(7).Text & "' "
                cmd.CommandText = myInsertQuery
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End If
        Else
            Server.Transfer("~/accesoDenegado.aspx")
        End If
    End Sub

    Protected Sub TextBox2_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBox2.Init
        TextBox2.Text = Now.ToShortDateString.ToString
    End Sub
End Class
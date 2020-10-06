Imports System.Data.OleDb

Public Class supervisorinforme
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/cobros/login2.aspx")
        ElseIf Session.Item("SIRECAuser_type").ToString.Equals("0") Then
        Else
            Response.Redirect("~/cobros/login2.aspx")
        End If
    End Sub

    Protected Sub reseteo()
        '###############################################################################################
        Dim con As New OleDbConnection(cadenaconexion)
        Dim cmd As New OleDbCommand()
        cmd.Connection = con
        Dim myInsertQuery As String = "update [sirecacobros].[dbo].[capturas] set [ASIGNADO]=?,[EJECUTOR]=?,[SUPERVISOR]=?,[FECHA_ASIGNACION]=?,[IP_ASIGNACION]=? "
        cmd.CommandText = myInsertQuery
        cmd.Parameters.Add("@ASIGNADO", OleDbType.VarChar).Value = "NO"
        cmd.Parameters.Add("@EJECUTOR", OleDbType.VarChar).Value = "NO ASIGNADO"
        cmd.Parameters.Add("@SUPERVISOR", OleDbType.VarChar).Value = DBNull.Value
        cmd.Parameters.Add("@FECHA_ASIGNACION", OleDbType.Date).Value = DBNull.Value
        cmd.Parameters.Add("@IP_ASIGNACION", OleDbType.VarChar).Value = DBNull.Value
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        '-----------------------------------------------------------------------------------------------
        con = New OleDbConnection(cadenaconexion)
        cmd = New OleDbCommand()
        cmd.Connection = con
        myInsertQuery = "update [sirecacobros].[dbo].[Busqueda_PAE_TIPO] set [ASIGNADO]=?,[EJECUTOR]=?,[SUPERVISOR]=?,[FECHA_ASIGNACION]=?,[IP_ASIGNACION]=? "
        cmd.CommandText = myInsertQuery
        cmd.Parameters.Add("@ASIGNADO", OleDbType.VarChar).Value = "NO"
        cmd.Parameters.Add("@EJECUTOR", OleDbType.VarChar).Value = "NO ASIGNADO"
        cmd.Parameters.Add("@SUPERVISOR", OleDbType.VarChar).Value = DBNull.Value
        cmd.Parameters.Add("@FECHA_ASIGNACION", OleDbType.Date).Value = DBNull.Value
        cmd.Parameters.Add("@IP_ASIGNACION", OleDbType.VarChar).Value = DBNull.Value
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

        '###############################################################################################
    End Sub
    Protected Sub BAsignar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BAsignar.Click
        reseteo()
        For fila As Integer = 0 To (GridView2.Rows.Count - 1)
            '----------------------------------------------------------------------------------------------------------
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            catCMD.CommandText = "SELECT [REGPATR] FROM [sirecacobros].[dbo].[Busqueda_PAE_TIPO] WHERE tipo_adeudo like '%" & GridView2.Rows(fila).Cells(0).Text & "' "
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Dim contador As Integer = 0
            Dim cantidadEjecutores As Integer = 1
            Do While myReader.Read()
                Dim regpatr As String = myReader.GetValue(0)
                '-------------------------------------------------------------------------------------------------------------------------------------------------
                If Convert.ToInt32(GridView2.Rows(fila).Cells(4).Text) <= 0 Then
                    Exit Do
                End If
                If (contador = Convert.ToInt32((GridView2.Rows(fila).Cells(4).Text))) Then
                    cantidadEjecutores += 1
                    contador = 1
                Else
                    contador += 1
                End If
                If cantidadEjecutores <= Convert.ToInt32(TBEJECUTORES.SelectedValue) Then
                    '###############################################################################################
                    Dim con As New OleDbConnection(cadenaconexion)
                    Dim cmd As New OleDbCommand()
                    cmd.Connection = con
                    Dim myInsertQuery As String = "update [sirecacobros].[dbo].[capturas] set [ASIGNADO]=?,[EJECUTOR]=?,[SUPERVISOR]=?,[FECHA_ASIGNACION]=?,[IP_ASIGNACION]=?  WHERE [REGPATR] = '" & regpatr & "'"
                    cmd.CommandText = myInsertQuery
                    cmd.Parameters.Add("@ASIGNADO", OleDbType.VarChar).Value = "SI"
                    cmd.Parameters.Add("@EJECUTOR", OleDbType.VarChar).Value = ("P" & (cantidadEjecutores))
                    cmd.Parameters.Add("@SUPERVISOR", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
                    cmd.Parameters.Add("@FECHA_ASIGNACION", OleDbType.Date).Value = Now
                    cmd.Parameters.Add("@IP_ASIGNACION", OleDbType.VarChar).Value = Request.UserHostAddress
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    '-----------------------------------------------------------------------------------------------
                    '-----------------------------------------------------------------------------------------------
                    con = New OleDbConnection(cadenaconexion)
                    cmd = New OleDbCommand()
                    cmd.Connection = con
                    myInsertQuery = "update [sirecacobros].[dbo].[Busqueda_PAE_TIPO] set [ASIGNADO]=?,[EJECUTOR]=?,[SUPERVISOR]=?,[FECHA_ASIGNACION]=?,[IP_ASIGNACION]=? WHERE [REGPATR] = '" & regpatr & "'"
                    cmd.CommandText = myInsertQuery
                    cmd.Parameters.Add("@ASIGNADO", OleDbType.VarChar).Value = "SI"
                    cmd.Parameters.Add("@EJECUTOR", OleDbType.VarChar).Value = ("P" & (cantidadEjecutores))
                    cmd.Parameters.Add("@SUPERVISOR", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
                    cmd.Parameters.Add("@FECHA_ASIGNACION", OleDbType.Date).Value = Now
                    cmd.Parameters.Add("@IP_ASIGNACION", OleDbType.VarChar).Value = Request.UserHostAddress
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    '###############################################################################################
                    'myReader.GetValue(0)
                Else
                    Exit Do
                End If

                '-------------------------------------------------------------------------------------------------------------------------------------------------

            Loop
            myReader.Close()
            nwindConn.Close()
        Next
        GridView2.DataBind()
        GridView3.DataBind()
    End Sub
End Class
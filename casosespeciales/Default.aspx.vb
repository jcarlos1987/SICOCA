Imports System.Data.OleDb

Public Class _Default39
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            End If
        End If
    End Sub
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
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        LMsg.Text = ""
        Dim regpatv As String = TBRegpat.Text.ToUpper
        Dim subdelv As String = DDLSubdel.SelectedValue
        Dim aliasv As String = DDLAlias.SelectedValue
        Dim aplicav As String = DDLAplicarA.SelectedValue
        If Not existeAleas(regpatv, subdelv, aliasv, aplicav) Then
            agregarAlias(regpatv, subdelv, aliasv, aplicav)
            LMsg.Text = " Alias Registrado. " & regpatv & " agregado a "
        Else
            actializarAlias(regpatv, subdelv, aliasv, aplicav)
            LMsg.Text = " Alias actualizado. " & regpatv & " agregado a "
        End If
    End Sub
    Private Function existeAleas(ByVal vregpat As String, ByVal vsubdel As String, ByVal valias As String, ByVal vaplica As String) As Boolean
        Dim exisAlias As Boolean = False
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim consulta As String = " SELECT [regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] "
        consulta += " WHERE [subdel]='" & vsubdel & "' and [regpatr]='" & vregpat & "' "
        catCMD.CommandText = consulta
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            exisAlias = True
            Exit Do
        Loop
        myReader.Close()
        nwindConn.Close()
        Return exisAlias
    End Function
    Private Sub agregarAlias(ByVal vregpat As String, ByVal vsubdel As String, ByVal valias As String, ByVal vaplica As String)
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = " INSERT INTO [sirecacobros].[dbo].[patronesAlianza] "
        myInsertQuery2 += " ([regpatr],[subdel],[idAlias],[aplica]) "
        myInsertQuery2 += " VALUES (?,?,?,?) "
        cmd2.CommandText = myInsertQuery2

        cmd2.Parameters.Add("@regpat", OleDbType.VarChar).Value = vregpat
        cmd2.Parameters.Add("@subdel", OleDbType.VarChar).Value = vsubdel
        cmd2.Parameters.Add("@idalias", OleDbType.Integer).Value = CInt(valias)
        cmd2.Parameters.Add("@aplica", OleDbType.VarChar).Value = vaplica

        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
    End Sub
    Private Sub actializarAlias(ByVal vregpat As String, ByVal vsubdel As String, ByVal valias As String, ByVal vaplica As String)
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = " UPDATE [sirecacobros].[dbo].[patronesAlianza] "
        myInsertQuery2 += " SET [regpatr] = '" & vregpat & "',[subdel] = '" & vsubdel & "',[idAlias] =" & valias & "  ,[aplica] = '" & vaplica & "' "
        myInsertQuery2 += " WHERE [subdel]='" & vsubdel & "' and [regpatr]='" & vregpat & "' "
        cmd2.CommandText = myInsertQuery2

        cmd2.Parameters.Add("@regpat", OleDbType.VarChar).Value = vregpat
        cmd2.Parameters.Add("@subdel", OleDbType.VarChar).Value = vsubdel
        cmd2.Parameters.Add("@idalias", OleDbType.Integer).Value = CInt(valias)
        cmd2.Parameters.Add("@aplica", OleDbType.VarChar).Value = vaplica

        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count & " Patrones Registrados.</strong>"
    End Sub

End Class
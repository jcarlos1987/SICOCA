Imports System.Data.OleDb

Public Class signacion
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
        GridView1.DataBind()
    End Sub

    Protected Sub LBAsignar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBAsignar.Click
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            If CType(GridView1.Rows(i).Cells(0).FindControl("CBIdAlias"), CheckBox).Checked Then
                asignarAlias1(CType(GridView1.Rows(i).Cells(0).FindControl("HFIdAlias"), HiddenField).Value, DDLInspector.SelectedValue)
            End If
        Next
        GridView1.DataBind()
    End Sub

    Private Sub asignarAlias1(ByVal idalias As String, ByVal idinspector As String)
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = " UPDATE [sirecacobros].[dbo].[patronesAlianzaAlias] "
        myInsertQuery2 += " SET [paa_idusuario]= " & idinspector
        myInsertQuery2 += " WHERE [paa_id]= " & idalias
        cmd2.CommandText = myInsertQuery2

        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
        asignarAlias2(idalias, idinspector)
    End Sub
    Private Sub asignarAlias2(ByVal idalias As String, ByVal idinspector As String)
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = " UPDATE [sirecacobros].[dbo].[CO_CPATRONAL] "
        myInsertQuery2 += " set [CP_HOST]='" + Request.UserHostAddress + "' "
        myInsertQuery2 += " ,[CP_FECH_SISTEM]=getdate() "
        myInsertQuery2 += " ,[CP_ID_SUPER]=" + Session.Item("SIRECAid").ToString + " "
        myInsertQuery2 += " ,[CP_FECH_ASIG]=getdate() "
        myInsertQuery2 += " ,[CP_INSPEC]=" + idinspector + " "
        myInsertQuery2 += " FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join [sirecacobros].[dbo].[patronesAlianza] "
        myInsertQuery2 += " on [CP_REGPAT]=[regpatr] "
        myInsertQuery2 += " WHERE CP_SUBDEL='" + DDLSubdel.SelectedValue + "' and [idAlias]='" + idalias + "' "

        cmd2.CommandText = myInsertQuery2

        cmd2.Parameters.Add("@regpat", OleDbType.VarChar).Value = ""

        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
    End Sub
End Class
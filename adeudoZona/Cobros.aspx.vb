Imports System.Data.OleDb

Public Class Cobros1
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAAdeudoZona").ToString.Equals("1") Then
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        'and rale.tipo in ('ABC')
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " if exists(select * from sirecacobros.dbo.sysobjects where name = 'ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "') "
        textConmand += " begin "
        textConmand += " drop table sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
        textConmand += " end "
        textConmand += " SELECT *,'COP' as TIPO "
        textConmand += " INTO sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
        textConmand += " FROM [rale].[dbo].[" & DDLRCOP.SelectedValue & "] "
        textConmand += " INSERT INTO sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
        textConmand += " SELECT *,'RCV' as TIPO FROM [rale].[dbo].[" & DDLRRCV.SelectedValue & "] "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim contDatos As Int32 = catCMD.ExecuteNonQuery()
        nwindConn.Close()
        SqlDataSource1.SelectCommand = SqlDataSource1.SelectCommand.Replace("ralecoprcvtemp", "ralecoprcvtemp" & Session.Item("SIRECAid").ToString).Replace("and rale.tipo in ('ABC')", "")
        GridView1.DataBind()
    End Sub
End Class
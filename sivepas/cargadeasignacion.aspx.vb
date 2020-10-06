Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class cargadeasignacion1
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod4").ToString.Equals("x") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAsubdel") Is Nothing Then
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub cargarCargaAseptada(ByVal idsivepa As String, ByVal inspector As String)
        'Try
        'LError.Text = ""
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22
        Dim myInsertQuery22 As String = " UPDATE [sirecasivepas].[dbo].[SV_BASE] "
        myInsertQuery22 += " SET [SV_ASIG_INSPECTOR] = " & inspector
        myInsertQuery22 += " ,[SV_ASIG_INSPECTOR_FECHA] = getdate() "
        myInsertQuery22 += " ,[SV_ASIG_ID_SUPER] = " & Session.Item("SIRECAid").ToString
        myInsertQuery22 += " ,[SV_ASIG_FECHA] = getdate() "
        myInsertQuery22 += " ,[SV_ASIG_IP] =  '" & Request.UserHostAddress & "'"
        myInsertQuery22 += " WHERE [SV_ID]='" & idsivepa & "' and [SV_SUBDEL]='" & DDLSubdel.SelectedValue & "' "

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() = 0 Then
            'LError.Text = "Error al Actualizar"
        Else
        End If
        con22.Close()
        'Catch ex As Exception
        'End Try
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        GridViewBuscar.DataBind()
    End Sub

    Protected Sub LBguardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim lb As String = CType(sender, LinkButton).CommandArgument
        Dim idinspector As String = CType(GridViewBuscar.Rows(CInt(lb.Split("-").GetValue(0))).Cells(8).FindControl("DDLInspector"), DropDownList).SelectedValue
        cargarCargaAseptada(lb.Split("-").GetValue(1).ToString, idinspector)
    End Sub

    Protected Sub GridViewBuscar_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewBuscar.PreRender
        GridViewBuscar.Caption = GridViewBuscar.Rows.Count.ToString("N0") & " Resultados visualizados"
    End Sub
End Class
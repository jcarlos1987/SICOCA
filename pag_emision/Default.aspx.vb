Imports System.Data.OleDb

Public Class _Default20
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
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

    Protected Sub DDLInspector_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.SelectedIndexChanged
        Try
            If DDLInspector.SelectedValue.Equals("%") Then
                PInformacion.Visible = False
                IBInspector.ImageUrl = "~/imagenes/usuarios/avatar/default.jpg"
                'Label4.Text = DropDownList1.SelectedValue
            Else
                PInformacion.Visible = True
                IBInspector.ImageUrl = "~/imagenes/usuarios/avatar/" & DDLInspector.SelectedValue & ".jpg"
                cargarDatosDelPatron(DDLInspector.SelectedValue)
            End If
        Catch ex As Exception

        End Try
    End Sub
    Private Sub cargarDatosDelPatron(ByVal idEjecutor As String)
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT upper((SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id])) as nombre " _
& " ,subdel " _
& " ,upper((SELECT [cargo] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id])) as cargo " _
& " ,credencial " _
& " ,(SELECT [antiguedad] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id]) as antiguedad " _
& "   FROM [sireca].[dbo].[usuarios] as sire " _
& " where sire.id='" & idEjecutor & "'"
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                LNombre.Text = myReader2.GetValue(0).ToString
                LSubdel.Text = myReader2.GetValue(1).ToString
                LCargo.Text = myReader2.GetValue(2).ToString
                LCredencial.Text = myReader2.GetValue(3).ToString
                LAntiguedad.Text = myReader2.GetValue(4).ToString
                'myReader2.GetValue(0).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub
End Class
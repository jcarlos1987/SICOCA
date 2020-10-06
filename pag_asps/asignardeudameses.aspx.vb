Imports System.Data.OleDb

Public Class asignardeudameses
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod5").ToString.Equals("x") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
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

    Protected Sub LabelRegpat_Init(ByVal sender As Object, ByVal e As EventArgs) Handles LabelRegpat.Init
        LabelRegpat.Text = Request.QueryString("regpat").ToString.ToUpper.Replace("-", "").Substring(0, 10)
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22
        Dim myInsertQuery22 As String = " UPDATE [sirecacobros].[dbo].[CO_CPATRONAL] " _
& " SET [CP_HOST] = '" & Request.UserHostAddress & "' " _
& " ,[CP_FECH_SISTEM] = getdate() " _
& " ,[CP_ID_SUPER] = " & Session.Item("SIRECAid").ToString & " " _
& " ,[CP_FECH_ASIG] = convert(datetime,'" & If(IsDate(TBFechAsig.Text), TBFechAsig.Text, Now.ToShortDateString) & "',103)" _
& " ,[CP_INSPEC] = " & DDLInspector.SelectedValue & " " _
& " WHERE CP_REGPAT='" & LabelRegpat.Text & "' and CP_SUBDEL='" & DDLSubdel.SelectedValue & "' "

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            'LMsg.Text = "Actualizado"
        Else
            'LMsg.Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub

    Protected Sub TBFechAsig_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechAsig.Init
        TBFechAsig.Text = Now.ToShortDateString
    End Sub
End Class
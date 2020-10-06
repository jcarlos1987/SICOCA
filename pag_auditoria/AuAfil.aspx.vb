Imports System.Data.OleDb

Public Class AuAfil
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAchmod2").ToString.Equals("x") Then

            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "PATRONES NO LOCALIZADOS: " & GridView1.Rows.Count
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            MsgBox(GridView1.Rows(i).Cells(0).Text)
        Next
        'Dim con As New OleDbConnection(cadenaconexion)
        'Dim cmd As New OleDbCommand()
        'cmd.Connection = con

        'Dim myInsertQuery As String = "update [procesar].[dbo].[RCPRO] set [RCP_IMP_COP]=?,[RCP_IMP_RCV]=? WHERE RCP_REGPAT='" & dato.GetValue(4) & "' and RCP_FOLIO='" & dato.GetValue(5) & "' and RCP_PER='" & dato.GetValue(6) & "'"
        'cmd.CommandText = myInsertQuery
        'cmd.Parameters.Add("@rc_imp_cop", OleDbType.Double).Value = (Convert.ToDouble(dato.GetValue(8)) / 100)
        'cmd.Parameters.Add("@rc_imp_rcv", OleDbType.Double).Value = (Convert.ToDouble(dato.GetValue(9)) / 100)
        'con.Open()
        'cmd.ExecuteNonQuery()
        'con.Close()
    End Sub
End Class
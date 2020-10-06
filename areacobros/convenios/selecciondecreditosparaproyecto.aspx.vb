Imports System.Data.OleDb

Public Class selecciondecreditosparaproyecto
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LBECS_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBECS.Click
        For i As Int32 = 0 To (GridViewCOP.Rows.Count - 1)
            If CType(GridViewCOP.Rows(i).Cells(1).FindControl("CBEliminar"), CheckBox).Checked Then
                eliminarCredito(Session.Item("SIRECAid").ToString, GridViewCOP.Rows(i).Cells(2).Text, GridViewCOP.Rows(i).Cells(3).Text)
            End If
        Next
        For i As Int32 = 0 To (GridViewRCV.Rows.Count - 1)
            If CType(GridViewRCV.Rows(i).Cells(1).FindControl("CBEliminar0"), CheckBox).Checked Then
                eliminarCredito(Session.Item("SIRECAid").ToString, GridViewRCV.Rows(i).Cells(2).Text, GridViewRCV.Rows(i).Cells(3).Text)
            End If
        Next
        GridViewCOP.DataBind()
        GridViewRCV.DataBind()
    End Sub

    Private Sub eliminarCredito(ByVal vid As String, ByVal vcredito As String, ByVal vperiodo As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " DELETE FROM [sirecacobros].[dbo].[adeudocoprcvconvenio" + vid + "] "
        textConmand += " where [CREDITO]='" + vcredito + "' "
        textConmand += " and [PERIODO]='" + vperiodo + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

    Protected Sub GridViewCOP_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCOP.PreRender
        CType(sender, GridView).Caption = "<strong>" + CType(sender, GridView).Rows.Count.ToString("N0") + " CREDITO(S) C.O.P.</strong>"
    End Sub

    Protected Sub GridViewRCV_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRCV.PreRender
        CType(sender, GridView).Caption = "<strong>" + CType(sender, GridView).Rows.Count.ToString("N0") + " CREDITO(S) R.C.V.</strong>"
    End Sub
End Class
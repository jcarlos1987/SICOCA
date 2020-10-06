Imports System.Data.OleDb

Public Class detallescredfoliados
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session.Item("SIRECAsubdel") Is Nothing Then
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                HiddenFieldSubdel.Value = "%"
            Else
                HiddenFieldSubdel.Value = Session.Item("SIRECAsubdel").ToString
            End If
        End If
    End Sub

    Protected Sub LBguardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("-")
        'V_SUBDEL	V_FOLIO	V_CREDITO	V_ID
        Dim vsubdel As String = valores.GetValue(1)
        Dim vfolio As String = valores.GetValue(2)
        Dim vcredito As String = valores.GetValue(3)
        Dim vid As String = valores.GetValue(4)
        eliminarCreditoDelFolio(vsubdel, vfolio, vcredito, vid)
        GridViewFoliados.DataBind()
    End Sub
    Private Sub eliminarCreditoDelFolio(ByVal vsubdel As String, ByVal vfolio As String, ByVal vcredito As String, ByVal vid As String)
        Dim vtipoeco As String = IIf(Request.QueryString("tipo_eco").ToString.Contains("SIVEPA"), "sivepas", "eco")
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " DELETE FROM [sirecaemisiones].[dbo].[" + vtipoeco + "] "
        textConmand += " where [V_SUBDEL]='" + vsubdel + "' "
        textConmand += " and [V_CREDITO]='" + vcredito + "' "
        textConmand += " and [V_ID]='" + vid + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

End Class
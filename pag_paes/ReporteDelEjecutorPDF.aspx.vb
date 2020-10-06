Imports System.Data.OleDb

Public Class ReporteDelEjecutorPDF
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load        
        LEjecutor.Text = Session.Item("SIRECAnombre").ToString.ToUpper
        LCredencial.Text = "CREDENCIAL " & Session.Item("SIRECAcredencial").ToString.ToUpper
    End Sub
    Protected Sub getClave()
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textCon As String = " SELECT upper((select usf.nombre from fiscamovil.dbo.usuarios as usf where usf.[id]=uss.[id])) as nombre,uss.[credencial] as credencial "
        textCon += " FROM [sireca].[dbo].[usuarios] as uss "
        textCon += " where uss.[id]='" & Request.QueryString("idEjecutor").ToString & "' "
        catCMD.CommandText = textCon
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            LEjecutor.Text = myReader.GetValue(0).ToString.ToUpper
            LCredencial.Text = "CREDENCIAL " & myReader.GetValue(1).ToString.ToUpper
        Loop
        myReader.Close()
        nwindConn.Close()
    End Sub
End Class
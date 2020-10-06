Imports System.Data.OleDb

Public Class ubicacionPatronal
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                cargarCoordenasDelPatron()
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If        
    End Sub
    Protected Sub cargarCoordenasDelPatron()
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        catCMD.CommandText = "SELECT [latitud],[longitud],[regpat],[rfc],[dom],[loc],[act] FROM [sireca].[dbo].[patrones] WHERE regpat like '%" & Request.QueryString("regpat").ToString & "%'"
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim num As Integer = 0
        Dim infox As String = ""
        Do While myReader.Read()
            num = num + 1
            HFLongitud.Value = myReader.GetValue(0)
            HFLatitud.Value = myReader.GetValue(1)
            infox += myReader.GetValue(2) & "#_"
            infox += myReader.GetValue(3) & "#_"
            infox += myReader.GetValue(4) & "#_"
            infox += myReader.GetValue(5) & "#_"
            infox += myReader.GetValue(6)
        Loop
        HFInfo.Value = infox
        myReader.Close()
        nwindConn.Close()
    End Sub
End Class
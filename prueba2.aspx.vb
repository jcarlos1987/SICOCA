Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Xml
Imports System.IO

Public Class prueba2
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim cadenaconexionsql As String = ConfigurationManager.ConnectionStrings("ConnectionStringMasterSql").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        crearXML()
    End Sub
    Private Function crearXML() As String
        'Dim getxmlxx As String = ""
        Dim nwindConn As SqlConnection = New SqlConnection(cadenaconexionsql)
        Dim catCMD As SqlCommand = nwindConn.CreateCommand()
        catCMD.CommandText = "SELECT [CVE DILIG#] as idcve,[ACTIVIDAD] as actividad FROM [sireca].[dbo].[catalogo] as marker FOR XML AUTO, ROOT('markers')"
        nwindConn.Open()
        Dim xmldata As System.Xml.XmlReader = catCMD.ExecuteXmlReader()

        Dim docxml As XmlDocument = New XmlDocument
        docxml.Load(xmldata)
        docxml.PrependChild(docxml.CreateNode(XmlNodeType.XmlDeclaration, "", ""))

        docxml.Save(Server.MapPath("~") & "\mapa\xmls\moredata.xml")
        ' Do While getxml.Read()
        'getxmlxx += getxml.get
        '  Loop
        'getxml.Close()
        nwindConn.Close()
        'MsgBox(getxmlxx)
        Return "getxml"
    End Function
End Class
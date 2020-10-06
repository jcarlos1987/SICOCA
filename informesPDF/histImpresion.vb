Imports System.Data.OleDb

Public Class histImpresion
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Public Sub setImpresion(ByVal vsubdel As String, ByVal vid_user As String, ByVal vregpat As String, ByVal vrazonsocial As String, ByVal vcredito As String, ByVal vperiodo As String, ByVal vtipoimpresion As String, ByVal vfechaasignacion As String, ByVal vinspector As String, ByVal vip As String, ByVal vurl As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecaemisiones].[dbo].[hist_impresion] "
        textConmand += " ( "
        textConmand += " [IM_SUBDEL] " ' ADD
        textConmand += " ,[IM_USER_PRINT] " ' mod
        textConmand += " ,[IM_FECHA_IMPRESION] "
        textConmand += " ,[IM_REGPAT] " ' ADD
        textConmand += " ,[IM_RAZON_SOCIAL] " ' ADD
        textConmand += " ,[IM_CREDITO] " ' ADD
        textConmand += " ,[IM_PERIODO] " ' ADD
        textConmand += " ,[IM_TIPO_IMPRESION] " ' ADD
        textConmand += " ,[IM_FECH_ASIGNACION] " ' ADD
        textConmand += " ,[IM_INSPECTOR] " ' ADD
        textConmand += " ,[IM_IP] "
        textConmand += " ,[IM_URL] "
        textConmand += " ) "
        textConmand += " VALUES( "
        textConmand += " '" + vsubdel + "' "
        textConmand += " " + vid_user + " "
        textConmand += " ,getdate() "
        textConmand += " ,'" + vregpat + "' "
        textConmand += " ,'" + vrazonsocial + "' "
        textConmand += " ,'" + vcredito + "' "
        textConmand += " ,'" + vperiodo + "' "
        textConmand += " ,'" + vtipoimpresion + "' "
        textConmand += " ,convert(datetime,'" + vfechaasignacion + "',103) "
        textConmand += " ,'" + vinspector + "' "
        textConmand += " ,'" + vip + "' "
        textConmand += " ,'" + vurl + "' "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub
End Class

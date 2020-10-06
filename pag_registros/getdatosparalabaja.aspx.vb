Imports System.IO
Imports System.Data.OleDb

Public Class getdatosparalabaja
    Inherits System.Web.UI.Page
    Dim salarioMinimo As Double = Convert.ToDouble(ConfigurationSettings.AppSettings("salarioMinimo").ToString)
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Clear()
        Response.ContentType = "text/plain"
        Response.ContentEncoding = Encoding.UTF8
        If Not Request.QueryString("regpat") Is Nothing Then
            If Not Request.QueryString("subdel") Is Nothing Then
                Response.Write(actualizarAdeudoCOP() & ";" & actualizarAdeudoRCV())
            Else
                Response.Write("0")
            End If
        Else
            Response.Write("0")
        End If
        Response.End()
    End Sub
    Private Function actualizarAdeudoCOP() As String
        Dim importe As String = ""
        Dim creditos As String = ""
        Dim rango As String = ""
        Dim nomtabla As String = ""
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " DECLARE @RALE as varchar(50) " _
& " SET @RALE = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='" & Request.QueryString("subdel").ToString & "' and tipo='COP' order by fecha desc) " _
& " exec('select count(*) as total,sum(importe) as IMPORTE,'''+@RALE+''' as nomtabla from [rale].[dbo].['+@RALE+'] where replace(regpatr,''-'','''')=''" & Request.QueryString("regpat").ToString & "''') "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                creditos = myReader2.GetValue(0).ToString
                importe = myReader2.GetValue(1).ToString
                nomtabla = myReader2.GetValue(2).ToString
            Loop            
            myReader2.Close()
            nwindConn2.Close()
            If Not IsNumeric(creditos) Then
                creditos = "0"
            End If
            If Not IsNumeric(importe) Then
                importe = "0"
            End If
            If Convert.ToDouble(importe) >= (25 * salarioMinimo * 365) Then
                rango = "V"
            ElseIf Convert.ToDouble(importe) > (4 * salarioMinimo * 365) And Convert.ToDouble(importe) <= (25 * salarioMinimo * 365) Then
                rango = "IV"
            ElseIf Convert.ToDouble(importe) > (2 * salarioMinimo * 365) And Convert.ToDouble(importe) <= (4 * salarioMinimo * 365) Then
                rango = "III"
            ElseIf Convert.ToDouble(importe) > (salarioMinimo * 365) And Convert.ToDouble(importe) <= (2 * salarioMinimo * 365) Then
                rango = "II"
            ElseIf Convert.ToDouble(importe) <= (salarioMinimo * 365) Then
                rango = "I"
            End If
        Catch ex As Exception
        End Try
        Return (rango & ";" & creditos & ";" & importe & ";" & nomtabla)
    End Function
    Private Function actualizarAdeudoRCV() As String
        Dim importe As String = ""
        Dim creditos As String = ""
        Dim nomtabla As String = ""
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " DECLARE @RALE as varchar(50) " _
& " SET @RALE = (SELECT top 1 [name] FROM [rale].[dbo].[tablas] where subdel='" & Request.QueryString("subdel").ToString & "' and tipo='RCV' order by fecha desc) " _
& " exec('select count(*) as total,sum(importe) as IMPORTE,'''+@RALE+''' as nomtabla from [rale].[dbo].['+@RALE+'] where replace(regpatr,''-'','''')=''" & Request.QueryString("regpat").ToString & "''') "
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                creditos = myReader2.GetValue(0).ToString
                importe = myReader2.GetValue(1).ToString
                nomtabla = myReader2.GetValue(2).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
            If Not IsNumeric(creditos) Then
                creditos = "0"
            End If
            If Not IsNumeric(importe) Then
                importe = "0"
            End If            
        Catch ex As Exception
        End Try
        Return (creditos & ";" & importe & ";" & nomtabla)
    End Function
End Class
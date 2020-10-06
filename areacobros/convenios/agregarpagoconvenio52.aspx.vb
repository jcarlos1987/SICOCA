Imports System.Data.OleDb

Public Class agregarpagoconvenio52
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        TBFecPago.Text = Now.ToShortDateString
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
        'If Not Session.Item("SIRECARegPagConv").ToString.Equals("1") Then
        'Response.Redirect("~/accesoDenegado.aspx")
        'End If
    End Sub

    Protected Sub BPago_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BPago.Click
        LMsgError.Text = ""
        Dim registrarPago As Boolean = False
        If IsNumeric(TBPago.Text) Then
            If Not CDbl(TBPago.Text) = 0 Then
                If Not TBFolioPago.Text.Replace(" ", "").Length > 3 Then
                    registrarPago = False
                    LMsgError.Text = "Ingrese un FOLIO DE PAGO para llevar acabo el REGISTRO"
                Else
                    registrarPago = True
                End If
            Else
                registrarPago = True
            End If
        End If
        If registrarPago Then
            Dim idconvenio As String = Request.QueryString("id").ToString
            Dim fechaPago As String = If(IsDate(TBFecPago.Text), Convert.ToDateTime(TBFecPago.Text), DBNull.Value)
            Dim pago As String = If(IsNumeric(TBPago.Text), Convert.ToDouble(TBPago.Text), 0)
            Dim subdel As String = Request.QueryString("subdel").ToString
            If IsNumeric(TBPago.Text) Then
                If TBFecPago.Text.Replace(" ", "").Equals("0") Then
                Else
                    eliminarPagoDeCeroPesos(idconvenio, fechaPago, subdel)
                End If
            End If
            If agregarpagoconvenio52(idconvenio, fechaPago, pago, subdel) Then
                Dim con2 As New OleDbConnection(cadenaconexion)
                Dim cmd2 As New OleDbCommand()
                cmd2.Connection = con2
                Dim myInsertQuery2 As String = " INSERT INTO [sirecacobros].[dbo].[convenio52] "
                myInsertQuery2 += " ([SUBDEL],[IP_HOST],[ID_USUARIO],[FECH_SYSTEM],[ID_CONVENIO05],[FECH_PAGO],[IMPORTE],[FOLIO_PAGO]) "
                myInsertQuery2 += " VALUES (?,?,?,?,?,?,?,?) "
                cmd2.CommandText = myInsertQuery2
                cmd2.Parameters.Add("@SUBDEL", OleDbType.VarChar).Value = Request.QueryString("subdel").ToString
                cmd2.Parameters.Add("@IP_HOST", OleDbType.VarChar).Value = Request.UserHostAddress()
                cmd2.Parameters.Add("@ID_USUARIO", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
                cmd2.Parameters.Add("@FECH_SYSTEM", OleDbType.Date).Value = Now
                cmd2.Parameters.Add("@ID_CONVENIO05", OleDbType.VarChar).Value = idconvenio
                cmd2.Parameters.Add("@FECH_PAGO", OleDbType.Date).Value = If(IsDate(TBFecPago.Text), Convert.ToDateTime(fechaPago), Convert.ToDateTime(Now.ToShortDateString))
                cmd2.Parameters.Add("@IMPORTE", OleDbType.Double).Value = If(IsNumeric(TBPago.Text), Convert.ToDouble(TBPago.Text), 0)
                cmd2.Parameters.Add("@FOLIO_PAGO", OleDbType.VarChar).Value = TBFolioPago.Text

                con2.Open()
                cmd2.ExecuteNonQuery()
                con2.Close()
            End If
            GridViewPagos.DataBind()
        End If
    End Sub
    Private Function agregarpagoconvenio52(ByVal idconvenio As String, ByVal fechaPago As String, ByVal pago As String, ByVal subdel As String) As Boolean
        Dim agregar As Boolean = True
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT [ID] FROM [sirecacobros].[dbo].[convenio52] "
            consulta += " where [ID_CONVENIO05]='" & idconvenio & "' and [SUBDEL]='" & subdel & "' and [FECH_PAGO]=convert(datetime,'" & fechaPago & "',103) and [IMPORTE]=convert(float,'" & pago & "') "
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                agregar = False
                Exit Do
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return agregar
    End Function

    Private Sub eliminarPagoDeCeroPesos(ByVal idconvenio As String, ByVal fechaPago As String, ByVal subdel As String)
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " DELETE FROM [sirecacobros].[dbo].[convenio52] "
            consulta += " where [ID_CONVENIO05]='" & idconvenio & "' and [SUBDEL]='" & subdel & "' and [FECH_PAGO]=convert(datetime,'" & fechaPago & "',103) and [IMPORTE]=0 "
            catCMD.CommandText = consulta
            nwindConn.Open()
            catCMD.ExecuteReader()
            nwindConn.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewPagos_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewPagos.PreRender
        GridViewPagos.Caption = GridViewPagos.Rows.Count & " Pagos."
    End Sub
End Class
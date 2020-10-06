Imports System.Data.OleDb

Public Class reporte2
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

        'If Request.QueryString("vinspector").ToString.Equals("%") Then
        LInspector.Visible = False
        Label4.Visible = False
        'End If
        Lfecha.Text = Request.QueryString("vfechaasignacion").ToString
        LSubdel.Text = Request.QueryString("vsubdel").ToString
        LInc.Text = Request.QueryString("vinc").ToString
    End Sub

    Protected Sub BConfirmacion_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BConfirmacion.Click
        If DDLTurnarA.SelectedItem.Text.ToString.Length < 3 And TBObservacion.Text.Length < 3 Then
            LMError.Text = "Ingrese una obseracion del Contenido A TURNAR y a quien se le TURNARA<br/>PARA GENERAR LA CEDULA DE CAPTURA."
        Else
            LMError.Text = ""
            'Server.Transfer("~/informesPDF/emision/reportep1.aspx")
            Dim vsubdel As String = Request.QueryString("vsubdel").ToString
            Dim vinc As String = Request.QueryString("vinc").ToString
            Dim veco As String = Request.QueryString("eco").ToString
            Dim vfechaasignacion As String = Request.QueryString("vfechaasignacion").ToString
            Dim vfolio As String = Request.QueryString("folio").ToString
            Dim vori_mul As String = Request.QueryString("ori_mul").ToString
            Dim vfolion As String = folioSiguente(vsubdel).ToString("D5")
            foliando(vsubdel, vinc, veco, vfechaasignacion, vori_mul, vfolion)
            Response.Redirect("~/informesPDF/emision/verificados2.aspx")
        End If
    End Sub
    Private Function folioSiguente(ByVal vsubdel As String) As Int32
        Dim vfolio = -11
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " select ((SELECT  "
            myInsertQuery22 += " max(convert(int,isnull([V_FOLIO_P2],0))) "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " where [V_SUBDEL]='" & vsubdel & "') "
            myInsertQuery22 += " + "
            myInsertQuery22 += " (SELECT max(convert(int,isnull([V_FOLIO_P1],0))) "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " where [V_SUBDEL]='" & vsubdel & "') "
            myInsertQuery22 += " )+1 "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            Dim myReader As OleDbDataReader = cmd22.ExecuteReader()
            Do While myReader.Read()
                vfolio = myReader.GetValue(0).ToString
            Loop
            myReader.Close()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
        Return vfolio
    End Function
    Private Sub foliando(ByVal vsubdel As String, ByVal vinc As String, ByVal veco As String, ByVal vfechaasignacion As String, ByVal vori_mul As String, ByVal vfolio As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " UPDATE [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " SET [V_FOLIO_P2]= '" & vfolio & "'"
            myInsertQuery22 += " ,[V_FOLIO_P2_TURNADO_A]='" & DDLTurnarA.SelectedValue & "' "
            myInsertQuery22 += " ,[V_FECHA_P2_TURNADO]=getdate() "
            myInsertQuery22 += " ,[V_FOLIO_P2_OBSERVACION]='" & TBObservacion.Text & "' "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " where [V_FOLIO_P2] is null "
            myInsertQuery22 += " and V_INC_CAPTURA='" & vinc & "' "
            myInsertQuery22 += " and V_TIPO_ECO='" & veco & "' "
            myInsertQuery22 += " and V_ORI_MUL like '" & vori_mul & "' "
            myInsertQuery22 += " and [V_SUBDEL]='" & vsubdel & "' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
End Class
Imports System.Data.OleDb

Public Class actualizar05
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Request.QueryString("id").ToString.Substring(0, 3).Equals("COP") Then
                LPagoInicial.Text = "PAGO INICIAL 20% "
            Else
                LPagoInicial.Text = "PAGO INICIAL 2% "
            End If
            cargarDatosDeConvenios05(Request.QueryString("id").ToString, Request.QueryString("subdel").ToString)
            'Response.Redirect("~/accesoDenegado.aspx")
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub cargarDatosDeConvenios05(ByVal idconvenio As String, ByVal subdel As String)
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringFiscamovil").ConnectionString)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT [SUBDEL],[TIPO],[TIPO_PROCE],[SOLICITUD],[IFE],[ACTA_CONSTITUTIVA],[GARANTIA],[EVALUO],[PAGO_INICIAL_20_2],[PAGO_MULTAS_10] "
            consulta += " FROM [sirecacobros].[dbo].[convenio05] "
            consulta += " WHERE [ID_CONVENIO05]='" + idconvenio + "' and [SUBDEL]='" + subdel + "' "
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                'cabecera = myReader.GetName(i)
                DDLTipoProceso.SelectedValue = myReader.GetValue(2).ToString
                DDL1.SelectedValue = myReader.GetValue(3).ToString
                DDL2.SelectedValue = myReader.GetValue(4).ToString
                DDL3.SelectedValue = myReader.GetValue(5).ToString
                DDL4.SelectedValue = myReader.GetValue(6).ToString
                DDL5.SelectedValue = myReader.GetValue(7).ToString
                TBPagoInicial.Text = myReader.GetValue(8).ToString
                TBPagoMulta.Text = myReader.GetValue(9).ToString
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBGuardar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBGuardar.Click
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22
        Dim myInsertQuery22 As String = " UPDATE [sirecacobros].[dbo].[convenio05] "
        myInsertQuery22 += " SET [SOLICITUD] = '" + DDL1.SelectedValue + "'"
        myInsertQuery22 += " ,[FEC_SOLICITUD] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[IFE] = '" + DDL2.SelectedValue + "'"
        myInsertQuery22 += " ,[FEC_IFE] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[ACTA_CONSTITUTIVA] = '" + DDL3.SelectedValue + "'"
        myInsertQuery22 += " ,[FEC_ACT_CONST] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[GARANTIA] = '" + DDL4.SelectedValue + "'"
        myInsertQuery22 += " ,[FEC_GARANTIA] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[EVALUO] = '" + DDL5.SelectedValue + "'"
        myInsertQuery22 += " ,[FEC_EVALUO] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[PAGO_INICIAL_20_2] = convert(float," + TBPagoInicial.Text + ")"
        myInsertQuery22 += " ,[FEC_PAG_INI] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[PAGO_MULTAS_10] = convert(float," + TBPagoMulta.Text + ")"
        myInsertQuery22 += " ,[FEC_PAG_MUL] = convert(datetime,'" + Now.ToShortDateString + "',103)"
        myInsertQuery22 += " ,[TIPO_PROCE] = '" + DDLTipoProceso.SelectedValue + "'"
        myInsertQuery22 += " ,[ADEUDO_TOTAL] = convert(float," + TBAdeuTotal.Text + ")"
        myInsertQuery22 += " WHERE [ID_CONVENIO05]='" + Request.QueryString("id").ToString + "' and SUBDEL='" + Request.QueryString("subdel").ToString + "'"

        cmd22.CommandText = myInsertQuery22
        con22.Open()
        If cmd22.ExecuteNonQuery() > 0 Then
            LMsg.Text = "Actualizado"
        Else
            LMsg.Text = "Problemas al ACTUALIZAR"
        End If
        con22.Close()
    End Sub

End Class
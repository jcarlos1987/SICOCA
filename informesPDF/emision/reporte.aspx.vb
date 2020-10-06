Imports System.Data.OleDb

Public Class reporte1
    Inherits System.Web.UI.Page
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session.Item("SIRECAsubdel") Is Nothing Then
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                HiddenFieldSubdel.Value = "%"
            Else
                HiddenFieldSubdel.Value = Session.Item("SIRECAsubdel").ToString
            End If
        End If
        LSubdel.Text = Request.QueryString("vsubdel").ToString
        LInc.Text = Request.QueryString("vinc").ToString
    End Sub

    Protected Sub BConfirmacion_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BConfirmacion.Click
        If DDLTurnarA.Items.Count > 0 Then
            If DDLTurnarA.SelectedItem.Text.ToString.Length < 3 And TBObservacion.Text.Length < 3 Then
                LMError.Text = "Ingrese una obseracion del Contenido A TURNAR y a quien se le TURNARA<br/>PARA GENERAR LA CEDULA DE CAPTURA."
            Else
                LMError.Text = ""
                'Server.Transfer("~/informesPDF/emision/reportep1.aspx")
                Dim vsubdel As String = Request.QueryString("vsubdel").ToString
                Dim vinc As String = Request.QueryString("vinc").ToString
                Dim veco As String = Request.QueryString("eco").ToString
                Dim vfechacaptura As String = Request.QueryString("vfechacaptura").ToString
                Dim vfolio As String = Request.QueryString("folio").ToString
                Dim vori_mul As String = Request.QueryString("ori_mul").ToString
                Dim vfolion As String = ""
                If veco.Contains("SIVEPA") Then
                    vfolion = folioSiguenteSivepa(vsubdel, DDLAnio.SelectedValue).ToString("D5")
                    foliandoSivepa(vsubdel, vinc, veco, vori_mul, vfolion, vfechacaptura)
                Else
                    vfolion = folioSiguente(vsubdel, DDLAnio.SelectedValue).ToString("D5")
                    foliando(vsubdel, vinc, veco, vori_mul, vfolion, vfechacaptura)
                End If
                Response.Redirect("~/informesPDF/emision/verificados.aspx?vincx=" & Request.QueryString("vinc").ToString)
            End If
        Else
            LMError.Text = "IMPOSSIBLE TURNAR."
        End If
    End Sub
#Region "Foliando ECO"
    Private Function folioSiguente(ByVal vsubdel As String, ByVal vanio As String) As Int32
        Dim vfolio As Int32 = -11
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " select (SELECT "
            myInsertQuery22 += " max(convert(int,isnull([V_FOLIO_P1],0))) "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " where [V_SUBDEL]='" & vsubdel & "' and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)='" & Request.QueryString("vinc").ToString & "' "
            myInsertQuery22 += " and year([V_FECHA_CONFIRMACION_INC_P1])=" + vanio + " "
            myInsertQuery22 += " )+1 "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            Dim myReader As OleDbDataReader = cmd22.ExecuteReader()
            Do While myReader.Read()
                vfolio = CInt(myReader.GetValue(0))
            Loop
            myReader.Close()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
        If IsNumeric(TBFolio.Text) Then
            If CInt(TBFolio.Text) > vfolio Then
                vfolio = CInt(TBFolio.Text)
            End If
        End If
        Return vfolio
    End Function
    Private Sub foliando(ByVal vsubdel As String, ByVal vinc As String, ByVal veco As String, ByVal vori_mul As String, ByVal vfolio As String, ByVal vfechacaptura As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " UPDATE [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " SET [V_FOLIO_P1]= '" & vfolio & "'"
            myInsertQuery22 += " ,[V_FOLIO_P1_TURNADO_A]='" & DDLTurnarA.SelectedValue & "' "
            myInsertQuery22 += " ,[V_FECHA_P1_TURNADO]=getdate() "
            myInsertQuery22 += " ,[V_FOLIO_P1_OBSERVACION]='" & TBObservacion.Text & "' "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " where [V_FOLIO_P1] is null "
            myInsertQuery22 += " and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)='" & vinc & "' "
            If vinc.Equals("2") Then
                myInsertQuery22 += " and convert(varchar(10),[V_FECHA_CAPTURA],103) = '" & vfechacaptura & "' "
            End If
            If vinc.Equals("9") Then
                veco = "%"
                vori_mul = "%"
            End If
            myInsertQuery22 += " and V_TIPO_ECO like '" & veco & "' "
            myInsertQuery22 += " and V_ORI_MUL like '" & vori_mul & "' "
            myInsertQuery22 += " and [V_SUBDEL] = '" & vsubdel & "' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
#End Region
#Region "Foliando SIVEPA"
    Private Function folioSiguenteSivepa(ByVal vsubdel As String, ByVal vanio As String) As Int32
        Dim vfolio As Int32 = -11
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " select (SELECT "
            myInsertQuery22 += " max(convert(int,isnull([V_FOLIO_P1],0))) "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[sivepas] "
            myInsertQuery22 += " where [V_SUBDEL]='" & vsubdel & "' and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)='" & Request.QueryString("vinc").ToString & "' "
            myInsertQuery22 += " and year([V_FECHA_CONFIRMACION_INC_P1])=" + vanio + " "
            myInsertQuery22 += " )+1 "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            Dim myReader As OleDbDataReader = cmd22.ExecuteReader()
            Do While myReader.Read()
                vfolio = CInt(myReader.GetValue(0))
            Loop
            myReader.Close()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
        If IsNumeric(TBFolio.Text) Then
            If CInt(TBFolio.Text) > vfolio Then
                vfolio = CInt(TBFolio.Text)
            End If
        End If
        Return vfolio
    End Function
    Private Sub foliandoSivepa(ByVal vsubdel As String, ByVal vinc As String, ByVal veco As String, ByVal vori_mul As String, ByVal vfolio As String, ByVal vfechacaptura As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " UPDATE [sirecaemisiones].[dbo].[sivepas] "
            myInsertQuery22 += " SET [V_FOLIO_P1]= '" & vfolio & "'"
            myInsertQuery22 += " ,[V_FOLIO_P1_TURNADO_A]='" & DDLTurnarA.SelectedValue & "' "
            myInsertQuery22 += " ,[V_FECHA_P1_TURNADO]=getdate() "
            myInsertQuery22 += " ,[V_FOLIO_P1_OBSERVACION]='" & TBObservacion.Text & "' "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[sivepas] "
            myInsertQuery22 += " where [V_FOLIO_P1] is null "
            myInsertQuery22 += " and (case when V_INC_CAPTURA in ('RE','POR PROCESAR','PAGADO','A') then 'PAGADO' else V_INC_CAPTURA end)='" & vinc & "' "
            If vinc.Equals("2") Then
                myInsertQuery22 += " and convert(varchar(10),[V_FECHA_CAPTURA],103) = '" & vfechacaptura & "' "
            End If
            If vinc.Equals("9") Then
                veco = "%"
                vori_mul = "%"
            End If
            myInsertQuery22 += " and V_TIPO_ECO like '" & veco & "' "
            myInsertQuery22 += " and V_ORI_MUL like '" & vori_mul & "' "
            myInsertQuery22 += " and [V_SUBDEL] = '" & vsubdel & "' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
#End Region
    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, 0, Now)).ToString, Year(DateAdd(DateInterval.Month, 0, Now)).ToString))
    End Sub
    Protected Sub TBObservacion_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBObservacion.Init
        If Not Request.QueryString("vinc") Is Nothing Then
            If Not Request.QueryString("eco") Is Nothing Then
                If Not Request.QueryString("ori_mul") Is Nothing Then
                    If Request.QueryString("vinc").ToString.Equals("2") Then
                        If Request.QueryString("eco").ToString.Equals("COP") Then
                            CType(sender, TextBox).Text = "CEDULAS DE LIQUIDACIÓN POR LA OMISIÓN TOTAL EN LA DETERMINACIÓN Y PAGO DE CUOTAS CON SUS MULTAS DE LOS PERIODOS ______________ NOTIFICADOS EL "
                        ElseIf Request.QueryString("eco").ToString.Equals("RCV") And Request.QueryString("ori_mul").ToString.Equals("MUL") Then
                            CType(sender, TextBox).Text = "MULTAS DE CEDULAS DE LIQUIDACIÓN POR LA OMISIÓN TOTAL EN LA DETERMINACIÓN Y PAGO DE CUOTAS RCV BIMESTRE _________________ NOTIFICADOS EL "
                        ElseIf Request.QueryString("eco").ToString.Equals("RCV") And Request.QueryString("ori_mul").ToString.Equals("ORI") Then
                            CType(sender, TextBox).Text = "CEDULA DE LIQUIDACIÓN POR LA OMISIÓN TOTAL EN LA DETERMINACIÓN Y PAGO DE CUOTAS RCV BIMESTRE ____________, NOTIFICADOS EL "
                        End If
                    End If
                End If
            End If
        End If
    End Sub
End Class
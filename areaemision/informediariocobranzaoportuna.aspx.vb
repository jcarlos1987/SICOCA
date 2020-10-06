Public Class informediariocobranzaoportuna
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        RInfDiario.DataBind()
    End Sub

    Protected Sub TBFIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFIni.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFFin.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub RInfDiario_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles RInfDiario.ItemDataBound
        'MsgBox(e.Item.DataItem(0).ToString)
        Try
            If e.Item.DataItem(0).ToString.Equals("CITATORIO") Then
                'reseteo de los label
                LPatronT1.Text = (CInt(e.Item.DataItem(1))).ToString("N0")
                LCreditoT1.Text = (CInt(e.Item.DataItem(2))).ToString("N0")
                LImporteT1.Text = (CDbl(e.Item.DataItem(3))).ToString("C")
                LMultaT1.Text = (CDbl(e.Item.DataItem(4))).ToString("C")
                LImMultT1.Text = (CDbl(e.Item.DataItem(3)) + CDbl(e.Item.DataItem(4))).ToString("C")
                'LPatronT2.Text = "0"
                'LCreditoT2.Text = "0"
                'LImporteT2.Text = "$0"
                'LMultaT2.Text = "$0"

                LPatronT3.Text = "0"
                LCreditoT3.Text = "0"
                LMultaT3.Text = "$0"

                LPatronT4.Text = "0"
                LCreditoT4.Text = "0"
                LImporteT4.Text = "$0"
            Else
                'sumatoria de los totales
                LPatronT1.Text = CInt(CInt(LPatronT1.Text.Replace(",", "")) + CInt(e.Item.DataItem(1))).ToString("N0")
                LCreditoT1.Text = CInt(CInt(LCreditoT1.Text.Replace(",", "")) + CInt(e.Item.DataItem(2))).ToString("N0")
                LImporteT1.Text = CDbl(CDbl(LImporteT1.Text.Replace("$", "").Replace(",", "")) + CDbl(e.Item.DataItem(3))).ToString("C")
                LMultaT1.Text = CDbl(CDbl(LMultaT1.Text.Replace("$", "").Replace(",", "")) + CDbl(e.Item.DataItem(4))).ToString("C")
                LImMultT1.Text = CDbl(CDbl(LMultaT1.Text.Replace("$", "").Replace(",", "")) + CDbl(LImporteT1.Text.Replace("$", "").Replace(",", ""))).ToString("C")
                'PATRON
                If e.Item.DataItem(0).ToString.Equals("NOTIFICADO") Then
                    'LPatronT2.Text = CInt(CInt(LPatronT2.Text) + CInt(e.Item.DataItem(1))).ToString("N0")
                End If
                If e.Item.DataItem(0).ToString.Equals("PAGADO") Or e.Item.DataItem(0).ToString.Equals("DEPURADO PROCESAR/SIPARE") Then
                    LPatronT3.Text = CInt(CInt(LPatronT3.Text.Replace(",", "")) + CInt(e.Item.DataItem(1))).ToString("N0")
                End If
                If e.Item.DataItem(0).ToString.Equals("PAGADO") Or e.Item.DataItem(0).ToString.Equals("DEPURADO PROCESAR/SIPARE") Then
                    LPatronT4.Text = CInt(CInt(LPatronT4.Text.Replace(",", "")) + CInt(e.Item.DataItem(1))).ToString("N0")
                End If
                'CREDITO
                If e.Item.DataItem(0).ToString.Equals("NOTIFICADO") Then
                    'LCreditoT2.Text = CInt(CInt(LCreditoT2.Text.Replace(",", "")) + CInt(e.Item.DataItem(2))).ToString("N0")
                End If
                If e.Item.DataItem(0).ToString.Equals("PAGADO") Or e.Item.DataItem(0).ToString.Equals("DEPURADO PROCESAR/SIPARE") Then
                    LCreditoT3.Text = CInt(CInt(LCreditoT3.Text.Replace(",", "")) + CInt(e.Item.DataItem(2))).ToString("N0")
                End If
                If e.Item.DataItem(0).ToString.Equals("PAGADO") Or e.Item.DataItem(0).ToString.Equals("DEPURADO PROCESAR/SIPARE") Then
                    LCreditoT4.Text = CInt(CInt(LCreditoT4.Text.Replace(",", "")) + CInt(e.Item.DataItem(2))).ToString("N0")
                End If
                'IMPORTE
                If e.Item.DataItem(0).ToString.Equals("NOTIFICADO") Then
                    'LImporteT2.Text = CDbl(CDbl(LImporteT2.Text.Replace("$", "").Replace(",", "")) + CDbl(e.Item.DataItem(3))).ToString("C")
                End If
                If e.Item.DataItem(0).ToString.Equals("PAGADO") Or e.Item.DataItem(0).ToString.Equals("DEPURADO PROCESAR/SIPARE") Then
                    LImporteT4.Text = CDbl(CDbl(LImporteT4.Text.Replace("$", "").Replace(",", "")) + CDbl(e.Item.DataItem(3))).ToString("C")
                End If
                'MULTA
                If e.Item.DataItem(0).ToString.Equals("NOTIFICADO") Then
                    'LMultaT2.Text = CDbl(CDbl(LMultaT2.Text.Replace("$", "").Replace(",", "")) + CDbl(e.Item.DataItem(4))).ToString("C")
                End If
                If e.Item.DataItem(0).ToString.Equals("PAGADO") Or e.Item.DataItem(0).ToString.Equals("DEPURADO PROCESAR/SIPARE") Then
                    LMultaT3.Text = CDbl(CDbl(LMultaT3.Text.Replace("$", "").Replace(",", "")) + CDbl(e.Item.DataItem(4))).ToString("C")
                End If

            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub RInfDiario_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles RInfDiario.PreRender
        For i As Int32 = 0 To 7
            CType(RInfDiario.Items(i).FindControl("PP1"), Label).Text = ((CDbl(CType(RInfDiario.Items(i).FindControl("Label4"), Label).Text.Replace(",", "")) / CDbl(LPatronT1.Text.Replace(",", ""))) * 100).ToString("N") & "%"
            CType(RInfDiario.Items(i).FindControl("PP2"), Label).Text = ((CDbl(CType(RInfDiario.Items(i).FindControl("LBCredito1"), LinkButton).Text.Replace(",", "")) / CDbl(LCreditoT1.Text.Replace(",", ""))) * 100).ToString("N") & "%"
            CType(RInfDiario.Items(i).FindControl("PP3"), Label).Text = ((CDbl(CType(RInfDiario.Items(i).FindControl("Label6"), Label).Text.Replace(",", "").Replace("$", "")) / CDbl(LImporteT1.Text.Replace(",", "").Replace("$", ""))) * 100).ToString("N") & "%"
            CType(RInfDiario.Items(i).FindControl("PP4"), Label).Text = ((CDbl(CType(RInfDiario.Items(i).FindControl("Label7"), Label).Text.Replace(",", "").Replace("$", "")) / CDbl(LMultaT1.Text.Replace(",", "").Replace("$", ""))) * 100).ToString("N") & "%"
            CType(RInfDiario.Items(i).FindControl("PP5"), Label).Text = ((CDbl(CType(RInfDiario.Items(i).FindControl("Label8"), Label).Text.Replace(",", "").Replace("$", "")) / CDbl(LImMultT1.Text.Replace(",", "").Replace("$", ""))) * 100).ToString("N") & "%"
        Next
    End Sub
End Class
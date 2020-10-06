Public Class _Default16
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ButtonBuscar.Click
        SqlDataSourceLGP.SelectCommand = SqlDataSourceLGP.SelectCommand.Replace("where rc_per = ''", PreparaBusquedaLGP())
        SqlDataSourcePROCESAR.SelectCommand = SqlDataSourcePROCESAR.SelectCommand & PreparaBusquedaPROCESAR()
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub
    Protected Function PreparaBusquedaPROCESAR() As String
        Dim busqueda As String = ""
        If CBPeriodo.Checked Then
            busqueda += " and RCP_PER in ('" & TBPeriodo.Text.Replace(",", "','") & "') "
        End If
        Return busqueda
    End Function
    Protected Function PreparaBusquedaLGP() As String
        Dim busqueda As String = " where [RC_SUB]='" & DDLSubdel.SelectedValue & "' and "
        If CBRegPat.Checked Then
            busqueda += " (substring(rc_patron,2,8)+rc_mod) = '" & TBRegPat.Text & "' and "
        End If
        If CBRazonSocial.Checked Then
            busqueda += " RC_PA_NOM like '%" & TBRazonSocial.Text & "%' and "
        End If
        If CBCredito.Checked Then
            busqueda += " rc_cred = '" & TBCredito.Text & "' and "
        End If
        If CBPeriodo.Checked Then
            busqueda += " rc_per in ('" & TBPeriodo.Text.Replace(",", "','") & "') and "
        End If
        If CBMonto.Checked Then
            If IsNumeric(TBMonto) Then
                busqueda += " rc_imp_tot " & DDLMonto.SelectedValue & TBMonto.Text & " and "
            Else
                TBMonto.Text = 0
                busqueda += " rc_imp_tot " & DDLMonto.SelectedValue & TBMonto.Text & " and "
            End If

        End If
        If CBTD.Checked Then
            busqueda += " rc_doc in ('" & TBTD.Text.Replace(",", "','") & "') "
        End If
        If busqueda.LastIndexOf("and") = (busqueda.Length - 4) Then
            busqueda = busqueda.Substring(0, (busqueda.Length - 4))
        End If
        If busqueda.Length < 26 Then
            busqueda = "where rc_per = ''"
        End If
        Return busqueda
    End Function

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count & " Resultado(s) del Listado General de Pago (LGP) </strong>"
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
        End If
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        GridView2.Caption = "<strong>" & GridView2.Rows.Count & " Resultado(s) de PAGO POR PROCESAR </strong>"
    End Sub
End Class
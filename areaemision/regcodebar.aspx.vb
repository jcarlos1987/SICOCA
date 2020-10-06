Imports System.Data.OleDb

Public Class regcodebar
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub LBReg_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBReg.Click
        actualizarRegistrar()
    End Sub
    Private Sub actualizarRegistrar()
        Try
            PanelMsg.Visible = False
            LMsg.Text = ""
            Dim vcodebarx As String = TBCodeBar.Text.Replace(" ", "")
            Dim continuar As Boolean = False
            If vcodebarx.Contains("!") Then
                Dim vcreditox As String = vcodebarx.Substring(vcodebarx.IndexOf("!") + 1, vcodebarx.Length - (vcodebarx.IndexOf("!") + 1))
                If vcreditox.Length = 9 And IsNumeric(vcreditox) Then
                    If IsNumeric(vcodebarx.Replace("!" + vcreditox, "")) Then
                        continuar = True
                    Else
                        continuar = False
                    End If
                End If
            End If
            If continuar Then
                'If TBCodeBar.Text.Substring(TBCodeBar.Text.IndexOf("!") + 1, TBCodeBar.Text.Length - (TBCodeBar.Text.IndexOf("!") + 1)).Length = 9 Then
                'If DDLAccion.SelectedValue.ToString.Equals("09") Then
                '    If Not TBCodeBarND.Text.Contains("!") Then
                '        PanelMsg.Visible = True
                '        LMsg.Text = "Ingrese el Código de Barra del ACTA CIRCUNSTANCIADA."
                '        Return
                '    Else
                '        If Not (TBCodeBarND.Text.Substring(TBCodeBarND.Text.IndexOf("!") + 1, TBCodeBarND.Text.Length - (TBCodeBarND.Text.IndexOf("!") + 1)).Length = 9) Then
                '            Return
                '        End If
                '    End If
                'End If
                Dim con2 As New OleDbConnection(cadenaconexion)
                Dim cmd2 As New OleDbCommand()
                cmd2.Connection = con2
                Dim myInsertQuery2 As String = ""
                myInsertQuery2 += " if not exists(SELECT HA_ID "
                myInsertQuery2 += " FROM controlQR.dbo.HIST_ACCIONES "
                myInsertQuery2 += " WHERE HA_SUBDEL='" + Session.Item("SIRECAsubdel").ToString + "' "
                myInsertQuery2 += " and HA_ID_CODEBAR='" + TBCodeBar.Text.Trim + "' "
                myInsertQuery2 += " and HA_AC_ID=" + DDLRegCodeBar.SelectedValue.ToString + " "
                myInsertQuery2 += " and HA_ID_USER_REGISTRO='" + Session.Item("SIRECAid").ToString + "' "
                'myInsertQuery2 += " and convert(varchar(10),HA_FECH_REGISTRO,103)=convert(varchar(10),getdate(),103) "
                myInsertQuery2 += " and HA_IP_REGISTRO='" + Request.UserHostAddress.ToString + "' "
                myInsertQuery2 += " and HA_OBSERVACION='" + TBObservacion.Text + "' "
                If DDLAccion.SelectedValue.Equals("09") Then
                    myInsertQuery2 += " and HA_ND_CODE='" + TBCodeBarND.Text.Trim + "') "
                ElseIf DDLAccion.SelectedValue.Equals("02") Then
                    myInsertQuery2 += " and HA_ND_CODE='02') "
                ElseIf DDLAccion.SelectedValue.Equals("27") Then
                    myInsertQuery2 += " and HA_ND_CODE='27') "
                ElseIf DDLAccion.SelectedValue.Equals("REASIGNACION") Then
                    myInsertQuery2 += " and HA_ND_CODE='REASIGNACION') "
                ElseIf DDLAccion.SelectedValue.Equals("DEPURADO") Then
                    myInsertQuery2 += " and HA_ND_CODE='DEPURADO') "
                Else
                    myInsertQuery2 += " and HA_ND_CODE='PAGADO') "
                End If
                myInsertQuery2 += " begin "
                myInsertQuery2 += " insert into [controlQR].[dbo].[HIST_ACCIONES] "
                myInsertQuery2 += " SELECT '" + Session.Item("SIRECAsubdel").ToString + "' "
                myInsertQuery2 += " ,'" + TBCodeBar.Text.Trim + "' "
                myInsertQuery2 += " ," + DDLRegCodeBar.SelectedValue.ToString + " "
                myInsertQuery2 += " ,'" + Session.Item("SIRECAid").ToString + "' "
                myInsertQuery2 += " ,getdate() "
                myInsertQuery2 += " ,'" + Request.UserHostAddress.ToString + "' "
                myInsertQuery2 += " ,'" + TBObservacion.Text + "' "
                If DDLAccion.SelectedValue.Equals("09") Then
                    myInsertQuery2 += " ,'" + TBCodeBarND.Text.Trim + "' "
                ElseIf DDLAccion.SelectedValue.Equals("02") Then
                    myInsertQuery2 += " ,'02' "
                ElseIf DDLAccion.SelectedValue.Equals("27") Then
                    myInsertQuery2 += " ,'27' "
                ElseIf DDLAccion.SelectedValue.Equals("REASIGNACION") Then
                    myInsertQuery2 += " ,'REASIGNACION' "
                ElseIf DDLAccion.SelectedValue.Equals("DEPURADO") Then
                    myInsertQuery2 += " ,'DEPURADO' "
                Else
                    myInsertQuery2 += " ,'PAGADO' "
                End If
                myInsertQuery2 += " end "
                'Response.Write(myInsertQuery2)
                cmd2.CommandText = myInsertQuery2
                con2.Open()
                cmd2.ExecuteNonQuery()
                con2.Close()
                GridViewRegitros.DataBind()
                LUltReg.Text = "Ultimo registro: " + TBCodeBar.Text
                'TBCodeBar.Text =""
                TBCodeBarND.Text = ""
                TBObservacion.Text = ""
                'End If
            Else
                PanelMsg.Visible = True
                LMsg.Text = "Ingrese el Código de Barra del CITATORIO/ACTA DE NOTIFICACIÓN."
                Return
            End If
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Protected Sub LBPrint_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBPrint.PreRender
        If Session.Item("SIRECAreg_tipo").ToString.Equals("SUP1") Then
            If DDLRegCodeBar.SelectedValue.Equals("1") Then
                CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/regcodebar.aspx", "informesPDF/emision/facturaCredImp2.aspx") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
            Else
                CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/regcodebar.aspx", "informesPDF/emision/facturainout.aspx") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
            End If
        Else
            CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/regcodebar.aspx", "informesPDF/emision/facturainout.aspx") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
        End If
    End Sub

    Protected Sub DDLAccion_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAccion.SelectedIndexChanged
        If CType(sender, DropDownList).SelectedValue.Equals("09") Then
            TBCodeBarND.Visible = True
        Else
            TBCodeBarND.Visible = False
        End If
    End Sub

    Protected Sub DDLRegCodeBar_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLRegCodeBar.SelectedIndexChanged
        If Session.Item("SIRECAreg_tipo").ToString.Equals("SUP1") Then
            If DDLRegCodeBar.SelectedValue.Equals("1") Then
                LBPrint.OnClientClick = "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/regcodebar.aspx", "informesPDF/emision/facturaCredImp2.aspx") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');"
            Else
                LBPrint.OnClientClick = "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/regcodebar.aspx", "informesPDF/emision/facturainout.aspx") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');"
            End If
        Else
            LBPrint.OnClientClick = "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("areaemision/regcodebar.aspx", "informesPDF/emision/facturainout.aspx") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');"
        End If
    End Sub

    Protected Sub TBCodeBar_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles TBCodeBar.TextChanged
        actualizarRegistrar()
    End Sub
End Class
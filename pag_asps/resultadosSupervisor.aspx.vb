Public Class resultadosSupervisor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
    Protected Sub MenuReportes_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MenuReportes.MenuItemClick
        Try
            If MenuReportes.SelectedValue.Equals("NOTIFICADORES") Then
                PanelInforme.Visible = False
                GWNotificador.Visible = True
                GWSectores.Visible = False
                Lfecha.Visible = True
                Lfecha2.Visible = True
                DDL1.Visible = True
                DDL2.Visible = True
            ElseIf MenuReportes.SelectedValue.Equals("SECTORES") Then
                PanelInforme.Visible = False
                GWNotificador.Visible = False
                GWSectores.Visible = True
                Lfecha.Visible = False
                Lfecha2.Visible = False
                DDL1.Visible = False
                DDL2.Visible = False
            ElseIf MenuReportes.SelectedValue.Equals("INCIDENCIAS") Then
                PanelInforme.Visible = True
                GWNotificador.Visible = False
                GWSectores.Visible = False
                Lfecha.Visible = False
                Lfecha2.Visible = False
                DDL1.Visible = False
                DDL2.Visible = False
            End If
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub sumatoriaInformeGeneral()
        GVGeneral.DataBind()
        Dim sum As Double = 0
        For i As Int32 = 2 To (GVGeneral.Columns.Count - 1)
            sum = 0
            For j As Int32 = 0 To (GVGeneral.Rows.Count - 1)
                If IsNumeric(GVGeneral.Rows(j).Cells(i).Text.Replace("$", "")) Then
                    sum += Convert.ToDouble(GVGeneral.Rows(j).Cells(i).Text.Replace("$", ""))
                End If
            Next
            If sum = 0 Then
                If (GVGeneral.HeaderRow.Cells(i).Text.Equals(GVGeneral.HeaderRow.Cells(i - 1).Text) And (GVGeneral.HeaderRow.Cells(i - 1).Visible)) Then
                    For j As Int32 = 0 To (GVGeneral.Rows.Count - 1)
                        'GWNotificador.Rows(j).Cells(i).Visible = True
                        'GWNotificador.HeaderRow.Cells(i).Visible = True
                        'GWNotificador.FooterRow.Cells(i).Visible = True
                        GVGeneral.Rows(j).Cells(i - 1).Visible = False

                    Next
                    GVGeneral.FooterRow.Cells(i).Text = GVGeneral.FooterRow.Cells(i - 1).Text
                    GVGeneral.HeaderRow.Cells(i - 1).Visible = False
                    GVGeneral.FooterRow.Cells(i - 1).Visible = False
                Else
                    For j As Int32 = 0 To (GVGeneral.Rows.Count - 1)
                        GVGeneral.Rows(j).Cells(i).Visible = False
                    Next
                    GVGeneral.HeaderRow.Cells(i).Visible = False
                    GVGeneral.FooterRow.Cells(i).Visible = False
                End If
            Else
                GVGeneral.FooterRow.Cells(i).Text = sum
            End If
        Next
    End Sub
    Protected Sub sumatoriaIncidencias()
        GVDetallesResumen.DataBind()
        Dim sum As Double = 0
        For i As Int32 = 2 To (GVDetallesResumen.Columns.Count - 1)
            sum = 0
            For j As Int32 = 0 To (GVDetallesResumen.Rows.Count - 1)
                If IsNumeric(GVDetallesResumen.Rows(j).Cells(i).Text.Replace("$", "")) Then
                    sum += Convert.ToDouble(GVDetallesResumen.Rows(j).Cells(i).Text.Replace("$", ""))
                End If
            Next
            If sum = 0 Then
                If (GVDetallesResumen.HeaderRow.Cells(i).Text.Equals(GVDetallesResumen.HeaderRow.Cells(i - 1).Text) And (GVDetallesResumen.HeaderRow.Cells(i - 1).Visible)) Then
                    For j As Int32 = 0 To (GVDetallesResumen.Rows.Count - 1)
                        'GWNotificador.Rows(j).Cells(i).Visible = True
                        'GWNotificador.HeaderRow.Cells(i).Visible = True
                        'GWNotificador.FooterRow.Cells(i).Visible = True
                        GVDetallesResumen.Rows(j).Cells(i - 1).Visible = False

                    Next
                    GVDetallesResumen.FooterRow.Cells(i).Text = GVDetallesResumen.FooterRow.Cells(i - 1).Text
                    GVDetallesResumen.HeaderRow.Cells(i - 1).Visible = False
                    GVDetallesResumen.FooterRow.Cells(i - 1).Visible = False
                Else
                    For j As Int32 = 0 To (GVDetallesResumen.Rows.Count - 1)
                        GVDetallesResumen.Rows(j).Cells(i).Visible = False
                    Next
                    GVDetallesResumen.HeaderRow.Cells(i).Visible = False
                    GVDetallesResumen.FooterRow.Cells(i).Visible = False
                End If
            Else
                GVDetallesResumen.FooterRow.Cells(i).Text = sum
            End If
        Next
    End Sub
    Protected Sub sumatoriaSectores()
        'GWNotificador.AllowSorting = False
        GWSectores.DataBind()
        Dim sum As Double = 0
        For i As Int32 = 1 To (GWSectores.Columns.Count - 1)
            sum = 0
            For j As Int32 = 0 To (GWSectores.Rows.Count - 1)
                If IsNumeric(GWSectores.Rows(j).Cells(i).Text.Replace("$", "")) Then
                    sum += Convert.ToDouble(GWSectores.Rows(j).Cells(i).Text.Replace("$", ""))
                End If
            Next
            If sum = 0 Then
                If (GWSectores.HeaderRow.Cells(i).Text.Equals(GWSectores.HeaderRow.Cells(i - 1).Text) And (GWSectores.HeaderRow.Cells(i - 1).Visible)) Then
                    For j As Int32 = 0 To (GWSectores.Rows.Count - 1)
                        'GWNotificador.Rows(j).Cells(i).Visible = True
                        'GWNotificador.HeaderRow.Cells(i).Visible = True
                        'GWNotificador.FooterRow.Cells(i).Visible = True
                        GWSectores.Rows(j).Cells(i - 1).Visible = False

                    Next
                    GWSectores.FooterRow.Cells(i).Text = GWSectores.FooterRow.Cells(i - 1).Text
                    GWSectores.HeaderRow.Cells(i - 1).Visible = False
                    GWSectores.FooterRow.Cells(i - 1).Visible = False
                Else
                    For j As Int32 = 0 To (GWSectores.Rows.Count - 1)
                        GWSectores.Rows(j).Cells(i).Visible = False
                    Next
                    GWSectores.HeaderRow.Cells(i).Visible = False
                    GWSectores.FooterRow.Cells(i).Visible = False
                End If
            Else
                GWSectores.FooterRow.Cells(i).Text = sum
            End If
        Next
    End Sub
    Protected Sub sumatoriaNotificadores()
        'GWNotificador.AllowSorting = False
        GWNotificador.DataBind()
        Dim sum As Double = 0
        For i As Int32 = 1 To (GWNotificador.Columns.Count - 1)
            sum = 0
            For j As Int32 = 0 To (GWNotificador.Rows.Count - 1)
                If IsNumeric(GWNotificador.Rows(j).Cells(i).Text.Replace("$", "")) Then
                    sum += Convert.ToDouble(GWNotificador.Rows(j).Cells(i).Text.Replace("$", ""))
                End If
            Next
            If sum = 0 Then
                If (GWNotificador.HeaderRow.Cells(i).Text.Equals(GWNotificador.HeaderRow.Cells(i - 1).Text) And (GWNotificador.HeaderRow.Cells(i - 1).Visible)) Then
                    For j As Int32 = 0 To (GWNotificador.Rows.Count - 1)
                        'GWNotificador.Rows(j).Cells(i).Visible = True
                        'GWNotificador.HeaderRow.Cells(i).Visible = True
                        'GWNotificador.FooterRow.Cells(i).Visible = True
                        GWNotificador.Rows(j).Cells(i - 1).Visible = False

                    Next
                    GWNotificador.FooterRow.Cells(i).Text = GWNotificador.FooterRow.Cells(i - 1).Text
                    GWNotificador.HeaderRow.Cells(i - 1).Visible = False
                    GWNotificador.FooterRow.Cells(i - 1).Visible = False
                Else
                    For j As Int32 = 0 To (GWNotificador.Rows.Count - 1)
                        GWNotificador.Rows(j).Cells(i).Visible = False
                    Next
                    GWNotificador.HeaderRow.Cells(i).Visible = False
                    GWNotificador.FooterRow.Cells(i).Visible = False
                End If
            Else
                GWNotificador.FooterRow.Cells(i).Text = sum
            End If
        Next
        'GWNotificador.AllowSorting = True
    End Sub

    Protected Sub GWNotificador_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GWNotificador.PreRender
        Try
            'If GWNotificador.Rows.Count > 1 Then
            If DDL1.Text.Equals(DDL2.Text) Then
                GWNotificador.Caption = "REPORTE DEL: " & DDL1.Text & ", DEL PERIODO: " & DDLPeriodo.Text & "<BR/>GENERADO EL: " & Now.ToLongDateString & ", " & Now.ToLongTimeString
            Else
                GWNotificador.Caption = "REPORTE DEL: " & DDL1.Text & " AL " & DDL2.Text & ", DEL PERIODO: " & DDLPeriodo.Text & "<BR/>GENERADO EL: " & Now.ToLongDateString & ", " & Now.ToLongTimeString
            End If
            sumatoriaNotificadores()
            Session.Timeout = 700
            Session().Item("SIRECAbuscarfechaI") = DDL1.Text
            Session().Item("SIRECAbuscarfechaF") = DDL2.Text
            Session.Timeout = 700
            ' End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GWSectores_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GWSectores.PreRender
        Try
            'If GWSectores.Rows.Count > 1 Then
            'If DDL1.Text.Equals(DDL1.Text) Then
            GWSectores.Caption = "REPORTE DEL PERIODO: " & DDLPeriodo.Text & "<BR/>GENERADO EL: " & Now.ToLongDateString & ", " & Now.ToLongTimeString
            'Else
            '   GWSectores.Caption = "REPORTE DEL: " & DDL1.Text & " AL " & DDL2.Text & "<BR/>GENERADO EL: " & Now.ToLongDateString & ", " & Now.ToLongTimeString
            'End If
            sumatoriaSectores()
            'End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Try
            Session.Timeout = 700
            Session().Item("SIRECAbuscarfechaI") = DDL1.Text
            Session().Item("SIRECAbuscarfechaF") = DDL2.Text
            Session.Timeout = 700
        Catch ex As Exception
            Session.Timeout = 700
            Session().Item("SIRECAbuscarfechaI") = "2012-05-24"
            Session().Item("SIRECAbuscarfechaF") = "2012-05-24"
            Session.Timeout = 700
        End Try
    End Sub

    Protected Sub GVDetallesResumen_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVDetallesResumen.PreRender
        Try
            'If GWNotificador.Rows.Count > 1 Then
            sumatoriaIncidencias()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Chart1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles Chart1.PreRender
        Try

            Chart1.Titles(0).Text = "Informe Por Incidencia del periodo: " & DDLPeriodo.Text & ", Tipo de ECO: " & DDLTipoEco.Text
            Chart1.Titles(1).Text = Now.ToLongDateString & ", " & Now.ToLongTimeString

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GVGeneral_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVGeneral.PreRender
        Try            
            sumatoriaInformeGeneral()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Chart2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles Chart2.PreRender
        Try
            Chart2.Titles(0).Text = "Informe General del periodo: " & DDLPeriodo.Text & ", Tipo de ECO: " & DDLTipoEco.Text
            Chart2.Titles(1).Text = Now.ToLongDateString & ", " & Now.ToLongTimeString
        Catch ex As Exception

        End Try
    End Sub

End Class
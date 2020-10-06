Public Class cobrosAsignados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                LNom1.Text = Request.QueryString("nombre").ToString
                LNom2.Text = Request.QueryString("nombre").ToString
            Else
                Response.RedirectPermanent("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        GridView1.Caption = "<h3>Factura(s): " & GridView1.Rows.Count & "</h3>"
        'e.Row .DataItem ()
        Try
            If e.Row.RowIndex >= 0 Then
                If Not e.Row.DataItem(32).ToString.Equals("0") Then
                    e.Row.CssClass = "label-warning"
                    e.Row.ToolTip = "Fue declarado como (09)NO LOCALIZADO anteriormente." + vbCr + "Recomendación: LLENAR ACTA CIRCUNSTANCIADA DE HECHOS"
                End If
                GridView1.Caption = "Factura(s) Actual(es): " & GridView1.Rows.Count
                If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
                    HFOrigen.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                    HFDestino.Value = "new google.maps.LatLng(20.996017505661825, -89.64557575559616)"
                ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
                    HFOrigen.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                    HFDestino.Value = "new google.maps.LatLng(20.92825806506775, -89.60922914123535)"
                End If
                If e.Row.RowIndex = 0 Then
                    HiddenField1.Value = "var "
                    HiddenField1.Value += "marker = createMarker('" & e.Row.DataItem(4).ToString & "',new google.maps.LatLng(" & e.Row.DataItem(22).ToString & "," & e.Row.DataItem(23).ToString & "));"
                Else
                    HiddenField1.Value += "marker = createMarker('" & e.Row.DataItem(4).ToString & "',new google.maps.LatLng(" & e.Row.DataItem(22).ToString & "," & e.Row.DataItem(23).ToString & "));"
                End If

                'For i As Int16 = 0 To (GridView1.Rows.Count)

                'HiddenField1.Value += "var marker = new google.maps.Marker({position:new google.maps.LatLng(" & GridView2.Rows(i).Cells(9).Text & "," & GridView2.Rows(i).Cells(8).Text & "), map: map});"
                'Next
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBCopFisica_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopFisica.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=fisica" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=cit" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBCopMoral_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopMoral.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=moral" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=cit" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBRcvFisica_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvFisica.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=fisica" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=cit" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBRcvMoral_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvMoral.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=cit" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBContNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBContNot.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/controldenotificador.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub
    
    Protected Sub printRectDom_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/cobrosasignados.aspx", "informesPDF/emision/rectificardomicilio.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&ideco=" & CType(sender, LinkButton).CommandArgument _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub printDomDistinct_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/cobrosasignados.aspx", "informesPDF/emision/domiciliodistinto.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&ideco=" & CType(sender, LinkButton).CommandArgument _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub
    Protected Sub printActCircunsHechos_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/cobrosasignados.aspx", "informesPDF/emision/actacircunstanciada.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&ideco=" & CType(sender, LinkButton).CommandArgument _
                                                 & "&export=WORD" _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBCopFisicaActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopFisicaActNot.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=fisica" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=not" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBCopMoralActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopMoralActNot.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=moral" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=not" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBRcvFisicaActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvFisicaActNot.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=fisica" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=not" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBRcvMoralActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvMoralActNot.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Request.QueryString("userid").ToString _
                                                 & "&fech_asig=" & DropDownList1.SelectedValue _
                                                 & "&imprimir=not" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub
End Class
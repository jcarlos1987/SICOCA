Public Class imprimirasignacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And (Session.Item("SIRECAuser_type").ToString.Equals("0")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                GridView1.Caption = "<h2>Fecha de impresion " & Now.ToLongDateString & " a las " & Now.ToLongTimeString & ", Factura(s) SIVEPA(S): " & GridView1.Rows.Count & "</h2>"
                'LNombre1.Text = Request.QueryString("nombre").ToString
                'LNombre2.Text = Request.QueryString("nombre").ToString
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowIndex > -1 Then
            LNombre1.Text = e.Row.DataItem(12).ToString()
            LNombre2.Text = e.Row.DataItem(12).ToString()
        End If
    End Sub

    Protected Sub LBContNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBContNot.PreRender
        'CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("pag_asps/cobrosAsignados.aspx", "informesPDF/emision/controldenotificador.aspx") _
        '                                         & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
        '                                         & "&coprcv=rcv&fisicamoral=moral" _
        '                                         & "&inspector=" & Request.QueryString("userid").ToString _
        '                                         & "&fech_asig=" & DropDownList1.SelectedValue _
        '                                         & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        'If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
        '    CType(sender, LinkButton).Visible = True
        'Else
        '    CType(sender, LinkButton).Visible = False
        'End If
    End Sub

    Protected Sub LBCopFisica_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopFisica.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("sivepas/imprimirasignacion.aspx", "informesPDF/emision/citatorionotificacionSivepa.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=fisica" _
                                                 & "&inspector=" & Request.QueryString("idinspector").ToString _
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

    End Sub

    Protected Sub LBRcvFisica_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvFisica.PreRender

    End Sub

    Protected Sub LBRcvMoral_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvMoral.PreRender

    End Sub

    Protected Sub LBCopFisicaActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopFisicaActNot.PreRender

    End Sub

    Protected Sub LBCopMoralActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopMoralActNot.PreRender

    End Sub

    Protected Sub LBRcvFisicaActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvFisicaActNot.PreRender

    End Sub

    Protected Sub LBRcvMoralActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBRcvMoralActNot.PreRender

    End Sub
End Class
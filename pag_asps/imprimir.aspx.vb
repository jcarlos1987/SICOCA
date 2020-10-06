Public Class imprimir
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And (Session.Item("SIRECAuser_type").ToString.Equals("1") Or Session.Item("SIRECAuser_type").ToString.Equals("11")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                GridView1.Caption = "<h3>Fecha de impresion " & Now.ToLongDateString & " <br/> " & Now.ToLongTimeString & ", Factura(s): " & GridView1.Rows.Count & "</h3>"
                LNombre1.Text = Session.Item("SIRECAnombre").ToString
                LNombre2.Text = Session.Item("SIRECAnombre").ToString
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If

    End Sub

    Protected Sub LBCopFisica_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopFisica.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=fisica" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=fisica" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/controldenotificador.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _                                                 
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
    End Sub

    Protected Sub printRectDom_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/rectificardomicilio.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&ideco=" & CType(sender, LinkButton).CommandArgument _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub printDomDistinct_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/domiciliodistinto.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&ideco=" & CType(sender, LinkButton).CommandArgument _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub printActCircunsHechos_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/actacircunstanciada.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&ideco=" & CType(sender, LinkButton).CommandArgument _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
                                                 & "&export=WORD" _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            'CType(sender, LinkButton).Visible = True
        Else
            'CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub LBCopFisicaActNot_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBCopFisicaActNot.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=fisica" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=cop&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=fisica" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
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
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("pag_asps/imprimir.aspx", "informesPDF/emision/citatorionotificacion.aspx") _
                                                 & "&subdel=" & Session.Item("SIRECAsubdel").ToString _
                                                 & "&coprcv=rcv&fisicamoral=moral" _
                                                 & "&inspector=" & Session.Item("SIRECAid").ToString _
                                                 & "&fech_asig=" & Request.QueryString("fecha").ToString _
                                                 & "&imprimir=not" _
                                                 & "&regpat=" & IIf(TBBuscar.Text.Length = 10, TBBuscar.Text, "%") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
        If Session.Item("SIRECAprintEmisionCitNot").ToString.Equals("1") Then
            CType(sender, LinkButton).Visible = True
        Else
            CType(sender, LinkButton).Visible = False
        End If
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        Try
            If e.Row.RowIndex >= 0 Then
                If Not e.Row.DataItem(25).ToString.Equals("0") Then
                    e.Row.CssClass = "label-warning"
                    e.Row.ToolTip = "Fue declarado como (09)NO LOCALIZADO anteriormente." + vbCr + "Recomendación: LLENAR ACTA CIRCUNSTANCIADA DE HECHOS"
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
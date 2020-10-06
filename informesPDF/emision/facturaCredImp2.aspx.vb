Imports CrystalDecisions.Shared

Public Class facturaCredImp2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub TBFecha_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFecha.Init
        TBFecha.Text = Now.ToShortDateString
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        HLPrint.NavigateUrl = "~/informesPDF/emision/facturaCredImp2tipo.aspx?msg1=" & DDLInspector.SelectedValue & "&msg2=" & DDLRegCodeBar.SelectedValue & "&fecha2=" & TBFecha.Text
    End Sub
End Class
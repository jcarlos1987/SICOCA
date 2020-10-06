Imports CrystalDecisions.Shared

Public Class facturainout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLInspector_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.SelectedIndexChanged
        HLPrint.NavigateUrl = "~/informesPDF/emision/facturainouttipo.aspx?msg1=" & CType(sender, DropDownList).SelectedValue & "&msg2=" & DDLRegCodeBar.SelectedValue
    End Sub

    Protected Sub DDLRegCodeBar_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLRegCodeBar.SelectedIndexChanged
        HLPrint.NavigateUrl = "~/informesPDF/emision/facturainouttipo.aspx?msg1=" & DDLInspector.SelectedValue & "&msg2=" & CType(sender, DropDownList).SelectedValue
    End Sub
End Class
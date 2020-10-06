Imports System.Globalization

Public Class DetallesSeleccionAMGPCRED
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_Load(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.Load
        SqlDataSourceDSAMG.SelectCommand = SqlDataSourceDSAMG.SelectCommand.Replace("--tipofile", Request.QueryString("tipofile").Replace("-", "'"))
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = Request.QueryString("patrones") & " PATRONE(S), " & Request.QueryString("credito") & " CREDITO(S) y " & String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(Request.QueryString("importe").ToString)) & " DE IMPORTE"
    End Sub
End Class
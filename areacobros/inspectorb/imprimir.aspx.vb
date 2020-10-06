Public Class imprimirb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            GridView1.Caption = "<h2>Fecha de impresion " & Now.ToLongDateString & " a las " & Now.ToLongTimeString & ", Factura(s): " & GridView1.Rows.Count & "</h2>"
            LNombre1.Text = Session.Item("SIRECAnombre").ToString
            LNombre2.Text = Session.Item("SIRECAnombre").ToString            
        End If

    End Sub

End Class
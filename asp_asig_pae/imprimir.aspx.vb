Public Class imprimir1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And (Session.Item("SIRECAuser_type").ToString.Equals("10") Or Session.Item("SIRECAuser_type").ToString.Equals("11")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                GridView1.Caption = "<h2>Fecha de impresion " & Now.ToLongDateString & " a las " & Now.ToLongTimeString & ", Factura(s): " & GridView1.Rows.Count & "</h2>"
                LNombre1.Text = Session.Item("SIRECAnombre").ToString
                LNombre2.Text = Session.Item("SIRECAnombre").ToString
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

End Class
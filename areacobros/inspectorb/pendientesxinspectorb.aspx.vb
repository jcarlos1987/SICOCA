Public Class pendientesxinspectorb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = " " & Request.QueryString("patrones").ToString & " PATRONES" _
            & ", " & Request.QueryString("cotizantes").ToString & " cotizantes" _
            & ", del periodo " & Request.QueryString("fechaEco").ToString _
            & ", de la subdelegación " & Request.QueryString("subdel").ToString
    End Sub
End Class
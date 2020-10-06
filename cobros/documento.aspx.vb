Public Class documento
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("tipodoc") Is Nothing Then
        Else
            If Request.QueryString("tipodoc").ToString.Equals("DIFERIDO_FISICA") Then
                ReportViewer1.LocalReport.ReportPath = "cobros\cartaConvenioDiferidoFisicaRCV.rdlc"
                ReportViewer1.DataBind()
            ElseIf Request.QueryString("tipodoc").ToString.Equals("DIFERIDO_MORAL") Then
                ReportViewer1.LocalReport.ReportPath = "cobros\cartaConvenioDiferidoMoralRCV.rdlc"
                ReportViewer1.DataBind()
            ElseIf Request.QueryString("tipodoc").ToString.Equals("PARCIALIDAD_FISICA") Then
                ReportViewer1.LocalReport.ReportPath = "cobros\CartaConvenioParcialidadesFisicaCOP.rdlc"
                SqlDataSourceRCV.SelectCommand = SqlDataSourceCOP.SelectCommand
                SqlDataSourceRCV.DataBind()
                ReportViewer1.DataBind()
            ElseIf Request.QueryString("tipodoc").ToString.Equals("PARCIALIDAD_MORAL") Then
                ReportViewer1.LocalReport.ReportPath = "cobros\CartaConvenioParcialidadesMoralCOP.rdlc"
                SqlDataSourceRCV.SelectCommand = SqlDataSourceCOP.SelectCommand
                SqlDataSourceRCV.DataBind()
                ReportViewer1.DataBind()
            ElseIf Request.QueryString("tipodoc").ToString.Equals("ACUERDO187_FISICA") Then
                ReportViewer1.LocalReport.ReportPath = "cobros\CondonacionAcuerdo187FisiscaCOP.rdlc"
                ReportViewer1.DataBind()
            ElseIf Request.QueryString("tipodoc").ToString.Equals("ACUERDO187_MORAL") Then
                ReportViewer1.LocalReport.ReportPath = "cobros\CondonacionAcuerdo187MoralCOP.rdlc"
                ReportViewer1.DataBind()
            End If
        End If
        
    End Sub

End Class
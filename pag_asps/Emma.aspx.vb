Imports System.IO

Public Class Emma
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString.Equals("00")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then

            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
    Protected Sub cargarConsultaEmma()
        Dim consulta As String = " SELECT"
        consulta += " [EMIP_SUB] as [SUBDEL]"
        consulta += " ,[EMIP_SEC] as [SEC]"
        consulta += " ,substring([EMIP_PATRON],2,10) as [REG_PATRONAL]"
        consulta += " ,[EMIP_NOM_PATRON] as [RAZON_SOCIAL]"
        consulta += " ,substring([EMIP_NUM_CRED],2,20) as [CREDITO]"
        consulta += " ,[EMIP_DOM] as [DOMICILIO]"
        consulta += " ,[EMIP_LOC] as [LOCALIDAD]"
        consulta += " ,([EMIP_IMP_EYM_FIJA] + EMIP_IMP_EYM_EXCE + EMIP_IMP_EYM_PRED + EMIP_IMP_EYM_PREE + EMIP_IMP_INV_VIDA + EMIP_IMP_RIES_TRA + EMIP_IMP_GUAR + EMIP_IMP_INV_VIDA_O + EMIP_IMP_EYM_EXCE_O + EMIP_IMP_EYM_PRED_O + EMIP_IMP_EYM_PREE_O)  as [MONTO]"
        consulta += " FROM [sireca].[dbo].[patrones33" & Request.QueryString("subdel").ToString & "]"

        SqlDataSourceEMMA.SelectCommand = consulta
        SqlDataSourceEMMA.DataBind()
        GridView1.DataBind()
    End Sub
    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones."
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal gv As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        form.Controls.Add(gv)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        ExportToExcel(GridView1.Caption, GridView1)
    End Sub
End Class
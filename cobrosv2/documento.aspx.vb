Imports CrystalDecisions.Shared
Imports System.Data.OleDb

Public Class documento1
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("a").ToString.Equals("1") Then
            addQr()
            getDocumento()
        Else
            L1.Text = "<strong>Reg.Patronal: </strong>" + Request.QueryString("r").ToString
            L2.Text = "<strong>Sector: </strong>" + Request.QueryString("sector").ToString
            L3.Text = "<strong>Localidad: </strong>" + Request.QueryString("loc").ToString
            L4.Text = "<strong>Domicilio: </strong>" + Request.QueryString("dom").ToString
        End If
        'Response.Write("<center>Nose encuentra el Documento Solicitado.</center>")
    End Sub

    Private Sub getDocumento()
        Try
            ' citatorio, ampliacion, mandamiento, remocion, cerrajero
            Dim tipoDoc As String = Request.QueryString("d").ToString
            CrystalReportSourceDoc.Report.FileName = tipoDoc + "v2.rpt"
            If tipoDoc.Equals("citatorio") Then
                SqlDataSourceCabecera.DataBind()
                SqlDataSourceCreditos.DataBind()
                SqlDataSourceActRec.DataBind()
                CrystalReportSourceDoc.DataBind()
            Else
                CrystalReportSourceDoc.Report.DataSources.RemoveAt(2)
                SqlDataSourceCabecera.DataBind()
                SqlDataSourceCreditos.DataBind()
                CrystalReportSourceDoc.DataBind()
            End If
            Dim nomfileQR As String = tipoDoc + Request.QueryString("s").ToString + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6")

            ' exportando el documento en el navegador sin guardar en el servidor
            Response.Buffer = False
            Response.Clear()
            'CrystalReportSourceDoc.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, nomfileQR + ".pdf")
            If Request.QueryString("export").ToString.Equals("doc") Then
                CrystalReportSourceDoc.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, nomfileQR + ".doc")
            ElseIf Request.QueryString("export").ToString.Equals("pdf") Then
                CrystalReportSourceDoc.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, nomfileQR + ".pdf")
            Else
                CrystalReportSourceDoc.ReportDocument.ExportToHttpResponse(ExportFormatType.Excel, Response, False, nomfileQR + ".xls")
            End If
            'exportando el documento en el navegador guardandolo en el servidor
            'CrystalReportSourceDoc.ReportDocument.ExportToDisk(ExportFormatType.WordForWindows, Server.MapPath("~\descargas\emision\" + nomfileQR))
            'Response.Redirect("~\descargas\emision\" + nomfileQR)
        Catch ex As Exception
            Response.Write("<center>Nose encuentra el Documento Solicitado.</center>" + ex.StackTrace)
        End Try
    End Sub

    Protected Sub LBAsignar_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' asignando el patron seleccionado antes de generar el documento seleccionado
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim vidUser As String = CType(sender, LinkButton).CommandArgument
        Dim vregpat As String = Request.QueryString("r").ToString
        Dim vcodbar As String = Request.QueryString("codbar").ToString

        Dim textConmand As String = " UPDATE [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " SET [ID_INS] = '" + vidUser + "' "
        textConmand += " ,[FECH_SUP] = getdate() "
        textConmand += " ,[FECH_INS] = convert(datetime,'" + IIf(IsDate(TBFecha.Text), TBFecha.Text, Now.ToShortDateString) + "',103) "
        textConmand += " WHERE [R_REGPATR]='" + vregpat + "' and ACTIVO=1111 and CODE_BAR='" + vcodbar + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
        ' cargar el documento solicitado
        'getDocumento()
    End Sub

    Protected Sub TBFecha_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFecha.Init
        TBFecha.Text = Now.ToShortDateString
    End Sub

    Protected Sub addQr()
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringFiscamovil").ConnectionString)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = ""
            textConmand += " INSERT INTO controlQR.dbo.CONTROL_QR "
            textConmand += " SELECT "
            textConmand += " '33' as [CQ_DELEGACION] "
            textConmand += " ,[R_SUBDEL] as [CQ_SUBDEL] "
            textConmand += " ,'2' as [CQ_SISTEMAS] "
            textConmand += " ,'co' as [CQ_AREA] "
            textConmand += " ,'P.A.E.' as [CQ_TD] "
            textConmand += " ,[ID_SUP] as [CQ_USER] "
            textConmand += " ,'" + Request.UserHostAddress + "' as [CQ_IP] "
            textConmand += " ,[FECH_SUP] as [CQ_FECH] "
            textConmand += " ,'' as [CQ_PATH] "
            textConmand += " ,[CODE_QR] as [CQ_QR_CODE] "
            textConmand += " ,1 as [CQ_NIVEL] "
            textConmand += " ,'' as [CQ_URL] "
            textConmand += " ,R_ID as [CQ_ID_DATA] "
            textConmand += " ,0 as [CQ_CARGADO] "
            textConmand += " ,'REG. PATRONAL:$'+[R_REGPATR] AS [CQ_DATO1] "
            textConmand += " ,'RAZÓN SOCIAL:$'+upper(razonSocial) AS [CQ_DATO2] "
            textConmand += " ,'PROMOTOR:$VISIT_CVE:'+convert(varchar,[ID_INS]) AS [CQ_DATO3] "
            textConmand += " ,'DOCUMENTO:$DE P.A.E.' as [CQ_DATO4] "
            textConmand += " ,NULL AS [CQ_DATO5] "
            textConmand += " ,NULL as [CQ_DATO6] "
            textConmand += " ,NULL as [CQ_DATO7] "
            textConmand += " ,NULL as [CQ_DATO8] "
            textConmand += " ,NULL as [CQ_DATO9] "
            textConmand += " ,NULL as [CQ_DATO10] "
            textConmand += " ,NULL as [CQ_DATO11] "
            textConmand += " ,NULL as [CQ_DATO12] "
            textConmand += " ,NULL as [CQ_DATO13] "
            textConmand += " ,NULL as [CQ_DATO14] "
            textConmand += " ,NULL as [CQ_DATO15] "
            textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] left join sireca.dbo.patrones on regpat=R_REGPATR "
            textConmand += " WHERE NOT EXISTS(SELECT CQ_ID FROM controlQR.dbo.CONTROL_QR "
            textConmand += " WHERE CQ_ID_DATA=R_ID AND REPLACE([CQ_DATO3],'PROMOTOR:$VISIT_CVE:','')=[ID_INS]) "

            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub
End Class
Imports CrystalDecisions.Shared
Imports System.Data.OleDb

Public Class citatorionotificacionSivepa
    Inherits System.Web.UI.Page
    Dim vCopRcv As String = "cop"
    Dim vFisMoral As String = "fisica"
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAsubdel") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            vCopRcv = "cop"
            vFisMoral = "fisica"
            If Request.QueryString("coprcv").ToString.Equals("rcv") Then
                vCopRcv = "rcv"
            End If
            If Request.QueryString("fisicamoral").ToString.Equals("moral") Then
                vFisMoral = "moral"
            End If
            'Creando canal de comunicación
            CrystalReportSourceCitaNoti.Report.FileName = vCopRcv & "_" & vFisMoral & "_cit_not.rpt"
            CrystalReportSourceCitaNoti.Report.DataSources(0).ReportName = vCopRcv & "_" & vFisMoral & "_citatorio.rpt"
            CrystalReportSourceCitaNoti.Report.DataSources(1).ReportName = vCopRcv & "_" & vFisMoral & "_notificacion.rpt"
            'verificando la persona que solicito la impresion
            Dim vcargo As String = getCargo()
            If vcargo.Equals("JFE_DEP") Or vcargo.Equals("DELEGADO") Then

            Else
                PanelRead.Visible = True
                PanelEdit.Visible = False
                'If Not Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                '    addhistoralImpresiones()
                '    addhistoralImpresionesMult()
                'End If
                'Response.Buffer = False
                'Response.Clear()
                'SqlDataSourceCitaNoti.DataBind()

                'CrystalReportSourceCitaNoti.DataBind()
                'CrystalReportSourceCitaNoti.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "citatorionotificacion" + ".doc")
            End If

        End If
    End Sub

    Private Sub addhistoralImpresiones()
        'Try
        '    Dim nwindConn As New OleDbConnection(cadenaconexion)
        '    Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        '    Dim textConmand As String = " INSERT INTO [sirecaemisiones].[dbo].[hist_impresion] "
        '    textConmand += " SELECT  "
        '    textConmand += " CN_SUBDEL "
        '    textConmand += " ,'" + Session.Item("SIRECAid").ToString() + "' "
        '    textConmand += " ,getdate() "
        '    textConmand += " ,substring(CN_REG_PAT_ORIGINAL,1,10) "
        '    textConmand += " ,CN_NOMBRE_PATRON "
        '    textConmand += " ,CN_CREDITO_CUOTA "
        '    textConmand += " ,CN_PERIODO "
        '    If Request.QueryString("imprimir").ToString.Equals("cit") Then
        '        textConmand += " ,'Citatorio ('+CN_TIPO_COP_RCV+'-'+CN_TIPO_PERSONA+')' "
        '    ElseIf Request.QueryString("imprimir").ToString.Equals("not") Then
        '        textConmand += " ,'Acta de Notificacion ('+CN_TIPO_COP_RCV+'-'+CN_TIPO_PERSONA+')' "
        '    Else
        '        textConmand += " ,'DESCONOCIDO URL MODIFICADA ('+CN_TIPO_COP_RCV+'-'+CN_TIPO_PERSONA+')'  "
        '    End If
        '    textConmand += " ,CN_FECH_ASIGNO "
        '    textConmand += " ,CN_NOTIFICADOR "
        '    textConmand += " ,'" + Request.UserHostAddress + "' "
        '    textConmand += " ,'" + Request.Url.AbsoluteUri + " ' "
        '    textConmand += " ,(case when CN_INI_IMPRIMIO='' then (SELECT sirecacobros.dbo.encriptar(CHAR((65+CONVERT(INT,(85-65+1)*rand())))+CHAR((65+CONVERT(INT,(85-65+1)*rand())))+CHAR((65+CONVERT(INT,(85-65+1)*rand())))+CHAR((65+CONVERT(INT,(85-65+1)*rand()))),'" + Session.Item("SIRECAid").ToString + "','" + Request.QueryString("inspector").ToString + "','1',CONVERT(VARCHAR(15),RAND()),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))) )) else (SELECT sirecacobros.dbo.encriptar(CN_INI_IMPRIMIO,'" + Session.Item("SIRECAid").ToString + "','" + Request.QueryString("inspector").ToString + "','1',CONVERT(VARCHAR(15),RAND()),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))) )) end) as CN_KEY "
        '    textConmand += " ,'" + TBObservacion.Text + "' AS CN_OBSERVACION "
        '    textConmand += " ,1 AS QR "
        '    textConmand += " FROM ( "
        '    textConmand += " SELECT "
        '    textConmand += " razonSocial as CN_NOMBRE_PATRON "
        '    textConmand += " ,[REG#PATRONAL] as CN_REG_PAT_ORIGINAL "
        '    textConmand += " ,[CREDITO] as CN_CREDITO_CUOTA "
        '    textConmand += " ,( "
        '    textConmand += " case when tipoECO in ('COP','COMP') then substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6) "
        '    textConmand += " else substring([CREDITO],1,2) + '6' + substring([CREDITO],4,6) end "
        '    textConmand += " ) as CN_CREDITO_MULTA "
        '    textConmand += " ,( "
        '    textConmand += " case "
        '    textConmand += " when [tipoECO] in ('COP','COMP') then "
        '    textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
        '    textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
        '    textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
        '    textConmand += " else '' "
        '    textConmand += " end "
        '    textConmand += " ) as CN_PERIODO "
        '    textConmand += " ,eco.responsable as CN_NOTIFICADOR "
        '    textConmand += " ,eco.subdel as CN_SUBDEL "
        '    textConmand += " ,(case when tipoeco in ('COP','COMP') then 'COP' else 'RCV' end) as CN_TIPO_COP_RCV "
        '    textConmand += " ,(select sirecacobros.dbo.tipoPersona(rfc,razonSocial)) as CN_TIPO_PERSONA "
        '    textConmand += " ,eco.fechaSeleccion as CN_FECH_ASIGNO "
        '    textConmand += " ,( "
        '    textConmand += " isnull((SELECT upper(nom_iniciales) "
        '    textConmand += " FROM fiscamovil.dbo.usuarios as uf "
        '    textConmand += " WHERE uf.id='" + Session.Item("SIRECAid").ToString + "' and uf.subdel=eco.subdel "
        '    textConmand += " and exists( "
        '    textConmand += " SELECT [C_CARGO] "
        '    textConmand += " FROM [sirecaemisiones].[dbo].[catalogo] as cat "
        '    textConmand += " WHERE cat.[C_CARGO]='DELEGADO' and cat.C_ID='" + Session.Item("SIRECAid").ToString + "') "
        '    textConmand += " ),'') "
        '    textConmand += " + "
        '    textConmand += " isnull((SELECT upper(nom_iniciales) "
        '    textConmand += " FROM fiscamovil.dbo.usuarios as uf "
        '    textConmand += " WHERE uf.id='" + Session.Item("SIRECAid").ToString + "' and uf.subdel=eco.subdel "
        '    textConmand += " and exists( "
        '    textConmand += " SELECT [C_CARGO] "
        '    textConmand += " FROM [sirecaemisiones].[dbo].[catalogo] as cat "
        '    textConmand += " WHERE cat.[C_CARGO]='JFE_DEP' and cat.C_ID='" + Session.Item("SIRECAid").ToString + "') "
        '    textConmand += " ),'') "
        '    textConmand += " ) AS CN_INI_IMPRIMIO "
        '    textConmand += " FROM sireca.dbo.eco as eco left join sireca.dbo.patrones as ptn on substring(eco.[REG#PATRONAL],1,10)=ptn.regpat "
        '    textConmand += " WHERE tipoeco in ('COP','COMP','RCV','RCVCOMP') "
        '    textConmand += " and eco.responsable = '" + Request.QueryString("inspector").ToString + "' and eco.subdel = '" + Request.QueryString("subdel").ToString + "' "
        '    textConmand += " and convert(nvarchar(11),eco.fechaSeleccion,103)='" + Request.QueryString("fech_asig").ToString + "' "
        '    textConmand += " ) as resultado "
        '    textConmand += " where CN_TIPO_COP_RCV='" + Request.QueryString("coprcv").ToString + "' "
        '    textConmand += " and CN_TIPO_PERSONA='" + Request.QueryString("fisicamoral").ToString + "' "
        '    catCMD.CommandText = textConmand
        '    nwindConn.Open()
        '    catCMD.ExecuteNonQuery()
        '    nwindConn.Close()
        'Catch ex As Exception

        'End Try
    End Sub

    Private Sub addhistoralImpresionesMult()
        'Try
        '    Dim nwindConn As New OleDbConnection(cadenaconexion)
        '    Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        '    Dim textConmand As String = " INSERT INTO [sirecaemisiones].[dbo].[hist_impresion] "
        '    textConmand += " SELECT "
        '    textConmand += " CN_SUBDEL "
        '    textConmand += " ,'" + Session.Item("SIRECAid").ToString() + "' "
        '    textConmand += " ,getdate() "
        '    textConmand += " ,substring(CN_REG_PAT_ORIGINAL,1,10) "
        '    textConmand += " ,CN_NOMBRE_PATRON "
        '    textConmand += " ,CN_CREDITO_MULTA "
        '    textConmand += " ,CN_PERIODO "
        '    If Request.QueryString("imprimir").ToString.Equals("cit") Then
        '        textConmand += " ,'Citatorio ('+CN_TIPO_COP_RCV+'-'+CN_TIPO_PERSONA+')' "
        '    ElseIf Request.QueryString("imprimir").ToString.Equals("not") Then
        '        textConmand += " ,'Acta de Notificacion ('+CN_TIPO_COP_RCV+'-'+CN_TIPO_PERSONA+')' "
        '    Else
        '        textConmand += " ,'DESCONOCIDO URL MODIFICADA ('+CN_TIPO_COP_RCV+'-'+CN_TIPO_PERSONA+')'  "
        '    End If
        '    textConmand += " ,CN_FECH_ASIGNO "
        '    textConmand += " ,CN_NOTIFICADOR "
        '    textConmand += " ,'" + Request.UserHostAddress + " ' "
        '    textConmand += " ,'" + Request.Url.AbsoluteUri + "' "
        '    textConmand += " ,CN_KEY "
        '    textConmand += " ,'" + TBObservacion.Text + "' AS CN_OBSERVACION "
        '    textConmand += "  FROM ( SELECT "

        '    textConmand += " (SELECT TOP 1 [IM_KEY] AS [IM_KEY] "
        '    textConmand += " FROM [sirecaemisiones].[dbo].[hist_impresion] "
        '    textConmand += " WHERE [IM_SUBDEL]=eco.subdel "
        '    textConmand += " AND [IM_USER_PRINT]='" + Session.Item("SIRECAid").ToString + "' "
        '    textConmand += " AND [IM_REGPAT]=SUBSTRING([REG#PATRONAL],1,10) "
        '    textConmand += " AND [IM_CREDITO]=eco.credito "
        '    textConmand += " AND CONVERT(VARCHAR(10),[IM_FECHA_IMPRESION],103)=CONVERT(VARCHAR(10),GETDATE(),103) "
        '    textConmand += " AND CONVERT(VARCHAR(10),[IM_FECHA_ASIGNACION],103)=CONVERT(VARCHAR(10),fechaseleccion,103) "
        '    textConmand += " ORDER BY [IM_ID] DESC) AS CN_KEY "
        '    textConmand += " ,razonSocial as CN_NOMBRE_PATRON "
        '    textConmand += " ,[REG#PATRONAL] as CN_REG_PAT_ORIGINAL "
        '    textConmand += " ,[CREDITO] as CN_CREDITO_CUOTA "
        '    textConmand += " ,( "
        '    textConmand += " case when tipoECO in ('COP','COMP') then substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6) "
        '    textConmand += " else substring([CREDITO],1,2) + '6' + substring([CREDITO],4,6) end "
        '    textConmand += " ) as CN_CREDITO_MULTA "
        '    textConmand += " ,( "
        '    textConmand += " case "
        '    textConmand += " when [tipoECO] in ('COP','COMP') then "
        '    textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
        '    textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
        '    textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
        '    textConmand += " else '' "
        '    textConmand += " end "
        '    textConmand += " ) as CN_PERIODO "
        '    textConmand += " ,eco.responsable as CN_NOTIFICADOR "
        '    textConmand += " ,eco.subdel as CN_SUBDEL "
        '    textConmand += " ,(case when tipoeco in ('COP','COMP') then 'COP' else 'RCV' end) as CN_TIPO_COP_RCV "
        '    textConmand += " ,(select sirecacobros.dbo.tipoPersona(rfc,razonSocial)) as CN_TIPO_PERSONA "
        '    textConmand += " ,eco.fechaSeleccion as CN_FECH_ASIGNO "
        '    textConmand += " ,( "
        '    textConmand += " isnull((SELECT upper(nom_iniciales) "
        '    textConmand += " FROM fiscamovil.dbo.usuarios as uf "
        '    textConmand += " WHERE uf.id='" + Session.Item("SIRECAid").ToString + "' and uf.subdel=eco.subdel "
        '    textConmand += " and exists( "
        '    textConmand += " SELECT [C_CARGO] "
        '    textConmand += " FROM [sirecaemisiones].[dbo].[catalogo] as cat "
        '    textConmand += " WHERE cat.[C_CARGO]='DELEGADO' and cat.C_ID='" + Session.Item("SIRECAid").ToString + "') "
        '    textConmand += " ),'') "
        '    textConmand += " + "
        '    textConmand += " isnull((SELECT upper(nom_iniciales) "
        '    textConmand += " FROM fiscamovil.dbo.usuarios as uf "
        '    textConmand += " WHERE uf.id='" + Session.Item("SIRECAid").ToString + "' and uf.subdel=eco.subdel "
        '    textConmand += " and exists( "
        '    textConmand += " SELECT [C_CARGO] "
        '    textConmand += " FROM [sirecaemisiones].[dbo].[catalogo] as cat "
        '    textConmand += " WHERE cat.[C_CARGO]='JFE_DEP' and cat.C_ID='" + Session.Item("SIRECAid").ToString + "') "
        '    textConmand += " ),'') "
        '    textConmand += " ) AS CN_INI_IMPRIMIO "
        '    textConmand += " FROM sireca.dbo.eco as eco left join sireca.dbo.patrones as ptn on substring(eco.[REG#PATRONAL],1,10)=ptn.regpat "
        '    textConmand += " WHERE tipoeco in ('COP','COMP','RCV','RCVCOMP') "
        '    textConmand += " and eco.responsable = '" + Request.QueryString("inspector").ToString + "' and eco.subdel = '" + Request.QueryString("subdel").ToString + "' "
        '    textConmand += " and convert(nvarchar(11),eco.fechaSeleccion,103)='" + Request.QueryString("fech_asig").ToString + "' "
        '    textConmand += " ) as resultado "
        '    textConmand += " where CN_TIPO_COP_RCV='" + Request.QueryString("coprcv").ToString + "' "
        '    textConmand += " and CN_TIPO_PERSONA='" + Request.QueryString("fisicamoral").ToString + "' "

        '    catCMD.CommandText = textConmand
        '    nwindConn.Open()
        '    catCMD.ExecuteNonQuery()
        '    nwindConn.Close()
        'Catch ex As Exception

        'End Try
    End Sub

    Private Function getCargo()
        Dim vcargo As String = ""
        Dim nwindConn As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringFiscamovil").ConnectionString)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        catCMD.CommandText = " SELECT [C_CARGO] FROM [sirecaemisiones].[dbo].[catalogo] WHERE [C_ID]='" + Session.Item("SIRECAid").ToString + "' "
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            vcargo = myReader.GetValue(0)
        Loop
        myReader.Close()
        nwindConn.Close()
        Return vcargo
    End Function
    Protected Sub addQr(ByVal nomFile As String)
        'Dim nwindConn As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("ConnectionStringFiscamovil").ConnectionString)
        'Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        'Dim textConmand As String = ""
        'textConmand += " INSERT INTO controlQR.dbo.CONTROL_QR "
        'textConmand += " SELECT '33' as [CQ_DELEGACION] "
        'textConmand += " ,[IM_SUBDEL] as [CQ_SUBDEL] "
        'textConmand += " ,'2' as [CQ_SISTEMAS] "
        'textConmand += " ,'co' as [CQ_AREA] "
        'textConmand += " ,[IM_TIPO_IMPRESION] as [CQ_TD] "
        'textConmand += " ,[IM_USER_PRINT] as [CQ_USER] "
        'textConmand += " ,[IM_IP] as [CQ_IP] "
        'textConmand += " ,[IM_FECHA_IMPRESION] as [CQ_FECH] "
        'textConmand += " ,'" + nomFile + "' as [CQ_PATH] "
        'textConmand += " ,convert(varchar(10),IM_ID)+[IM_KEY] as [CQ_QR_CODE] "
        'textConmand += " ,1 as [CQ_NIVEL] "
        'textConmand += " ,[IM_URL] as [CQ_URL] "
        'textConmand += " ,IM_ID as [CQ_ID_DATA] "
        'textConmand += " ,0 as [CQ_CARGADO] "
        'textConmand += " ,'REG. PATRONAL:$'+[IM_REGPAT] AS [CQ_DATO1] "
        'textConmand += " ,'RAZÓN SOCIAL:$'+[IM_RAZON_SOCIAL] AS [CQ_DATO2] "
        'textConmand += " ,'PROMOTOR:$VISIT_CVE:'+[IM_INSPECTOR] AS [CQ_DATO3] "
        'textConmand += " ,'POR CREDITOS:$'+[IM_CREDITO]+' y '+( "
        'textConmand += " case when CHARINDEX('(COP-','Citatorio (COP-FISICA)') NOT IN  (0) then substring([IM_CREDITO],1,2) + '8' + substring([IM_CREDITO],4,6) "
        'textConmand += " else substring([IM_CREDITO],1,2) + '6' + substring([IM_CREDITO],4,6) end "
        'textConmand += " ) AS [CQ_DATO4] "
        'textConmand += " ,'DEL PERIODO:$'+[IM_PERIODO] AS [CQ_DATO5] "
        'textConmand += " ,NULL as [CQ_DATO6] "
        'textConmand += " ,NULL as [CQ_DATO7] "
        'textConmand += " ,NULL as [CQ_DATO8] "
        'textConmand += " ,NULL as [CQ_DATO9] "
        'textConmand += " ,NULL as [CQ_DATO10] "
        'textConmand += " ,NULL as [CQ_DATO11] "
        'textConmand += " ,NULL as [CQ_DATO12] "
        'textConmand += " ,NULL as [CQ_DATO13] "
        'textConmand += " ,NULL as [CQ_DATO14] "
        'textConmand += " ,NULL as [CQ_DATO15] "
        'textConmand += " FROM [sirecaemisiones].[dbo].[hist_impresion] "
        'textConmand += " WHERE IM_QR=1 AND NOT EXISTS(SELECT CQ_ID FROM controlQR.dbo.CONTROL_QR "
        'textConmand += " WHERE CQ_ID_DATA=IM_ID) "

        'catCMD.CommandText = textConmand
        'nwindConn.Open()
        'catCMD.ExecuteNonQuery()
        'nwindConn.Close()
    End Sub
    Protected Sub LBPrint_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBPrint.Click
        LMsg.Text = ""
        If TBObservacion.Text.Replace(" ", "").Length > 4 Then
            If Not Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                addhistoralImpresiones()
                addhistoralImpresionesMult()
            End If
            Response.Buffer = False
            Response.Clear()
            Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "CitNoti" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".pdf"
            addQr(nomfileQR)
            SqlDataSourceCitaNoti.DataBind()
            CrystalReportSourceCitaNoti.DataBind()
            CrystalReportSourceCitaNoti.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~\descargas\sivepa\" + nomfileQR))
            Response.Redirect("~\descargas\sivepa\" + nomfileQR)
            'CrystalReportSourceCitaNoti.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "citatorionotificacion" + ".pdf")
        Else
            LMsg.Text = "Especifique el por qué para continuar con la impresión"
        End If
    End Sub

    Protected Sub LBPDF_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBPDF.Click
        'If Not System.IO.Directory.Exists("~\descargas\sivepa\") Then
        '    System.IO.Directory.CreateDirectory("~\descargas\sivepa\")
        'End If
        If Not Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            addhistoralImpresiones()
            addhistoralImpresionesMult()
        End If
        Response.Buffer = False
        Response.Clear()
        Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "CitNoti" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".pdf"
        addQr(nomfileQR)
        SqlDataSourceCitaNoti.DataBind()
        CrystalReportSourceCitaNoti.DataBind()
        CrystalReportSourceCitaNoti.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~\descargas\sivepa\" + nomfileQR))
        Response.Redirect("~\descargas\sivepa\" + nomfileQR)
        'CrystalReportSourceCitaNoti.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "citatorionotificacion" + ".pdf")
    End Sub

    Protected Sub LBWORD_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBWORD.Click
        'If Not System.IO.Directory.Exists("~\descargas\sivepa\") Then
        '    System.IO.Directory.CreateDirectory("~\descargas\sivepa\")
        'End If
        If Not Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            addhistoralImpresiones()
            addhistoralImpresionesMult()
        End If
        Response.Buffer = False
        Response.Clear()
        Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "CitNoti" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".doc"
        addQr(nomfileQR)
        SqlDataSourceCitaNoti.DataBind()
        CrystalReportSourceCitaNoti.DataBind()
        CrystalReportSourceCitaNoti.ReportDocument.ExportToDisk(ExportFormatType.WordForWindows, Server.MapPath("~\descargas\sivepa\" + nomfileQR))
        Response.Redirect("~\descargas\sivepa\" + nomfileQR)
        'CrystalReportSourceCitaNoti.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, "citatorionotificacion" + ".doc")
    End Sub

    Protected Sub LBPrintWord_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBPrintWord.Click
        LMsg.Text = ""
        'If Not System.IO.Directory.Exists("~\descargas\sivepa\") Then
        '    System.IO.Directory.CreateDirectory("~\descargas\sivepa\")
        'End If
        If TBObservacion.Text.Replace(" ", "").Length > 4 Then
            If Not Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                addhistoralImpresiones()
                addhistoralImpresionesMult()
            End If
            Response.Buffer = False
            Response.Clear()
            Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "CitNoti" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".doc"
            addQr(nomfileQR)
            SqlDataSourceCitaNoti.DataBind()
            CrystalReportSourceCitaNoti.DataBind()
            CrystalReportSourceCitaNoti.ReportDocument.ExportToDisk(ExportFormatType.WordForWindows, Server.MapPath("~\descargas\sivepa\" + nomfileQR))
            Response.Redirect("~\descargas\sivepa\" + nomfileQR)
            'CrystalReportSourceCitaNoti.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, "citatorionotificacion" + ".doc")
        Else
            LMsg.Text = "Especifique el por qué para continuar con la impresión"
        End If
    End Sub
End Class
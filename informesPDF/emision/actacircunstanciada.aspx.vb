﻿Imports CrystalDecisions.Shared
Imports System.Data.OleDb

Public Class actacircunstanciada1
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Buffer = False
        Response.Clear()
        If Request.QueryString("export").ToString.Equals("PDF") Then
            Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "actCirc" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".pdf"
            addQR(nomfileQR)
            SqlDataSourceActaCircunstanciada.DataBind()
            CrystalReportSourceActaCircunstanciada.DataBind()
            CrystalReportSourceActaCircunstanciada.ReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~\descargas\emision\" + nomfileQR))
            Response.Redirect("~\descargas\emision\" + nomfileQR)
            'CrystalReportSourceActaCircunstanciada.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "actaCircunstanciada" + ".pdf")
        Else
            Dim nomfileQR As String = Session.Item("SIRECAid").ToString + Session.Item("SIRECAsubdel").ToString + "actCirc" + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + Now.Millisecond.ToString("D6") + ".doc"
            addQR(nomfileQR)
            SqlDataSourceActaCircunstanciada.DataBind()
            CrystalReportSourceActaCircunstanciada.DataBind()
            CrystalReportSourceActaCircunstanciada.ReportDocument.ExportToDisk(ExportFormatType.WordForWindows, Server.MapPath("~\descargas\emision\" + nomfileQR))
            Response.Redirect("~\descargas\emision\" + nomfileQR)
            'CrystalReportSourceActaCircunstanciada.ReportDocument.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, False, "actaCircunstanciada" + ".doc")
        End If
    End Sub
    Private Sub addQR(ByVal nomFile As String)
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " INSERT INTO [controlQR].[dbo].[CONTROL_QR] "
            textConmand += " SELECT "
            textConmand += " '" + Request.QueryString("subdel").ToString + "' AS CQ_DEL "
            textConmand += " ,eco.subdel AS CQ_SUBDEL "
            textConmand += " ,2 AS CQ_SISTEMA "
            textConmand += " ,'co' AS CQ_AREA "
            textConmand += " ,'ACTA CIRCUNSTANCIADA' AS CQ_TD "
            textConmand += " ," + Session.Item("SIRECAid").ToString + " AS CQ_USER "
            textConmand += " ,'" + Request.UserHostAddress + "' AS CQ_IP "
            textConmand += " ,getdate() AS CQ_FECHA "
            textConmand += " ,'" + nomFile + "' AS CQ_PATH "
            textConmand += " ,(select controlQR.dbo.encriptar('co','2','" + Session.Item("SIRECAid").ToString + "','" + Session.Item("SIRECAdel").ToString + "',eco.subdel,CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))),CHAR((65+CONVERT(INT,(85-65+1)*rand()))))) AS CQ_QR_CODE "
            textConmand += " ,1 AS CQ_NIVEL "
            textConmand += " ,'" + Request.Url.AbsoluteUri + "' AS CQ_URL "
            textConmand += " ,eco.id AS CQ_DATA "
            textConmand += " ,0 AS CQ_CARGADO "
            textConmand += " ,'REG. PATRONAL:$'+[REG#PATRONAL] as CQ_DATO1 "
            textConmand += " ,'RAZON SOCIAL:$'+razonSocial as CQ_DATO2 "
            textConmand += " ,'PROMOTOR:$VISIT_CVE:'+eco.responsable AS CQ_DATO3 "
            textConmand += " ,'CREDENCIAL:$' + (SELECT us.credencial FROM sireca.dbo.usuarios as us WHERE us.id=responsable) AS CQ_DATO4 "
            textConmand += " ,'CREDITOS:$'+credito+'/'+( "
            textConmand += " case when tipoECO in ('COP','COMP') then substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6) "
            textConmand += " else substring([CREDITO],1,2) + '6' + substring([CREDITO],4,6) end "
            textConmand += " ) as CQ_DATO5 "
            textConmand += " ,( "
            textConmand += " case when tipoECO in ('COP','COMP') then 'PERIODO(S):$' "
            textConmand += " else 'BIMESTRE(S):$' end "
            textConmand += " )+(case "
            textConmand += " when [tipoECO] in ('COP','COMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " end "
            textConmand += " ) as CQ_DATO6 "
            textConmand += " ,NULL as CQ_DATO7 "
            textConmand += " ,NULL as CQ_DATO8 "
            textConmand += " ,NULL as CQ_DATO9 "
            textConmand += " ,NULL as CQ_DATO10 "
            textConmand += " ,NULL as CQ_DATO11 "
            textConmand += " ,NULL as CQ_DATO12 "
            textConmand += " ,NULL as CQ_DATO13 "
            textConmand += " ,NULL as CQ_DATO14 "
            textConmand += " ,NULL as CQ_DATO15 "
            textConmand += " FROM [sireca].[dbo].[eco] as eco left join sireca.dbo.patrones as ptn on substring([REG#PATRONAL],1,10)=regpat "
            textConmand += " where eco.[subdel]='" + Request.QueryString("subdel").ToString + "' "
            textConmand += " and eco.tipoeco in ('COP','COMP','RCV','RCVCOMP') "
            textConmand += " and eco.id=" + Request.QueryString("ideco").ToString + " "

            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
        Catch ex As Exception

        End Try
    End Sub
End Class
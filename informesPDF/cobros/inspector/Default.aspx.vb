Imports System.IO
Imports CrystalDecisions.Shared
Imports Ionic.Zip
Imports System.Data.OleDb

Public Class _Default38
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("3") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo3.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("IA") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorA.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("IB") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorB.Master"
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub LinkButton5_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton5.Click
        If IsDate(TBFechIni.Text) And IsDate(TBFechIni.Text) Then
            'LabelError.Text = ""
            'exportacion inicio
            exportacion(exportarDiligencia(), exportarEmbargos(), exportarRecibos())
        End If
    End Sub

    Private Function exportarDiligencia() As String
        Dim nomfile As String = ""
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/diligencias/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/diligencias/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            nomfile = Server.MapPath("~/descargas/diligencias/DILIGENCIAS_") + Session.Item("SIRECAid").ToString + "." + Now.ToShortDateString.Replace("/", "") + "." + Now.Hour.ToString("D4") + Now.Minute.ToString("D4") + Now.Second.ToString("D4") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''SUBDEL'',''TIPO'',''TD'',''INC'',''INSPECTOR'',''REGPAT'',''RAZONSOCIAL'',''CREDITO'',''PERIODO'',''DOCUMENTO'',''DILIGENCIA'',''FEC_DILIGENCIA'',''IMPORTE'',''OBSERVACION'',''CLAVE_EMBARGO'' "
            myInsertQueryDatosTable = " SELECT "
            myInsertQueryDatosTable += " [AC_SUBDEL] "
            myInsertQueryDatosTable += " ,[RA_TIPO] "
            myInsertQueryDatosTable += " ,[RA_TD] "
            myInsertQueryDatosTable += " ,[RA_INC] "
            myInsertQueryDatosTable += " ,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[AC_CP_INSPEC]) as INSPECTOR "
            myInsertQueryDatosTable += " ,[AC_RA_REGPATR] as REGPAT "
            myInsertQueryDatosTable += " ,''""""''+razonSocial+''""""'' as RAZONSOCIAL "
            myInsertQueryDatosTable += " ,[AC_RA_NUMCRED] as CREDITO "
            myInsertQueryDatosTable += " ,substring([AC_RA_PERIODO],4,7) as PERIODO "
            myInsertQueryDatosTable += " ,(SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) as DOCUMENTO "
            myInsertQueryDatosTable += " ,((case when [AC_DILIGENCIA]=0 then (SELECT [desc_tipo] FROM [sirecacobros].[dbo].[cae_tipodoc] WHERE [id_tipo]=[AC_DOC_ENTRGADO]) +'' (''+[AC_HORA_CITATORIO]+ '')'' else '''' end)+ "
            myInsertQueryDatosTable += "       (SELECT case when [desc_diligencia]=''> seleccione'' then '''' else replace([desc_diligencia],''(foto)'','''') end FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[AC_DILIGENCIA]) "
            myInsertQueryDatosTable += "       + "
            myInsertQueryDatosTable += "       case when( "
            myInsertQueryDatosTable += " 			case when RA_FOLIO_PAG is null then '''' else ''(REC.PRO.:''+( "
            myInsertQueryDatosTable += " 			SELECT [PA_RECIBO_PROVI] "
            myInsertQueryDatosTable += " 			FROM [sirecacobros].[dbo].[CO_PAGOS] "
            myInsertQueryDatosTable += " 			WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG "
            myInsertQueryDatosTable += " 			and convert(varchar(10),[PA_FECH_RECIBO_PROVI],103)=convert(varchar(10),[AC_FECH_DILIGENCIA],103) "
            myInsertQueryDatosTable += " 			)+'')'' end "
            myInsertQueryDatosTable += " 		) "
            myInsertQueryDatosTable += " 		 is null then '''' "
            myInsertQueryDatosTable += " 		 else "
            myInsertQueryDatosTable += " 		 ( "
            myInsertQueryDatosTable += " 			case when RA_FOLIO_PAG is null then '''' else ''(REC.PRO.:''+( "
            myInsertQueryDatosTable += " 			SELECT [PA_RECIBO_PROVI] "
            myInsertQueryDatosTable += " 			FROM [sirecacobros].[dbo].[CO_PAGOS] "
            myInsertQueryDatosTable += " 			WHERE PA_RA_FOLIO_PAG=RA_FOLIO_PAG "
            myInsertQueryDatosTable += " 			and convert(varchar(10),[PA_FECH_RECIBO_PROVI],103)=convert(varchar(10),[AC_FECH_DILIGENCIA],103) "
            myInsertQueryDatosTable += " 			)+'')'' end "
            myInsertQueryDatosTable += " 		) "
            myInsertQueryDatosTable += " 		 end "
            myInsertQueryDatosTable += "        ) as DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(varchar(10),[AC_FECH_DILIGENCIA],103) as FEC_DILIGENCIA "
            myInsertQueryDatosTable += " ,CONVERT(VARCHAR(100),RA_IMPORTE) as IMPORTE "
            myInsertQueryDatosTable += " ,''""""''+(SELECT (case when [desc_observacion] = ''> seleccione'' then '''' else ISNULL([desc_observacion],'''') end) FROM [sirecacobros].[dbo].[cae_observacion] WHERE [id_observacion]=[AC_OBSERVACION])+''""""'' as OBSERVACION "
            myInsertQueryDatosTable += " ,(CASE WHEN LEN(EMBARGOS)>1 THEN ID_EMBARGO ELSE '''' END) as ID_EMBARGO "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[CO_ACCIONES] left join sireca.dbo.patrones on [AC_RA_REGPATR]=regpat "
            myInsertQueryDatosTable += " left join [sirecacobros].[dbo].[CO_RALE] on AC_RA_ID=RA_ID "
            myInsertQueryDatosTable += " where year([AC_FECH_DILIGENCIA])=year(''" & TBFechIni.Text & "'') and month([AC_FECH_DILIGENCIA])=month(''" & TBFechIni.Text & "'')"
            myInsertQueryDatosTable += " and  [AC_SUBDEL]=''" & DDLSubdel.SelectedValue & "'' "
            'myInsertQueryDatosTable += " order by 2,3,5 "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomfile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'LabelError.Text = LabelError.Text + " _ " + ex.Message
        End Try
        Return nomfile
    End Function
    Private Function exportarEmbargos() As String
        Dim nomfile As String = ""
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/diligencias/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/diligencias/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            nomfile = Server.MapPath("~/descargas/diligencias/EMBARGOS_") + Session.Item("SIRECAid").ToString + "." + Now.ToShortDateString.Replace("/", "") + "." + Now.Hour.ToString("D4") + Now.Minute.ToString("D4") + Now.Second.ToString("D4") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''CLAVE_EMBARGO'',''EMBARGOS'',''AC_SUBDEL'',''INSPECTOR'',''REGPAT'',''RAZONSOCIAL'' "
            myInsertQueryDatosTable = " SELECT "
            myInsertQueryDatosTable += " ISNULL(ID_EMBARGO,''SIN EMBARGOS'') as ID_EMBARGO "
            myInsertQueryDatosTable += " ,ISNULL(EMBARGOS,''SIN EMBARGOS'') as EMBARGOS "
            myInsertQueryDatosTable += " ,[AC_SUBDEL] "
            myInsertQueryDatosTable += " ,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[AC_CP_INSPEC]) as INSPECTOR "
            myInsertQueryDatosTable += " ,[AC_RA_REGPATR] as REGPAT "
            myInsertQueryDatosTable += " ,''""""''+razonSocial+''""""'' as RAZONSOCIAL "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[CO_ACCIONES] left join sireca.dbo.patrones on [AC_RA_REGPATR]=regpat "
            myInsertQueryDatosTable += " left join [sirecacobros].[dbo].[CO_RALE] on AC_RA_ID=RA_ID "
            myInsertQueryDatosTable += " where year([AC_FECH_DILIGENCIA])=year(''" & TBFechIni.Text & "'') and month([AC_FECH_DILIGENCIA])=month(''" & TBFechIni.Text & "'')"
            myInsertQueryDatosTable += " and  [AC_SUBDEL]=''" & DDLSubdel.SelectedValue & "'' "
            myInsertQueryDatosTable += " and  len(EMBARGOS)>1 "
            myInsertQueryDatosTable += " GROUP BY AC_SUBDEL,ID_EMBARGO,EMBARGOS,[AC_CP_INSPEC],[AC_RA_REGPATR],RAZONSOCIAL "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomfile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'LabelError.Text = LabelError.Text + " _ " + ex.Message
        End Try
        Return nomfile
    End Function

    Private Function exportarRecibos() As String
        Dim nomfile As String = ""
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/diligencias/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/diligencias/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            nomfile = Server.MapPath("~/descargas/diligencias/RECIBOS_") + Session.Item("SIRECAid").ToString + "." + Now.ToShortDateString.Replace("/", "") + "." + Now.Hour.ToString("D4") + Now.Minute.ToString("D4") + Now.Second.ToString("D4") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''SUBDEL'',''REGPAT'',''INSPECTOR'',''PAGO'',''RECIBO_PROVICIONAL'',''FECHA_RECIVO_PROVICIONAL'' "
            myInsertQueryDatosTable = " SELECT "
            myInsertQueryDatosTable += " [PA_SUBDEL] "
            myInsertQueryDatosTable += " ,substring([PA_RA_FOLIO_PAG],1,10) as REGPAT "
            myInsertQueryDatosTable += " ,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[PA_INSPEC]) as INSPECTOR "
            myInsertQueryDatosTable += " ,CAST([PA_PAGO] AS NVARCHAR) as PAGO "
            myInsertQueryDatosTable += " ,[PA_RECIBO_PROVI] as RECIBO_PROVICIONAL "
            myInsertQueryDatosTable += " ,CONVERT(NVARCHAR(10),[PA_FECH_RECIBO_PROVI],103) as FECHA_RECIVO_PROVICIONAL "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[CO_PAGOS] "
            myInsertQueryDatosTable += " WHERE [PA_SUBDEL]=''" & DDLSubdel.SelectedValue & "'' "
            myInsertQueryDatosTable += " AND YEAR([PA_FECH_RECIBO_PROVI])=year(''" & TBFechIni.Text & "'') "
            myInsertQueryDatosTable += " AND MONTH([PA_FECH_RECIBO_PROVI])=month(''" & TBFechIni.Text & "'') "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomfile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'LabelError.Text = LabelError.Text + " _ " + ex.Message
        End Try
        Return nomfile
    End Function

    Private Sub exportacion(ByVal nomFile1 As String, ByVal nomFile2 As String, ByVal nomFile3 As String)
        Response.Clear()
        Response.BufferOutput = False
        Response.ContentType = "application/zip"
        Response.AddHeader("content-disposition", "filename=DiligenciasEmbargosRecibos_" + Now.Month.ToString("D2") + "-" + Now.Year.ToString("D4") + ".zip")
        Using zip As ZipFile = New ZipFile
            zip.AddFile(nomFile1, "")
            zip.AddFile(nomFile2, "")
            zip.AddFile(nomFile3, "")
            zip.Save(Response.OutputStream)
            'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
        End Using
        Response.Close()
    End Sub

    Protected Sub TBFechIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechIni.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub
End Class
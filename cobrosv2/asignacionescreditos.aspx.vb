Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class asignacionescreditos
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteInspectorB.Master"
            Else : Request.QueryString("tipo").ToString.Equals("2")
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub LBDescargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDescargar.Click
        If DDLTipo.SelectedValue.Equals("A") Then
            'Descarga por Fecha de Asignacion
            getFechaAsignacion()
        Else
            'Descarga por Fecha de Diligencia
            getFechaDiligencia()
        End If
    End Sub

    Private Sub getFechaAsignacion()
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/temp/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/temp/"))
            End If
            Dim vmes As String = DDLMes.SelectedValue
            Dim vanio As String = DDLAnio.SelectedValue
            Dim vsubdel As String = DDLSubdel.SelectedValue
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/temp/") + "CobrosFechAsigPae" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + ".csv"
            While File.Exists(nomFile)
                File.Delete(nomFile)
            End While
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''CP_SUBDEL'',''FECHA_ASIGNACION'',''ID_INSPECTOR'',''INSPECTOR'',''REGPAT'',''RAZONSOCIAL'',''CREDITO'',''PERIODO'',''DOCUMENTO'',''DILIGENCIA'',''FEC_DILIGENCIA'',''IMPORTE'',''TIPO'',''TD_ANTES'',''INC_ANTES'',''RALE_TD'',''RALE_INC'' "

            myInsertQueryDatosTable = " SELECT CP_SUBDEL,FECHA_ASIGNACION,ID_INSPECTOR,INSPECTOR,REGPAT "
            myInsertQueryDatosTable += " ,''""""''+RAZONSOCIAL+''""""'' as RAZONSOCIAL "
            myInsertQueryDatosTable += " ,CREDITO,DA.PERIODO,DOCUMENTO "
            myInsertQueryDatosTable += " ,''""""''+DILIGENCIA+''""""'' as DILIGENCIA "
            myInsertQueryDatosTable += " ,FEC_DILIGENCIA,IMPORTE,R_TIPO,R_TD,R_INC,TD,INC "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT [R_SUBDEL] as CP_SUBDEL "
            myInsertQueryDatosTable += " ,convert(varchar,[FECH_INS],103) as FECHA_ASIGNACION "
            myInsertQueryDatosTable += " ,[ID_INS] AS ID_INSPECTOR "
            myInsertQueryDatosTable += " ,(SELECT UPPER(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.id=[ID_INS]) AS INSPECTOR "
            myInsertQueryDatosTable += " ,[R_REGPATR] AS REGPAT "
            myInsertQueryDatosTable += " ,razonSocial  AS RAZONSOCIAL "
            myInsertQueryDatosTable += " ,[R_NUMCRED] AS CREDITO "
            myInsertQueryDatosTable += " ,SUBSTRING([R_PERIODO],4,7) AS PERIODO "
            myInsertQueryDatosTable += " ,(SELECT TOP 1 (CASE  "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''C'' THEN ''CITATORIO'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''M'' THEN ''MANDAMIENTO'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''A'' THEN ''AMPLIACION'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''R'' THEN ''REMOCION'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''J'' THEN ''CERRAJERO'' "
            myInsertQueryDatosTable += " ELSE ''OTRO'' "
            myInsertQueryDatosTable += " END) AS TIPO_DOC FROM ( "
            myInsertQueryDatosTable += " SELECT [PC_CODEBAR] AS CODEBAR,''CITATORIO, ''+[PC_HORA] AS DILI "
            myInsertQueryDatosTable += " ,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CITATORIO] "
            myInsertQueryDatosTable += " WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " ,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " ,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " ) AS R1 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC) AS DOCUMENTO "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " isnull((SELECT TOP 1 DILI FROM ( "
            myInsertQueryDatosTable += " SELECT [PC_CODEBAR] AS CODEBAR,''CITATORIO, ''+[PC_HORA] AS DILI "
            myInsertQueryDatosTable += " ,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CITATORIO] "
            myInsertQueryDatosTable += " WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " ) AS R1 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC),'''') "
            myInsertQueryDatosTable += " + "
            myInsertQueryDatosTable += " isnull((SELECT TOP 1 DILI FROM ( "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " ,(SELECT replace([desc_diligencia],''(foto)'','''') FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " ,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " ) as R2 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC),'''') "
            myInsertQueryDatosTable += " ) "
            myInsertQueryDatosTable += " +isnull((SELECT TOP 1 ''(''+[PR_FOLIO]+'')'' FROM [sirecacobros].[dbo].[PAE_RECIBO] where [PR_CODEBAR] like (CODE_BAR+''_''+R_NUMCRED+(R_PERIODO)+''-''+convert(varchar,R_ID))),'''') "
            myInsertQueryDatosTable += " AS DILIGENCIA "
            myInsertQueryDatosTable += " ,CONVERT(VARCHAR,( "
            myInsertQueryDatosTable += " 	SELECT TOP 1 FECH_ACC FROM ( "
            myInsertQueryDatosTable += " 	SELECT [PC_CODEBAR] AS CODEBAR,''CITATORIO, ''+[PC_HORA] AS DILI "
            myInsertQueryDatosTable += " 	,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " 	FROM [sirecacobros].[dbo].[PAE_CITATORIO] "
            myInsertQueryDatosTable += " 	WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " 	UNION ALL "
            myInsertQueryDatosTable += " 	SELECT "
            myInsertQueryDatosTable += " 	[PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " 	,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " 	,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " 	FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " 	WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " 	) AS R1 "
            myInsertQueryDatosTable += " 	ORDER BY  FECH_ACC DESC,FECH_SYS DESC "
            myInsertQueryDatosTable += " ),103) AS FEC_DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(varchar,[R_IMPORTE]) AS IMPORTE,R_TIPO,R_TD,R_INC "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CRED] LEFT JOIN sireca.dbo.patrones on regpat=[R_REGPATR] "
            myInsertQueryDatosTable += " where  "
            myInsertQueryDatosTable += " year([FECH_INS])=" + vanio + " AND month([FECH_INS])=" + vmes + " "
            myInsertQueryDatosTable += " AND [R_SUBDEL]=''" + vsubdel + "''  "
            myInsertQueryDatosTable += " ) AS DA "
            myInsertQueryDatosTable += " LEFT JOIN "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " SELECT ''COP'' AS TIPO,REGPATR,NUMCRED,PERIODO,INC,TD FROM rale.dbo.[" + getrale(vsubdel, "COP") + "] "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += " SELECT ''RCV'' AS TIPO,REGPATR,NUMCRED,PERIODO,INC,TD FROM rale.dbo.[" + getrale(vsubdel, "RCV") + "] "
            myInsertQueryDatosTable += " ) AS RA ON REPLACE(REGPATR,''-'','''')=REGPAT AND NUMCRED=CREDITO AND RA.PERIODO=(''01/''+DA.PERIODO) "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=CobrosFechAsigPae" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Private Sub getFechaDiligencia()
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/temp/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/temp/"))
            End If

            Dim vmes As String = DDLMes.SelectedValue
            Dim vanio As String = DDLAnio.SelectedValue
            Dim vsubdel As String = DDLSubdel.SelectedValue
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/temp/") + "CobrosFechDiliPae" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + ".csv"
            While File.Exists(nomFile)
                File.Delete(nomFile)
            End While
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''CP_SUBDEL'',''FECHA_ASIGNACION'',''ID_INSPECTOR'',''INSPECTOR'',''REGPAT'',''RAZONSOCIAL'',''CREDITO'',''PERIODO'',''DOCUMENTO'',''DILIGENCIA'',''FEC_DILIGENCIA'',''IMPORTE'',''TIPO'',''TD_ANTES'',''INC_ANTES'',''RALE_TD'',''RALE_INC'' "

            myInsertQueryDatosTable = "  SELECT DA.CP_SUBDEL,DA.FECHA_ASIGNACION,DA.ID_INSPECTOR,DA.INSPECTOR,DA.REGPAT,DA.RAZONSOCIAL,DA.CREDITO,DA.PERIODO,DA.DOCUMENTO,DA.DILIGENCIA,DA.FEC_DILIGENCIA,DA.IMPORTE,DA.R_TIPO,DA.R_TD,DA.R_INC,RA.TD,RA.INC FROM ( "
            myInsertQueryDatosTable += " SELECT CP_SUBDEL,convert(varchar,[FECHA_ASIGNACION],103) as FECHA_ASIGNACION,ID_INSPECTOR,INSPECTOR,REGPAT "
            myInsertQueryDatosTable += " ,''""""''+RAZONSOCIAL+''""""'' as RAZONSOCIAL "
            myInsertQueryDatosTable += " ,CREDITO,PERIODO,DOCUMENTO "
            myInsertQueryDatosTable += " ,''""""''+DILIGENCIA+''""""'' as DILIGENCIA "
            myInsertQueryDatosTable += " ,FEC_DILIGENCIA,convert(varchar,IMPORTE) AS IMPORTE,R_TIPO,R_TD,R_INC "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT [R_SUBDEL] as CP_SUBDEL,[FECH_INS] as FECHA_ASIGNACION "
            myInsertQueryDatosTable += " ,[ID_INS] AS ID_INSPECTOR "
            myInsertQueryDatosTable += " ,(SELECT UPPER(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.id=[ID_INS]) AS INSPECTOR "
            myInsertQueryDatosTable += " ,[R_REGPATR] AS REGPAT "
            myInsertQueryDatosTable += " ,razonSocial  AS RAZONSOCIAL "
            myInsertQueryDatosTable += " ,[R_NUMCRED] AS CREDITO "
            myInsertQueryDatosTable += " ,SUBSTRING([R_PERIODO],4,7) AS PERIODO "
            myInsertQueryDatosTable += " ,(SELECT TOP 1 (CASE  "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''C'' THEN ''CITATORIO'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''M'' THEN ''MANDAMIENTO'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''A'' THEN ''AMPLIACION'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''R'' THEN ''REMOCION'' "
            myInsertQueryDatosTable += " WHEN SUBSTRING([CODEBAR],17,1)=''J'' THEN ''CERRAJERO'' "
            myInsertQueryDatosTable += " ELSE ''OTRO'' "
            myInsertQueryDatosTable += " END) AS TIPO_DOC FROM ( "
            myInsertQueryDatosTable += " SELECT [PC_CODEBAR] AS CODEBAR,''CITATORIO, ''+[PC_HORA] AS DILI "
            myInsertQueryDatosTable += " ,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CITATORIO] "
            myInsertQueryDatosTable += " WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " ,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " ,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " ) AS R1 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC) AS DOCUMENTO "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " isnull( "
            myInsertQueryDatosTable += " (SELECT TOP 1 DILI FROM ( "
            myInsertQueryDatosTable += " SELECT [PC_CODEBAR] AS CODEBAR,''CITATORIO, ''+[PC_HORA] AS DILI "
            myInsertQueryDatosTable += " ,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CITATORIO] "
            myInsertQueryDatosTable += " WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " AND year(PC_FECHA)=" + vanio + " AND month(PC_FECHA)=" + vmes + " "
            myInsertQueryDatosTable += " ) AS R1 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC),'''') "
            myInsertQueryDatosTable += " + "
            myInsertQueryDatosTable += " isnull((SELECT TOP 1 DILI FROM ( "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " ,(SELECT replace([desc_diligencia],''(foto)'','''') FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " ,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " AND year(PD_FECHA)=" + vanio + " AND month(PD_FECHA)=" + vmes + " "
            myInsertQueryDatosTable += " ) as R2 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC) "
            myInsertQueryDatosTable += " ,'''') "
            myInsertQueryDatosTable += " ) "
            myInsertQueryDatosTable += " +isnull((SELECT TOP 1 ''(''+[PR_FOLIO]+'')'' FROM [sirecacobros].[dbo].[PAE_RECIBO] where [PR_CODEBAR] like (CODE_BAR+''_''+R_NUMCRED+(R_PERIODO)+''-''+convert(varchar,R_ID))),'''') "
            myInsertQueryDatosTable += " AS DILIGENCIA "
            myInsertQueryDatosTable += " ,CONVERT(VARCHAR,( "
            myInsertQueryDatosTable += " 	SELECT TOP 1 FECH_ACC FROM ( "
            myInsertQueryDatosTable += " 	SELECT [PC_CODEBAR] AS CODEBAR,''CITATORIO, ''+[PC_HORA] AS DILI "
            myInsertQueryDatosTable += " 	,PC_FECHA AS FECH_ACC,PC_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " 	FROM [sirecacobros].[dbo].[PAE_CITATORIO] "
            myInsertQueryDatosTable += " 	WHERE [PC_INSPECTOR]=[ID_INS] AND [PC_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " 	AND year(PC_FECHA)=" + vanio + " AND month(PC_FECHA)=" + vmes + " "
            myInsertQueryDatosTable += " 	UNION ALL "
            myInsertQueryDatosTable += " 	SELECT "
            myInsertQueryDatosTable += " 	[PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " 	,(SELECT [desc_diligencia] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " 	,PD_FECHA AS FECH_ACC,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " 	FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " 	WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " 	AND year(PD_FECHA)=" + vanio + " AND month(PD_FECHA)=" + vmes + " "
            myInsertQueryDatosTable += " 	) AS R1 "
            myInsertQueryDatosTable += " 	ORDER BY  FECH_ACC DESC,FECH_SYS DESC "
            myInsertQueryDatosTable += " ),103) AS FEC_DILIGENCIA "
            myInsertQueryDatosTable += " ,[R_IMPORTE] AS IMPORTE,R_TIPO,R_TD,R_INC "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CRED] LEFT JOIN sireca.dbo.patrones on regpat=[R_REGPATR] "
            myInsertQueryDatosTable += " where [R_SUBDEL]=''" + vsubdel + "'' "
            myInsertQueryDatosTable += " ) AS X "
            myInsertQueryDatosTable += " WHERE FEC_DILIGENCIA IS NOT NULL "
            myInsertQueryDatosTable += " ) AS DA "
            myInsertQueryDatosTable += " LEFT JOIN "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " SELECT ''COP'' AS TIPO,REGPATR,NUMCRED,PERIODO,INC,TD FROM rale.dbo.[" + getrale(vsubdel, "COP") + "] "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += " SELECT ''RCV'' AS TIPO,REGPATR,NUMCRED,PERIODO,INC,TD FROM rale.dbo.[" + getrale(vsubdel, "RCV") + "] "
            myInsertQueryDatosTable += " ) AS RA ON REPLACE(REGPATR,''-'','''')=REGPAT AND NUMCRED=CREDITO AND RA.PERIODO=(''01/''+DA.PERIODO) "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=CobrosFechDiliPae" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Function getrale(ByVal subdel As String, ByVal tipoCopRcv As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 name from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' order by fecha desc "

        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Do While myReaderx.Read()
            Dim vvx As Object = myReaderx.GetValue(0)
            ralex = vvx.ToString
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return ralex
    End Function

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Now.Month.ToString("D2") - 1)
    End Sub
End Class
Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class pendientescapturayseg
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LBDes0909_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDes0909.Click
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/temp/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/temp/"))
            End If
            Dim vsubdel As String = DropDownSubdel.SelectedValue
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/temp/") + "PatronesTodosCreditos09" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''REGPAT'',''RAZON'',''CREDITOS'',''IMPORTE'',''COTIZ'',''ULTIMA_EMISION'' "

            myInsertQueryDatosTable = " SELECT RALE.REGPAT "
            myInsertQueryDatosTable += ",''""""''+razonSocial+''""""'' as RAZON "
            myInsertQueryDatosTable += " ,convert(varchar,CREDITOS) as CREDITOS "
            myInsertQueryDatosTable += " ,convert(varchar,IMPORTE) as IMPORTE "
            myInsertQueryDatosTable += " ,convert(varchar,cotiz) AS COTIZ,convert(varchar,vigencia,103) AS ULTIMA_EMISION "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT REPLACE(REGPATR,''-'','''') AS REGPAT,COUNT(DISTINCT INC_RALE) AS INCIDENCIAS,COUNT(NUMCRED) AS CREDITOS,SUM(IMPORTE) AS IMPORTE FROM "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " SELECT ''COP'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.[" + getRale(vsubdel, "COP") + "] "
            myInsertQueryDatosTable += " union all "
            myInsertQueryDatosTable += " SELECT ''RCV'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.[" + getRale(vsubdel, "RCV") + "] "
            myInsertQueryDatosTable += " ) AS RALE "
            myInsertQueryDatosTable += " GROUP BY REGPATR "
            myInsertQueryDatosTable += " HAVING COUNT(DISTINCT INC_RALE)=1 AND MIN(INC_RALE) IN (''09'') "
            myInsertQueryDatosTable += " ) AS RALE "
            myInsertQueryDatosTable += " LEFT JOIN "
            myInsertQueryDatosTable += " sireca.dbo.patrones as ptn on rale.regpat=ptn.regpat "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=PatronesTodosCreditos09" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception

        End Try
    End Sub

    Private Function getRale(ByVal vsubdel As String, ByVal vtipoCopRcv As String) As String
        Dim vrale As String = ""
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 name from rale.dbo.tablas where subdel='" + vsubdel + "' and tipo='" + vtipoCopRcv + "' order by fecha desc "
        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Do While myReaderx.Read()
            vrale = myReaderx.GetValue(0).ToString
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return vrale
    End Function

    Protected Sub DropDownSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DropDownSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DropDownSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DropDownSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub LBDes0901_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDes0901.Click
        Dim nomFile As String = Server.MapPath("~/descargas/temp/") + "PatDiliEmisiones09Pendientes01" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + ".csv"
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/temp/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/temp/"))
            End If
            Dim vsubdel As String = DropDownSubdel.SelectedValue
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''REGPAT'',''RAZON'',''CREDITO'',''PERIODO'',''OMISION'',''COTIZ'',''INSPECTOR'',''FECH_DILIGENCIA'',''TIPO'',''PARA_CAMBIO'',''FOLIO_CAPTURA'',''FECH_FOLIO'',''FOLIO_REGISTRO'',''FECH_FOLIO_REGISTRO'',''INC_RALE'',''FEINC_RALE'',''FNOTIFICACION_RALE'' "

            myInsertQueryDatosTable = " SELECT REGPAT,RAZON,CREDITO,PERIODO,OMISION,COTIZ,INSPECTOR,FECH_DILIGENCIA,TIPO,PARA_CAMBIO,FOLIO_CAPTURA,FECH_FOLIO,FOLIO_REGISTRO,FECH_FOLIO_REGISTRO,INC_RALE,FEINC_RALE,FNOTIFICACION "
            myInsertQueryDatosTable += " FROM ( "

            myInsertQueryDatosTable += " SELECT REGPAT "
            myInsertQueryDatosTable += " ,''""""''+RAZON+''""""'' as RAZON "
            myInsertQueryDatosTable += " ,convert(varchar,CREDITO) as CREDITO,DATOS.PERIODO "
            myInsertQueryDatosTable += " ,convert(varchar,OMISION) as OMISION "
            myInsertQueryDatosTable += " ,convert(varchar,COTIZ) as COTIZ "
            myInsertQueryDatosTable += " ,INSPECTOR "
            myInsertQueryDatosTable += " ,convert(varchar,FECH_DILIGENCIA,103) as FECH_DILIGENCIA "
            myInsertQueryDatosTable += " ,TIPO "
            myInsertQueryDatosTable += " ,INC_RALE,FEINC_RALE,FNOTIFICACION "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT [REG#PATRONAL] AS REGPAT,[NOMBRE O RAZON SOCIAL] AS RAZON,[CREDITO],[COTIZ],[OMISION] "
            myInsertQueryDatosTable += " ,(case  "
            myInsertQueryDatosTable += " when [tipoECO] in (''COP'',''COMP'') then "
            myInsertQueryDatosTable += " (case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQueryDatosTable += " when [tipoECO] in (''RCV'',''RCVCOMP'') then "
            myInsertQueryDatosTable += " (case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQueryDatosTable += " end "
            myInsertQueryDatosTable += " ) as PERIODO "
            myInsertQueryDatosTable += " ,(select upper(nombre) from fiscamovil.dbo.usuarios as uf where uf.id=[responsable]) AS INSPECTOR "
            myInsertQueryDatosTable += " ,(case when emi.incidencia in (''9'') then emi.fechaCaptura else "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " 	SELECT top 1 hinc.fecha "
            myInsertQueryDatosTable += " 	FROM [sireca].[dbo].[HistorialInc] as hinc "
            myInsertQueryDatosTable += " 	where hinc.incidencia=''9'' and hinc.ideco=emi.id "
            myInsertQueryDatosTable += " 	order by hinc.id desc "
            myInsertQueryDatosTable += " ) end "
            myInsertQueryDatosTable += " ) as FECH_DILIGENCIA "
            myInsertQueryDatosTable += " ,(case when [tipoECO] in (''COP'',''COMP'') then ''COP'' else ''RCV'' end) as TIPO "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[eco] as emi "
            myInsertQueryDatosTable += " WHERE  "
            myInsertQueryDatosTable += " (case when emi.incidencia in (''9'') then emi.incidencia else "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " 	SELECT top 1 hinc.incidencia "
            myInsertQueryDatosTable += " 	FROM [sireca].[dbo].[HistorialInc] as hinc "
            myInsertQueryDatosTable += " 	where hinc.incidencia=''9'' and hinc.ideco=emi.id "
            myInsertQueryDatosTable += " 	order by hinc.id desc "
            myInsertQueryDatosTable += " ) end "
            myInsertQueryDatosTable += " )=''9'' AND CLAVE IS NOT NULL AND subdel=''" + vsubdel + "'' "
            myInsertQueryDatosTable += " ) AS DATOS "
            myInsertQueryDatosTable += " LEFT JOIN "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " SELECT ''COP'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.[" + getRale(vsubdel, "COP") + "] "
            myInsertQueryDatosTable += " union all "
            myInsertQueryDatosTable += " SELECT ''RCV'' as [R_TIPO],REGPATR,MOV,FMOV,SECTOR,NUMCRED,TD,FALTA,FNOTIFICACION,INC AS INC_RALE,FEINC AS FEINC_RALE,DIAS,IMPORTE,PERIODO FROM rale.dbo.[" + getRale(vsubdel, "RCV") + "] "
            myInsertQueryDatosTable += " ) AS RALE ON SUBSTRING(REGPAT,1,10)=REPLACE(REGPATR,''-'','''') AND CREDITO=NUMCRED AND DATOS.PERIODO=SUBSTRING(RALE.PERIODO,4,7) "
            myInsertQueryDatosTable += " where inc_rale=''01'' "

            myInsertQueryDatosTable += " ) AS DX "
            myInsertQueryDatosTable += " LEFT JOIN "
            myInsertQueryDatosTable += " (SELECT "
            myInsertQueryDatosTable += " [V_REGPAT] "
            myInsertQueryDatosTable += " ,[V_CREDITO] "
            myInsertQueryDatosTable += " ,[V_PERIODO] "
            myInsertQueryDatosTable += " ,[V_INC_CAPTURA] AS PARA_CAMBIO "
            myInsertQueryDatosTable += " ,[V_FOLIO_P1] AS FOLIO_CAPTURA "
            myInsertQueryDatosTable += " ,CONVERT(VARCHAR,[V_FECHA_P1_TURNADO],103) AS FECH_FOLIO "
            myInsertQueryDatosTable += " ,[V_FOLIO_P2] AS FOLIO_REGISTRO "
            myInsertQueryDatosTable += " ,CONVERT(VARCHAR,[V_FECHA_P2_TURNADO],103) AS FECH_FOLIO_REGISTRO "
            myInsertQueryDatosTable += "  FROM [sirecaemisiones].[dbo].[eco]) AS FX ON V_REGPAT=REGPAT AND V_CREDITO=CREDITO AND V_PERIODO=PERIODO "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=PatDiliEmisiones09Pendientes01" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)

            'Response.Clear()
            'Response.BufferOutput = False
            'Response.ContentType = "application/zip"
            'Response.AddHeader("content-disposition", "filename=PatDiliEmisiones09Pendientes01" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            'Using zip As ZipFile = New ZipFile
            '    zip.AddFile(nomFile, "")
            '    zip.Save(Response.OutputStream)
            '    'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            'End Using
            'Response.Close()
        End Try
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub LBCobros09_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCobros09.Click
        Dim nomFile As String = Server.MapPath("~/descargas/temp/") + "PatDiliCobros09Pendientes" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + ".csv"
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/temp/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/temp/"))
            End If
            Dim vsubdel As String = DropDownSubdel.SelectedValue
            Dim vmes As String = DDLMes.SelectedValue
            Dim vanio As String = DDLAnio.SelectedValue
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''CP_SUBDEL'',''FECHA_ASIGNACION'',''ID_INSPECTOR'',''INSPECTOR'',''REGPAT'',''RAZONSOCIAL'',''CREDITO'',''PERIODO'',''DOCUMENTO'',''DILIGENCIA'',''FEC_DILIGENCIA'',''IMPORTE'',''R_TIPO'',''R_TD'',''R_INC'',''R_FEINC'',''TD'',''INC'',''FEINC'',''RESULTADO'' "

            myInsertQueryDatosTable = " SELECT DA.CP_SUBDEL "
            myInsertQueryDatosTable += " ,DA.FECHA_ASIGNACION "
            myInsertQueryDatosTable += " ,DA.ID_INSPECTOR,DA.INSPECTOR,DA.REGPAT,DA.RAZONSOCIAL,DA.CREDITO,DA.PERIODO,DA.DOCUMENTO,DA.DILIGENCIA,DA.FEC_DILIGENCIA "
            myInsertQueryDatosTable += " ,DA.IMPORTE "
            myInsertQueryDatosTable += " ,DA.R_TIPO,DA.R_TD,DA.R_INC,CONVERT(VARCHAR,DA.R_FEINC,103) AS R_FEINC,RA.TD,RA.INC,RA.FEINC as FEINC "
            myInsertQueryDatosTable += " ,(CASE "
            myInsertQueryDatosTable += " WHEN convert(datetime,DA.FEC_DILIGENCIA,103)>convert(datetime,RA.FEINC,103) THEN ''SIN CAMBIO''  "
            myInsertQueryDatosTable += " WHEN RA.FEINC IS NULL THEN ''DEPURADO''  "
            myInsertQueryDatosTable += " ELSE ''ACTUALIZADO'' END) AS RESULTADO "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT CP_SUBDEL,convert(varchar,[FECHA_ASIGNACION],103) as FECHA_ASIGNACION,ID_INSPECTOR,INSPECTOR,REGPAT "
            myInsertQueryDatosTable += " ,''""""''+RAZONSOCIAL+''""""'' as RAZONSOCIAL "
            myInsertQueryDatosTable += " ,CREDITO,PERIODO,DOCUMENTO "
            myInsertQueryDatosTable += " ,DILIGENCIA as DILIGENCIA "
            myInsertQueryDatosTable += " ,FEC_DILIGENCIA,convert(varchar,IMPORTE) AS IMPORTE,R_TIPO,R_TD,R_INC,R_FEINC "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT [R_SUBDEL] as CP_SUBDEL,[FECH_INS] as FECHA_ASIGNACION "
            myInsertQueryDatosTable += " ,[ID_INS] AS ID_INSPECTOR "
            myInsertQueryDatosTable += " ,(SELECT UPPER(uf.nombre) FROM fiscamovil.dbo.usuarios AS uf WHERE uf.id=[ID_INS]) AS INSPECTOR "
            myInsertQueryDatosTable += " ,[R_REGPATR] AS REGPAT "
            myInsertQueryDatosTable += " ,razonSocial  AS RAZONSOCIAL "
            myInsertQueryDatosTable += " ,[R_NUMCRED] AS CREDITO "
            myInsertQueryDatosTable += " ,SUBSTRING([R_PERIODO],4,7) AS PERIODO "
            myInsertQueryDatosTable += " ,(SELECT TOP 1 (CASE "
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
            myInsertQueryDatosTable += " ,isnull((SELECT TOP 1 DILI FROM ( "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [PD_CODEBAR] AS CODEBAR "
            myInsertQueryDatosTable += " ,(SELECT [cve_rale] FROM [sirecacobros].[dbo].[cae_diligencia] WHERE [id_diligencia]=[PD_DILIGENCIA]) AS DILI "
            myInsertQueryDatosTable += " ,PD_FECHA AS FECH_ACC "
            myInsertQueryDatosTable += " ,PD_FECH_SYSTEM AS FECH_SYS "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_DILIGENCIA] "
            myInsertQueryDatosTable += " WHERE [PD_INSPECTOR]=[ID_INS] AND [PD_R_ID]=[R_ID] "
            myInsertQueryDatosTable += " AND year(PD_FECHA)=" + vanio + " AND month(PD_FECHA)=" + vmes + " "
            myInsertQueryDatosTable += " ) as R2 "
            myInsertQueryDatosTable += " ORDER BY  FECH_ACC DESC,FECH_SYS DESC) "
            myInsertQueryDatosTable += " ,'''') "
            myInsertQueryDatosTable += " AS DILIGENCIA"
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
            myInsertQueryDatosTable += " ,[R_IMPORTE] AS IMPORTE,R_TIPO,R_TD,R_INC,R_FEINC "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[PAE_CRED] LEFT JOIN sireca.dbo.patrones on regpat=[R_REGPATR] "
            myInsertQueryDatosTable += " where [R_SUBDEL]=''" + vsubdel + "'' "
            myInsertQueryDatosTable += " ) AS X "
            myInsertQueryDatosTable += " WHERE FEC_DILIGENCIA IS NOT NULL "
            myInsertQueryDatosTable += " ) AS DA "
            myInsertQueryDatosTable += " LEFT JOIN "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " SELECT ''COP'' AS TIPO,REGPATR,NUMCRED,PERIODO,INC,TD,FEINC FROM rale.dbo.[" + getRale(vsubdel, "COP") + "] "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += " SELECT ''RCV'' AS TIPO,REGPATR,NUMCRED,PERIODO,INC,TD,FEINC FROM rale.dbo.[" + getRale(vsubdel, "RCV") + "] "
            myInsertQueryDatosTable += " ) AS RA ON REPLACE(REGPATR,''-'','''')=REGPAT AND NUMCRED=CREDITO AND RA.PERIODO=(''01/''+DA.PERIODO) "
            myInsertQueryDatosTable += " WHERE DILIGENCIA=''09'' "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=PatDiliCobros09Pendientes" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=PatDiliCobros09Pendientes" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        End Try
    End Sub
End Class
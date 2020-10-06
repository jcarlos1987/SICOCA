Imports System.Data.OleDb
Imports Ionic.Zip
Imports System.IO

Public Class cargarAsig
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
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

    Private Sub cargarAsig(ByVal vruta As String)
        Try
            Dim vidSession As String = Session.Item("SIRECAid").ToString
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from tempdb.dbo.sysobjects where name = 'cobrosC" + vidSession + "') "
            textConmand += " begin "
            textConmand += " drop table tempdb.dbo.cobrosC" + vidSession + " "
            textConmand += " end "
            textConmand += " CREATE TABLE [tempdb].[dbo].[cobrosC" + vidSession + "]( "
            textConmand += " [R_TIPO] [varchar](3) NULL, "
            textConmand += " [R_REGPATR] [nvarchar](25) NULL, "
            textConmand += " [R_NUMCRED] [nvarchar](18) NULL, "
            textConmand += " [R_INC] [nvarchar](5) NULL, "
            textConmand += " [R_FEINC] [datetime] NULL, "
            textConmand += " [R_DIAS] [int] NULL, "
            textConmand += " [R_IMPORTE] [money] NULL, "
            textConmand += " [R_PERIODO] [nvarchar](50) NULL, "
            textConmand += " [R_TD] [nvarchar](4) NULL, "
            textConmand += " [R_FALTA] [datetime] NULL, "
            textConmand += " [R_FNOTIFICACION] [datetime] NULL, "
            textConmand += " [D_CIT_SUP] [varchar](1) NOT NULL, "
            textConmand += " [D_MAN_SUP] [varchar](1) NOT NULL, "
            textConmand += " [D_AMP_SUP] [varchar](1) NOT NULL, "
            textConmand += " [D_REM_SUP] [varchar](1) NOT NULL, "
            textConmand += " [D_CER_SUP] [varchar](1) NOT NULL, "
            textConmand += " [ID_INS] [varchar](15) NOT NULL, "
            textConmand += " [FECH_INS] [varchar](10) NOT NULL, "
            textConmand += " [SECTOR] [nvarchar](50) NULL, "
            textConmand += " [RAZON_SOCIAL] [nvarchar](500) NULL "

            textConmand += " ) ON [PRIMARY] "
            textConmand += " BULK INSERT [tempdb].[dbo].[cobrosC" + vidSession + "] "
            textConmand += " FROM '" + vruta + "' "
            textConmand += " WITH( "
            textConmand += " FIELDTERMINATOR=',', "
            textConmand += " FIRSTROW=2, " ' 
            textConmand += " ROWTERMINATOR='\n', "
            textConmand += " FIRE_TRIGGERS "
            textConmand += " ) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
            completadorCreTdInc()
            agregarAsig(vidSession)
        Catch ex As Exception
            Response.Write(ex.StackTrace + "----------------------------------------")
        End Try
    End Sub
    Private Sub completadorCreTdInc()
        Try
            Dim vidSession As String = Session.Item("SIRECAid").ToString
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " update [tempdb].[dbo].[cobrosC" + vidSession + "] "
            textConmand += " SET [R_NUMCRED]=(case  "
            textConmand += " when len([R_NUMCRED])=7 then '00'+[R_NUMCRED] "
            textConmand += " when len([R_NUMCRED])=8 then '0'+[R_NUMCRED] "
            textConmand += " else [R_NUMCRED] "
            textConmand += " end) "
            textConmand += " ,[R_INC]=(case  "
            textConmand += " when len([R_INC])=1 then '0'+[R_INC] "
            textConmand += " else [R_INC] "
            textConmand += " end) "
            textConmand += " ,[R_TD]=(case  "
            textConmand += " when len([R_TD])=1 then '0'+[R_TD] "
            textConmand += " else [R_TD] "
            textConmand += " end) "
            textConmand += " FROM [tempdb].[dbo].[cobrosC" + vidSession + "] "
            textConmand += " where (len([R_NUMCRED]) not in (9) or len([R_TD]) not in (2)) "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
            agregarAsig(vidSession)
        Catch ex As Exception
            Response.Write(ex.StackTrace + "----------------------------------------")
        End Try
    End Sub
    Private Sub agregarAsig(ByVal vidSession As String)
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " insert into sirecacobros.dbo.PAE_CRED "
            textConmand += " SELECT [R_TIPO] "
            textConmand += " ,[R_GRUPO]='COBRO' "
            textConmand += " ,[R_SUBDEL]='" + DDLSubdel.SelectedValue + "' "
            textConmand += " ,[R_REGPATR],[R_NUMCRED],[R_INC],[R_FEINC],[R_DIAS],[R_IMPORTE],[R_PERIODO],[R_TD],[R_FALTA],[R_FNOTIFICACION] "
            textConmand += " ,'" + vidSession + "' "
            textConmand += " ,[FECH_SUP]=getdate(),[D_CIT_SUP],[D_MAN_SUP],[D_AMP_SUP] "
            textConmand += " ,[D_REM_SUP],[D_CER_SUP],[ID_INS],[FECH_INS],[FECH_DOC]=getdate() "
            textConmand += " ,[ACTIVO]='1111' "
            textConmand += " ,[CODE_BAR]=([R_REGPATR]+(case when len(day(getdate()))=1 then '0'+convert(nvarchar(2),day(getdate())) else convert(nvarchar(2),day(getdate())) end) "
            textConmand += " +(case when len(month(getdate()))=1 then '0'+convert(nvarchar(2),month(getdate())) else convert(nvarchar(2),month(getdate())) end) "
            textConmand += " + substring(convert(nvarchar(4),year(getdate())),3,2)) "
            textConmand += " ,[CODE_QR]=(substring([R_REGPATR],2,5)+(case when len(day(getdate()))=1 then '0'+convert(nvarchar(2),day(getdate())) else convert(nvarchar(2),day(getdate())) end) "
            textConmand += " +(case when len(month(getdate()))=1 then '0'+convert(nvarchar(2),month(getdate())) else convert(nvarchar(2),month(getdate())) end) "
            textConmand += " + substring(convert(nvarchar(4),year(getdate())),3,2) "
            textConmand += " +substring([R_REGPATR],6,5)),[SECTOR],replace([RAZON_SOCIAL],'_C_',',') "
            textConmand += " ,[R_FOLIO_MANDAMIENTO]=NULL "
            textConmand += " ,[R_FOLIO_AMPLIACION]=NULL "
            '---------------------------------------------------
            textConmand += " FROM [tempdb].[dbo].[cobrosC" + vidSession + "] as c "
            textConmand += " where "
            textConmand += " exists(SELECT TOP 1 [id] FROM [sireca].[dbo].[usuarios] where [userPae2]='1' and subdel='" + DDLSubdel.SelectedValue + "' and [id]=ID_INS) "
            textConmand += " and not exists(select exn.r_id  "
            textConmand += " from sirecacobros.dbo.PAE_CRED as exn  "
            textConmand += " where exn.r_numcred=c.r_numcred "
            textConmand += " and exn.[R_PERIODO]=c.[R_PERIODO] "
            textConmand += " and exn.[CODE_BAR]=(c.[R_REGPATR] "
            textConmand += " +(case when len(day(getdate()))=1 then '0'+convert(nvarchar(2),day(getdate())) else convert(nvarchar(2),day(getdate())) end) "
            textConmand += " +(case when len(month(getdate()))=1 then '0'+convert(nvarchar(2),month(getdate())) else convert(nvarchar(2),month(getdate())) end) "
            textConmand += " + substring(convert(nvarchar(4),year(getdate())),3,2)) "
            textConmand += " ) "

            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Private Sub getfoliarMandamiento()
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " select R_SUBDEL,R_TIPO,CODE_BAR "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " where [R_FOLIO_MANDAMIENTO] is null "
        textConmand += " and D_MAN_SUP='1' and R_SUBDEL='" + DDLSubdel.SelectedValue + "' "
        textConmand += " group by R_SUBDEL,R_TIPO,CODE_BAR "

        catCMD.CommandText = textConmand
        nwindConn.Open()

        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            getfolioMandamiento(myReader.GetValue(0).ToString, myReader.GetValue(1).ToString, myReader.GetValue(2).ToString)
        Loop
        myReader.Close()
        nwindConn.Close()
    End Sub
    Private Sub getfoliarAmpliacion()
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " select R_SUBDEL,R_TIPO,CODE_BAR "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " where [R_FOLIO_AMPLIACION] is null "
        textConmand += " and D_AMP_SUP='1' and R_SUBDEL='" + DDLSubdel.SelectedValue + "' "
        textConmand += " group by R_SUBDEL,R_TIPO,CODE_BAR "

        catCMD.CommandText = textConmand
        nwindConn.Open()

        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            getfolioAmpliacion(myReader.GetValue(0).ToString, myReader.GetValue(1).ToString, myReader.GetValue(2).ToString)
        Loop
        myReader.Close()
        nwindConn.Close()
    End Sub
    Private Sub getfolioMandamiento(ByVal vsubdel As String, ByVal vtipoCopRcv As String, ByVal vcodebar As String)
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()

        Dim textConmand As String = " update [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " set R_FOLIO_MANDAMIENTO='" + getfolioNuevoMandamiento(vsubdel, vtipoCopRcv) + "' "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " where month(convert(varchar,[FECH_SUP],103))=month(getdate()) and year(convert(varchar,[FECH_SUP],103))=year(getdate()) "
        textConmand += " and [D_MAN_SUP]='1' AND R_SUBDEL='" + vsubdel + "' AND R_TIPO='" + vtipoCopRcv + "' and R_FOLIO_MANDAMIENTO is null "
        textConmand += " and CODE_BAR='" + vcodebar + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        'Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        'Do While myReader.Read()
        '    vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        'Loop
        'myReader.Close()
        nwindConn.Close()
    End Sub
    Private Sub getfolioAmpliacion(ByVal vsubdel As String, ByVal vtipoCopRcv As String, ByVal vcodebar As String)
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()

        Dim textConmand As String = " update [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " set R_FOLIO_AMPLIACION='" + getfolioNuevoAmpliacion(vsubdel, vtipoCopRcv) + "' "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " where month(convert(varchar,[FECH_SUP],103))=month(getdate()) and year(convert(varchar,[FECH_SUP],103))=year(getdate()) "
        textConmand += " and [D_AMP_SUP]='1' AND R_SUBDEL='" + vsubdel + "' AND R_TIPO='" + vtipoCopRcv + "' and R_FOLIO_AMPLIACION is null "
        textConmand += " and CODE_BAR='" + vcodebar + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        'Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        'Do While myReader.Read()
        '    vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        'Loop
        'myReader.Close()
        nwindConn.Close()
    End Sub
    Private Function getfolioNuevoMandamiento(ByVal vsubdel As String, ByVal vtipoCopRcv As String) As String
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " SELECT "
        textConmand += " (ISNULL(max(valor.R_FOLIO_MANDAMIENTO),0)+1) as FOLIO "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] as valor "
        textConmand += " where month(convert(varchar,valor.[FECH_DOC],103))=month(getdate()) and year(convert(varchar,valor.[FECH_DOC],103))=year(getdate()) "
        textConmand += " and valor.[D_MAN_SUP]='1' AND valor.R_SUBDEL='" + vsubdel + "' AND valor.R_TIPO='" + vtipoCopRcv + "' "
        textConmand += " group by valor.R_SUBDEL "
        catCMD.CommandText = textConmand
        nwindConn.Open()

        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        Loop
        myReader.Close()
        nwindConn.Close()
        Return vfolio
    End Function
    Private Function getfolioNuevoAmpliacion(ByVal vsubdel As String, ByVal vtipoCopRcv As String) As String
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " SELECT "
        textConmand += " (ISNULL(max(valor.R_FOLIO_AMPLIACION),0)+1) as FOLIO "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] as valor "
        textConmand += " where month(convert(varchar,valor.[FECH_DOC],103))=month(getdate()) and year(convert(varchar,valor.[FECH_DOC],103))=year(getdate()) "
        textConmand += " and valor.[D_AMP_SUP]='1' AND valor.R_SUBDEL='" + vsubdel + "' AND valor.R_TIPO='" + vtipoCopRcv + "' "
        textConmand += " group by valor.R_SUBDEL "
        catCMD.CommandText = textConmand
        nwindConn.Open()

        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        Loop
        myReader.Close()
        nwindConn.Close()
        Return vfolio
    End Function
    Protected Sub LBCCPAE_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCCPAE.Click
        If Not FileUploadCPAE.FileName.Equals("") Then
            Dim vruta As String = Server.MapPath("~") + "\temp\PAE" & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FileUploadCPAE.FileName
            FileUploadCPAE.SaveAs(vruta)
            cargarAsig(vruta)
            getfoliarMandamiento()
            getfoliarAmpliacion()
            Response.Redirect("~/cobrosv2/patroneselegidos.aspx")
        End If
    End Sub

    Protected Sub HLDesFormato_Click(ByVal sender As Object, ByVal e As EventArgs) Handles HLDesFormato.Click
        Try
            Dim nombreFile = "listado_Ejecutores" + DDLSubdel.SelectedValue
            If Not Directory.Exists(Server.MapPath("~/descargas/inspector")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/inspector"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 1 "
            'myInsertQuery22 += " RECONFIGURE "            
            myInsertQuery22 += " exec xp_cmdshell 'bcp "" SELECT ''INSPECTOR'',''ID_INSPECTOR'' "
            myInsertQuery22 += " UNION ALL SELECT (select upper(uf.nombre) from fiscamovil.dbo.usuarios as uf where uf.[id]=us.[id]) as INSPECTOR "
            myInsertQuery22 += " ,convert(varchar(6),us.[id]) as ID_INSPECTOR FROM [sireca].[dbo].[usuarios] as us "
            myInsertQuery22 += " where (us.[userPae2]=''1'') and us.subdel=''" & DDLSubdel.SelectedValue & "'' "
            myInsertQuery22 += " "" queryout """ + Server.MapPath("~/descargas/inspector/") + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 0 "
            'myInsertQuery22 += " RECONFIGURE "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
            '---------------------------------------------
            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + nombreFile + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(Server.MapPath("~") + "/descargas/inspector/" + nombreFile + ".csv", "")
                zip.AddFile(Server.MapPath("~") + "/manuales/CargaDeAsignacionesPAE.pdf", "")
                zip.AddFile(Server.MapPath("~") + "/manuales/FORMATO_CARGA_ASIG_PAE.xlsx", "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.Message & " _ " & ex.StackTrace)
        End Try
    End Sub

    Protected Sub HLRaleDep_Click(ByVal sender As Object, ByVal e As EventArgs) Handles HLRaleDep.Click
        Try
            Dim nombreFile = "RALE_Depuracion_" + Session.Item("SIRECAid").ToString + DDLSubdel.SelectedValue
            Dim vsubdel As String = DDLSubdel.SelectedValue
            If Not Directory.Exists(Server.MapPath("~/descargas/inspector")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/inspector"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " exec xp_cmdshell 'bcp "" "
            'CONSULTA
            myInsertQuery22 += " select ''TIPO'',''REGPATR'',''NUMCRED'',''INC'',''FEINC'',''DIAS'',''IMPORTE'',''PERIODO'',''TD'',''FALTA'',''FNOTIFICACION'',''MOV'',''FMOV'',''SECTOR'',''RAZON'',''LOCALIDAD'',''CP'',''DOMICILIO'',''COTIZANTES'',''IMPORTE_DP'',''CREDITO_DP'',''FECHA_MOV_DP'',''PAGO_DP'',''pago_tipo'',''ACC_ANT'' "
            myInsertQuery22 += " union all "
            myInsertQuery22 += " SELECT "
            myInsertQuery22 += " r.TIPO,r.REGPATR,r.NUMCRED,r.INC,r.FEINC,convert(varchar,r.DIAS),convert(varchar,r.IMPORTE),r.PERIODO,r.TD,r.FALTA,r.FNOTIFICACION,r.MOV,r.FMOV,r.SECTOR "
            myInsertQuery22 += " ,ptn.razonSocial "
            myInsertQuery22 += " ,(case when len(ptn.loc)=40 then substring(ptn.loc,1,len(ptn.loc)-5) else ptn.loc end) as localidad "
            myInsertQuery22 += " ,(case when len(ptn.loc)=40 then substring(ptn.loc,len(ptn.loc)-5,6) else '''' end) as cp "
            myInsertQuery22 += " ,ptn.dom,convert(varchar,ptn.cotiz) "
            myInsertQuery22 += " ,convert(varchar,p.IMPORTE) as IMPORTE_DP,p.CREDITO as CREDITO_DP,p.FECHA_MOV as FECHA_MOV_DP,p.PAGO as PAGO_DP "
            myInsertQuery22 += " ,(case "
            myInsertQuery22 += " when r.numcred in (p.credito) and p.importe=r.importe then ''CREDITO igual y PAGO igual'' "
            myInsertQuery22 += " when r.numcred in (p.credito) and p.importe>r.importe then ''CREDITO igual y PAGO mayor'' "
            myInsertQuery22 += " when r.numcred in (p.credito) and p.importe<r.importe then ''CREDITO igual y PAGO menor'' "
            myInsertQuery22 += " when r.numcred not in (p.credito) and p.importe=r.importe then ''CREDITO diferente y PAGO igual'' "
            myInsertQuery22 += " when r.numcred not in (p.credito) and p.importe>r.importe then ''CREDITO diferente y PAGO mayor'' "
            myInsertQuery22 += " when r.numcred not in (p.credito) and p.importe<r.importe then ''CREDITO diferente y PAGO menor'' "
            myInsertQuery22 += " when p.importe in (r.importe) then ''PAGO igual y CREDITO diferente'' "
            myInsertQuery22 += " when p.importe>r.importe then ''PAGO mayor y CREDITO diferente'' "
            myInsertQuery22 += " when p.importe<r.importe then ''PAGO menor y CREDITO diferente'' "
            myInsertQuery22 += " when r.numcred in (p.credito) then ''PAGO 0 y CREDITO igual'' "
            myInsertQuery22 += " when r.numcred not in (p.credito) then ''PAGO 0 y CREDITO diferente'' "
            myInsertQuery22 += " else '''' "
            myInsertQuery22 += " end) as pago_tipo "
            myInsertQuery22 += " ,ACC_ANT "
            myInsertQuery22 += " FROM ( "
            myInsertQuery22 += " SELECT TIPO,REPLACE(REGPATR,''-'','''') AS REGPATR,NUMCRED,INC,FEINC,DIAS,IMPORTE,PERIODO,TD,FALTA,FNOTIFICACION,MOV,FMOV,SECTOR FROM ( "
            myInsertQuery22 += " select ''COP'' AS TIPO,* from rale.dbo.[" + getrale(vsubdel, "COP") + "] "
            myInsertQuery22 += " union all "
            myInsertQuery22 += " select ''RCV'' AS TIPO,* from rale.dbo.[" + getrale(vsubdel, "RCV") + "] "
            myInsertQuery22 += " ) AS rale) AS r "
            myInsertQuery22 += " left join  "
            myInsertQuery22 += " ( "
            myInsertQuery22 += " SELECT  "
            myInsertQuery22 += " ''MANDAMIENTO'' as ACC_ANT,AC_RA_REGPATR,AC_RA_NUMCRED,AC_RA_PERIODO "
            myInsertQuery22 += " FROM [sirecacobros].[dbo].[CO_ACCIONES] as acc "
            myInsertQuery22 += " WHERE [AC_DOC_ENTRGADO] in (''1'') and [AC_SUBDEL]=''" + vsubdel + "'' "
            myInsertQuery22 += " group by AC_RA_REGPATR,AC_RA_NUMCRED,AC_RA_PERIODO "
            myInsertQuery22 += " ) as a on r.REGPATR=AC_RA_REGPATR and r.NUMCRED=AC_RA_NUMCRED and r.PERIODO=AC_RA_PERIODO "
            myInsertQuery22 += " LEFT JOIN "
            myInsertQuery22 += " (SELECT DISTINCT TIPO,REGPAT,PERIODO,IMPORTE,CREDITO,FECHA_MOV,PAGO FROM ( "
            '--LGP 
            myInsertQuery22 += " SELECT ''LGP'' AS PAGO,''COP'' AS TIPO,substring([RC_PATRON],2,8)+[RC_MOD] AS REGPAT "
            myInsertQuery22 += " ,''01/''+SUBSTRING([RC_PER],6,2)+''/''+SUBSTRING([RC_PER],1,4) AS PERIODO "
            myInsertQuery22 += " ,[RC_CRED] AS CREDITO,CONVERT(VARCHAR,MAX([RC_FEC_MOV]),103) AS FECHA_MOV,SUM([RC_IMP_TOT]) AS IMPORTE "
            myInsertQuery22 += " FROM [lgp].[dbo].[RC] WHERE [RC_IMP_TOT]>0 "
            myInsertQuery22 += " GROUP BY substring([RC_PATRON],2,8)+[RC_MOD],[RC_PER],[RC_CRED] "
            myInsertQuery22 += " UNION ALL "
            '--SIPARE 
            myInsertQuery22 += " SELECT ''SIPARE'' AS PAGO,''COP'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT "
            myInsertQuery22 += " ,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO "
            myInsertQuery22 += " ,''%'' AS CREDITO "
            myInsertQuery22 += " ,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV "
            myInsertQuery22 += " ,SUM([ImporteIMSS]) AS IMPORTE "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[sipare] WHERE [ImporteIMSS]>0 "
            myInsertQuery22 += " and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate()) "
            myInsertQuery22 += " and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate()) "
            myInsertQuery22 += " GROUP BY [RegistroPatronal],[PeriodoPago] "
            myInsertQuery22 += " UNION ALL "
            myInsertQuery22 += " SELECT ''SIPARE'' AS PAGO,''RCV'' AS TIPO,SUBSTRING([RegistroPatronal],1,10) AS REGPAT,''01/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),5,2)+''/''+SUBSTRING(CONVERT(VARCHAR,[PeriodoPago]),1,4) AS PERIODO,''NNNNNNNNN'' AS CREDITO "
            myInsertQuery22 += " ,CONVERT(VARCHAR,MAX([FechaPago])) AS FECHA_MOV "
            myInsertQuery22 += " ,SUM([ImporteRCV]) AS IMPORTE "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[sipare] WHERE [ImporteRCV]>0 "
            myInsertQuery22 += " and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),1,4)=year(getdate()) "
            myInsertQuery22 += " and substring(replace(CONVERT(VARCHAR,[FechaPago]),''.'',''''),5,2)=month(getdate()) "
            myInsertQuery22 += " GROUP BY [RegistroPatronal],[PeriodoPago] "
            myInsertQuery22 += " UNION ALL "
            '--PROCESAR
            myInsertQuery22 += " SELECT ''PROCESAR'' AS PAGO,''COP'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT "
            myInsertQuery22 += " ,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO "
            myInsertQuery22 += " ,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_COP]) AS IMPORTE "
            myInsertQuery22 += " FROM [procesar].[dbo].[RCPRO] "
            myInsertQuery22 += " WHERE [RCP_IMP_COP]>0 "
            myInsertQuery22 += " and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate()) "
            myInsertQuery22 += " GROUP BY [RCP_REGPAT],[RCP_PER] "
            myInsertQuery22 += " UNION ALL "
            myInsertQuery22 += " SELECT ''PROCESAR'' AS PAGO,''RCV'' AS TIPO,substring([RCP_REGPAT],1,10) AS REGPAT "
            myInsertQuery22 += " ,''01/''+SUBSTRING([RCP_PER],6,2)+''/''+SUBSTRING([RCP_PER],1,4) AS PERIODO "
            myInsertQuery22 += " ,''%'' AS CREDITO,CONVERT(VARCHAR,MAX([RCP_FEC_MOV]),103) AS FECHA_MOV,SUM([RCP_IMP_RCV]) AS IMPORTE "
            myInsertQuery22 += " FROM [procesar].[dbo].[RCPRO] "
            myInsertQuery22 += " WHERE [RCP_IMP_RCV]>0 "
            myInsertQuery22 += " and year(RCP_FEC_MOV)=year(getdate()) and month(RCP_FEC_MOV)=month(getdate()) "
            myInsertQuery22 += " GROUP BY [RCP_REGPAT],[RCP_PER] "
            myInsertQuery22 += " ) AS pagos) AS p on r.tipo=p.tipo and r.regpatr=p.regpat and r.periodo=p.periodo and r.numcred like p.credito "
            myInsertQuery22 += " left join sireca.dbo.patrones as ptn "
            myInsertQuery22 += " on r.regpatr=ptn.regpat "

            myInsertQuery22 += " "" queryout """ + Server.MapPath("~/descargas/inspector/") + nombreFile + ".csv"" -T -c -C -t"","" -r""\n"" ' "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
            '---------------------------------------------
            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + nombreFile + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(Server.MapPath("~") + "/descargas/inspector/" + nombreFile + ".csv", "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.Message & " _ " & ex.StackTrace)
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
End Class
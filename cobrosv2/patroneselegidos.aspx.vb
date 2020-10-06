Imports System.Data.OleDb
Imports Ionic.Zip
Imports System.IO

Public Class patroneselegidos
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'GridView1.DataBind()
    End Sub

    Protected Function setAreaEnvio(ByVal vregpat As String, ByVal vinspector As String, ByVal voficina As String) As Int16
        Dim hecho As Int16 = 0
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " UPDATE [sirecacobros].[dbo].[PAE_DILIGENCIA] "
        textConmand += " SET [PD_OFICINA] = '" + voficina + "' "
        textConmand += " where substring([PD_CODEBAR],1,10)='" + vregpat + "' and [PD_INSPECTOR]='" + vinspector + "' and [PD_OFICINA]='' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        hecho = catCMD.ExecuteNonQuery()
        nwindConn.Close()
        GridView1.DataBind()
        Return hecho
    End Function
    Private Sub generarListadoImpresion(ByVal vsubdel As String, ByVal vfecha As String)
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/pae/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/pae/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/pae/") + "listado" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + ".sicoca"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryDatosTable = " SELECT R_SUBDEL+''-''+CONVERT(VARCHAR,FECH_SUP,103)+''-''+INSPECTOR "
            ' " --CITATORIO COP MANDAMIENTO"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (1,2) AND D_MAN_SUP IN (1,2) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=M'' "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CITATORIO COP AMPLIACION"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (1,2) AND D_AMP_SUP IN (1,2) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=A'' "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CITATORIO COP REMOCION"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (1,2) AND D_REM_SUP IN (1,2) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=R'' "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CITATORIO COP CERAJERO"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (1,2) AND D_CER_SUP IN (1,2) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=J'' "
            myInsertQueryDatosTable += " END),'''') "

            ' " --CITATORIO RCV MANDAMIENTO"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (2,3) AND D_MAN_SUP IN (2,3) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=M'' "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CITATORIO RCV AMPLIACION"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (2,3) AND D_AMP_SUP IN (2,3) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=A'' "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CITATORIO RCV REMOCION"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (2,3) AND D_REM_SUP IN (2,3) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=R'' "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CITATORIO RCV CERRAJERO"
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CIT_SUP IN (2,3) AND D_CER_SUP IN (2,3) THEN '';d=citatorio&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) + ''&citdoc=J'' "
            myInsertQueryDatosTable += " END),'''') "

            ' " --MANDAMIENTO "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_MAN_SUP IN (1,2) THEN '';d=mandamiento&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_MAN_SUP IN (2,3) THEN '';d=mandamiento&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' + CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') "
            ' " --AMPLIACION "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_AMP_SUP IN (1,2) THEN '';d=ampliacion&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' +CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_AMP_SUP IN (2,3) THEN '';d=ampliacion&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' +CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') "
            ' " --REMOCION "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_REM_SUP IN (1,2) THEN '';d=remocion&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=COP'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' +CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_REM_SUP IN (2,3) THEN '';d=remocion&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=RCV'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' +CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') "
            ' " --CERRAJERO "
            myInsertQueryDatosTable += " +ISNULL((CASE "
            myInsertQueryDatosTable += " WHEN D_CER_SUP IN (1,2,3) THEN '';d=cerrajero&export=pdf&r=''+REPLACE([R_REGPATR],''-'','''')+''&a=1&s=''+[R_SUBDEL]+''&tp=%'' + ''&codbar='' + CODE_BAR + ''&inspec='' + convert(varchar,ID_INSPECTOR) + ''&fecha='' +CONVERT(VARCHAR,FECH_SUP,103) "
            myInsertQueryDatosTable += " END),'''') AS DATOS "
            myInsertQueryDatosTable += " FROM (SELECT [R_SUBDEL],REPLACE([R_REGPATR],''-'','''') AS [R_REGPATR],isnull(MAX(ID_INS),'''') as ID_INSPECTOR "
            myInsertQueryDatosTable += " ,isnull((select upper(nombre) from fiscamovil.dbo.usuarios as uff where uff.id=(case when MAX(ID_INS)='''' then -1 else MAX(ID_INS) end)),'''') as INSPECTOR "
            myInsertQueryDatosTable += " ,count([R_NUMCRED]) as R_CREDITOS,sum([R_IMPORTE]) as R_IMPORTE,MAX(FECH_INS) as [FECH_SUP],[CODE_BAR] AS [CODE_BAR],MAX([CODE_QR]) AS [CODE_QR] "
            myInsertQueryDatosTable += " ,(case "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''COP'' and MAX([D_CIT_SUP])=''1'' then ''1'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''RCV'' and MAX([D_CIT_SUP])=''1'' then ''2'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''RCV'' and MAX([R_TIPO])=''RCV'' and MAX([D_CIT_SUP])=''1'' then ''3'' "
            myInsertQueryDatosTable += " else ''0'' end) as [D_CIT_SUP] "
            myInsertQueryDatosTable += " ,(case "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''COP'' and MAX([D_MAN_SUP])=''1'' then ''1'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''RCV'' and MAX([D_MAN_SUP])=''1'' then ''2'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''RCV'' and MAX([R_TIPO])=''RCV'' and MAX([D_MAN_SUP])=''1'' then ''3'' "
            myInsertQueryDatosTable += " else ''0'' end) as [D_MAN_SUP] "
            myInsertQueryDatosTable += " ,(case "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''COP'' and MAX([D_AMP_SUP])=''1'' then ''1'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''RCV'' and MAX([D_AMP_SUP])=''1'' then ''2'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''RCV'' and MAX([R_TIPO])=''RCV'' and MAX([D_AMP_SUP])=''1'' then ''3'' "
            myInsertQueryDatosTable += " else ''0'' end) as [D_AMP_SUP] "
            myInsertQueryDatosTable += " ,(case "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''COP'' and MAX([D_REM_SUP])=''1'' then ''1'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''RCV'' and MAX([D_REM_SUP])=''1'' then ''2'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''RCV'' and MAX([R_TIPO])=''RCV'' and MAX([D_REM_SUP])=''1'' then ''3'' "
            myInsertQueryDatosTable += " else ''0'' end) as [D_REM_SUP] "
            myInsertQueryDatosTable += " ,(case "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''COP'' and MAX([D_CER_SUP])=''1'' then ''1'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''COP'' and MAX([R_TIPO])=''RCV'' and MAX([D_CER_SUP])=''1'' then ''2'' "
            myInsertQueryDatosTable += " when MIN([R_TIPO])=''RCV'' and MAX([R_TIPO])=''RCV'' and MAX([D_CER_SUP])=''1'' then ''3'' "
            myInsertQueryDatosTable += " else ''0'' end) as [D_CER_SUP] FROM [sirecacobros].[dbo].[PAE_CRED] WHERE R_SUBDEL=''" + vsubdel + "'' and [ACTIVO]=1111 "
            myInsertQueryDatosTable += " and ID_INS NOT IN ('''') and CONVERT(VARCHAR,FECH_INS,103)=''" + vfecha + "'' "
            myInsertQueryDatosTable += " group by [R_SUBDEL],[R_REGPATR],[R_TIPO],[CODE_BAR] "
            myInsertQueryDatosTable += " ) AS RX "
            myInsertQueryDatosTable += " order by INSPECTOR,FECH_SUP "
            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22

            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + "listado" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + Now.Hour.ToString("D2") + Now.Minute.ToString("D2") + Now.Second.ToString("D2") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
    Protected Sub LBActTab_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActTab.Click
        GridView1.DataBind()
    End Sub

    Protected Sub TBFechOfiConve8_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFechSolic25_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFechReque10_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub DDLHoraReque10_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, DropDownList).Items.Add(New ListItem("--:-- -.-.", "--:-- -.-."))
        For i As Int32 = 5 To 19
            If i > 14 Then
                CType(sender, DropDownList).Items.Add(New ListItem("0" & (24 - i) & ":30 H.r.", "0" & (24 - i) & ":30 H.r."))
                CType(sender, DropDownList).Items.Add(New ListItem("0" & (24 - i) & ":00 H.r.", "0" & (24 - i) & ":00 H.r."))
            Else
                CType(sender, DropDownList).Items.Add(New ListItem((24 - i) & ":30 H.r.", (24 - i) & ":30 H.r."))
                CType(sender, DropDownList).Items.Add(New ListItem((24 - i) & ":00 H.r.", (24 - i) & ":00 H.r."))
            End If
        Next
    End Sub

    Protected Sub LBguardarCanInc_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim vsubdel As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(0)
        Dim vregpat As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(1)
        Dim vinspector As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(2)
        Dim vindex As Int32 = CInt(CType(sender, LinkButton).CommandArgument.Split("-").GetValue(3))
        Dim vcodebar As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(4)
        Dim voficina As String = CType(GridView1.Rows(vindex).Cells(10).FindControl("DDLCierre"), DropDownList).SelectedValue
        ' Evaluando incidencia
        Dim fechOfiConve8 As String = CType(GridView1.Rows(vindex).Cells(10).FindControl("TBFechOfiConve8"), TextBox).Text
        Dim fechInscrip25 As String = CType(GridView1.Rows(vindex).Cells(10).FindControl("TBFechInscrip25"), TextBox).Text
        Dim fechReque10 As String = CType(GridView1.Rows(vindex).Cells(10).FindControl("TBFechReque10"), TextBox).Text
        Dim HoraReque10 As String = CType(GridView1.Rows(vindex).Cells(10).FindControl("DDLHoraReque10"), DropDownList).SelectedValue
        Dim fechRpp11 As String = CType(GridView1.Rows(vindex).Cells(10).FindControl("TBFechReque10"), TextBox).Text
        ' Agregar
        If CType(GridView1.Rows(vindex).Cells(10).FindControl("RB43"), CheckBox).Checked Then
            setFechas(vcodebar + vinspector, "43", fechOfiConve8, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0")

        ElseIf CType(GridView1.Rows(vindex).Cells(10).FindControl("RB34"), CheckBox).Checked Then
            setFechas(vcodebar + vinspector, "34", "0", fechInscrip25, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0")

        ElseIf CType(GridView1.Rows(vindex).Cells(10).FindControl("RB32"), CheckBox).Checked Then
            setFechas(vcodebar + vinspector, "32", "0", "0", "0", fechReque10, HoraReque10, "0", "0", "0", "0", "0", "0", "0")

        ElseIf CType(GridView1.Rows(vindex).Cells(10).FindControl("RB35"), CheckBox).Checked Then
            setFechas(vcodebar + vinspector, "35", "0", "0", "0", "0", "0", "0", "0", "0", fechRpp11, "0", "0", "0")

        ElseIf CType(GridView1.Rows(vindex).Cells(10).FindControl("RBO"), CheckBox).Checked Then

        End If
        ' Validando que el envio a una oficina se hayga realizado y cerrando el caso

        If setAreaEnvio(vregpat, vinspector, voficina) > 0 Then
            'setCerrarCaso(vsubdel, vregpat)
        End If
    End Sub
    Private Sub setCerrarCaso(ByVal vsubdel As String, ByVal vregpat As String, ByVal vcodbar As String)
        'Funcion para cerrar el caso, para indicar al sistema que se a concluido
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " UPDATE [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " SET [ACTIVO] = 1 "
        textConmand += " WHERE [R_SUBDEL]='" + vsubdel + "' and [R_REGPATR]='" + vregpat + "' and ACTIVO=1111 and CODE_BAR='" + vcodbar + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
        GridView1.DataBind()
    End Sub

    Private Sub setFechas(ByVal vcodebar As String, ByVal vinc As String, ByVal fechOfiConve8 As String, ByVal fechInscrip25 As String, ByVal fechSolic25 As String, ByVal fechReque10 As String, ByVal HoraReque10 As String _
, ByVal vfechSoliAvaluo25 As String, ByVal vfechNotiAvaluo25 As String _
, ByVal vfechSubeRemat25 As String, ByVal vfechRematRpp11 As String _
, ByVal vfechNomInterv11 As String, ByVal vfechNotiInterv11 As String, ByVal vfechSegInterv11 As String)
        'Agregando Fechas de las INC selecciono la mesa de seccion como final
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecacobros].[dbo].[PAE_FECHAS] "
        textConmand += " ([FI_SUBDEL] "
        textConmand += " ,[FI_CODEBAR] "
        textConmand += " ,[FI_INC] "
        textConmand += " ,[FI8_FECH_OFI_CONVE] "
        textConmand += " ,[FI25_FECH_INSCRIP] "
        textConmand += " ,[FI25_FECH_TURNA_REMAT] "
        textConmand += " ,[FI10_FECH_REQ_TRANSPORT] "
        textConmand += " ,[F10_HORA_REQ_TRANSPORT] "
        textConmand += " ,[F25_FECH_SOLI_AVALUO] " '----------------------
        textConmand += " ,[F25_FECH_NOTI_AVALUO] "
        textConmand += " ,[F25_FECH_SUBE_REMAT] "
        textConmand += " ,[F11_FECH_RPP] "
        textConmand += " ,[F11_FECH_NOM_INTERV] "
        textConmand += " ,[F11_FECH_NOTI_INTERV] "
        textConmand += " ,[F11_FECH_SEG_INTERV] "

        textConmand += " ,[F25_FOLIO_SOLI] "
        textConmand += " ,[F25_FECHA_SOLI] "
        textConmand += " ,[F25_FICHA_SOLI] "
        textConmand += " ,[F25_FOLIO_GRAVAMEN] "
        textConmand += " ,[F25_FECHA_GRAVAMEN] "
        textConmand += " ,[F25_OFICINA_REMATE] "
        textConmand += " ,[F25_FECHA_REMATE] "

        textConmand += " ,[F8_FOLIO_SIARA] "
        textConmand += " ,[F8_FECHA_SIARA] "
        textConmand += " ,[F8_FOLIO_BANCARIO] "
        textConmand += " ,[F8_FECHA_BANCARIO] "

        textConmand += " ) "
        textConmand += " VALUES "
        textConmand += " ('" + DDLSubdel.SelectedValue.ToString + "' "
        textConmand += " ,'" + vcodebar + "' "
        textConmand += " ,'" + vinc + "' "
        textConmand += " ," + IIf(IsDate(fechOfiConve8), "convert(datetime,'" + fechOfiConve8 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(fechInscrip25), "convert(datetime,'" + fechInscrip25 + "',103)", "NULL") + " "
        textConmand += " ,NULL "
        textConmand += " ," + IIf(IsDate(fechReque10), "convert(datetime,'" + fechReque10 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsNumeric(HoraReque10), "NULL", "'" + HoraReque10 + "'") + " "
        textConmand += " ," + IIf(IsDate(vfechSoliAvaluo25), "convert(datetime,'" + vfechSoliAvaluo25 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(vfechNotiAvaluo25), "convert(datetime,'" + vfechNotiAvaluo25 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(vfechSubeRemat25), "convert(datetime,'" + vfechSubeRemat25 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(vfechRematRpp11), "convert(datetime,'" + vfechRematRpp11 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(vfechNomInterv11), "convert(datetime,'" + vfechNomInterv11 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(vfechNotiInterv11), "convert(datetime,'" + vfechNotiInterv11 + "',103)", "NULL") + " "
        textConmand += " ," + IIf(IsDate(vfechSegInterv11), "convert(datetime,'" + vfechSegInterv11 + "',103)", "NULL") + " "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
        GridView1.DataBind()
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

    Protected Sub LBCerrarCasoPAE_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim vsubdel As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(0)
        Dim vregpat As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(1)
        Dim vcodbar As String = CType(sender, LinkButton).CommandArgument.Split("-").GetValue(2)
        setCerrarCaso(vsubdel, vregpat, vcodbar)
        GridView1.DataBind()
    End Sub

    Protected Sub TBFechRpp11_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFechInscrip25_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        generarListadoImpresion(DDLSubdel.SelectedValue, TBFechAsigIni.Text)
    End Sub

    Protected Sub TBFechAsigIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechAsigIni.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
        'Label4.Text = Label4.Text + txt
    End Sub
End Class
Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class resumendiligencias
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
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

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        GridView1.DataBind()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        descargarSivepas()
    End Sub
    Private Sub descargarSivepas()
        'exportacion inicio
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/sivepa/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/sivepa/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/sivepa/") + Session.Item("SIRECAid").ToString + Now.Day.ToString("D2") + Now.Month.ToString("D2") + Now.Year.ToString("D6") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''TIPO'',''SIVEPAS'',''PERIODO'',''REG_PATRONAL'',''RAZON'',''CREDITO'',''COTIZ'',''EMI_REAL'',''RECAUDACION'',''DIFERENCIA'',''FECH_ASIGNACION'',''INSPECTOR'',''FECH_DILIGENCIA'',''DILIGENCIA'' "
            myInsertQueryDatosTable = " SELECT "
            myInsertQueryDatosTable += " TIPO,SIVEPAS,PERIODO,REG_PATRONAL,RAZON,CREDITO,COTIZ,EMI_REAL,RECAUDACION,DIFERENCIA,FECH_ASIGNACION,INSPECTOR,FECH_DILIGENCIA,DILIGENCIA "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [SV_TIPO] AS TIPO "
            myInsertQueryDatosTable += " ,[SV_SIVEPA] AS SIVEPAS "
            myInsertQueryDatosTable += " ,substring(convert(varchar(10),[SV_PERIODO],103),4,7) as PERIODO "
            myInsertQueryDatosTable += " ,[SV_REG_PATRONAL] AS REG_PATRONAL "
            myInsertQueryDatosTable += " ,''""""''+[SV_RAZON_SOCIAL]+''""""'' AS RAZON "
            myInsertQueryDatosTable += " ,[SV_CREDITO] AS CREDITO "
            myInsertQueryDatosTable += " ,convert(varchar,[SV_COTIZ]) AS COTIZ "
            myInsertQueryDatosTable += " ,convert(varchar,[SV_EMI_REAL]) AS EMI_REAL "
            myInsertQueryDatosTable += " ,convert(varchar,[SV_RECAUDACION]) AS RECAUDACION "
            myInsertQueryDatosTable += " ,convert(varchar,[SV_DIFERENCIA]) AS DIFERENCIA "
            myInsertQueryDatosTable += " ,convert(varchar,[SV_ASIG_FECHA],103) AS FECH_ASIGNACION "
            myInsertQueryDatosTable += " ,(select upper(nombre) from fiscamovil.dbo.usuarios where id=[SV_ASIG_INSPECTOR]) AS INSPECTOR "
            myInsertQueryDatosTable += " ,convert(varchar,(SELECT MAX([SVD_FECH_DILI]) FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID]),103) AS FECH_DILIGENCIA "
            myInsertQueryDatosTable += " ,(SELECT TOP 1 [SVD_DILI] FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID] ORDER BY [SVD_FECH_DILI] DESC) AS DILIGENCIA "
            myInsertQueryDatosTable += " FROM [sirecasivepas].[dbo].[SV_BASE] "
            myInsertQueryDatosTable += " where [SV_SUBDEL] = ''" + DDLSubdel.SelectedValue + "'' "
            myInsertQueryDatosTable += " and [SV_ASIG_FECHA] between ''" + TBFechIni.Text + "'' and ''" + TBFechFin.Text + "'' "
            myInsertQueryDatosTable += " and [SV_CREDITO] is not null "
            myInsertQueryDatosTable += " ) AS RESULTADO "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=D" + Session.Item("SIRECAid").ToString + Now.Day.ToString("D2") + Now.Month.ToString("D2") + Now.Year.ToString("D6") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
        'exportacion fin
    End Sub

    Protected Sub TBFechIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechIni.Init
        CType(sender, TextBox).Text = DateAdd("d", (1 - Day(Now)), Now).ToShortDateString()
    End Sub

    Protected Sub TBFechFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechFin.Init
        CType(sender, TextBox).Text = Now.ToShortDateString()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        CType(sender, GridView).Caption = "<strong>" & CType(sender, GridView).Rows.Count.ToString("N0") & " Resultados</strong>"
    End Sub
End Class
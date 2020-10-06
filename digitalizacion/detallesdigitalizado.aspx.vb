Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class detallesdigitalizado
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        'If Not Request.QueryString("tipo") Is Nothing Then
        '    If Request.QueryString("tipo").ToString.Equals("1") Then
        '        Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
        '    ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
        '        Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
        '    ElseIf Request.QueryString("tipo").ToString.Equals("3") Then
        '        Page.MasterPageFile = "~/sitios/SiteCiclo3.Master"
        '    End If
        'End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        condigitalizacion()
    End Sub
    Protected Sub condigitalizacion()
        'exportacion inicio
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/sinpago/temp/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/sinpago/temp/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/sinpago/temp/") + Now.ToShortDateString.Replace("/", ".") + Session.Item("SIRECAid").ToString + Request.QueryString("tipocoprcv").ToString + ".csv"
            Dim rale1 As String = Request.QueryString("rale").ToString
            Dim rale2 As String = rale1.Replace("33A", "01A")
            Dim rale3 As String = rale1.Replace("ACOP", "ARCV")
            Dim rale4 As String = rale2.Replace("ACOP", "ARCV")
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''DIGITALIZADO'',''SUBDEL'',''TIPO'',''INC'',''NUMCRED'',''IMPORTE'',''SECTOR'',''REGPAT'',''RAZON'',''DOMICILIO'',''LOCALIDAD'',''COTIZANTES'',''PERIODO'' "
            myInsertQueryDatosTable = " SELECT  "
            myInsertQueryDatosTable += " DIGITALIZADO,resultado2.SUBDEL,TIPO,INC,NUMCRED,convert(varchar(50),IMPORTE) as IMPORTE,sector as SECTOR "
            myInsertQueryDatosTable += " ,regpat as REGPAT,''""""''+razonSocial+''""""'' as RAZON,dom as DOMICILIO,loc as LOCALIDAD,convert(varchar(50),cotiz) as COTIZANTES "
            myInsertQueryDatosTable += " ,periodo "
            myInsertQueryDatosTable += "  FROM ( "
            myInsertQueryDatosTable += " select "
            myInsertQueryDatosTable += " SUBDEL,TIPO,INC,REGPATR,NUMCRED,IMPORTE,PERIODO "
            myInsertQueryDatosTable += " ,(CASE WHEN DIG_TIPO IS NULL THEN ''NO'' ELSE ''SI'' END) AS DIGITALIZADO "
            myInsertQueryDatosTable += " from ( "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " ''33'' AS SUBDEL "
            myInsertQueryDatosTable += " ,''COP'' AS TIPO "
            myInsertQueryDatosTable += " ,[INC] "
            myInsertQueryDatosTable += " ,REGPATR "
            myInsertQueryDatosTable += " ,NUMCRED "
            myInsertQueryDatosTable += " ,[IMPORTE] "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " FROM [rale].[dbo].[" + rale1 + "]  "
            myInsertQueryDatosTable += " where inc not in (''00'') "
            myInsertQueryDatosTable += " union all "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " ''01'' AS SUBDEL "
            myInsertQueryDatosTable += " ,''COP'' AS TIPO "
            myInsertQueryDatosTable += " ,[INC] "
            myInsertQueryDatosTable += " ,REGPATR "
            myInsertQueryDatosTable += " ,NUMCRED "
            myInsertQueryDatosTable += " ,[IMPORTE] "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " FROM [rale].[dbo].[" + rale2 + "] "
            myInsertQueryDatosTable += " where inc not in (''00'') "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " ''33'' AS SUBDEL "
            myInsertQueryDatosTable += " ,''RCV'' AS TIPO "
            myInsertQueryDatosTable += " ,[INC] "
            myInsertQueryDatosTable += " ,REGPATR "
            myInsertQueryDatosTable += " ,NUMCRED "
            myInsertQueryDatosTable += " ,[IMPORTE] "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " FROM [rale].[dbo].[" + rale3 + "] "
            myInsertQueryDatosTable += " where inc not in (''00'') "
            myInsertQueryDatosTable += " union all "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " ''01'' AS SUBDEL "
            myInsertQueryDatosTable += " ,''RCV'' AS TIPO "
            myInsertQueryDatosTable += " ,[INC] "
            myInsertQueryDatosTable += " ,REGPATR "
            myInsertQueryDatosTable += " ,NUMCRED "
            myInsertQueryDatosTable += " ,[IMPORTE] "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " FROM [rale].[dbo].[" + rale4 + "]  "
            myInsertQueryDatosTable += " where inc not in (''00'') "
            myInsertQueryDatosTable += " ) as resultado  "
            myInsertQueryDatosTable += " left join [sireca].[dbo].[CD_DIGITALIZADO]  "
            myInsertQueryDatosTable += " on [DIG_REGPAT]=REPLACE(REGPATR,''-'','''') and [DIG_CREDITO]=NUMCRED "
            myInsertQueryDatosTable += " WHERE TIPO LIKE ''" + Request.QueryString("tipocoprcv").ToString + "'' "
            myInsertQueryDatosTable += " AND SUBDEL LIKE ''" + Request.QueryString("subdel").ToString + "'' "
            myInsertQueryDatosTable += " ) AS resultado2 left join sireca.dbo.patrones on regpat=replace(regpatr,''-'','''') "
            'myInsertQueryDatosTable += ",''""""''+ptn.razonSocial+''""""'' as NOM_PATRON "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + Now.ToShortDateString.Replace("/", ".") + Session.Item("SIRECAid").ToString + ".zip")
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
End Class
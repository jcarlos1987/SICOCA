Imports System.IO
Imports System.Data.OleDb
Imports Ionic.Zip

Public Class descargarRale
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECA2chmod2").ToString.Equals("DR") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

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

    Protected Sub getRale()
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/rale")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/rale"))
            End If
            Dim nomRale As String = DropDownRale.SelectedValue
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 1 "
            'myInsertQuery22 += " RECONFIGURE "            
            'myInsertQuery22 += " exec xp_cmdshell 'bcp "" SELECT ''SECTOR'',''EMA'',''REG.PATRONAL'',''RAZON SOCIAL'',''ACTIVIDAD'',''RFC'',''COTIZANTES'',''DOMICILIO'',''MUNICIPIO'',''CP'',''MOV'',''FEC.MOV'',''CREDITO'',''CE'',''TD'',''FEC.ALTA'',''FECH.NOTIF.'',''INC'',''FEC.INC.'',''DIAS'',''IMPORTE'',''PERIODO'',''DEL.CONTROL'',''SUB.CONTROL'', ''REP_LEGAL'',''CORREO'',''TELEFONO'' UNION ALL SELECT rale.[SECTOR],( (case when len(month(ptn.vigencia))=1 then ''0''+convert(varchar(2),month(ptn.vigencia)) else convert(varchar(2),month(ptn.vigencia)) end ) +''/''+ convert(varchar(4),year(ptn.vigencia))) as EMA,replace(rale.[REGPATR],''-'','''') as [REG.PATRONAL],(''""""''+rtrim(ptn.razonSocial)+''""""'') AS [RAZON SOCIAL],(''""""''+rtrim(ptn.act)+''""""'') as ACTIVIDAD,(''""""''+rtrim(ptn.rfc)+''""""'') as RFC,cast(ptn.cotiz as varchar) AS COTIZANTES,(''""""''+rtrim(ptn.dom)+''""""'') AS DOMICILIO,rtrim((case when len(ptn.loc)>0 then substring(ptn.loc,1,(len(ptn.loc)-5)) else '''' end)) as MUNICIPIO,(case when len(ptn.loc)>0 then substring(ptn.loc,len(ptn.loc)-5,6) else '''' end) as CP,rale.[MOV],rale.[FMOV] as [FEC.MOV],rale.[NUMCRED] as [CREDITO],[CE],[TD],[FALTA] as [FEC.ALTA],[FNOTIFICACION] as [FECH.NOTIF.] "
            'myInsertQuery22 += " ,[INC],[FEINC] as [FEC.INC.],cast([DIAS] as varchar) as DIAS,cast([IMPORTE] as varchar) as IMPORTE,substring([PERIODO],4,7) as [PERIODO],[DC] as [DEL.CONTROL],[SC] as [SUB.CONTROL] "
            myInsertQuery22 += " exec xp_cmdshell 'bcp "" SELECT ''REG.PATRONAL'',''RAZON SOCIAL'',''MOV'',''FEC.MOV'',''SECTOR'',''CREDITO'',''PERIODO'',''TD'',''FEC.ALTA'',''FECH.NOTIF.'',''INC'',''FEC.INC.'',''DIAS'',''IMPORTE'',''ACT'',''REC'',''DEL.CONTROL'',''SUB.CONTROL'',''EMA'',''ACTIVIDAD'',''RFC'',''COTIZANTES'',''DOMICILIO'',''MUNICIPIO'',''CP'',''CE'',''REP_LEGAL'',''CORREO'',''TELEFONO'' "
            myInsertQuery22 += " UNION ALL SELECT replace(rale.[REGPATR],''-'','''') as [REG.PATRONAL],(''""""''+rtrim(ptn.razonSocial)+''""""'') AS [RAZON SOCIAL],rale.[MOV],rale.[FMOV] as [FEC.MOV],rale.[SECTOR],rale.[NUMCRED] as [CREDITO],substring([PERIODO],4,7) as [PERIODO],[TD],[FALTA] as [FEC.ALTA],[FNOTIFICACION] as [FECH.NOTIF.],[INC],[FEINC] as [FEC.INC.],cast([DIAS] as varchar) as DIAS,cast([IMPORTE] as varchar) as IMPORTE "
            If nomRale.Contains("COP") Then
                myInsertQuery22 += " ,cast(([IMPORTE]*(SELECT [ACT] FROM [sirecacobros].[dbo].[tabActRec] AS ACT where year(''01/''+ACT.[PERIODO])=year(rale.[PERIODO]) and month(''01/''+ACT.[PERIODO])=month(rale.[PERIODO]))) as varchar) as ACT "
                myInsertQuery22 += " ,cast((case when TD in (''08'',''80'',''81'',''82'') then 0.00 else "
                myInsertQuery22 += " (((([IMPORTE]*(SELECT [ACT] FROM [sirecacobros].[dbo].[tabActRec] AS ACT where year(''01/''+ACT.[PERIODO])=year(rale.[PERIODO]) and month(''01/''+ACT.[PERIODO])=month(rale.[PERIODO])))+[IMPORTE]) "
                myInsertQuery22 += " *(SELECT [REC] FROM [sirecacobros].[dbo].[tabActRec] AS ACT where year(''01/''+ACT.[PERIODO])=year(rale.[PERIODO]) and month(''01/''+ACT.[PERIODO])=month(rale.[PERIODO])))/100) end) as varchar) as REC "
            Else
                myInsertQuery22 += " ,cast(([IMPORTE]*(SELECT [ACT] FROM [sirecacobros].[dbo].[tabActRec] AS ACT where year(''01/''+ACT.[PERIODO])=year(rale.[PERIODO]) and month(''01/''+ACT.[PERIODO])=(month(rale.[PERIODO])*2))) as varchar) as ACT "
                myInsertQuery22 += " ,cast((case when TD in (''08'',''80'',''81'',''82'') then 0.00 else "
                myInsertQuery22 += " (((([IMPORTE]*(SELECT [ACT] FROM [sirecacobros].[dbo].[tabActRec] AS ACT  where year(''01/''+ACT.[PERIODO])=year(rale.[PERIODO]) and month(''01/''+ACT.[PERIODO])=(month(rale.[PERIODO])*2)))+[IMPORTE]) "
                myInsertQuery22 += " *(SELECT [REC] FROM [sirecacobros].[dbo].[tabActRec] AS ACT where year(''01/''+ACT.[PERIODO])=year(rale.[PERIODO]) and month(''01/''+ACT.[PERIODO])=(month(rale.[PERIODO])*2)))/100) end) as varchar) as REC "
            End If
            myInsertQuery22 += " ,[DC] as [DEL.CONTROL],[SC] as [SUB.CONTROL],( (case when len(month(ptn.vigencia))=1 then ''0''+convert(varchar(2),month(ptn.vigencia)) else convert(varchar(2),month(ptn.vigencia)) end ) +''/''+ convert(varchar(4),year(ptn.vigencia))) as EMA,(''""""''+rtrim(ptn.act)+''""""'') as ACTIVIDAD,(''""""''+rtrim(ptn.rfc)+''""""'') as RFC,cast(ptn.cotiz as varchar) AS COTIZANTES,(''""""''+rtrim(ptn.dom)+''""""'') AS DOMICILIO,rtrim((case when len(ptn.loc)>0 then substring(ptn.loc,1,(len(ptn.loc)-5)) else '''' end)) as MUNICIPIO,(case when len(ptn.loc)>0 then substring(ptn.loc,len(ptn.loc)-5,6) else '''' end) as CP,[CE] "
            myInsertQuery22 += " ,fdrp.info as REP_LEGAL "
            myInsertQuery22 += " ,fdc.info as CORREO "
            myInsertQuery22 += " ,fdt.info as TELEFONO "
            myInsertQuery22 += " FROM [rale].[dbo].[" + nomRale + "] as rale left join sireca.dbo.patrones as ptn on replace(rale.[REGPATR],''-'','''')=ptn.regpat "
            myInsertQuery22 += " left join (select fd.[regpat],max(fd.[info]) as info from [firmaDigital].[dbo].[info] as fd where fd.[tipo]=''1'' group by fd.[regpat]) as fdrp "
            myInsertQuery22 += " on fdrp.[regpat]=ptn.REGPAT "
            myInsertQuery22 += " left join (select fd.[regpat],max(fd.[info]) as info from [firmaDigital].[dbo].[info] as fd where fd.[tipo]=''2'' group by fd.[regpat]) as fdc "
            myInsertQuery22 += " on fdc.[regpat]=ptn.REGPAT "
            myInsertQuery22 += " left join (select fd.[regpat],max(fd.[info]) as info from [firmaDigital].[dbo].[info] as fd where fd.[tipo]=''3'' group by fd.[regpat]) as fdt "
            myInsertQuery22 += " on fdt.[regpat]=ptn.REGPAT "
            myInsertQuery22 += " "" queryout """ + Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".csv"" -T -c -C -t"","" -r""\n"" ' "
            'myInsertQuery22 += " exec sp_configure ""xp_cmdshell"", 0 "
            'myInsertQuery22 += " RECONFIGURE "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            '-----------------
            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".csv", "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.Message & " _ " & ex.StackTrace)            
        End Try
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        getRale()
    End Sub
End Class
Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class analisis01
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAid") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            'If Session.Item("SIRECAemision_p1").ToString.Equals("1") Then
            'Else
            '    Response.Redirect("~/accesoDenegado.aspx")
            'End If
        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAsubdel") Is Nothing Then
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

    Protected Sub LBINC_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBINC.Click
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/ralesirecanot/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/ralesirecanot/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/ralesirecanot/") + Session.Item("SIRECAid").ToString + DDLSubdel.SelectedValue.Replace("/", "") + Now.ToShortDateString.Replace("/", "") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''RALE_TIPO'',''RALE_CREDITO'',''RALE_REGPAT'',''RALE_MOV'',''RALE_FECH_MOV'',''RALE_SECTOR'',''RALE_TD'',''RALE_FECH_ALTA'',''RALE_PERIDODO'',''RALE_IMPORTE'',''SIRECA_PAGO'',''RALE_DIAS'',''RALE_INC'',''RALE_FECH_INC'',''RALE_FECH_NOTIFICACION'',''SIRECA_FECH_NOTIFICACION'',''DIAS_FN_RALE'',''DIAS_FN_SIRECA'',''SIRECA_DILIGENCIA'',''SIRECA_FECH_DILIGENCIA''  "
            myInsertQueryDatosTable = " select TIPO AS RALE_TIPO "
            myInsertQueryDatosTable += " ,RALE_CREDITO,RALE_REGPAT,MOV AS RALE_MOV,FMOV AS RALE_FECH_MOV "
            myInsertQueryDatosTable += " ,SECTOR AS RALE_SECTOR "
            myInsertQueryDatosTable += " ,TD AS RALE_TD "
            myInsertQueryDatosTable += " ,FALTA AS RALE_FECH_ALTA "
            myInsertQueryDatosTable += " ,RALE_PERIODO AS RALE_PERIODO "
            myInsertQueryDatosTable += " ,convert(varchar(50),IMPORTE) AS RALE_IMPORTE "
            myInsertQueryDatosTable += " ,convert(varchar(50),ECO_PAGO) as ECO_PAGO "
            myInsertQueryDatosTable += " ,convert(varchar(50),DIAS) AS RALE_DIAS "
            myInsertQueryDatosTable += " ,INC AS RALE_INC "
            myInsertQueryDatosTable += " ,convert(varchar(10),FEINC,103) AS RALE_FECH_INC "
            myInsertQueryDatosTable += " ,convert(varchar(10),FNOTIFICACION,103) AS RALE_FECH_NOTIFICACION "
            myInsertQueryDatosTable += " ,convert(varchar(10),ECO_FECH_NOTIFICACION,103) as ECO_FECH_NOTIFICACION "
            myInsertQueryDatosTable += " ,convert(varchar(50),(select sirecacobros.dbo.diasInabiles(FNOTIFICACION,getdate()))) as DIAS_FN_RALE "
            myInsertQueryDatosTable += " ,convert(varchar(50),(select sirecacobros.dbo.diasInabiles(ECO_FECH_NOTIFICACION,getdate()))) as DIAS_FN_SIRECA "
            myInsertQueryDatosTable += " ,ECO_DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(varchar(10),ECO_FECH_DILIGENCIA,103) as ECO_FECH_DILIGENCIA "
            myInsertQueryDatosTable += " from ( "
            myInsertQueryDatosTable += " select ''COP'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT "
            myInsertQueryDatosTable += " ,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO, * from rale.dbo.[" + DDLRCop.SelectedValue + "] "
            myInsertQueryDatosTable += " where inc in (''01'') "
            myInsertQueryDatosTable += " union all "
            myInsertQueryDatosTable += " select ''RCV'' as TIPO,NUMCRED RALE_CREDITO,REPLACE(REGPATR,''-'','''') AS RALE_REGPAT "
            myInsertQueryDatosTable += " ,SUBSTRING(PERIODO,4,7) AS RALE_PERIODO, * from rale.dbo.[" + DDLRRcv.SelectedValue + "] "
            myInsertQueryDatosTable += " where inc in (''01'') "
            myInsertQueryDatosTable += " ) as rale "
            myInsertQueryDatosTable += " left join  "
            myInsertQueryDatosTable += " ( "
            myInsertQueryDatosTable += " select  "
            myInsertQueryDatosTable += " 	(case when eco.incidencia in (''2'') then convert(nvarchar(10),eco.fechaCaptura,103) else  "
            myInsertQueryDatosTable += " 		( "
            myInsertQueryDatosTable += " 			SELECT top 1 convert(nvarchar(10),hinc.fecha,103) "
            myInsertQueryDatosTable += " 			FROM [sireca].[dbo].[HistorialInc] as hinc "
            myInsertQueryDatosTable += " 			where hinc.incidencia=''2'' and hinc.ideco=eco.id "
            myInsertQueryDatosTable += " 			order by hinc.id desc "
            myInsertQueryDatosTable += " 		) end  "
            myInsertQueryDatosTable += " 	) as ECO_FECH_NOTIFICACION "
            myInsertQueryDatosTable += " ,credito AS ECO_CREDITO "
            myInsertQueryDatosTable += " ,SUBSTRING(reg#patronal,1,10) AS ECO_REGPAT "
            myInsertQueryDatosTable += " ,incidencia AS ECO_DILIGENCIA "
            myInsertQueryDatosTable += " ,fechaCaptura as ECO_FECH_DILIGENCIA "
            myInsertQueryDatosTable += " ,pago as ECO_PAGO "
            myInsertQueryDatosTable += " ,(case  "
            myInsertQueryDatosTable += " when [tipoECO] in (''COP'',''COMP'') then "
            myInsertQueryDatosTable += " (case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQueryDatosTable += " when [tipoECO] in (''RCV'',''RCVCOMP'') then "
            myInsertQueryDatosTable += " (case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQueryDatosTable += " end "
            myInsertQueryDatosTable += " ) as ECO_PERIODO "
            myInsertQueryDatosTable += " from sireca.dbo.eco as eco "
            myInsertQueryDatosTable += " where tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') "
            myInsertQueryDatosTable += " ) as sireca "
            myInsertQueryDatosTable += " ON ECO_REGPAT=RALE_REGPAT AND ECO_CREDITO=RALE_CREDITO AND ECO_PERIODO=RALE_PERIODO "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + Session.Item("SIRECAid").ToString + DDLSubdel.SelectedValue + "_" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewInc01.DataBind()
    End Sub

    Protected Sub LinkButton1_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & CType(sender, LinkButton).CommandArgument & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=900, scrollbars=1');")
    End Sub
End Class
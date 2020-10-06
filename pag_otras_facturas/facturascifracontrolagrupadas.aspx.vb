Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO
Imports System.Globalization

Public Class facturascifracontrolagrupadas
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
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

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewRCControl.DataBind()
        Chart7.DataBind()
        GridViewCCInc.DataBind()
        Chart8.DataBind()
    End Sub

    Protected Sub LBDescargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDescargar.Click
        Try
            Dim vsubdel As String = DDLSubdel.SelectedValue
            Dim vcifracontrol As String = DDLCControl.SelectedValue
            If Not Directory.Exists(Server.MapPath("~/descargas/facturas/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/facturas/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/facturas/") + DDLCControl.SelectedValue + "_" + Session.Item("SIRECAid").ToString + Now.ToShortDateString.Replace("/", "") + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''RG_CIFRA_CONTROL'',''RG_SUBDEL'',''RG_TIPO_FACTURA'',''RG_SECTOR'',''RG_REGPAT'',''RG_RAZON'',''RG_CREDITO'',''RG_PERIODO'',''RG_COTIZ'',''RG_IMPORTE'',''RG_IMPORTE_PAGO'',''FECHA_PAGO'',''IMPORTE_FALTANTE'',''RG_FECH_ASIGNACION'',''RG_INSPECTOR'',''RG_FECH_NOTIFICACION'',''RG_DILIGENCIA'',''RG_FECH_DILIGENCIA'',''TRANS_GRUPO'',''TRANS_FOLIO'',''TRANS_FOLIO_CREADO'',''TRANS_OBSERVACION'' "

            myInsertQueryDatosTable = " SELECT convert(varchar(15),RG_CIFRA_CONTROL) "
            myInsertQueryDatosTable += " ,RG_SUBDEL,RG_TIPO_FACTURA,RG_SECTOR,RG_REGPAT "
            myInsertQueryDatosTable += " ,REPLACE(REPLACE(RG_RAZON,'','','' ''),''-'','' '') "
            myInsertQueryDatosTable += " ,RG_CREDITO,RG_PERIODO "
            myInsertQueryDatosTable += " ,convert(varchar(15),RG_COTIZ) "
            myInsertQueryDatosTable += " ,convert(varchar(15),RG_IMPORTE) "
            myInsertQueryDatosTable += " ,convert(varchar(15),RG_IMPORTE_RECAUDADO) "
            myInsertQueryDatosTable += " ,convert(varchar(15),FECHA_PAGO,103) "
            myInsertQueryDatosTable += " ,convert(varchar(15),IMPORTE_FALTANTE) "
            myInsertQueryDatosTable += " ,convert(varchar(15),RG_FECH_ASIGNACION,103) "
            myInsertQueryDatosTable += " ,(SELECT upper(nombre) from fiscamovil.dbo.usuarios where id=RG_INSPECTOR) as RG_INSPECTOR "
            myInsertQueryDatosTable += " ,convert(varchar(15),RG_FECHA_NOTIFICACION,103) "
            myInsertQueryDatosTable += " ,RG_DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(varchar(15),RG_FECH_DILIGENCIA,103) "
            myInsertQueryDatosTable += " ,TRANS_GRUPO,convert(varchar(15),TRANS_FOLIO) "
            myInsertQueryDatosTable += " ,convert(varchar(15),TRANS_FOLIO_CREADO,103) "
            myInsertQueryDatosTable += " ,''""""''+TRANS_OBSERVACION+''""""'' "
            myInsertQueryDatosTable += " FROM ( "
            myInsertQueryDatosTable += " SELECT [SV_CLAVE] AS RG_CIFRA_CONTROL "
            myInsertQueryDatosTable += " 	  ,[SV_SUBDEL] AS RG_SUBDEL "
            myInsertQueryDatosTable += "       ,(CASE "
            myInsertQueryDatosTable += "       WHEN [SV_TIPO] IN (''SIVEPA_EXTEM'') AND SV_SIVEPA IN (''SIVEPA-IMSS'') THEN ''SIVEPA_COP_EXTEMPORANEO'' "
            myInsertQueryDatosTable += "       WHEN [SV_TIPO] IN (''SIVEPA_OPORT'') AND SV_SIVEPA IN (''SIVEPA-IMSS'') THEN ''SIVEPA_COP_OPORTUNO'' "
            myInsertQueryDatosTable += "       WHEN [SV_TIPO] IN (''SIVEPA_ANUAL'') AND SV_SIVEPA IN (''SIVEPA-IMSS'') THEN ''SIVEPA_COP_ANUAL'' "
            myInsertQueryDatosTable += "       WHEN [SV_TIPO] IN (''SIVEPA_EXTEM'') AND SV_SIVEPA IN (''SIVEPA-RCV'') THEN ''SIVEPA_RCV_EXTEMPORANEO'' "
            myInsertQueryDatosTable += "       WHEN [SV_TIPO] IN (''SIVEPA_OPORT'') AND SV_SIVEPA IN (''SIVEPA-RCV'') THEN ''SIVEPA_RCV_OPORTUNO'' "
            myInsertQueryDatosTable += "       WHEN [SV_TIPO] IN (''SIVEPA_ANUAL'') AND SV_SIVEPA IN (''SIVEPA-RCV'') THEN ''SIVEPA_RCV_ANUAL'' "
            myInsertQueryDatosTable += "       END) AS RG_TIPO_FACTURA "
            myInsertQueryDatosTable += "       ,sector AS RG_SECTOR "
            myInsertQueryDatosTable += "       ,SUBSTRING([SV_REG_PATRONAL],1,10) AS RG_REGPAT "
            myInsertQueryDatosTable += "       ,[SV_RAZON_SOCIAL] AS RG_RAZON "
            myInsertQueryDatosTable += "       ,[SV_CREDITO] AS RG_CREDITO "
            myInsertQueryDatosTable += "       ,SUBSTRING(CONVERT(VARCHAR(10),[SV_PERIODO],103),4,7) AS RG_PERIODO "
            myInsertQueryDatosTable += "       ,[SV_COTIZ] AS RG_COTIZ "
            myInsertQueryDatosTable += "       ,[SV_EMI_REAL] AS RG_IMPORTE "
            myInsertQueryDatosTable += "       ,[SV_RECAUDACION] AS RG_IMPORTE_RECAUDADO "
            myInsertQueryDatosTable += "       ,NULL as FECHA_PAGO "
            myInsertQueryDatosTable += "       ,[SV_DIFERENCIA] AS IMPORTE_FALTANTE "
            myInsertQueryDatosTable += "       ,[SV_ASIG_INSPECTOR_FECHA] AS RG_FECH_ASIGNACION "
            myInsertQueryDatosTable += "       ,[SV_ASIG_INSPECTOR] AS RG_INSPECTOR "
            myInsertQueryDatosTable += "       ,(SELECT TOP 1 [SVD_DILI] "
            myInsertQueryDatosTable += " 		FROM [sirecasivepas].[dbo].[SV_DILI_BASE] "
            myInsertQueryDatosTable += " 		WHERE [SVD_SV_ID]=SV_ID "
            myInsertQueryDatosTable += " 		ORDER BY SVD_FECH_SYSTEM DESC,[SVD_ID] DESC) AS RG_DILIGENCIA "
            myInsertQueryDatosTable += "       ,(SELECT TOP 1 [SVD_FECH_DILI] "
            myInsertQueryDatosTable += " 		FROM [sirecasivepas].[dbo].[SV_DILI_BASE] "
            myInsertQueryDatosTable += " 		WHERE [SVD_SV_ID]=SV_ID "
            myInsertQueryDatosTable += " 		ORDER BY SVD_FECH_SYSTEM DESC,[SVD_ID] DESC) AS RG_FECH_DILIGENCIA "
            myInsertQueryDatosTable += " 		,NULL RG_FECHA_NOTIFICACION "
            myInsertQueryDatosTable += "   FROM [sirecasivepas].[dbo].[SV_BASE] left join sireca.dbo.patrones on regpat=SUBSTRING([SV_REG_PATRONAL],1,10) "
            myInsertQueryDatosTable += "   where SV_SUBDEL LIKE ''" + vsubdel + "'' AND [SV_CLAVE]=''" + vcifracontrol + "'' "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += "   SELECT [clave] AS RG_CIFRA_CONTROL "
            myInsertQueryDatosTable += "   ,SUBDEL AS RG_SUBDEL "
            myInsertQueryDatosTable += "   ,(CASE "
            myInsertQueryDatosTable += "   WHEN TIPOECO IN (''COP'') THEN ''ECO_COP_ESTRATEGICO'' "
            myInsertQueryDatosTable += "   WHEN TIPOECO IN (''COMP'') THEN ''ECO_COP_COMPLEMENTO'' "
            myInsertQueryDatosTable += "   WHEN TIPOECO IN (''RCV'') THEN ''ECO_RCV_ESTRATEGICO'' "
            myInsertQueryDatosTable += "   WHEN TIPOECO IN (''RCVCOMP'') THEN ''ECO_RCV_COMPLEMENTO'' "
            myInsertQueryDatosTable += "   END) AS RG_TIPO_FACTURA "
            myInsertQueryDatosTable += "    ,eco.SECTOR AS RG_SECTOR"
            myInsertQueryDatosTable += "    ,SUBSTRING([REG#PATRONAL],1,10) AS RG_REGPAT "
            myInsertQueryDatosTable += "    ,[NOMBRE O RAZON SOCIAL] AS RG_RAZON "
            myInsertQueryDatosTable += "    ,[CREDITO] AS RG_CREDITO "
            myInsertQueryDatosTable += " 	,(case "
            myInsertQueryDatosTable += " 	when [tipoECO] in (''COP'',''COMP'') then "
            myInsertQueryDatosTable += " 	(case when len(fechaeco)=5 then ''0''+substring(convert(varchar,fechaeco),1,1)+''/''+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+''/''+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQueryDatosTable += " 	when [tipoECO] in (''RCV'',''RCVCOMP'') then "
            myInsertQueryDatosTable += " 	(case when len(fechaeco)=5 then ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+''/''+substring(convert(varchar,fechaeco),2,4) else ''0''+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+''/''+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQueryDatosTable += " 	end "
            myInsertQueryDatosTable += " 	) as RG_PERIODO "
            myInsertQueryDatosTable += "       ,[COTIZ] AS RG_COTIZ "
            myInsertQueryDatosTable += "       ,[OMISION] AS RG_IMPORTE "
            myInsertQueryDatosTable += "       ,pago AS RG_IMPORTE_RECAUDADO "
            myInsertQueryDatosTable += "       ,fech_pago as FECHA_PAGO "
            myInsertQueryDatosTable += "       ,[OMISION]-pago AS RG_IMPORTE_FALTANTE "
            myInsertQueryDatosTable += "       ,[fechaSeleccion] AS RG_FECH_ASIGNACION "
            myInsertQueryDatosTable += "       ,[responsable] AS RG_INSPECTOR "
            myInsertQueryDatosTable += "       ,incidencia AS RG_DILIGENCIA "
            myInsertQueryDatosTable += "       ,fechaCaptura AS RG_FECH_DILIGENCIA "
            myInsertQueryDatosTable += "       ,(case when eco.incidencia in (''2'') then eco.fechaCaptura else "
            myInsertQueryDatosTable += " 		( "
            myInsertQueryDatosTable += " 			SELECT top 1 hinc.fecha "
            myInsertQueryDatosTable += " 			FROM [sireca].[dbo].[HistorialInc] as hinc "
            myInsertQueryDatosTable += " 			where hinc.incidencia=''2'' and hinc.ideco=eco.id "
            myInsertQueryDatosTable += " 			order by hinc.id desc "
            myInsertQueryDatosTable += " 		) end "
            myInsertQueryDatosTable += " 		) as RG_FECHA_NOTIFICACION "
            myInsertQueryDatosTable += "   FROM [sireca].[dbo].[eco] as eco "
            myInsertQueryDatosTable += "   where subdel LIKE ''" + vsubdel + "'' AND [clave]=''" + vcifracontrol + "'' "
            myInsertQueryDatosTable += " UNION ALL "
            myInsertQueryDatosTable += "   SELECT "
            myInsertQueryDatosTable += "   [OFF_CIFRA_CONTROL] AS RG_CIFRA_CONTROL "
            myInsertQueryDatosTable += "   ,[OFF_SUBDEL] AS RG_SUBDEL "
            myInsertQueryDatosTable += "   ,(SELECT [OFC_DESCRIPCION] "
            myInsertQueryDatosTable += " FROM [sirecaemisiones].[dbo].[OF_CATALOGO] WHERE [OFC_ID]=[OFF_TD]) AS RG_TIPO_FACTURA "
            myInsertQueryDatosTable += "       ,NULL AS RG_SECTOR "
            myInsertQueryDatosTable += "       ,[OFF_REGPAT] AS RG_REGPAT "
            myInsertQueryDatosTable += "       ,[OFF_RAZON] AS RG_RAZON "
            myInsertQueryDatosTable += "       ,[OFF_CREDITO] AS RG_CREDITO "
            myInsertQueryDatosTable += "       ,[OFF_PERIODO] RG_PERIODO "
            myInsertQueryDatosTable += "       ,[OFF_COTIZ] AS RG_COTIZ "
            myInsertQueryDatosTable += "       ,[OFF_IMPORTE] AS RG_IMPORTE "
            myInsertQueryDatosTable += "       ,0.00 AS RG_IMPORTE_RECAUDADO "
            myInsertQueryDatosTable += "       ,NULL as FECHA_PAGO "
            myInsertQueryDatosTable += "       ,[OFF_IMPORTE] AS RG_IMPORTE_FALTANTE "
            myInsertQueryDatosTable += " 	   ,[OFF_FECH_ASIGNACION] AS RG_FECH_ASIGNACION "
            myInsertQueryDatosTable += "       ,[OFF_ID_INSPECTOR] AS RG_INSPECTOR "
            myInsertQueryDatosTable += "       ,[OFF_DILIGENCIA] AS RG_DILIGENCIA "
            myInsertQueryDatosTable += "       ,[OFF_FECH_DILIGENCIA] AS RG_FECH_DILIGENCIA "
            myInsertQueryDatosTable += "       ,NULL as RG_FECHA_NOTIFICACION "
            myInsertQueryDatosTable += "   FROM [sirecaemisiones].[dbo].[OF_FACTURAS] "
            myInsertQueryDatosTable += "   WHERE OFF_SUBDEL LIKE ''" + vsubdel + "'' AND [OFF_CIFRA_CONTROL]=''" + vcifracontrol + "'' "
            myInsertQueryDatosTable += "   ) AS SUBRESULTADO1 "
            myInsertQueryDatosTable += "   LEFT JOIN "
            myInsertQueryDatosTable += "   ( "
            myInsertQueryDatosTable += "   SELECT "
            myInsertQueryDatosTable += "       CASE "
            myInsertQueryDatosTable += "       WHEN [V_INC_CAPTURA] IN (''2'') THEN ''2'' "
            myInsertQueryDatosTable += "       WHEN [V_INC_CAPTURA] IN (''9'') THEN ''9'' "
            myInsertQueryDatosTable += "       ELSE ''PAGADO'' "
            myInsertQueryDatosTable += "       END AS TRANS_GRUPO "
            myInsertQueryDatosTable += "       ,[V_FOLIO_P1] AS TRANS_FOLIO "
            myInsertQueryDatosTable += "       ,[V_FECHA_P1_TURNADO] AS TRANS_FOLIO_CREADO "
            myInsertQueryDatosTable += "       ,[V_FOLIO_P1_OBSERVACION] AS TRANS_OBSERVACION "
            myInsertQueryDatosTable += "       ,V_SUBDEL AS B_SUBDEL "
            myInsertQueryDatosTable += "       ,SUBSTRING(V_REGPAT,1,10) AS B_REGPAT "
            myInsertQueryDatosTable += "       ,V_CREDITO AS B_CREDITO "
            myInsertQueryDatosTable += "       ,V_PERIODO AS B_PERIODO "
            myInsertQueryDatosTable += "   FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQueryDatosTable += "   WHERE V_SUBDEL LIKE ''" + vsubdel + "'' AND V_CIFRA_CONTROL=''" + vcifracontrol + "'' "
            myInsertQueryDatosTable += "   ) AS FOLIOS ON B_SUBDEL LIKE RG_SUBDEL "
            myInsertQueryDatosTable += "   AND B_REGPAT=RG_REGPAT "
            myInsertQueryDatosTable += "   AND B_CREDITO=RG_CREDITO "
            myInsertQueryDatosTable += "   AND B_PERIODO=RG_PERIODO "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + DDLCControl.SelectedValue + "_" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBActInc_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActInc.Click
        GridViewCCInc.DataBind()
        Chart8.DataBind()
    End Sub

    Protected Sub DDLTipoFactura_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLTipoFactura.PreRender
        If Not CType(sender, DropDownList).Items.Contains(New ListItem("TODOS LAS FACTURAS", "%")) Then
            CType(sender, DropDownList).Items.Add(New ListItem("TODOS LAS FACTURAS", "%"))
        End If
    End Sub

    Protected Sub GridViewRCControl_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRCControl.PreRender
        Try
            GridViewRCControl.FooterRow.Cells(3).Text = "0"
            GridViewRCControl.FooterRow.Cells(4).Text = "0"
            GridViewRCControl.FooterRow.Cells(5).Text = "0"
            GridViewRCControl.FooterRow.Cells(6).Text = "0"
            For i As Int32 = 0 To (GridViewRCControl.Rows.Count - 1)
                GridViewRCControl.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewRCControl.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCControl.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewRCControl.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewRCControl.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCControl.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewRCControl.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewRCControl.Rows(i).Cells(5).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCControl.FooterRow.Cells(5).Text.Replace(",", ""))
                GridViewRCControl.FooterRow.Cells(6).Text = Convert.ToDouble(GridViewRCControl.Rows(i).Cells(6).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewRCControl.FooterRow.Cells(6).Text.Replace("$", "").Replace(",", ""))
            Next            
            GridViewRCControl.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCControl.FooterRow.Cells(3).Text))
            GridViewRCControl.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCControl.FooterRow.Cells(4).Text))
            GridViewRCControl.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCControl.FooterRow.Cells(5).Text))
            GridViewRCControl.FooterRow.Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewRCControl.FooterRow.Cells(6).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewCCInc_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCCInc.PreRender
        Try
            GridViewCCInc.FooterRow.Cells(2).Text = "0"
            GridViewCCInc.FooterRow.Cells(3).Text = "0"
            GridViewCCInc.FooterRow.Cells(4).Text = "0"
            GridViewCCInc.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCCInc.Rows.Count - 1)
                GridViewCCInc.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewCCInc.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewCCInc.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCCInc.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCCInc.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCCInc.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCCInc.FooterRow.Cells(4).Text = Convert.ToDouble(CType(GridViewCCInc.Rows(i).Cells(4).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewCCInc.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCCInc.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCCInc.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCCInc.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            GridViewCCInc.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCCInc.FooterRow.Cells(2).Text))
            GridViewCCInc.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCCInc.FooterRow.Cells(3).Text))
            GridViewCCInc.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCCInc.FooterRow.Cells(4).Text))
            GridViewCCInc.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCCInc.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub
End Class
Imports System.Data.OleDb
Imports email

Public Class _Default45
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim direccionip As String = ConfigurationSettings.AppSettings("direccionip")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAid") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAemision_p1").ToString.Equals("1") Then
            Else
                Response.Redirect("~/accesoDenegado.aspx")
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

    Protected Sub LBActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBActualizar.Click
        GridViewAValidar.DataBind()
        GridViewAValidarSivepa.DataBind()
        GridViewSeleccion.DataBind()
        GridViewSeleccionSivepas.DataBind()
        GridViewSeleccion0.DataBind()
        GridViewSeleccion0Sivepas.DataBind()
    End Sub

    Protected Sub TBFechAsig_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechAsig.Init
        'TBFechAsig.Text = Now.ToShortDateString
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If Not DDLInspector.Items.Contains(New ListItem("TODOS", "%")) Then
            DDLInspector.Items.Add(New ListItem("TODOS", "%"))
        End If
    End Sub

    Protected Sub GridViewAValidar_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewAValidar.PreRender
        GridViewAValidar.Caption = "<strong>" & GridViewAValidar.Rows.Count.ToString("N0") & " RESULTADOS A VERIFICAR</strong>"
    End Sub

    Protected Sub LBguardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        If DDLInc.SelectedValue.ToString.Equals("2") Then
            If LMLimite.Text.Length < 5 Then
                Dim lb As String = CType(sender, LinkButton).CommandArgument
                validacionP1(lb.Split("-").GetValue(1).ToString, lb.Split("-").GetValue(2).ToString)
                GridViewAValidar.DataBind()
                GridViewAValidarSivepa.DataBind()
                GridViewSeleccion.DataBind()
                GridViewSeleccionSivepas.DataBind()
                GridViewSeleccion0.DataBind()
                GridViewSeleccion0Sivepas.DataBind()
            End If
        ElseIf LMLimite0.Text.Length < 5 Then
            Dim lb As String = CType(sender, LinkButton).CommandArgument
            validacionP1(lb.Split("-").GetValue(1).ToString, lb.Split("-").GetValue(2).ToString)
            GridViewAValidar.DataBind()
            GridViewAValidarSivepa.DataBind()
            GridViewSeleccion.DataBind()
            GridViewSeleccionSivepas.DataBind()
            GridViewSeleccion0.DataBind()
            GridViewSeleccion0Sivepas.DataBind()
        End If
    End Sub

    Private Sub validacionP1(ByVal videco As String, ByVal vinc As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecaemisiones].[dbo].[eco] "
        textConmand += " SELECT "
        textConmand += " convert(varchar(15),id) as ID_ECO "
        textConmand += " ,'ORIGEN' as V_ORI_MUL "
        textConmand += " ,(case when [tipoECO] in ('COP','COMP') then 'COP' else 'RCV' end) AS TIPO_ECO "
        textConmand += " ,[subdel] AS SUBDEL "
        textConmand += " ,[REG#PATRONAL] AS REGPAT "
        textConmand += " ,[NOMBRE O RAZON SOCIAL] AS RAZON_SOCIAL "
        textConmand += " ,[CREDITO] AS CREDITO "
        textConmand += " ,[COTIZ] AS COTIZ "
        textConmand += " ,[OMISION] AS OMISION "
        textConmand += " ,(case "
        textConmand += " when [tipoECO] in ('COP','COMP') then "
        textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
        textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
        textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
        textConmand += " end "
        textConmand += " ) as PERIODO "
        textConmand += " ,[responsable] AS ID_CAPTURO "
        textConmand += " ,[fechaSeleccion] AS FECHA_ASIGNACION "
        textConmand += " ,[incidencia] AS INC_CAPTURA "
        textConmand += " ,[fechaCaptura] AS FECHA_CAPTURA "
        textConmand += " ,[sector] AS SECTOR "
        textConmand += " ,[validacion] AS VALIDACION "
        textConmand += " ,[pago] AS PAGO "
        textConmand += " ,[fech_pago] AS FECHA_PAGO "
        textConmand += " ,'" & Request.UserHostAddress & "' AS ID_IP_P1 "
        textConmand += " ,'" & Session.Item("SIRECAid").ToString & "' AS ID_CONFIRMO_P1 "
        textConmand += " ,GETDATE() AS FECHA_CONFIRMACION_INC_P1 "
        textConmand += " ,NULL AS V_FOLIO_P1 "
        textConmand += " ,NULL AS V_FOLIO_P1_TURNADO_A "
        textConmand += " ,NULL AS V_FECHA_P1_TURNADO "
        textConmand += " ,NULL AS V_FOLIO_P1_OBSERVACION "
        textConmand += " ,NULL AS ID_IP_P2 "
        textConmand += " ,NULL AS CONFIRMO_INC_P2 "
        textConmand += " ,NULL AS FECHA_CONFIRMACION_INC_P2 "
        textConmand += " ,NULL AS FOLIO_P2 "
        textConmand += " ,NULL AS FOLIO_P2_TURNADO_A "
        textConmand += " ,NULL AS FECHA_P2_TURNADO "
        textConmand += " ,NULL AS V_FOLIO_P2_OBSERVACION "
        textConmand += " ,clave as V_CIFRA_CONTROL "
        textConmand += " ,(case "
        textConmand += " when [tipoECO] in ('COP','COMP') then '02' "
        textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then '06' "
        textConmand += " end ) as V_TD "
        textConmand += " FROM [sireca].[dbo].[eco] "
        textConmand += " where id='" & videco & "' "
        textConmand += " and (case when incidencia in ('PAGADO','POR PROCESAR','RE','A') then incidencia else incidencia end)='" & vinc & "' "
        textConmand += " and not exists(SELECT [V_ID_ECO] FROM [sirecaemisiones].[dbo].[eco] WHERE [V_ID_ECO]='" & videco & "' and V_INC_CAPTURA in ('" + vinc + "')) "
        '-------------para notificacion
        If vinc.Equals("2") Or vinc.Equals("9") Then
            textConmand += " union all SELECT "
            textConmand += " convert(varchar(15),id) as ID_ECO "
            textConmand += " ,'MULTA' as V_ORI_MUL "
            textConmand += " ,(case when [tipoECO] in ('COP','COMP') then 'COP' else 'RCV' end) AS TIPO_ECO "
            textConmand += " ,[subdel] AS SUBDEL "
            textConmand += " ,[REG#PATRONAL] AS REGPAT "
            textConmand += " ,[NOMBRE O RAZON SOCIAL] AS RAZON_SOCIAL "
            textConmand += " ,(case when tipoECO in ('COP','COMP') then substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6) "
            textConmand += " else substring([CREDITO],1,2) + '6' + substring([CREDITO],4,6) end)  AS CREDITO "
            textConmand += " ,[COTIZ] AS COTIZ "
            textConmand += " ,([OMISION]*0.4) AS OMISION "
            textConmand += " ,(case "
            textConmand += " when [tipoECO] in ('COP','COMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " end "
            textConmand += " ) as PERIODO "
            textConmand += " ,[responsable] AS ID_CAPTURO "
            textConmand += " ,[fechaSeleccion] AS FECHA_ASIGNACION "
            textConmand += " ,[incidencia] AS INC_CAPTURA "
            textConmand += " ,[fechaCaptura] AS FECHA_CAPTURA "
            textConmand += " ,[sector] AS SECTOR "
            textConmand += " ,[validacion] AS VALIDACION "
            textConmand += " ,[pago] AS PAGO "
            textConmand += " ,[fech_pago] AS FECHA_PAGO "
            textConmand += " ,'" & Request.UserHostAddress & "' AS ID_IP_P1 "
            textConmand += " ,'" & Session.Item("SIRECAid").ToString & "' AS ID_CONFIRMO_P1 "
            textConmand += " ,GETDATE() AS FECHA_CONFIRMACION_INC_P1 "
            textConmand += " ,NULL AS V_FOLIO_P1 "
            textConmand += " ,NULL AS V_FOLIO_P1_TURNADO_A "
            textConmand += " ,NULL AS V_FECHA_P1_TURNADO "
            textConmand += " ,NULL AS V_FOLIO_P1_OBSERVACION "
            textConmand += " ,NULL AS ID_IP_P2 "
            textConmand += " ,NULL AS CONFIRMO_INC_P2 "
            textConmand += " ,NULL AS FECHA_CONFIRMACION_INC_P2 "
            textConmand += " ,NULL AS FOLIO_P2 "
            textConmand += " ,NULL AS FOLIO_P2_TURNADO_A "
            textConmand += " ,NULL AS FECHA_P2_TURNADO "
            textConmand += " ,NULL AS V_FOLIO_P2_OBSERVACION "
            textConmand += " ,clave as V_CIFRA_CONTROL "
            textConmand += " ,(case "
            textConmand += " when [tipoECO] in ('COP','COMP') then '80' "
            textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then '81' "
            textConmand += " end ) as V_TD "
            textConmand += " FROM [sireca].[dbo].[eco] "
            textConmand += " where id='" & videco & "' "
            textConmand += " and (case when incidencia in ('PAGADO','POR PROCESAR','RE','A') then incidencia else incidencia end)='" & vinc & "' "
            textConmand += " and not exists(SELECT [V_ID_ECO] FROM [sirecaemisiones].[dbo].[eco] WHERE [V_ID_ECO]='" & videco & "' and V_INC_CAPTURA in ('" + vinc + "')) "
        End If
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

    Protected Sub LBPrint_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBPrint.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "verificados.aspx?vincx=" & DDLInc.SelectedValue) & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800, scrollbars=1');")
        'CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("default.aspx", "reporte.aspx?") & "tinspector=" & DDLInspector.SelectedItem.Text & "&vfechaasignacion=" & TBFechAsig.Text & "&vinspector=" & DDLInspector.SelectedValue & "&vsubdel=" & DDLSubdel.SelectedValue & "&vinc=" & DDLInc.SelectedValue & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
    End Sub

    Protected Sub GridViewSeleccion_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewSeleccion.RowDataBound, GridViewSeleccionSivepas.RowDataBound
        Try
            If DDLInc.SelectedValue.ToString.Equals("2") Then
                If e.Row.RowIndex >= 0 Then
                    If CInt(e.Row.DataItem(5)) >= 32 Then
                        LMLimite.Text = "GENERE FOLIO PARA LOS CASOS QUE LLEGARON AL LÍMITE Y ACTUALICE PARA CONTINUAR CON LA VERIFICACIÓN"
                        e.Row.ForeColor = Drawing.Color.Red
                        e.Row.Font.Bold = True
                    Else
                        LMLimite.Text = ""
                        e.Row.ForeColor = Drawing.Color.Black
                        e.Row.Font.Bold = False
                    End If
                End If
            Else
                LMLimite.Text = ""
            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub GridViewSeleccion0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewSeleccion0.RowDataBound, GridViewSeleccion0Sivepas.RowDataBound
        Try
            If Not DDLInc.SelectedValue.ToString.Equals("2") Then
                If e.Row.RowIndex >= 0 Then
                    If CInt(e.Row.DataItem(5)) >= 32 Then
                        LMLimite0.Text = "GENERE FOLIO PARA LOS CASOS QUE LLEGARON AL LÍMITE Y ACTUALICE PARA CONTINUAR CON LA VERIFICACIÓN"
                        e.Row.ForeColor = Drawing.Color.Red
                        e.Row.Font.Bold = True
                    Else
                        LMLimite0.Text = ""
                        e.Row.ForeColor = Drawing.Color.Black
                        e.Row.Font.Bold = False
                    End If
                End If
            Else
                LMLimite0.Text = ""
            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub LBguardarCanInc_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("-")
        Dim videco As String = valores.GetValue(1).ToString
        Dim vinc As String = CType(GridViewAValidar.Rows(CInt(valores.GetValue(0))).Cells(15).FindControl("DDLInc"), DropDownList).SelectedValue
        Dim vfecha As String = CType(GridViewAValidar.Rows(CInt(valores.GetValue(0))).Cells(15).FindControl("TBFechInc"), TextBox).Text
        Dim vobservacion As String = CType(GridViewAValidar.Rows(CInt(valores.GetValue(0))).Cells(15).FindControl("TBObservacion"), TextBox).Text

        If IsDate(vfecha) Then
            '<<<<<<<<<<<Inicio de la Actualizar de la incidencia>>>>>>>>>>>>>>>>>>>
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            con = New OleDbConnection(cadenaconexion)
            cmd = New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [incidencia] = ?, [fechaCaptura]=? WHERE [id]=?"
            cmd.CommandText = myInsertQuery
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = vinc
            cmd.Parameters.Add("@fechaCaptura", OleDbType.Date).Value = Convert.ToDateTime(vfecha)
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(videco)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            '-------historial Incidencia INICIO--------------------        
            Dim conx As New OleDbConnection(cadenaconexion)
            Dim cmdx As New OleDbCommand()
            cmdx.Connection = conx
            Dim myInsertQueryx As String = " INSERT INTO [sireca].[dbo].[HistorialInc] "
            myInsertQueryx += " SELECT '" & DDLInspector.SelectedValue & "' "
            myInsertQueryx += " ,[subdel] "
            myInsertQueryx += " ,'" & Request.UserHostAddress() & "' "
            myInsertQueryx += " ,[sector] "
            myInsertQueryx += " ,[REG#PATRONAL] "
            myInsertQueryx += " ,[fechaEco] "
            myInsertQueryx += " ,[fechaCaptura] "
            myInsertQueryx += " ,[incidencia] "
            myInsertQueryx += " ,'" & vobservacion & "' "
            myInsertQueryx += " ,[tipoECO] "
            myInsertQueryx += " ,[id] "
            myInsertQueryx += " FROM [sireca].[dbo].[eco] "
            myInsertQueryx += " where id='" & videco & "' "

            cmdx.CommandText = myInsertQueryx
            conx.Open()
            cmdx.ExecuteNonQuery()
            conx.Close()
            GridViewAValidar.DataBind()
        End If
    End Sub

    Protected Sub TBFechInc_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

#Region "Guardando Sivepas"
    Protected Sub LBguardar0_Click(ByVal sender As Object, ByVal e As EventArgs)
        If DDLInc.SelectedValue.ToString.Equals("2") Then
            If LMLimite.Text.Length < 5 Then
                Dim lb As String = CType(sender, LinkButton).CommandArgument
                validacionP1Sivepa(lb.Split("-").GetValue(1).ToString, lb.Split("-").GetValue(2).ToString)

            End If
        ElseIf LMLimite0.Text.Length < 5 Then
            Dim lb As String = CType(sender, LinkButton).CommandArgument
            validacionP1Sivepa(lb.Split("-").GetValue(1).ToString, lb.Split("-").GetValue(2).ToString)

        End If
    End Sub

    Private Sub validacionP1Sivepa(ByVal videco As String, ByVal vinc As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim vsubdel As String = DDLSubdel.SelectedValue.ToString
        Dim textConmand As String = " INSERT INTO [sirecaemisiones].[dbo].[sivepas] "
        textConmand += " SELECT "
        textConmand += " convert(varchar(15),ID_ECO) as ID_ECO "
        textConmand += " ,'ORIGEN' as V_ORI_MUL "
        textConmand += " ,TIPO_ECO "
        textConmand += " ,SUBDEL "
        textConmand += " ,REGPAT "
        textConmand += " ,RAZON_SOCIAL "
        textConmand += " ,CREDITO,COTIZ "
        textConmand += " ,OMISION "
        textConmand += " ,PERIODO "
        textConmand += " ,ID_CAPTURO "
        textConmand += " ,FECHA_ASIGNACION "
        textConmand += " ,INC_CAPTURA "
        textConmand += " ,FECHA_CAPTURA "
        textConmand += " ,SECTOR "
        textConmand += " ,VALIDACION "
        textConmand += " ,RC_IMP_TOT AS PAGO "
        textConmand += " ,RC_FEC_MOV AS FECHA_PAGO "
        textConmand += " ,'" & Request.UserHostAddress & "' AS ID_IP_P1 "
        textConmand += " ,'" & Session.Item("SIRECAid").ToString & "' AS ID_CONFIRMO_P1 "
        textConmand += " ,GETDATE() AS FECHA_CONFIRMACION_INC_P1 "
        textConmand += " ,NULL AS V_FOLIO_P1 "
        textConmand += " ,NULL AS V_FOLIO_P1_TURNADO_A "
        textConmand += " ,NULL AS V_FECHA_P1_TURNADO "
        textConmand += " ,NULL AS V_FOLIO_P1_OBSERVACION "
        textConmand += " ,NULL AS ID_IP_P2 "
        textConmand += " ,NULL AS CONFIRMO_INC_P2 "
        textConmand += " ,NULL AS FECHA_CONFIRMACION_INC_P2 "
        textConmand += " ,NULL AS FOLIO_P2 "
        textConmand += " ,NULL AS FOLIO_P2_TURNADO_A "
        textConmand += " ,NULL AS FECHA_P2_TURNADO "
        textConmand += " ,NULL AS V_FOLIO_P2_OBSERVACION "
        textConmand += " ,SV_CLAVE as V_CIFRA_CONTROL "
        textConmand += " ,'03' as V_TD "
        textConmand += " FROM ( "
        textConmand += " SELECT "
        textConmand += " [SV_ID] AS ID_ECO "
        textConmand += " ,[SV_SIVEPA] AS TIPO_ECO "
        textConmand += " ,[SV_SUBDEL] AS SUBDEL "
        textConmand += " ,substring([SV_REG_PATRONAL],1,10) as REGPAT "
        textConmand += " ,[SV_RAZON_SOCIAL] AS RAZON_SOCIAL "
        textConmand += " ,[SV_CREDITO] AS CREDITO "
        textConmand += " ,[SV_COTIZ] AS COTIZ "
        textConmand += " ,[SV_DIFERENCIA] AS OMISION "
        textConmand += " ,(CASE WHEN LEN(MONTH([SV_PERIODO]))=1 THEN '0'+CONVERT(VARCHAR,MONTH([SV_PERIODO])) ELSE CONVERT(VARCHAR,MONTH([SV_PERIODO])) END)+'/'+CONVERT(VARCHAR,YEAR([SV_PERIODO])) AS PERIODO "
        textConmand += " ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE ID=[SV_ASIG_INSPECTOR]) AS CAPTURO "
        textConmand += " ,[SV_ASIG_INSPECTOR] AS ID_CAPTURO "
        textConmand += " ,[SV_ASIG_FECHA] AS FECHA_ASIGNACION "
        textConmand += " ,(SELECT TOP 1 [SVD_DILI] "
        textConmand += " FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='" + vinc + "' and [SVD_SV_ID]=SV_ID "
        textConmand += " order by SVD_ID desc) AS INC_CAPTURA "
        textConmand += " ,(SELECT TOP 1 [SVD_FECH_DILI] "
        textConmand += " FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='" + vinc + "' and [SVD_SV_ID]=SV_ID "
        textConmand += " order by SVD_ID desc) AS FECHA_CAPTURA "
        textConmand += " ,'' AS SECTOR "
        textConmand += " ,'' AS VALIDACION "
        textConmand += " ,'' AS ID_CONFIRMO_P1 "
        textConmand += " ,'' AS FECHA_CONFIRMACION_INC_P1 "
        textConmand += " ,(SELECT TOP 1 [SVD_FECH_DILI] "
        textConmand += " FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='2' and [SVD_SV_ID]=SV_ID "
        textConmand += " order by SVD_ID desc) AS FECHA_NOTIFICACION "
        textConmand += " ,SV_CLAVE "
        textConmand += " FROM [sirecasivepas].[dbo].[SV_BASE] "
        textConmand += " where [SV_SUBDEL]='" + vsubdel + "' AND [SV_ID]='" + videco + "' "
        textConmand += " ) AS sivepas "
        textConmand += " left join ( "
        textConmand += " SELECT [RC_PATRON],[RC_PER],[RC_CRED],SUM([RC_IMP_TOT]) AS [RC_IMP_TOT],MAX([RC_FEC_MOV]) AS [RC_FEC_MOV] FROM ( "
        textConmand += " SELECT [RC_FEC_MOV] "
        textConmand += " ,(SUBSTRING([RC_PATRON],2,8)+[RC_MOD]) AS [RC_PATRON] "
        textConmand += " ,[RC_PER] "
        textConmand += " ,[RC_CRED] "
        textConmand += " ,[RC_IMP_TOT] "
        textConmand += " FROM [lgp].[dbo].[RC] "
        textConmand += " ) AS LGP "
        textConmand += " GROUP BY [RC_PATRON],[RC_PER],[RC_CRED] "
        textConmand += " ) AS pagos on RC_PATRON=REGPAT AND YEAR(RC_PER)=YEAR('01/'+PERIODO) AND MONTH(RC_PER)=MONTH('01/'+PERIODO) AND [RC_CRED]=[CREDITO] "
        textConmand += " where not exists(SELECT [V_ID_ECO] FROM [sirecaemisiones].[dbo].[sivepas] WHERE [V_ID_ECO]='" & videco & "' and V_INC_CAPTURA in ('" + vinc + "')) "
        '-------------para notificacion
        If vinc.Equals("2") Or vinc.Equals("9") Then
            textConmand += " union all "
            textConmand += " SELECT "
            textConmand += " convert(varchar(15),ID_ECO) as ID_ECO "
            textConmand += " ,'MULTA' as V_ORI_MUL "
            textConmand += " ,TIPO_ECO "
            textConmand += " ,SUBDEL "
            textConmand += " ,REGPAT "
            textConmand += " ,RAZON_SOCIAL "
            textConmand += " ,substring([CREDITO],1,2) + '8' + substring([CREDITO],4,6) AS CREDITO,COTIZ "
            textConmand += " ,(OMISION*0.4) as OMISION "
            textConmand += " ,PERIODO "
            textConmand += " ,ID_CAPTURO "
            textConmand += " ,FECHA_ASIGNACION "
            textConmand += " ,INC_CAPTURA "
            textConmand += " ,FECHA_CAPTURA "
            textConmand += " ,SECTOR "
            textConmand += " ,VALIDACION "
            textConmand += " ,RC_IMP_TOT AS PAGO "
            textConmand += " ,RC_FEC_MOV AS FECHA_PAGO "
            textConmand += " ,'" & Request.UserHostAddress & "' AS ID_IP_P1 "
            textConmand += " ,'" & Session.Item("SIRECAid").ToString & "' AS ID_CONFIRMO_P1 "
            textConmand += " ,GETDATE() AS FECHA_CONFIRMACION_INC_P1 "
            textConmand += " ,NULL AS V_FOLIO_P1 "
            textConmand += " ,NULL AS V_FOLIO_P1_TURNADO_A "
            textConmand += " ,NULL AS V_FECHA_P1_TURNADO "
            textConmand += " ,NULL AS V_FOLIO_P1_OBSERVACION "
            textConmand += " ,NULL AS ID_IP_P2 "
            textConmand += " ,NULL AS CONFIRMO_INC_P2 "
            textConmand += " ,NULL AS FECHA_CONFIRMACION_INC_P2 "
            textConmand += " ,NULL AS FOLIO_P2 "
            textConmand += " ,NULL AS FOLIO_P2_TURNADO_A "
            textConmand += " ,NULL AS FECHA_P2_TURNADO "
            textConmand += " ,NULL AS V_FOLIO_P2_OBSERVACION "
            textConmand += " ,SV_CLAVE as V_CIFRA_CONTROL "
            textConmand += " ,'80' as V_TD "
            textConmand += " FROM ( "
            textConmand += " SELECT "
            textConmand += " [SV_ID] AS ID_ECO "
            textConmand += " ,[SV_SIVEPA] AS TIPO_ECO "
            textConmand += " ,[SV_SUBDEL] AS SUBDEL "
            textConmand += " ,substring([SV_REG_PATRONAL],1,10) as REGPAT "
            textConmand += " ,[SV_RAZON_SOCIAL] AS RAZON_SOCIAL "
            textConmand += " ,[SV_CREDITO] AS CREDITO "
            textConmand += " ,[SV_COTIZ] AS COTIZ "
            textConmand += " ,[SV_DIFERENCIA] AS OMISION "
            textConmand += " ,(CASE WHEN LEN(MONTH([SV_PERIODO]))=1 THEN '0'+CONVERT(VARCHAR,MONTH([SV_PERIODO])) ELSE CONVERT(VARCHAR,MONTH([SV_PERIODO])) END)+'/'+CONVERT(VARCHAR,YEAR([SV_PERIODO])) AS PERIODO "
            textConmand += " ,(SELECT UPPER(nombre) FROM fiscamovil.dbo.usuarios WHERE ID=[SV_ASIG_INSPECTOR]) AS CAPTURO "
            textConmand += " ,[SV_ASIG_INSPECTOR] AS ID_CAPTURO "
            textConmand += " ,[SV_ASIG_FECHA] AS FECHA_ASIGNACION "
            textConmand += " ,(SELECT TOP 1 [SVD_DILI] "
            textConmand += " FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='" + vinc + "' and [SVD_SV_ID]=SV_ID "
            textConmand += " order by SVD_ID desc) AS INC_CAPTURA "
            textConmand += " ,(SELECT TOP 1 [SVD_FECH_DILI] "
            textConmand += " FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='" + vinc + "' and [SVD_SV_ID]=SV_ID "
            textConmand += " order by SVD_ID desc) AS FECHA_CAPTURA "
            textConmand += " ,'' AS SECTOR "
            textConmand += " ,'' AS VALIDACION "
            textConmand += " ,'' AS ID_CONFIRMO_P1 "
            textConmand += " ,'' AS FECHA_CONFIRMACION_INC_P1 "
            textConmand += " ,(SELECT TOP 1 [SVD_FECH_DILI] "
            textConmand += " FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE SVD_DILI='2' and [SVD_SV_ID]=SV_ID "
            textConmand += " order by SVD_ID desc) AS FECHA_NOTIFICACION "
            textConmand += " ,SV_CLAVE "
            textConmand += " FROM [sirecasivepas].[dbo].[SV_BASE] "
            textConmand += " where [SV_SUBDEL]='" + vsubdel + "' AND [SV_ID]='" + videco + "' "
            textConmand += " ) AS sivepas "
            textConmand += " left join ( "
            textConmand += " SELECT [RC_PATRON],[RC_PER],[RC_CRED],SUM([RC_IMP_TOT]) AS [RC_IMP_TOT],MAX([RC_FEC_MOV]) AS [RC_FEC_MOV] FROM ( "
            textConmand += " SELECT [RC_FEC_MOV] "
            textConmand += " ,(SUBSTRING([RC_PATRON],2,8)+[RC_MOD]) AS [RC_PATRON] "
            textConmand += " ,[RC_PER] "
            textConmand += " ,[RC_CRED] "
            textConmand += " ,[RC_IMP_TOT] "
            textConmand += " FROM [lgp].[dbo].[RC] "
            textConmand += " ) AS LGP "
            textConmand += " GROUP BY [RC_PATRON],[RC_PER],[RC_CRED] "
            textConmand += " ) AS pagos on RC_PATRON=REGPAT AND YEAR(RC_PER)=YEAR('01/'+PERIODO) AND MONTH(RC_PER)=MONTH('01/'+PERIODO) AND [RC_CRED]=[CREDITO] "

            textConmand += " where not exists(SELECT [V_ID_ECO] FROM [sirecaemisiones].[dbo].[sivepas] WHERE [V_ID_ECO]='" & videco & "' and V_INC_CAPTURA in ('" + vinc + "')) "
        End If
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub
    Protected Sub LBguardarCanInc0_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("-")
        Dim videco As String = valores.GetValue(1).ToString
        Dim vinc As String = CType(GridViewAValidarSivepa.Rows(CInt(valores.GetValue(0))).Cells(15).FindControl("DDLInc0"), DropDownList).SelectedValue
        Dim vfecha As String = CType(GridViewAValidarSivepa.Rows(CInt(valores.GetValue(0))).Cells(15).FindControl("TBFechInc0"), TextBox).Text
        Dim vobservacion As String = CType(GridViewAValidarSivepa.Rows(CInt(valores.GetValue(0))).Cells(15).FindControl("TBObservacion0"), TextBox).Text

        Dim conx As New OleDbConnection(cadenaconexion)
        Dim cmdx As New OleDbCommand()
        cmdx.Connection = conx
        Dim myInsertQueryx As String = "  "
        myInsertQueryx += " INSERT INTO [sirecasivepas].[dbo].[SV_DILI_BASE]([SVD_IP],[SVD_FECH_SYSTEM],[SVD_USUARIO],[SVD_FECH_DILI],[SVD_DILI],[SVD_OBSERV],[SVD_SV_ID]) "
        myInsertQueryx += " VALUES "
        myInsertQueryx += " ( "
        myInsertQueryx += " '" & Request.UserHostAddress() & "' "
        myInsertQueryx += " ,getdate() "
        myInsertQueryx += " ,'" & DDLInspector.SelectedValue & "' "
        myInsertQueryx += " ,convert(datetime,'" + vfecha + "',103) "
        myInsertQueryx += " ,'" & vinc & "' "
        myInsertQueryx += " ,'" & vobservacion & "' "
        myInsertQueryx += " ," & videco & " "
        myInsertQueryx += " ) "
        cmdx.CommandText = myInsertQueryx
        conx.Open()
        cmdx.ExecuteNonQuery()
        conx.Close()
        GridViewAValidarSivepa.DataBind()
    End Sub
#End Region
End Class
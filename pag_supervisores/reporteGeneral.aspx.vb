Imports System.Data.OleDb

Public Class reporteGeneral1
    Inherits System.Web.UI.Page
    Dim fechaLimPago As Int32 = 16 ' fechaLimPago + 1
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            'Menu1.Items.Clear()
            'validar tipo de usuario para la asignacion del pae
            
            'fin de la validacion
            If (Session.Item("SIRECAuser_type").ToString.Equals("0")) And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                If Session.Item("SIRECA2chmod9").ToString.Equals("RG") Then
                    If (Session.Item("SIRECAsubdel").ToString <> "00") Then
                        HFsubdel.Value = Session.Item("SIRECAsubdel").ToString
                        'Else
                        'Response.Redirect("~/accesoDenegado.aspx")
                    End If
                Else
                    Panel3.Visible = False
                End If
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub

    Protected Sub BActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizar.Click
        Dim vsubdel As String = DDLSubdel.SelectedValue
        Dim vperiodo As String = DDLMes.SelectedValue + DDLAnio.SelectedValue
        Dim vrale As String = DDLRale.SelectedValue
        Dim vanio As String = "0"
        Dim vmes As String = "0"
        If vperiodo.Length = 5 Then
            vanio = vperiodo.Substring(1, 4)
            vmes = vperiodo.Substring(0, 1)
        Else
            vanio = vperiodo.Substring(2, 4)
            vmes = vperiodo.Substring(0, 2)
        End If
        Dim consulta As String = ""
        '--CREAR TABLA DE LA EMA
        If vmes.Length = 1 Then
            consulta = " if exists(select * from sireca.dbo.sysobjects where name = 'EMMA" & session.item("SIRECAdel").tostring & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & "') "
            consulta += " begin"
            consulta += " drop table sireca.dbo.EMMA" & session.item("SIRECAdel").tostring & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & ""
        Else
            consulta = " if exists(select * from sireca.dbo.sysobjects where name = 'EMMA" & session.item("SIRECAdel").tostring & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & "') "
            consulta += " begin"
            consulta += " drop table sireca.dbo.EMMA" & session.item("SIRECAdel").tostring & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & ""
        End If
        consulta += " End"
        consulta += " SELECT CASE WHEN pagos.pagos IS NULL THEN 'POR PAGAR'"
        consulta += " 		  ELSE 'LGP'"
        consulta += " 		  END AS [PAGADO POR]"
        consulta += " 		   ,pagos.[tipodepago],pagos.pagos, pagos.fecha, EMA.EMIP_IMP_EYM_FIJA+EMA.EMIP_IMP_EYM_EXCE+EMA.EMIP_IMP_EYM_PRED+"
        consulta += "            EMA.EMIP_IMP_EYM_PREE+ EMA.EMIP_IMP_INV_VIDA+EMA.EMIP_IMP_RIES_TRA+"
        consulta += "            EMA.EMIP_IMP_GUAR+ EMA.EMIP_IMP_INV_VIDA_O+EMA.EMIP_IMP_EYM_EXCE_O+"
        consulta += "            EMA.EMIP_IMP_EYM_PRED_O+ EMA.EMIP_IMP_EYM_PREE_O as emision"
        consulta += " 			, EMA.EMIP_PATRON AS EMIP_PATRON"
        consulta += " 			,EMA.EMIP_NOM_PATRON AS EMIP_NOM_PATRON"
        consulta += " 			,EMA.EMIP_NUM_TRAB_COT AS EMIP_NUM_TRAB_COT"
        consulta += " 			,EMA.EMIP_SEC"
        consulta += " 	,posision.lat"
        consulta += " 	,posision.lng"
        If vmes.Length = 1 Then
            consulta += " INTO sireca.dbo.EMMA" & session.item("SIRECAdel").tostring & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & ""
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa0" & vmes & "" & vanio & "')"

        Else
            consulta += " INTO sireca.dbo.EMMA" & session.item("SIRECAdel").tostring & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & ""
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa" & vmes & "" & vanio & "')"

        End If

        consulta += " as EMA LEFT JOIN( select (Substring(rc_patron,2,8)+''+rc_mod) as regpat"
        consulta += " ,sum(rc_imp_tot) as pagos "
        consulta += " ,min(rc_fec_mov) as fecha "
        'dd-mm-aa
        Dim fecha As Date = "1/01/2000"
        If vmes.Length = 1 Then
            fecha = "1" & "/0" & vmes & "/" & vanio
        Else
            fecha = "1" & "/" & vmes & "/" & vanio
        End If
        fecha = DateAdd(DateInterval.Month, 1, fecha)
        '----actualizar pagos
        'viernes=6
        'sabado=7
        'domingo=1

        'MsgBox(Weekday("22/12/2012"))
        'MsgBox(Weekday("23/12/2012"))
        Dim pmes As Date = Now
        Dim pmesi As Date = Now

        '----------------------------------------------------------------------------------------ELIMINANDO DIAS FESTIVOS
        fechaLimPago = quitarDiaFestivo(fecha)
        pmes = DateAdd(DateInterval.Day, fechaLimPago, fecha)
        pmesi = DateAdd(DateInterval.Day, (fechaLimPago + 1), fecha)

        'End If

        'validar si la fecha pmes es o no un dia festivo

        'MsgBox(DateAdd(DateInterval.Day, 16, fecha) & Weekday(DateAdd(DateInterval.Day, 16, fecha)))
        'MsgBox(Day(pmes))

        Dim pmesf As Date = DateAdd(DateInterval.Day, (Date.DaysInMonth(Year(fecha), Month(fecha)) - 1), fecha)

        Dim smesi As Date = DateAdd(DateInterval.Month, 1, fecha)
        Dim smesf As Date = DateAdd(DateInterval.Day, (Date.DaysInMonth(Year(smesi), Month(smesi)) - 1), smesi)

        Dim tmesi As Date = DateAdd(DateInterval.Month, 2, fecha)
        Dim tmesf As Date = DateAdd(DateInterval.Day, (Date.DaysInMonth(Year(tmesi), Month(tmesi)) - 1), tmesi)

        Dim mmesi As Date = DateAdd(DateInterval.Month, 3, fecha)

        consulta += " 		   ,case"
        consulta += " 				when min(rc_fec_mov)<='" & pmes & "' then 'OPORTUNO'"
        consulta += " 				when min(rc_fec_mov)>='" & pmesi & "' and min(rc_fec_mov)<='" & pmesf & "' then '1 MES'"
        consulta += " 				when min(rc_fec_mov)>='" & smesi & "' and min(rc_fec_mov)<='" & smesf & "' then '2 MES'"
        consulta += " 				when min(rc_fec_mov)>='" & tmesi & "' and min(rc_fec_mov)<='" & tmesf & "' then '3 MES'"
        consulta += " 				when min(rc_fec_mov)>='" & mmesi & "' then 'MOROSOS'"
        consulta += " 		   end as tipodepago		"

        consulta += "            from lgp.dbo.rc"
        If vmes.Length = 1 Then
            consulta += "                  where rc_per = '" & vanio & "/0" & vmes & "' and rc_imp_tot >0"
        Else
            consulta += "                  where rc_per = '" & vanio & "/" & vmes & "' and rc_imp_tot >0"
        End If

        consulta += "            group by rc_patron,rc_mod) as pagos ON Substring(EMA.emip_patron,2,10) = pagos.regpat"
        consulta += " 			left join (SELECT [lat],[lng],[regpat] FROM [sireca].[dbo].[patrones]) as posision on posision.regpat=substring(EMA.emip_patron,2,10) "
        'MsgBox(consulta)

        SqlDataSourceCrarT.SelectCommand = consulta
        SqlDataSourceCrarT.DataBind()
        GridView4.DataBind()
    End Sub
    Function quitarDiaFestivo(ByVal fecha As Date) As Int16
        '-------------consulta de la tabla de dias festivos
        Dim diaAbil As Boolean = False
        Dim fechaLimPagoSig As Int16 = fechaLimPago
        While True
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textCon As String = "SELECT [fecha] FROM [sireca].[dbo].[diasFestivos] WHERE [fecha]='" & DateAdd(DateInterval.Day, fechaLimPagoSig, fecha).ToShortDateString & "' "
            'MsgBox(textCon)
            catCMD.CommandText = textCon
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            diaAbil = False
            Do While myReader.Read()
                If IsDate(myReader.GetValue(0)) Then
                    'fecha = Convert.ToDateTime(myReader.GetValue(0))
                    diaAbil = True
                Else
                    diaAbil = False
                End If
            Loop
            myReader.Close()
            nwindConn.Close()
            '-----------------------------------------------------------------
            If (diaAbil Or Weekday(DateAdd(DateInterval.Day, fechaLimPagoSig, fecha)) = 6 Or Weekday(DateAdd(DateInterval.Day, fechaLimPagoSig, fecha)) = 7 Or Weekday(DateAdd(DateInterval.Day, fechaLimPagoSig, fecha)) = 1) Then
                fechaLimPagoSig = fechaLimPagoSig + 1
                'MsgBox(DateAdd(DateInterval.Day, fechaLimPagoSig, fecha).ToString)
            Else
                Exit While
            End If
        End While
        '------------consulta si es viernes, sabado o domingo
        'Dim fechaLimPagoSig As Int16 = fechaLimPago
        'If Weekday(DateAdd(DateInterval.Day, fechaLimPago, fecha)) = 6 Or Weekday(DateAdd(DateInterval.Day, fechaLimPagoSig, fecha)) = 7 Or Weekday(DateAdd(DateInterval.Day, fechaLimPago, fecha)) = 1 Then
        'fechaLimPagoSig = fechaLimPagoSig + 1
        'Else
        'pmes = DateAdd(DateInterval.Day, fechaLimPagoSig, fecha)
        'pmesi = DateAdd(DateInterval.Day, (fechaLimPagoSig + 1), fecha)
        'End If
        Return fechaLimPagoSig
    End Function
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            Dim vsubdel As String = DDLSubdel.SelectedValue
            Dim vperiodo As String = DDLMes.SelectedValue + DDLAnio.SelectedValue
            Dim vrale As String = DDLRale.SelectedValue
            Dim vanio As String = "0"
            Dim vmes As String = "0"
            If vperiodo.Length = 5 Then
                vanio = vperiodo.Substring(1, 4)
                vmes = vperiodo.Substring(0, 1)
            Else
                vanio = vperiodo.Substring(2, 4)
                vmes = vperiodo.Substring(0, 2)
            End If
            '----actualizar pagos
            'viernes=6
            'sabado=7
            'domingo=1

            'MsgBox(Weekday("22/12/2012"))
            'MsgBox(Weekday("23/12/2012"))

            Dim fecha As Date = "1/01/2000"

            If vmes.Length = 1 Then
                fecha = "1" & "/0" & vmes & "/" & vanio
            Else
                fecha = "1" & "/" & vmes & "/" & vanio
            End If
            fecha = DateAdd(DateInterval.Month, 1, fecha)

            fechaLimPago = quitarDiaFestivo(fecha)

            Dim pmes As Date = Now
            Dim pmesi As Date = Now

            pmes = DateAdd(DateInterval.Day, fechaLimPago, fecha)
            pmesi = DateAdd(DateInterval.Day, (fechaLimPago + 1), fecha)

            'MsgBox(Day(pmes))
            Dim pmesf As Date = DateAdd(DateInterval.Day, (Date.DaysInMonth(Year(fecha), Month(fecha)) - 1), fecha)

            Dim smesi As Date = DateAdd(DateInterval.Month, 1, fecha)
            Dim smesf As Date = DateAdd(DateInterval.Day, (Date.DaysInMonth(Year(smesi), Month(smesi)) - 1), smesi)

            Dim tmesi As Date = DateAdd(DateInterval.Month, 2, fecha)
            Dim tmesf As Date = DateAdd(DateInterval.Day, (Date.DaysInMonth(Year(tmesi), Month(tmesi)) - 1), tmesi)

            Dim mmesi As Date = DateAdd(DateInterval.Month, 3, fecha)
            'Actualizacion de los pagon, cruce con el PROCESAR
            Dim consulta As String = " update "
            If vmes.Length = 1 Then
                consulta += " sireca.dbo.EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & ""
            Else
                consulta += " sireca.dbo.EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & ""
            End If

            consulta += " set [PAGADO POR] = 'PROCESAR'"
            consulta += " 	,tipodepago = case"
            consulta += " 				when pro.[RCP_FEC_MOV]<='" & pmes & "' then 'OPORTUNO'"
            consulta += " 				when pro.[RCP_FEC_MOV]>='" & pmesi & "' and pro.[RCP_FEC_MOV]<='" & pmesf & "' then '1 MES'"
            consulta += " 				when pro.[RCP_FEC_MOV]>='" & smesi & "' and pro.[RCP_FEC_MOV]<='" & smesf & "' then '2 MES'"
            consulta += " 				when pro.[RCP_FEC_MOV]>='" & tmesi & "' and pro.[RCP_FEC_MOV]<='" & tmesf & "' then '3 MES'"
            consulta += " 				when pro.[RCP_FEC_MOV]>='" & mmesi & "' then 'MOROSOS'"
            consulta += " 		   end"

            consulta += " 	,fecha = pro.[RCP_FEC_MOV]"
            consulta += " 	,pagos = pro.[RCP_IMP_COP]"
            If vmes.Length = 1 Then
                consulta += " FROM sireca.dbo.EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & " as ema inner join procesar.dbo.RCPRO as pro on (pro.[RCP_REGPAT]=substring(ema.[EMIP_PATRON],2,11) and pro.[RCP_PER] = '" & vanio & "/0" & vmes & "')"
            Else
                consulta += " FROM sireca.dbo.EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & " as ema inner join procesar.dbo.RCPRO as pro on (pro.[RCP_REGPAT]=substring(ema.[EMIP_PATRON],2,11) and pro.[RCP_PER] = '" & vanio & "/" & vmes & "')"
            End If

            consulta += " where"
            consulta += " ema.pagos is null"
            consulta += " and pro.[RCP_IMP_COP] not in ('0')"

            SqlDataSourceCrarT.SelectCommand = consulta
            'SqlDataSourceCrarT.DataBind()
            GridView4.DataBind()
            '------------------

            If vmes.Length = 1 Then
                consulta += " FROM sireca.dbo.EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & " as ema inner join procesar.dbo.RCPRO as pro on (pro.[RCP_REGPAT]=substring(ema.[EMIP_PATRON],2,10) and pro.[RCP_PER] = '" & vanio & "/0" & vmes & "')"
            Else
                consulta += " FROM sireca.dbo.EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & " as ema inner join procesar.dbo.RCPRO as pro on (pro.[RCP_REGPAT]=substring(ema.[EMIP_PATRON],2,10) and pro.[RCP_PER] = '" & vanio & "/" & vmes & "')"
            End If

            consulta += " where"
            consulta += " ema.pagos is null"
            consulta += " and pro.[RCP_IMP_COP] not in ('0')"


            '----Total
            consulta = " SELECT count([PAGADO POR]) as [PATRONES]"
            consulta += " ,sum([EMIP_NUM_TRAB_COT]) as [COTIZANTES]"
            consulta += " ,sum([emision]) as [IMPORTE]"
            consulta += " ,'" & vrale & "' as [rale]"
            consulta += " ,'" & vsubdel & "' as [subdel]"
            consulta += " ,'" & vperiodo & "' as [periodo]"
            consulta += " ,'" & vanio & "' as [anio]"
            consulta += " ,'" & vmes & "' as [mes]"

            If vmes.Length = 1 Then
                consulta += " ,'EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & "' as [nomema]"
                consulta += " FROM [sireca].[dbo].[EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & "]"
            Else
                consulta += " ,'EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & "' as [nomema]"
                consulta += " FROM [sireca].[dbo].[EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & "]"
            End If

            SqlDataSourceTotal.SelectCommand = consulta
            'SqlDataSourceTotal.DataBind()
            GVTotal.DataBind()
            '----Detalles del TOTAL
            consulta = " SELECT [tipodepago]"
            consulta += " ,count(*) as [PATRONES]"
            consulta += " ,sum([EMIP_NUM_TRAB_COT]) as [COTIZANTES]"
            consulta += " ,sum([emision]) as [IMPORTE]"
            If vmes.Length = 1 Then
                consulta += " ,'EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & "' as [nomema]"
            Else
                consulta += " ,'EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & "' as [nomema]"
            End If
            consulta += " ,case "
            consulta += " when [tipodepago]='OPORTUNO' then '1'"
            consulta += " when [tipodepago]='1 MES' then '2'"
            consulta += " when [tipodepago]='2 MES' then '3'"
            consulta += " when [tipodepago]='3 MES' then '4'"
            consulta += " when [tipodepago]='MOROSOS' then '5'"
            consulta += " else '6'"
            consulta += " End"
            If vmes.Length = 1 Then
                consulta += " FROM [sireca].[dbo].[EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & "]"
            Else
                consulta += " FROM [sireca].[dbo].[EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & "]"
            End If
            consulta += " group by [tipodepago]"
            consulta += " order by 6 "
            SqlDataSourceDTotal.SelectCommand = consulta
            'SqlDataSourceDTotal.DataBind()
            GVDTotal.DataBind()
            '----Deben Request.UserHostName
            consulta = " if exists(select * from sireca.dbo.sysobjects where name = 'TEMPDEBEN" & Request.UserHostName.Replace(".", "_") & "') "
            consulta += " begin"
            consulta += " drop table sireca.dbo.TEMPDEBEN" & Request.UserHostName.Replace(".", "_") & ""
            consulta += " end"
            consulta += " SELECT"
            consulta += " case when (emma.EMIP_NUM_TRAB_COT) is null then 'SIN EMA'"
            consulta += " else 'CON EMA'"
            consulta += " end ESTADO"
            consulta += " ,(rale.REGPATR) as [PATRONES]"
            consulta += " ,[PAGADO POR]"
            consulta += " ,("
            consulta += " SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#] ="
            If vrale.IndexOf("COP") = -1 Then
                consulta += " (SELECT ecox.[incidencia] FROM [sireca].[dbo].[eco] as ecox WHERE substring(ecox.[REG#PATRONAL],1,10) in (replace(rale.REGPATR,'-','')) and ecox.[fechaEco] in ('" & vperiodo & "') and ecox.tipoEco in ('RCV','RCVCOMP'))"
            Else
                consulta += " (SELECT ecox.[incidencia] FROM [sireca].[dbo].[eco] as ecox WHERE substring(ecox.[REG#PATRONAL],1,10) in (replace(rale.REGPATR,'-','')) and ecox.[fechaEco] in ('" & vperiodo & "')  and ecox.tipoEco in ('COP','COMP'))"
            End If
            consulta += " ) as [INCIDENCIA]            "
            consulta += " ,rale.REGPATR"
            consulta += " ,rale.[IMPORTE]"
            consulta += " ,rale.[NUMCRED]"
            consulta += " ,rale.[TD]"
            consulta += " ,rale.[INC]"
            consulta += " ,rale.[FEINC]"
            consulta += " ,case when"
            consulta += " (emma.EMIP_NUM_TRAB_COT) is null then"
            consulta += " ("
            consulta += " SELECT eco.[COTIZ] "
            consulta += " FROM [sireca].[dbo].[eco] as eco"
            If vrale.IndexOf("COP") = -1 Then
                consulta += " where substring(eco.[REG#PATRONAL],1,10) in (replace(rale.REGPATR,'-','')) and eco.fechaEco in ('" & vperiodo & "') and eco.tipoEco in ('RCV','RCVCOMP')"
            Else
                consulta += " where substring(eco.[REG#PATRONAL],1,10) in (replace(rale.REGPATR,'-','')) and eco.fechaEco in ('" & vperiodo & "') and eco.tipoEco in ('COP','COMP')"
            End If
            consulta += " )"
            consulta += " else"
            consulta += " (emma.EMIP_NUM_TRAB_COT)"
            consulta += " end as [COTIZANTES]"
            consulta += " ,[pagos] as [PAGO]"
            consulta += " ,[fecha] as [FECHA DE PAGO]"
            consulta += " ,[EMIP_NOM_PATRON] as [RAZON SOCIAL]"
            consulta += " ,[tipodepago] as [PAGO A]"
            consulta += " ,'" & vrale & "' as [rale]"
            consulta += " ,'" & vsubdel & "' as [subdel]"
            consulta += " ,'" & vperiodo & "' as [periodo]"
            consulta += " ,'" & vanio & "' as [anio]"
            consulta += " ,'" & vmes & "' as [mes]"
            consulta += " ,emma.lat as [lat]"
            consulta += " ,emma.lng as [lng]"
            consulta += " ,emma.EMIP_SEC as [sector]"
            consulta += " INTO [sireca].[dbo].[TEMPDEBEN" & Request.UserHostName.Replace(".", "_") & "]"
            consulta += " FROM "
            If vmes.Length = 1 Then
                consulta += " [rale].[dbo].[" & vrale & "] AS rale left join [sireca].[dbo].[EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "0" & vmes & "" & vanio.Substring(2, 2) & "] AS emma"
            Else
                consulta += " [rale].[dbo].[" & vrale & "] AS rale left join [sireca].[dbo].[EMMA" & Session.Item("SIRECAdel").ToString & vsubdel & "" & vmes & "" & vanio.Substring(2, 2) & "] AS emma"
            End If
            consulta += " on ("
            consulta += " substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
            consulta += " ) "
            consulta += " WHERE"
            If vrale.IndexOf("COP") = -1 Then
                consulta += " rale.[TD] in ('06')"
            Else
                consulta += " rale.[TD] in ('02')"
            End If
            consulta += " and year(rale.[PERIODO])='" & vanio & "'"
            consulta += " and month(rale.[PERIODO])='" & vmes & "'"
            consulta += " SELECT [ESTADO]"
            consulta += " ,count(*) as PATRONES      "
            consulta += " ,sum([COTIZANTES]) as COTIZANTES "
            consulta += " ,sum([IMPORTE]) as [IMPORTE]   "
            consulta += " ,'" & vrale & "' as [rale]"
            consulta += " ,'" & vsubdel & "' as [subdel]"
            consulta += " ,'" & vperiodo & "' as [periodo]"
            consulta += " ,'" & vanio & "' as [anio]"
            consulta += " ,'" & vmes & "' as [mes]"
            consulta += " FROM [sireca].[dbo].[TEMPDEBEN" & Request.UserHostName.Replace(".", "_") & "]"
            consulta += " group by [ESTADO]"
            SqlDataSourceDeben.SelectCommand = consulta
            'SqlDataSourceDeben.DataBind()
            GVDeben.DataBind()
            Try
                Dim total As Double = Convert.ToDouble(GVTotal.Rows(0).Cells(2).Text.Replace("$", "").Replace(",", ""))

                For i As Int16 = 0 To (GVDTotal.Rows.Count - 1)
                    Dim totalDeven2 As Double = Convert.ToDouble(GVDTotal.Rows(i).Cells(3).Text.Replace("$", "").Replace(",", ""))
                    Dim porcentaje2 As String = ((totalDeven2 / total) * 100).ToString
                    'MsgBox(porcentaje2.IndexOf("."))
                    GVDTotal.Rows(i).Cells(4).Text = (porcentaje2.Substring(0, (porcentaje2.IndexOf(".") + 3)) & " %")
                Next
                Dim totalDeven As Double = Convert.ToDouble(GVDeben.Rows(0).Cells(3).Text.Replace("$", "").Replace(",", ""))
                Dim porcentaje As String = ((totalDeven / total) * 100).ToString
                GVDeben.Rows(0).Cells(4).Text = (porcentaje.Substring(0, (porcentaje.IndexOf(".") + 3)) & " %")
            Catch ex As Exception

            End Try
            '----Detalles de los que deben CON EMA
            consulta = " SELECT [INCIDENCIA]"
            consulta += " ,count(*) as [PATRONES]"
            consulta += " ,sum([COTIZANTES]) as [COTIZANTES]"
            consulta += " ,sum([IMPORTE]) as [IMPORTE]"
            consulta += " ,'" & vrale & "' as [rale]"
            consulta += " ,'" & vsubdel & "' as [subdel]"
            consulta += " ,'" & vperiodo & "' as [periodo]"
            consulta += " ,'" & vanio & "' as [anio]"
            consulta += " ,'" & vmes & "' as [mes]"
            consulta += " FROM [sireca].[dbo].[TEMPDEBEN" & Request.UserHostName.Replace(".", "_") & "]"
            consulta += " group by [INCIDENCIA]"
            consulta += " order by 3 desc"

            SqlDataSourceDDeben.SelectCommand = consulta
            SqlDataSourceDDeben.DataBind()
            GVDDeben.DataBind()

        Catch ex As Exception
        End Try
    End Sub

    Protected Sub Menu1_Init(ByVal sender As Object, ByVal e As EventArgs)
        'If Session.Item("SIRECAuser") Is Nothing Then
        'Response.Redirect("~/Login.aspx")
        'Else
        'If Session.Item("SIRECAchmod3").ToString.Equals("AP1") Then
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("Asignar PAE", "1", "", "~/pag_paes/AsignacionPae.aspx", "_self"))
        'End If
        'If Session.Item("SIRECAchmod4").ToString.Equals("AP2") Or Session.Item("SIRECAchmod5").ToString.Equals("AP3") Then
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("Asignar PAE x SECTOR", "2", "", "~/pag_paes/AsignacionPaeSector.aspx", "_self"))
        'End If
        'If Session.Item("SIRECAAdeudoZona").ToString.Equals("1") Then
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("IMPORTE ECO POR ZONA", "3", "", "~/adeudoZona/Default.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("IMPORTE PAE POR ZONA", "4", "", "~/adeudoZona/Cobros.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'End If
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("PAE", "3", "", "~/pag_paes/Default.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("Reporte PAE", "RP", "", "~/pag_paes/reporteEjecutor.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("Rep.AÑOS-MESES EJECUTOR", "RAM", "", "~/pag_paes/reportAM.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("Rep.AÑOS-MESES GENERAL", "RAMG", "", "~/pag_paes/reportAMG.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("No Localizados", "NL", "", "~/pag_paes/NoLocalizados.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("MENSUAL", "MEN", "", "~/pag_pae_result/Default.aspx", "_self"))
        'Menu1.Items.Add(New MenuItem("|"))
        'Menu1.Items.Add(New MenuItem("CONCENTRADO", "MEN", "", "~/pag_pae_result/concentrado.aspx", "_self"))
        'End If
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

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -1, Now)) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub
End Class
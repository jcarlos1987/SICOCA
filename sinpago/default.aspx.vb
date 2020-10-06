Imports Ionic.Zip
Imports System.Data.OleDb
Imports System.IO

Public Class _default7
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim direccionip As String = ConfigurationSettings.AppSettings("direccionip")
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            TBTemp.Text = "Buenas Tardes: "
            TBTemp.Text += vbCrLf + vbCrLf + "Respecto al proceso de recaudación de la emisión " + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + " se tienen los siguientes resultados después del cruce de la Emisión vs. el R.A.L.E. de cierre solicitado el " + fechaDelrale(DDLSubdel.SelectedValue, "COP") + ": "
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    BActualizarRGeneral.Visible = True
                    Dim gervalores() As String = getInfoMayores(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0))
                    'generar msg                    
                    TBTemp.Text += vbCrLf + vbCrLf + "La subdelegación " & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1) & " presenta " + CDbl(gervalores(0)).ToString("N0") + " patrones por un importe de " + CDbl(gervalores(1)).ToString("C") + " que no realizaron su pago de la emisión; sin embargo de estos últimos, los " + CDbl(gervalores(2)).ToString("N0") + " patrones mayores (" + CDbl(gervalores(3)).ToString("P") + ") significan " + CDbl(gervalores(4)).ToString("C") + " pesos (" + CDbl(gervalores(5)).ToString("P") + ") del total. "
                    TBTemp.Text += vbCrLf + "Descargue la base desde: " + direccionip + "/websireca/sinpago/documentos.aspx"

                Else
                    BActualizarRGeneral.Visible = False
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        Dim gervalores() As String = getInfoMayores(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0))
                        'generar msg
                        TBTemp.Text += vbCrLf + vbCrLf + "La subdelegación " & subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1) & " presenta " + CDbl(gervalores(0)).ToString("N0") + " patrones por un importe de " + CDbl(gervalores(1)).ToString("C") + " que no realizaron su pago de la emisión; sin embargo de estos últimos, los " + CDbl(gervalores(2)).ToString("N0") + " patrones mayores (" + CDbl(gervalores(3)).ToString("P") + ") significan " + CDbl(gervalores(4)).ToString("C") + " pesos (" + CDbl(gervalores(5)).ToString("P") + ") del total. "
                        TBTemp.Text += vbCrLf + "Descargue la base desde: " + direccionip + "/websireca/sinpago/documentos.aspx"
                    End If
                End If
            Next
            TBTemp.Text += vbCrLf + vbCrLf + "Derivado de lo anterior, se les solicita realicen las verificaciones correspondientes con la finalidad de implementar acciones inmediatas que no exceden de 3 días para la gestión y recuperación del pago correspondiente. "
            TBTemp.Text += vbCrLf + vbCrLf + "Sin otro particular, les envío un cordial saludo. "
            HLCorreo.NavigateUrl = "mailto:?subject=SIN PAGO EMISION " + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + " VS. RALE CIERRE " + fechaDelrale(DDLSubdel.SelectedValue, "COP") + "&body="
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -2, Now)) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -2, Now)).ToString, Year(DateAdd(DateInterval.Month, -2, Now)).ToString))        
    End Sub

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                generarZip(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0))
                generarBase(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0))
            Else
                If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                    generarZip(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0))
                    generarBase(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0))
                End If
            End If
        Next
    End Sub
    Protected Sub generarBase(ByVal subdelv As String)
        LabelError.Text = ""
        'exportacion inicio
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22

            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""

            myInsertQueryDatosTable = "  if not exists(select * from sireca.dbo.sysobjects where name = 'C_BC" & subdelv & DDLMes.SelectedValue & DDLAnio.SelectedValue & "_" & Now.ToShortDateString.Replace("/", "") & "') "
            myInsertQueryDatosTable += " begin "
            myInsertQueryDatosTable += " select "
            myInsertQueryDatosTable += " substring(EMIP_PATRON,2,11) as REG_PATRONAL "
            myInsertQueryDatosTable += " ,TD "
            myInsertQueryDatosTable += " ,INC "
            myInsertQueryDatosTable += " ,convert(varchar(50),NUMCRED) as CREDITO "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " ,IMPORTE as IMPORTE "
            myInsertQueryDatosTable += " ,EMIP_NOM_PATRON as RAZON_SOCIAL "
            myInsertQueryDatosTable += " ,EMIP_NUM_TRAB_COT as COTIZANTES "
            myInsertQueryDatosTable += " ,convert(varchar(50),EMIP_SEC) as SECTOR "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " SELECT TOP 1 [SP_DILI] "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[C_SIN_PAGO] "
            myInsertQueryDatosTable += " WHERE [SP_REGPAT]=substring(EMIP_PATRON,2,11) "
            myInsertQueryDatosTable += " AND [SP_CREDITO]= NUMCRED "
            myInsertQueryDatosTable += " AND [SP_PERIODO]=PERIODO "
            myInsertQueryDatosTable += " ORDER BY [SP_FECH_DILI] DESC "
            myInsertQueryDatosTable += " ) AS DILIGENCIA "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " SELECT TOP 1 [SP_FECH_DILI] "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[C_SIN_PAGO] "
            myInsertQueryDatosTable += " WHERE [SP_REGPAT]=substring(EMIP_PATRON,2,11) "
            myInsertQueryDatosTable += " AND [SP_CREDITO]= NUMCRED "
            myInsertQueryDatosTable += " AND [SP_PERIODO]=PERIODO "
            myInsertQueryDatosTable += " ORDER BY [SP_FECH_DILI] DESC "
            myInsertQueryDatosTable += " ) AS FECH_DILIGENCIA "
            myInsertQueryDatosTable += " into sireca.dbo.C_BC" & subdelv & DDLMes.SelectedValue & DDLAnio.SelectedValue & "_" & Now.ToShortDateString.Replace("/", "")
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[EMMA" + Session.Item("SIRECAdel").ToString + subdelv + DDLMes.SelectedValue + DDLAnio.SelectedValue.Substring(2, 2) + "] "
            myInsertQueryDatosTable += " left join rale.dbo.[" + getrale(subdelv, "COP") + "] "
            myInsertQueryDatosTable += " on replace([REGPATR],'-','')=substring(EMIP_PATRON,2,10) and [PERIODO]='01/" + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + "' "
            myInsertQueryDatosTable += " where  "
            myInsertQueryDatosTable += " pagos is null "
            myInsertQueryDatosTable += " and td in ('02','01') "
            myInsertQueryDatosTable += " end "
            myInsertQuery22 = myInsertQueryDatosTable
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

        Catch ex As Exception
            ''LabelError.Text = LabelError.Text + " _ " + ex.Message
        End Try
        'exportacion fin
    End Sub
    Protected Sub generarZip(ByVal subdelv As String)
        LabelError.Text = ""
        'exportacion inicio
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/sinpago/" & subdelv)) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/sinpago/" & subdelv))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/sinpago/" & Session.Item("SIRECAid").ToString & DDLMes.SelectedValue & DDLAnio.SelectedValue & ".csv")
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''REG_PATRONAL'',''TD'',''INC'',''CREDITO'',''PERIODO'',''IMPORTE'',''RAZON_SOCIAL'',''COTIZANTES'',''SECTOR'',''DILIGENCIA'',''FECH_DILIGENCIA'' "

            myInsertQueryDatosTable = " select "
            myInsertQueryDatosTable += " substring(EMIP_PATRON,2,11) as REG_PATRONAL "
            myInsertQueryDatosTable += " ,TD "
            myInsertQueryDatosTable += " ,INC "
            myInsertQueryDatosTable += " ,convert(varchar(50),NUMCRED) as CREDITO "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " ,convert(varchar(50),IMPORTE) as IMPORTE "
            myInsertQueryDatosTable += " ,''""""'' + EMIP_NOM_PATRON + ''""""'' as RAZON_SOCIAL "
            myInsertQueryDatosTable += " ,convert(varchar(50),EMIP_NUM_TRAB_COT) as COTIZANTES "
            myInsertQueryDatosTable += " ,convert(varchar(50),EMIP_SEC) as SECTOR "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " SELECT TOP 1 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[SP_DILI]) "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[C_SIN_PAGO] "
            myInsertQueryDatosTable += " WHERE [SP_REGPAT]=substring(EMIP_PATRON,2,11) "
            myInsertQueryDatosTable += " AND [SP_CREDITO]= NUMCRED "
            myInsertQueryDatosTable += " AND [SP_PERIODO]=PERIODO "
            myInsertQueryDatosTable += " ORDER BY [SP_FECH_DILI] DESC "
            myInsertQueryDatosTable += " ) AS DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(nvarchar,( "
            myInsertQueryDatosTable += " SELECT TOP 1 [SP_FECH_DILI] "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[C_SIN_PAGO] "
            myInsertQueryDatosTable += " WHERE [SP_REGPAT]=substring(EMIP_PATRON,2,11) "
            myInsertQueryDatosTable += " AND [SP_CREDITO]= NUMCRED "
            myInsertQueryDatosTable += " AND [SP_PERIODO]=PERIODO "
            myInsertQueryDatosTable += " ORDER BY [SP_FECH_DILI] DESC "
            myInsertQueryDatosTable += " ),103) AS FECH_DILIGENCIA "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[EMMA" + Session.Item("SIRECAdel").ToString + subdelv + DDLMes.SelectedValue + DDLAnio.SelectedValue.Substring(2, 2) + "] "
            myInsertQueryDatosTable += " left join rale.dbo.[" + getrale(subdelv, "COP") + "] "
            myInsertQueryDatosTable += " on replace([REGPATR],''-'','''')=substring(EMIP_PATRON,2,10) and [PERIODO]=''01/" + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + "'' "
            myInsertQueryDatosTable += " where "
            myInsertQueryDatosTable += " pagos is null "
            myInsertQueryDatosTable += " and td in (''02'',''01'') and inc not in ('25') "
            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            'Response.Clear()
            'Response.BufferOutput = False
            'Response.ContentType = "application/zip"
            'Response.AddHeader("content-disposition", "filename=" + subdelv + "_" + Now.ToShortDateString.Replace("/", "") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                'zip.Save(Response.OutputStream)
                zip.Save(Server.MapPath("~/descargas/sinpago/" & subdelv + "/" & subdelv & DDLMes.SelectedValue & DDLAnio.SelectedValue & "_" & Now.ToShortDateString.Replace("/", "") & ".zip"))
            End Using
            'Response.Close()
        Catch ex As Exception
            ''LabelError.Text = LabelError.Text + " _ " + ex.Message
        End Try
        'exportacion fin
    End Sub

    Function getrale(ByVal subdel As String, ByVal tipoCopRcv As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 name from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' order by fecha desc "
        'textConx += " GROUP BY eco.responsable"
        'MsgBox(valorUser)
        'MsgBox(textConx)
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

    Function fechaDelrale(ByVal subdel As String, ByVal tipoCopRcv As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 (datename(weekday,fecha)+','+datename(day,fecha)+' de '+datename(month,fecha)+' de '+datename(year,fecha)) from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' order by fecha desc "
        'textConx += " GROUP BY eco.responsable"
        'MsgBox(valorUser)
        'MsgBox(textConx)
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
    Function getInfoMayores(ByVal subdelv As String) As String()
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = "  "
        textConx += " select  "
        textConx += " REG_PATRONAL_TOT,IMPORTE_TOT "
        textConx += " ,REG_PATRONAL_MAYOR "
        textConx += " ,((REG_PATRONAL_MAYOR/convert(float,REG_PATRONAL_TOT))) as P_PATRONES "
        textConx += " ,IMPORTE_MAYOR "
        textConx += " ,((IMPORTE_MAYOR/convert(float,IMPORTE_TOT))) as P_IMP "
        textConx += " from "
        textConx += " (select "
        textConx += " '1' as idV "
        textConx += " ,count(EMIP_PATRON) as REG_PATRONAL_TOT "
        textConx += " ,sum(IMPORTE) as IMPORTE_TOT "
        textConx += " FROM [sireca].[dbo].[EMMA" + Session.Item("SIRECAdel").ToString + subdelv + DDLMes.SelectedValue + DDLAnio.SelectedValue.Substring(2, 2) + "] "
        textConx += " left join rale.dbo.[" + getrale(subdelv, "COP") + "] "
        textConx += " on replace([REGPATR],'-','')=substring(EMIP_PATRON,2,10) and [PERIODO]='01/" + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + "' "
        textConx += " where  "
        textConx += " pagos is null "
        textConx += " and td in ('02','01') and inc not in ('25') "
        textConx += " and not EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO] "
        textConx += " WHERE [RCP_IMP_COP]>0 and RCP_SUB like '" + subdelv + "' "
        textConx += " AND substring([RCP_REGPAT],1,10)=substring(EMIP_PATRON,2,10) and ('01/'+substring([RCP_PER],6,2)+'/'+substring([RCP_PER],1,4))=PERIODO "
        textConx += " ) "
        textConx += " ) as total "
        textConx += " left join "
        textConx += " (select "
        textConx += " '1' as idV "
        textConx += " ,count(EMIP_PATRON) as REG_PATRONAL_MAYOR "
        textConx += " ,sum(IMPORTE) as IMPORTE_MAYOR "
        textConx += " FROM [sireca].[dbo].[EMMA" + Session.Item("SIRECAdel").ToString + subdelv + DDLMes.SelectedValue + DDLAnio.SelectedValue.Substring(2, 2) + "] "
        textConx += " left join rale.dbo.[" + getrale(subdelv, "COP") + "] "
        textConx += " on replace([REGPATR],'-','')=substring(EMIP_PATRON,2,10) and [PERIODO]='01/" + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + "' "
        textConx += " where  "
        textConx += " pagos is null "
        textConx += " and td in ('02','01') and inc not in ('25') "
        textConx += " and IMPORTE>10000 "
        textConx += " and not EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO] "
        textConx += " WHERE [RCP_IMP_COP]>0 and RCP_SUB like '" + subdelv + "' "
        textConx += " AND substring([RCP_REGPAT],1,10)=substring(EMIP_PATRON,2,10) and ('01/'+substring([RCP_PER],6,2)+'/'+substring([RCP_PER],1,4))=PERIODO "
        textConx += " ) "
        textConx += " ) as mayor on mayor.idV=total.idV "

        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim mayores(6) As String
        Do While myReaderx.Read()
            mayores(0) = myReaderx.GetValue(0).ToString
            mayores(1) = myReaderx.GetValue(1).ToString
            mayores(2) = myReaderx.GetValue(2).ToString
            mayores(3) = myReaderx.GetValue(3).ToString
            mayores(4) = myReaderx.GetValue(4).ToString
            mayores(5) = myReaderx.GetValue(5).ToString
            Exit Do
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return mayores
    End Function
End Class
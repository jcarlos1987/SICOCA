Imports System.Data.OleDb

Public Class actualizar
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim indiceFila As Int32 = 0
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~/sinpago/actualizar.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            indiceFila = 0
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
        'Dim indiceMes As Int32 = -2
        'For i As Int32 = 1 To 2
        '    If Month(DateAdd(DateInterval.Month, indiceMes, Now)).ToString.Length = 1 Then
        '        DDLMes.Items.Add(New ListItem(MonthName(Month(DateAdd(DateInterval.Month, indiceMes, Now))), "0" & Month(DateAdd(DateInterval.Month, indiceMes, Now)).ToString))
        '    Else
        '        DDLMes.Items.Add(New ListItem(MonthName(Month(DateAdd(DateInterval.Month, indiceMes, Now))), Month(DateAdd(DateInterval.Month, indiceMes, Now)).ToString))
        '    End If
        '    indiceMes = indiceMes + i
        'Next
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        'New ListItem(Year(DateAdd(DateInterval.Month, -2, Now)).ToString, Year(DateAdd(DateInterval.Month, -2, Now)).ToString)
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem("2013", "2013"))
    End Sub

    Protected Sub LBguardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim lbTemp As LinkButton = CType(sender, LinkButton)
        Dim fechDili As String = CType(Me.GridViewSP.Rows(CInt(CType(sender, LinkButton).ToolTip.Split("_").GetValue(1))).Cells(11).FindControl("TBFDili"), TextBox).Text
        Dim dili As String = CType(Me.GridViewSP.Rows(CInt(CType(sender, LinkButton).ToolTip.Split("_").GetValue(1))).Cells(11).FindControl("DDLDili"), DropDownList).SelectedValue
        Dim regpat As String = lbTemp.ToolTip.Substring(0, 10)
        Dim credito As String = lbTemp.ToolTip.Substring(11, 9)
        Dim periodo As String = lbTemp.ToolTip.Substring(20, 10)
        'Dim cadena As String = +"_" + +"_" + +"_" + lbTemp.ToolTip.Substring(30)
        setDiligencia(fechDili, dili, regpat, credito, periodo)
        GridViewSP.DataBind()
        'setDiligencia()
        'MsgBox(CType(Me.GridViewSP.Rows(0).Cells(11).FindControl("TBFDili"), TextBox).Text)
        'MsgBox(CType(Me.GridViewSP.Rows(0).Cells(11).FindControl("DDLDili"), DropDownList).SelectedValue)
        
    End Sub
    Protected Sub setDiligencia(ByVal fechDili As String, ByVal dili As String, ByVal regpat As String, ByVal credito As String, ByVal periodo As String)
        Dim con As New OleDbConnection(cadenaconexion)
        Dim cmd As New OleDbCommand()
        Dim myInsertQuery As String = ""
        cmd.Connection = con
        myInsertQuery = " INSERT INTO [sireca].[dbo].[C_SIN_PAGO] "
        myInsertQuery += " ([SP_IP] "
        myInsertQuery += " ,[SP_FECH_SISTEM] "
        myInsertQuery += " ,[SP_FECH_DILI] "
        myInsertQuery += " ,[SP_DILI] "
        myInsertQuery += " ,[SP_REGPAT] "
        myInsertQuery += " ,[SP_CREDITO] "
        myInsertQuery += " ,[SP_PERIODO]) "
        myInsertQuery += " VALUES "
        myInsertQuery += " ( '" + Request.UserHostAddress + "'"
        myInsertQuery += " ,getdate() "
        myInsertQuery += " ,convert(datetime,'" + fechDili + "',103)"
        myInsertQuery += " ,'" + dili + "'"
        myInsertQuery += " ,'" + regpat + "'"
        myInsertQuery += " ,'" + credito + "'"
        myInsertQuery += " ,'" + periodo + "')"
        cmd.CommandText = myInsertQuery

        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Protected Sub GridViewSP_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewSP.RowDataBound
        If e.Row.RowIndex > -1 Then
            CType(e.Row.Cells(11).FindControl("LBguardar"), LinkButton).ToolTip = CType(e.Row.Cells(11).FindControl("LBguardar"), LinkButton).ToolTip + "_" + e.Row.RowIndex.ToString
        End If
    End Sub

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        GridViewSP.DataBind()
    End Sub

    Protected Sub LBDescargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBDescargar.Click
        getdescargar(Session.Item("SIRECAdel").ToString, DDLSubdel.SelectedValue, DDLMes.SelectedValue, DDLAnio.SelectedValue)
    End Sub
    Function getdescargar(ByVal delv As String, ByVal subdelv As String, ByVal mesv As String, ByVal aniov As String)
        Dim descargado As Int32 = 0
        Dim myInsertQuery22 As String = ""
        Try
            If Not IO.Directory.Exists(Server.MapPath("~/descargas/temp/sinpago/")) Then
                IO.Directory.CreateDirectory(Server.MapPath("~/descargas/temp/sinpago/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/temp/sinpago/" & Session.Item("SIRECAid").ToString & DDLMes.SelectedValue & DDLAnio.SelectedValue & ".csv")
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            ' CREARNDO BASE DE CREDITOS A DILIGENCIAR
            myInsertQueryNomTable = " SELECT ''REG_PATRONAL'',''TD'',''INC'',''CREDITO'',''PERIODO'',''IMPORTE'',''RAZON_SOCIAL'',''COTIZANTES'',''SECTOR'',''CVE_DILIGENCIA'',''FECH_DILIGENCIA'' "

            myInsertQueryDatosTable = " select "
            myInsertQueryDatosTable += " REG_PATRONAL "
            myInsertQueryDatosTable += " ,TD "
            myInsertQueryDatosTable += " ,INC "
            myInsertQueryDatosTable += " ,CREDITO "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " ,convert(nvarchar(50),IMPORTE) as IMPORTE "
            myInsertQueryDatosTable += " ,REPLACE(RAZON_SOCIAL,''-'','' '') as RAZON_SOCIAL "
            myInsertQueryDatosTable += " ,convert(nvarchar(50),COTIZANTES) as COTIZANTES "
            myInsertQueryDatosTable += " ,convert(nvarchar(50),SECTOR) as SECTOR "
            myInsertQueryDatosTable += " ,DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(nvarchar(10),FECH_DILIGENCIA,103) as FECH_DILIGENCIA "
            myInsertQueryDatosTable += " from ( "
            myInsertQueryDatosTable += " select "
            myInsertQueryDatosTable += " substring(EMIP_PATRON,2,10) as REG_PATRONAL "
            myInsertQueryDatosTable += " ,TD "
            myInsertQueryDatosTable += " ,INC "
            myInsertQueryDatosTable += " ,NUMCRED as CREDITO "
            myInsertQueryDatosTable += " ,PERIODO "
            myInsertQueryDatosTable += " ,IMPORTE as IMPORTE "
            myInsertQueryDatosTable += " ,replace(EMIP_NOM_PATRON,'','','' '') as RAZON_SOCIAL "
            myInsertQueryDatosTable += " ,EMIP_NUM_TRAB_COT as COTIZANTES "
            myInsertQueryDatosTable += " ,EMIP_SEC as SECTOR "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " SELECT TOP 1 (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] WHERE [CVE DILIG#]=[SP_DILI]) "
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
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[EMMA" + delv + subdelv + mesv + aniov.Substring(2) + "] "
            myInsertQueryDatosTable += " left join rale.dbo.[" + getrale(subdelv, "COP") + "] "
            myInsertQueryDatosTable += " on replace([REGPATR],''-'','''')=substring(EMIP_PATRON,2,10) and [PERIODO]=''01/" + mesv + "/" + aniov + "'' "
            myInsertQueryDatosTable += " where "
            myInsertQueryDatosTable += " pagos is null "
            myInsertQueryDatosTable += " and td in (''02'',''01'') "
            myInsertQueryDatosTable += " and not EXISTS(select [RCP_REGPAT] FROM [procesar].[dbo].[RCPRO] "
            myInsertQueryDatosTable += " WHERE [RCP_IMP_COP]>0 and RCP_SUB like ''" + subdelv + "'' "
            myInsertQueryDatosTable += " AND substring([RCP_REGPAT],1,10)=substring(EMIP_PATRON,2,10) and (''01/''+substring([RCP_PER],6,2)+''/''+substring([RCP_PER],1,4))=PERIODO "
            myInsertQueryDatosTable += " ) "
            myInsertQueryDatosTable += " ) as resultado "
            'myInsertQueryDatosTable += " order by IMPORTE desc "
            'myInsertQueryDatosTable += " where inc not in (''00'') "            

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
            ' CREARNDO BASE DE CREDITOS A DILIGENCIAR
            Dim nomFile2 As String = Server.MapPath("~/descargas/temp/sinpago/LISTA_DILIGENCIAS.csv")
            myInsertQueryNomTable = " select ''CVE_DILIGENCIA'',''DILIGENCIA'' "

            myInsertQueryDatosTable = " SELECT [CVE DILIG#] as CVE_DILIGENCIA,[ACTIVIDAD] as DILIGENCIA "
            myInsertQueryDatosTable += " FROM [sireca].[dbo].[catalogo] "
            myInsertQueryDatosTable += " where [CVE_SIN_PAGO]=''1'' and [CVE DILIG#] not in (''0'') "

            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile2 + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + subdelv + "_" + Now.ToShortDateString.Replace("/", "") + ".zip")
            Using zip As Ionic.Zip.ZipFile = New Ionic.Zip.ZipFile
                zip.AddFile(nomFile, "")
                zip.AddFile(nomFile2, "")
                zip.Save(Response.OutputStream)
            End Using
            Response.Close()
        Catch ex As Exception

        End Try
        Return descargado
    End Function

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
End Class
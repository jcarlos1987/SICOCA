Imports System.Data.OleDb

Public Class _default51
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("r") Is Nothing Then
        Else
            If TBCredito.Text.Replace(" ", "").Length = 0 Then
                TBCredito.Text = Request.QueryString("r").ToString
            End If
            Dim rsubdel As String = Session.Item("SIRECAsubdel")
            If Request.QueryString("rc") Is Nothing Then
            Else
                Dim rc As String = Request.QueryString("rc").ToString
                'rsubdel = "01"
                setCerrarCaso(rsubdel, Request.QueryString("r").ToString, rc)
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub GridViewDinamicas_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewDinamicas.PreRender
        CType(sender, GridView).Caption = CType(sender, GridView).Rows.Count.ToString("N0") & " CREDITO(S) POR <strong style='color: #FF0000'>CLASIFICAR</strong> EN COBRO"
    End Sub

    Protected Sub GridViewCobros_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCobros.PreRender
        CType(sender, GridView).Caption = CType(sender, GridView).Rows.Count.ToString("N0") & " CREDITO(S) CON <strong style='color: #FF0000'>FACTIBILIDAD</strong> DE COBRO"
    End Sub

    Protected Sub GridViewImpedimento_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewImpedimento.PreRender
        CType(sender, GridView).Caption = CType(sender, GridView).Rows.Count.ToString("N0") & " CREDITO(S) CON <strong style='color: #FF0000'>IMPEDIMENTO</strong> DE COBRO"
    End Sub

    Private Sub verificarCredCarga()
        Dim subdelx As String = DDLSubdel.SelectedValue
        Dim regpatx As String = ""
        'Creditos Dinamicos
        For i As Int32 = 0 To (GridViewDinamicas.Rows.Count() - 1)
            If CType(GridViewDinamicas.Rows(i).Cells(10).FindControl("CBAgregar"), CheckBox).Checked Then
                Dim vregpat As String = CType(GridViewDinamicas.Rows(i).Cells(10).FindControl("HFRegpat"), HiddenField).Value
                Dim vrazonSocial As String = CType(GridViewDinamicas.Rows(i).Cells(10).FindControl("HFrazonSocial"), HiddenField).Value
                Dim vSector As String = CType(GridViewDinamicas.Rows(i).Cells(10).FindControl("HFSector"), HiddenField).Value
                Dim vtipo As String = GridViewDinamicas.Rows(i).Cells(0).Text
                Dim vcredito As String = GridViewDinamicas.Rows(i).Cells(1).Text
                Dim vinc As String = GridViewDinamicas.Rows(i).Cells(2).Text
                Dim vfinc As String = GridViewDinamicas.Rows(i).Cells(3).Text
                Dim vdias As String = GridViewDinamicas.Rows(i).Cells(4).Text
                Dim vimporte As String = GridViewDinamicas.Rows(i).Cells(5).Text
                Dim vperiodo As String = GridViewDinamicas.Rows(i).Cells(6).Text
                Dim vtd As String = GridViewDinamicas.Rows(i).Cells(7).Text
                Dim vfalta As String = GridViewDinamicas.Rows(i).Cells(8).Text
                Dim vfnotificacion As String = GridViewDinamicas.Rows(i).Cells(9).Text
                regpatx = vregpat
                SetCreditosPae(vregpat, vtipo, "DINAMICA", vcredito, vinc, vfinc, vdias, vimporte, vperiodo, vtd, vfalta, vfnotificacion, vSector, vrazonSocial)
            End If
        Next
        'Creditos Cobrables
        For i As Int32 = 0 To (GridViewCobros.Rows.Count() - 1)
            If CType(GridViewCobros.Rows(i).Cells(10).FindControl("CBAgregar0"), CheckBox).Checked Then
                Dim vregpat As String = CType(GridViewCobros.Rows(i).Cells(10).FindControl("HFRegpat0"), HiddenField).Value
                Dim vrazonSocial As String = CType(GridViewCobros.Rows(i).Cells(10).FindControl("HFrazonSocial0"), HiddenField).Value
                Dim vSector As String = CType(GridViewCobros.Rows(i).Cells(10).FindControl("HFSector0"), HiddenField).Value
                Dim vtipo As String = GridViewCobros.Rows(i).Cells(0).Text
                Dim vcredito As String = GridViewCobros.Rows(i).Cells(1).Text
                Dim vinc As String = GridViewCobros.Rows(i).Cells(2).Text
                Dim vfinc As String = GridViewCobros.Rows(i).Cells(3).Text
                Dim vdias As String = GridViewCobros.Rows(i).Cells(4).Text
                Dim vimporte As String = GridViewCobros.Rows(i).Cells(5).Text
                Dim vperiodo As String = GridViewCobros.Rows(i).Cells(6).Text
                Dim vtd As String = GridViewCobros.Rows(i).Cells(7).Text
                Dim vfalta As String = GridViewCobros.Rows(i).Cells(8).Text
                Dim vfnotificacion As String = GridViewCobros.Rows(i).Cells(9).Text
                If regpatx.Length = 10 Then
                Else
                    regpatx = vregpat
                End If
                SetCreditosPae(vregpat, vtipo, "COBRO", vcredito, vinc, vfinc, vdias, vimporte, vperiodo, vtd, vfalta, vfnotificacion, vSector, vrazonSocial)
            End If
        Next
        'Creditos Incobrables
        For i As Int32 = 0 To (GridViewImpedimento.Rows.Count() - 1)
            If CType(GridViewImpedimento.Rows(i).Cells(10).FindControl("CBAgregar1"), CheckBox).Checked Then
                Dim vregpat As String = CType(GridViewImpedimento.Rows(i).Cells(10).FindControl("HFRegpat1"), HiddenField).Value
                Dim vrazonSocial As String = CType(GridViewImpedimento.Rows(i).Cells(10).FindControl("HFrazonSocial1"), HiddenField).Value
                Dim vSector As String = CType(GridViewImpedimento.Rows(i).Cells(10).FindControl("HFSector1"), HiddenField).Value
                Dim vtipo As String = GridViewImpedimento.Rows(i).Cells(0).Text
                Dim vcredito As String = GridViewImpedimento.Rows(i).Cells(1).Text
                Dim vinc As String = GridViewImpedimento.Rows(i).Cells(2).Text
                Dim vfinc As String = GridViewImpedimento.Rows(i).Cells(3).Text
                Dim vdias As String = GridViewImpedimento.Rows(i).Cells(4).Text
                Dim vimporte As String = GridViewImpedimento.Rows(i).Cells(5).Text
                Dim vperiodo As String = GridViewImpedimento.Rows(i).Cells(6).Text
                Dim vtd As String = GridViewImpedimento.Rows(i).Cells(7).Text
                Dim vfalta As String = GridViewImpedimento.Rows(i).Cells(8).Text
                Dim vfnotificacion As String = GridViewImpedimento.Rows(i).Cells(9).Text
                If regpatx.Length = 10 Then
                Else
                    regpatx = vregpat
                End If
                SetCreditosPae(vregpat, vtipo, "IMPEDIMENTO", vcredito, vinc, vfinc, vdias, vimporte, vperiodo, vtd, vfalta, vfnotificacion, vSector, vrazonSocial)
            End If
        Next
        Dim codebarx As String = regpatx + Now.Day.ToString("D2") + Now.Month.ToString("D2") + Now.Year.ToString().Substring(2)
        If regpatx.Length = 10 Then
            getfolioMandamiento(subdelx, "COP", codebarx)
            getfolioMandamiento(subdelx, "RCV", codebarx)
            getfolioAmpliacion(subdelx, "COP", codebarx)
            getfolioAmpliacion(subdelx, "RCV", codebarx)
        End If
    End Sub

    Private Sub SetCreditosPae(ByVal vregpat As String, ByVal vtipo As String, ByVal vgrupo As String, ByVal vcredito As String, ByVal vinc As String, ByVal vfinc As String, ByVal vdias As String, ByVal vimporte As String, ByVal vperiodo As String, ByVal vtd As String, ByVal vfalta As String, ByVal vfnotificacion As String, ByVal vSector As String, ByVal vrazonSocial As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " ([R_TIPO],[R_GRUPO],[R_SUBDEL],[R_REGPATR],[R_NUMCRED],[R_INC],[R_FEINC],[R_DIAS],[R_IMPORTE],[R_PERIODO],[R_TD],[R_FALTA],[R_FNOTIFICACION],[ID_SUP],[FECH_SUP],[D_CIT_SUP],[D_MAN_SUP],[D_AMP_SUP],[D_REM_SUP],[D_CER_SUP],[ID_INS],[FECH_INS],[FECH_DOC],[ACTIVO],[CODE_BAR],[CODE_QR],[SECTOR],[RAZON_SOCIAL],[R_FOLIO_MANDAMIENTO],[R_FOLIO_AMPLIACION]) "
        textConmand += " VALUES "
        textConmand += " ('" + vtipo + "' "
        textConmand += " ,'" + vgrupo + "' "
        textConmand += " ,'" + DDLSubdel.SelectedValue + "' "
        textConmand += " ,'" + vregpat + "' "
        textConmand += " ,'" + vcredito + "' "
        textConmand += " ,'" + vinc + "' "
        textConmand += " ,convert(datetime,'" + vfinc + "',103) "
        textConmand += " ," + vdias.Replace(",", "") + " "
        textConmand += " ," + vimporte.Replace("$", "").Replace(",", "") + " "
        textConmand += " ,'01/" + vperiodo + "' "
        textConmand += " ,'" + vtd + "' "
        textConmand += " ,convert(datetime,'" + vfalta + "',103) "
        textConmand += " ," + IIf(IsDate(vfnotificacion), "convert(datetime,'" + vfnotificacion + "',103) ", "NULL")
        textConmand += " ,'" + Session.Item("SIRECAid").ToString + "' "
        textConmand += " ,getdate() "
        textConmand += " ," + IIf(CBCitatorio.Checked, "1", "0") + " "
        textConmand += " ," + IIf(CBMandamiento.Checked, "1", "0") + " "
        textConmand += " ," + IIf(CBAmpliacion.Checked, "1", "0") + " "
        textConmand += " ," + IIf(CBRemocion.Checked, "1", "0") + " "
        textConmand += " ," + IIf(CBCerrajero.Checked, "1", "0") + " "
        textConmand += " ,'' "
        textConmand += " ,NULL "
        textConmand += " ,getdate() "
        textConmand += " ,1111 "
        textConmand += " ,'" + vregpat + Now.Day.ToString("D2") + Now.Month.ToString("D2") + Now.Year.ToString().Substring(2) + "'"
        textConmand += " ,'" + vregpat.Substring(1, 5) + Now.Day.ToString("D2") + Now.Month.ToString("D2") + Now.Year.ToString().Substring(2) + vregpat.Substring(5) + "'"
        textConmand += " ,'" + vSector + "' "
        textConmand += " ,'" + vrazonSocial + "' "
        textConmand += " ,NULL "
        textConmand += " ,NULL "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
        Repeater1.DataBind()
    End Sub
    Private Sub getfolioMandamiento(ByVal vsubdel As String, ByVal vtipoCopRcv As String, ByVal vcodebar As String)
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()

        Dim textConmand As String = " update [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " set R_FOLIO_MANDAMIENTO='" + getfolioNuevoMandamiento(vsubdel, vtipoCopRcv) + "' "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " where month(convert(varchar,[FECH_SUP],103))=month(getdate()) and year(convert(varchar,[FECH_SUP],103))=year(getdate()) "
        textConmand += " and [D_MAN_SUP]='1' AND R_SUBDEL='" + vsubdel + "' AND R_TIPO='" + vtipoCopRcv + "' and R_FOLIO_MANDAMIENTO is null "
        textConmand += " and CODE_BAR='" + vcodebar + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        'Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        'Do While myReader.Read()
        '    vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        'Loop
        'myReader.Close()
        nwindConn.Close()
    End Sub
    Private Sub getfolioAmpliacion(ByVal vsubdel As String, ByVal vtipoCopRcv As String, ByVal vcodebar As String)
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()

        Dim textConmand As String = " update [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " set R_FOLIO_AMPLIACION='" + getfolioNuevoMandamiento(vsubdel, vtipoCopRcv) + "' "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " where month(convert(varchar,[FECH_SUP],103))=month(getdate()) and year(convert(varchar,[FECH_SUP],103))=year(getdate()) "
        textConmand += " and [D_AMP_SUP]='1' AND R_SUBDEL='" + vsubdel + "' AND R_TIPO='" + vtipoCopRcv + "' and R_FOLIO_AMPLIACION is null "
        textConmand += " and CODE_BAR='" + vcodebar + "' "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        'Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        'Do While myReader.Read()
        '    vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        'Loop
        'myReader.Close()
        nwindConn.Close()
    End Sub
    Private Function getfolioNuevoMandamiento(ByVal vsubdel As String, ByVal vtipoCopRcv As String) As String
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " SELECT "
        textConmand += " (ISNULL(max(valor.R_FOLIO_MANDAMIENTO),0)+1) as FOLIO "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] as valor "
        textConmand += " where month(convert(varchar,valor.[FECH_SUP],103))=month(getdate()) and year(convert(varchar,valor.[FECH_SUP],103))=year(getdate()) "
        textConmand += " and valor.[D_MAN_SUP]='1' AND valor.R_SUBDEL='" + vsubdel + "' AND valor.R_TIPO='" + vtipoCopRcv + "' "
        textConmand += " group by valor.R_SUBDEL "
        catCMD.CommandText = textConmand
        nwindConn.Open()

        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        Loop
        myReader.Close()
        nwindConn.Close()
        Return vfolio
    End Function
    Private Function getfolioNuevoAmpliacion(ByVal vsubdel As String, ByVal vtipoCopRcv As String) As String
        Dim vfolio As String = "77777"
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " SELECT "
        textConmand += " (ISNULL(max(valor.R_FOLIO_AMPLIACION),0)+1) as FOLIO "
        textConmand += " FROM [sirecacobros].[dbo].[PAE_CRED] as valor "
        textConmand += " where month(convert(varchar,valor.[FECH_SUP],103))=month(getdate()) and year(convert(varchar,valor.[FECH_SUP],103))=year(getdate()) "
        textConmand += " and valor.[D_AMP_SUP]='1' AND valor.R_SUBDEL='" + vsubdel + "' AND valor.R_TIPO='" + vtipoCopRcv + "' "
        textConmand += " group by valor.R_SUBDEL "
        catCMD.CommandText = textConmand
        nwindConn.Open()

        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            vfolio = CInt(myReader.GetValue(0)).ToString("D5")
        Loop
        myReader.Close()
        nwindConn.Close()
        Return vfolio
    End Function
    Protected Sub BBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BBuscar.Click
        GridViewDinamicas.DataBind()
        RepeaterDatos.DataBind()
    End Sub

    Protected Sub LBAmpliacion_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBAmpliacion.Click
        verificarCredCarga()
    End Sub

    Private Sub setCerrarCaso(ByVal vsubdel As String, ByVal vregpat As String, ByVal rc As String)
        'Funcion para cerrar el caso, para indicar al sistema que se a concluido
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " UPDATE [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " SET [ACTIVO] = " + rc + " "
        textConmand += " WHERE [R_SUBDEL]='" + vsubdel + "' and [R_REGPATR]='" + vregpat + "' and ACTIVO=1 "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub
End Class
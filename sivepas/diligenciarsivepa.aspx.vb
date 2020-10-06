Imports System.Data.OleDb

Public Class diligenciarsivepa
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DDLDiligencia_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDiligencia.SelectedIndexChanged
        LMsg.Text = ""
        If DDLDiligencia.SelectedValue.ToString.Equals("1") Then
            PanelHora.Visible = True
        Else
            PanelHora.Visible = False
        End If
        If DDLDiligencia.SelectedValue.ToString.Equals("1") And DDLHora.Text.Equals("00") Then
            LMsg.Text = "Establesca la hora del Citatorio"
        End If
    End Sub

    Protected Sub LBGuardar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBGuardar.Click
        LMsg.Text = ""
        If IsDate(TBFechDili.Text) Then
            If CDate(TBFechDili.Text) > Now Then
                LMsg.Text = "Fecha invalida, No puede hacer una diligencia a Futuro"
            Else
                If DDLDiligencia.SelectedValue.Equals("NULO") Then
                    LMsg.Text = " Seleccione una DILIGENCIA"
                Else
                    If DDLDiligencia.SelectedValue.Equals("9") Then
                        If cargarFotosDoc() Then
                            guardarDiligencia(DDLDiligencia.SelectedValue.ToString)
                        Else
                            LMsg.Text = " CARGUE FOTOS PARA GUARDAR LA DILIGENCIA"
                        End If
                    ElseIf DDLDiligencia.SelectedValue.Equals("1") Then
                        If DDLHora.Text.Equals("00") Then
                            LMsg.Text = "Establesca la hora del Citatorio"
                        Else
                            guardarDiligencia(DDLDiligencia.SelectedValue.ToString)
                        End If
                    Else
                        guardarDiligencia(DDLDiligencia.SelectedValue.ToString)
                    End If
                    DetailsView1.DataBind()
                    DDLDiligencia.SelectedValue = "2"
                    LMsg.Text = ""
                End If
            End If
        Else
            LMsg.Text = "Fecha invalida dd/mm/aaaa"
        End If
    End Sub
    Protected Function cargarFotosDoc() As Boolean
        Dim cargado As Boolean = False
        Dim countFotos As Int32 = 0
        For i As Int32 = 1 To 8
            Dim foto As FileUpload = CType(Page.FindControl("FileUpload" & (i)), FileUpload)
            If foto.FileName.Replace(" ", "").Length > 0 Then
                Dim diligencia As String = DDLDiligencia.SelectedValue
                Dim tipoDirectorio As String = "DILIGENCIA" & diligencia

                Dim regpat As String = CType(DetailsView1.Rows(1).Cells(1).FindControl("HyperLink1"), HyperLink).Text.Substring(0, 10)

                Dim carpeta As String = Server.MapPath("~\documentos\emision\" & regpat & "\" & tipoDirectorio)
                If Not System.IO.Directory.Exists(carpeta) Then
                    Dim dir = System.IO.Directory.CreateDirectory(carpeta)
                End If
                Dim nombreFile As String = Session.Item("SIRECAid").ToString & "." & Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName
                'Dim nombreFile As String = Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName.Split(".").GetValue(foto.FileName.Split(".").Count - 1)
                foto.SaveAs(carpeta & "\" & nombreFile)
                countFotos += 1
                guardarFotoEnBD(tipoDirectorio, "98", diligencia, regpat, nombreFile) 'SIVEPA=98
            End If
        Next
        If countFotos > 0 Then
            cargado = True
        End If
        Return cargado
    End Function
    Protected Sub guardarFotoEnBD(ByVal tipoDirectorio As String, ByVal doceEntregado As String, ByVal diligencia As String, ByVal regpat As String, ByVal nombreFile As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecacobros].[dbo].[CO_ARCHIVOS]([AR_HOST],[AR_FECH_SISTEM],[AR_DEL],[AR_SUBDEL],[AR_REGPAT] " _
& " ,[AR_AC_DOC_ENTRGADO],[AR_AC_DILIGENCIA],[AR_AC_FECH_DILIGENCIA],[AR_NOM_ARCHIVO]) " _
& " VALUES " _
& " ( " _
& " '" & Request.UserHostAddress & "' " _
& " ,getdate() " _
& " ,'" & Session.Item("SIRECAdel").ToString & "'" _
& " ,'" & DetailsView1.Rows(0).Cells(1).Text & "'" _
& " ,'" & regpat & "' " _
& " ,'" & doceEntregado & "' " _
& " ,'" & diligencia & "' " _
& " ,convert(datetime,'" & If(IsDate(TBFechDili.Text), TBFechDili.Text, Now.ToShortDateString) & "',103) " _
& " ,'" & tipoDirectorio & "\" & nombreFile & "' " _
& " ) "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            MsgBox("guardar foto bd " & ex.Message)
            MsgBox("guardar foto bd " & ex.StackTrace)
        End Try
    End Sub
    Protected Sub guardarDiligencia(ByVal diligenciaCapturada As String)
        Try
            Dim incidenciaValue As String = diligenciaCapturada
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = " INSERT INTO [sirecasivepas].[dbo].[SV_DILI_BASE] "
            myInsertQuery += " ([SVD_IP] "
            myInsertQuery += " ,[SVD_FECH_SYSTEM] "
            myInsertQuery += " ,[SVD_USUARIO] "
            myInsertQuery += " ,[SVD_FECH_DILI] "
            myInsertQuery += " ,[SVD_DILI] "
            myInsertQuery += " ,[SVD_OBSERV] "
            myInsertQuery += " ,[SVD_SV_ID]) "
            myInsertQuery += " VALUES "
            myInsertQuery += " ('" + Request.UserHostAddress + "'"
            myInsertQuery += " ,getdate() "
            myInsertQuery += " ,'" + Session.Item("SIRECAid").ToString + "'"
            myInsertQuery += " ,convert(datetime,'" + TBFechDili.Text + "',103)"
            myInsertQuery += " ,'" + incidenciaValue + "'"
            myInsertQuery += " ,'" + TBObservacion.Text + "' "
            myInsertQuery += " ," + Request.QueryString("regpatid").ToString + ") "

            cmd.CommandText = myInsertQuery
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception
            'MsgBox("guardar dili bd " & ex.Message)
            'MsgBox("guardar dili bd " & ex.Source)
            'MsgBox("guardar dili bd " & ex.StackTrace)
        End Try
    End Sub
    Protected Sub updateTableEcoControl(ByVal up_idinspector As String, ByVal up_inc As String, ByVal up_fech_inc As String, ByVal data_regpat As String, ByVal data_periodo As String, ByVal data_credito As String)
        'Try
        '    Dim con22 As New OleDbConnection(cadenaconexion)
        '    Dim cmd22 As New OleDbCommand()
        '    cmd22.Connection = con22
        '    Dim myInsertQuery22 As String = ""
        '    myInsertQuery22 = " UPDATE [sireca].[dbo].[ecocontrol] " _
        '    & " SET [INSPECTOR]='" + up_idinspector + "' " _
        '    & " ,[INC]='" + up_inc + "' " _
        '    & " ,[FECH_CAP]='" + up_fech_inc + "' " _
        '    & " ,[CICLO_CAP]='1' " _
        '    & " WHERE substring([REGPAT],1,10)='" + data_regpat + "' and [PERIODO]='" + data_periodo + "' and [CREDITO]='" + data_credito + "' "
        '    cmd22.CommandText = myInsertQuery22
        '    con22.Open()
        '    If cmd22.ExecuteNonQuery() > 0 Then
        '        'Actualizado
        '    Else
        '    End If
        '    con22.Close()
        'Catch ex As Exception
        '    'LError.Text = "Error al Actualizar"
        'End Try
    End Sub

    Protected Sub TBFechDili_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechDili.Init
        TBFechDili.Text = Now.ToShortDateString
    End Sub

    Protected Sub HyperLink1_Init(ByVal sender As Object, ByVal e As EventArgs) Handles HyperLink1.Init
        CType(sender, HyperLink).NavigateUrl = "~/pag_cobros/galeriaarchivoscargados.aspx?regpat=" & Request.QueryString("regpat").ToString()
    End Sub
End Class
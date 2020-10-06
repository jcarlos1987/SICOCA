Imports System.Data.OleDb

Public Class capturadiligencia
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    Protected Sub TBFechResvProv_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechResvProv.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub TBFechDeligencia_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechDeligencia.Init
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = "<strong>" & GridView1.Rows.Count.ToString("N0") & " CREDITOS ASIGNADOS.</strong>"
    End Sub

    Protected Sub LBBuscar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBBuscar.Click
        GridView1.DataBind()
        If GridView1.Rows.Count > 0 Then
            If TBCredito.Text.ToUpper.Substring(16).Equals("C") Then
                PanelAcciones.Visible = False
                PanelCitatorio.Visible = True
            Else
                PanelAcciones.Visible = True
                PanelCitatorio.Visible = False
            End If
        End If
    End Sub

    Protected Sub LBGuardar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBGuardar.Click
        'Carga de la diligencia inicio
        If DDLDiligencia.SelectedValue.Equals("0") Then
            LMensaje.Text = "Selecione la diligencia realizada"
        Else
            If DDLDiligencia.SelectedItem.Text.Contains("(foto)") Then
                Dim fotosCargadas As Int32 = 0
                fotosCargadas = cargarFotos()
                If fotosCargadas > 0 Then
                    'inicio de la carga de diligencia
                    cargarDiligencia()
                    'fin de la carga de diligencias
                Else
                    LMensaje.Text = "CARGUE LAS FOTOS PARA REGISTRAR LA DILIGENCIA"
                    LMensaje.ForeColor = Drawing.Color.FromName("#CC0000")
                End If
            Else
                cargarDiligencia()
                'LMensaje.Text = LMensaje.Text & " Y " & cargarFotos() & " Fotos"
            End If
            GridView1.DataBind()
            'Carga de la diligencia fin
            TBCredito.Text = ""
            DDLDiligencia.SelectedValue = "0"
            TBPago.Text = "0.00"
            TBResvProv.Text = "000000000"
        End If
    End Sub
    Private Sub cargarDiligencia()
        'inicio de la carga de diligencia
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            If CType(GridView1.Rows(i).Cells(5).FindControl("CBSeleccion"), CheckBox).Checked Then
                setDiligencia(CType(GridView1.Rows(i).Cells(5).FindControl("HFId"), HiddenField).Value)
                If IsNumeric(TBPago.Text) Then
                    If CDbl(TBPago.Text) > 0 Then
                        setRecivo(CType(GridView1.Rows(i).Cells(5).FindControl("HFCredito"), HiddenField).Value, CType(GridView1.Rows(i).Cells(5).FindControl("HFPeriodo"), HiddenField).Value, CType(GridView1.Rows(i).Cells(5).FindControl("HFId"), HiddenField).Value)
                    End If
                End If
            End If
        Next
        PanelAcciones.Visible = False
        LMensaje.Text = "Actualizado"
        'fin de la carga de diligencias
    End Sub
    Private Sub setCitatorio(ByVal vidCredito As String)
        Try
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecacobros].[dbo].[PAE_CITATORIO] "
        textConmand += " (PC_SUBDEL,PC_R_ID,PC_CODEBAR,PC_HORA,PC_FECHA,PC_IP,PC_INSPECTOR,PC_FECH_SYSTEM) "
        textConmand += " VALUES "
        textConmand += " ( "
        textConmand += " '" + Session.Item("SIRECAsubdel").ToString + "' "
        textConmand += " ," + vidCredito + " "
        textConmand += " ,'" + TBCredito.Text + "' "
        textConmand += " ,'" + DDLHoras.SelectedValue + "' "
        textConmand += " ,convert(datetime,'" + IIf(IsDate(TBFechCitatorio.Text), TBFechCitatorio.Text, Now.ToShortDateString) + "',103) "
        textConmand += " ,'" + Request.UserHostAddress + "' "
        textConmand += " ,'" + Session.Item("SIRECAid").ToString + "' "
        textConmand += " ,getdate() "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
            LMensaje.Text = "Actualizado"
        Catch ex As Exception
            LMensaje.Text = "Error al Actualizar " + ex.Message
        End Try
    End Sub
    Private Sub setDiligencia(ByVal vidCredito As String)
        'TBCredito.Text.Substring(16)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecacobros].[dbo].[PAE_DILIGENCIA] "
        textConmand += " (PD_SUBDEL,PD_R_ID,PD_CODEBAR,PD_DILIGENCIA,PD_OFICINA,PD_FECHA,PD_IP,PD_INSPECTOR,PD_FECH_SYSTEM) "
        textConmand += " VALUES "
        textConmand += " ( "
        textConmand += " '" + Session.Item("SIRECAsubdel").ToString + "' "
        textConmand += " ," + vidCredito + " "
        textConmand += " ,'" + TBCredito.Text.ToUpper + "' "
        textConmand += " ,'" + DDLDiligencia.SelectedValue + "' "
        textConmand += " ,'' "
        'textConmand += " , (case "
        'textConmand += " when '" + DDLDiligencia.SelectedValue + "' in ('25','10','12','15') then 'REMATE' "
        'textConmand += " when '" + DDLDiligencia.SelectedValue + "' in ('5','9','16','17') then 'CONVENIO' "
        'textConmand += " when '" + DDLDiligencia.SelectedValue + "' in ('3','24') then 'DEPURACION' "
        'textConmand += " when '" + DDLDiligencia.SelectedValue + "' in ('20','22') then 'IMPEDIMENTO' "
        'textConmand += " when '" + DDLDiligencia.SelectedValue + "' in ('18') then 'EMISION' "
        'textConmand += " when '" + DDLDiligencia.SelectedValue + "' in ('11') then 'INTERVENTORIA' "
        'textConmand += " else 'OTRO' end) "
        textConmand += " ,convert(datetime,'" + IIf(IsDate(TBFechDeligencia.Text), TBFechDeligencia.Text, Now.ToShortDateString) + "',103) "
        textConmand += " ,'" + Request.UserHostAddress + "' "
        textConmand += " ,'" + Session.Item("SIRECAid").ToString + "' "
        textConmand += " ,getdate() "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub
    Private Sub setRecivo(ByVal vcredito As String, ByVal vperiodo As String, ByVal vid As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecacobros].[dbo].[PAE_RECIBO] "
        textConmand += " (PR_SUBDEL,PR_CODEBAR,PR_IMPORTE,PR_FOLIO,PR_FECHA,PR_IP,PR_INSPECTOR,PR_FECH_SYSTEM) "
        textConmand += " VALUES "
        textConmand += " ( "
        textConmand += " '" + Session.Item("SIRECAsubdel").ToString + "' "
        textConmand += " ,'" + TBCredito.Text.ToUpper + vcredito + vperiodo + "-" + vid + "' "
        textConmand += " , " + TBPago.Text.Replace(",", "")
        textConmand += " , '" + TBResvProv.Text + "' "
        textConmand += " , convert(datetime,'" + IIf(IsDate(TBFechResvProv.Text), TBFechResvProv.Text, Now.ToShortDateString) + "',103) "
        textConmand += " ,'" + Request.UserHostAddress + "' "
        textConmand += " ,'" + Session.Item("SIRECAid").ToString + "' "
        textConmand += " ,getdate() "
        textConmand += " ) "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub
    Protected Sub DDLHoras_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLHoras.Init
        For i As Int32 = 5 To 19
            If i > 14 Then
                DDLHoras.Items.Add(New ListItem("0" & (24 - i) & ":30 H.r.", "0" & (24 - i) & ":30 H.r."))
                DDLHoras.Items.Add(New ListItem("0" & (24 - i) & ":15 H.r.", "0" & (24 - i) & ":15 H.r."))
                DDLHoras.Items.Add(New ListItem("0" & (24 - i) & ":00 H.r.", "0" & (24 - i) & ":00 H.r."))
            Else
                DDLHoras.Items.Add(New ListItem((24 - i) & ":30 H.r.", (24 - i) & ":30 H.r."))
                DDLHoras.Items.Add(New ListItem((24 - i) & ":15 H.r.", (24 - i) & ":15 H.r."))
                DDLHoras.Items.Add(New ListItem((24 - i) & ":00 H.r.", (24 - i) & ":00 H.r."))
            End If
        Next
    End Sub
    Protected Sub LBGuardarCitatorio_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBGuardarCitatorio.Click
        For i As Int32 = 0 To (GridView1.Rows.Count - 1)
            If CType(GridView1.Rows(i).Cells(5).FindControl("CBSeleccion"), CheckBox).Checked Then
                setCitatorio(CType(GridView1.Rows(i).Cells(5).FindControl("HFId"), HiddenField).Value)
            End If
        Next
        TBCredito.Text = ""
    End Sub
    Protected Sub TBFechCitatorio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechCitatorio.Init
        TBFechCitatorio.Text = Now.ToShortDateString
    End Sub
    Private Sub setCasoCerrado()
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim vsubdel As String = Session.Item("SIRECAsubdel").ToString
        Dim vregpat As String = TBCredito.Text.Substring(0, 16)
        Dim textConmand As String = " UPDATE [sirecacobros].[dbo].[PAE_CRED] "
        textConmand += " SET [ACTIVO] = 0 "
        textConmand += " WHERE [R_SUBDEL]='" + vsubdel + "' and [CODE_BAR]='" + vregpat + "' and ACTIVO=1 "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
        GridView1.DataBind()
    End Sub

    Protected Function cargarFotos() As Int32
        'If DDLDiligencia.SelectedItem.Text.Contains("EMBARGO") Then
        'tipoDirectorio = "EMBARGO"
        'ElseIf DDLDiligencia.SelectedItem.Text.Contains("NO LOCALIZADO") Then
        '   tipoDirectorio = "09"
        'End If
        Dim countFotos As Int32 = 0
        For i As Int32 = 1 To 8
            Dim foto As FileUpload = CType(Panel2.FindControl("FileUpload" & (i)), FileUpload)
            If foto.FileName.Replace(" ", "").Length > 0 Then
                Dim diligencia As String = DDLDiligencia.SelectedValue
                Dim tipoDirectorio As String = "DILIGENCIA" & diligencia
                Dim docEntregado As String = TBCredito.Text.Substring(16)
                If docEntregado.Equals("C") Then
                    docEntregado = "18"
                ElseIf docEntregado.Equals("M") Then
                    docEntregado = "1"
                ElseIf docEntregado.Equals("A") Then
                    docEntregado = "3"
                ElseIf docEntregado.Equals("R") Then
                    docEntregado = "2"
                ElseIf docEntregado.Equals("J") Then
                    docEntregado = "18"
                Else
                    docEntregado = "19"
                End If
                Dim doceEntregado As String = docEntregado

                Dim regpat As String = TBCredito.Text.Substring(0, 10)

                Dim carpeta As String = Server.MapPath("~\documentos\cobros\" & regpat & "\" & tipoDirectorio)
                If Not System.IO.Directory.Exists(carpeta) Then
                    Dim dir = System.IO.Directory.CreateDirectory(carpeta)
                End If
                Dim nombreFile As String = Session.Item("SIRECAid").ToString & "." & Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName
                'Dim nombreFile As String = Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName.Split(".").GetValue(foto.FileName.Split(".").Count - 1)
                foto.SaveAs(carpeta & "\" & nombreFile)
                countFotos += 1
                guardarFotoEnBD(tipoDirectorio, doceEntregado, diligencia, TBCredito.Text, nombreFile)
            End If
        Next
        Return countFotos
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
& " ,'" & "" & "'" _
& " ,'" & regpat & "' " _
& " ,'" & doceEntregado & "' " _
& " ,'" & diligencia & "' " _
& " ,convert(datetime,'" & If(IsDate(TBFechDeligencia.Text), TBFechDeligencia.Text, Now.ToShortDateString) & "',103) " _
& " ,'" & tipoDirectorio & "\" & nombreFile & "' " _
& " ) "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then

            Else
                'Response.Redirect("~/pag_registros/Default.aspx")
            End If
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub
End Class
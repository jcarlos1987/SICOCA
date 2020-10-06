Imports System.Data.OleDb

Public Class galeriaarchivoscargados
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        GridViewArchivos.DataBind()
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

    Protected Sub DDLDocumento_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDocumento.PreRender
        If Not DDLDocumento.Items.Contains(New ListItem("TODOS", "%")) Then
            DDLDocumento.Items.Add(New ListItem("TODOS", "%"))
            DDLDocumento.SelectedValue = "%"
        End If
    End Sub

    Protected Sub DDLDiligencia_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDiligencia.PreRender
        If Not DDLDiligencia.Items.Contains(New ListItem("TODOS", "%")) Then
            DDLDiligencia.Items.Add(New ListItem("TODOS", "%"))
            DDLDiligencia.SelectedValue = "%"
        End If
    End Sub

    Protected Sub TBRegpat_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBRegpat.Init
        If Not Request.QueryString("regpat") Is Nothing Then
            TBRegpat.Text = Request.QueryString("regpat").ToString
        End If
    End Sub

    Protected Function cargarFotos() As Int32
        'If DDLDiligencia.SelectedItem.Text.Contains("EMBARGO") Then
        'tipoDirectorio = "EMBARGO"
        'ElseIf DDLDiligencia.SelectedItem.Text.Contains("NO LOCALIZADO") Then
        '   tipoDirectorio = "09"
        'End If
        Dim countFotos As Int32 = 0
        For i As Int32 = 1 To 1
            Dim foto As FileUpload = CType(Page.FindControl("FileUpload" & (i)), FileUpload)
            If foto.FileName.Replace(" ", "").Length > 0 Then
                Dim diligencia As String = DDLDiligencia0.SelectedValue
                Dim tipoDirectorio As String = "DILIGENCIA" & diligencia
                Dim doceEntregado As String = DDLDocEntreg.SelectedValue

                Dim regpat As String = TBRegpat.Text

                Dim carpeta As String = Server.MapPath("~\documentos\cobros\" & regpat & "\" & tipoDirectorio)
                If Not System.IO.Directory.Exists(carpeta) Then
                    Dim dir = System.IO.Directory.CreateDirectory(carpeta)
                End If
                Dim nombreFile As String = Session.Item("SIRECAid").ToString & "." & Now.ToShortDateString.Replace("/", "") & Now.ToLongTimeString.Replace("a.m.", "").Replace("p.m.", "").Replace(":", "").Replace(" ", "") & "." & foto.FileName
                foto.SaveAs(carpeta & "\" & nombreFile)
                countFotos += 1
                guardarFotoEnBD(tipoDirectorio, doceEntregado, diligencia, regpat, nombreFile)
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
& " '" & Request.UserHostAddress & "_" & Session.Item("SIRECAid").ToString & "' " _
& " ,getdate() " _
& " ,'" & Session.Item("SIRECAdel").ToString & "'" _
& " ,'" & DDLSubdel.SelectedValue & "'" _
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

    Protected Sub LBCargarImg_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCargarImg.Click
        LMsg.Text = ""
        If TBRegpat.Text.Length < 10 Or FileUpload1.FileName.Length < 3 Or DDLDocEntreg.SelectedValue.Equals("0") Or DDLDiligencia0.SelectedValue.Equals("0") Or Not IsDate(TBFechDeligencia.Text) Then
            LMsg.Text = "Verifique que los datos esten completamente llenos para cargar la Foto o Documento"
        Else
            cargarFotos()
            LMsg.Text = "FOTO / DOCUMENTO CARGADO."
        End If
    End Sub

    Protected Sub TBFechDeligencia_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechDeligencia.Init
        TBFechDeligencia.Text = Now.ToShortDateString
    End Sub

    Protected Sub DDLDocEntreg_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDocEntreg.PreRender
        If Not DDLDocEntreg.Items.Contains(New ListItem("SOLICITUD", "97")) Then
            DDLDocEntreg.Items.Add(New ListItem("SOLICITUD", "97"))
        End If
    End Sub

    Protected Sub DDLDiligencia0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDiligencia0.PreRender
        If Not DDLDiligencia0.Items.Contains(New ListItem("JURIDICO", "27")) Then
            DDLDiligencia0.Items.Add(New ListItem("JURIDICO", "27"))
        End If
    End Sub
End Class
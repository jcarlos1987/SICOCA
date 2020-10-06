Imports System.Data.OleDb

Public Class cargarProcesar
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim numDatosCargados As Int32 = 0
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Response.Redirect("~/Error.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECA2chmod5").ToString.Equals("CP") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If            
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        numDatosCargados = 0
        Label2.Text = ""
        Dim ruta As String = ""
        Try
            If FileUpload1.FileName.Replace(" ", "").Equals("") Then
                Label1.Text = "Seleccione el PROCESAR a Cargar."
            Else
                Label1.Text = ""
                ruta = Server.MapPath("~") & "\temp\procesar\" & DDLDel.SelectedValue & DDLSubdel.SelectedValue & FileUpload1.FileName
                If System.IO.File.Exists(ruta) Then
                    Label1.Text = "PROCESAR " + FileUpload1.FileName + " Cargado."
                Else
                    'carga del archivo
                    FileUpload1.SaveAs(ruta)
                    LeerArchivo(ruta)
                    Label1.Text = "Cargados " & numDatosCargados
                    GridView1.DataSourceID = "SqlDataSourceDepuracionPRO"
                    GridView1.DataBind()
                End If
            End If
        Catch ex As Exception
            Label2.Text = "Problemas al cargar el PROCESAR"
            MsgBox(ex.StackTrace)
        End Try
    End Sub
    Private Sub LeerArchivo(ByVal ruta As String)
        '1_leer archivo
        Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)
        Dim fila As String = ""
        Dim columnas As String() = {}
        While fs.Peek > -1
            '2_leer linea de archivo
            fila = "1," & DDLDel.SelectedValue & "," & DDLSubdel.SelectedValue & "," & fs.ReadLine
            columnas = fila.Split(",")

            If columnas.Length > 10 Then
                fila = columnas.GetValue(0) & ";" & columnas.GetValue(1) & ";" & columnas.GetValue(2) & ";" & columnas.GetValue(3) & ";" & columnas.GetValue(4)
                fila += ";" & columnas.GetValue(5) & ";" & (columnas.GetValue(6).ToString.Substring(0, 4) & "/" & columnas.GetValue(6).ToString.Substring(4, 2)) & ";" & (columnas.GetValue(7).ToString.Substring(0, 4) & "/" & columnas.GetValue(7).ToString.Substring(4, 2) & "/" & columnas.GetValue(7).ToString.Substring(6, 2)) & ";" & columnas.GetValue(8) & ";" & columnas.GetValue(9)
                insertarFila(fila)
            End If
        End While
        '3_cerrar archivo
        fs.Close()
    End Sub
    Private Sub insertarFila(ByVal datos As String)
        Dim dato As String() = datos.Split(";")
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        catCMD.CommandText = "SELECT *  FROM [procesar].[dbo].[RCPRO] WHERE RCP_REGPAT='" & dato.GetValue(4) & "' and RCP_FOLIO='" & dato.GetValue(5) & "' and RCP_PER='" & dato.GetValue(6) & "'"
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim sesionCreada As Boolean = False
        Dim cabecera As String = ""
        Dim valor As Object = ""
        If myReader.Read() Then
            'MsgBox("encontrado")
            'Dim con As New OleDbConnection(cadenaconexion)
            'Dim cmd As New OleDbCommand()
            'cmd.Connection = con

            'Dim myInsertQuery As String = "update [procesar].[dbo].[RCPRO] set [RCP_IMP_COP]=?,[RCP_IMP_RCV]=? WHERE RCP_REGPAT='" & dato.GetValue(4) & "' and RCP_FOLIO='" & dato.GetValue(5) & "' and RCP_PER='" & dato.GetValue(6) & "'"
            'cmd.CommandText = myInsertQuery
            'cmd.Parameters.Add("@rc_imp_cop", OleDbType.Double).Value = (Convert.ToDouble(dato.GetValue(8)) / 100)
            'cmd.Parameters.Add("@rc_imp_rcv", OleDbType.Double).Value = (Convert.ToDouble(dato.GetValue(9)) / 100)
            'con.Open()
            'cmd.ExecuteNonQuery()
            'con.Close()
        Else
            'MsgBox("sin resultados")
            numDatosCargados += 1
            Dim con2 As New OleDbConnection(cadenaconexion)
            Dim cmd2 As New OleDbCommand()
            cmd2.Connection = con2
            Dim myInsertQuery2 As String = "INSERT INTO [procesar].[dbo].[RCPRO]([RCP_DEL],[RCP_SUB],[RCP_PLAZA],[RCP_REGPAT],[RCP_FOLIO],[RCP_PER],[RCP_FEC_MOV],[RCP_IMP_COP],[RCP_IMP_RCV])"
            myInsertQuery2 += " values(?, ?, ?, ?, ?, ?, ?, ?, ?)"
            cmd2.CommandText = myInsertQuery2
            'cmd2.Parameters.Add("@rc_id", OleDbType.Integer).Value = Convert.ToInt16(dato.GetValue(0))
            cmd2.Parameters.Add("@rc_del", OleDbType.VarChar).Value = dato.GetValue(1)
            cmd2.Parameters.Add("@rc_sub", OleDbType.VarChar).Value = dato.GetValue(2)
            cmd2.Parameters.Add("@rc_plaza", OleDbType.VarChar).Value = dato.GetValue(3)
            cmd2.Parameters.Add("@rc_regpat", OleDbType.VarChar).Value = dato.GetValue(4)
            cmd2.Parameters.Add("@rc_folio", OleDbType.VarChar).Value = dato.GetValue(5)
            cmd2.Parameters.Add("@rc_per", OleDbType.VarChar).Value = dato.GetValue(6)
            cmd2.Parameters.Add("@rc_fec_mov", OleDbType.Date).Value = Convert.ToDateTime(dato.GetValue(7))
            cmd2.Parameters.Add("@rc_imp_cop", OleDbType.Double).Value = (Convert.ToDouble(dato.GetValue(8)) / 100)
            cmd2.Parameters.Add("@rc_imp_rcv", OleDbType.Double).Value = (Convert.ToDouble(dato.GetValue(9)) / 100)
            con2.Open()
            cmd2.ExecuteNonQuery()
            con2.Close()
            Label1.Text = "Actualizado"
        End If
        myReader.Close()
        nwindConn.Close()
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

End Class
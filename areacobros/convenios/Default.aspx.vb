Imports System.Data.OleDb

Public Class _Default33
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
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
        End If
    End Sub

    Private Sub addConvenio()
        Dim cont As Int32 = 0
        Dim tipo As String = GridView1Convenio05.Rows(0).Cells(0).Text
        Dim idconvenio As String = tipo + Day(Now).ToString + Month(Now).ToString + Year(Now).ToString + GridView1Convenio05.Rows(0).Cells(3).Text
        Dim subdel As String = DDLSubdel.SelectedValue
        For i As Int32 = 0 To (GridView1Convenio05.Rows.Count - 1)
            Dim cbox As CheckBox = GridView1Convenio05.Rows(i).FindControl("CheckBox1")
            If (cbox.Checked And agregarCreditoAConvenio(GridView1Convenio05.Rows(i).Cells(3).Text, GridView1Convenio05.Rows(i).Cells(2).Text)) Then
                
                cont += 1
                Dim con2 As New OleDbConnection(cadenaconexion)
                Dim cmd2 As New OleDbCommand()
                cmd2.Connection = con2
                Dim myInsertQuery2 As String = " INSERT INTO [sirecacobros].[dbo].[conveniocreditos]([SUBDEL],[IP_HOST],[ID_USUARIO],[FEC_SYSTEM],[ID_CONVENIO05] "
                myInsertQuery2 += " ,[TIPO],[REGPATR],[RAZON_SOCIAL],[RFC],[DOMICILIO],[LOCALIDAD],[COTIZANTES],[NUMCRED],[TD],[FALTA] "
                myInsertQuery2 += " ,[FNOTIFICACION],[INC],[FEINC],[DIAS],[IMPORTE],[DC],[SC],[PERIODO]) "
                myInsertQuery2 += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) "
                cmd2.CommandText = myInsertQuery2
                cmd2.Parameters.Add("@SUBDEL", OleDbType.VarChar).Value = subdel
                cmd2.Parameters.Add("@IP_HOST", OleDbType.VarChar).Value = Request.UserHostAddress()
                cmd2.Parameters.Add("@ID_USUARIO", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
                cmd2.Parameters.Add("@FEC_SYSTEM", OleDbType.Date).Value = Now
                cmd2.Parameters.Add("@ID_CONVENIO05", OleDbType.VarChar).Value = idconvenio
                cmd2.Parameters.Add("@TIPO", OleDbType.VarChar).Value = tipo
                cmd2.Parameters.Add("@REGPATR", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(3).Text
                cmd2.Parameters.Add("@RAZON_SOCIAL", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(4).Text
                cmd2.Parameters.Add("@RFC", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(5).Text
                cmd2.Parameters.Add("@DOMICILIO", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(6).Text
                cmd2.Parameters.Add("@LOCALIDAD", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(7).Text
                cmd2.Parameters.Add("@COTIZANTES", OleDbType.Double).Value = Convert.ToDouble(GridView1Convenio05.Rows(i).Cells(8).Text)
                cmd2.Parameters.Add("@NUMCRED", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(2).Text
                cmd2.Parameters.Add("@TD", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(9).Text
                cmd2.Parameters.Add("@FALTA", OleDbType.Date).Value = If(IsDate(GridView1Convenio05.Rows(i).Cells(10).Text), Convert.ToDateTime(GridView1Convenio05.Rows(i).Cells(10).Text), DBNull.Value)
                If IsDate(GridView1Convenio05.Rows(i).Cells(11).Text) Then
                    cmd2.Parameters.Add("@FNOTIFICACION", OleDbType.Date).Value = Convert.ToDateTime(GridView1Convenio05.Rows(i).Cells(11).Text)
                Else
                    cmd2.Parameters.Add("@FNOTIFICACION", OleDbType.Date).Value = DBNull.Value
                End If
                cmd2.Parameters.Add("@INC", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(12).Text
                cmd2.Parameters.Add("@FEINC", OleDbType.Date).Value = If(IsDate(GridView1Convenio05.Rows(i).Cells(13).Text), Convert.ToDateTime(GridView1Convenio05.Rows(i).Cells(13).Text), DBNull.Value)
                cmd2.Parameters.Add("@DIAS", OleDbType.Double).Value = Convert.ToDouble(GridView1Convenio05.Rows(i).Cells(14).Text)
                cmd2.Parameters.Add("@IMPORTE", OleDbType.Double).Value = Convert.ToDouble(GridView1Convenio05.Rows(i).Cells(15).Text)
                cmd2.Parameters.Add("@DC", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(16).Text
                cmd2.Parameters.Add("@SC", OleDbType.VarChar).Value = GridView1Convenio05.Rows(i).Cells(17).Text
                cmd2.Parameters.Add("@PERIODO", OleDbType.Date).Value = If(IsDate(GridView1Convenio05.Rows(i).Cells(18).Text), Convert.ToDateTime(GridView1Convenio05.Rows(i).Cells(18).Text), DBNull.Value)

                con2.Open()
                cmd2.ExecuteNonQuery()
                con2.Close()                
            End If
        Next
        If agregarPatronAConvenio05(idconvenio, tipo, subdel) Then
            patronAConvenio05(idconvenio, tipo, subdel)
        End If
        LAddConvenio.Text = cont.ToString + " Credidos en convenio del " & TBRegpat.Text
    End Sub
    Private Sub patronAConvenio05(ByVal idconvenio As String, ByVal tipo As String, ByVal subdel As String)
        Dim con2 As New OleDbConnection(cadenaconexion)
        Dim cmd2 As New OleDbCommand()
        cmd2.Connection = con2
        Dim myInsertQuery2 As String = " INSERT INTO [sirecacobros].[dbo].[convenio05] "
        myInsertQuery2 += " ([SUBDEL],[IP_HOST],[ID_USUARIO],[FECH_SYSTEM],[ID_CONVENIO05],[TIPO],[SOLICITUD],[FEC_SOLICITUD],[IFE],[FEC_IFE],[ACTA_CONSTITUTIVA] "
        myInsertQuery2 += " ,[FEC_ACT_CONST],[GARANTIA],[FEC_GARANTIA],[EVALUO],[FEC_EVALUO],[PAGO_INICIAL_20_2],[FEC_PAG_INI],[PAGO_MULTAS_10],[FEC_PAG_MUL],[TIPO_PROCE],[ADEUDO_TOTAL]) "
        myInsertQuery2 += " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) "
        cmd2.CommandText = myInsertQuery2

        cmd2.Parameters.Add("@SUBDEL", OleDbType.VarChar).Value = DDLSubdel.SelectedValue
        cmd2.Parameters.Add("@IP_HOST", OleDbType.VarChar).Value = Request.UserHostAddress()
        cmd2.Parameters.Add("@ID_USUARIO", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
        cmd2.Parameters.Add("@FECH_SYSTEM", OleDbType.Date).Value = Now
        cmd2.Parameters.Add("@ID_CONVENIO05", OleDbType.VarChar).Value = idconvenio
        cmd2.Parameters.Add("@TIPO", OleDbType.VarChar).Value = tipo
        cmd2.Parameters.Add("@SOLICITUD", OleDbType.VarChar).Value = "NO"
        cmd2.Parameters.Add("@FEC_SOLICITUD", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@IFE", OleDbType.VarChar).Value = "NO"
        cmd2.Parameters.Add("@FEC_IFE", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@ACTA_CONSTITUTIVA", OleDbType.VarChar).Value = "NO"
        cmd2.Parameters.Add("@FEC_ACT_CONST", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@GARANTIA", OleDbType.VarChar).Value = "NO"
        cmd2.Parameters.Add("@FEC_GARANTIA", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@EVALUO", OleDbType.VarChar).Value = "NO"
        cmd2.Parameters.Add("@FEC_EVALUO", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@PAGO_INICIAL_20_2", OleDbType.Double).Value = 0
        cmd2.Parameters.Add("@FEC_PAG_INI", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@PAGO_MULTAS_10", OleDbType.Double).Value = 0
        cmd2.Parameters.Add("@FEC_PAG_MUL", OleDbType.Date).Value = DBNull.Value
        cmd2.Parameters.Add("@TIPO_PROCE", OleDbType.VarChar).Value = "BASICO"
        cmd2.Parameters.Add("@ADEUDO_TOTAL", OleDbType.Double).Value = 0

        con2.Open()
        cmd2.ExecuteNonQuery()
        con2.Close()
    End Sub
    Private Function agregarPatronAConvenio05(ByVal idconvenio As String, ByVal tipo As String, ByVal subdel As String) As Boolean
        Dim agregar As Boolean = True
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT [ID_CONVENIO05] FROM [sirecacobros].[dbo].[convenio05]  "
            consulta += " WHERE [ID_CONVENIO05] ='" & idconvenio & "' and subdel='" + subdel + "'"
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                agregar = False
                Exit Do
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return agregar
    End Function
    Private Function agregarCreditoAConvenio(ByVal regpat As String, ByVal credito As String) As Boolean
        Dim agregar As Boolean = True
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim consulta As String = " SELECT [REGPATR] FROM [sirecacobros].[dbo].[conveniocreditos]  "
            consulta += " WHERE replace([REGPATR],'-','') ='" & regpat & "' and [NUMCRED]='" & credito & "'"
            catCMD.CommandText = consulta
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                agregar = False
                Exit Do
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception

        End Try
        Return agregar
    End Function

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        LAddConvenio.Text = ""
        If TBRegpat.Text.Replace(" ", "").Length = 10 Then
            addConvenio()
            GridView1Convenio05.DataBind()
        Else
            LAddConvenio.Text = "INGRESE EL REG.PATRONAL(10 caracteres sin -) PARA AGREGAR A CONVENIOS."
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        LAddConvenio.Text = ""
        GridView1Convenio05.DataBind()
        Button2.Visible = True
    End Sub

    Protected Sub GridView1Convenios_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1Convenios.PreRender
        GridView1Convenios.Caption = "<strong>" + GridView1Convenios.Rows.Count.ToString + " EN PROCESO DE CONVENIO(S)</strong>"
    End Sub

    Protected Sub GridView1Convenios0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1Convenios0.PreRender
        GridView1Convenios0.Caption = "<strong>" + GridView1Convenios0.Rows.Count.ToString + " EN CONVENIO(S)</strong>"
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button4.Click
        GridView1Convenios.DataBind()
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        GridView1Convenios0.DataBind()
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Wizard1.ActiveStepChanged
        'histAcciones.agregarHistorial(cadenaconexion, DDLSubdel.SelectedValue, Session.Item("SIRECAnombre").ToString, Session.Item("SIRECAid").ToString, "1", DDLReporte.SelectedItem.Text, DDLAnio.SelectedValue, DDLMes.SelectedValue, Wizard1.ActiveStep.Name, "regpat", Request.UserHostAddress)
        If Wizard1.ActiveStep.Name.Equals("CONVENIOS SOLICITUDES") Then
            GridView1Convenio05.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("EN PROCESO DE CONVENIOS") Then
            GridView1Convenios.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("EN CONVENIO") Then
            GridView1Convenios0.DataBind()
        End If
    End Sub
End Class
Imports System.Globalization
Imports System.Data.OleDb

Public Class _Default18
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DropDownList1.SelectedValue.Equals("%") Then
            PObservaciones.Visible = False
        Else
            PObservaciones.Visible = True
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

    Protected Sub GVReporte1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVReporte1.PreRender
        Try
            GVReporte1.FooterRow.Cells(2).Text = "0"
            GVReporte1.FooterRow.Cells(3).Text = "0"
            GVReporte1.FooterRow.Cells(4).Text = "0"
            GVReporte1.FooterRow.Cells(5).Text = "0"

            For i As Int32 = 0 To (GVReporte1.Rows.Count - 1)
                Dim hl1 As HyperLink = GVReporte1.Rows(i).FindControl("HyperLink2")
                GVReporte1.FooterRow.Cells(2).Text = Convert.ToDouble(GVReporte1.FooterRow.Cells(2).Text) + Convert.ToDouble(hl1.Text.Replace(",", ""))
                GVReporte1.FooterRow.Cells(3).Text = Convert.ToDouble(GVReporte1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GVReporte1.FooterRow.Cells(3).Text.Replace(",", ""))
                GVReporte1.FooterRow.Cells(4).Text = Convert.ToDouble(GVReporte1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GVReporte1.FooterRow.Cells(4).Text.Replace(",", ""))
                GVReporte1.FooterRow.Cells(5).Text = Convert.ToDouble(GVReporte1.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GVReporte1.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            GVReporte1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVReporte1.FooterRow.Cells(2).Text))
            GVReporte1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVReporte1.FooterRow.Cells(3).Text))
            GVReporte1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GVReporte1.FooterRow.Cells(4).Text))
            GVReporte1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GVReporte1.FooterRow.Cells(5).Text))

            For i As Int32 = 0 To (GVReporte1.Rows.Count - 1)
                'Calculo del Porcentaje de Pagos
                GVReporte1.Rows(i).Cells(6).Text = String.Format(New CultureInfo("es-MX"), "{0:P2}", (Convert.ToDouble(GVReporte1.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) / Convert.ToDouble(GVReporte1.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))))
            Next
        Catch ex As Exception
        End Try
    End Sub    

    Protected Sub BComentar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BComentar.Click
        LError.Text = ""
        Dim con22 As New OleDbConnection(cadenaconexion)
        Dim cmd22 As New OleDbCommand()
        cmd22.Connection = con22
        Dim myInsertQuery22 As String = ""
        myInsertQuery22 = " INSERT INTO [sirecaObservaciones].[dbo].[ObservacionInspector]([id_inspector],[id_observo],[fecha_observacion],[observacion],[ip_host]) "
        myInsertQuery22 += " VALUES(?,?,getdate(),?,?) "
        cmd22.CommandText = myInsertQuery22

        cmd22.Parameters.Add("@id_inspector", OleDbType.VarChar).Value = DropDownList1.SelectedValue
        cmd22.Parameters.Add("@id_observo", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
        cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = TBObservacion.Text
        cmd22.Parameters.Add("@ip_host", OleDbType.VarChar).Value = Request.UserHostAddress()

        con22.Open()
        If cmd22.ExecuteNonQuery() = 0 Then
            LError.Text = "Error al Comentar"
        Else
            GVObservacion.DataBind()
        End If
        con22.Close()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue.Equals("%") Then
            PInformacion.Visible = False
            IBInspector.ImageUrl = "~/imagenes/usuarios/avatar/default.jpg"
            'Label4.Text = DropDownList1.SelectedValue
        Else
            PInformacion.Visible = True
            IBInspector.ImageUrl = "~/imagenes/usuarios/avatar/" & DropDownList1.SelectedValue & ".jpg"
            cargarDatosDelPatron(DropDownList1.SelectedValue)            
        End If
    End Sub

    Private Sub cargarDatosDelPatron(ByVal idEjecutor As String)
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT (SELECT [nombre] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id]) as nombre " _
& " ,subdel " _
& " ,(SELECT [cargo] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id]) as cargo " _
& " ,credencial " _
& " ,(SELECT [antiguedad] FROM [fiscamovil].[dbo].[Usuarios] where id=sire.[id]) as antiguedad " _
& "   FROM [sireca].[dbo].[usuarios] as sire " _
& " where sire.id='" & idEjecutor & "'"
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                LNombre.Text = myReader2.GetValue(0).ToString
                LSubdel.Text = myReader2.GetValue(1).ToString
                LCargo.Text = myReader2.GetValue(2).ToString
                LCredencial.Text = myReader2.GetValue(3).ToString
                LAntiguedad.Text = myReader2.GetValue(4).ToString
                'myReader2.GetValue(0).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub
    Private Sub metas()
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SET @META_MES= (SELECT (meta/num_ejecutores) FROM [sirecacobros].[dbo].[metas] WHERE mes = " & 0 & " ) " _
& " SELECT	@META_MES AS META, SUM([RCP_IMP_COP]) AS RECAUDADO,SUM (ADEUDO) " _
& " FROM [sirecacobros].[dbo].[ecoTiposHistorial] AS ETH " _
& " INNER JOIN [procesar].[dbo].[RCPRO] AS PRO " _
& " ON REPLACE (ETH.[REGPATR],'-', '')= SUBSTRING (PRO.[RCP_REGPAT], 1, 10) AND " _
& " (SUBSTRING(PERIODO,7,4)+(SUBSTRING(PERIODO,3,3)))= RCP_PER " _
& " WHERE " _
& " ID_RESPONSABLE=" & 0 & " AND " _
& " SUBSTRING (FECH_ASIG, 4, 7) = @FECHA_ASIG AND tipofile='COP' "

            'mm-aaaa
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Dim meta As String = ""
            Dim recaudado As String = ""
            Do While myReader2.Read()
                meta = myReader2.GetValue(0).ToString
                recaudado = myReader2.GetValue(1).ToString
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
        End Try
    End Sub
End Class
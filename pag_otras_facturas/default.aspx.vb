Imports System.Data.OleDb

Public Class _default46
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub TBFAsig_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFAsig.Init
        'TBFAsig.Text = Now.ToShortDateString
    End Sub

    Protected Sub LBCargarAsignar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCargarAsignar.Click
        LMesg.Text = ""
        If IsNumeric(TBCControl.Text) And TBRegPat.Text.ToString.Length = 10 And TBCredito.Text.Length >= 9 Then
            registrarFactura()
        Else
            LMesg.Text = "Alguno de los datos son incorrectos."
        End If
    End Sub
    Private Sub registrarFactura()
        Try
        Dim conx As New OleDbConnection(cadenaconexion)
        Dim cmdx As New OleDbCommand()
        cmdx.Connection = conx
        Dim myInsertQueryx As String = " INSERT INTO [sirecaemisiones].[dbo].[OF_FACTURAS] "
            myInsertQueryx += " SELECT '" + DDLSubdel.SelectedValue + "' "
        myInsertQueryx += " ,'" + TBRegPat.Text + "' "
            myInsertQueryx += " ,'" + TBCredito.Text + "' "
            myInsertQueryx += " ,'" + TBRazon.Text + "' "
            myInsertQueryx += " ," + IIf(IsNumeric(TBCotiz.Text), TBCotiz.Text, "0") + " "
            myInsertQueryx += " ," + IIf(IsNumeric(TBImporte.Text), TBImporte.Text, "0") + " "
        myInsertQueryx += " ,'" + DDLMes.SelectedValue + "/" + DDLAnio.SelectedValue + "' "
        myInsertQueryx += " ,'" + DDLTipoDoc.SelectedValue + "' "
        '--asignacion inicio
        If IsDate(TBFAsig.Text) Then
            myInsertQueryx += " ," + Session.Item("SIRECAid").ToString + " "
            myInsertQueryx += " ,convert(datetime,'" + TBFAsig.Text + "',103) "
            myInsertQueryx += " ,'" + Request.UserHostAddress + "' "
            myInsertQueryx += " ," + DDLInspector.SelectedValue + " "
        Else
            myInsertQueryx += " ,NULL "
            myInsertQueryx += " ,NULL "
            myInsertQueryx += " ,NULL "
            myInsertQueryx += " ,NULL "
        End If
        '--asignacion fin
        '---diligencia inicio
        If IsDate(TBFDili.Text) Then
            myInsertQueryx += " ,'" + DDLDili.Text + "' "
            myInsertQueryx += " ,convert(datetime,'" + TBFDili.Text + "',103) "
        Else
            myInsertQueryx += " ,NULL "
            myInsertQueryx += " ,NULL "
        End If
        '---diligencia fin
        myInsertQueryx += " ,'" + TBCControl.Text + "' "
        myInsertQueryx += " ,'" + Request.UserHostAddress + "' "
        myInsertQueryx += " ,getdate() "
        myInsertQueryx += " ," + Session.Item("SIRECAid").ToString + " "
            myInsertQueryx += " WHERE not exists(select offv.off_subdel from [sirecaemisiones].[dbo].[OF_FACTURAS] as offv "
        myInsertQueryx += " where offv.OFF_SUBDEL='" + DDLSubdel.SelectedValue + "' "
        myInsertQueryx += " and offv.OFF_REGPAT='" + TBRegPat.Text + "' "
        myInsertQueryx += " and offv.OFF_CREDITO='" + TBCredito.Text + "' "
        myInsertQueryx += " and offv.OFF_CIFRA_CONTROL='" + TBCControl.Text + "' "
            myInsertQueryx += " and offv.OFF_TD='" + DDLTipoDoc.SelectedValue + "' ) "
        cmdx.CommandText = myInsertQueryx
        conx.Open()
        cmdx.ExecuteNonQuery()
        conx.Close()
        If IsDate(TBFDili.Text) Then
                addHistDili(getidfactura())
            End If
        Catch ex As Exception
            LMesg.Text = ex.StackTrace
        End Try
    End Sub
    Private Function getidfactura()

        Dim idfactura As String = "0"
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textCon As String = " select top 1 [OFF_ID] from [sirecaemisiones].[dbo].[OF_FACTURAS] "
        textCon += " where OFF_SUBDEL='" + DDLSubdel.SelectedValue + "' "
        textCon += " and OFF_REGPAT='" + TBRegPat.Text + "' "
        textCon += " and OFF_CREDITO='" + TBCredito.Text + "' "
        textCon += " and OFF_CIFRA_CONTROL='" + TBCControl.Text + "' "
        textCon += " and OFF_TD='" + DDLTipoDoc.SelectedValue + "' "

        catCMD.CommandText = textCon
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Do While myReader.Read()
            If IsNumeric(myReader.GetValue(0).ToString) Then
                idfactura = myReader.GetValue(0).ToString
            End If
        Loop
        myReader.Close()
        nwindConn.Close()
        Return idfactura
    End Function

    Private Sub addHistDili(ByVal idfactura As String)
        Dim conx As New OleDbConnection(cadenaconexion)
        Dim cmdx As New OleDbCommand()
        cmdx.Connection = conx
        Dim myInsertQueryx As String = " INSERT INTO [sirecaemisiones].[dbo].[OF_DILILIGENCIAS] "
        myInsertQueryx += " SELECT [OFD_OFF_ID] =" + idfactura
        myInsertQueryx += " ," + DDLInspector.SelectedValue + " "
        myInsertQueryx += " ,'" + DDLSubdel.SelectedValue + "' "
        myInsertQueryx += " ,'" + DDLDili.Text + "' "
        myInsertQueryx += " ,convert(datetime,'" + TBFDili.Text + "',103) "
        myInsertQueryx += " ,'" + Request.UserHostAddress + "' "
        myInsertQueryx += " ,getdate() "
        myInsertQueryx += " WHERE not exists(SELECT dili.[OFD_ID] "
        myInsertQueryx += " FROM [sirecaemisiones].[dbo].[OF_DILILIGENCIAS] as dili "
        myInsertQueryx += " where dili.[OFD_ID_INSPECTOR]= " + DDLInspector.SelectedValue
        myInsertQueryx += " and dili.[OFD_DILIGENCIA]= '" + DDLDili.SelectedValue + "'"
        myInsertQueryx += " and convert(varchar(10),dili.[OFD_FECH_DILIGENCIA],103)= '" + TBFDili.Text + "'"
        myInsertQueryx += " and dili.[OFD_OFF_ID]= " + idfactura
        myInsertQueryx += " ) "

        cmdx.CommandText = myInsertQueryx
        conx.Open()
        cmdx.ExecuteNonQuery()
        conx.Close()
    End Sub
End Class
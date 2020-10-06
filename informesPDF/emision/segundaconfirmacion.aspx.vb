Imports System.Data.OleDb

Public Class segundaconfirmacion
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
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

    Protected Sub GridViewAValidar2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewAValidar2.PreRender
        GridViewAValidar2.Caption = "<strong>" & GridViewAValidar2.Rows.Count.ToString("N0") & " RESULTADOS</strong>"
    End Sub

    Protected Sub LBguardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim lb As String = CType(sender, LinkButton).CommandArgument
        Dim vidRowsGrid As String = lb.Split("-").GetValue(0).ToString
        Dim vid As String = lb.Split("-").GetValue(1).ToString
        If CType(GridViewAValidar2.Rows(vidRowsGrid).Cells(15).FindControl("DDLIncF"), DropDownList).SelectedValue().Equals("C") Then
            If CType(GridViewAValidar2.Rows(vidRowsGrid).Cells(15).FindControl("TBObserv"), TextBox).Text().Length > 3 Then
                validacionP2(vid)
                incFinalCapturar(vidRowsGrid, vid)
                GridViewAValidar2.DataBind()
            Else
                Response.Write("<h2><font style='color:#F00'>Escriba Observacion del por que es: " & CType(GridViewAValidar2.Rows(vidRowsGrid).Cells(15).FindControl("DDLIncF"), DropDownList).SelectedItem.Text & "</font></h2>")
                'CType(GridViewAValidar2.Rows(vidRowsGrid).Cells(15).FindControl("LMesage"), Label).Text = "Escriba Observacion del por que la " & CType(GridViewAValidar2.Rows(vidRowsGrid).Cells(15).FindControl("DDLIncF"), DropDownList).SelectedItem.Text
            End If
        Else
            validacionP2(vid)
            incFinalCapturar(vidRowsGrid, vid)
            GridViewAValidar2.DataBind()
        End If
    End Sub

    Private Sub validacionP2(ByVal vid As String)
        Try
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " UPDATE [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " SET [V_IP_P2]='" & Request.UserHostAddress & "' "
            myInsertQuery22 += " ,[V_CONFIRMO_INC_P2]='" & "1" & "' "
            myInsertQuery22 += " ,[V_FECHA_CONFIRMACION_INC_P2]=getdate() "
            myInsertQuery22 += " FROM [sirecaemisiones].[dbo].[eco] "
            myInsertQuery22 += " WHERE [V_ID]=" & vid & " --and V_FOLIO_P1_TURNADO_A='" & Session.Item("SIRECAid").ToString & "' "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub

    Private Sub incFinalCapturar(ByVal vRowGrid As String, ByVal vid As String)
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " INSERT INTO [sirecaemisiones].[dbo].[hist_inc_emision] "
        textConmand += " SELECT  "
        textConmand += " [V_REGPAT] "
        textConmand += " ,[V_CREDITO] "
        textConmand += " ,[V_PERIODO] "
        textConmand += " ,'" & CType(GridViewAValidar2.Rows(vRowGrid).Cells(15).FindControl("DDLIncF"), DropDownList).SelectedValue & "' as INC "
        textConmand += " ,'" & CType(GridViewAValidar2.Rows(vRowGrid).Cells(15).FindControl("TBObserv"), TextBox).Text & "' as OBSERVACION "
        textConmand += " ,[V_FOLIO_P1] "
        textConmand += " ,[V_FOLIO_P2] "
        textConmand += " ,'" & Request.UserHostAddress & "' as IP "
        textConmand += " ,getdate() "
        textConmand += " FROM [sirecaemisiones].[dbo].[eco] "
        textConmand += " WHERE V_ID=" & vid & " "
        textConmand += " --and V_FOLIO_P1_TURNADO_A='" & Session.Item("SIRECAid").ToString & "' "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

    Protected Sub LBPrint_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles LBPrint.PreRender
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" & Request.Url.AbsoluteUri.ToString.Replace("default.aspx", "verificados.aspx?") & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=700');")
    End Sub
End Class
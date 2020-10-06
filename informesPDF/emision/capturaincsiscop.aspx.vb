Imports System.Data.OleDb

Public Class capturaincsiscop
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
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

    Protected Sub TBFechIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechIni.Init
        TBFechIni.Text = Now.ToShortDateString
    End Sub
    Protected Sub agregarFolioR(ByVal v_id As String, ByVal v_inc As String)
        Try
            Dim vtipo As String = DDLTipo.SelectedValue.ToString
            Dim conx As New OleDbConnection(cadenaconexion)
            Dim cmdx As New OleDbCommand()
            cmdx.Connection = conx

            Dim myInsertQueryx As String = " UPDATE [sirecaemisiones].[dbo].[" + vtipo + "] "
            myInsertQueryx += " SET [V_IP_P2]= '" + Request.UserHostAddress + "'"
            myInsertQueryx += " ,[V_CONFIRMO_INC_P2]= '" + Session.Item("SIRECAid").ToString + "'"
            myInsertQueryx += " ,[V_FECHA_CONFIRMACION_INC_P2]=getdate() "
            myInsertQueryx += " ,[V_FOLIO_P2]='R'+[V_FOLIO_P1] "
            myInsertQueryx += " ,[V_FOLIO_P2_TURNADO_A]='" + v_inc + "' " ' incidencia con la que se turno a captura a SISCOB
            myInsertQueryx += " ,[V_FECHA_P2_TURNADO]=convert(datetime,'" + TBFechIni.Text + "') " ' Fecha con la que se va a capturar en SISCOB
            myInsertQueryx += " FROM [sirecaemisiones].[dbo].[" + vtipo + "] where V_SUBDEL='" + DDLSubdel.SelectedValue + "' and [V_FOLIO_P1]='" + TBFolio.Text + "' and [V_INC_CAPTURA]='" + DDLInc.SelectedValue + "' "
            myInsertQueryx += " and year([V_FECHA_P1_TURNADO])='" + DDLAnio.SelectedValue + "' and V_ID='" + v_id + "' "

            cmdx.CommandText = myInsertQueryx
            conx.Open()
            cmdx.ExecuteNonQuery()
            conx.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBCedCaptura_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCedCaptura.Click
        For i As Int32 = 0 To (GridViewDatos.Rows.Count - 1)
            If CType(GridViewDatos.Rows(i).Cells(10).FindControl("CBAgregar"), CheckBox).Checked Then
                agregarFolioR(CType(GridViewDatos.Rows(i).Cells(10).FindControl("HFId"), HiddenField).Value, CType(GridViewDatos.Rows(i).Cells(9).FindControl("TBInc"), TextBox).Text)
            End If
        Next
        Response.Redirect("~\informesPDF\emision\ceduladecapturaregistro.aspx?vsubdel=" + DDLSubdel.SelectedValue + "&folio=" + TBFolio.Text + "&vinc=" + DDLInc.SelectedValue + "&anio=" + DDLAnio.SelectedValue + "&vfechacaptura=" + TBFechIni.Text + "&export=PDF&eco=" + DDLTipo.SelectedValue.ToString)
    End Sub
End Class
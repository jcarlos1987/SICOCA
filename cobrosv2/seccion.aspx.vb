Imports System.Data.OleDb

Public Class seccion
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
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
            'If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            '    If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
            '        DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
            '    End If
            'End If
        End If
    End Sub

    Protected Sub LBguardarCanInc34_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' inc 34 ACTUALIZAR
        Dim vid As String = CType(sender, LinkButton).CommandArgument.ToString.Split("-").GetValue(0).ToString
        Dim fila As Int32 = CInt(CType(sender, LinkButton).CommandArgument.ToString.Split("-").GetValue(1))
        Dim vfecha1 As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFech341"), TextBox).Text
        Dim vfecha2 As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFech342"), TextBox).Text
        Dim vfecha3 As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFech343"), TextBox).Text
        Dim vfecha4 As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFech344"), TextBox).Text
        '---------------------------------------------------------------------------------------------------------------------
        Dim TBFolioOfiSoli As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFolioOfiSoli"), TextBox).Text
        If TBFolioOfiSoli.Length > 0 Then
            setUpdateCaso(vid, " [F25_FOLIO_SOLI]='" + TBFolioOfiSoli + "' ")
        End If
        Dim TBFechaNumFicha As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFechaNumFicha"), TextBox).Text
        If IsDate(TBFechaNumFicha) Then
            setUpdateCaso(vid, " [F25_FECHA_SOLI]=convert(datetime,'" + TBFechaNumFicha + "',103) ")
        End If
        Dim TBNumFicha As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBNumFicha"), TextBox).Text
        If TBNumFicha.Length > 0 Then
            setUpdateCaso(vid, " [F25_FICHA_SOLI]='" + TBNumFicha + "' ")
        End If
        Dim TBFolioLibGravamen As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFolioLibGravamen"), TextBox).Text
        If TBFolioLibGravamen.Length > 0 Then
            setUpdateCaso(vid, " [F25_FOLIO_GRAVAMEN]='" + TBFolioLibGravamen + "' ")
        End If
        Dim TBFechaLibGravamen As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFechaLibGravamen"), TextBox).Text
        If IsDate(TBFechaLibGravamen) Then
            setUpdateCaso(vid, " [F25_FECHA_GRAVAMEN]=convert(datetime,'" + TBFechaLibGravamen + "',103) ")
        End If
        Dim TBFolioAproRemaJuri As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFolioAproRemaJuri"), TextBox).Text
        If TBFolioAproRemaJuri.Length > 0 Then
            setUpdateCaso(vid, " [F25_OFICINA_REMATE]='" + TBFolioAproRemaJuri + "' ")
        End If
        Dim TBFechaAproRemaJuri As String = CType(GridView3.Rows(fila).Cells(15).FindControl("TBFechaAproRemaJuri"), TextBox).Text
        If IsDate(TBFechaAproRemaJuri) Then
            setUpdateCaso(vid, " [F25_FECHA_REMATE]=convert(datetime,'" + TBFechaAproRemaJuri + "',103) ")
        End If
        '---------------------------------------------------------------------------------------------------------------------
        If IsDate(vfecha1) Then
            setUpdateCaso(vid, " [FI25_FECH_TURNA_REMAT]=convert(datetime,'" + vfecha1 + "',103) ")
        End If
        If IsDate(vfecha2) Then
            setUpdateCaso(vid, " [F25_FECH_SOLI_AVALUO]=convert(datetime,'" + vfecha2 + "',103) ")
        End If
        If IsDate(vfecha3) Then
            setUpdateCaso(vid, " [F25_FECH_NOTI_AVALUO]=convert(datetime,'" + vfecha3 + "',103) ")
        End If
        If IsDate(vfecha4) Then
            setUpdateCaso(vid, " [F25_FECH_SUBE_REMAT]=convert(datetime,'" + vfecha4 + "',103) ")
        End If
        GridView3.DataBind()
    End Sub
    Private Sub setUpdateCaso(ByVal vid As String, ByVal datoActulaizar As String)
        'Funcion para cerrar el caso, para indicar al sistema que se a concluido
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " UPDATE [sirecacobros].[dbo].[PAE_FECHAS] "
        textConmand += " SET " + datoActulaizar
        textConmand += " WHERE [FI_ID]=" + vid
        catCMD.CommandText = textConmand
        nwindConn.Open()
        catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

    Protected Sub LBguardarCanInc35_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' inc 35 ACTUALIZAR
        Dim vid As String = CType(sender, LinkButton).CommandArgument.ToString.Split("-").GetValue(0).ToString
        Dim fila As Int32 = CInt(CType(sender, LinkButton).CommandArgument.ToString.Split("-").GetValue(1))
        Dim vfecha1 As String = CType(GridView4.Rows(fila).Cells(6).FindControl("TBFech351"), TextBox).Text
        Dim vfecha2 As String = CType(GridView4.Rows(fila).Cells(6).FindControl("TBFech352"), TextBox).Text
        Dim vfecha3 As String = CType(GridView4.Rows(fila).Cells(6).FindControl("TBFech353"), TextBox).Text
        If IsDate(vfecha1) Then
            setUpdateCaso(vid, " [F11_FECH_NOM_INTERV]=convert(datetime,'" + vfecha1 + "',103) ")
        End If
        If IsDate(vfecha2) Then
            setUpdateCaso(vid, " [F11_FECH_NOTI_INTERV]=convert(datetime,'" + vfecha2 + "',103) ")
        End If
        If IsDate(vfecha3) Then
            setUpdateCaso(vid, " [F11_FECH_SEG_INTERV]=convert(datetime,'" + vfecha3 + "',103) ")
        End If
        GridView4.DataBind()
    End Sub

    Protected Sub LBguardarCanInc43_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' inc 43 ACTUALIZAR
        Dim vid As String = CType(sender, LinkButton).CommandArgument.ToString.Split("-").GetValue(0).ToString
        Dim fila As Int32 = CInt(CType(sender, LinkButton).CommandArgument.ToString.Split("-").GetValue(1))
        '--------------------------------------------------------------------------------------------------------------
        Dim TBFolioSiara As String = CType(GridView2.Rows(fila).Cells(7).FindControl("TBFolioSiara"), TextBox).Text
        If TBFolioSiara.Length > 0 Then
            setUpdateCaso(vid, " [F8_FOLIO_SIARA]='" + TBFolioSiara + "' ")
        End If
        Dim TBFechaSiara As String = CType(GridView2.Rows(fila).Cells(7).FindControl("TBFechaSiara"), TextBox).Text
        If IsDate(TBFechaSiara) Then
            setUpdateCaso(vid, " [F8_FECHA_SIARA]=convert(datetime,'" + TBFechaSiara + "',103) ")
        End If
        Dim TBFolioBancario As String = CType(GridView2.Rows(fila).Cells(7).FindControl("TBFolioBancario"), TextBox).Text
        If TBFolioBancario.Length > 0 Then
            setUpdateCaso(vid, " [F8_FOLIO_BANCARIO]='" + TBFolioBancario + "' ")
        End If
        Dim TBFechaBancario As String = CType(GridView2.Rows(fila).Cells(7).FindControl("TBFechaBancario"), TextBox).Text
        If IsDate(TBFechaBancario) Then
            setUpdateCaso(vid, " [F8_FECHA_BANCARIO]=convert(datetime,'" + TBFechaBancario + "',103) ")
        End If
        '--------------------------------------------------------------------------------------------------------------
    End Sub
End Class
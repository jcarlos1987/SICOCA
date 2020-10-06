Imports System.IO
Imports System.Data.OleDb
Imports Ionic.Zip

Public Class _Default29
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

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - 2000)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        Dim totalImporte As Double = 0
        For i As Int32 = 0 To (GridView2.Rows.Count - 1)
            totalImporte += Convert.ToDouble(GridView2.Rows(i).Cells(8).Text.Replace("$", "").Replace(",", ""))
        Next
        GridView2.Caption = "<strong>" & GridView2.Rows.Count & " RESULTADOS, IMPORTE: " + String.Format(New Globalization.CultureInfo("es-MX"), "{0:C}", totalImporte) + "</strong>"
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        GridView3.Caption = "<strong>" & GridView3.Rows.Count & " RESULTADOS</strong>"
    End Sub

    Protected Sub DDLInc_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInc.PreRender
        If DDLInc.Items.Contains(New ListItem("TODOS", "%")) Then
        Else
            DDLInc.Items.Add(New ListItem("TODOS", "%"))
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        GridView2.DataBind()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        Wizard1.DataBind()
    End Sub

    Protected Sub BDesSinPago_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BDesSinPago.Click
        Try
            Dim con22 As New System.Data.OleDb.OleDbConnection(cadenaconexion)
            Dim cmd22 As New System.Data.OleDb.OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = "" _
            & " exec xp_cmdshell ' bcp "" SELECT ''SUBDEL'',''RAG_PATRONAL'',''RAZON_SOCIAL'',''CREDITO'',''COTIZANTES'',''EMISION'',''MULTA'',''PERIODO'',''INSPECTOR'',''TIPO'',''INCIDENCIA'',''SECTOR'',''VALIDACION'',''INC_RALE'',''TD_RALE'' " _
            & " union all " _
            & " SELECT [subdel] as SUBDEL " _
            & " ,[REG#PATRONAL] as REG_PATRONAL " _
            & " ,[NOMBRE O RAZON SOCIAL] as RAZON_SOCIAL " _
            & " ,[CREDITO] as CREDITO " _
            & " ,convert(varchar,[COTIZ]) as COTIZANTES " _
            & " ,convert(varchar,[OMISION]) as EMISION " _
            & " ,convert(varchar,[MULTA]) as MULTA " _
            & " ,(case when len([fechaEco])=5 then ''0''+(substring(convert(varchar,[fechaEco]),1,1)+''/''+substring(convert(varchar,[fechaEco]),2,4)) else (substring(convert(varchar,[fechaEco]),1,2)+''/''+substring(convert(varchar,[fechaEco]),3,4)) end) as PERIODO " _
            & " ,(select upper(nombre) from fiscamovil.dbo.usuarios where [id]=[responsable]) as INSPECTOR " _
            & " ,[tipoECO] as TIPO " _
            & " ,[incidencia] as INCIDENCIA " _
            & " ,[sector] as SECTOR " _
            & " ,[validacion] as VALIDACION " _
            & " ,[incidenciarale] as INC_RALE " _
            & " ,[tdrale] as TD_RALE " _
            & " FROM [sireca].[dbo].[eco] " _
            & " where validacion = ''SIN PAGO'' " _
            & " and fechaeco=''" + DDLMes.SelectedValue + DDLAnio.SelectedValue + "'' " _
            & " and subdel=''" + DDLSubdel.SelectedValue + "'' " _
            & " and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') "" queryout """ + Server.MapPath("~/descargas/sinpago/") + Session.Item("SIRECAid").ToString + DDLSubdel.SelectedValue + "." + DDLMes.SelectedValue + "_" + DDLAnio.SelectedValue + ".csv"" -T -c -C -q -t""\"",\"""" -r""\""\n"" ' "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            '-----------------
            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=" + Session.Item("SIRECAid").ToString + DDLSubdel.SelectedValue + "." + DDLMes.SelectedValue + "_" + DDLAnio.SelectedValue + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(Server.MapPath("~/descargas/sinpago/") + Session.Item("SIRECAid").ToString + DDLSubdel.SelectedValue + "." + DDLMes.SelectedValue + "_" + DDLAnio.SelectedValue + ".csv", "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~/descargas/sinpago/") +"descarga.zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'MsgBox(ex.Message & " _ " & ex.StackTrace)
        End Try
    End Sub
End Class
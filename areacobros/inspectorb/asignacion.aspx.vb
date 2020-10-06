Imports System.Globalization
Imports System.Data.OleDb

Public Class asignacion1
    Inherits System.Web.UI.Page
    Dim fechaGlobal As String = ""
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

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -1, Now)))
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        GridView2.Caption = "<strong>" & GridView2.Rows.Count & " Inspectores B</strong>"
    End Sub

    Protected Sub GridView7_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView7.PreRender
        Dim totalImporte As Double = 0
        For i As Int32 = 0 To (GridView2.Rows.Count - 1)
            totalImporte += Convert.ToDouble(GridView7.Rows(i).Cells(2).Text.Replace("$", "").Replace(",", ""))
        Next
        GridView7.Caption = "<strong>" & GridView7.Rows.Count & " Patrones, IMPORTE: " + String.Format(New CultureInfo("es-MX"), "{0:C}", totalImporte) + "</strong>"
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            'Asignacion de casos
            'If IsNothing(TBFecha.Text.Replace(" ", "")) Then
            'Else

            If IsDate(TBFecha.Text) Then
                fechaGlobal = TBFecha.Text
                Dim longitud As Int32 = (GridView2.Rows.Count - 1)
                Dim datos As String = ""

                For i As Int16 = 0 To (longitud)
                    'GridView2.Rows(i).Cells(9).Visible = True
                    Dim idUser As String = GridView2.Rows(i).Cells(9).Text
                    Dim casosMaximos As Int32 = GridView2.Rows(i).Cells(7).Text                    
                    datos += idUser & "_" & casosMaximos & "="
                    'GridView2.Rows(i).Cells(9).Visible = False
                Next
                Dim dato As String() = datos.Split("=")
                For i As Int16 = 0 To (dato.Length - 2)
                    Dim valor As String() = dato(i).Split("_")
                    asignarCobro(valor(0), valor(0), Convert.ToInt32(valor(1)))
                    'MsgBox(valor(0) & "," & valor(0) & "," & Convert.ToInt32(valor(1)) & "," & valor(2))
                Next
                GridView2.DataBind()
                GridView7.DataBind()
            End If
            'End If
        Catch ex As Exception
            MsgBox(ex.StackTrace)
        End Try
    End Sub
    Protected Sub asignarCobro(ByVal valorNombre As String, ByVal valorUser As String, ByVal facturasMax As Int32)
        'busqueda--------------------------------------------------------------------
        Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textCon As String = "SELECT substring(eco.REG#PATRONAL,1,2) as cv,eco.REG#PATRONAL,eco.tipoECO,eco.COTIZ ,eco.id,ptn.lng,ptn.lat,eco.sector,ptn.ordenAsignacion,ptn.loc,ptn.dom,eco.omision  "
        textCon += " ,substring(ptn.loc,1,6) as muni "
        textCon += " ,substring(ptn.loc,len(ptn.loc)-5,6) as cp "
        textCon += " FROM [sirecacobros].[dbo].[eco] AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) "
        textCon += " WHERE "
        textCon += " eco.subdel = '" & DDLSubdel.SelectedValue.ToString & "' AND eco.cambiarIncidencia='9' AND eco.incidencia is null "
        textCon += " order by cv,muni,cp,ptn.dom,ptn.lng,ptn.lat"
        catCMD.CommandText = textCon
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vid As String = ""
        Dim cont As Int32 = 0
        Dim facturasExistentes As Int32 = 0
        Do While myReader.Read()
            vid = myReader.GetValue(4)
            cont = cantidadCasos(valorUser)
            facturasExistentes = casosExistente()
            If ((cont < facturasMax) And (facturasExistentes > 0)) Then
                cont += 1
                Dim con As New OleDbConnection(cadenaconexion)
                Dim cmd As New OleDbCommand()
                cmd.Connection = con

                Dim myInsertQuery As String = "update [sirecacobros].[dbo].[eco] set [nomResponsable]=?,[cambiarIncidencia]=?,[responsable] = ? ,[fechaSeleccion] = ?,[diasDisponibles]=?, [grado1]=?, [grado2]=? WHERE [id]=?"
                cmd.CommandText = myInsertQuery

                cmd.Parameters.Add("@nomResponsable", OleDbType.VarChar).Value = valorNombre
                cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
                cmd.Parameters.Add("@responsable", OleDbType.VarChar).Value = valorUser
                cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Convert.ToDateTime(fechaGlobal)
                cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
                cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "6666"
                cmd.Parameters.Add("@grado2", OleDbType.VarChar).Value = "SIN ATENDER"
                cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToInt32(vid)
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            Else
                cont = cantidadCasos(valorUser)
                'facturasExistentes = casosExistente(sectores)
                If cont = facturasMax Then
                    Exit Do
                    'Else
                    '   If facturasMax < facturasExistentes Then
                    'asignarCobro(valorNombre, valorUser, facturasMax, sectores)
                    'Else
                    'Exit Do
                    'End If

                End If

            End If
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()

        'GridView2.DataBind()
    End Sub

    Function casosExistente() As Int32
        Dim facturasExistentes As Int32 = 0
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textCon As String = "SELECT  COUNT (*) "
            textCon += " FROM [sirecacobros].[dbo].[eco] AS eco "
            textCon += " WHERE "
            textCon += " (eco.subdel = '" & DDLSubdel.SelectedValue.ToString & "') AND (eco.cambiarIncidencia = '9') AND (eco.incidencia is null) "
            catCMD.CommandText = textCon
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                If IsNumeric(myReader.GetValue(0)) Then
                    facturasExistentes = Convert.ToInt32(myReader.GetValue(0))
                Else
                    facturasExistentes = 0
                End If

            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception
            MsgBox(ex.StackTrace)
        End Try
        Return facturasExistentes
    End Function
    Function cantidadCasos(ByVal valorUser As String) As Int32
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = "SELECT eco.responsable, COUNT (DISTINCT(eco.REG#PATRONAL )) as total"
        textConx += " FROM [sirecacobros].[dbo].[eco] as eco "
        textConx += " where (eco.responsable = '" & valorUser & "')"
        textConx += " AND eco.cambiarIncidencia not in ('9') AND year(eco.fechaSeleccion) = year(convert(datetime,'" & fechaGlobal & "',103)) AND month(eco.fechaSeleccion) = month(convert(datetime,'" & fechaGlobal & "',103)) AND day(eco.fechaSeleccion) = day(convert(datetime,'" & fechaGlobal & "',103)) "
        textConx += " GROUP BY eco.responsable"
        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim cantidadx As Integer = 0
        Do While myReaderx.Read()
            If IsNumeric(myReaderx.GetValue(1)) Then
                cantidadx = Convert.ToInt32(myReaderx.GetValue(1))
            Else
                cantidadx = 0
            End If
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return cantidadx
    End Function
End Class